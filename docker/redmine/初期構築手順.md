# Docker on Redmine 初期構築手順(Linux)
### Redmineインストール
|No.|コマンド説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|最新のredmineのイメージをpull|`docker pull redmine:latest`|
|2.|mysql5.7をpull|`docker pull mysql:5.7`|
|3.|mysqlコンテナを起動し、データベースを作成|`docker run -d --name redmine-mysql -e MYSQL_ROOT_PASSWORD=my_password -e MYSQL_DATABASE=redmine mysql:5.7`|
|4.|RedmineのDockerコンテナを起動|`docker run -d --name my-redmine -p 3000:3000 --link redmine-mysql:mysql redmine`|
|5.|SSH転送を設定する|`localPort:3000,remoteIP:<IP Address>,remotePort:3000`|
|6.|ブラウザでURLを開く|`http://localhost:3000`|
