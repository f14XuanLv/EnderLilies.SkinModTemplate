@echo off
setlocal
set "UEPATH=C:\Game\UE\UE_4.26"
set "PROJDIR=%~dp0.."
for %%I in ("%PROJDIR%") do set "PROJDIR=%%~fI"
set "PNG=%PROJDIR%\Content\_Zenith\Characters\p0001_Lily\Textures\p0001_Lily.png"
set "DEST=/Game/_Zenith/Characters/p0001_Lily/Textures"

rem Pre-build to avoid module missing prompts
call "%UEPATH%\Engine\Build\BatchFiles\Build.bat" EnderLilies_SkinModTemplateEditor Win64 Development -project="%PROJDIR%\EnderLilies_SkinModTemplate.uproject" -progress -NoHotReload
if errorlevel 1 exit /b %errorlevel%
call "%UEPATH%\Engine\Build\BatchFiles\Build.bat" EnderLilies_SkinModTemplate Win64 Development -project="%PROJDIR%\EnderLilies_SkinModTemplate.uproject" -progress -NoHotReload
if errorlevel 1 exit /b %errorlevel%

if not exist "%PNG%" (
  echo PNG not found at %PNG%
  exit /b 1
)

"%UEPATH%\Engine\Binaries\Win64\UE4Editor-Cmd.exe" "%PROJDIR%\EnderLilies_SkinModTemplate.uproject" -run=ImportAssets -source="%PNG%" -dest="%DEST%" -nogui -nosourcecontrol -replaceexisting
if errorlevel 1 exit /b %errorlevel%

"%UEPATH%\Engine\Binaries\Win64\UE4Editor-Cmd.exe" "%PROJDIR%\EnderLilies_SkinModTemplate.uproject" -run=pythonscript -script="%PROJDIR%\Scripts\create_label.py"
