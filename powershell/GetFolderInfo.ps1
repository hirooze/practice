<# Windows Power Shell GetFolderInfo #>

## 初期値設定
$dt=date -f yyyyMMddHHmmss

## 保存場所
# カレントディレクトリに出力
$output = Convert-Path .
# デスクトップに出力
#$output = [System.Enviroment]::Get-FolderPath("Desktop")
# 指定のフォルダに出力
#$output = 

## 情報取得対象フォルダ (<$output>を任意のフォルダパスに変更する。)
$target = $output

#出力ファイル名（指定した任意のフォルダ名を自動指定）
$filename = (Get-Item $target).Name

## ログ取得開始
Start-Transcript -Path $output\log_$dt.log

# 処理内容
Get-Childitem -Recurse $target | Select-Object FullName,CreationTime,LastWriteTime,LastaccessTime,Length | Export-Csv -NoTypeInformation -Encoding Default $output\$filename-$dt.csv

## ログ取得終了
stop-transcript
pause