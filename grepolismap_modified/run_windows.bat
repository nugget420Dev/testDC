@echo off
setlocal
if not exist dist\turunmap.exe (
  echo [INFO] dist\turunmap.exe nicht gefunden - baue zuerst...
  call build_windows.bat
  if errorlevel 1 exit /b 1
)

echo [INFO] Starte dist\turunmap.exe
start "TurunMap" /D "%CD%\dist" "%CD%\dist\turunmap.exe"
endlocal
