# Zabbix Docker Compose Setup

このディレクトリには、ZabbixをDocker Composeで実行するための設定ファイルが含まれています。

## 概要

このセットアップでは、Zabbix Server、Web UI、Agent、およびMySQLデータベースをDockerコンテナで実行します。Zabbixはオープンソースの監視ソフトウェアです。

## 前提条件

- Docker がインストールされていること
- Docker Compose がインストールされていること

## 実行方法

Zabbixを起動するには、以下のコマンドを実行します：

```
docker-compose up -d
```

- `-d` オプションでバックグラウンドで実行します。

## アクセス方法

Zabbix Webインターフェースにアクセスするには、ブラウザで以下のURLを開きます：

- http://localhost:8080

デフォルトのログイン情報：
- ユーザー名: Admin
- パスワード: zabbix

## 停止方法

Zabbixを停止するには、以下のコマンドを実行します：

```
docker-compose down
```

## ボリュームの管理

MySQLのデータは `zabbix_mysql_data` ボリュームに保存されます。データを保持したままコンテナを再作成するには、ボリュームを削除せずに `docker-compose up -d` を実行してください。

ボリュームを削除してデータをクリアするには：

```
docker-compose down -v
```

## サービス概要

- **zabbix-mysql-server**: MySQLデータベース
- **zabbix-server**: Zabbixサーバー (ポート10051)
- **zabbix-web**: Zabbix Web UI (ポート8080)
- **zabbix-agent**: Zabbixエージェント (ホスト監視用)

## トラブルシューティング

- ポート8080または10051が既に使用されている場合、docker-compose.ymlのポートマッピングを変更してください。
- コンテナのログを確認するには：`docker-compose logs -f [サービス名]`
- 初回起動時はデータベースの初期化に時間がかかる場合があります。

## セキュリティ注意

- この設定は開発/テスト環境向けです。本番環境ではパスワードを強力なものに変更し、適切なセキュリティ設定を行ってください。
- Zabbix Agentはprivilegedモードで実行されており、ホストのファイルシステムにアクセスします。