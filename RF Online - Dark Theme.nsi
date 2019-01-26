;RF Online - Dark Theme / UI Mod
;Written by Dave Bagtas

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !include "x64.nsh"
  !include "LogicLib.nsh"

;--------------------------------
;General

  ;Properly display all languages (Installer will not work on Windows 95, 98 or ME!)
  Unicode true

  ;Name and file
  Name "RF Online - Dark Theme"
  OutFile "RF Online - Dark Theme.exe"

  ;Default installation folder
  InstallDir "$PROGRAMFILES\RF Online"
  
  ;Get installation folder from registry if available
  ;InstallDirRegKey HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline InstallLocation
  ;InstallDirRegKey HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline InstallLocation
  
  ;Request application privileges for Windows Vista
  RequestExecutionLevel highest
	
	!define APP_NAME "RF Online - Dark Theme"
	!define COMP_NAME "c0ld"
	!define WEB_SITE ""
	!define VERSION "4.0.0.0"
	!define COPYRIGHT "Copyright© 2018 c0ld. All Rights Reserved"
	!define DESCRIPTION "RF Online - Theme / UI Changer"
			
	!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\nsis3-install.ico"
	!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange.bmp" 
	!define MUI_HEADERIMAGE
	!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-r.bmp"
	
	!define MUI_HEADERIMAGE_RIGHT
	
	VIProductVersion  "${VERSION}"
	VIAddVersionKey "ProductName"  "${APP_NAME}"
	VIAddVersionKey "CompanyName"  "${COMP_NAME}"
	VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
	VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
	VIAddVersionKey "FileVersion"  "${VERSION}"	
	VIAddVersionKey "ProductVersion"  "${VERSION}"	

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

  ;Show all languages, despite user's codepage
  !define MUI_LANGDLL_ALLLANGUAGES

;--------------------------------
;Language Selection Dialog Settings

  ;Remember the installer language
  ; !define MUI_LANGDLL_REGISTRY_ROOT "HKCU" 
  ; !define MUI_LANGDLL_REGISTRY_KEY "Software\Modern UI Test" 
  ; !define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English" ;first language is the default language
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Thai"  
  !insertmacro MUI_LANGUAGE "Portuguese"	
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese" 
  !insertmacro MUI_LANGUAGE "Japanese" 
  !insertmacro MUI_LANGUAGE "Korean"  
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Italian"  
  !insertmacro MUI_LANGUAGE "Indonesian"  
  !insertmacro MUI_LANGUAGE "Dutch"  
  !insertmacro MUI_LANGUAGE "Russian"  

;--------------------------------
;Reserve Files
  
  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.	
  
  !insertmacro MUI_RESERVEFILE_LANGDLL
	
	!macro BackupFile FILE_DIR FILE BACKUP_TO
		IfFileExists "${FILE_DIR}\${FILE}" 0 +2
		  Rename "${FILE_DIR}\${FILE}" "${BACKUP_TO}\${FILE}.bak"
	!macroend
	
	!macro RestoreFile FILE_DIR FILE RESTORE_TO
		  Delete "${FILE_DIR}\${FILE}"		
		  Rename "${FILE_DIR}\${FILE}.bak" "${RESTORE_TO}\${FILE}"	
	!macroend		

;--------------------------------
;Installer Sections

SectionGroup /e "Dark UI / Theme" Section_One

	Section "Dark User Interface" Dark_UI
		SectionIn RO

		SetOutPath "$INSTDIR"
		
		;ADD YOUR OWN FILES HERE...
	
		SetOutPath "$INSTDIR\SpriteImage\en-us"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\en-us" "CashShop.spr" "$INSTDIR\SpriteImage\en-us"
		File ".\Files_To_Install\SpriteImage\en-us\CashShop.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\en-us" "common.spr" "$INSTDIR\SpriteImage\en-us"
		File ".\Files_To_Install\SpriteImage\en-us\common.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\en-us" "itemupgrade.spr" "$INSTDIR\SpriteImage\en-us"
		File ".\Files_To_Install\SpriteImage\en-us\itemupgrade.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\en-us" "system.spr" "$INSTDIR\SpriteImage\en-us"				
		File ".\Files_To_Install\SpriteImage\en-us\system.spr"
		SetOutPath "$INSTDIR\SpriteImage\common"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "cribattle.spr" "$INSTDIR\SpriteImage\common"
		File ".\Files_To_Install\SpriteImage\common\cribattle.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "inventory.spr" "$INSTDIR\SpriteImage\common"
		File ".\Files_To_Install\SpriteImage\common\inventory.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "itemcombine.spr" "$INSTDIR\SpriteImage\common"
		File ".\Files_To_Install\SpriteImage\common\itemcombine.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "main.spr" "$INSTDIR\SpriteImage\common"		
		File ".\Files_To_Install\SpriteImage\common\main.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "mining.spr" "$INSTDIR\SpriteImage\common"						
		File ".\Files_To_Install\SpriteImage\common\mining.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "patriarch.spr" "$INSTDIR\SpriteImage\common"			
		File ".\Files_To_Install\SpriteImage\common\patriarch.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "pvp.spr" "$INSTDIR\SpriteImage\common"
		File ".\Files_To_Install\SpriteImage\common\pvp.spr"
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "skillwindow.spr" "$INSTDIR\SpriteImage\common"
		File ".\Files_To_Install\SpriteImage\common\skillwindow.spr"			
		!insertmacro BackupFile "$INSTDIR\SpriteImage\common" "system.spr" "$INSTDIR\SpriteImage\common"
		File ".\Files_To_Install\SpriteImage\common\system.spr"	
		
		;WRITE INSTALL INFORMATION INTO REGISTRY
		${If} ${RunningX64}
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayIcon "$INSTDIR\Uninstall_DarkTheme.exe"
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayName "RF Online - Dark Theme"
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayVersion "${VERSION}"
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme InstallLocation $INSTDIR
			WriteRegDWORD HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme "NoModify" 1
			WriteRegDWORD HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme "NoRepair" 1		
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme Publisher "c0ld"
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme UninstallString "$INSTDIR\Uninstall_DarkTheme.exe"
			WriteRegStr HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme URLInfoAbout "https://www.playredfox.com/rf_online/"			
		${Else}
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayIcon "$INSTDIR\Uninstall_DarkTheme.exe"
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayName "RF Online - Dark Theme"
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayVersion "${VERSION}"
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme InstallLocation $INSTDIR
			WriteRegDWORD HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme "NoModify" 1
			WriteRegDWORD HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme "NoRepair" 1		
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme Publisher "c0ld"
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme UninstallString "$INSTDIR\Uninstall_DarkTheme.exe"
			WriteRegStr HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme URLInfoAbout "https://www.playredfox.com/rf_online/"
		${EndIf} 		
		
		;Create uninstaller
		WriteUninstaller "$INSTDIR\Uninstall_DarkTheme.exe"			

	SectionEnd

	Section /o "Mouse Cursor" Mouse_Cursor

		SetOutPath "$INSTDIR"
		
		;ADD YOUR OWN FILES HERE...
		SetOutPath "$INSTDIR\System\mouse"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "attack.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\attack.ani"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "basic.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\basic.ani"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "force.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\force.ani"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "get.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\get.ani"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "NPC.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\NPC.ani"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "samerace.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\samerace.ani"
		!insertmacro BackupFile "$INSTDIR\System\mouse" "skill.ani" "$INSTDIR\System\mouse"
		File ".\Files_To_Install\System\mouse\skill.ani"		

	SectionEnd

SectionGroupEnd

SectionGroup /e "Map Patch / Fixes" Section_Two
	
	Section /o "Beast Mountain" Mountain_Beast
		;SetOverwrite on
		SetOutPath "$INSTDIR"	
		SetOutPath "$INSTDIR\Map\Mountain_Beast"
		
		!insertmacro BackupFile "$INSTDIR\Map\Mountain_Beast" "Mountain_Beast.ebp" "$INSTDIR\Map\Mountain_Beast"
		File ".\Files_To_Install\Map\Mountain_Beast\Mountain_Beast.ebp"		
	SectionEnd

	Section /o "Outcast Land" Outcast_Land
		;SetOverwrite on
		SetOutPath "$INSTDIR"	
		SetOutPath "$INSTDIR\Map\Exile_Land"	
		
		!insertmacro BackupFile "$INSTDIR\Map\Exile_Land" "Exile_Land.ebp" "$INSTDIR\Map\Exile_Land"
		File ".\Files_To_Install\Map\Exile_Land\Exile_Land.ebp"	
	SectionEnd	

	Section /o "Novajan Fortress" Wounded_Land
		;SetOverwrite on
		SetOutPath "$INSTDIR"	
		SetOutPath "$INSTDIR\Map\Wounded_Land"	
		
		!insertmacro BackupFile "$INSTDIR\Map\Wounded_Land" "Wounded_Land.ebp" "$INSTDIR\Map\Wounded_Land"
		File ".\Files_To_Install\Map\Wounded_Land\Wounded_Land.ebp"	
	SectionEnd
	
	Section /o "Aberrant Dungeon" Aberrant_Dungeon
		;SetOverwrite on
		SetOutPath "$INSTDIR"	
		SetOutPath "$INSTDIR\Map\Dungeon02"
		
		!insertmacro BackupFile "$INSTDIR\Map\Dungeon02" "Dungeon02.ebp" "$INSTDIR\Map\Dungeon02"
		File ".\Files_To_Install\Map\Dungeon02\Dungeon02.ebp"	
	SectionEnd	

SectionGroupEnd

;--------------------------------
;Installer Functions

Function .onInit

  !insertmacro MUI_LANGDLL_DISPLAY
  
  #prevent multiple instances of the installer running
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${APP_NAME}") i .r1 ?e'
  Pop $R0

  StrCmp $R0 0 +3
  MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running."
  Abort
  
  ;Get installation folder from registry if available
  ${If} ${RunningX64}  
	ReadRegStr $INSTDIR HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline InstallLocation
  ${Else}
    ReadRegStr $INSTDIR HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline InstallLocation
  ${EndIf}
  
  ;Check for previous installation
  ${If} ${RunningX64}
	ReadRegStr $R0 HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme UninstallString
	ReadRegStr $R1 HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayName
    ReadRegStr $R2 HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayVersion
  ${Else}
	ReadRegStr $R0 HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme UninstallString
	ReadRegStr $R1 HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayName
    ReadRegStr $R2 HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme DisplayVersion	
  ${EndIf}

  StrCmp $R0 "" done
 
  MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION \
  "$R1 v$R2 is already installed. $\n$\nClick `OK` to remove the previous version or `Cancel` to cancel this upgrade." \
  IDOK uninst
  Abort
 
;Run the uninstaller
uninst:
  ExecWait '$R0 _?=$INSTDIR' ;Do not copy the uninstaller to a temp file
 
 done:  
  
FunctionEnd

;--------------------------------
;Descriptions

  ;USE A LANGUAGE STRING IF YOU WANT YOUR DESCRIPTIONS TO BE LANGAUGE SPECIFIC

  ;Assign descriptions to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  
		; Theme / UI
		!insertmacro MUI_DESCRIPTION_TEXT ${Section_One} "Apply Custom Theme / User Interface"
			!insertmacro MUI_DESCRIPTION_TEXT ${Dark_UI} "Apply dark theme"
			!insertmacro MUI_DESCRIPTION_TEXT ${Mouse_Cursor} "Apply custom mouse cursors"
		; Map Patches
		!insertmacro MUI_DESCRIPTION_TEXT ${Section_Two} "Apply Map Patches (remove unecessary particle and lighting effects; reduces lag)."
			!insertmacro MUI_DESCRIPTION_TEXT ${Mountain_Beast} "Remove beast mountain extra sprite/particle and rain effects."
			!insertmacro MUI_DESCRIPTION_TEXT ${Outcast_Land} "Remove Outcast Land extra sprite/particle effects."
			!insertmacro MUI_DESCRIPTION_TEXT ${Aberrant_Dungeon} "Remove Hora Dark Hole, Shiny and Aberrant Battle Dungeon extra sprite/particle effects."
			!insertmacro MUI_DESCRIPTION_TEXT ${Wounded_Land} "Remove Novajan Fortress extra sprite/particle effects."
			
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
 
;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;READ REGISTRY
  ${If} ${RunningX64}
     ReadRegStr $INSTDIR HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme InstallLocation
  ${Else}
	 ReadRegStr $INSTDIR HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme InstallLocation
  ${EndIf}  
  
  ;RESTORE FILE ROUTINE
  ;Theme	
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\en-us" "CashShop.spr" "$INSTDIR\SpriteImage\en-us"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\en-us" "common.spr" "$INSTDIR\SpriteImage\en-us"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\en-us" "itemupgrade.spr" "$INSTDIR\SpriteImage\en-us"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\en-us" "system.spr" "$INSTDIR\SpriteImage\en-us"				

  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "cribattle.spr" "$INSTDIR\SpriteImage\common"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "inventory.spr" "$INSTDIR\SpriteImage\common"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "itemcombine.spr" "$INSTDIR\SpriteImage\common"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "main.spr" "$INSTDIR\SpriteImage\common"		
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "mining.spr" "$INSTDIR\SpriteImage\common"						
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "patriarch.spr" "$INSTDIR\SpriteImage\common"			
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "pvp.spr" "$INSTDIR\SpriteImage\common"
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "skillwindow.spr" "$INSTDIR\SpriteImage\common"    
  !insertmacro RestoreFile "$INSTDIR\SpriteImage\common" "system.spr" "$INSTDIR\SpriteImage\common"  
  
  ;Mouse Cursor
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "attack.ani" "$INSTDIR\System\mouse"
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "basic.ani" "$INSTDIR\System\mouse"
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "force.ani" "$INSTDIR\System\mouse"
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "get.ani" "$INSTDIR\System\mouse"
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "NPC.ani" "$INSTDIR\System\mouse"
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "samerace.ani" "$INSTDIR\System\mouse"
  !insertmacro RestoreFile "$INSTDIR\System\mouse" "skill.ani" "$INSTDIR\System\mouse"
  
  ;Maps
  !insertmacro RestoreFile "$INSTDIR\Map\Mountain_Beast" "Mountain_Beast.ebp" "$INSTDIR\Map\Mountain_Beast"
  !insertmacro RestoreFile "$INSTDIR\Map\Exile_Land" "Exile_Land.ebp" "$INSTDIR\Map\Exile_Land"
  !insertmacro RestoreFile "$INSTDIR\Map\Wounded_Land" "Wounded_Land.ebp" "$INSTDIR\Map\Wounded_Land"
  !insertmacro RestoreFile "$INSTDIR\Map\Dungeon02" "Dungeon02.ebp" "$INSTDIR\Map\Dungeon02"

  Delete "$INSTDIR\Uninstall_DarkTheme.exe"

  ${If} ${RunningX64}
     DeleteRegKey /ifempty HKLM SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme
  ${Else}
	 DeleteRegKey /ifempty HKLM SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\RFOnline_DarkTheme
  ${EndIf}
  
SectionEnd

;--------------------------------
;Uninstaller Functions

; Function un.onInit

  ; !insertmacro MUI_UNGETLANGUAGE
  
; FunctionEnd