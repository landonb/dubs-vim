 
; change this to wherever the files to be packaged reside
!define srcdir "."
 
!define company "Retrosoft"
 
!define prodname "dubsacks"

!define prodvers "0.0.1.0"
!define prodvers_short "0.0.1"

;!define setup "dubsacks.exe"
!define setup "dubsacks-v${prodvers_short}.exe"

!define exec "_staging.tmp\vim\vim72\gvim.exe"
!define noexeccopy
 
; optional stuff
 
; text file to open in notepad after installation
; !define notefile "README.txt"
 
; license text file
!define licensefile license.txt
!define nolicensefilecopy

; icons must be Microsoft .ICO files
!define icon "favicon.ico"
!define noiconcopy
 
; installer background screen
; !define screenimage background.bmp

!define components "dubsacks-components.nsh"

; file containing list of file-installation commands
;!define files "dubsacks-files.nsh"
 
; file containing list of file-uninstall commands
;!define unfiles "dubsacks-unfiles.nsh"

!define website "http://dubsacks.net" 
!define website-link "dubsacks Project Page"

LoadLanguageFile "C:\Program Files\NSIS\Contrib\Language files\English.nlf"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "dubsacks gVim"
; VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "A test comment"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Retrosoft"
; VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "Test Application is a trademark of Fake company"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "© 2009 Retrosoft"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "dubsacks gVim Installer"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${prodvers}"
VIProductVersion ${prodvers}

;;;;;;;;;;;;;;;; This must come last:

!include technicat.nsh

