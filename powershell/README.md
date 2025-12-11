# Powershell コマンドリスト
## Powershellの実行設定を確認
```bash
Get-ExecutionPolicy -List
```
## Powershellの実行を許可に変更（一時的）
```bash
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
```
## Powershellの実行を許可に変更（永続的）
```bash
Set-ExecutionPolicy RemoteSigned Process -Force
```
## Targetポートが開いているか確認
```bash
Test-NetConnection -ComputerName <IPアドレス> -Port <ポート番号>
```
## ディレクトリ内の更新日付が、2025/10/01 ~ 2025/10/31 のファイルを検索する。（プロパティ表示を除外して対象ファイルのみ表示する)
```bash
Get-ChildItem | Where-Object { ($_.LastWriteTime -ge '2025-10-01') -and ($_.LastWriteTime -le '2025-10-31')}  | Select-Object -ExpandProperty Name
```

## ディレクトリ内のファイルで、100MB以上のファイルを検索し、一番容量の多いファイルを検索する。（プロパティ表示を除外して対象ファイルのみ表示する)
```bash
Get-ChildItem | Where-Object {$_.Length -ge '1000000'} | Sort-Object Length -Descending | Select-Object -First 1 | Select-Object -ExpandProperty Name
```
## 検索した結果をZIP圧縮する
```bash
Compress-Archive ( Get-ChildItem | Select-Object -ExpandProperty Name | sort ) -DestinationPath 'test.zip'
```
## ファイルの余計な行を除外して表示する。
```bash
Get-Content -Path <ログファイル>.log -Encoding UTF8 | ForEach-Object {$_ -replace '^\[.*?\]\s*' , '' }
```
