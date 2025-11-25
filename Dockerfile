FROM mcr.microsoft.com/dotnet/runtime:6.0-windowsservercore-ltsc2022

# Używaj PowerShella jako domyślnej powłoki dla RUN (lepsza kontrola na Windows)
SHELL ["powershell", "-Command"]

WORKDIR /app

# (Opcjonalnie) skopiuj lokalne pliki, jeśli coś z nich potrzebujesz
# COPY . .

# Włącz TLS1.2 i pobierz plik z Releases, zapisz jako /app/Magazyn.exe
RUN [Net.ServicePointManager]::SecurityProtocol = `
        [Net.SecurityProtocolType]::Tls12 ; `
    Invoke-WebRequest `
        -Uri 'https://github.com/mikolajstachnik02-dotcom/Magazyn/releases/download/v1.0/Magazyn.exe' `
        -OutFile 'Magazyn.exe' ; `
    Unblock-File 'Magazyn.exe'

# Uruchom bezpośrednio exe z katalogu /app
ENTRYPOINT ["C:\\app\\Magazyn.exe"]
