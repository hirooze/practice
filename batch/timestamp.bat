@echo off
echo ----------------
echo  BATCH FILE
echo ----------------
echo %~n0
echo ----------------
echo  CREATE DATE
echo ----------------
dir /q /tc %~dp0 |findstr %~n0
echo ----------------
echo  LAST UPDATE
echo ----------------
dir /q /tw %~dp0 |findstr %~n0

rem ----------------
rem  DEFINE THE TIMESTAMP
rem ----------------

set time2=%time: =0%
set dt=%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%

echo ----------------
echo  TIMESTSMP : %dt%
echo ----------------
pause
