# ファイル名の取得（引数または入力）
if ($args.Count -gt 0 -and $args[0]) {
    $FileName = $args[0]
    #Write-Host "Using argument: $FileName"

    # ファイル検索（再帰的）
    $FoundFile = Get-ChildItem -Path (Get-Location) -Recurse -File -Filter $FileName | Select-Object -First 1

    if (-not $FoundFile) {
        Write-Host "File Not Found."
        exit
    }

    # フルパスと親フォルダの取得
    $FullPath = $FoundFile.FullName
    $TargetDir = $FoundFile.Directory.FullName
    Write-Host "Result: $FullPath"

    # パス分解
    $PathParts = $TargetDir -split '[\\]'

    # ツリー表示（2階層目から ┗、かつインデントを1段浅く）
    $Indent = ""
    for ($i = 0; $i -lt $PathParts.Count; $i++) {
        $part = $PathParts[$i]
        if ($part -ne "") {
            if ($i -eq 0) {
                Write-Host "   $part"
            } else {
                Write-Host "$($Indent)└─$part"
            }
            if ($i -lt $PathParts.Count - 1) {
                $Indent += "   "
            }
        }
    }

    # ファイル名を末尾に追加（インデントを1段深く）
    $Indent += "   "
    Write-Host "$($Indent)└─$($FoundFile.Name)"

} else {
    # 引数なし → カレントディレクトリのツリー表示
    $CurrentDir = Get-Location
    $PathParts = $CurrentDir.Path -split '[\\]'

    $Indent = ""
    for ($i = 0; $i -lt $PathParts.Count; $i++) {
        $part = $PathParts[$i]
        if ($part -ne "") {
            switch ($i) {
            0 { Write-Host "   $part" }
            1 { Write-Host "└─$part" }
            default { Write-Host "$($Indent)└─$part" }
            }
        if ($i -ge 1) {
            $Indent += "   "
            }
        }
    }

    # カレントディレクトリがファイルなら表示（通常はディレクトリなので省略可能）
    if ((Test-Path $CurrentDir.Path -PathType Leaf)) {
        $Indent += "   "
        Write-Host "$($Indent)└─($CurrentDir.Path | Split-Path -Leaf)"
    }
}