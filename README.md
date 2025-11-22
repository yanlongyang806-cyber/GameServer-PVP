# GameServer - 全地图红名PK版本

这是游戏服务器的精简版本，包含全地图红名PK功能。

## 🎮 功能特性

✅ **全地图红名PK模式**
- 所有玩家进入游戏后互相显示为红名（敌对状态）
- 可以在全地图任何位置使用普通攻击和技能攻击其他玩家
- 移除了所有PK区域限制
- 移除了大部分PK限制条件

## 🛠️ 编译要求

- **Visual Studio 2022** (推荐) 或 Visual Studio 2019/2017
- **Windows SDK 10.0**
- **C++ 桌面开发工作负载**

## 📦 编译步骤

### 方法一：使用 Visual Studio

1. 打开 `CoreGameServer.sln`
2. 选择配置：`Debug | Win32`
3. 菜单：**生成(B)** → **生成解决方案**
4. 或按 `Ctrl+Shift+B`

### 方法二：使用命令行

```cmd
cd I:\wdym\GameServer-PVP
msbuild CoreGameServer.sln /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v143 /m
```

### 方法三：GitHub Actions 自动编译

推送到 GitHub 后，GitHub Actions 会自动编译：
1. 进入仓库的 "Actions" 标签
2. 查看编译进度
3. 下载编译好的文件

## 📂 输出文件

编译成功后，`GameServer.exe` 会在：
```
Core\bin\Debug\GameServer.exe
```

## ⚔️ PVP 修改说明

修改的文件：
- `CrossRoads\Common\Combat\Character_target.c` - 实体关系判断
- `CrossRoads\Common\pvp_common.c` - PVP相关函数

详细修改说明请查看：`全地图红名PK修改说明.md`

## 📁 项目结构

```
GameServer-PVP/
├── Core/                    # 游戏服务器核心代码
│   ├── GameServer/         # 主服务器项目
│   └── Common/             # 通用代码
├── CrossRoads/             # 游戏逻辑
│   ├── GameServerLib/      # 服务器库
│   └── Common/             # 通用逻辑（包含PVP修改）
├── libs/                     # 各种库
│   ├── AILib/              # AI库
│   ├── ContentLib/         # 内容库
│   ├── HttpLib/            # HTTP库
│   ├── ServerLib/          # 服务器库
│   ├── UtilitiesLib/       # 工具库
│   └── WorldLib/           # 世界库
├── PropertySheets/          # 项目属性表
├── 3rdparty/               # 第三方库
└── CoreGameServer.sln      # Visual Studio 解决方案
```

## 🚀 快速开始

### 推送到 GitHub

运行 `自动创建并推送.bat` 或 `推送到Git.bat`

### 本地编译

```cmd
cd I:\wdym\GameServer-PVP
msbuild CoreGameServer.sln /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v143 /m
```

## 📝 许可证

请根据原项目许可证使用。

## 🔧 技术支持

如有问题，请检查：
- Visual Studio 版本是否正确
- 所有依赖库是否完整
- 编译输出窗口的错误信息
- GitHub Actions 的编译日志

## 📚 相关文档

- `GIT设置说明.md` - Git 仓库设置说明
- `全地图红名PK修改说明.md` - PVP 功能详细说明
- `测试指南.md` - 测试步骤和验证清单
