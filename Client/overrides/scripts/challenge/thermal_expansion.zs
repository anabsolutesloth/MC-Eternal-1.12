#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.buildcraft.AssemblyTable;

#MC Eternal Scripts

print("--- Loading challenge/thermal_expansion.zs ---");

// Thermal Machine Frame
recipes.remove(<thermalexpansion:frame>);
recipes.addShaped("mce_challengemode_thermal_frame", <thermalexpansion:frame>, [
	[<ore:blockSheetmetalIron>, <ore:plateSilver>, <ore:blockSheetmetalIron>],
	[<extrautils2:ineffableglass:2>, <immersiveengineering:metal_decoration0:3>, <extrautils2:ineffableglass:2>],
	[<ore:blockSheetmetalSteel>, <ore:circuitAdvanced>, <ore:blockSheetmetalSteel>]
]);

//Servos
recipes.remove(<thermaldynamics:servo:*>);
recipes.addShaped("mce_challengemode_basic_servo", <thermaldynamics:servo:0> *2, [
    [null, <buildcraftsilicon:plug_gate>.withTag({})],
    [<ore:ingotRefinedIron>, <buildcraftsilicon:plug_pulsar>, <ore:ingotRefinedIron>]
]);

recipes.addShaped("mce_challengemode_hardened_servo", <thermaldynamics:servo:1> *2, [
    [<ore:ingotElectricalSteel>, <buildcraftsilicon:plug_gate>.withTag({gate: {material: 1 as byte}}), <ore:ingotElectricalSteel>],
    [<thermaldynamics:servo:0>, null, <thermaldynamics:servo:0>]
]);

recipes.addShaped("mce_challengemode_reinforced_servo", <thermaldynamics:servo:2> *2, [
    [<ore:ingotLumix>, <buildcraftsilicon:plug_gate>.withTag({gate: {material: 2 as byte}}), <ore:ingotLumix>],
    [<thermaldynamics:servo:1>, null, <thermaldynamics:servo:1>]
]);

recipes.addShaped("mce_challengemode_signalum_servo", <thermaldynamics:servo:3> *2, [
    [<ore:ingotSignalum>, <buildcraftsilicon:plug_gate>.withTag({gate: {material: 3 as byte}}), <ore:ingotSignalum>],
    [<thermaldynamics:servo:2>, null, <thermaldynamics:servo:2>]
]);

recipes.addShaped("mce_challengemode_resonant_servo", <thermaldynamics:servo:4> *2, [
    [<ore:ingotEnderium>, null, <ore:ingotEnderium>],
    [<thermaldynamics:servo:3>, null, <thermaldynamics:servo:3>]
]);



//Dynamos :)
recipes.remove(<thermalexpansion:dynamo:*>);

//Steam
AssemblyTable.addRecipe("mce_challengemode_steam_dynamo", <thermalexpansion:dynamo:0>, 5000, [
    <buildcraftcore:engine:1>,
    ThermalItem.transmitCoil,
    <ore:gearCopper> *2
]);

//Compression
AssemblyTable.addRecipe("mce_challengemode_compression_dynamo", <thermalexpansion:dynamo:2>, 5000, [
    <buildcraftcore:engine:2>,
    ThermalItem.transmitCoil,
    <ore:gearTin> *2
]);


print("--- challenge/thermal_expansion.zs initialized ---");