# Hyper-V コマンドリスト
### Transcript ログ取得開始
```bash
Start-TranScript -Path D:\<指定のフォルダ>\$(date -f yyyyMMdd-Hmmss).log
```
### vHDタイプの表示
```bash
(Get-VM).vmid | Get-VHD | Select-Object VhdFormat,vhdtype,path,size | Format-Table -autosize
```
### 固定vHDの作成
```bash
New-VHD -Path "D:\<指定のフォルダ>\<vhdxファイル名>.vhdx" -SizeBytes 128GB -Fixed
```
### 可変vHDの作成
```bash
New-VHD -Path "D:\<指定のフォルダ>\<vhdxファイル名>.vhdx" -SizeBytes 128GB -Dynamic
```
### 差分vHDの作成
```bash
New-VHD -Path "D:\<指定のフォルダ>\<親vhdxファイル名>.vhdx" -Path  "D:\<指定のフォルダ>\<vhdxファイル名>.vhdx" -Differencing
```
### 既存vHDに紐づくVM新規作成(第一世代)
```bash
New-VM -Name "ホスト名" -VHDPath "D:\<指定のフォルダ>\<vhdxファイル名>.vhdx" -MemoryStartupBytes 4096MB -SwitchName "Default Switch" -Generation 1
```
起動メモリは4GBに設定、利用ネットワークは既存の"Default Switch"を利用する。  
### プロセッサ一覧を表示
```bash
Get-VM | Get-VMProcessor | Format-Table -autosize
```
### プロセッサ(vCPU)を1つに設定する。
```bash
Set-VMProcessor "VM名" -Count 1
```
### メモリの設定情報を確認する
```bash
Get-VM | Get-VMMemory | Format-Table -autosize
```
### メモリの設定を変更する。
```bash
Set-VMMemory -VMName "VM名" -DynamicMemoryEnabled $true -StartupBytes 4096MB -MinimumBytes 512MB -MaximumBytes 8192MB
```
### ドライブ設定の一覧表示
```bash
Get-VM | Get-VMDvdDrive | Format-Table -autosize
```
### ISOイメージをマウントする。
```bash
Add-VMDvdDrive -VMName "VM名" -ControllerNumber 0 -Path "D:\<任意のフォルダ>\<OSイメージファイル>.iso"
```
### boot順序の表示(第一世代)
```bash
Get-VMBios -VMName "VM名"
```
### boot順をdriveから起動するよう変更する。（第一世代）
```bash
Set-VMDvdDrive -VMName "VM名" -ControllerNumber 1 -ControllerLocation 0 -Path "D:\<任意のフォルダ>\<OSイメージファイル>.iso"
```
### VMの起動 
```bash
Start-VM -Name "VM名"
```
### チェックポイントの作成 
```bash
Checkpoint-VM -Name "VM名"
```
### チェックポイントの一覧
```bash
Get-VMSnapshot -VMName "VM名"
```
### Default SwitchのIPアドレスの確認
```bash
Get-NetIPAddress -InterfaceAlias "vEthernet (Default Switch)" -AddressFamily "IPv4"
```
### Default SwitchのIPアドレスの設定 (自動でIPアドレスが変わってしまった時)
```bash
New-NetIPAddress -IPAddress "192.168.48.1" -PrefixLength "24" -InterfaceAlias "vEthernet (Default Switch)"
```
# その他対応
### vHDのエラーチェック
```bash
Test-VHD -Path "D:\<指定のフォルダ>\<vhd名>.vhdx"
```
True	：問題なし  
False	：問題あり  
### OSイメージのアンマウント
```bash
Get-VM -Name "VM名" | Get-VMDvdDrive | Set-VMDvdDrive -Path $null
```
### 追加ドライブの削除
```bash
Remove-VMDvdDrive -VMName "VM名" -ControllerNumber 0 -ControllerLocation 1
```
### VMの強制停止
```bash
Stop-VM -Name "VM名" -Force
```
### VMの削除
```bash
Remove-VM -Name "VM名" -Force
```
