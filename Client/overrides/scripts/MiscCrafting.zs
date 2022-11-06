import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.data.IData;

import mods.nuclearcraft.alloy_furnace;
import mods.mekanism.combiner;
import mods.techreborn.alloySmelter;
import mods.chisel.Carving;

#MC Eternal Scripts

print("--- loading MiscCrafting.zs ---");

#Yeet Things
var itemsToNuke = [
	<xreliquary:twilight_cloak>,
	<extrautils2:bagofholding>,
	<bewitchment:poppet_deathprotection>,
	<bewitchment:poppet_vampiric>,
	<openmodularturrets:addon_meta:1>,
  <bibliocraft:fancyworkbench:*>
] as IItemStack[];

for item in itemsToNuke {
	recipes.remove(item);
	item.addTooltip(format.red("Disabled"));
}

#Homing Beecon
recipes.addShaped(<erebus:homing_beecon_advanced>, [[<erebus:materials:41>],[<erebus:homing_beecon>],[<mekanism:teleportationcore>]]);

#Soul Torches
recipes.addShaped("soultorch_mce", <futuremc:soul_fire_torch>, [[<ore:coal>|<ore:charcoal>],[<ore:stickWood>],[<ore:soulSand>]]);

#Soul Soil
recipes.addShapeless("soulsoil_mce", <futuremc:soul_soil>, [<ore:soulSand>,<ore:dirt>]);

#Jade Seeds
#funny recipe for the sake of funny
#these are really not necessary to make, you just don't need that much jade, but it's also a very op endgame material so hehe
recipes.addShaped("jadeseeds_mce", <mysticalagriculture:jade_seeds>, 
	[[<erebus:jade_block>, <mysticalagradditions:storage:1>, <erebus:jade_block>], 
	[<mysticalagradditions:storage:1>, <mysticalagradditions:insanium:1>, <mysticalagradditions:storage:1>], 
	[<erebus:jade_block>, <mysticalagradditions:storage:1>, <erebus:jade_block>]]
);

#no amber duping
recipes.removeByRecipeName("biomesoplenty:amber");
recipes.removeByRecipeName("biomesoplenty:amber_block");

Carving.addGroup("amberblock");

var amberBlocks = [
	<biomesoplenty:gem_block:7>,
	<thaumcraft:amber_block>,
	<thaumcraft:amber_brick>,
	<thaumadditions:chiseled_amber_block>
] as IItemStack[];

for block in amberBlocks {
	Carving.addVariation("amberblock", block);
}

#Infinite Barrel/Drawer Upgrade
recipes.addShaped("mce_drawers_upgrade_infinite_capacity", <storagedrawers:upgrade_creative:0>, [
	[null, <extracells:storage.component:1>, null],
	[<mekanism:teleportationcore>, <storagedrawers:upgrade_template>, <mekanism:teleportationcore>],
	[null, <minecraft:nether_star>, null]
]);
	
recipes.remove(<yabba:upgrade_star_tier>);
recipes.addShaped("mce_yabba_upgrade_infinite_capacity", <yabba:upgrade_star_tier>*2, [
	[null, <extracells:storage.component:1>, null],
	[<mekanism:teleportationcore>, <yabba:upgrade_blank>, <mekanism:teleportationcore>],
	[null, <minecraft:nether_star>, null]
]);

// Tiberium as Dynamo fuel
mods.thermalexpansion.EnervationDynamo.addFuel(<taiga:tiberium_crystal>, 100000);

#Dimension Builder
// balanced
recipes.addShaped("dimbuilder_mce", <rftoolsdim:dimension_builder>,
	[[<theaurorian:auroriansteelblock>,<rats:idol_of_ratlantis>,<erebus:jade_block>],
	[<ore:relicItemAtum>,<rftools:machine_frame>,<tconstruct:materials:50>],
	[<rftools:shield_block4>,<fossil:time_machine>,<rftools:shield_block4>]]
);

print("--- MiscCrafting.zs initialized ---");	
