import mods.thermalexpansion.InductionSmelter;
import mods.tconstruct.Melting;

import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

#MC Eternal Scripts

print("--- loading MowziesMobs.zs ---");

#Add Recipe
recipes.addShaped(<mowziesmobs:earth_talisman>, [
    [<ore:pearlEnderEye>, <minecraft:dragon_egg>, <ore:pearlEnderEye>],
    [<extrautils2:decorativesolidwood:1>, <tconstruct:materials:50>, <extrautils2:decorativesolidwood:1>],
    [<ore:pearlEnderEye>, <iceandfire:cyclops_eye>, <ore:pearlEnderEye>]
]);


//Steel from the Wroughnaught
//Scrapping Wroughtnaught equipment
//Smeltery Melting
Melting.addRecipe(<liquid:steel> *720, <mowziesmobs:wrought_helmet>, 1200);
Melting.addRecipe(<liquid:steel> *720, <mowziesmobs:wrought_axe>, 1200);
//Induction Smelter
InductionSmelter.addRecipe(<ore:ingotSteel>.firstItem *5, <mowziesmobs:wrought_helmet>, <minecraft:sand>, 6000, <thermalfoundation:material:864>, 25);
InductionSmelter.addRecipe(<ore:ingotSteel>.firstItem *5, <mowziesmobs:wrought_axe>, <minecraft:sand>, 6000, <thermalfoundation:material:864>, 25);

//direct Steel drops from Wroughtnaught
getNewPool("mowziesmobs:entities/ferrous_wroughtnaut", "mce:ferrous_wroughtnaut_steel_ingot", {}).addItemEntry(<ore:ingotSteel>.firstItem, 1, 0, [
		Functions.setCount(16, 20)
	],
	[
		Conditions.killedByPlayer()
	],
	"mce:wroughtnaught_steel_ingot"
);
getNewPool("mowziesmobs:entities/ferrous_wroughtnaut", "mce:ferrous_wroughtnaut_steel_plate", {}).addItemEntry(<ore:plateSteel>.firstItem, 1, 0, [
		Functions.setCount(8, 12)
	],
	[
		Conditions.killedByPlayer()
	],
	"mce:wroughtnaught_steel_plate"
);


print("--- MowziesMobs.zs initialized ---");	