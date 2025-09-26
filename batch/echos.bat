@echo off
rem #========================================
rem # program : Echo Variations
rem #========================================
echo %date% %time% START PROCCESSING
REM DEFINITION OF PROCESSING
echo FileName                 : %~n0
echo FileName + ext           : %~nx0
echo ext                      : %~x0
echo FullPath                 : %~f0
echo Current Directory        : %~p0
echo Current Drive            : %~d0
echo Current Drive + Directory: %~dp0
echo %date% %time% EXIT PROCESSING
pause
