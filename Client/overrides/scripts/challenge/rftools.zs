#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#MC Eternal Scripts

print("--- Loading challenge/rftools.zs ---");

// Quarry Shape Card
recipes.remove(<rftools:shape_card:2>);
recipes.addShaped("mce_challengemode_quarry_shape_card", <rftools:shape_card:2>, [
	[<theaurorian:auroriancoalblock>, <mekanism:controlcircuit:3>, <theaurorian:auroriancoalblock>],
	[<mekanism:machineblock:15>, <twilightforest:tower_device:6>, <mekanism:machineblock:15>],
	[<theaurorian:auroriancoalblock>, <mekanism:teleportationcore>, <theaurorian:auroriancoalblock>]
]);


// Endergenic Generator
recipes.remove(<rftools:endergenic>);
recipes.addShaped("mce_challengemode_endergenic_gen", <rftools:endergenic>, [
	[<rftools:infused_diamond>, <rftools:infused_enderpearl>, <rftools:infused_diamond>],
	[<rftools:infused_enderpearl>, <rftools:machine_frame>, <rftools:infused_enderpearl>],
	[<rftools:infused_diamond>, <rftools:infused_enderpearl>, <rftools:infused_diamond>]
]);


//Storage Scanner
basicDisable(<rftools:storage_scanner>, "", true);


print("--- challenge/rftools.zs initialized ---");