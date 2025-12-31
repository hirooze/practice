@echo off
chcp 65001
setlocal
rem #============================================
rem # program : Powershellファイル実行バッチ	#
rem #============================================
YYYYMMDD=%date:~0,4%%date:~5,2%%date:~8,2%
HHMMSS=%time:~0,2%%time:~3,2%%time:~6,2%
for /f "tokens=1-4 delims=/ " %%a in ('dir /b *.ps1') do (
    powershell -ExecutionPolicy Bypass -File "%%f"
)

endlocal
echo %date% %time% EXIT PROCESSING
pause
