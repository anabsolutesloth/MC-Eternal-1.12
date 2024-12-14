#MC Eternal Scripts

print("--- loading FairyDust.zs ---");

#Add Recipes
recipes.addShaped(<ebwizardry:grand_crystal>, [[<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>], [<wings:fairy_dust>, <ebwizardry:magic_crystal>, <wings:fairy_dust>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<ebwizardry:charm_haggler>, [[<minecraft:gold_ingot>, <minecraft:gold_block>, <ore:ingotGold>], [<wings:fairy_dust>, <minecraft:gold_ingot>, <wings:fairy_dust>], [null, <minecraft:gold_block>, null]]);
recipes.addShaped(<ebwizardry:charm_spell_discovery>, [[<minecraft:gold_ingot>, <minecraft:gold_block>, <ore:ingotGold>], [<wings:fairy_dust>, <minecraft:gold_ingot>, <wings:fairy_dust>], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<ebwizardry:amulet_banishing>, [[<minecraft:gold_ingot>, null, <ore:ingotGold>], [null, <minecraft:gold_ingot>, null], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<ebwizardry:magic_crystal>, [[<wings:fairy_dust>]]);
recipes.addShaped(<ebwizardry:amulet_warding>, [[null, <ebwizardry:magic_crystal>, null], [<ore:dustFairy>, <minecraft:iron_block>, <ore:dustFairy>], [null, <ebwizardry:magic_crystal>, null]]);
recipes.addShaped(<ebwizardry:arcane_tome:3>, [[<iceandfire:sea_serpent_scale_block_purple>, <ebwizardry:magic_crystal>, <iceandfire:sea_serpent_scale_block_purple>], [<wings:fairy_dust>, <ancientspellcraft:charm_evergrowing_crystal>, <wings:fairy_dust>], [<iceandfire:sea_serpent_scale_block_purple>, <ebwizardry:magic_crystal>, <iceandfire:sea_serpent_scale_block_purple>]]);
recipes.addShaped(<ebwizardry:ring_battlemage>, [[null, <ore:dustFairy>, null], [<ore:dustFairy>, <dungeontactics:golden_ring>, <ore:dustFairy>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<biomesoplenty:sapling_0:3>, [[<wings:fairy_dust>, <ebwizardry:magic_crystal>, <wings:fairy_dust>], [<wings:fairy_dust>, <ore:treeSapling>, <wings:fairy_dust>], [<wings:fairy_dust>, <ebwizardry:magic_crystal>, <wings:fairy_dust>]]);
recipes.addShaped(<twilightforest:minotaur_axe_gold>, [[<minecraft:gold_ingot>, <minecraft:gold_ingot>], [<minecraft:gold_ingot>, <wings:fairy_dust>], [null, <wings:fairy_dust>]]);
recipes.addShaped(<ancientspellcraft:charm_bucket_coal>, [[<wings:fairy_dust>, null, <wings:fairy_dust>], [<wings:fairy_dust>, <minecraft:coal>, <wings:fairy_dust>], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<twilightforest:magic_beans>, [[<wings:fairy_dust>, <wings:fairy_dust>, <wings:fairy_dust>], [<wings:fairy_dust>, <mowziesmobs:foliaath_seed>, <wings:fairy_dust>], [<wings:fairy_dust>, <wings:fairy_dust>, <wings:fairy_dust>]]);
recipes.addShaped(<cyclicmagic:purple_chestplate>, [[<ore:dustFairy>, <minecraft:sea_lantern>, <wings:fairy_dust>], [<wings:fairy_dust>, <minecraft:iron_chestplate>, <wings:fairy_dust>], [<wings:fairy_dust>, <minecraft:sea_lantern>, <wings:fairy_dust>]]);
recipes.addShaped(<minecraft:dirt:2>, [[null, <wings:fairy_dust>, null], [<wings:fairy_dust>, <minecraft:dirt>, <wings:fairy_dust>], [null, <ore:dustFairy>, null]]);
recipes.addShapeless(<minecraft:sand> *8, [<wings:fairy_dust>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>]);
recipes.addShapeless(<minecraft:gravel> *8, [<wings:fairy_dust>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>,]);
recipes.addShaped(<theaurorian:moonstonesword>, [[null, <futuremc:netherite_scrap>, <futuremc:netherite_ingot>], [null, <minecraft:diamond_sword>, <futuremc:netherite_scrap>], [<wings:fairy_dust>, null, null]]);
recipes.addShaped(<twilightforest:ice_sword>, [[null, <wings:fairy_dust>, <wings:fairy_dust>], [null, <minecraft:golden_sword>, <wings:fairy_dust>], [<wings:fairy_dust>, null, null]]);
recipes.addShaped(<twilightforest:steeleaf_sword>, [[null, <ore:dustFairy>, <wings:fairy_dust>], [null, <minecraft:iron_sword>, <wings:fairy_dust>], [<wings:fairy_dust>, null, null]]);
recipes.addShaped(<harvestcraft:fairybreaditem>, [[null, <wings:fairy_dust>, null], [<wings:fairy_dust>, <harvestcraft:cinnamonbreaditem>, <wings:fairy_dust>], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<ancientspellcraft:ring_mana_transfer>, [[null, <ebwizardry:magic_crystal>, null], [<ore:dustFairy>, <dungeontactics:golden_ring>, <ore:dustFairy>], [null, <ebwizardry:magic_crystal>, null]]);
recipes.addShaped(<ancientspellcraft:ring_prismarine>, [[null, <ore:gemPrismarine>, null], [<ore:dustFairy>, <dungeontactics:golden_ring>, <ore:dustFairy>], [null, <ore:gemPrismarine>, null]]);

//Metal Transmutations
// adam added a tooltip that says it can transmute certain metals, but it could only transmute between iron and gold
//Iron and Copper
recipes.addShapeless("mce_fairy_dust_transmute_copper_to_iron", <ore:ingotIron>.firstItem, [<ore:ingotCopper>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>]);
recipes.addShapeless("mce_fairy_dust_transmute_iron_to_copper", <ore:ingotCopper>.firstItem, [<ore:ingotIron>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>]);
//Gold and Silver
recipes.addShapeless("mce_fairy_dust_transmute_silver_to_gold", <ore:ingotGold>.firstItem, [<ore:ingotSilver>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>]);
recipes.addShapeless("mce_fairy_dust_transmute_gold_to_silver", <ore:ingotSilver>.firstItem, [<ore:ingotGold>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>]);
//Platinum and Nickel
recipes.addShapeless("mce_fairy_dust_transmute_nickel_to_platinum", <ore:ingotPlatinum>.firstItem, [<ore:ingotNickel>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>, <ore:dustFairy>]);
recipes.addShapeless("mce_fairy_dust_transmute_platinum_to_nickel", <ore:ingotNickel>.firstItem, [<ore:ingotPlatinum>, <ore:dustFairy>, <ore:dustFairy>]);

print("--- FairyDust.zs initialized ---");	
