@echo off
@echo|set /p="BATCH FILE  : " & echo %~n0
@echo|set /p="CREATE DATE : " & dir /q /tc %~dp0 |findstr %~n0
@echo|set /p="LAST UPDATE : " & dir /q /tw %~dp0 |findstr %~n0
echo %date% %time% START PROCCESSING
REM DEFINITION OF PROCESSING
set path=%~dp0
start explorer %path:~0,-7%
echo %date% %time% EXIT PROCESSING
