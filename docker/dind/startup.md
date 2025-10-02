# Docker in Docker 初期構築手順(Linux)
### dind の構築 
|No.|コマンド説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|dindのコンテナを作成（管理権限）|`docker run -it --rm --privileged --name dind -d docker:20-dind`|
|2.|コンテナにコンソールログイン|`docker exec -it dind sh`|
|3.|コンテナ内のdockerプロセス実行確認|`docker ps`|
|4.|docker-composeの動作確認。なければ要インストール|`docker-comopse -v`|

### dind(Centos7) の構築 
|No.|コマンド説明|CentOS 7 コマンド|
|:---:|:---|:---|
|1.|dockerのインストール|https://github.com/hirooze/practice/blob/master/docker/%E5%88%9D%E6%9C%9F%E6%A7%8B%E7%AF%89%E6%89%8B%E9%A0%86.md#1-docker%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB-%E4%BB%A5%E4%B8%8B%E6%89%8B%E5%8B%95%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%89%8B%E9%A0%86|
|2.|サービスのリンクを作成|`systemctl enable --now docker`|
|3.|dockerの動作確認|`docker ps`|
