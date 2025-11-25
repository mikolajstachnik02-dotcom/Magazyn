FROM mcr.microsoft.com/dotnet/runtime:6.0-windowsservercore-ltsc2022

SHELL ["powershell", "-NoProfile", "-Command"]
WORKDIR /app

# Pobierz exe z Releases w jednym RUN (bez kontynuacji linii)
RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
    Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/mikolajstachnik02-dotcom/Magazyn/releases/download/v1.0/Magazyn.exe' -OutFile 'Magazyn.exe'; `
    Unblock-File 'Magazyn.exe'

ENTRYPOINT ["C:\\app\\Magazyn.exe"]
