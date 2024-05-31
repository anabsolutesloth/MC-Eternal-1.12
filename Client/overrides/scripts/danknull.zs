import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;

#MC Eternal Scripts

print("--- loading danknull.zs ---");

//Danknull T6
// stupidly op and too stupidly cheap, some spicy is nice yeah?
recipes.remove(<danknull:dank_null_5>);
recipes.addShaped("danknull_t6_mce",
		<danknull:dank_null_5>.withTag({
		display:{
			Lore:[
				game.localize("mce.danknull.crafting_info.1"),
				game.localize("mce.danknull.crafting_info.2")
			]}}),
	[[<danknull:dank_null_panel_5>, <rats:idol_of_ratlantis>, <danknull:dank_null_panel_5>],
	[<extracells:storage.component:2>, <danknull:dank_null_4>.marked("dank5"), <extracells:storage.component:2>],
	[<danknull:dank_null_panel_5>, <compactmachines3:machine:5>.marked("cm"),<danknull:dank_null_panel_5>]],
	
	function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
		if(!input.cm.hasTag){
			return output.withTag(input.dank5.tag);
		} else {
			return null;
		}
	}
);

//Forced Danknull tiering
val dankRecipes = [
	"dank_null_1",
	"dank_null_2",
	"dank_null_3",
	"dank_null_4",
	"dank_null_5"
] as string[];
for recipe in dankRecipes { 
	recipes.removeByRecipeName("danknull:"+recipe);
}

print("--- danknull.zs initialized ---");