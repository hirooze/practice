# Example 
# .\SearchTree.ps1 "target.txt"   # ��������
# .\SearchTree.ps1                # �����Ȃ� �� ���͑҂�
#
#
# �t�@�C�����̎擾�i�����܂��͓��́j
if ($args.Count -gt 0 -and $args[0]) {
    $FileName = $args[0]
    Write-Host "Using argument: $FileName"
} else {
    $FileName = Read-Host "Enter the file name to search"
}

# �t�@�C�������i�ċA�I�j
$FoundFile = Get-ChildItem -Path (Get-Location) -Recurse -File -Filter $FileName | Select-Object -First 1

if (-not $FoundFile) {
    Write-Host "File Not Found."
    exit
}

# �t���p�X�Ɛe�t�H���_�̎擾
$FullPath = $FoundFile.FullName
$TargetDir = $FoundFile.Directory.FullName
Write-Host "Result: $FullPath"

# �p�X����
$PathParts = $TargetDir -split '[\\]'

# �c���[�\���i2�K�w�ڂ��� ���A���C���f���g��1�i�󂭁j
$Indent = ""
for ($i = 0; $i -lt $PathParts.Count; $i++) {
    $part = $PathParts[$i]
    if ($part -ne "") {
        if ($i -eq 0) {
            Write-Host "$part"
        } else {
            Write-Host "$($Indent)��$part"
        }
        if ($i -lt $PathParts.Count - 1) {
            $Indent += "  "
        }
    }
}