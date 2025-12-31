<<<<<<< HEAD
<<<<<<< HEAD
# vagrant の基本操作
## 高頻度利用コマンド
|No.|コマンド説明|コマンド|
|:---:|:---|:---|
|1.|ディレクトリ（新規プロジェクトフォルダ）を作成する|`mkdir <test>`|
|2.|使いたいベースを指定し、Vagrantfileを作成する|`vagrant init generic/alpine318`|
|3.|Vagrantfileを編集する|`-`|
=======
# vagrant の基本手順
=======
# vagrant の基本操作
## vagrant の基本手順
>>>>>>> dev
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|templateフォルダをコピーしてリネームする|テンプレートのフォルダをコピーして、利用したいboxと関連する作業フォルダを作成する|
|2.|リネームしたフォルダ内のconf.iniを編集する|vmの構成を考える。|
|3.|Generate_Vagrantfile.ps1を実行し、vagrantfileを作成する|実行することで、vagrantfileを生成するプログラムを実行する。|
>>>>>>> dev
|4.|仮想マシンの起動|`vagrant up`|
|5.|仮想マシンの状態確認|`vagrant status`|
|6.|仮想マシンにログイン|`vagrant ssh default`|

<<<<<<< HEAD
<<<<<<< HEAD
## 仮想マシンの操作
|コマンド説明|コマンド|
|:---|:---|
|仮想マシンの起動|`vagrant up`|
|仮想マシンへの接続|`vagrant ssh default`|
|仮想マシンのステータス確認|`vagrant status`|
|仮想マシンのグローバルステータス確認|`vagrant global-status`|
|仮想マシンの停止|`vagrant halt`|
|仮想マシンの一時停止|`vagrant suspend`|
|仮想マシンの一時停止から復帰|`vagrant resume`|
|仮想マシンの再起動|`vagrant reload`|
|仮想マシンの削除(boxは消えない)|`vagrant destroy`|

## boxの操作
|コマンド説明|コマンド|
|:---|:---|
|boxの一覧|`vagrant box list`|
|boxの削除|`vagrant box remove <boxName>`|
=======
# 時刻の設定 (chrony)
## 1. chronyのインストール
=======
## vagrant libvirt 環境の構築
|説明|コマンド|
|:---|:---|
|libvirtの依存関係のインストール|`sudo apt install -y libvirt-daemon-system libvirt-clients qemu-kvm libvirt-dev`|
|vagrant-libvirtのインストール|`vagrant plugin install vagrant-libvirt`|
|vagrantのプラグインの確認|`vagrant plugin list`|
|ユーザーをvagrant/docker/kvmグループに追加|`sudo usermod -aG libvirt,kvm,docker $USER`|

## postgresqlのインストール
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|アプリのインストール|`sudo dnf install -y postgresql-server postgresql-contrib`|
|2.|初期化|`sudo /usr/bin/postgresql-setup --initdb`|
|3.|サービス起動と有効化|`sudo systemctl enable --now postgresql`|``
|4.|パスワードのランダム設定して設定|`PASS=$(openssl rand -base64 16) sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$PASS';" echo "生成した postgres ロールのパスワード: $PASS"`|
|5.|ログイン確認|`sudo -u postgres psql`|
|6.|ログイン確認|`psql -h localhost -U postgres -W`|


## 時刻の設定 (chrony)
### 1. chronyのインストール
>>>>>>> dev
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|chronyのインストール|`sudo dnf install chrony`|
|2.|chronyの自動起動有効化|`sudo systemctl enable --now chronyd`|
|3.|chronyのデーモン起動確認|`sudo systemctl status chronyd`|

### 2. chronyの設定変更
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
>>>>>>> dev
