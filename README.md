# Docker 一鍵安裝腳本 (適用於 Debian/Ubuntu)

這是一個優化過的 Shell 腳本，用於在基於 Debian 的 Linux 發行版（如 Ubuntu）上自動化安裝 Docker Engine。

腳本設計的核心理念是**安全**、**高效**與**使用者友好**。

## ✨ 功能亮點

- **冪等性設計**：腳本會自動檢查 Docker 是否已安裝。如果已安裝，則會提示並安全退出，避免重複執行。
- **錯誤即停**：在執行過程中，任何指令失敗都會立即中止腳本，防止系統進入不確定的狀態。
- **自動化權限設定**：安裝完成後，會自動將目前使用者加入 `docker` 群組，讓您無需 `sudo` 即可直接執行 Docker 指令。
- **清晰的步驟指引**：腳本的每一步都有明確的輸出，讓您清楚了解安裝進度。
- **遵循官方最佳實踐**：使用 Docker 官方推薦的 GPG 金鑰儲存方式，確保安裝來源的安全性。

## 🚀 如何使用

1.  **一鍵安裝**

    您只需要在終端機中執行以下指令，即可自動下載並執行安裝腳本：
    ```bash
    curl -fsSL https://raw.githubusercontent.com/leonoxo/install_docker/main/install_docker.sh | sudo bash
    ```
    > **或者**，您也可以透過 `git` 複製本專案後手動執行：
    > ```bash
    > git clone https://github.com/leonoxo/install_docker.git
    > cd install_docker
    > chmod +x install_docker.sh
    > ./install_docker.sh
    > ```

2.  **重新登入**

    安裝完成後，您需要**完全登出後再重新登入**，或開啟一個新的終端機視窗，以讓使用者群組的變更生效。

5.  **驗證安裝**

    執行以下指令來確認 Docker 是否安裝成功並可正常運作：
    ```bash
    docker run hello-world
    ```
    如果看到 "Hello from Docker!" 的訊息，代表您已成功安裝！

