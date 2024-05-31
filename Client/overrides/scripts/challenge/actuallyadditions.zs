#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;

import mods.actuallyadditions.AtomicReconstructor;

#MC Eternal Scripts

print("--- Loading challenge/actuallyadditions.zs ---");

//AA Storage Crate stuff
// big, and only just a bunch of wood, needs more evil
//Small Storage Crate (evil version)
recipes.remove(<actuallyadditions:block_giant_chest>);
recipes.addShaped("mce_challengemode_small_storage_crate", <actuallyadditions:block_giant_chest>, [
	[<immersiveengineering:wooden_decoration:1>, <immersiveengineering:wooden_device0>, <immersiveengineering:wooden_decoration:1>],
	[<forestry:oak_stick>, <actuallyadditions:block_misc:4>, <forestry:oak_stick>],
	[<immersiveengineering:wooden_decoration:1>, <ironchest:iron_chest:2>, <immersiveengineering:wooden_decoration:1>]
]);

//Small Storage Crate Upgrade (rude version)
recipes.addShaped("mce_challengemode_small_storage_crate_upgrade", <actuallyadditions:item_chest_to_crate_upgrade>, [
  [<immersiveengineering:wooden_decoration:1>, <ironchest:iron_chest:2>, <immersiveengineering:wooden_decoration:1>],
  [<forestry:oak_stick>, <actuallyadditions:block_misc:4>, <forestry:oak_stick>],
  [<immersiveengineering:wooden_decoration:1>, <immersiveengineering:wooden_device0>, <immersiveengineering:wooden_decoration:1>]
]);

//Wood Casing (slightly evil version)
recipes.remove(<actuallyadditions:block_misc:4>);
recipes.addShaped("mce_challengemode_wood_casing", <actuallyadditions:block_misc:4>, [
	[<ore:plankWood>, <forestry:oak_stick>, <ore:plankWood>],
	[<forestry:oak_stick>, <roots:wildwood_log>, <forestry:oak_stick>],
	[<ore:plankWood>, <forestry:oak_stick>, <ore:plankWood>]
]);


//Iron Casing
recipes.remove(AAItem.ironCasing);
recipes.addShaped("mce_challengemode_iron_casing", AAItem.ironCasing, [
	[<ore:plateIron>, <ore:scaffoldingAluminum>, <ore:plateIron>],
	[<ore:scaffoldingAluminum>, <ore:blockQuartzBlack>, <ore:scaffoldingAluminum>],
	[<ore:plateIron>, <ore:scaffoldingAluminum>, <ore:plateIron>]
]);


//Basic Coil
recipes.remove(AAItem.coilBasic);
recipes.addShaped("mce_challengemode_actuallyaditions_basic_coil", AAItem.coilBasic, [
	[<ore:ingotConductiveIron>, <ore:wireGold>, <ore:slabTreatedWood>],
	[<ore:wireGold>, <ore:stickTreatedWood>, <ore:wireGold>],
	[<ore:slabTreatedWood>, <ore:wireGold>, <ore:ingotConductiveIron>]
]);


//Atomic Reconstructor
recipes.remove(<actuallyadditions:block_atomic_reconstructor>);
recipes.addShaped("mce_challengemode_atomic_reconstructor", <actuallyadditions:block_atomic_reconstructor>, [
	[null, <simplyjetpacks:metaitemmods:14>, null],
	[<extrautils2:redstoneclock>, AAItem.ironCasing, <botania:lens>],
	[null, <simplyjetpacks:metaitemmods:14>, null]
]);


//Energy Lasers
recipes.remove(<actuallyadditions:block_laser_relay>);
recipes.addShaped("mce_challengemode_energy_laser_relay", <actuallyadditions:block_laser_relay> *4, [
    [null, AAItem.blockRestonia],
    [<ore:ingotDarkSteel>, AAItem.coilBasic, <ore:ingotDarkSteel>]
]);

//Yeet Fluid Laser
AtomicReconstructor.removeRecipe(<actuallyadditions:block_laser_relay_fluids>);
AtomicReconstructor.removeRecipe(<actuallyadditions:block_laser_relay_item>);
AtomicReconstructor.addRecipe(<actuallyadditions:block_laser_relay_item>, <actuallyadditions:block_laser_relay>, 2000);
if(!isServer){
    <actuallyadditions:block_laser_relay_fluids>.addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));
}


//Battery Box
recipes.remove(<actuallyadditions:block_battery_box>);
recipes.addShaped("mce_challengemode_actuallyadditions_battery_box", <actuallyadditions:block_battery_box>, [
	[<ore:plateIron>, <actuallyadditions:block_laser_relay>, <ore:plateIron>],
	[<ore:stickElectrum>, IEItem.copperCoil, <ore:stickElectrum>]
]);


//Batteries
//Single Battery
recipes.remove(<actuallyadditions:item_battery>);
recipes.addShaped("mce_challengemode_actuallyadditions_single_battery", <actuallyadditions:item_battery>, [
	[null, <actuallyadditions:block_laser_relay>],
	[<ore:plateTin>, AAItem.crystalRestonia, <ore:plateTin>],
	[<ore:plateTin>, AAItem.crystalRestonia, <ore:plateTin>]
]);
//Double Battery
recipes.remove(<actuallyadditions:item_battery_double>);
recipes.addShaped("mce_challengemode_actuallyadditions_double_battery", <actuallyadditions:item_battery_double>, [
	[<ore:plateTin>, <actuallyadditions:item_battery>.marked("battery"), <ore:plateTin>],
	[<ore:plateTin>, AAItem.crystalRestonia, <ore:plateTin>],
	[<ore:plateTin>, AAItem.crystalRestonia, <ore:plateTin>]
	],
	function(out as IItemStack, ins as IItemStack[string], cInfo as ICraftingInfo){
		return out.withTag(ins.battery.tag);
});


//Laser Wrench
recipes.remove(<actuallyadditions:item_laser_wrench>);
recipes.addShaped("mce_challengemode_laser_wrench", <actuallyadditions:item_laser_wrench>, [
	[null, AAItem.crystalEnori],
	[null, AAItem.coilBasic, AAItem.crystalEnori],
	[AAItem.crystalEnori]
]);

print("--- challenge/actuallyadditions.zs initialized ---");