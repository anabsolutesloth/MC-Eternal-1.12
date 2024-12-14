#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#MC Eternal Scripts

print("--- Loading challenge/nuclearcraft.zs ---");

//Manufactory
recipes.remove(<nuclearcraft:manufactory_idle>);
recipes.addShaped("mce_challengemode_manufactory_temp", <nuclearcraft:manufactory_idle>, [
    [<ore:ingotTough>, <ore:dustRedstone>, <ore:ingotTough>],
    [<techreborn:part:4>, <minecraft:piston>, <techreborn:part:4>],
    [<ore:ingotTough>, <ore:solenoidCopper>, <ore:ingotTough>]
]);


print("--- challenge/nuclearcraft.zs initialized ---");