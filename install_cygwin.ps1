Invoke-WebRequest -Uri 'https://cygwin.com/setup-x86_64.exe' -OutFile 'C:\\temp\\setup-x86_64.exe'
$MirrorUrl = "https://cygwin.mirrors.hoobly.com" # Ensure HTTPS is included
$InstallDir = "C:\cygwin64"
$DownloadDir = "$env:TEMP\CygwinSetup"
$Packages = "zip,unzip,wget,curl,make,autoconf,automake,gcc,jdk,libtool,valgrind,ant,subversion,mercurial,git,ruby,nodejs,expect,net-tools,ftp,mc" # Always include 'base'

$Arguments = @(
    "--quiet-mode"
    "--root"
    "$InstallDir"
    "--site"
    "$MirrorUrl"           # This should be passed as one argument
    "--local-package-dir"
    "$DownloadDir\packages"
    "--packages"
    "$Packages"
)

Start-Process -FilePath 'C:\temp\setup-x86_64.exe' -ArgumentList $Arguments -Wait -NoNewWindow
Remove-Item -Path 'C:\\temp\\setup-x86_64.exe'

$zipUri = "https://download.oracle.com/java/17/archive/jdk-17.0.12_windows-x64_bin.zip"
$downloadPath = "C:\\jenkins\\jdk-17.0.12_windows-x64_bin.zip"
$destinationPath = "C:\\jenkins\\"
# Download ZIP file
Invoke-WebRequest -Uri $zipUri -OutFile $downloadPath
# Unzip the file into the destination folder
Expand-Archive -Path $downloadPath -DestinationPath $destinationPath
Rename-Item -Path "C:\\jenkins\\jdk-17.0.12" -NewName "C:\\jenkins\\jdk"
