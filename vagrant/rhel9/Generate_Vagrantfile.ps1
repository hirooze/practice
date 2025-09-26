# conf.ini のパス
$iniPath = ".\conf.ini"

# iniファイルの読み込み関数
function Read-IniFile {
    param([string]$path)
    $ini = @{}
    $section = ""
    foreach ($line in Get-Content $path) {
        $line = $line.Trim()
        if ($line -match "^\[(.+)\]$") {
            $section = $matches[1]
            $ini[$section] = @{}
        } elseif ($line -match "^(.+?)\s*=\s*'(.+)'$") {
            $key, $value = $matches[1], $matches[2]
            $ini[$section][$key] = $value
        }
    }
    return $ini
}

# iniファイルを読み込む
$config = Read-IniFile -path $iniPath

# 各セクションの値を取得
$box      = $config["vm"]["box"]
$hostname = $config["vm"]["hostname"]
$provider = $config["vm"]["provider"]

$cpus = $config["System"]["cpus"]
$mem  = $config["System"]["mem"]

$netType = $config["Network"]["type"]
$ip      = $config["Network"]["ip"]

# Vagrantfile の内容を生成
$vagrantfile = @"
Vagrant.configure("2") do |config|
  config.vm.box = "$box"
  config.vm.hostname = "$hostname"
  config.vm.network "$netType", ip: "$ip"
  config.vm.provider "$provider" do |vb|
    vb.memory = $mem
    vb.cpus = $cpus
  end
end
"@

# Vagrantfile を出力
$vagrantfile | Set-Content -Path ".\Vagrantfile" -Encoding UTF8

Write-Host "✅ Vagrantfile を生成しました。次に実行するコマンド:"
Write-Host "vagrant up"