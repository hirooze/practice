@echo off
@echo|set /p="BATCH FILE  : " & echo %~n0
@echo|set /p="CREATE DATE : " & dir /q /tc %~dp0 |findstr %~n0
@echo|set /p="LAST UPDATE : " & dir /q /tw %~dp0 |findstr %~n0
pause
echo %date% %time% START PROCCESSING
for /l %%i in (0,1,9) do (
 set /a array[%%i]=%%i+1
)
echo %array[1]%
echo %array[2]%
echo %array[9]%
pause
setlocal enabledelayedexpansion
set n=0
dir /b %~dp0 > filelist.txt
for /f %%s in (filelist.txt) do (
 set string[!n!]=%%s
 set /a n=n+1
)
echo %string[0]%
echo %string[1]%
echo %string[2]%
echo %string[3]%
echo %string[4]%
echo %string[5]%
endlocal
pause
del filelist.txt
echo CLEAR THE filelist.txt
echo %date% %time% EXIT PROCESSING
pause