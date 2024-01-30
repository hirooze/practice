<# Windows Power Shell GetHostInfo #>
$path           = Split-Path -Parent $MyInvocation.MyCommand.Path
$dt             = Get-date -f yyyyMMddHHmmss
#=============#
# 取得情報設定 #
#=============#
$HWInfo         = Get-WmiObject Win32_ComputerSystemProduct
$computerSystem = Get-WmiObject Win32_ComputerSystem
$serverName     = $computerSystem.Name
$outputFile     = $path + "\" + $serverName + "_v" + $dt + ".txt"
$BiosInfo       = Get-CimInstance -ClassName Win32_BIOS
$OSInfo         = Get-WmiObject Win32_OperatingSystem
$osInfo         = Get-CimInstance Win32_OperatingSystem
$CPUInfo        = Get-WmiObject Win32_Processor
$MEMInfo        = Get-WmiObject -Class Win32_OperatingSystem
$DiskInfo       = Get-WmiObject -Class Win32_LogicalDisk
$NWDevInfo      = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object { $_.PhysicalAdapter -eq $true }
$ipv4Addresses  = Get-NetIPAddress | Where-Object { $_.IPAddress -match '^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$' -and $_.AddressFamily -eq 'IPv4' }
$updateList     = Get-HotFix
$userList       = Get-LocalUser
$domainInfo     = Get-WmiObject Win32_ComputerSystem
$routeInfo      = Get-NetRoute | Where-Object { $_.AddressFamily -eq 'IPv4' }
#===================#
# ログの出力開始設定 #
#===================#
Start-Transcript -Path $outputFile
#=========#
# 情報出力 #
#=========#
Write-Output "#=====================#"
Write-Output "# HardWare Infomation #"
Write-Output "#=====================#"
Write-Output "HostName          : $serverName"
Write-Output $HWInfo
Write-Output "#=================#"
Write-Output "# BIOS Infomation #"
Write-Output "#=================#"
Write-Output $BiosInfo
Write-Output "#===============#"
Write-Output "# OS Infomation #"
Write-Output "#===============#"
Write-Host "OS名          `t: $($osInfo.Caption)"
Write-Host "サービス パック`t: $($osInfo.ServicePackMajorVersion).$($osInfo.ServicePackMinorVersion)"
Write-Output $OSInfo
Write-Output "#===================#"
Write-Output "# Domain Infomation #"
Write-Output "#===================#"
Write-Host "ドメイン名    `t: $($domainInfo.Domain)"
Write-Output "#================#"
Write-Output "# CPU Infomation #"
Write-Output "#================#"
Write-Output $CPUInfo
Write-Output "#===================#"
Write-Output "# Memory Infomation #"
Write-Output "#===================#"
Write-Host "利用可能な物理メモリ               `t: $($MEMInfo.FreePhysicalMemory)`tKB"
Write-Host "ページングファイルの利用可能なサイズ`t: $($MEMInfo.FreeSpaceInPagingFiles)`tKB"
Write-Host "ページングファイルの合計サイズ      `t: $($MEMInfo.SizeStoredInPagingFiles)`tKB"
Write-Host "コミットされている仮想メモリ        `t: $($MEMInfo.TotalVirtualMemorySize)`tKB"
Write-Host "利用可能な仮想メモリ                `t: $($MEMInfo.FreeVirtualMemory)`tKB"
Write-Output "#==================#"
Write-Output "# Disk Infomation #"
Write-Output "#==================#"
foreach ($disk in $DiskInfo) {
    Write-Host "デバイスID      `t: $($disk.DeviceID)"
    Write-Host "ボリューム名    `t: $($disk.VolumeName)"
    Write-Host "ファイルシステム`t: $($disk.FileSystem)"
    Write-Host "トータルサイズ  `t: $($disk.Size / 1GB)`tGB"
    Write-Host "空き容量        `t: $($disk.FreeSpace / 1GB)`tGB"
    Write-Host "-------------------------"
}
Write-Output "#===========================#"
Write-Output "# Network Device Infomation #"
Write-Output "#===========================#"
foreach ($device in $NWDevInfo) {
    Write-Host "デバイス名    `t: $($device.Name)"
    Write-Host "デバイスタイプ`t: $($device.AdapterType)"
    Write-Host "MACアドレス   `t: $($device.MACAddress)"
    Write-Host "状態          `t: $($device.NetConnectionStatus)"
    Write-Host "-------------------------"
}
Write-Output "#=======================#"
Write-Output "# IP Address Infomation #"
Write-Output "#=======================#"
foreach ($ipv4Address in $ipv4Addresses) {
    Write-Host "インターフェース`t: $($ipv4Address.InterfaceAlias)"
    Write-Host "IPv4アドレス    `t: $($ipv4Address.IPAddress)"
    Write-Host "-------------------------"
}
Write-Output "#==========================#"
Write-Output "# Network Route Infomation #"
Write-Output "#==========================#"
foreach ($route in $routeInfo) {
    Write-Host "目的ネットワーク`t: $($route.DestinationPrefix)"
    Write-Host "次のホップ      `t: $($route.NextHop)"
    Write-Host "インターフェース`t: $($route.InterfaceAlias)"
    Write-Host "メトリック      `t: $($route.RouteMetric)"
    Write-Host "-------------------------"
}
Write-Output "#=======================#"
Write-Output "# Applied KB Infomation #"
Write-Output "#=======================#"
foreach ($update in $updateList) {
    $formattedDate = $update.InstalledOn.ToString("yyyy/MM/dd")
    Write-Host "KB番号`t: $($update.HotFixID)"
    Write-Host "説明  `t: $($update.Description)"
    Write-Host "適用日`t: $formattedDate"
    Write-Host "-------------------------"
}
Write-Output "#=================#"
Write-Output "# User Infomation #"
Write-Output "#=================#"
foreach ($user in $userList) {
    Write-Host "ユーザー名`t: $($user.Name)"
    Write-Host "フルネーム`t: $($user.FullName)"
    Write-Host "所有権限  `t: $($user.PrincipalSource)"
    Write-Host "-------------------------"
}
#===============#
# ログの出力終了 #
#===============#
Stop-Transcript