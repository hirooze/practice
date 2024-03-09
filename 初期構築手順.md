# git の初期構築手順
### git インストール
|No.|コマンド説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|既存gitの有無を確認|`git --version`|
|2.|既存のgitをアンインストール|`sudo yum remove -y git`|
|3.|必要な関連アプリのインストール1|`sudo yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel`|
|4.|必要な関連アプリのインストール2|`sudo yum install -y gcc perl-ExtUtils-MakeMaker`|
|5.|wgetのインストール|`sudo yum install -y wget`|
|6.|ディレクトリを変える|`cd /usr/src`|
|7.|最新版ダウンロード|`sudo wget https://github.com/git/git/archive/v2.34.1.tar.gz -O git-2.34.1.tar.gz`|
|8.|該当フォルダに移動する|`cd /usr/src/git-2.34.1`|
|9.|makeを実行する|`sudo make prefix=/usr/local all`|
|10.|installを実行する|`sudo make prefix=/usr/local install`|
|11.|gitのバージョンを確認する|`git --version`|
# git の初期設定
### git の初期設定
|No.|コマンド説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|作業ユーザーの名前の設定|`git config --global user.name @username`|
|2.|作業ユーザーのメールアドレスの設定|`git config --global user.email example@mail.com`|
|3.|設定されていることを確認する|`git config --global --list`|
|4.|コマンド出力に着色する|`git config --global color.ui auto`|
