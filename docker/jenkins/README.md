# Jenkins Docker Compose Setup

このディレクトリには、JenkinsをDocker Composeで実行するための設定ファイルが含まれています。

## 概要

このセットアップでは、Jenkins LTS (JDK11) をDockerコンテナで実行します。Jenkinsのデータを永続化するためにDockerボリュームを使用しています。

## 前提条件

- Docker がインストールされていること
- Docker Compose がインストールされていること

## セットアップ

1. このディレクトリに移動します：
   ```
   cd ./practice/docker/jenkins
   ```

2. 初期セットアップスクリプトを実行します：
   ```
   ./setup-jenkins.sh
   ```
   このスクリプトは、Jenkinsの初期設定ファイルとプラグインリストを生成します。

## 実行方法

Jenkinsを起動するには、以下のコマンドを実行します：

```
docker-compose up -d
```

- `-d` オプションでバックグラウンドで実行します。

## アクセス方法

Jenkinsにアクセスするには、ブラウザで以下のURLを開きます：

- http://localhost:8080

初回アクセス時には、セットアップウィザードが表示されます。初期パスワードはコンテナのログから取得できます：

```
docker-compose logs jenkins
```

ログに表示されるパスワードを使用してログインしてください。

## 停止方法

Jenkinsを停止するには、以下のコマンドを実行します：

```
docker-compose down
```

## ボリュームの管理

Jenkinsのデータは `jenkins_home` ボリュームに保存されます。データを保持したままコンテナを再作成するには、ボリュームを削除せずに `docker-compose up -d` を実行してください。

ボリュームを削除してデータをクリアするには：

```
docker-compose down -v
```

## トラブルシューティング

- ポート8080が既に使用されている場合、docker-compose.ymlのポートマッピングを変更してください。
- Jenkinsのログを確認するには：`docker-compose logs -f jenkins`

## 追加情報

- Jenkinsのバージョン：LTS JDK11
- タイムゾーン：Asia/Tokyo
- 公開ポート：8080 (Web UI), 50000 (JNLP)