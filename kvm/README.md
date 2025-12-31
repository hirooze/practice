# libvirt コマンドリスト
## 利用頻度の高いコマンド
|説明|コマンド|
|:---|:---|
|仮想マシンの一覧表示|`virsh list --all`|
|仮想マシンの起動|`virsh start <仮想マシン名>`|
|仮想マシンの停止|`virsh shutdown <仮想マシン名>`|
|仮想マシンにコンソール接続|`virsh console <仮想マシン名>`|
|仮想マシンにコンソール接続|`virsh vncdisplay <仮想マシン名>`|
|仮想マシンの強制停止|`virsh destroy <仮想マシン名>`|
|仮想マシンの一時停止|`virsh suspend <仮想マシン名>`|
|仮想マシンの再開|`virsh resume <仮想マシン名>`|
|仮想マシンのIPアドレス確認|`virsh domifaddr <仮想マシン名>`|
|仮想マシンのマウント確認|`virsh domblklist <仮想マシン名>`|
|インストールメディアのアンマウント|`virsh change-media <仮想マシン名> sda --eject `|
|仮想マシンの削除|`virsh undefine <VM名> --remove-all-storage`|


## インストールメディアのアンマウント
|説明|コマンド|
|:---|:---|
|仮想マシンの一覧表示|`virsh list --all`|
|仮想マシンの停止|`virsh shutdown <仮想マシン名>`|
|仮想マシンの強制停止|`virsh destroy <仮想マシン名>`|
|仮想マシンのマウント確認|`virsh domblklist <仮想マシン名>`|
|インストールメディアのアンマウント|`virsh change-media <仮想マシン名> sda --eject `|
|仮想マシンの起動|`virsh start <仮想マシン名>`|
|仮想マシンにコンソール接続|`virsh vncdisplay <仮想マシン名>`|

## 設定コマンド
|説明|コマンド|
|:---|:---|
|仮想マシンの情報取得|`virsh dominfo <仮想マシン名>`|
|仮想マシンの設定出力|`virsh dumpxml <仮想マシン名>`|
|仮想マシンの設定を定義したXMLをインポート|`virsh define <仮想マシン名>`|
|仮想マシンのCPU数の変更|`virsh setvcpu <仮想マシン名> <cpu数> `|
|仮想マシンの自動起動の設定|`virsh autostart <仮想マシン名>`|
|仮想マシンの自動起動の設定|`virsh autostart --disable <仮想マシン名>`|

