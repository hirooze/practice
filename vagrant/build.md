# vagrant の基本手順
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|templateフォルダをコピーしてリネームする|テンプレートのフォルダをコピーして、利用したいboxと関連する作業フォルダを作成する|
|2.|リネームしたフォルダ内のconf.iniを編集する|vmの構成を考える。|
|3.|Generate_Vagrantfile.ps1を実行し、vagrantfileを作成する|実行することで、vagrantfileを生成するプログラムを実行する。|
|4.|仮想マシンの起動|`vagrant up`|
|5.|仮想マシンの状態確認|`vagrant status`|
|6.|仮想マシンにログイン|`vagrant ssh default`|

# 時刻の設定 (chrony)
## 1. chronyのインストール
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|chronyのインストール|`sudo dnf install chrony`|
|2.|chronyの自動起動有効化|`sudo systemctl enable --now chronyd`|
|3.|chronyのデーモン起動確認|`sudo systemctl status chronyd`|
## 2. chronyの設定変更
設定ファイルを開く
```bash
sudo vi /etc/chrony.conf
```
 設定最上部にを以下を追記する  
`server ntp.nict.jp iburst`
```
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (https://www.pool.ntp.org/join.html).
pool 2.rhel.pool.ntp.org iburst
```
```
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (https://www.pool.ntp.org/join.html).
#pool 2.rhel.pool.ntp.org iburst
server ntp.nict.jp iburst
```
<table>
    <tr>
        <th>No.</th>
        <th>説明</th>
        <th>コマンド</th>
    </tr>
    <tr>
        <td>1</td>
        <td>設定後にデーモンの再起動</td>
        <td>sudo systemctl restart chronyd</td>
    </tr>
    <tr>
        <td rowspan="2" >2</td>
        <td rowspan="2" >時刻同期を確認</td>
        <td>chronyc tracking</td>
    </tr>
    <tr>
        <td>chronyc sources</td>
    </tr>
    <tr>
        <td>3</td>
        <td>システムの時間を確認</td>
        <td>timedatectl</td>
    </tr>
    <tr>
        <td>4</td>
        <td>タイムゾーンを日本時間（Asia/Tokyo）に変更</td>
        <td>sudo timedatectl set-timezone Asia/Tokyo</td>
    </tr>
    <tr>
        <td>5</td>
        <td>時間出力確認</td>
        <td>date</td>
    </tr>
</table>
