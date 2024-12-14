#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import crafttweaker.recipes.ICraftingInfo;

import mods.astralsorcery.Altar;

import mods.bloodmagic.BloodAltar;
import mods.bloodmagic.TartaricForge;
import mods.bloodmagic.AlchemyArray;

import mods.roots.Fey;
import mods.roots.Mortar;

import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

#MC Eternal Scripts

print("--- Loading challenge/blood_magic.zs ---");

//Slates
// Blank
BloodAltar.removeRecipe(<minecraft:stone>);
BloodAltar.addRecipe(<bloodmagic:slate:0>, <midnight:nightstone>, 0, 500, 10, 5);

// Reinforced
//gotten with Trenchstone from Midnight
BloodAltar.removeRecipe(<bloodmagic:slate:0>);

// Imbued
//gotten with Ebonite from Midnight
BloodAltar.removeRecipe(<bloodmagic:slate:1>);

// Demonic
BloodAltar.removeRecipe(<bloodmagic:slate:2>);
//BloodAltar.addRecipe(<bloodmagic:slate:3>, <>, 3, 10000, 50, 100);

// Ethereal
BloodAltar.removeRecipe(<bloodmagic:slate:3>);
BloodAltar.addRecipe(<bloodmagic:slate:4>, <thaumicaugmentation:stone:0>, 4, 20000, 100, 250);


//Orbs
//Weak
BloodAltar.removeRecipe(<minecraft:diamond>);
BloodAltar.addRecipe(getBloodOrb("weak"), <botania:manaresource:2>, 0, 2000, 10, 20);

//Apprentice
BloodAltar.removeRecipe(<minecraft:redstone_block>);
BloodAltar.addRecipe(getBloodOrb("apprentice"), <minecraft:dirt:1>, 1, 5000, 15, 25);

//Magician
BloodAltar.removeRecipe(<minecraft:gold_block>);
BloodAltar.addRecipe(getBloodOrb("magician"), <thebetweenlands:life_crystal:0>, 2, 10000, 20, 30);

// Master
BloodAltar.removeRecipe(<bloodmagic:blood_shard:0>);
BloodAltar.addRecipe(getBloodOrb("master"), <astralsorcery:itemshiftingstar>, 3, 40000, 50, 50);

//Archmage
BloodAltar.removeRecipe(<minecraft:nether_star>);
BloodAltar.addRecipe(getBloodOrb("archmage"), <thaumcraft:voidseer_charm>, 4, 100000, 100, 100);


//Bloodstone Tile
recipes.removeByRecipeName("bloodmagic:decorative_brick_bloodstone_tile");
Infusion.registerRecipe("mce_challengemode_bloodstone_tile", "", <bloodmagic:decorative_brick:0>, 3, [
		<aspect:victus> * 30,
		<aspect:mortuus> * 20,
		<aspect:spiritus> * 20,
		<aspect:desiderium> * 10,
		<aspect:diabolus> * 10
	],
	<thaumcraft:stone_arcane>,
	[
		<bloodmagic:blood_shard:0>,
		<bewitchment:dragons_blood_resin>,
		<bloodmagic:blood_shard:0>,
		<vampirism:pure_blood:2>,
	]
);
//for after you make tier 4, for deco purposes
BloodAltar.addRecipe(<bloodmagic:decorative_brick:0>, <thaumcraft:stone_arcane>, 3, 2500, 100, 100);


//Sacrificial Dagger
recipes.remove(<bloodmagic:sacrificial_dagger>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_sacrificial_dagger", "", 50,
	[<aspect:aqua> * 5, <aspect:terra>* 5, <aspect:ordo> *3, <aspect:perditio> * 3],
	<bloodmagic:sacrificial_dagger>,
	[	
		[<appliedenergistics2:quartz_glass>, <appliedenergistics2:quartz_glass>, <ancientspellcraft:battlemage_sword_blade>],
		[null, getTconPart("crossguard", "manyullyn"), <appliedenergistics2:quartz_glass>],
		[getTconPart("toolrod", "cobalt"), null, <appliedenergistics2:quartz_glass>]
	]
);

//Blood Altar
recipes.remove(<bloodmagic:altar>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_blood_altar", "", 50,
	[<aspect:aqua> *5, <aspect:terra> *5, <aspect:ordo> *3, <aspect:perditio> *3],
	<bloodmagic:altar>,
	[
		[<ore:ingotDemonicMetal>, null, <ore:ingotDemonicMetal>],
		[<thaumcraft:stone_arcane>, <vampirism:altar_inspiration>, <thaumcraft:stone_arcane>],
		[<roots:chiseled_runestone>, <bloodmagic:monster_soul>, <roots:chiseled_runestone>]
	]
);

//Rudimentary Snare
recipes.remove(<bloodmagic:soul_snare>);
Fey.addRecipe("mce_challengemode_rudimentary_snare", <bloodmagic:soul_snare> *12, [
	<bewitchment:ectoplasm>,
	<randomthings:ingredient:12>,
	<randomthings:ingredient:12>,
	getTconPart("knifeblade", "ma.soulium"),
	getTconPart("crossguard", "iron")
]);

//Sentient Sword
TartaricForge.removeRecipe([<minecraft:iron_sword>, <bloodmagic:soul_gem:0>]);
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/sentient_sword", <bloodmagic:sentient_sword>, 500, 100, [
	null, null, getTconPart("swordblade", "ma.base_essence"),
	null, getTconPart("wideguard", "duranite"), null,
	<bloodmagic:soul_gem:0>, getTconPart("toolrod", "steel"), null
]);

//Hellfire Forge
recipes.remove(<bloodmagic:soul_forge>);
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/hellfire_forge", <bloodmagic:soul_forge>, 650, 100, [
    <ore:ingotDuranite>, getTconPart("pan", "ma.base_essence"), <ore:ingotDuranite>,
	<thaumcraft:stone_arcane>, <thaumcraft:slab_arcane_stone>, <thaumcraft:stone_arcane>,
    blockMarble.pillarSooty, null, blockMarble.pillarSooty
]);

//Arcane Ashes
TartaricForge.removeRecipe([<ore:dustRedstone>.firstItem, <ore:dyeWhite>.firstItem, <minecraft:gunpowder>, <minecraft:coal>]);
Mortar.addRecipe("mce_challengemode_arcane_ashes", <bloodmagic:arcane_ashes>, [
	<thaumcraft:salis_mundus>,
	<ebwizardry:grand_crystal>,
	<bloodmagic:slate:1>,
	<quark:black_ash>,
	<quark:black_ash>
]);


//Inscription Tools
//Water
BloodAltar.removeRecipe(<minecraft:lapis_block>);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:1>.withTag({uses: 10}), <xreliquary:mob_ingredient:10>, 2, 2500, 100, 100);
//Fire
BloodAltar.removeRecipe(<minecraft:magma_cream>);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:2>.withTag({uses: 10}), <xreliquary:mob_ingredient:7>, 2, 2500, 100, 100);
//Earth
BloodAltar.removeRecipe(<minecraft:obsidian>);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:3>.withTag({uses: 10}), <xreliquary:mob_ingredient:9>, 2, 2500, 100, 100);
//Air
BloodAltar.removeRecipe(<minecraft:ghast_tear>);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:4>.withTag({uses: 10}), <xreliquary:mob_ingredient:8>, 2, 2500, 100, 100);


//Tartaric Gems
//Petty
TartaricForge.removeRecipe([<minecraft:gold_ingot>, <minecraft:redstone>, <ore:dyeBlue>.firstItem, <minecraft:glass>]);
TartaricForge.addRecipe(<bloodmagic:soul_gem:0>, [<ore:crystalPureCertusQuartz>, <randomthings:ingredient:2>], 1.0, 1.0);


//Sigils
//Air Sigil
AlchemyArray.removeRecipe(<bloodmagic:component:2>, <bloodmagic:slate:1>);
AlchemyArray.addRecipe(<bloodmagic:sigil_air>, <bloodmagic:component:2>, <bloodmagic:slate:3>, "bloodmagic:textures/models/alchemyarrays/airsigil.png");


//Functions to consume Will from a Tartaric Gem in crafting
function checkGemWill(stack as IItemStack, amount as float) as bool {
    if(!isNull(stack.tag.souls) && stack.tag.souls as float >= amount) return true;
    return false;
}

function consumeGemWill(item as IItemStack, amount as float) {
    return item.updateTag({souls: (item.tag.souls as float - amount)});
}

print("--- challenge/blood_magic.zs initialized ---");