#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.buildcraft.AssemblyTable;

import mods.immersiveengineering.Blueprint;

import mods.techreborn.alloySmelter;

#MC Eternal Scripts

print("--- loading challenge/tech_reborn.zs ---");

//Complex Archaic Machining Blueprint
recipes.addShaped("mce_challengemode_techreborn_machine_blueprint", <immersiveengineering:blueprint>.withTag({blueprint: "techreborn_machine"}), [
    [<ore:circuitBasic>, null, <openblocks:generic:11>],
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],
    [<ore:paper>, <ore:paper>, <ore:paper>]
]);

//Electronic Circuit
recipes.remove(<ore:circuitBasic>.firstItem);
AssemblyTable.addRecipe("mce_challengemode_techreborn_electronic_circuit", <ore:circuitBasic>.firstItem, 10000, [
    <ore:ingotRefinedIron> *2,
    <ore:itemSilicon>,
    <buildcraftsilicon:redstone_chipset>,
    <techreborn:cable:0> *3
]);

//Advanced Circuit
recipes.remove(<ore:circuitAdvanced>.firstItem);


//Advanced Alloy
furnace.remove(<ore:ingotAdvancedAlloy>);
alloySmelter.addRecipe(<ore:ingotAdvancedAlloy>.firstItem *2, <ore:ingotOsram>, <ore:ingotConstructionAlloy>, 200, 40);


//Machines

//Alloy Smelter
recipes.remove(<techreborn:alloy_smelter>);
Blueprint.addRecipe("techreborn_machine", <techreborn:alloy_smelter>, [
    <ore:machineBlockBasic>,
    <ore:circuitBasic>,
    <immersiveengineering:stone_decoration:10> *4,
    IEItem.copperCoil
]);

//Compressor
recipes.remove(<techreborn:compressor>);
Blueprint.addRecipe("techreborn_machine", <techreborn:compressor>, [
    <ore:machineBlockBasic>,
    <ore:circuitBasic>,
    <ore:craftingPiston>,
    IEMold.plate
]);

//Assembling Machine
recipes.remove(<techreborn:assembling_machine>);
Blueprint.addRecipe("techreborn_machine", <techreborn:assembling_machine>, [
    <ore:machineBlockBasic>,
    <ore:circuitBasic> *3,
    IEItem.conveyorNormal,
    <ore:plateAdvancedAlloy> *4
]);

//Electric Furnace
recipes.remove(<techreborn:electric_furnace>);
Blueprint.addRecipe("techreborn_machine", <techreborn:electric_furnace>, [
    <ore:circuitBasic>,
    <minecraft:furnace>,
    <ore:plateRefinedIron> *4
]);


print("--- challenge/tech_reborn.zs initialized ---");