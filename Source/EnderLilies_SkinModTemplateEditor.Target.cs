using UnrealBuildTool;
public class EnderLilies_SkinModTemplateEditorTarget : TargetRules {
    public EnderLilies_SkinModTemplateEditorTarget(TargetInfo Target) : base(Target) {
        Type = TargetType.Editor;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        ExtraModuleNames.Add("EnderLilies_SkinModTemplate");
    }
}
