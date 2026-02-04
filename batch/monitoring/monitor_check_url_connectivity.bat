@echo off
REM URL Connectivity Check Batch Script
REM This script checks the connectivity to a specified URL

REM Get URL from command line argument
set url=%1

if "%url%"=="" (
    echo Error: No URL provided.
    echo Usage: %0 ^<URL^>
    goto end
)

REM Use PowerShell to test HTTP connectivity
powershell -Command "try { $response = Invoke-WebRequest -Uri '%url%' -TimeoutSec 10 -UseBasicParsing; Write-Host 'Success: HTTP Status Code' $response.StatusCode } catch { Write-Host 'Failed:' $_.Exception.Message }" 2>nul

if %errorlevel% neq 0 (
    echo Failed: Unable to reach %url%
)

