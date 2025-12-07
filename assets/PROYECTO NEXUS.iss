; ==========================
;  Nexus Finance Web - Setup
; ==========================

[Setup]
AppName=Nexus Finance Web
AppVersion=1.0
AppPublisher=Oasis Air Cleaner Services LLC
DefaultDirName={pf}\Nexus Finance Web
DefaultGroupName=Nexus Finance Web
DisableDirPage=no
DisableProgramGroupPage=no
OutputBaseFilename=NexusFinanceWebSetup
Compression=lzma
SolidCompression=yes
SetupIconFile="C:\NexusFinanceBuild\app\nexus_finance_web.ico"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop icon"; GroupDescription: "Additional tasks:"; Flags: unchecked

[Files]
Source: "C:\NexusFinanceBuild\app\app.py";            DestDir: "{app}"; Flags: ignoreversion
Source: "C:\NexusFinanceBuild\app\app.js";            DestDir: "{app}"; Flags: ignoreversion
Source: "C:\NexusFinanceBuild\app\index.html";        DestDir: "{app}"; Flags: ignoreversion
Source: "C:\NexusFinanceBuild\app\styles.css";        DestDir: "{app}"; Flags: ignoreversion
Source: "C:\NexusFinanceBuild\app\manifest.json";     DestDir: "{app}"; Flags: ignoreversion

Source: "C:\NexusFinanceBuild\app\run_nexus.bat";     DestDir: "{app}"; Flags: ignoreversion
Source: "C:\NexusFinanceBuild\app\run_nexus.vbs";     DestDir: "{app}"; Flags: ignoreversion

Source: "C:\NexusFinanceBuild\app\nexus_finance_web.ico"; DestDir: "{app}"; Flags: ignoreversion

Source: "C:\NexusFinanceBuild\app\assets\*";          DestDir: "{app}\assets"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Nexus Finance Web"; \
  Filename: "{app}\run_nexus.vbs"; \
  IconFilename: "{app}\nexus_finance_web.ico"

Name: "{userdesktop}\Nexus Finance Web"; \
  Filename: "{app}\run_nexus.vbs"; \
  IconFilename: "{app}\nexus_finance_web.ico"; \
  Tasks: desktopicon

[Run]
Filename: "{app}\run_nexus.vbs"; Description: "Launch Nexus Finance Web"; Flags: nowait postinstall skipifsilent
