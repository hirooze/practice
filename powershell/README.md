# Powershell コマンドリスト
## Powershell実行環境設定コマンド
|説明|コマンド|
|---|---|
|Powershellの実行設定を確認|`Get-ExecutionPolicy -List`|
|Powershellの実行を許可に変更（一時的`）|`Set-ExecutionPolicy RemoteSigned -Scope Process -Force`|
|Powershellの実行を許可に変更（永続的）|`Set-ExecutionPolicy RemoteSigned Process -Force`|

## よく使うコマンドの短縮コマンド
|説明|コマンド|短縮コマンド|備考|
|---|---|---|---|
|ディレクトリの移動|`Set-Location`|`cd`|異なるドライブの移動も可|
|ディレクトリ内のファイル一覧表示|`Get-Childitem`|`dir,ls`|よく使うオプション `-Filter`|
|ファイルの参照|`Get-Content`|`cat`|よく使うオプション `-Encoding UTF8`|
|オブジェクトを選択|`Select-Object`|`select`||
|選択するオブジェクトの条件を追加する|`Where-Object`|`where`||
|オブジェクトの繰り返し条件を追加|`ForEach-Object {}`|`% {}`||
|オブジェクトのソート|`Sort-Object`|`sort`|よく使うオプション `-Uniqe`|
|対象文字列の抽出|`Select-String`|`sls`|よく使うオプション `-Pattern`|
|ファイルの移動|`Move-Item`|`mv`||
|ファイルの削除|`Remove-Item`|`rm`||
|時間の確認|`Get-Date`|`date`|よく使うオプション `-Format 'yyyyMMdd'`|
|文字列の表示|`Write-Output`|`echo`||

## ステータス確認用短縮コマンド
|説明|コマンド|短縮コマンド|
|---|---|---|
|プロセスの一覧表示|`Get-Process`|`ps`|
|プロセスの停止|`Stop-Process`|`kill`|
|ローカルユーザー情報の取得|`Get-LocalUser`|`glu`|
|ローカルグループ情報の取得|`Get-LocalGroup`|`glg`|
|サービスの一覧表示|`Get-Service`|`gsv`|
|Webページのリクエスト確認|`Invoke-WebRequest`|`wget,curl`|
|ポートの疎通確認|`Test-NetConnection`|`tnc`|

## ステータス確認コマンド
|説明|コマンド|
|---|---|
|環境変数の表示|`ls env:`|
|自分のローカルIPの確認|`Get-NetIPAddress \| where { ($_.AddressFamily -eq 'IPv4') -and ($_.InterfaceAlias -eq 'Wi-Fi')} \| select -Property IPAddress`|
|ディレクトリ内のファイルで、100MB以上のファイルを検索し、一番容量の多いファイルを検索する。（プロパティ表示を除外して対象ファイルのみ表示する)|`ls \| where {$_.Length -ge '1000000'} \| sort Length -Descending \| select -First 1 \| select -ExpandProperty Name`|
|ファイルの容量の表示形式を変更する|`ls \| where { $_.Length -ge '10000000' } \| ft Name, @{Label="Length(MB)";Expression={"{0:N2} MB" -f ($_.Length / 1MB) }}`|
|特定のURLの応答を確認する|`wget -Uri "https://example.com" -UseBasicParsing`|
|ポートの疎通確認|`tnc -ComputerName <IPアドレス> -Port <ポート番号>`|
|検索した結果をZIP圧縮する|`Compress-Archive ( ls \| select -ExpandProperty Name \| sort ) -DestinationPath 'test.zip'`|
|ファイルの余計な行を除外して表示する。|`cat -Path <ログファイル>.log -Encoding UTF8 \| % {$_ -replace '^\[.*?\]\s*' , '' }`|

