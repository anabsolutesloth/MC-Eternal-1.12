import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;

import mods.botania.ManaInfusion;
import mods.botania.Orechid;

#MC Eternal Scripts

print("--- loading botania.zs ---");


//Fabulous a Mana Pool
recipes.addShaped("mce_make_mana_pool_fabulous", <botania:pool:3>, [
	[<botania:bifrostperm>, <botania:pool:0>, <botania:bifrostperm>],
	[<botania:bifrostperm>, <botania:bifrostperm>, <botania:bifrostperm>]
]);

//Change Wand of the Forest petals
recipes.addShaped("mce_change_forest_wand_petals", <botania:twigwand>.withLore(["Colored with the Petals used in this recipe!"]), [
	[null, <botania:petal:*>.marked("petal2")],
	[<botania:petal:*>.marked("petal1"), <botania:twigwand>.marked("wand")]
	],
	function(output as IItemStack, inputs as IItemStack[string], cInfo as ICraftingInfo){
		return inputs.wand.updateTag({color1: inputs.petal1.metadata, color2: inputs.petal2.metadata});
});


//Remove Beneath ores from Orechid
Orechid.removeOre("oreOsmium");
Orechid.removeOre("oreBoron");
Orechid.removeOre("oreLithium");
Orechid.removeOre("oreMagnesium");

//Add Thorium to orechid
Orechid.addOre("oreThorium", 1200);


//Die Fragment Scrapping
ManaInfusion.addInfusion(manaResource.gaiaSpirit, <contenttweaker:die_fragment>, 2500);

print("--- botania.zs initialized ---");