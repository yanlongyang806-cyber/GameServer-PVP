#!/bin/bash
# Git Bash 推送脚本

echo "========================================"
echo "  推送到 GitHub 仓库"
echo "========================================"
echo ""

# 切换到仓库目录
cd /i/wdym/GameServer-PVP

# 检查是否在正确的目录
if [ ! -d ".git" ]; then
    echo "错误: 当前目录不是 Git 仓库"
    echo "请确保在 GameServer-PVP 目录中"
    exit 1
fi

echo "当前目录: $(pwd)"
echo ""
echo "当前 Git 状态:"
git status
echo ""

# 检查是否已有远程仓库
if git remote | grep -q "origin"; then
    echo "已存在远程仓库:"
    git remote -v
    echo ""
    read -p "是否要更新远程地址？(y/n): " update
    if [ "$update" = "y" ] || [ "$update" = "Y" ]; then
        read -p "请输入新的仓库地址: " repo_url
        git remote set-url origin "$repo_url"
    fi
else
    echo "请输入你的 GitHub 仓库地址:"
    echo "示例: https://github.com/用户名/GameServer-PVP.git"
    read -p "仓库地址: " repo_url
    
    if [ -z "$repo_url" ]; then
        echo "错误: 仓库地址不能为空"
        exit 1
    fi
    
    echo ""
    echo "正在添加远程仓库..."
    git remote add origin "$repo_url"
fi

echo ""
echo "正在设置分支为 main..."
git branch -M main

echo ""
echo "正在推送代码到远程仓库..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "  推送成功！"
    echo "========================================"
    echo ""
    echo "GitHub Actions 会自动开始编译！"
    echo "请到仓库的 Actions 页面查看编译进度。"
    echo ""
else
    echo ""
    echo "推送失败！可能的原因:"
    echo "1. 需要身份验证（用户名和 Personal Access Token）"
    echo "2. 网络问题"
    echo "3. 仓库地址错误"
    echo ""
    echo "如果使用 HTTPS，GitHub 现在需要 Personal Access Token 而不是密码"
    echo "请访问: https://github.com/settings/tokens"
    echo ""
fi

