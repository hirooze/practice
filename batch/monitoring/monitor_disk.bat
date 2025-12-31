@echo off
rem monitor_disk.bat - ドライブ容量モニタ
rem 使い方: monitor_disk.bat [interval_seconds] [output_file]

setlocal

set INTERVAL=%1
if "%INTERVAL%"=="" set INTERVAL=60
set OUTFILE=%2
if "%OUTFILE%"=="" set OUTFILE=%~dp0monitor_disk.log

echo Monitoring disks every %INTERVAL% seconds. Output: %OUTFILE%
echo --- Disk monitor started at %date% %time% --- >> "%OUTFILE%"

:loop
rem PowerShellでドライブ一覧(DriveType=3: ローカルディスク)を取得し、日時付きで出力
powershell -NoProfile -Command 'Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object { $used = $_.Size - $_.FreeSpace; $pct = if ($_.Size -ne 0) {[math]::Round($used*100/$_.Size,2)} else {0}; $freeMB=[math]::Round($_.FreeSpace/1MB,2); $totalMB=[math]::Round($_.Size/1MB,2); $ts=(Get-Date).ToString("yyyy-MM-dd HH:mm:ss"); Write-Output ("$ts $_.DeviceID Used:{0:N0}B ({1}%) Free:{2}MB Total:{3}MB" -f $used, $pct, $freeMB, $totalMB) }' >> "%OUTFILE%"

timeout /t %INTERVAL% >nul
goto loop
