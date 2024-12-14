import crafttweaker.item.IItemStack;

import mods.actuallyadditions.Crusher;

#MC Eternal Scripts

print("--- loading ActuallyAdditions.zs ---");

//fixing Horse armor material duping

//val dustDiamond = <nuclearcraft:gem_dust:0>;
val dustDiamond = <ore:dustDiamond>.firstItem;

Crusher.removeRecipe(dustDiamond);

Crusher.addRecipe(dustDiamond, <ore:gemDiamond>);
Crusher.addRecipe(dustDiamond*4, <minecraft:diamond_horse_armor>);


val dustGold = <ore:dustGold>.firstItem;

Crusher.removeRecipe(dustGold);

Crusher.addRecipe(dustGold, <ore:ingotGold>);
Crusher.addRecipe(dustGold *4, <minecraft:golden_horse_armor>);
Crusher.addRecipe(dustGold *2, <ore:oreGold>);


val dustIron = <ore:dustIron>.firstItem;

Crusher.removeRecipe(dustIron);

Crusher.addRecipe(dustIron, <ore:ingotIron>);
Crusher.addRecipe(dustIron *4, <minecraft:iron_horse_armor>);
Crusher.addRecipe(dustIron *2, <ore:oreIron>, dustGold, 20);


//Storage Crate Upgrade remix
// always thought it was really weird you void a whole crate for this

//Medium Crate Upgrade
recipes.remove(<actuallyadditions:item_small_to_medium_crate_upgrade>);
recipes.addShaped("mce_medium_storage_crate_upgrade_remix", <actuallyadditions:item_small_to_medium_crate_upgrade>, [
	[<ore:plankWood>, <actuallyadditions:block_crystal:3>, <ore:plankWood>],
	[<actuallyadditions:block_crystal:3>, null, <actuallyadditions:block_crystal:3>],
	[<ore:plankWood>, <actuallyadditions:block_crystal:3>, <ore:plankWood>]
]);

//Large Crate Upgrade
recipes.remove(<actuallyadditions:item_medium_to_large_crate_upgrade>);
recipes.addShaped("mce_large_storage_crate_upgrade_remix", <actuallyadditions:item_medium_to_large_crate_upgrade>, [
	[<ore:plankWood>, <actuallyadditions:block_crystal_empowered:3>, <ore:plankWood>,],
	[<actuallyadditions:block_crystal_empowered:3>, null, <actuallyadditions:block_crystal_empowered:3>],
	[<ore:plankWood>, <actuallyadditions:block_crystal_empowered:3>, <ore:plankWood>]
]);

//Remove base Small Crate Upgrade recipe
// differs in Challenge mode and Classic mode, so removing it in one place is a bit more clean
recipes.removeByRecipeName("actuallyadditions:recipes13");


//crafting AA Crystal Clusters
// for decoration reasons
val crystalMap as string[int] = {
	3: "coal",
	1: "lapis",
	0: "redstone",
	5: "iron",
	2: "diamond",
	4: "emerald"
};

for meta,mineral in crystalMap {
	val crystalShard as IItemStack = itemUtils.getItem("actuallyadditions:item_crystal_shard", meta);
	val crystal as IItemStack = itemUtils.getItem("actuallyadditions:item_crystal", meta);
	recipes.addShaped("mce_actuallyadditions_crystal_cluster_"+ mineral, itemUtils.getItem("actuallyadditions:block_crystal_cluster_"+ mineral), [
		[null, crystalShard],
		[crystalShard, crystal, crystalShard]
	]);
}

print("--- ActuallyAdditions.zs initialized ---");	
