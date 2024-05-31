#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.roots.Fey;
import mods.roots.Pyre;
import mods.roots.Spells;
import mods.roots.Spell;
import mods.roots.Mortar;
import mods.roots.Chrysopoeia;
import mods.roots.Rituals;

import mods.thaumcraft.ArcaneWorkbench;

import mods.naturesaura.Altar;

import scripts.challenge.misc_magic;

#MC Eternal Scripts

print("--- Loading challenge/roots.zs ---");

//Elemental Soil
Fey.removeRecipe(<roots:elemental_soil>);
Fey.addRecipe("elemental_soil", <roots:elemental_soil> *4, [
	<bloodmagic:inscription_tool:3>.transformNew(function(item as IItemStack){
		return misc_magic.useInscriptionTool(item);
	}),
	<ore:dirt>,
	<roots:terra_moss>,
	<roots:wildroot>,
	<ore:gravel>,
]);


//Unending Bowl
// evil because infinite all the time water
Fey.removeRecipe(<roots:unending_bowl>);
Fey.addRecipe("unending_bowl", <roots:unending_bowl>, [
	<roots:mortar>,
	<nuclearcraft:water_source_dense>,
	<thaumcraft:everfull_urn>,
	<extrautils2:drum:3>.withTag({Fluid: {FluidName: "water", Amount: 65536000}}),
	<xreliquary:emperor_chalice>
]);


//make Petal Shell more of a "parry"
// later anyway, duration can't be adjusted in roots 3.1.7 and below :v
val petalShell = Spells.getSpell("petal_shell") as Spell;
petalShell.setCooldown(1200);


//Pyre
recipes.remove(<roots:pyre>);
addSalisMundusConversion(<roots:pyre>, <futuremc:campfire>);


//Mortar
recipes.remove(<roots:mortar>);
Fey.addRecipe("mce_challengemode_mortar", <roots:mortar>, [
	<actuallyadditions:item_misc:14>.transformReplace(<ore:foodCoffee>.firstItem), //Empty Cup
	<roots:wildroot>,
	<roots:terra_moss>,
	<minecraft:water_bucket>,
	<ore:toolPot>
]);

//Pestle
recipes.remove(<roots:pestle>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_pestle", "", 30,
	[<aspect:terra> *3, <aspect:ordo> *2, <aspect:perditio> *4],
	<roots:pestle>,
	[
		[<thaumcraft:stone_arcane>],
		[null, <thaumcraft:stone_arcane>, <quark:polished_stone>],
		[null, <quark:polished_stone>, <quark:sturdy_stone>]
	]
);


//Imbuer
recipes.remove(<roots:imbuer>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_roots_imbuer", "", 50,
	[<aspect:terra> *5, <aspect:ordo> *3],
	<roots:imbuer>,
	[
		[<naturesaura:ancient_stick>, null, <naturesaura:ancient_stick>],
		[null, <roots:chiseled_runestone>],
		[<naturesaura:ancient_stick>, null, <naturesaura:ancient_stick>]
	]
);

//Imposer
recipes.remove(<roots:imposer>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_roots_imposer", "", 50,
    [<aspect:terra> *3, <aspect:ordo> *3, <aspect:perditio> *3],
    <roots:imposer>,
    [
        [<naturesaura:ancient_stick>, null, <naturesaura:ancient_stick>],
        [<roots:runestone_slab>, <roots:chiseled_runestone>, <roots:runestone_slab>]
    ]
);

//Fey Crafting
recipes.remove(<roots:fey_crafter>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_roots_fey_crafter", "", 75,
	[<aspect:aer> *2, <aspect:terra> *5, <aspect:ordo> *2],
	<roots:fey_crafter>,
	[
		[<ore:treeLeaves>, <twilightforest:twilight_sapling:1>, <ore:treeLeaves>],
		[<ore:treeLeaves>, <botania:livingwood>, <ore:treeLeaves>],
		[<roots:terra_moss>, <botania:livingwood>, <roots:wildroot>]
	]
);

//Grove Supplication
// solves a paradox by being a custom recipe (Roots Petals require Mortar, but that needs Fey Crafting...)
Rituals.modifyRitual("ritual_grove_supplication", [<ore:doorWood>, <ore:treeSapling>, <botania:petal:*>, <roots:wildroot>, <tconstruct:materials:18>]);

//Wildroot Growth
// solves another paradox (Spirit Herb needs Runic Shears, but that needs Fey Crafting...)
Rituals.modifyRitual("ritual_wildroot_growth", [<roots:wildroot>, <roots:bark_oak>, <roots:bark_spruce>, <roots:bark_dark_oak>, <botania:fertilizer>]);

//Gramary of the Forest
recipes.remove(<roots:gramary>);
Altar.addRecipe("mce_challengemode_forest_gramary", <bloodmagic:slate:2>, <roots:gramary>, <randomthings:naturecore>, 30000, 50);

print("--- challenge/roots.zs initialized ---");