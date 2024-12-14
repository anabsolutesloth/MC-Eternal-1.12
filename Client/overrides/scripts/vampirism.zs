

#MC Eternal Scripts

print("--- loading vampirism.zs ---");

//Crafting Pure Blood with Magic mods
// because i can't be bothered to try and fix vampire baron spawnrates, it will suck i am sure.

// tier 1
mods.thaumcraft.Crucible.registerRecipe("mce_pure_blood_1", "", <vampirism:pure_blood:0>, <vampirism:blood_bottle:9>, [<aspect:victus> *30, <aspect:alkimia> *20, <aspect:auram> *11]);

// tier 2
mods.naturesaura.Altar.addRecipe("mce_pure_blood_2", <vampirism:pure_blood:0>, <vampirism:pure_blood:1>, <ebwizardry:crystal_block:1>, 52000, 600);

// tier 3
mods.roots.Pyre.addRecipe("mce_pure_blood_3", <vampirism:pure_blood:2>, [<vampirism:pure_blood:1>, <midnight:rouxe>, <ebwizardry:spectral_dust:1>, <thebetweenlands:crimson_middle_gem>, <tconstruct:slime:3>], 3);

// tier 4
mods.bloodmagic.TartaricForge.addRecipe(<vampirism:pure_blood:3>, [<vampirism:pure_blood:2>, <bloodmagic:blood_shard>, <bewitchment:demon_heart>, <xreliquary:angelheart_vial>], 880, 440);

// tier 5
mods.botania.ElvenTrade.addRecipe([<vampirism:pure_blood:4>], [<vampirism:pure_blood:3>, <botania:manaresource:5>, <bloodmagic:activation_crystal:1>, <twilightforest:carminite>, <iceandfire:fire_dragon_blood>]);


print("--- vampirism.zs initialized ---");
