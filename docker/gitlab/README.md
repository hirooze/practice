# GitLab Docker Compose Setup

このディレクトリには、GitLabをDocker Composeで構築するためのファイルが含まれています。

## 概要

GitLabは、Gitリポジトリ管理、CI/CD、プロジェクト管理などの機能を備えたDevOpsプラットフォームです。このセットアップでは、GitLab Community Edition (CE) をDockerコンテナで実行します。

## 前提条件

- Dockerがインストールされていること
- Docker Composeがインストールされていること
- 十分なシステムリソース（メモリ4GB以上推奨）

## 起動方法

1. このディレクトリに移動します：
   ```
   cd ./practice/docker/gitlab
   ```

2. GitLabを起動します：
   ```
   docker-compose up -d
   ```

初回起動時はGitLabの初期化に10-15分程度かかる場合があります。

## アクセス方法

- GitLab Web UI: http://localhost:8080
- SSHアクセス: localhost:2222

## 初期設定

1. ブラウザで http://localhost:8080 にアクセスします。
2. 初期パスワードは以下のファイルに保存されています：
   ```
   ./logs/gitlab/initial_root_password
   ```
3. ユーザー名: root でログインします。
4. 初回ログイン後、パスワードを変更してください。

## 停止方法

```
docker-compose down
```

## データ永続化

以下のディレクトリにGitLabのデータが保存されます：
- `./config`: GitLab設定ファイル
- `./logs`: GitLabログファイル
- `./data`: GitLabデータ（リポジトリ、データベースなど）

## 注意事項

- ポート8080, 8443, 2222が他のサービスで使用されていないことを確認してください。
- 本番環境では、external_urlを適切なドメインに変更し、SSL証明書を設定してください。
- 定期的にバックアップを取得することを推奨します。

## トラブルシューティング

- GitLabが起動しない場合：`docker-compose logs` でログを確認してください。
- メモリ不足の場合：Docker Desktopのメモリ割り当てを増やしてください。

## バージョン情報

- GitLab CE: latest
- Docker Compose: 3.6