FROM mcr.microsoft.com/dotnet/runtime:6.0-windowsservercore-ltsc2022

# Ustaw PowerShell jako domyślną powłokę dla RUN
SHELL ["powershell", "-Command"]

WORKDIR /app

# Pobierz Magazyn.exe z GitHub Releases
RUN [Net.ServicePointManager]::SecurityProtocol = `
        [Net.SecurityProtocolType]::Tls12 ; `
    Invoke-WebRequest `
        -Uri 'https://github.com/mikolajstachnik02-dotcom/Magazyn/releases/download/v1.0/Magazyn.exe' `
        -OutFile 'Magazyn.exe' ; `
    Unblock-File 'Magazyn.exe'

# Uruchom aplikację
ENTRYPOINT ["C:\\app\\Magazyn.exe"]
