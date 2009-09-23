
; Adapted from http://nsis.sourceforge.net/Reusable_installer_script
; by Landon Bouma <landonb@retrosoft.com> 2009.09.21

; basic script template for NSIS installers
;
; Written by Philip Chu
; Copyright (c) 2004-2005 Technicat, LLC
;
; This software is provided 'as-is', without any express or implied warranty.
; In no event will the authors be held liable for any damages arising from the use of this software.

; Permission is granted to anyone to use this software for any purpose,
; including commercial applications, and to alter it ; and redistribute
; it freely, subject to the following restrictions:

;    1. The origin of this software must not be misrepresented; you must not claim that
;       you wrote the original software. If you use this software in a product, an
;       acknowledgment in the product documentation would be appreciated but is not required.

;    2. Altered source versions must be plainly marked as such, and must not be
;       misrepresented as being the original software.

;    3. This notice may not be removed or altered from any source distribution.

;!define setup "setup.exe"

; change this to wherever the files to be packaged reside
;!define srcdir "."

;!define company "Technicat"

;!define prodname "Application"
;!define exec "program.exe"

; optional stuff

; text file to open in notepad after installation
; !define notefile "README.txt"

; license text file
; !define licensefile license.txt

; icons must be Microsoft .ICO files
; !define icon "icon.ico"

; installer background screen
; !define screenimage background.bmp

; file containing list of file-installation commands
; !define files "files.nsi"

; file containing list of file-uninstall commands
; !define unfiles "unfiles.nsi"

; registry stuff

!define regkey "Software\${company}\${prodname}"
!define uninstkey "Software\Microsoft\Windows\CurrentVersion\Uninstall\${prodname}"

!define startmenu "$SMPROGRAMS\${company}\${prodname}"
!define uninstaller "uninstall.exe"

;--------------------------------

XPStyle on
ShowInstDetails hide
ShowUninstDetails hide

Name "${prodname}"
Caption "${prodname}"

!ifdef icon
  Icon "${icon}"
!endif

OutFile "${setup}"

SetDateSave on
SetDatablockOptimize on
CRCCheck on
SilentInstall normal

InstallDir "$PROGRAMFILES\${company}\${prodname}"
InstallDirRegKey HKLM "${regkey}" ""

!ifdef licensefile
  LicenseText "License"
  LicenseData "${srcdir}\${licensefile}"
!endif

; pages
; we keep it simple - leave out selectable installation types

!ifdef licensefile
  Page license
!endif
Page directory
!ifdef components
  Page components
!endif
Page instfiles

!ifdef components
  UninstPage components
!endif
UninstPage uninstConfirm
UninstPage instfiles

;--------------------------------

AutoCloseWindow false
ShowInstDetails show

!ifdef screenimage

; set up background image
; uses BgImage plugin

Function .onGUIInit
	; extract background BMP into temp plugin directory
	InitPluginsDir
	File /oname=$PLUGINSDIR\1.bmp "${screenimage}"

	BgImage::SetBg /NOUNLOAD /FILLSCREEN $PLUGINSDIR\1.bmp
	BgImage::Redraw /NOUNLOAD
FunctionEnd

Function .onGUIEnd
	; Destroy must not have /NOUNLOAD so NSIS will be able to unload and delete BgImage before it exits
	BgImage::Destroy
FunctionEnd

!endif

; beginning (invisible) section
Section

  WriteRegStr HKLM "${regkey}" "Install_Dir" "$INSTDIR"
  ; write uninstall strings
  WriteRegStr HKLM "${uninstkey}" "DisplayName" "${prodname} (remove only)"
  WriteRegStr HKLM "${uninstkey}" "UninstallString" '"$INSTDIR\${uninstaller}"'

  !ifdef filetype
    WriteRegStr HKCR "${filetype}" "" "${prodname}"
  !endif

  WriteRegStr HKCR "${prodname}\Shell\open\command\" "" '"$INSTDIR\${exec} "%1"'

  !ifdef icon
    WriteRegStr HKCR "${prodname}\DefaultIcon" "" "$INSTDIR\${icon}"
  !endif

  SetOutPath $INSTDIR

  ; package all files, recursively, preserving attributes
  ; assume files are in the correct places
  ;!ifdef exec
    !ifndef noexeccopy
      File /a "${srcdir}\${exec}"
    !endif
  ;!endif

  !ifdef licensefile
    !ifndef nolicensefilecopy
      File /a "${srcdir}\${licensefile}"
    !endif
  !endif

  !ifdef notefile
    File /a "${srcdir}\${notefile}"
  !endif

  !ifdef icon
    ; copy the icon for the shortcut
    ;!ifndef noiconcopy
      File /a "${srcdir}\${icon}"
    ;!endif
  !endif

  ; any application-specific files
  !ifdef files
    !include "${files}"
  !endif

  WriteUninstaller "${uninstaller}"

SectionEnd

; create shortcuts
Section

  !ifndef exec_params
    !define exec_params ""
  !endif

  CreateDirectory "${startmenu}"
  SetOutPath $INSTDIR ; for working directory
  !ifdef icon
    CreateShortCut "${startmenu}\${prodname}.lnk" "$INSTDIR\${exec}" "${exec_params}" "$INSTDIR\${icon}"
  !else
    CreateShortCut "${startmenu}\${prodname}.lnk" "$INSTDIR\${exec}" "${exec_params}"
  !endif

  !ifdef notefile
    CreateShortCut "${startmenu}\Release Notes.lnk "$INSTDIR\${notefile}"
  !endif

  !ifdef helpfile
    CreateShortCut "${startmenu}\Documentation.lnk "$INSTDIR\${helpfile}"
  !endif

  !ifdef website
    WriteINIStr "${startmenu}\${website-link}.url" "InternetShortcut" "URL" ${website}
    ;CreateShortCut "${startmenu}\${website-link}.lnk "${website}" "URL"
  !endif

  !ifdef notefile
    ExecShell "open" "$INSTDIR\${notefile}"
  !endif

  ; Uninstall shortcut
  CreateShortCut "${startmenu}\Uninstall ${prodname}.lnk" "$INSTDIR\uninstall.exe" ""

SectionEnd

; Uninstaller
; All section names prefixed by "Un" will be in the uninstaller

UninstallText "This will uninstall ${prodname}."

!ifdef icon
  UninstallIcon "${icon}"
!endif

Section "Uninstall"

  DeleteRegKey HKLM "${uninstkey}"
  DeleteRegKey HKLM "${regkey}"

  Delete "${startmenu}\*.*"
  Delete "${startmenu}"

  !ifdef licensefile
    Delete "$INSTDIR\${licensefile}"
  !endif

  !ifdef notefile
    Delete "$INSTDIR\${notefile}"
  !endif

  !ifdef icon
    Delete "$INSTDIR\${icon}"
  !endif

  ;!ifdef exec
    Delete "$INSTDIR\${exec}"
  ;!endif

  !ifdef unfiles
    !include "${unfiles}"
  !endif

SectionEnd

Function "un.RMDirHack"

  ; Delete uninstaller
  Delete $INSTDIR\uninstall.exe

  ; Try to delete Installation directory
  ; (fails if not empty, obv.)
  RMDir "$INSTDIR"
  ; Also try deleting the Company directory
  RMDir "$PROGRAMFILES\${company}"

FunctionEnd

; Check now if the Installation directory
; can be deleted
Section "-un.RMDir Hack"

  !ifndef no_uninstall_cleanup
    Call un.RMDirHack
  !endif
  ; Otherwise, components file should 
  ; call this as necessary

SectionEnd

; Call the user's custom sections last
!ifdef components
  !include "${components}"
!endif

