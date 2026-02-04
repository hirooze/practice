@echo off
rem #========================================
rem # program : Open Explorer
rem #========================================
echo %date% %time% START PROCCESSING
REM DEFINITION OF PROCESSING
set path=%~dp0
start explorer %path:~0,-7%
echo %date% %time% EXIT PROCESSING
