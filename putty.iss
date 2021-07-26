#define VERSION '0.76'
#define RELEASE '2021-07-18'

#define RELYEAR Copy(RELEASE,1,4)
#define RELDATE Copy(RELEASE,6,2) + Copy(RELEASE,9,2)
#define FILEVER VERSION + '.' + RELYEAR + '.' + RELDATE
#define COPYRIGHT 'Copyright © 1997-' + RELYEAR + ' Simon Tatham.'

[Setup]
AppId=PuTTY
AppName=PuTTY-ranvis
AppVersion={#VERSION} {#RELEASE}
AppPublisher=SATO Kentaro
AppPublisherURL=https://www.ranvis.com/putty
AppSupportURL=https://www.ranvis.com/doc/putty
VersionInfoCopyright={#COPYRIGHT}
VersionInfoDescription=PuTTYrv release {#VERSION} {#RELEASE} installer
VersionInfoProductName=PuTTYrv suite
VersionInfoProductTextVersion=Release {#VERSION} {#RELEASE}
VersionInfoVersion={#FILEVER}
DefaultDirName={autopf}\PuTTY
DefaultGroupName=PuTTY
AllowNoIcons=yes
LicenseFile=PuTTY-ranvis\LICENCE
UninstallDisplayName=PuTTY-ranvis
UninstallDisplayIcon={app}\putty.exe
ChangesAssociations=yes
OutputDir=output
OutputBaseFilename=PuTTYrv-64bit-{#VERSION}-{#RELYEAR}{#RELDATE}-installer
Compression=lzma2/max
SolidCompression=yes
UsedUserAreasWarning=no
UsePreviousLanguage=no
UsePreviousPrivileges=no
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline dialog
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64

[Languages]
Name: en; MessagesFile: compiler:Default.isl,lang\English.isl
Name: ja; MessagesFile: compiler:Languages\Japanese.isl,lang\Japanese.isl

[Components]
Name: main; Description: {cm:PuTTYComment}; Flags: fixed; Types: full compact custom
Name: lang; Description: {cm:Languages}; Flags: disablenouninstallwarning; Types: full
Name: lang/ja; Description: {cm:JapaneseUI}; Flags: disablenouninstallwarning; Types: full; Languages: not ja
Name: lang/ja; Description: {cm:JapaneseUI}; Flags: disablenouninstallwarning; Types: full compact; Languages: ja

[Files]
; executable
Source: PuTTY-ranvis\*.exe; DestDir: {app}; Components: main; Flags: promptifolder
; misc
Source: PuTTY-ranvis\putty_sample.ini; DestDir: {app}; Components: main; Flags: ignoreversion
Source: PuTTY-ranvis\putty.chm; DestDir: {app}; Components: main; Flags: ignoreversion
Source: PuTTY-ranvis\LICENCE; DestDir: {app}; Components: main; Flags: ignoreversion
Source: PuTTY-ranvis\README.ranvis-dist.txt; DestDir: {app}; DestName: README.txt; Components: main; Flags: ignoreversion
; japanese language
Source: PuTTY-ranvis\lang\0411\*; Excludes: plinkw.lng; DestDir: {app}\lang\0411; Components: lang/ja; Flags: ignoreversion

[InstallDelete]
Name: {app}\lang\0411; Type: filesandordirs; Check: not WizardIsComponentSelected('lang/ja')
; Finally, if all languages are not selected.
Name: {app}\lang; Type: dirifempty; Check: not WizardIsComponentSelected('lang')

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; Flags: unchecked
Name: associate; Description: {cm:AssocFileExtension,{cm:PPKTools},.ppk}

[Icons]
Name: {group}\{cm:PuTTYShortcutName}; Filename: {app}\putty.exe; Comment: {cm:PuTTYComment}
Name: {group}\{cm:PuTTYManualShortcutName}; Filename: {app}\putty.chm; MinVersion: 4.1,5.0
Name: {group}\{cm:PSFTPShortcutName}; Filename: {app}\psftp.exe; Comment: {cm:PSFTPComment}
Name: {group}\{cm:PuTTYgenShortcutName}; Filename: {app}\puttygen.exe; Comment: {cm:PuTTYgenComment}
Name: {group}\{cm:PageantShortcutName}; Filename: {app}\pageant.exe; Comment: {cm:PageantComment}
Name: {autodesktop}\{cm:PuTTYShortcutName}; Filename: {app}\putty.exe; Tasks: desktopicon

[Registry]
Root: HKA; Subkey: Software\Classes\.ppk; ValueType: string; ValueData: PuTTYPrivateKey; Flags: uninsdeletevalue; Tasks: associate
Root: HKA; Subkey: Software\Classes\PuTTYPrivateKey; ValueType: string; ValueData: {cm:PPKTypeDescription}; Flags: uninsdeletekey; Tasks: associate
Root: HKA; Subkey: Software\Classes\PuTTYPrivateKey\DefaultIcon; ValueType: string; ValueData: """{app}\pageant.exe"",0"; Tasks: associate
Root: HKA; Subkey: Software\Classes\PuTTYPrivateKey\shell\open\command; ValueType: string; ValueData: """{app}\pageant.exe"" ""%1"""; Tasks: associate
Root: HKA; Subkey: Software\Classes\PuTTYPrivateKey\shell\edit; ValueType: string; ValueData: {cm:PPKEditLabel}; Tasks: associate
Root: HKA; Subkey: Software\Classes\PuTTYPrivateKey\shell\edit\command; ValueType: string; ValueData: """{app}\puttygen.exe"" ""%1"""; Tasks: associate
