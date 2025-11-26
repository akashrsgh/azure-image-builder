$zipUri = "https://download.oracle.com/java/17/archive/jdk-17.0.12_windows-x64_bin.zip"
$downloadPath = "C:\\jdk-17.0.12_windows-x64_bin.zip"
$destinationPath = "C:\\"
# Download ZIP file
Invoke-WebRequest -Uri $zipUri -OutFile $downloadPath
# Unzip the file into the destination folder
Expand-Archive -Path $downloadPath -DestinationPath $destinationPath
Rename-Item -Path "C:\\jdk-17.0.12" -NewName "C:\\jdk"
