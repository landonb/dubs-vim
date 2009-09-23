
To make an executable installer for Windows, follow
these instructions.

Download and install NSIS, Nullsoft's free Scriptable 
Install System

  http://nsis.sourceforge.net/

(Remember Nullsoft? From back when? I.e., from back 
when WinAmp was cool? Well, NSIS is pretty alright. =) 
In fact, it's pretty better than alright! It's 
downright wicked fast! I've only tried Caphyon's 
Advanced Installer otherwise -- which has a pretty 
GUI but takes forever on install -- and then there's 
Microsoft's Wix (http://wix.sourceforge.net/) and a 
slew of other solutions (see this wiki article: 
http://en.wikipedia.org/wiki/List_of_installation_software)
but NSIS so far does the trick and it's easy to use).

Next, Download and install Cygwin (which installs Ruby)

  http://cygwin.com/

Open a Cygwin shell and install the rio and rubyzip
gems

  gem install rio
  gem install rubyzip

Open a Windows command shell and change to the dubsacks 
Windows installation directory

  E.g., F:\_retros\Dubsacks\dubsacks\install\windows

Finally, run the ruby make script

  ruby make.rb

The make script downloads the Vim runtime and gVim 
executable files from vim.org, unpacks them, creates 
the dubsacks configuration structure, and makes the 
Windows installer using NSIS. See make.rb for more 
details on each of these steps

See technicat.nsh for more about the NSIS process -- 
it's a wrapper script I found online, since Nullsoft 
doesn't include much in the way of templates. And then 
there's dubsacks.nsi and dubsacks-components.nsh, 
which describe the actual dubsacks installer executable 
that NSIS makes.

