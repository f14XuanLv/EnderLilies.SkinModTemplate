**English** | [简体中文](README.zh-CN.md)

# EnderLilies Skin Mod Generation Template

This project enables quick generation of custom skin mods for Lily (without any GUI operations)

## Requirements
- Windows 10 or higher
- VS2019/2022 + C++ toolset + Win10 SDK
- UE 4.26.2
- Git (recommended)

## Usage Steps

### 0. For skin creation and real-time preview tutorial, refer to this video
[![Skin Mod Tutorial & Workflow](https://i1.hdslb.com/bfs/archive/73e761a6ed5bd6e6f5f3e3c2e6610be9f17491b4.jpg)](https://www.bilibili.com/video/BV1vhPseYEDN)
> [!NOTE]
> Only watch P1~P4. The tedious GUI operations in P5 can be replaced by this project.

### 1. Clone this project and adjust the `UE 4.26.2` path

Clone this project locally:
```bash
git clone https://github.com/f14XuanLv/EnderLilies.SkinModTemplate.git
cd EnderLilies.SkinModTemplate
```

> [!TIP]
> If Git is not installed, you can directly download the project by clicking **Code** → **Download ZIP** on the GitHub page and extract it.

Modify the UE path in the scripts to match your UE 4.26.2 installation location:

1. Open [`Scripts\build_and_package.bat`](Scripts/build_and_package.bat) and find line 3:
   ```bat
   set "UEPATH=C:\Game\UE\UE_4.26"
   ```
   Change the path to your actual UE 4.26.2 installation path, for example:
   ```bat
   set "UEPATH=C:\Program Files\Epic Games\UE_4.26"
   ```

2. Open [`Scripts\import_and_label.bat`](Scripts/import_and_label.bat) and modify line 3 with the same path.

> [!IMPORTANT]
> Ensure you are using **UE 4.26.2**. Other versions may cause compatibility issues.
> Avoid using Chinese characters or special symbols in the path.

### 2. Replace skin texture
Replace `Content/_Zenith/Characters/p0001_Lily/Textures/p0001_Lily.png` with your modified skin texture PNG. Keep the texture resolution at 1024x256 (consistent with the original PNG resolution in the project).

### 3. Import and generate labels
Open `CMD` or `PowerShell` in the `EnderLilies.SkinModTemplate` project directory and execute:
```bat
Scripts\import_and_label.bat
```
(Automatically imports PNG and creates PrimaryAssetLabel with ChunkId=1)

### 4. Build/package and collect chunk1
After the previous step completes, continue executing:
```bat
Scripts\build_and_package.bat
```
(Outputs `dist\EnderLilies_SkinModTemplate\EnderLilies_SkinModTemplate_0_P.*`. A prompt will appear if chunk1 is empty)

> [!TIP]
> If you need to remake the skin mod, you can use `git clean -fdx` to restore the project to its initial state.
> This command will delete all untracked files and directories (including files ignored by `.gitignore`, such as build cache and generated files).

### 5. Installation
Copy the **EnderLilies_SkinModTemplate folder** under the `dist` directory to the game path `Steam\steamapps\common\ENDER LILIES\EnderLilies\Content\Paks\`

### 6. Run the game
If the skin doesn't appear, you need to equip the **Loss Heirloom** relic.

## Notes
- The Python script automatically imports and creates labels. If creating manually, ensure ChunkId=1, cook rule is AlwaysCook, and explicitly add texture assets.