# 初期構築コマンドリスト
### Firewallの設定の表示(sudoの実行可能有無の確認)
```bash
sudo firewall-cmd --list-all
```
### グループ情報の表示
```bash
cat /etc/group
```
### wheelグループへ登録する(root実行権限を持つグループ)
```bash
usermod -G wheel <ユーザ名>
```
## SSH によるリモートログインの有効化
### sshdサービスが起動しているか確認
```bash
systemctl status sshd
```
### openssh-server の導入
```bash
sudo yum -y install openssh-server
```
### SSHデーモンを起動
```bash
sudo systemctl start sshd
```
### SSHデーモンの自動起動を有効化
```bash
sudo systemctl enable sshd
```
### SSHデーモンの自動起動を有効化
```bash
sudo systemctl enable sshd
```
### Firewallの設定の表示
```bash
sudo firewall-cmd --list-all
```
### Firewallにssh接続許可設定を追加する
```bash
sudo firewall-cmd --zone=public --add-service=ssh --permanent
```
### Firewallをリロードする
```bash
sudo firewall-cmd --reload
```
### IPアドレス、MACアドレスの確認
```bash
ip a
```