@echo off
REM TRAMA Offline — abre no Chrome (Windows)
cd /d "%~dp0"
start "" python -m http.server 8080
timeout /t 2 >nul
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --kiosk "http://localhost:8080/index.html"
echo TRAMA a correr em http://localhost:8080
echo Fecha esta janela para parar.
pause
