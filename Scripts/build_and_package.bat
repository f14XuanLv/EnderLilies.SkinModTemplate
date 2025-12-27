@echo off
setlocal
set "UEPATH=C:\Game\UE\UE_4.26"
set "PROJDIR=%~dp0.."
for %%I in ("%PROJDIR%") do set "PROJDIR=%%~fI"
set "MOD=EnderLilies_SkinModTemplate"

rem Build targets
call "%UEPATH%\Engine\Build\BatchFiles\Build.bat" %MOD%Editor Win64 Development -project="%PROJDIR%\%MOD%.uproject" -progress -NoHotReload
if errorlevel 1 exit /b %errorlevel%
call "%UEPATH%\Engine\Build\BatchFiles\Build.bat" %MOD% Win64 Development -project="%PROJDIR%\%MOD%.uproject" -progress -NoHotReload
if errorlevel 1 exit /b %errorlevel%

rem Cook/package
call "%UEPATH%\Engine\Build\BatchFiles\RunUAT.bat" BuildCookRun -project="%PROJDIR%\%MOD%.uproject" -targetplatform=Win64 -clientconfig=Development -cook -stage -pak -package -iostore -SkipCookingEditorContent -utf8output -ddc=InstalledDerivedDataBackendGraph
if errorlevel 1 exit /b %errorlevel%

rem Collect chunk1
set "PAKDIR=%PROJDIR%\Saved\StagedBuilds\WindowsNoEditor\%MOD%\Content\Paks"
set "OUTDIR=%PROJDIR%\dist\%MOD%"
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
if exist "%PAKDIR%\pakchunk1-WindowsNoEditor.pak" (
  copy "%PAKDIR%\pakchunk1-WindowsNoEditor.pak" "%OUTDIR%\%MOD%_0_P.pak" >nul
  copy "%PAKDIR%\pakchunk1-WindowsNoEditor.ucas" "%OUTDIR%\%MOD%_0_P.ucas" >nul
  copy "%PAKDIR%\pakchunk1-WindowsNoEditor.utoc" "%OUTDIR%\%MOD%_0_P.utoc" >nul
) else (
  echo WARNING: chunk1 not found. Check cook assets/label.
)
