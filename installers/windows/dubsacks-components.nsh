
Var assoc_cmds_bat_file_inst
Var assoc_cmds_bat_file_uninst

Function InitAssocBat
  StrCpy $assoc_cmds_bat_file_inst "assoc_cmds_inst.bat"
  StrCpy $assoc_cmds_bat_file_uninst "assoc_cmds_uninst.bat"
FunctionEnd

Function un.InitAssocBat
  StrCpy $assoc_cmds_bat_file_inst "assoc_cmds_inst.bat"
  StrCpy $assoc_cmds_bat_file_uninst "assoc_cmds_uninst.bat"
FunctionEnd

## INSTALLATION

Section "Windows gVim 32-bit"

  # install gVim to C:\Program Files or C:\Program Files (x86)
  setOutPath $INSTDIR

  File /r .\_staging.tmp3\vimfiles_gvim\*.*

SectionEnd

Section "!dubsacks gVim Scripts"

  # install dubsacks configuration to user's directory, 
  # e.g., C:\Documents and Settings\User
  setOutPath $PROFILE

  File /r .\_staging.tmp3\vimfiles_dubsacks\*.*

SectionEnd

## UN.INSTALLATION

Section "un.Uninstall Windows gVim 32-bit"

  Call un.InitAssocBat

  # Re-associate file extensions to txtfile
  ExecWait 'cmd.exe /c "$INSTDIR\$assoc_cmds_bat_file_uninst"'
  Delete $INSTDIR\$assoc_cmds_bat_file_uninst

  # delete gVim from C:\Program Files or C:\Program Files (x86)
  RMDir /r $INSTDIR\vim72

SectionEnd

Section /o "!un.Remove *vim*, _vim* and vimfiles"

  # delete gVim from C:\Program Files or C:\Program Files (x86)
  RMDir /r $INSTDIR\vimfiles
  Delete $INSTDIR\_vimrc

  # delete gVim from C:\Documents and Settings\User
  RMDir /r $PROFILE\vimfiles
  Delete $PROFILE\.vim*
  Delete $PROFILE\_vim*

  # Try to delete Installation directory
  # (fails if not empty, obv.)
  RMDir "$INSTDIR"
  # Also try deleting the Company directory
  RMDir "$PROGRAMFILES\${company}"

SectionEnd

## ASSOC FILE EXTENSIONS

Section "-hidden SingleBatchIt-InIt"

  Call InitAssocBat

  FileOpen $0 $INSTDIR\$assoc_cmds_bat_file_inst w
  IfErrors open_failure
  FileOpen $1 $INSTDIR\$assoc_cmds_bat_file_uninst w
  IfErrors open_failure

  FileWrite $0 'ftype ${prodname}="$INSTDIR\vim72\gvim.exe" --remote-silent "%%1"$\n'
  Goto open_success

  open_failure:
    Abort "Unable to create assoc installation script! Failed...!"

  open_success:

SectionEnd

SectionGroup "File Associations"

  # This is just for testing, see below for the BIG list of assoc exts...
  #Section ".bash"
  #  FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
  #SectionEnd

# Vim cmd to convert list of 
#   assoc .=gvim
#   assoc .bash=gvim
#   assoc .bashrc=gvim
#   etc.
# to NSIS Sections:
#   .,$s/# \+assoc \(\.[^=]*\)=.*$/  Section "\1"\r    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\\n"\r    FileWrite $1 "assoc ${__SECTION__}=txtfile$\\n"\r  SectionEnd\r/gc

# assoc .=gvim
# assoc .bash=gvim
# assoc .bashrc=gvim
# assoc .bat=gvim
# assoc .c=gvim
# assoc .cc=gvim
# assoc .conf=gvim
# assoc .css=gvim
# assoc .csv=gvim
# assoc .dat=gvim
# assoc .django=gvim
# assoc .gpx=gvim
# assoc .h=gvim
# assoc .hh=gvim
# assoc .hhc=gvim
# assoc .hpp=gvim
# assoc .htaccess=gvim
# assoc .inc=gvim
# assoc .inf=gvim
# assoc .ini=gvim
# assoc .java=gvim
# assoc .js=gvim
# assoc .layout=gvim
# assoc .log=gvim
# assoc .manifest=gvim
# assoc .nsh=gvim
# assoc .nsi=gvim
# assoc .php=gvim
# assoc .pub=gvim
# assoc .py=gvim
# assoc .rake=gvim
# assoc .rb=gvim
# assoc .rc=gvim
# assoc .rhtml=gvim
# assoc .rsa=gvim
# assoc .s=gvim
# assoc .settings=gvim
# assoc .text=gvim
# assoc .textile=gvim
# assoc .txt=gvim
# assoc .vim=gvim
# assoc .vimprojects=gvim
# assoc .vimrc=gvim
# assoc .xml=gvim
# assoc .yaml=gvim
# assoc .yml=gvim

  Section "."
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".bash"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".bashrc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".bat"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".c"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".cc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".conf"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".css"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".csv"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".dat"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".django"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".gpx"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".h"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".hh"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".hhc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".hpp"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".htaccess"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".inc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".inf"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".ini"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".java"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".js"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".layout"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".log"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".manifest"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".nsh"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".nsi"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".php"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".pub"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".py"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".rake"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".rb"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".rc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".rhtml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".rsa"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".s"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".settings"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".text"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".textile"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".txt"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".vim"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".vimprojects"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".vimrc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".xml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".yaml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section ".yml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

SectionGroupEnd

# Close the batch file and execute it 
# (by not just running cmd.exe for each 
#  Section we're preventing a gazillion 
#  Command windows from popping up)
Section "-hidden SingleBatchIt-FinIt"
  FileClose $0
  FileClose $1
  ExecWait 'cmd.exe /c "$INSTDIR\$assoc_cmds_bat_file_inst"'
  Delete $INSTDIR\$assoc_cmds_bat_file_inst
SectionEnd

