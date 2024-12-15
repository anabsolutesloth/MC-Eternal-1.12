import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#MC Eternal Scripts

print("--- loading industrial_foregoing.zs ---");

// Blackholes Units/Tanks
val blackHoleFrames = {
	"industrialforegoing": <teslacorelib:machine_case>,
	"thermal": <thermalexpansion:frame:0>,
	"enderio": <enderio:item_material:0>
} as IItemStack[string];

for mod,frame in blackHoleFrames {
	val blackHoleFrameModID = (mod == "industrialforegoing" ? "" : "_"+ mod);

	recipes.removeByRecipeName("industrialforegoing:black_hole_unit"+ blackHoleFrameModID);
	recipes.removeByRecipeName("industrialforegoing:black_hole_tank"+ blackHoleFrameModID);

    if(!challengeMode || challengeMode && mod == "industrialforegoing"){
		
		recipes.addShaped("mce_blackhole_unit_"+ mod, <industrialforegoing:black_hole_unit>, [
			[<industrialforegoing:plastic>, <ore:enderpearl>, <industrialforegoing:plastic>],
			[<extracells:storage.component:0>, frame, <extracells:storage.component:0>],
			[<mekanism:teleportationcore>, <minecraft:nether_star>, <mekanism:teleportationcore>]
		]);

		recipes.addShaped("mce_blackhole_tank_"+ mod, <industrialforegoing:black_hole_tank>, [
			[<industrialforegoing:plastic>, <ore:enderpearl>, <industrialforegoing:plastic>],
			[AEMaterials["64kFluid"], frame, AEMaterials["64kFluid"]],
			[<mekanism:teleportationcore>, <minecraft:nether_star>, <mekanism:teleportationcore>]
		]);
	}
}

// IF Tree Fluid Extractor
//BL Sap Log
mods.industrialforegoing.Extractor.add(<thebetweenlands:log_sap:*>, <liquid:latex> * 5);


//IF Protein Reactor additions
mods.industrialforegoing.ProteinReactor.add(<biomesoplenty:fleshchunk>);
mods.industrialforegoing.ProteinReactor.add(<rats:raw_rat>);
mods.industrialforegoing.ProteinReactor.add(<totemic:buffalo_meat>);
mods.industrialforegoing.ProteinReactor.add(<twilightforest:raw_venison>);
mods.industrialforegoing.ProteinReactor.add(<twilightforest:raw_meef>);
for meat in <ore:allFlesh>.items {
	mods.industrialforegoing.ProteinReactor.add(meat);
}

print("--- industrial_foregoing.zs initialized ---");