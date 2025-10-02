@echo off
chcp 65001
setlocal
rem #============================================
rem # program : Powershellファイル実行バッチ	#
rem #============================================
echo %date% %time% START PROCCESSING
REM DEFINITION OF PROCESSING
for %%f in (*.ps1) do (
    echo 実行中: %%f
    powershell -ExecutionPolicy Bypass -File "%%f"
)

endlocal
echo %date% %time% EXIT PROCESSING
pause
