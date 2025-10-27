# ファイルパスの定義
$tagFile = "Generate_Vagrant.conf"
$configFile = "conf.ini"
$outputFile = "Vagrantfile"

# conf.ini の読み込みと解析
$config = @{}
Get-Content $configFile | ForEach-Object {
    if ($_ -match '^\s*([^#;].*?):\s*(.+)$') {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()
        $config[$key] = $value
    }
}

# Generate_Vagrant.conf の tag.<value> を抽出
$tags = @()
Get-Content $tagFile | ForEach-Object {
    if ($_ -match 'tag\.(\w+)') {
        $tags += $matches[1]
    }
}

# Vagrantfile のテンプレート構築
$vagrantContent = @"
Vagrant.configure("2") do |config|
"@

foreach ($tag in $tags) {
    if ($config.ContainsKey($tag)) {
        $vagrantContent += "  config.vm.${tag} = `"$($config[$tag])`"`n"
    } else {
        Write-Warning "conf.ini に '$tag' の値が見つかりませんでした。"
    }
}

$vagrantContent += "end`n"

# Vagrantfile の出力
$vagrantContent | Set-Content -Encoding UTF8 -Path $outputFile
Write-Host "Vagrantfile を生成しました: $outputFile"