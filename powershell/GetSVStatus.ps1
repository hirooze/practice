<# Windows Power Shell テンプレート #>
$HWInfo = Get-WmiObject Win32_ComputerSystemProduct
$BiosInfo = Get-CimInstance -ClassName Win32_BIOS
$OSInfo = Get-WmiObject Win32_OperatingSystem
$CPUInfo = Get-WmiObject Win32_Processor
$Total = 0
$MEMInfo = Get-WmiObject Win32_PhysicalMemory | % {$Total += $_.Capacity}[int]($Total/1GB)

Write-Output $HWInfo
Write-Output $BiosInfo
Write-Output $OSInfo
Write-Output $CPUInfo
Write-Output $MEMInfo