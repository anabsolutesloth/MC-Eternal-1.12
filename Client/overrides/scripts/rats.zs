

#MC Eternal Scripts

print("--- loading rats.zs ---");

// Assorted Vegetables (Confit Byaldi)
recipes.remove(<rats:assorted_vegetables>);
recipes.addShaped("mce_assorted_vegetables", <rats:assorted_vegetables>, [
	[<thebetweenlands:spirit_fruit>, <mysticalagriculture:superium_apple>, <twilightforest:magic_beans>],
	[<harvestcraft:nopalessaladitem>, <iceandfire:ambrosia>, <harvestcraft:spicygreensitem>],
	[<arcaneworld:glowing_chorus>, <nuclearcraft:moresmore>, <ore:unstableFruit>]
]);

// Potato Knishes chain
//Potato Pancake
recipes.remove(<rats:potato_pancake>);
recipes.addShaped("mce_potato_pancake", <rats:potato_pancake>, [
	[<harvestcraft:bakedsweetpotatoitem>, <botania:tinypotato>, <minecraft:baked_potato>],
	[<ore:blockCopper>, <ore:blockCopper>, <ore:blockCopper>],
	[<minecraft:baked_potato>, <botania:tinypotato>, <harvestcraft:bakedsweetpotatoitem>]
]);

//Little Black Squash Balls
mods.rats.recipes.removeGemcutterRatRecipe(<rats:little_black_squash_balls>);
mods.rats.recipes.addGemcutterRatRecipe(<thebetweenlands:log_sap:*>, <rats:little_black_squash_balls>);

//Centipede
mods.rats.recipes.removeGemcutterRatRecipe(<rats:centipede>);
recipes.addShaped("mce_rats_centipede", <rats:centipede>, [
	[<rats:little_black_worm>, <rats:little_black_worm>, <rats:little_black_worm>],
	[<buildcraftsilicon:redstone_chipset>, <erebus:materials:15>, <buildcraftsilicon:redstone_chipset>],
	[<rats:little_black_worm>, <rats:little_black_worm>, <rats:little_black_worm>]
]);


//Herb Bundle
// so it doesn't cost ungodly things
recipes.remove(<rats:herb_bundle>);
recipes.addShaped("mce_herb_bundle", <rats:herb_bundle>, [
	[<ore:allFlowers>, <ore:allFlowers>, <ore:allFlowers>],
	[<ore:allFlowers>, <ore:listAllVeggie>, <ore:allFlowers>],
	[<ore:allFlowers>, <ore:allFlowers>, <ore:allFlowers>]
]);

print("--- rats.zs initialized ---");