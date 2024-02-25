# Docker コマンドリスト
### Dockerへログイン
```bash
docker login -u {Username}
```
# イメージの操作
### Docker hubからレジストリ検索
```bash
docker search 検索キーワード
```
### Docker hubからレジストリ検索
```bash
docker pull 検索キーワード
```
### イメージ一覧の表示
```bash
docker image ls -a
```
### イメージを実行してコンテナを作成
```bash
docker run イメージ名
```
### イメージからコンテナを作成し、バックグラウンドで起動する
```bash
docker run -itd -p <hostSidePort>:<containerSidePort> --name <new_container_name>
```
-i	コンテナの標準入力にアタッチ  
-t	疑似ターミナルを割り当て  
-d	コンテナをバックグラウンドで実行 (デタッチドモード)  
-p	コンテナのポートをローカルに公開 (ポートのマッピング)   
--name	コンテナに名前をつける  
# コンテナ操作
### コンテナ一覧の表示
```bash
docker container ls -a
```
### コンテナの削除
```bash
docker container rm {CONTAINER ID/NAMES}
```
※ 強制削除の場合は、オプション「-f」を付ける  
### コンテナの起動
```bash
docker start {CONTAINER ID/NAMES}
```
### コンテナの停止
```bash
docker stop {CONTAINER ID/NAMES}
```
### コンテナ名の変更
```bash
docker rename <old_contener_name> <new_contener_name>
```
### コンテナのOSへログイン
```bash
docker exec -it {CONTAINER ID/NAMES} /bin/bash
```
