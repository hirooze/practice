#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker {dockerの実行権限を付与したいユーザー名}
systemctl enable docker
systemctl start docker
echo "***** Install Status *****"
yum repolist
docker -v
if [ -x "$(command -v /usr/local/bin/docker-compose)" ]; then
    /usr/local/bin/docker-compose -v
else
    echo "docker-compose is not installed or not found in PATH"
fi
cat /etc/group | grep docker
systemctl status docker
