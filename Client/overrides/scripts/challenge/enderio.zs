#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.buildcraft.AssemblyTable;

import mods.enderio.AlloySmelter;

import mods.forestry.Carpenter;

import mods.immersiveengineering.Blueprint;
import mods.immersiveengineering.ArcFurnace;

#MC Eternal Scripts

print("--- Loading challenge/enderio.zs ---");

//Workbench Blueprint
recipes.addShaped("mce_challengemode_eio_component_blueprint", <immersiveengineering:blueprint>.withTag({blueprint: "enderio_components"}), [
	[<enderio:item_yeta_wrench>, EIOMaterial.capacitorBasic, <openblocks:generic:11>],
	[<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],
	[<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]
]);

//Chassis stuff

//Simple Machine Chassis
recipes.remove(EIOMaterial.chassisSimple);
Blueprint.addRecipe("enderio_components", EIOMaterial.chassisSimple, [EIOMaterial.capacitorBasic, <ore:ingotConstructionAlloy> *4, <ancientspellcraft:devoritium_bars> *6]);

//Endsteel Chassis
recipes.remove(EIOMaterial.chassisEndsteel);
Blueprint.addRecipe("enderio_components", EIOMaterial.chassisEndsteel, [EIOMaterial.grainsVibrant, <ore:ingotEndSteel> *4, <enderio:block_end_iron_bars> *6]);

//Industrial Dye Blend
recipes.remove(EIOMaterial.industrialDye);
Carpenter.addRecipe(EIOMaterial.industrialDye *2, [
		[<ore:dustTritonite>, <ore:dustQuartz>, EIOMaterial.organicDyeGreen],
		[<ore:dustQuartz>, EIOMaterial.organicDyeBlack, <ore:dustQuartz>],
		[EIOMaterial.organicDyeGreen, <ore:dustQuartz>, <ore:dustTritonite>]
	],
	60,
	<liquid:concrete> *2000
);

//Soul Dye Blend
recipes.remove(EIOMaterial.soulDye);
Carpenter.addRecipe(EIOMaterial.soulDye *2, [
		[getMAResource("souliumDust", 0), <ore:dustQuartz>, EIOMaterial.organicDyeGreen],
		[<ore:dustQuartz>, EIOMaterial.organicDyeBlack, <ore:dustQuartz>],
		[EIOMaterial.organicDyeGreen, <ore:dustQuartz>, getMAResource("souliumDust", 0)]
	],
	60,
	<liquid:concrete> *2000
);

//Enhanced Dye Blend
recipes.remove(EIOMaterial.enhancedDye);
ArcFurnace.addRecipe(EIOMaterial.enhancedDye *2, EIOMaterial.organicDyeBlack, null, 200, 1024, [
	<ore:gemEnderBiotite> *4,
	EIOMaterial.grainsPrescience,
	EIOMaterial.grainsEnd,
	<ore:dustUru> *2
]);


//Capacitors

//Basic Capacitor
recipes.remove(EIOMaterial.capacitorBasic);
recipes.addShaped("mce_challengemode_basic_capacitor", EIOMaterial.capacitorBasic, [
	[<ore:ingotConstructionAlloy>, <ore:dustBedrock>, <ore:ingotConstructionAlloy>],
	[<ore:stickElectrum>, null, <ore:stickElectrum>]
]);

//Double-Layer Capacitor
recipes.remove(EIOMaterial.capacitorEnhanced);
recipes.addShaped("mce_challengemode_enhanced_capacitor", EIOMaterial.capacitorEnhanced, [
	[<ore:ingotEnergeticAlloy>, null, <ore:ingotEnergeticAlloy>],
	[EIOMaterial.capacitorBasic, <ore:ingotSiliconCarbide>, EIOMaterial.capacitorBasic],
	[<ore:ingotEnergeticAlloy>, null, <ore:ingotEnergeticAlloy>]
]);
//Assembly Table recipe
AssemblyTable.addRecipe("mce_challengemode_enhanced_capacitor", EIOMaterial.capacitorEnhanced, 10000, [
    EIOMaterial.capacitorBasic *2,
    <ore:ingotEnergeticAlloy> *2,
    <ore:ingotSiliconCarbide>
]);

//Octadic Capacitor
recipes.remove(EIOMaterial.capacitorOctadic);
recipes.addShaped("mce_challengemode_octadic_capacitor", EIOMaterial.capacitorOctadic, [
	[<ore:ingotVibrantAlloy>, null, <ore:ingotVibrantAlloy>],
	[EIOMaterial.capacitorEnhanced, <ore:ingotRefinedGlowstone>, EIOMaterial.capacitorEnhanced],
	[<ore:ingotVibrantAlloy>, null, <ore:ingotVibrantAlloy>]
]);
//Assembly Table recipe
AssemblyTable.addRecipe("mce_challengemode_octadic_capacitor", EIOMaterial.capacitorOctadic, 10000, [
    EIOMaterial.capacitorEnhanced *2,
    <ore:ingotVibrantAlloy> *2,
    <ore:ingotRefinedGlowstone>
]);


//Machinery

//Simple Alloy Smelter
recipes.removeByRecipeName("enderio:simple_alloy_smelter");
recipes.addShaped("mce_challengemode_simple_alloy_smelter", <enderio:block_simple_alloy_smelter>, [
	[<ore:ingotConstructionAlloy>, <ore:ingotConstructionAlloy>, <ore:ingotConstructionAlloy>],
	[null, <tconstruct:smeltery_controller>, null],
	[<ore:gearIronInfinity>, EIOMaterial.chassisSimple, <ore:gearIronInfinity>]
]);

//Simple Stirling
recipes.removeByRecipeName("enderio:simple_stirling_generator");
recipes.addShaped("mce_challengemode_simple_stirling_generator", <enderio:block_simple_stirling_generator>, [
    [<ore:ingotConstructionAlloy>, <ore:ingotElectricalSteel>, <ore:ingotConstructionAlloy>],
    [<ore:ingotConstructionAlloy>, <tconstruct:seared_furnace_controller>, <ore:ingotConstructionAlloy>],
    [<ore:gearIronInfinity>, EIOMaterial.chassisSimple, <ore:gearIronInfinity>]
]);

//Lava Heat Exchanger
recipes.remove(<enderio:block_lava_generator>);
recipes.addShaped("mce_challengemode_lava_heat_exchanger", <enderio:block_lava_generator>, [
    [<ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>],
    [<ore:ingotConstructionAlloy>, EIOMaterial.chassisSimple, <ore:ingotConstructionAlloy>],
    [<ore:ingotConductiveIron>, <buildcraftfactory:heat_exchange>, <ore:ingotConductiveIron>]
]);


//Materials

//Conductive Iron
AlloySmelter.addRecipe(<ore:ingotConductiveIron>.firstItem, [<ore:ingotIron>, <ore:gemRedstone>], 2000);

//Nethercotta
AlloySmelter.removeRecipe(<ore:ingotBrickNetherGlazed>.firstItem);
AlloySmelter.addRecipe(<ore:ingotBrickNetherGlazed>.firstItem, [<ore:ingotBrickNether>, <ore:blockNetherWart>, <ore:clayBall> *8], 5000);

//Dark Steel
AlloySmelter.removeRecipe(<ore:ingotDarkSteel>.firstItem);


//Yeta Wrench Scrapping
// since you get it from fishing
AlloySmelter.addRecipe(<ore:ingotElectricalSteel>.firstItem *2, [<enderio:item_yeta_wrench>], 2000);


//Temp alloy smelter warning
if(!isServer){
	<enderio:block_simple_alloy_smelter>.addTooltip(format.red("TEMP NOTE: EnderTweaker's Alloy Smelter Recipe removal is broken, meaning that this machine is able to craft many things it should not be able to in Challenge Mode, such as Electrical Steel"));
}

print("--- challenge/enderio.zs initialized ---");