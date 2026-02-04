@echo off
rem monitor_cpu.bat - 簡易CPUモニタ
rem 使い方: monitor_cpu.bat [interval_seconds] [output_file]

setlocal enabledelayedexpansion

set INTERVAL=%1
if "%INTERVAL%"=="" set INTERVAL=5
set OUTFILE=%2
if "%OUTFILE%"=="" set OUTFILE=%~dp0monitor_cpu.log

echo Monitoring CPU every %INTERVAL% seconds. Output: %OUTFILE%
echo --- CPU monitor started at %date% %time% --- >> "%OUTFILE%"

:loop
for /f "tokens=2 delims==" %%a in ('wmic cpu get loadpercentage /value ^| find "LoadPercentage"') do set CPU=%%a
echo %date% %time% CPU: %CPU%%% >> "%OUTFILE%"
timeout /t %INTERVAL% >nul
goto loop
