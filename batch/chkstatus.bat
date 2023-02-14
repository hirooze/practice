@echo off
rem #========================================
rem # program : Check PC Resource Status
rem #========================================

echo %date% %time% START PROCCESSING
REM DEFINITION OF PROCESSING
echo OS INFO
wmic os get caption,csdversion,servicepackmajorversion
echo CPU INFO
wmic cpu get name,serialnumber,status
echo MEM INFO
wmic computersystem get totalphysicalmemory
echo DISK INFO
wmic logicaldisk get caption,freespace,size,status
echo %date% %time% EXIT PROCESSING
pause
