@echo off
rem monitor_mem.bat - 簡易メモリモニタ
rem 使い方: monitor_mem.bat [interval_seconds] [output_file]

setlocal enabledelayedexpansion

set INTERVAL=%1
if "%INTERVAL%"=="" set INTERVAL=5
set OUTFILE=%2
if "%OUTFILE%"=="" set OUTFILE=%~dp0monitor_mem.log

echo Monitoring Memory every %INTERVAL% seconds. Output: %OUTFILE%
echo --- Memory monitor started at %date% %time% --- >> "%OUTFILE%"

:loop
for /f "tokens=2 delims==" %%a in ('wmic OS get FreePhysicalMemory /value ^| find "FreePhysicalMemory"') do set FREEKB=%%a
for /f "tokens=2 delims==" %%a in ('wmic OS get TotalVisibleMemorySize /value ^| find "TotalVisibleMemorySize"') do set TOTALKB=%%a
set /a USEDKB=%TOTALKB% - %FREEKB%
set /a PERCENT=%USEDKB% * 100 / %TOTALKB%
set /a FREEMB=%FREEKB% / 1024
set /a TOTALMB=%TOTALKB% / 1024
echo %date% %time% Used: %USEDKB% KB (%PERCENT%%%) Free: %FREEMB% MB / Total: %TOTALMB% MB >> "%OUTFILE%"
timeout /t %INTERVAL% >nul
goto loop
