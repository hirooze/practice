# vagrant の基本手順
|No.|コマンド説明|コマンド|
|:---:|:---|:---|
|1.|ディレクトリ（新規プロジェクトフォルダ）を作成する|`mkdir <test>`|
|2.|使いたいベースを指定し、Vagrantfileを作成する|`vagrant init generic/alpine318`|
|3.|Vagrantfileを編集する|`-`|
|4.|仮想マシンの起動|`vagrant up`|
|5.|仮想マシンの状態確認|`vagrant status`|
|6.|仮想マシンにログイン|`vagrant ssh default`|

## 基本操作 仮想マシンの操作
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
## 基本操作 boxの操作
|コマンド説明|コマンド|
|:---|:---|
|boxの一覧|`vagrant box list`|
