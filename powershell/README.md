# Powershell コマンドリスト
### Powershellの実行設定を確認
```bash
Get-ExecutionPolicy -List
```
### Powershellの実行を許可に変更（一時的）
```bash
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
```
### Powershellの実行を許可に変更（永続的）
```bash
Set-ExecutionPolicy RemoteSigned Process -Force
```
### Targetポートが開いているか確認
```bash
Test-NetConnection -ComputerName <IPアドレス> -Port <ポート番号>
```

