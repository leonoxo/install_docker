#!/bin/bash

# 更新套件列表並安裝必要的套件
sudo apt update
sudo apt install -y ca-certificates curl

# 建立用於存放 Docker 的 GPG 金鑰的目錄並下載金鑰
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 將 Docker 存儲庫添加到 Apt 源列表中
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 再次更新套件列表以包含 Docker 套件
sudo apt update

# 安裝 Docker 套件
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker 安裝成功完成。"
