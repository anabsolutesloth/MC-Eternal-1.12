#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.mekanism.infuser;

#MC Eternal Scripts

print("--- Loading challenge/mekanism.zs ---");

// Metallurgic Infuser
recipes.remove(<mekanism:machineblock:8>);
recipes.addShaped("mce_challengemode_metallurgic_infuser", <mekanism:machineblock:8>, [
	[<futuremc:netherite_ingot>, <nuclearcraft:part:2>, <futuremc:netherite_ingot>],
	[<minecraft:redstone>, <mekanism:basicblock>, <minecraft:redstone>],
	[<futuremc:netherite_ingot>, <nuclearcraft:part:2>, <futuremc:netherite_ingot>]
]);

// Digital Miner
recipes.remove(<mekanism:machineblock:4>);
recipes.addShaped("mce_challengemode_digital_miner", <mekanism:machineblock:4>, [
	[<ore:alloyUltimate>, <mekanism:controlcircuit:3>, <ore:alloyUltimate>],
	[<mekanism:machineblock:15>, <mekanism:robit>, <mekanism:machineblock:15>],
	[<mekanism:teleportationcore>, <ore:blockAurorianSteel>, <mekanism:teleportationcore>]
]);

// Fusion Controller
recipes.remove(<mekanismgenerators:reactor>);
recipes.addShaped("mce_challengemode_mek_fusion_reactor", <mekanismgenerators:reactor>, [
	[<mekanism:controlcircuit:3>, <thaumicaugmentation:starfield_glass:2>, <mekanism:controlcircuit:3>],
	[<ore:blockNetherite>, <advancedrocketry:chemicalreactor>, <ore:blockNetherite>],
	[<ore:blockNetherite>, <ore:blockAurorianSteel>, <ore:blockNetherite>]
]);

// Gasburner
recipes.remove(<mekanismgenerators:generator:3>);
recipes.addShaped("mce_challengemode_gasburning_generator", <mekanismgenerators:generator:3>, [
	[<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>],
	[<ore:blockNetherite>, <mekanism:electrolyticcore>, <ore:blockNetherite>],
	[<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>]
]);


// Mek Alloys
// reinforced could maybe use a more funny ingot
infuser.removeRecipe(<mekanism:enrichedalloy>);
infuser.addRecipe("REDSTONE", 20, <ore:ingotHSLASteel>, <mekanism:enrichedalloy>);

infuser.removeRecipe(<mekanism:reinforcedalloy>);
infuser.addRecipe("DIAMOND", 20, <ore:ingotTough>, <mekanism:reinforcedalloy>);

infuser.removeRecipe(<mekanism:atomicalloy>);
infuser.addRecipe("OBSIDIAN", 40, <ore:ingotTerrax>, <mekanism:atomicalloy>);

print("--- challenge/mekanism.zs initialized ---");