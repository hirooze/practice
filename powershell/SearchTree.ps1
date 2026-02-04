# Example 
# .\SearchTree.ps1 "target.txt"   # 引数あり
# .\SearchTree.ps1                # 引数なし → 入力待ち
#
#
# ファイル名の取得（引数または入力）
if ($args.Count -gt 0 -and $args[0]) {
    $FileName = $args[0]
    Write-Host "Using argument: $FileName"
} else {
    $FileName = Read-Host "Enter the file name to search"
}

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
            Write-Host "$part"
        } else {
            Write-Host "$($Indent)└$part"
        }
        if ($i -lt $PathParts.Count - 1) {
            $Indent += "  "
        }
    }
}