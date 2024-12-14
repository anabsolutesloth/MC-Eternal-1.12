#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

import mods.roots.Chrysopoeia;

#MC Eternal Scripts

print("--- loading challenge/mystical_agriculture.zs ---");

//Disabled MA Crops
val removedSeeds as string[] = [
	"diamond",
	"blaze",
	"coal",
	"emerald",
	"end",
	"enderman",
	"experience",
	"ghast",
	"glowstone",
	"gold",
	"iron",
	"lapis_lazuli",
	"nature",
	"nether",
	"obsidian",
	"pig",
	"redstone",
	"sheep",
	"wood",
	"aluminum",
	"boron",
	"bronze",
	"enderium",
	"invar",
	"iridium",
	"lead",
	"lithium",
	"lumium",
	"thorium",
	"magnesium",
	"osmium",
	"platinum",
	"silver",
	"dirt",
	"creeper",
	"cow"
];

//Essence Recipes involving disabled essences
// long array
val essenceRecipeNames as string[] = [
	"coal",
	"emerald",
	"end_stone",
	"purpur_block",
	"chorus_fruit",
	"ender_pearl",
	"xp_droplet",
	"ghast_tear",
	"glowstone_dust",
	"dye_13",
	"grass",
	"mycelium",
	"vine",
	"cactus",
	"reeds",
	"pumpkin",
	"melon_block",
	"wheat",
	"potato",
	"poisonous_potato",
	"carrot",
	"beetroot",
	"waterlily",
	"dye",
	"brown_mushroom",
	"red_mushroom",
	"mossy_cobblestone",
	"stonebrick_2",
	"apple",
	"tallgrass",
	"sapling",
	"sapling_1",
	"sapling_2",
	"sapling_3",
	"sapling_4",
	"sapling_5",
	"nether_wart",
	"menril_sapling",
	"netherrack",
	"soul_sand",
	"nether_brick",
	"crafting_2",
	"crafting_3",
	"obsidian",
	"porkchop",
	"redstone",
	"mutton",
	"wool",
	"log",
	"log_1",
	"log_2",
	"log_3",
	"log2",
	"log2_1",
	"ingotaluminum",
	"ingotboron",
	"ingotbronze",
	"ingotinvar",
	"ingotiridium",
	"ingotlead",
	"ingotlithium",
	"ingotlumium",
	"ingotthorium",
	"ingotmagnesium",
	"ingotosmium",
	"ingotplatinum",
	"ingotsilver",
	"dirt",
	"dirt_1",
	"dirt_2",
	"gravel",
	"clay_ball",
	"sand",
	"sand_1",
	"crafting_5",
	"gunpowder",
	"skull_2",
	"record_13",
	"record_cat",
	"record_blocks",
	"record_chirp",
	"record_far",
	"record_mall",
	"record_mellohi",
	"record_stal",
	"record_strad",
	"record_ward",
	"record_11",
	"record_wait",
	"beef",
	"leather",
	"milk_bucket",
	"ingotenderium"
];

val questSeeds as string[] = ["gold", "diamond", "blaze"];
//Yeeting process
for seed in removedSeeds {
	recipes.remove(itemUtils.getItem("mysticalagriculture:"+ seed +"_seeds"));
	if(questSeeds has seed) {
		print("Not hiding "+ seed +" seeds from JEI as it is still obtainable via quests.");
	} else {
		for suffix in ["seeds", "crop", "essence"] as string[] {
			val cropItem as IItemStack = itemUtils.getItem("mysticalagriculture:"+ seed +"_"+ suffix);
			mods.jei.JEI.removeAndHide(cropItem);
			if(!isServer)
				cropItem.addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));
		}
	}
}

//Removing recipes using disabled Essences
for recName in essenceRecipeNames {	
	recipes.removeByRecipeName("mysticalagriculture:"+ recName);
}

//Removing Mystical Aggraditions recipes using disabled things
for recipeName in ["stuff_1","nether_star_seeds","dragon_egg_seeds","dragon_egg_chunks","special_1"] as string[] {
	recipes.removeByRecipeName("mysticalagradditions:"+ recipeName);
}

var hiddenMystAggraMats = {
	"dragon_egg_seeds" : 0, 
	"dragon_egg_essence": 0, 
	"special" : 1, 
	"stuff" : 2, 
	"dragon_egg_crop" : 0
} as int[string];

for itemName,meta in hiddenMystAggraMats {
	mods.jei.JEI.removeAndHide(itemUtils.getItem("mysticalagradditions:"+ itemName, meta));
}

//Remove Chunk recipes for disabled Mob seeds and hide them
val disabledSeedChunkMetas = [
	19,
	18,
	17,
	13,
	10,
	9,
	7
] as int[];

for meta in disabledSeedChunkMetas {
	val chunk = itemUtils.getItem("mysticalagriculture:chunk", meta);
	recipes.remove(chunk);
	mods.jei.JEI.removeAndHide(chunk);
}


//Custom Recipe shenanigans

//Removing several Essence Item-related recipes
for tier,index in MAEssenceTier {

	//MA Essence Ingots (and Prosperity)
	recipes.removeByRecipeName("mysticalagriculture:crafting_"+ (17 + index));
}

//Master Infusion Crystal
// gotten from 64x Insanium Ingot quest in Challenge Mode
recipes.removeByRecipeName("mysticalagriculture:core/master_infusion_crystal");
if(!isServer)
	addMultilineLocalizedTooltip(<mysticalagriculture:master_infusion_crystal>, "mce.challengemode.mysticalagriculture.tip.how_get_master_infusion_crystal");

//Prosperity Ingot crafting
Chrysopoeia.addRecipe("mce_challengemode_prosperity_ingot", <ore:shardProsperity> *6, getMAResource("ingot", MAEssenceTier.prosperity));

//Infusion Crystal


//Remove Tinkering Tables (except Insanium)
recipes.remove(<mysticalagriculture:tinkering_table:*>);
<mysticalagriculture:tinkering_table:*>.addTooltip(format.red(game.localize("mce.challengemode.mysticalagriculture.tip.only_insanium_tinker_table")));

print("--- challenge/mystical_agriculture.zs initialized ---");	
