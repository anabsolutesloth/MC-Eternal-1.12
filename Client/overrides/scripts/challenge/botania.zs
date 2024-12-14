#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.player.IPlayer;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.Conditions;

import mods.astralsorcery.Altar;
import mods.astralsorcery.LightTransmutation;

import mods.botania.ManaInfusion;
import mods.botania.Apothecary;
import mods.botania.ElvenTrade;
import mods.botania.PureDaisy;

import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Crucible;

import mods.roots.Fey;

import mods.naturesaura.TreeRitual;
import mods.naturesaura.Offering;

import scripts.challenge.misc_magic;
import scripts.challenge.blood_magic;

#MC Eternal Scripts

print("--- Loading challenge/botania.zs ---");

//Mana String
ManaInfusion.removeRecipe(manaResource.manaString);
ManaInfusion.addInfusion(manaResource.manaString, <ebwizardry:magic_silk>, 1250);

//Manasteel
// make with Nagrilite insted
ManaInfusion.removeRecipe(manaResource.manasteel);
ManaInfusion.removeRecipe(manaResource.manasteelBlock);

//Pixie Dust
// now using I&F Pixie Dust because hehe
ElvenTrade.removeRecipe(manaResource.pixieDust);
ElvenTrade.addRecipe([manaResource.pixieDust], [manaResource.manaPearl, <iceandfire:pixie_dust>]);

//Petal Apothecary
recipes.remove(<botania:altar:0>);
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/petal_apothecary", <botania:altar:0>, 700, 100, [
	<thaumcraft:slab_arcane_stone>, null, <thaumcraft:slab_arcane_stone>,
	null, <roots:runestone>, null,
	<roots:runestone_slab>, <roots:chiseled_runestone>, <roots:runestone_slab>
]);

//Pure Daisy
Apothecary.removeRecipe("puredaisy");
Apothecary.addRecipe("puredaisy", [<ore:crystalPureNetherQuartz>, <ore:petalWhite>, <ore:petalWhite>, <ore:crystalPureNetherQuartz>, <ore:petalWhite>, <ore:petalWhite>]);

//Diluted Mana Pool
recipes.remove(<botania:pool:2>);
addSalisMundusConversion(<botania:pool:2>, <ore:stoneMarble>);

//Hydroangea
Crucible.registerRecipe("mce_challengemode_early_hydroangea", "", getBotaniaFlower("hydroangeas"), <botania:flower:3>, [<aspect:aqua> *10, <aspect:desiderium> *4, <aspect:auram> *3]);
Crucible.registerRecipe("mce_challengemode_early_hydroangea_dx", "", getBotaniaFlower("hydroangeas") *2, <biomesoplenty:flower_0:4>, [<aspect:aqua> *10, <aspect:desiderium> *4, <aspect:auram> *3]);

//Endoflame
Apothecary.removeRecipe("endoflame");
getBotaniaFlower("endoflame").addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));

//Livingwood
addSalisMundusConversion(<botania:livingwood>, <roots:wildwood_log>);
PureDaisy.removeRecipe(<botania:livingwood>);

//Mana Pool
recipes.remove(<botania:pool:0>);
recipes.addShapeless("mce_challengemode_unfabulous_mana_pool", <botania:pool:0>, [<botania:pool:3>]);
Altar.addAttunementAltarRecipe("mce/shaped/altar/challengemode/mana_pool", <botania:pool:0>, 1800, 100, [
	<ore:dustFairy>, manaResource.manaDiamond, <ore:dustFairy>,
	<botania:livingrock:0>, null, <botania:livingrock:0>,
	<botania:livingrock:0>, <botania:pool:2>, <botania:livingrock:0>,
    manaResource.gaiaSpirit, manaResource.gaiaSpirit,
    manaResource.gaiaSpirit, manaResource.gaiaSpirit
]);

//Fabulous Mana Pool
recipes.remove(<botania:pool:3>);
Altar.addTraitAltarRecipe("mce:shaped/altar/challengemode/fabulous_mana_pool", <botania:pool:3>, 200, 80, [
	null, null, null,
	<botania:livingrock>, null, <botania:livingrock>,
	<botania:livingrock>, <botania:livingrock>, <botania:livingrock>,
	null, null, null, null,
	null, null, null, null, null, null, null, null,
	null, null, null, null,
	<twilightforest:twilight_sapling:9>, <botania:bifrostperm>, <botania:bifrostperm>, manaResource.gaiaSpirit
]);


//Livingrock
PureDaisy.removeRecipe(<botania:livingrock:0>);
PureDaisy.addRecipe(<naturesaura:infused_stone>, <botania:livingrock:0>, 1200);

//Mana Spreader
recipes.remove(<botania:spreader:0>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_mana_spreader", "", 25, 
	[<aspect:aer> *1, <aspect:aqua> *1, <aspect:ordo> *2],
	<botania:spreader:0>,
	[
		[<botania:livingwood>, <botania:livingwood>, <botania:livingwood>],
		[<thaumcraft:ingot:2>, <ebwizardry:crystal_block:0>],
		[<botania:livingwood>, <botania:livingwood>, <botania:livingwood>]
	]
);

//Mana Fluxfield
recipes.remove(<botania:rfgenerator>);
recipes.addShaped("mce_challengemode_mana_fluxfield", <botania:rfgenerator>, [
    [<botania:livingrock>, <botania:pool:2>, <botania:livingrock>],
    [<ore:blockRedstoneAlloy>, IEItem.redstoneEngineeringBlock, <ore:blockRedstoneAlloy>],
    [<botania:livingrock>, manaResource.redString, <botania:livingrock>]
]);

//Red String
recipes.remove(manaResource.redString);
ArcaneWorkbench.registerShapelessRecipe("mce_challengemode_red_string", "", 30,
    [<aspect:aer> *1, <aspect:ordo> *2, <aspect:aqua> *1],
    manaResource.redString,
    [
        manaResource.manaString,
        <ore:gemRedstone>,
        <wrcbe:material:2>,
        auraBottle("nether")
    ]
);

//Thermalily
// faster option for early managen, but requires tech generator
Crucible.registerRecipe("mce_challengemode_early_thermalily", "", getBotaniaFlower("thermalily"), <enderio:block_lava_generator>, [<aspect:herba> *15, <aspect:auram> *5, <aspect:ignis> *10, <aspect:desiderium> *4]);


//Kekimurus
Apothecary.removeRecipe("kekimurus");
getBotaniaFlower("kekimurus").addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));


//Dreamwood
LightTransmutation.addTransmutation(<roots:wildwood_planks>, <botania:dreamwood:1>, 10.0);


//Corporea Stuff
//Sparks
recipes.remove(<botania:corporeaspark:*>);
Fey.addRecipe("mce_challengemode_corporea_spark", <botania:corporeaspark> *4, [
    <bloodmagic:inscription_tool:1>.transformNew(function(item as IItemStack){
        return misc_magic.useInscriptionTool(item);
    }),
    <ore:dustFairy>,
    <ore:dustFairy>,
    <ore:dustFluix>,
    <mysticalworld:pearl>
]);

//Master Spark
recipes.addShapeless("mce_challengemode_master_corporea_spark", <botania:corporeaspark:1>.withLore([
        game.localize("mce.challengemode.crafting_info.consumes_demon_will").replace("%s", "20").replace("%t", game.localize("mce.challengemode.bloodmagic.will_type_any"))
    ]),
    [
        <botania:corporeaspark:0>,
        <bloodmagic:soul_gem:*>.marked("will").transformNew(function(item as IItemStack){
            return blood_magic.consumeGemWill(item, 20.0);
        })
    ],
    function(out as IItemStack, ins as IItemStack[string], cInfo as ICraftingInfo){
        if(blood_magic.checkGemWill(ins.will, 20.0))
            return <botania:corporeaspark:1>;
        else
            return null;
});

//Index
recipes.remove(<botania:corporeaindex>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_corporea_index", "", 75,
    [<aspect:ordo> *5, <aspect:aer> *4, <aspect:aqua> *4],
    <botania:corporeaindex>,
    [
        [null, EXU2Item.ineffableGlass, null],
        [EXU2Item.ineffableGlass, <botania:corporeaspark>, EXU2Item.ineffableGlass],
        [<ore:gemAmethyst>, EXU2Item.ineffableGlass, <ore:gemAmethyst>]
    ]
);

//Crystal Cube
recipes.remove(<botania:corporeacrystalcube>);
recipes.addShaped("mce_challengemode_corporea_crystal_cube", <botania:corporeacrystalcube>, [
    [<botania:corporeaspark>],
    [<botania:managlass>],
    [<botania:dreamwood1slab>]
]);

//Corporea End


//Gaia Ingot
/*
    NA Offerring to get from "inert" version, some sort of "living alloy" maybe?

*/
recipes.remove(manaResource.gaiaIngot);
Offering.addRecipe("mce_challenge_gaia_ingot", <ore:ingotLiving>, 4, <naturesaura:calling_spirit>, manaResource.gaiaIngot);

//Gaia Pylons
recipes.remove(<botania:pylon:2>);
Fey.addRecipe("mce_challengemode_gaia_pylon", <botania:pylon:2> *2, [
    <ore:ingotLiving>,
    <botania:pylon:0>,
    <botania:pylon:0>,
    <thebetweenlands:dye:6>,
    <ore:blockAmethyst>
]);

//Beacon
recipes.remove(<minecraft:beacon>);
Altar.addAttunementAltarRecipe("mce:altar/shaped/challengemode/beacon", <minecraft:beacon>, 1500, 100, [
    <botania:managlass>, <botania:managlass>, <botania:managlass>,
    <botania:managlass>, <astralsorcery:itemshiftingstar>, <botania:managlass>,
    blockMarble.normalSooty, blockMarble.chiseledSooty, blockMarble.normalSooty,
    <astralsorcery:itemusabledust:0>, <astralsorcery:itemusabledust:0>,
    <astralsorcery:itemusabledust:0>, <astralsorcery:itemusabledust:0>
]);

//Elven Gateway Core
recipes.remove(<botania:alfheimportal>);


//Natura Pylon
recipes.remove(<botania:pylon:1>);


//Gaia 2 loot tampering
//removing things :)
removeLootFromTable("botania:gaia_guardian_2", {
	"relics": ["botania:dice"]
});

val gaiaIITable = LootTweaker.getTable("botania:gaia_guardian_2");
gaiaIITable.removePool("black_lotuses");
gaiaIITable.removePool("overgrowth_seeds");
gaiaIITable.removePool("runes");

//add Die Fragment
getPoolFromTable("botania:gaia_guardian_2", "relics").addItemEntry(<contenttweaker:die_fragment>, 1, 0, [], [
        Conditions.killedByPlayer()
    ],
    "mce_challenge:die_fragment"
);


//Die of Fate craft


//Scrap Die Fragments for stuff
// kind of like modern botania die rolling after you have all the relics



print("--- challenge/botania.zs initialized ---");