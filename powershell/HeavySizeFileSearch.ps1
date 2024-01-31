# <Windows PowerShell HeavySizeFileSearch>
$ErrorActionPreference = "silentlycontinue"
$RootPath = "C:\"
$OutputCsvPath = ".\SortedFileList.csv"

# 1MB以上のファイルを取得
$Files = Get-ChildItem -Path $RootPath -File -Recurse | Where-Object {$_.Length -gt 1MB}

# プログレス バーの初期化
$TotalFiles = $Files.Count
$ProgressBarID = 1
$ProgressParams = @{
    Activity = "Searching Files"
    Status = "Initializing"
    PercentComplete = 0
    Id = $ProgressBarID
}

Write-Progress @ProgressParams

# カウンターの初期化
$FileProcessed = 0

foreach ($File in $Files) {
    # プログレス バーの更新
    $FileProcessed++
    $ProgressParams.Status = "Processing - File Count: $FileProcessed of $TotalFiles"
    $ProgressParams.PercentComplete = ($FileProcessed / $TotalFiles) * 100
    Write-Progress @ProgressParams

    # 各ファイルの処理ロジックはここに記述
    # 例: $File を使用してコンテンツの読み取りやファイルのコピー/移動などの操作を実行
    
    # プログレス バーが見やすくなるように短い間休止
    Start-Sleep -Milliseconds 100
}

# 結果をソートしてCSVにエクスポート
$SortedFiles = $Files | Select-Object Length, Name, DirectoryName | Sort-Object -Property Length -Descending
$SortedFiles | Export-Csv -Path $OutputCsvPath -NoTypeInformation -Encoding Default

# プログレス バーを完了させる
$ProgressParams.Status = "Completed"
$ProgressParams.PercentComplete = 100
Write-Progress @ProgressParams -Completed
