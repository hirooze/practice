<# Windows Powershell Program MlutiDelimitersCut #>
# impフォルダ内の全てのテキストファイルに対して処理を繰り返る
Get-ChildItem -Path ".\imp\*.txt" | ForEach-Object {
    # 入力ファイルのパス
    $filePath = $_.FullName

    # 出力ファイルのパス
    $outputFileName = "output_$($_.BaseName).txt"
    $outputFilePath = ".\$outputFileName"

    # テキストを読み込んで行ごとに分割
    $textData = Get-Content $filePath

    # 各行をデリミタ「,」で分割し、2番目の列を抽出
    $outputData = $textData | ForEach-Object { $_ -split ',' | Select-Object -Index 1 }

    # 出力ファイルに結果を書き込み
    $outputData | Out-File -FilePath $outputFilePath

    # 結果を表示（省略可能）
    $outputData
}
