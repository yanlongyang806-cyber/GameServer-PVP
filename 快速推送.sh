#!/bin/bash
# 快速推送到 GitHub

cd /i/wdym/GameServer-PVP

echo "正在添加远程仓库..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/yanlongyang806-cyber/GameServer-PVP.git

echo "正在设置分支为 main..."
git branch -M main

echo "正在推送代码..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "  推送成功！"
    echo "========================================"
    echo ""
    echo "仓库地址: https://github.com/yanlongyang806-cyber/GameServer-PVP"
    echo ""
    echo "GitHub Actions 会自动开始编译！"
    echo "请访问: https://github.com/yanlongyang806-cyber/GameServer-PVP/actions"
    echo ""
else
    echo ""
    echo "推送失败！可能需要身份验证。"
    echo "请使用 Personal Access Token 作为密码。"
    echo "创建 Token: https://github.com/settings/tokens"
    echo ""
fi







