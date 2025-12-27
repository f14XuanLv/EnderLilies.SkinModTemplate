using UnrealBuildTool;
public class EnderLilies_SkinModTemplateTarget : TargetRules {
    public EnderLilies_SkinModTemplateTarget(TargetInfo Target) : base(Target) {
        Type = TargetType.Game;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        ExtraModuleNames.Add("EnderLilies_SkinModTemplate");
    }
}
