**简体中文** | [English](README.md)

# EnderLilies 皮肤Mod生成模版

用该项目可快速生成莉莉的自定义皮肤Mod（无需任何GUI操作）

## 环境要求
- Windows 10 或更高版本
- VS2019/2022 + C++ 工具集 + Win10 SDK
- UE 4.26.2
- Git（推荐安装）

## 使用步骤

### 0. 如何制作和实时预览皮肤效果可参考如下视频
[![换肤mod入门教程&工作流](https://i1.hdslb.com/bfs/archive/73e761a6ed5bd6e6f5f3e3c2e6610be9f17491b4.jpg)](https://www.bilibili.com/video/BV1vhPseYEDN)
> [!NOTE]
> 仅看 P1~P4 即可，P5 原本的繁琐GUI操作则可由本项目代替

### 1. 克隆本项目并调整 `UE 4.26.2` 路径

克隆本项目到本地：
```bash
git clone https://github.com/f14XuanLv/EnderLilies.SkinModTemplate.git
cd EnderLilies.SkinModTemplate
```

> [!TIP]
> 如果没有安装 Git，也可以直接在 GitHub 页面点击 **Code** → **Download ZIP** 下载项目压缩包并解压

修改脚本中的 UE 路径以匹配你的 UE 4.26.2 安装位置：

1. 打开 [`Scripts\build_and_package.bat`](Scripts/build_and_package.bat)，找到第 3 行：
   ```bat
   set "UEPATH=C:\Game\UE\UE_4.26"
   ```
   将路径改为你的 UE 4.26.2 实际安装路径，例如：
   ```bat
   set "UEPATH=C:\Program Files\Epic Games\UE_4.26"
   ```

2. 打开 [`Scripts\import_and_label.bat`](Scripts/import_and_label.bat)，同样找到第 3 行并修改路径

> [!IMPORTANT]
> 确保使用的是 **UE 4.26.2** 版本，其他版本可能导致兼容性问题
> 路径中不要包含中文字符或特殊符号

### 2. 替换皮肤纹理
将 `Content/_Zenith/Characters/p0001_Lily/Textures/p0001_Lily.png` 替换为你修改后的皮肤纹理 PNG, 注意贴图分辨率要保持 1024x256 大小（和项目原 PNG 分辨率一致）

### 3. 导入并生成标签
在 `EnderLilies.SkinModTemplate` 项目目录下打开 `CMD` 或者 `PowerShell`, 执行:
```bat
Scripts\import_and_label.bat
```
(自动导入 PNG、创建 ChunkId=1 的 PrimaryAssetLabel)

### 4. 编译/打包并收集 chunk1
上一步完成后, 继续执行:
```bat
Scripts\build_and_package.bat
```
(输出 `dist\EnderLilies_SkinModTemplate\EnderLilies_SkinModTemplate_0_P.*`, 若 chunk1 为空会提示)

> [!TIP]
> 如果需要重新制作皮肤 Mod，可以使用 `git clean -fdx` 命令将项目恢复到初始状态。
> 该命令会删除所有未跟踪的文件和目录（包括 `.gitignore` 中忽略的文件，如编译缓存、生成的文件等）。

### 5. 安装
把 `dist` 的目录下的 **EnderLilies_SkinModTemplate 文件夹** 复制到 `Steam\steamapps\common\ENDER LILIES\EnderLilies\Content\Paks\` 游戏路径下

### 6. 运行游戏
如果没有显示出皮肤，则需要装备 **曾经失去的东西** 这个遗物

## 说明
- Python 脚本会自动导入并创建标签; 若手动创建, 确保 ChunkId=1, 烧录规则 AlwaysCook, 并显式添加贴图资产