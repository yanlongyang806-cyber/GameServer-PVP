@echo off
chcp 65001 >nul
echo ========================================
echo   自动创建 GitHub 仓库并推送
echo ========================================
echo.

cd /d I:\wdym\GameServer-PVP

echo 检查 GitHub CLI...
gh --version >nul 2>&1
if errorlevel 1 (
    echo GitHub CLI 未安装，使用手动方式...
    goto manual_setup
)

echo GitHub CLI 已安装！
echo.
echo 请先登录 GitHub:
echo gh auth login
echo.
set /p continue=是否已登录？(Y/N): 
if /i not "%continue%"=="Y" (
    echo 请先运行: gh auth login
    pause
    exit
)

echo.
echo 正在创建 GitHub 仓库...
gh repo create GameServer-PVP --public --source=. --remote=origin --push

if errorlevel 1 (
    echo.
    echo 创建失败，可能的原因:
    echo 1. 仓库已存在
    echo 2. 未登录 GitHub
    echo 3. 网络问题
    echo.
    goto manual_setup
) else (
    echo.
    echo ========================================
    echo   成功！
    echo ========================================
    echo.
    echo 仓库地址: https://github.com/%USERNAME%/GameServer-PVP
    echo.
    echo GitHub Actions 会自动开始编译！
    echo 请到仓库的 Actions 页面查看。
    echo.
    pause
    exit
)

:manual_setup
echo.
echo ========================================
echo   手动创建仓库步骤
echo ========================================
echo.
echo 1. 打开浏览器，访问:
echo    https://github.com/new
echo.
echo 2. 填写信息:
echo    仓库名: GameServer-PVP
echo    描述: GameServer with Full Map PVP
echo    选择: Public (公开) 或 Private (私有)
echo    不要勾选: Initialize this repository with...
echo.
echo 3. 点击 "Create repository"
echo.
echo 4. 复制仓库地址（例如: https://github.com/用户名/GameServer-PVP.git）
echo.
pause

echo.
set /p repo_url=请输入仓库地址: 

if "%repo_url%"=="" (
    echo 错误: 仓库地址不能为空
    pause
    exit
)

echo.
echo 正在添加远程仓库...
git remote remove origin 2>nul
git remote add origin %repo_url%

echo.
echo 正在设置分支...
git branch -M main

echo.
echo 正在推送代码...
git push -u origin main

if errorlevel 1 (
    echo.
    echo 推送失败！请检查:
    echo 1. 仓库地址是否正确
    echo 2. 是否有推送权限
    echo 3. 是否需要身份验证
    echo.
    echo 如果使用 HTTPS，可能需要输入用户名和 Personal Access Token
    echo 如果使用 SSH，请确保已配置 SSH 密钥
) else (
    echo.
    echo ========================================
    echo   推送成功！
    echo ========================================
    echo.
    echo 仓库地址: %repo_url%
    echo.
    echo GitHub Actions 会自动开始编译！
    echo 请到仓库的 Actions 页面查看编译进度。
    echo.
)

pause

