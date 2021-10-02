@echo off
@echo|set /p="BATCH FILE  : " & echo %~n0
@echo|set /p="CREATE DATE : " & dir /q /tc %~dp0 |findstr %~n0
@echo|set /p="LAST UPDATE : " & dir /q /tw %~dp0 |findstr %~n0
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
