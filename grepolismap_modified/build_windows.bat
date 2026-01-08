@echo off
setlocal ENABLEDELAYEDEXPANSION

REM ---- Check prerequisites
where cargo >nul 2>nul
if errorlevel 1 (
  echo [ERROR] cargo wurde nicht gefunden. Bitte Rust (rustup) installieren und neues Terminal oeffnen.
  exit /b 1
)

REM ---- Build
echo [INFO] Building release...
cargo build --release
if errorlevel 1 (
  echo [ERROR] Build fehlgeschlagen.
  exit /b 1
)

REM ---- Copy result
if not exist dist mkdir dist
if not exist target\release\turunmap.exe (
  echo [ERROR] target\release\turunmap.exe wurde nicht gefunden. Stimmt der Paketname?
  exit /b 1
)
copy /Y target\release\turunmap.exe dist\turunmap.exe >nul

echo [OK] Fertig. EXE liegt unter dist\turunmap.exe
endlocal
