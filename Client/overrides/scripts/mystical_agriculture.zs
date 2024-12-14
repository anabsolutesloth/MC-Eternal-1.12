import mods.mekanism.combiner;

#MC Eternal Scripts

print("--- loading mystical_agriculture.zs ---");

//Jade Seeds
// funny recipe for the sake of funny
// these are really not necessary to make, you just don't need that much jade, but it's also a very op endgame material so hehe
recipes.remove(<mysticalagriculture:jade_seeds>);
recipes.addShaped("jadeseeds_mce", <mysticalagriculture:jade_seeds>, [
    [<erebus:jade_block>, <mysticalagradditions:storage:1>, <erebus:jade_block>], 
	[<mysticalagradditions:storage:1>, <mysticalagradditions:insanium:1>, <mysticalagradditions:storage:1>], 
	[<erebus:jade_block>, <mysticalagradditions:storage:1>, <erebus:jade_block>]
]);


// MA Witherproof Blocks
//only a cosmetic difference with these recipes, they are kinda nice looking, mostly the block.

//Witherproof Glass
mods.mekanism.combiner.addRecipe(<extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>, <mysticalagriculture:witherproof_glass>);

addUniversalAlloyRecipe(<mysticalagriculture:witherproof_glass>, [
		<enderio:block_reinforced_obsidian>,
		<extrautils2:decorativeglass:3>
	],
	"Witherproof Glass", 
	false, 
	{
		"IEArc": {
			"time": alloyingBaseStats.IESmelterTime *2,
			"Energy": alloyingBaseStats.IEArcEnergy *2
		},
		"thermalInduction": {
			"energy": alloyingBaseStats.thermalInductionEnergy *8
		},
		"NCFurnace": {
			"time": alloyingBaseStats.NCFurnaceTime *4,
			"energy": alloyingBaseStats.NCFurnaceEnergy *8
		},
		"TRSmelter": {
			"time": alloyingBaseStats.TRSmelterTime *2,
			"energy": alloyingBaseStats.TRSmelterEnergy *2
		},
		"IEKiln": {
			"enabled": 0
		},
		"ARArc": {
			"time": alloyingBaseStats.ARArcTime *2,
			"energy": alloyingBaseStats.ARArcEnergy *2
		},
		"EIOSmelter": {
			"energy": alloyingBaseStats.EIOSmelterEnergy *4
		}
});

//Witherproof Block
mods.mekanism.combiner.addRecipe(<quark:black_ash>*4, <enderio:block_reinforced_obsidian>, <mysticalagriculture:witherproof_block>);

addUniversalAlloyRecipe(<mysticalagriculture:witherproof_block>, [
		<enderio:block_reinforced_obsidian>,
		<quark:black_ash> *4
	],
	"Witherproof Block",
	false,
	{
		"IEArc": {
			"time": alloyingBaseStats.IESmelterTime *2,
			"Energy": alloyingBaseStats.IEArcEnergy *2
		},
		"thermalInduction": {
			"energy": alloyingBaseStats.thermalInductionEnergy *8
		},
		"NCFurnace": {
			"time": alloyingBaseStats.NCFurnaceTime *4,
			"energy": alloyingBaseStats.NCFurnaceEnergy *8
		},
		"TRSmelter": {
			"time": alloyingBaseStats.TRSmelterTime *2,
			"energy": alloyingBaseStats.TRSmelterEnergy *2
		},
		"IEKiln": {
			"enabled": 0
		},
		"ARArc": {
			"time": alloyingBaseStats.ARArcTime *2,
			"energy": alloyingBaseStats.ARArcEnergy *2
		},
		"EIOSmelter": {
			"energy": alloyingBaseStats.EIOSmelterEnergy *4
		}
});

print("--- mystical_agriculture.zs initialized ---");