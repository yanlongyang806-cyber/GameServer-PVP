@echo off
chcp 65001 >nul
echo ========================================
echo   推送到 Git 远程仓库
echo ========================================
echo.

cd /d I:\wdym\GameServer-PVP

echo 当前 Git 状态:
git status
echo.

echo 请选择操作:
echo 1. 添加远程仓库并推送
echo 2. 只推送代码（已有远程仓库）
echo 3. 查看远程仓库
echo 4. 退出
echo.

set /p choice=请输入选项 (1-4): 

if "%choice%"=="1" goto add_remote
if "%choice%"=="2" goto push_only
if "%choice%"=="3" goto show_remote
if "%choice%"=="4" goto end
goto end

:add_remote
echo.
echo 请输入你的 Git 仓库地址:
echo 示例: https://github.com/用户名/GameServer-PVP.git
echo 或: https://gitee.com/用户名/GameServer-PVP.git
echo.
set /p repo_url=仓库地址: 

if "%repo_url%"=="" (
    echo 错误: 仓库地址不能为空
    pause
    exit
)

echo.
echo 正在添加远程仓库...
git remote add origin %repo_url%
if errorlevel 1 (
    echo 警告: 远程仓库已存在，尝试更新...
    git remote set-url origin %repo_url%
)

echo.
echo 正在设置分支为 main...
git branch -M main

echo.
echo 正在推送代码到远程仓库...
git push -u origin main

if errorlevel 1 (
    echo.
    echo 推送失败！可能的原因:
    echo 1. 网络问题
    echo 2. 需要身份验证
    echo 3. 仓库地址错误
    echo.
    echo 请手动执行: git push -u origin main
) else (
    echo.
    echo 推送成功！
    echo.
    echo GitHub Actions 会自动开始编译！
    echo 请到仓库的 Actions 页面查看编译进度。
)
goto end

:push_only
echo.
echo 正在推送代码...
git push origin main
if errorlevel 1 (
    echo 推送失败，请检查远程仓库设置
    git remote -v
) else (
    echo 推送成功！
)
goto end

:show_remote
echo.
echo 当前远程仓库:
git remote -v
echo.
pause
goto end

:end
echo.
pause

