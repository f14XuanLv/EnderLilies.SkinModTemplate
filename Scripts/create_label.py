import os
import unreal

asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
asset_lib = unreal.EditorAssetLibrary

content_dir = unreal.Paths.project_content_dir()
png_path = os.path.join(content_dir, "_Zenith", "Characters", "p0001_Lily", "Textures", "p0001_Lily.png")
dest_path = "/Game/_Zenith/Characters/p0001_Lily/Textures"
texture_path = f"{dest_path}/p0001_Lily"

# Import texture if missing
if not asset_lib.does_asset_exist(texture_path):
    if not os.path.exists(png_path):
        unreal.log_warning(f"PNG not found: {png_path}")
    else:
        task = unreal.AssetImportTask()
        task.filename = png_path
        task.destination_path = dest_path
        task.destination_name = "p0001_Lily"
        task.automated = True
        task.save = True
        asset_tools.import_asset_tasks([task])

tex = asset_lib.load_asset(texture_path)
if not tex:
    unreal.log_warning(f"Texture still missing after import: {texture_path}")

# Create or update PrimaryAssetLabel
label_path = f"{dest_path}/AutoLabel"
label = asset_lib.load_asset(label_path)
if not label:
    label = asset_tools.create_asset("AutoLabel", dest_path, unreal.PrimaryAssetLabel, None)

rules = unreal.PrimaryAssetRules()
rules.set_editor_property("chunk_id", 1)
label.set_editor_property("rules", rules)
label.set_editor_property("label_assets_in_my_directory", True)

if tex:
    label.set_editor_property("explicit_assets", [tex])

asset_lib.save_loaded_asset(label)
unreal.log(f"Label prepared at: {label.get_path_name()}")
