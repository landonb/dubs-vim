
Var assoc_cmds_bat_file_inst
Var assoc_cmds_bat_file_uninst
; This is a hack to indicate if it's okay to delete 
; the uninstaller and the application dir on uninstall
Var components_removed
!define uninstall_sections_no 2

Function InitAssocBat
  StrCpy $assoc_cmds_bat_file_inst "install_ftype_assoc.bat"
  StrCpy $assoc_cmds_bat_file_uninst "uninstall_ftype_assoc.bat"
  IntFmt $components_removed "%d" 0
FunctionEnd

Function un.InitAssocBat
  StrCpy $assoc_cmds_bat_file_inst "install_ftype_assoc.bat"
  StrCpy $assoc_cmds_bat_file_uninst "uninstall_ftype_assoc.bat"
  IntFmt $components_removed "%d" 0
FunctionEnd

## INSTALLATION

Section "Windows gVim 32-bit"

  # install gVim to C:\Program Files or C:\Program Files (x86)
  setOutPath $INSTDIR

  File /r .\_staging.tmp\vimfiles_gvim\*.*

SectionEnd

#   (The !bang just bolds the word it precedes)
Section "!dubsacks gVim Scripts"

  # install dubsacks configuration to user's directory, 
  # e.g., C:\Documents and Settings\User
  setOutPath $PROFILE

  File /r .\_staging.tmp\vimfiles_dubsacks\*.*

SectionEnd

## UN.INSTALLATION

Section "un.Uninstall Windows gVim 32-bit"

  Call un.InitAssocBat

  # Re-associate file extensions to txtfile
  ExecWait 'cmd.exe /c "$INSTDIR\$assoc_cmds_bat_file_uninst"'
  Delete $INSTDIR\$assoc_cmds_bat_file_uninst

  # delete gVim from C:\Program Files or C:\Program Files (x86)
  RMDir /r $INSTDIR\vim72

  IntOp $components_removed $components_removed + 1

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
  #RMDir "$INSTDIR"
  # Also try deleting the Company directory
  #RMDir "$PROGRAMFILES\${company}"

  IntOp $components_removed $components_removed + 1

SectionEnd

Section "-un.Set RMDir Hack"
  IntCmp $components_removed ${uninstall_sections_no} is_eq is_lt is_gt
  is_eq:
    Call un.RMDirHack
    Goto done
  is_lt:
    Goto done
  is_gt:
    Goto done
  done:

SectionEnd

## ASSOC FILE EXTENSIONS

Section "-hidden SingleBatchIt-InIt"

  Call InitAssocBat

  FileOpen $0 $INSTDIR\$assoc_cmds_bat_file_inst w
  IfErrors open_failure
  FileOpen $1 $INSTDIR\$assoc_cmds_bat_file_uninst w
  IfErrors open_failure

  FileWrite $0 'ftype ${prodname_dotted}="$INSTDIR\vim72\gvim.exe" --remote-silent "%%1"$\n'
  Goto open_success

  open_failure:
    Abort "Unable to create assoc installation script! Failed...!"

  open_success:

SectionEnd

SectionGroup /e "File Associations"

  # This is just for testing, see below for the BIG list of assoc exts...
  #Section ".bash"
  #  FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
  #SectionEnd

# Vim cmd to convert list of 
#   assoc .=gvim
#   assoc .bash=gvim
#   assoc .bashrc=gvim
#   etc.
# to NSIS Sections:
#   .,$s/# \+assoc \(\.[^=]*\)=.*$/  Section "\1"\r    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\\n"\r    FileWrite $1 "assoc ${__SECTION__}=txtfile$\\n"\r  SectionEnd\r/gc

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

  Section /o "."
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".bash"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".bashrc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".bat"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".c"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".cc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".conf"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".css"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".csv"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".dat"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".django"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".gpx"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".h"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".hh"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".hhc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".hpp"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".htaccess"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".inc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".inf"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".ini"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".java"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".js"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".layout"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".log"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".manifest"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".nsh"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".nsi"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".php"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".pub"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".py"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".rake"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".rb"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".rc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".rhtml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".rsa"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".s"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".settings"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".text"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".textile"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".txt"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".vim"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".vimprojects"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".vimrc"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".xml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".yaml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
    FileWrite $1 "assoc ${__SECTION__}=txtfile$\n"
  SectionEnd

  Section /o ".yml"
    FileWrite $0 "assoc ${__SECTION__}=${prodname_dotted}$\n"
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

