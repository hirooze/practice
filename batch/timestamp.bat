@echo off
rem #========================================
rem # program : TimeStamp
rem #========================================
echo %date% %time% START PROCCESSING

rem ----------------
rem  DEFINE THE TIMESTAMP
rem ----------------
set time2=%time: =0%
set dt=%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%

echo ----------------
echo  TIMESTSMP : %dt%
echo ----------------
echo %date% %time% EXIT PROCESSING
pause
