import mods.naturesaura.AnimalSpawner;
import mods.roots.Mortar;

#MC Eternal Scripts

print("--- loading natures_aura.zs ---");

//Altar of Birthing

//Thermal Elementals
//Blizz
AnimalSpawner.addRecipe("mce_thermal_blizz", "thermalfoundation:blizz", 120000, 120, [<naturesaura:birth_spirit>, <ore:rodBlizz>, <minecraft:snow>]);
//Blitz
AnimalSpawner.addRecipe("mce_thermal_blitz", "thermalfoundation:blitz", 120000, 120, [<naturesaura:birth_spirit>, <ore:rodBlitz>, <minecraft:sandstone>]);
//Basalz
AnimalSpawner.addRecipe("mce_thermal_basalz", "thermalfoundation:basalz", 120000, 120, [<naturesaura:birth_spirit>, <ore:rodBasalz>, <minecraft:obsidian>]);


//Rats
//Rat (friend :>)
AnimalSpawner.addRecipe("mce_rat", "rats:rat", 30000, 80, [<naturesaura:birth_spirit>, <rats:block_of_cheese>]);

//Feral Ratlantean
AnimalSpawner.addRecipe("mce_feral_ratlantean", "rats:feral_ratlantean", 90000, 120, [<naturesaura:birth_spirit>, <rats:feral_rat_claw>, <rats:rat_pelt>, <rats:ratglove_petals>]);

//Ratlantean Spirit
AnimalSpawner.addRecipe("mce_ratlantean_spirit", "rats:ratlantean_spirit", 75000, 100, [<naturesaura:birth_spirit>, <rats:ratlantean_flame>, <rats:cheese>]);


//Ice and Fire
//Amphithere
AnimalSpawner.addRecipe("mce_amphithere", "iceandfire:amphithere", 300000, 300, [<naturesaura:birth_spirit>, <enderio:item_material:7>, <stevescarts:cartmodule:101>, <bloodmagic:component:2>]);

//Pixie
AnimalSpawner.addRecipe("mce_pixie", "iceandfire:if_pixie", 45000, 80, [<naturesaura:birth_spirit>, <iceandfire:pixie_dust>]);

//Hippogryph
AnimalSpawner.addRecipe("mce_hippogryph", "iceandfire:hippogryph", 120000, 120, [<naturesaura:birth_spirit>, <cqrepoured:leather_bull>, <fossil:horse_dna>, <fossil:chicken_dna>]);
//Alt using Egg
AnimalSpawner.addRecipe("mce_hippogryph_from_egg", "iceandfire:hippogryph", 900000, 80, [<naturesaura:birth_spirit>, <iceandfire:hippogryph_egg:*>, <fossil:cooked_chicken_soup>]);

//Hippocampus
AnimalSpawner.addRecipe("mce_hippocampus", "iceandfire:hippocampus", 120000, 120, [<naturesaura:birth_spirit>, <iceandfire:shiny_scales>, <minecraft:sponge>]);

//Cockatrice (death chicken)
AnimalSpawner.addRecipe("mce_cockatrice", "iceandfire:if_cockatrice", 120000, 100, [<naturesaura:birth_spirit>, <iceandfire:rotten_egg>, <fossil:chicken_dna>]);


//Undead Rising
//Moogma
AnimalSpawner.addRecipe("mce_moogma", "mod_lavacow:lavacow", 200000, 200, [<naturesaura:birth_spirit>,
	<mod_lavacow:potion_of_mooten_lava>,
	<minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}),
	<fossil:cow_dna>
]);


//Eerie Entities
//Wisp
AnimalSpawner.addRecipe("mce_eerieentities_wisp", "eerieentities:wisp", 10000, 100, [<naturesaura:birth_spirit>, <astralsorcery:itemusabledust:0>]);


//Mystical World
//Fox
AnimalSpawner.addRecipe("mce_mysticalworld_fox", "mysticalworld:entity_fox", 30000, 100, [<naturesaura:birth_spirit>, <mysticalworld:pelt>, <minecraft:chicken>]);

//Frog
AnimalSpawner.addRecipe("mce_mysticalworld_frog", "mysticalworld:entity_frog", 30000, 100, [<naturesaura:birth_spirit>, <minecraft:slime_ball>, <bloodmagic:component:0>]);

//Beetle
AnimalSpawner.addRecipe("mce_mysticalworld_beetle", "mysticalworld:entity_beetle", 30000, 100, [<naturesaura:birth_spirit>, <mysticalworld:beetle_mask>]);

//Deer
AnimalSpawner.addRecipe("mce_mysticalworld_deer", "mysticalworld:entity_deer", 30000, 100, [<naturesaura:birth_spirit>, <mysticalworld:antler_hat>]);

//Sprout
AnimalSpawner.addRecipe("mce_mysticalworld_sprout", "mysticalworld:entity_sprout", 30000, 100, [<naturesaura:birth_spirit>, <minecraft:melon>, <minecraft:beetroot>, <mysticalworld:aubergine>]);

//Hell Sprout
AnimalSpawner.addRecipe("mce_mysticalworld_hell_sprout", "mysticalworld:entity_hell_sprout", 20000, 100, [<naturesaura:birth_spirit>, <minecraft:nether_wart_block>, <minecraft:blaze_powder>]);

//Owl
AnimalSpawner.addRecipe("mce_mysticalworld_owl", "mysticalworld:entity_owl", 30000, 100, [<naturesaura:birth_spirit>, <roots:mystic_feather>, <ore:logWood>]);

//Lava Cat
AnimalSpawner.addRecipe("mce_mysticalworld_lava_cat", "mysticalworld:entity_lava_cat", 30000, 100, [<naturesaura:birth_spirit>, <minecraft:lava_bucket>, <minecraft:obsidian>, <minecraft:blaze_powder>]);

//Clam
AnimalSpawner.addRecipe("mce_mysticalworld_clam", "mysticalworld:entity_clam", 45000, 100, [<naturesaura:birth_spirit>, <mysticalworld:pearl_block>, <minecraft:sand>]);

//Altar of Birthing end


//NA Gold Powder in Roots Mortar
// enforced in challenge mode
Mortar.addRecipe("mce_gold_powder_in_roots_mortar", <naturesaura:gold_powder> *2, [<naturesaura:gold_leaf>]);

print("--- natures_aura.zs initialized ---");