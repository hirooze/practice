<# Windows Power Shell テンプレート #>
## 保存場所
# カレントディレクトリに出力
$path           = Split-Path -Parent $MyInvocation.MyCommand.Path
$impconf        = $path + "\" + "setup.conf"
$imptxt         = $path + "\" + "imp.txt"
$exptxt         = $path + "\" + "output.txt"
$ImpRepPatterns = Import-Csv -Path $impconf -Encoding utf8
$ImpReptext     = Get-Content -Path $imptxt -Encoding utf8

$outputData = @()
## ログ取得開始
#Start-TranScript -Path $output\log_$dt.log
# 処理内容
# 変換後のデータを格納するための配列
# 各行の文字列を置換
foreach ($row in $ImpReptext) {
    $originalValue = $row

    for ($i = 0; $i -lt $ImpRepPatterns.Count; $i++) {
        $pattern = $ImpRepPatterns[$i].before
        $replace = $ImpRepPatterns[$i].after

        if ($originalValue -like "*$pattern*") {
            # 文字列に指定したパターンが含まれている場合に置換
            $originalValue = $originalValue -replace [regex]::Escape($pattern), $replace
        }
    }
    # 変換後の行を配列に追加
    $outputData += $originalValue
}
# 変換後のデータを新しいテキストファイルに書き込む
$outputData | Out-File -FilePath $exptxt
# 変換後のファイルを表示
Get-Content $exptxt
## ログ取得終了
#Stop-Transcript