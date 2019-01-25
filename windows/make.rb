
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

require 'rubygems'
require 'rio'
require 'pathname'
require 'zip/zip'
require 'open3'

##########

class OptparseDubsVim

  #
  # Return a structure describing the options.
  #
  def self.parse(args)

    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    # Windows executables
    #   http://www.vim.org/download.php#pc
    options.uri_vim_runtime = "ftp://ftp.vim.org/pub/vim/pc/vim72rt.zip"
    options.uri_gvim_exe = "ftp://ftp.vim.org/pub/vim/pc/gvim72.zip"
    options.cleanup_after = false
    options.install_silently = false
    options.skip_downloads = false
    options.skip_build = false

    opts = OptionParser.new do |opts|

      opts.banner = "Usage: " + File::basename($0) + " [options]"

      opts.separator " "
      opts.separator "Options: "

      # Runtime files
      opts.on("-r", "--runtime URI",
              "The location of the Vim runtime",
              " " + options.uri_vim_runtime) do |uri|
        options.uri_vim_runtime = uri
      end

      # GUI Executable
      opts.on("-e", "--executable URI",
              "The location of the gVim executable",
              " " + options.uri_gvim_exe) do |uri|
        options.uri_gvim_exe = uri
      end

      # Cleanup (remove) downloaded files when done
      opts.on("-c", "--cleanup",
              "Cleanup downloaded files when done") do
        options.cleanup_after = true
      end

      # Cleanup (remove) downloaded files when done
      opts.on("-s", "--silent",
              "Install silently") do
        options.install_silently = true
      end

      # Skip the download (even if the files already exist
      # it still takes time to check they're all there)
      opts.on("-D", "--skip-download",
              "Skips downloading the Vim zips (if you ",
              " know they're already in the staging area)") do
        options.skip_downloads = true
      end

      # Skip the build (so you can run --cleanup easily)
      opts.on("-B", "--skip-build",
              "Skips the build (so you can cleanup ",
              " without building)") do
        options.skip_build = true
      end

      opts.separator " "
      opts.separator "Common options: "

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail("-v", "--version", "Show version") do
        puts OptionParser::Version.join('.')
        exit
      end
    end

    opts.parse!(args)
    options
  end # parse()

end # class OptparseDubsVim

##########

class DubsVimMsiBuilder

  def self.make(options)

    @opts = options

    # TODO Rather than always checking silently, how
    #      about using a file handle like STDOUT or /dev/null
    unless @opts.install_silently
      print "\n"
    end

    prepare_dir_paths

    unless @opts.skip_build

      prepare_staging_area

      unless @opts.skip_downloads

        download_gvim

      end

      unpack_downloads

      prepare_vimfiles

      create_installer

    end

    destroy_staging_area

  end # make()

  def self.prepare_dir_paths

    @staging_dir = File.join(File::dirname($0), "_staging.tmp")
    @dest_vim_runtime = File.join(@staging_dir, File::basename(@opts.uri_vim_runtime))
    @dest_gvim_exe = File.join(@staging_dir, File::basename(@opts.uri_gvim_exe))

    #@vimfiles_user = "vimfiles_dubsvim"
    #@vimfiles_appl = "vimfiles_gvim"

  end # prepare_dir_paths()

  def self.prepare_staging_area

    # Seriously, clean up first
    if File.directory?(@staging_dir)
      # TODO Not very DRY
      begin
        FileUtils.rm_r File.join(@staging_dir, "vimfiles_dubsvim")
      rescue Errno::ENOENT
        # whocares?
      end
      begin
        FileUtils.rm_r File.join(@staging_dir, "vimfiles_gvim")
      rescue Errno::ENOENT
        # whocares? doesn't exist!
      end
    end

    unless File.directory?(@staging_dir)
      unless @opts.install_silently
        print "Creating staging area at " + @staging_dir + "\n\n"
      end
      FileUtils.mkdir @staging_dir
    end

  end # prepare_staging_area()

  def self.destroy_staging_area

    if @opts.cleanup_after
      unless @opts.install_silently
        print "Removing staging area at " + @staging_dir + "\n\n"
      end
      FileUtils.rm_r @staging_dir #, :force => true
    end

  end # destroy_staging_area()

  def self.download_gvim

    unless File.exists?(@dest_vim_runtime)
      download_from_uri "Vim runtime files", @opts.uri_vim_runtime, @dest_vim_runtime
    end

    unless File.exists?(@dest_gvim_exe)
      download_from_uri "Vim executable files", @opts.uri_gvim_exe, @dest_gvim_exe
    end

  end # download_gvim()

  def self.download_from_uri(dsc, src, dst)

    unless @opts.install_silently
      print "Downloading " + dsc + "\n from " + src + "\n to " + dst + "\n\n"
    end

    # open an URI and copy the content into a file
    rio(src) > rio(dst)

    # TODO What about checking files' md5 signatures?

    # Other ways to do the same:

    # h = Net::HTTP.new('www.sinfest.net', 80)
    # resp, data = h.get('/comics/sf20031107.gif', nil)
    # if resp.message == "OK"
    # File.open("sinfest.gif", "wb+") do |f|
    # f << data
    # end
    # end

    # Net::HTTP.start("clinicaltrials.gov") do |http|
    #   resp = http.get("/ct2/results/download?id=15002A")
    #   open("C:\\search_result.zip", "wb") do |file|
    #     file.write(resp.body)
    #   end

    # Check first that our resource exists
    # Net::HTTP::Head

    # require 'open-uri'
    # resource = open('http://google.com')
    # resource.read( 5120 ) # reads first 5120 characters

  end # download_from_uri()

  def self.unpack_downloads

    unpack_download @dest_vim_runtime
    unpack_download @dest_gvim_exe

    # The archives are unpacked to _staging.tmp/vim
    # but we need 'em to be _staging.tmp/vimfiles_gvim
    vim_dir = File.join(@staging_dir, "vim")
    gvim_dir = File.join(@staging_dir, "vimfiles_gvim")
    FileUtils.mv vim_dir, gvim_dir, :force => true

  end # unpack_downloads()

  def self.unpack_download(zip_path)

    unless @opts.install_silently
      print "Unpacking download file " + zip_path + "\n"
    end

    zip_dir = Pathname.new(@staging_dir)

    Zip::ZipFile.open(zip_path) do |zf|
      zf.each do |e|
        if (m = /^(.*)[\\\/][^\\\/]*$/.match(e.name))
          zip_dir.join(m[1]).mkpath
        end
        dst_file = File.join(zip_dir.to_s, e.name)
        unless File.exists?(dst_file)
          zf.extract(e.name, dst_file)
        else
          unless @opts.install_silently
            # The following is verby verbose:
            #print "  Skipping existing file: " + e.name + "\n"
          end
        end
      end
    end

    unless @opts.install_silently
      print "\n"
    end

  end # unpack_download()

  def self.prepare_vimfiles

    vimfiles_dubsvim = "../../vimfiles_dubsvim"
    # TODO Pathname's .join not working?
    #user_dir = Pathname.new(@staging_dir)
    #user_dir.join("vimfiles_dubsvim") # "vimfiles_dubsvim" is also in the .nsi file
    user_dir = File.join(@staging_dir, "vimfiles_dubsvim")
    copy_dir_to_staging("user vimfiles", vimfiles_dubsvim, user_dir)

    vimfiles_gvim = "../../vimfiles_gvim"
    gvim_dir = File.join(@staging_dir, "vimfiles_gvim")
    copy_dir_to_staging("application vimfiles", vimfiles_gvim, @staging_dir)

  end # prepare_vimfiles()

  def self.copy_dir_to_staging(dsc, src, dst)

    unless @opts.install_silently
      print "Copying #{dsc} (#{src}) to staging area (#{dst}).\n\n"
    end

    rio("#{src}") >> rio(dst)

  end # copy_dir_to_staging()

  def self.create_installer

    cmd = "\"C:/Program Files/NSIS/makensis.exe\" dubsvim.nsi"

    unless @opts.install_silently
      print "Calling NSIS builder (#{cmd}).\n\n"
    end

    f = IO.popen(cmd)
    puts f.readlines # p prints an array as ["an", "array"]
                     # puts prints one array element to a line

    # That was the non-block form; this is the block form
    # TODO This doesn't print out to the console-
    #        so how would you do that?
    #[stdin, stdout, stderr] = Open3.popen3(cmd)
    #Open3.popen3(cmd) { |stdin, stdout, stderr| }

  end # create_installer()

end # class DubsVimMsiBuilder

##########

#debugger

options = OptparseDubsVim.parse(ARGV)
#pp options

DubsVimMsiBuilder.make(options)

##########
##########

