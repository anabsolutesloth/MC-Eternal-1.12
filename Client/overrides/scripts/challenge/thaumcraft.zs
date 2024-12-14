#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;
import mods.thaumcraft.SmeltingBonus;
import mods.thaumcraft.SalisMundus;
import mods.thaumcraft.Crucible;

import mods.roots.Mortar;

#MC Eternal Scripts

print("--- Loading challenge/thaumcraft.zs ---");

//Making Salis Mundus better
// since you need it for Livingwood (automation)
Mortar.addRecipe("mce_challengemode_salis_mundus_dx", <thaumcraft:salis_mundus> *2, [
    <thaumcraft:crystal_essence>,
    <thaumcraft:crystal_essence>,
    <thaumcraft:crystal_essence>,
    <thaumcraft:crystal_essence>,
    <ore:dustRedstone>
]);

//mess with the Essentia Transfuser recipes to enforce use of pipes
// or just disable them outright or something, or make only one of them available

print("--- challenge/thaumcraft.zs initialized ---");