# Docker 初期構築手順(Linux)
## 0.Dockerインストールシェルの実行(dockerSetup.sh)
|No.|説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|dockerSetup.shを編集する|{dockerの実行権限を付与したいユーザー名}にdockerを操作するユーザー名を入力する。|
|2.|dockerSetup.shを環境にコピーする|構築環境にファイル転送などでコピーする|
|3.|実行権限を付与する|`chmod +x dockerSetup.sh`|
|4.|実行権限を付与されたことを確認する|`ls -l`|
|5.|プログラムを実行する|`sudo ./dockerSetup.sh`|
|6.|グループ情報をリロードする|`newgrp docker`|

## install されるもの  
 - Docker  
 - Docker-Compose  
実行後に「***** Install Status *****」の欄に実行の不備がないことを確認する。  

## 1. Dockerインストール (以下手動インストール手順)
|No.|説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|yum-utilsのインストール|`sudo yum install -y yum-utils `|
|2.|dockerのリポジトリ登録|`sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo`|
|3.|リポジトリ一覧の確認|`yum repolist`|
|4.|dockerのインストール|`sudo yum install -y docker-ce docker-ce-cli containerd.io`|
|5.|インストールしたdockerのバージョン確認|`sudo docker -v`|
|6.|Docker Composeのインストール|`sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`|
|7.|docker-composeの実行権限を付与|`sudo chmod +x /usr/local/bin/docker-compose`|
|8.|Docker Composeのバージョン情報を表示|`docker-compose -v`|
## 2. ローカルのユーザー権限設定
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|グループの確認|`sudo cat /etc/group`|
|2.|dockerグループの作成（作成済みの場合は不要）|`sudo groupadd docker`|
|3.|dockerグループにログインユーザーを追加する|`sudo usermod -aG docker $USER`|
|4.|dockerグループの再読み込み|`newgrp docker`|
### 3. dockerサービスの設定
|No.|説明|コマンド|
|:---:|:---|:---|
|1.|サービスの動作確認|`sudo systemctl status docker`|
|2.|自動起動を有効化する|`sudo systemctl enable docker`|
|3.|サービスを起動する|`sudo systemctl start docker`|
