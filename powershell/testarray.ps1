<# Windows Power Shell テンプレート #>

## 初期値設定
$dt=date -f yyyyMMddHHmmss

## 保存場所
# カレントディレクトリに出力
$output = Convert-Path .
# デスクトップに出力
#$output = [System.Enviroment]::Get-FolderPath("Desktop")
# 指定のフォルダに出力
#$output = 

## ログ取得開始
Start-TranScript -Path $output\log_$dt.log

# 処理内容
$impcsv = $output
#配列テスト
$testArray = @(
@{No='1';Name='test1';Age='17'}
@{No='2';Name='test2';Age='18'}
@{No='3';Name='test3';Age='19'}
)
$CustomObjects =  $testArray | ForEach-Object { 
    [PSCustomObject]@{
    'なんばー'  = $_.No
    'Name'= $_.Name
    'Age' = $_.Age
    }
}
$html = $CustomObjects
echo $html

#$testArray | ForEach-Object { $_.No, $_.Name ,$_.Age}| Format-Table -Property No -Wrap -AutoSize | ConvertTo-Html > C:\Users\hiroo\Desktop\test.html

## ログ取得終了
Stop-Transcript
#pause