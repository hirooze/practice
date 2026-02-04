@echo off
REM Event Log Monitoring Batch Script
REM This script monitors Windows Event Logs for errors and warnings

echo ========================================
echo Event Log Monitoring Started
echo ========================================

REM Set variables
set LOG_NAME=System
set EVENT_COUNT=20
set OUTPUT_FILE=eventlog_report.txt

REM Query the event log for errors and warnings in the last 24 hours
echo Querying %LOG_NAME% log for recent errors and warnings...
wevtutil qe %LOG_NAME% /q:"*[System[(Level=1 or Level=2 or Level=3) and TimeCreated[timediff(@SystemTime) <= 86400000]]]" /c:%EVENT_COUNT% /f:text > %OUTPUT_FILE%

REM Check if any events were found
for /f %%i in ('type %OUTPUT_FILE% ^| find /c "Event"') do set EVENT_COUNT_FOUND=%%i

if %EVENT_COUNT_FOUND% gtr 0 (
    echo Found %EVENT_COUNT_FOUND% error/warning events in the last 24 hours.
    echo Report saved to %OUTPUT_FILE%
    echo.
    echo Recent events:
    type %OUTPUT_FILE%
) else (
    echo No error or warning events found in the last 24 hours.
)

echo ========================================
echo Event Log Monitoring Completed
echo ========================================

pause