FROM mcr.microsoft.com/dotnet/runtime:6.0-windowsservercore-ltsc2022
WORKDIR /app

COPY . .

RUN curl -L -o Magazyn.exe https://github.com/mikolajstachnik02-dotcom/Magazyn/releases/download/v1.0/Magazyn.exe

ENTRYPOINT ["Magazyn.exe"]





