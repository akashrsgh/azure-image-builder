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
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\cygwin64\bin\bash.exe" -PropertyType String -Force
Add-Content -Path "C:\Users\tester\.bashrccc" -Value "export PATH=/usr/local/bin:/usr/bin:$PATH" 
