@echo off
@echo|set /p="BATCH FILE  : " & echo %~n0
@echo|set /p="CREATE DATE : " & dir /q /tc %~dp0 |findstr %~n0
@echo|set /p="LAST UPDATE : " & dir /q /tw %~dp0 |findstr %~n0
echo %date% %time% START PROCCESSING
REM DEFINITION OF PROCESSING
set path= %~dp0
set time2=%time: =0%
set dt=%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%
set mdir=%date:~0,4%%date:~5,2%
setlocal
for /f "usebackq delims=" %%a in (`dir /b %path% *.csv`) do set importfile=%%a
for /F "tokens=6 delims=:," %%a in (%importfile%) do (
 echo %%a >> datelist_%dt%.txt
)
echo %date% %time% EXIT PROCESSING
pause
