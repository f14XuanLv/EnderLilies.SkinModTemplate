using UnrealBuildTool;

public class EnderLilies_SkinModTemplate : ModuleRules {
    public EnderLilies_SkinModTemplate(ReadOnlyTargetRules Target) : base(Target) {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
        PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore" });
    }
}
