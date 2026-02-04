# Docker コマンドリスト
## 基礎操作
|説明|コマンド|
|:---|:---|
|Dockerへログイン|`docker login -u {Username}`|
|Docker hubからレジストリ検索|`docker search 検索キーワード`|
|DockerイメージのPull|`docker pull 検索キーワード`|
|Dockerイメージ一覧の表示|`docker image ls -a`|
|Dockerイメージを実行してコンテナ作成|`docker run イメージ名`|
|Dockerイメージからコンテナを作成し、バックグラウンドで起動する|`docker run -itd -p <hostSidePort>:<containerSidePort> --name <new_container_name>`|
|コンテナの一覧表示|`docker container ls -a`|
|コンテナの削除|`docker container rm {CONTAINER ID/NAMES}`|
|コンテナの強制削除|`docker container rm -f {CONTAINER ID/NAMES}`|
|コンテナの起動|`docker start {CONTAINER ID/NAMES}`|
|コンテナの停止|`docker stop {CONTAINER ID/NAMES}`|
|コンテナ名の変更|`docker rename <old_contener_name> <new_contener_name>`|
|コンテナのOSへのログイン|`docker exec -it {CONTAINER ID/NAMES} /bin/bash`|
|ポートマッピングの確認|`docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'`|

## Docker-Composeのコマンド
|説明|コマンド|
|:---|:---|
|Docker-Composeでコンテナを作成する|`docker-compose up -d`|
|Docker-Compose Projectで作成した全削除|`docker compose down --rmi all`|

## まとめて実行
|説明|コマンド|
|:---|:---|
|コンテナの一覧を表示|`docker ps -a --format "{{.ID}}\t{{.Names}}\t{{.Status}}" \|\| true`|
|イメージの一覧表示|`docker images -a --format "{{.ID}}\t{{.Repository}}:{{.Tag}}\t{{.Size}}" \|\| true`|
|Dockerボリュームの一覧表示|`docker volume ls -q \|\| true`|
|すべてのコンテナを削除する|`running=$(docker ps -q) if [ -n "$running" ]; then echo "Stopping running containers: $running"; docker stop $running; else echo "No running containers to stop."; fi all=$(docker ps -aq) if [ -n "$all" ]; then echo "Removing all containers: $all"; docker rm -f $all; else echo "No containers to remove."; fi echo "--finished--"`|
|すべてのコンテナイメージを削除する|`bash -lc 'imgs=$(docker images -aq); if [ -n "$imgs" ]; then echo "Removing all images: $imgs"; docker rmi -f $imgs; else echo "No images to remove."; fi; echo "--images-done--"'`|
|すべてのコンテナボリュームを削除する|`bash -lc 'vols=$(docker volume ls -q); if [ -n "$vols" ]; then echo "Removing all volumes: $vols"; docker volume rm $vols; else echo "No volumes to remove."; fi; echo "--volumes-done--"'`|



## イメージからコンテナを作成し、バックグラウンドで起動する
```bash
docker run -itd -p <hostSidePort>:<containerSidePort> --name <new_container_name>
```
-i	コンテナの標準入力にアタッチ  
-t	疑似ターミナルを割り当て  
-d	コンテナをバックグラウンドで実行 (デタッチドモード)  
-p	コンテナのポートをローカルに公開 (ポートのマッピング)   
--name	コンテナに名前をつける  
