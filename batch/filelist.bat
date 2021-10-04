@echo off
@echo|set /p="BATCH FILE  : " & echo %~n0
@echo|set /p="CREATE DATE : " & dir /q /tc %~dp0 |findstr %~n0
@echo|set /p="LAST UPDATE : " & dir /q /tw %~dp0 |findstr %~n0
echo %date% %time% START PROCCESSING
set time2=%time: =0%
set dt=%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%
REM DEFINITION OF PROCESSING
dir /b %~dp0 | findstr .csv > filelist_%dt%.txt
echo %date% %time% EXIT PROCESSING
pause
