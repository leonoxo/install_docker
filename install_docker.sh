#!/bin/bash

# 增加錯誤處理：任何指令失敗時立即退出
set -e

echo "開始執行 Docker 安裝與設定優化腳本..."
echo "-------------------------------------------"

# 檢查 Docker 是否已經安裝
if command -v docker &> /dev/null; then
    echo "✅ 偵測到 Docker 已安裝。"
    docker --version
    echo "無需重複安裝。如果需要重新安裝，請先手動移除舊版本。"
    exit 0
fi

# 步驟 1: 更新套件並安裝依賴
echo "⚙️  步驟 1/5: 更新套件列表並安裝必要的依賴..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# 步驟 2: 新增 Docker 的官方 GPG 金鑰
echo "🔑 步驟 2/5: 新增 Docker 的官方 GPG 金鑰..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 步驟 3: 設定 Docker 的 APT 倉庫
echo "📦 步驟 3/5: 設定 Docker 的 APT 倉庫..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 步驟 4: 安裝 Docker 引擎
echo "🐳 步驟 4/5: 安裝 Docker 引擎..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 步驟 5: 執行安裝後設定 (將目前使用者加入 docker 群組)
echo "👤 步驟 5/5: 將目前使用者 '$USER' 加入 'docker' 群組..."
if getent group docker > /dev/null; then
    sudo usermod -aG docker $USER
    echo "已成功加入群組。"
else
    echo "警告: 'docker' 群組不存在。跳過此步驟。"
fi

echo "-------------------------------------------"
echo "🎉 Docker 安裝成功完成！"
echo ""
echo "⚠️  重要提示："
echo "為了讓群組變更生效，您需要【完全登出後再重新登入】，"
echo "或是開啟一個新的終端機視窗。"
echo "之後您就可以直接使用 'docker' 指令，而不需要 'sudo'。"
echo "您可以執行 'docker run hello-world' 來驗證安裝是否成功。"
