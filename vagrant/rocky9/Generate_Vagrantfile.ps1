<#
.SYNOPSIS
    conf.ini ファイルを読み込み、Vagrantfile を自動生成するスクリプト。

.DESCRIPTION
    - conf.ini をセクションごとにパースし、コメントや空行を除外
    - VM、RESOURCE、STORAGE、NETWORK の各設定を抽出
    - VirtualBox 用の Vagrantfile を構築（ストレージ設定含む）
    - 出力先は ./Vagrantfile（UTF-8）

.NOTES
    - STORAGE セクションは複数ディスクに対応
    - provider が virtualbox の場合のみストレージ設定を追加
#>

$iniPath = ".\conf.ini"
$iniContent = Get-Content $iniPath -Raw

# セクションごとに分割
$sections = ($iniContent -split "\r?\n(?=\[)").Where({$_ -match "^\["})

# パース用ハッシュテーブル
$config = @{}

foreach ($section in $sections) {
    if ($section -match "^\[(\w+)\]") {
        $sectionName = $matches[1]
        if ($sectionName -eq "STORAGE") {
            $config[$sectionName] = @()
        } else {
            $config[$sectionName] = @{}
        }

        $lines = $section -split "\r?\n" | Where-Object {
            $_ -notmatch "^\s*(#|;)" -and $_.Trim() -ne ""
        }

        $disk = $null
        foreach ($line in $lines[1..($lines.Length - 1)]) {
            if ($line -match "^\s*-\s*disk\s+\d+") {
                $disk = @{}
                $config["STORAGE"] += ,$disk
            } elseif ($line -match "^\s*(\w+):\s*(.+)$") {
                $key = $matches[1]
                $value = $matches[2].Trim()
                if ($sectionName -eq "STORAGE" -and $disk) {
                    $disk[$key] = $value
                } else {
                    $config[$sectionName][$key] = $value
                }
            }
        }
    }
}

# Vagrantfileの生成
$vagrantfile = @"
Vagrant.configure("2") do |config|
  config.vm.box = "${($config["VM"]["box"])}"
  config.vm.hostname = "${($config["VM"]["hostname"])}"
  config.vm.provider "${($config["VM"]["provider"])}" do |v|
    v.memory = ${($config["RESOURCE"]["mem"])}
    v.cpus = ${($config["RESOURCE"]["cpus"])}
  end

  config.vm.network "${($config["NETWORK"]["name"])}", ip: "${($config["NETWORK"]["ip"])}"
"@

# ストレージ設定（VirtualBoxのみ）
if ($config["VM"]["provider"] -eq "virtualbox" -and $config["STORAGE"]) {
    $vagrantfile += "`n  config.vm.provider :virtualbox do |vb|"
foreach ($disk in $config["STORAGE"]) {
    $name = $disk["name"]
    $size = [int]$disk["size"] * 1024

    if ($disk["type"] -eq "Fixed") {
        $variant = "fixed"
    } else {
        $variant = "dynamic"
    }

    $vagrantfile += "`n    vb.customize ['createhd', '--filename', '${name}.vdi', '--size', ${size}, '--variant', '${variant}']"
    $vagrantfile += "`n    vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', '${name}.vdi']"
    }
    $vagrantfile += "`n  end"
}   
$vagrantfile += "`nend"

# 出力
$vagrantfile | Set-Content -Encoding UTF8 ".\Vagrantfile"
Write-Host "✅ Vagrantfile を生成しました。"