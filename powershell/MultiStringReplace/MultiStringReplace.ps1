<# Windows PowerShell Program #>
## 保存場所
# カレントディレクトリに出力
$path           = Split-Path -Parent $MyInvocation.MyCommand.Path

# コンフィグファイル名の指定
$ConfigFile     = "SetPattern.conf" 

$impFolder      = $path + "\imp"
$impconf        = $path + "\" + $ConfigFile
$outFolder      = $path
$ImpRepPatterns = Import-Csv -Path $impconf -Encoding utf8

# impフォルダ内のテキストファイルを取得
$impFiles       = Get-ChildItem -Path $impFolder -Filter *.txt

foreach ($impFile in $impFiles) {
    $ImpReptext = Get-Content -Path $impFile.FullName -Encoding utf8
    # 変換後のデータを格納するための配列
    $outputData = @()

    # 各行の文字列を置換
    foreach ($row in $ImpReptext) {
        $originalValue = $row

        foreach ($pattern in $ImpRepPatterns) {
            if ($originalValue -like "*$($pattern.before)*") {
                # 文字列に指定したパターンが含まれている場合に置換
                $originalValue = $originalValue -replace [regex]::Escape($pattern.before), $pattern.after
            }
        }
        # 変換後の行を配列に追加
        $outputData += $originalValue
    }
    # 出力先のファイルパスを組み立て
    $outputFilePath = Join-Path -Path $outFolder -ChildPath $impFile.Name

    # 変換後のデータを新しいテキストファイルに書き込む
    $outputData | Out-File -FilePath $outputFilePath -Encoding utf8

    # 処理が完了したらメッセージを表示
    Write-Host "File Replaced. $($impFile.Name)                 `t出力先: $($outputFilePath)"
}