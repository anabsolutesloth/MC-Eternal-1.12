import crafttweaker.item.IItemStack;

import mods.chisel.Carving;

#MC Eternal Scripts

print("--- loading chisel.zs ---");

//fix some duplication exploits
val noDupeRecipeNames = [
	"biomesoplenty:amber",
	"biomesoplenty:amber_block",
	"bewitchment:block_of_salt",
	"bewitchment:block_of_salt_to_resource"
] as string[];

for name in noDupeRecipeNames {
	recipes.removeByRecipeName(name);
}

var chiseling = {
	"amberblock": [
		<biomesoplenty:gem_block:7>,
		<thaumcraft:amber_block>,
		<thaumcraft:amber_brick>,
		<thaumadditions:chiseled_amber_block>
	],
	"saltblock": [
		<bewitchment:block_of_salt>,
		<mekanism:saltblock>
	]
} as IItemStack[][string];

for entry in chiseling {
	Carving.addGroup(entry);
	for block in chiseling[entry] {
		Carving.addVariation(entry, block);
	}
}

//Remove Mossy Stone Brick Chiseling
Carving.removeVariation("stonebrick", <minecraft:stonebrick:1>);

print("--- chisel.zs initialized ---");