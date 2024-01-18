<# Windows Power Shell テンプレート #>
## 初期値設定
$dt=Get-date -f yyyyMMddHHmmss
## 保存場所
# カレントディレクトリに出力
$output = Convert-Path .
# デスクトップに出力
#$output = [System.Enviroment]::Get-FolderPath("Desktop")
# 指定のフォルダに出力
#$output = 

## ログ取得開始
#Start-TranScript -Path $output\log_$dt.log

# 処理内容
Write-Output $output
Write-Output $dt

## ログ取得終了
#Stop-Transcript
pause