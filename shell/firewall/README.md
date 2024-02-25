# firewall コマンドリスト
### Firewallの設定
```bash
sudo firewall-cmd --list-all
```
### Firewallをリロードする
```bash
sudo firewall-cmd --reload
```
### TCP 5901の通信許可を追加する
```bash
sudo firewall-cmd --permanent --add-port=5901/tcp --zone=public
```
### TCP 5901の通信許可を削除する
```bash
sudo firewall-cmd --permanent --remove-port=5901/tcp --zone=public
```
### cockpitのサービスの通信許可を追加する
```bash
sudo firewall-cmd --permanent --add-service=cockpit
```
### dhcpv6-clientサービスの通信許可を削除する
```bash
sudo firewall-cmd --permanent --remove-service=dhcpv6-client
```