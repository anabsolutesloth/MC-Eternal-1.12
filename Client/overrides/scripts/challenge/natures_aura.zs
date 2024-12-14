#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.bloodmagic.AlchemyArray;

import mods.botania.Apothecary;

import mods.naturesaura.TreeRitual;
import mods.naturesaura.Altar;

#MC Eternal Scripts

print("--- Loading challenge/natures_aura.zs ---");

//Brilliant Fiber
recipes.remove(<naturesaura:gold_fiber>);
Apothecary.addRecipe(<naturesaura:gold_fiber>, [<bewitchment:golden_thread>, <ore:gemAmber>, <ore:treeLeaves>, <ore:dustGold>]);
//BL Ingredient recipe
Apothecary.addRecipe(<naturesaura:gold_fiber> *3, [<thebetweenlands:items_crushed:35>, <ore:gemAmber>, <ore:leavesBL>, <ore:dustGold>]);

//Gold Powder
//enforces using added Roots mortar recipe
recipes.remove(<naturesaura:gold_powder>);

//Golden Stone Bricks
recipes.remove(<naturesaura:gold_brick>);
AlchemyArray.addRecipe(<naturesaura:gold_brick>, <naturesaura:gold_fiber>, <minecraft:stonebrick:0>, "bloodmagic:textures/models/alchemyarrays/growthsigil.png");

//Crumbling Catalyst
TreeRitual.removeRecipe(<naturesaura:crushing_catalyst>);
TreeRitual.addRecipe("mce_challengemode_crumbling_catalyst", <minecraft:sapling:4>, <naturesaura:crushing_catalyst>, 80, [
	<naturesaura:gold_brick>,
	<naturesaura:infused_stone>,
	<minecraft:piston>,
	<minecraft:flint>,
	<naturesaura:token_anger>,
	<roots:stalicripe>
]);

//Natural Altar
TreeRitual.removeRecipe(<naturesaura:nature_altar>);
TreeRitual.addRecipe("mce_challengemode_natural_altar", <minecraft:sapling:0>, <naturesaura:nature_altar>, 80, [
	<ebwizardry:magic_crystal:5>,
	<naturesaura:token_joy>,
	<naturesaura:gold_leaf>,
	<naturesaura:gold_leaf>,
	EXU2Item.polishedStone,
	EXU2Item.polishedStone,
	EXU2Item.polishedStone,
	EXU2Item.polishedStone
]);

//Infused Iron
// gotten via Nagrillite insted
Altar.removeRecipe(<naturesaura:infused_iron>);
Altar.removeRecipe(<naturesaura:infused_iron_block>);


//slightly too easy with much mod
//Swamp Homi
basicDisable(<naturesaura:moss_generator>, "", true);

//Canopy Diminisher
basicDisable(<naturesaura:oak_generator>, "", true);


print("--- challenge/natures_aura.zs initialized ---");