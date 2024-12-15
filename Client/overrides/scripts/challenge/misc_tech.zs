#packmode challenge
#priority 2

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

import mods.advancedrocketry.ArcFurnace;

import mods.enderio.AlloySmelter;
import mods.enderio.SagMill;

import mods.roots.Pyre;

import mods.tconstruct.Alloy;
import mods.tconstruct.Casting;

import mods.thermalexpansion.InductionSmelter;

import mods.immersiveengineering.BlastFurnace;

import mods.nuclearcraft.infuser;
import mods.nuclearcraft.alloy_furnace;

#MC Eternal Scripts

print("--- loading challenge/misc_tech.zs ---");


// Quantum Quarry
recipes.remove(<extrautils2:quarry>);
recipes.addShaped("mce_challengemode_quantum_quarry_core", <extrautils2:quarry>, [
	[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>],
	[<theaurorian:moongem>, <ore:magic_snow_globe>, <theaurorian:moongem>],
	[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>]
]);


//Rainbow Generator (evil edition)
recipes.removeByRecipeName("extrautils2:rainbow_gen");
recipes.addShaped("mce_challengemode_rainbow_gen", <extrautils2:rainbowgenerator:0>, [
	[<openblocks:technicolor_glasses>, <extrautils2:rainbowgenerator:2>, <doggytalents:multicoloured_collar>],
	[<taiga:adamant_ingot>, <nuclearcraft:rtg_californium>, <taiga:adamant_ingot>],
	[<quark:rune:16>, <extrautils2:rainbowgenerator:1>, <actuallyadditions:item_color_lens>]
]);


//Dried Bricks fast Alt recipe
// used in IE Kiln Bricks
Pyre.addRecipe("mce_challengemode_dried_brick_alt", <tconstruct:materials:2> *4, [
	<ore:sand>,
	<ore:clayBall>,
	<ore:clayBall>,
	<ore:clayBall>,
	<ore:clayBall>
]);


//Plate control
val plateProducingRecipes as string[] = [
	"immersiveengineering:material/plate_aluminum",
	"immersiveengineering:material/plate_constantan",
	"immersiveengineering:material/plate_copper",
	"immersiveengineering:material/plate_electrum",
	"immersiveengineering:material/plate_gold",
	"immersiveengineering:material/plate_iron",
	"immersiveengineering:material/plate_lead",
	"immersiveengineering:material/plate_nickel",
	"immersiveengineering:material/plate_silver",
	"immersiveengineering:material/plate_steel",
	"immersiveengineering:material/plate_uranium",
	"immersiveengineering:compat/plate_thaumium_brass",
	"immersiveengineering:compat/plate_thaumium_thaumium",
	"immersiveengineering:compat/plate_thaumium_void",
	"bewitchment:compat/silver_plate",
	"bewitchment:compat/cold_iron_plate",
	"thaumcraft:brassplate",
	"thaumcraft:thaumiumplate",
	"thaumcraft:voidplate",
	"thaumcraft:ironplate"
];

for name in plateProducingRecipes {
	recipes.removeByRecipeName(name);
}

//Early Silicon from Sand removal
mods.mekanism.crusher.removeRecipe(<ore:itemSilicon>);
SagMill.removeRecipe(<minecraft:sand>);
SagMill.removeRecipe(<minecraft:clay>);
SagMill.addRecipe([(<minecraft:clay_ball> *4) % 100], <ore:blockClay>, "NONE", 2400);

//No Graphite via Smeltery
mods.tconstruct.Casting.removeTableRecipe(<nuclearcraft:ingot:8>);

//Removing TR Iron Alloy Furnace
basicDisable(<techreborn:iron_alloy_furnace>, "", true);
mods.jei.JEI.hide(<techreborn:iron_alloy_furnace>);


//Steel

//IE furnace is 1200 ticks by default
BlastFurnace.addRecipe(<ore:ingotSteel>.firstItem, <ore:ingotIron>, 400, IEItem.slag);
BlastFurnace.addRecipe(<ore:blockSteel>.firstItem, <ore:blockIron>, 400 * 9, IEItem.slag *9);

//AlloySmelter.removeByInputs(<ore:ingotIron>.firstItem, <minecraft:coal>, <ore:dustCoal>.firstItem); //spits an error and doesn't work, so commented out for now
AlloySmelter.removeByInputs(<ore:ingotIron>.firstItem, <ore:fuelCoke>.firstItem);

//Removing Steel from other things
alloy_furnace.removeRecipeWithOutput([<ore:ingotSteel>.firstItem]);
InductionSmelter.removeRecipe(<ore:ingotIron>.firstItem, <ore:dustCoal>.firstItem);
InductionSmelter.removeRecipe(<ore:ingotIron>.firstItem, <ore:dustCharcoal>.firstItem);
InductionSmelter.removeRecipe(<ore:ingotIron>.firstItem, <ore:fuelCoke>.firstItem);
InductionSmelter.removeRecipe(<ore:dustIron>.firstItem, <ore:dustCoal>.firstItem);
InductionSmelter.removeRecipe(<ore:dustIron>.firstItem, <ore:dustCharcoal>.firstItem);
InductionSmelter.removeRecipe(<ore:dustIron>.firstItem, <ore:fuelCoke>.firstItem);
ArcFurnace.removeRecipe(<ore:ingotSteel>.firstItem);
AlloySmelter.removeRecipe(<ore:ingotSteel>.firstItem);


//Rod recipes
recipes.remove(<libvulpes:productrod:*>);
recipes.remove(<advancedrocketry:productrod:*>);
recipes.remove(<immersiveengineering:material:1>);
recipes.remove(<immersiveengineering:material:2>);
recipes.remove(<immersiveengineering:material:3>);
recipes.remove(<immersiveposts:metal_rods:*>);

val rodMaterials as IOreDictEntry[IItemStack] = {
	<immersiveengineering:material:1>: <ore:ingotIron>,
	<immersiveengineering:material:2>: <ore:ingotSteel>,
	<immersiveengineering:material:3>: <ore:ingotAluminum>,
	<immersiveposts:metal_rods:0>: <ore:ingotGold>,
	<immersiveposts:metal_rods:1>: <ore:ingotCopper>,
	<immersiveposts:metal_rods:2>: <ore:ingotLead>,
	<immersiveposts:metal_rods:3>: <ore:ingotSilver>,
	<immersiveposts:metal_rods:4>: <ore:ingotNickel>,
	<immersiveposts:metal_rods:5>: <ore:ingotConstantan>,
	<immersiveposts:metal_rods:6>: <ore:ingotElectrum>,
	<immersiveposts:metal_rods:7>: <ore:ingotUranium>
};

for rod,ingot in rodMaterials {
	recipes.addShaped("mce_challengemode_"+ (ingot.name.substring(5, ingot.name.length)) +"_rod", rod *4, [
		[ingot, IEItem.hammer.transformNew(function(item as IItemStack){
			return damageIETool(item, 4);
		})],
		[ingot],
		[ingot]
	]);
}

//Thermal Strange Alloys
//Removal
//Dust Crafting
recipes.removeByRecipeName("thermalfoundation:dust_signalum");
recipes.removeByRecipeName("thermalfoundation:dust_lumium");
recipes.removeByRecipeName("thermalfoundation:dust_enderium");
//EIO Alloy Smelter
AlloySmelter.removeRecipe(<ore:ingotSignalum>.firstItem);
AlloySmelter.removeRecipe(<ore:ingotLumium>.firstItem);
AlloySmelter.removeRecipe(<ore:ingotEnderium>.firstItem);
AlloySmelter.removeRecipe(<enderio:item_material:39>);
//TConstruct Alloying
Alloy.removeRecipe(<liquid:signalum>);
Alloy.removeRecipe(<liquid:lumium>);
Alloy.removeRecipe(<liquid:enderium>);
//Nuclearcraft Fluid Infuser
infuser.removeRecipeWithOutput([<ore:ingotSignalum>.firstItem]);
infuser.removeRecipeWithOutput([<ore:ingotLumium>.firstItem]);
infuser.removeRecipeWithOutput([<ore:ingotEnderium>.firstItem]);
//AR EAF
ArcFurnace.removeRecipe(<ore:ingotSignalum>.firstItem);
ArcFurnace.removeRecipe(<ore:ingotLumium>.firstItem);
ArcFurnace.removeRecipe(<ore:ingotEnderium>.firstItem);


//EIO Alloys
//Removal
Alloy.removeRecipe(<liquid:energetic_alloy>);
Alloy.removeRecipe(<liquid:vibrant_alloy>);
Alloy.removeRecipe(<liquid:redstone_alloy>);
Alloy.removeRecipe(<liquid:conductive_iron>);
Alloy.removeRecipe(<liquid:pulsating_iron>);
Alloy.removeRecipe(<liquid:dark_steel>);


//NC Alloys
//Removal
Alloy.removeRecipe(<liquid:ferroboron>);
Alloy.removeRecipe(<liquid:tough>);
Alloy.removeRecipe(<liquid:hard_carbon>);
Alloy.removeRecipe(<liquid:unsweetened_chocolate>);
Alloy.removeRecipe(<liquid:dark_chocolate>);
Alloy.removeRecipe(<liquid:milk_chocolate>);
Alloy.removeRecipe(<liquid:hydrated_gelatin>);
Alloy.removeRecipe(<liquid:marshmallow>);


print("--- challenge/misc_tech.zs initialized ---");