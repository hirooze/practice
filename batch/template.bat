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

pause
