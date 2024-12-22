#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.buildcraft.AssemblyTable;

import mods.techreborn.compressor;

import mods.nuclearcraft.manufactory;

import mods.immersiveengineering.Blueprint;

#MC Eternal Scripts

print("--- Loading challenge/immersive_engineering.zs ---");

//Redstone Engineering Block
recipes.remove(IEItem.redstoneEngineeringBlock);
AssemblyTable.addRecipe("mce_challengemode_redstone_engineering_block", IEItem.redstoneEngineeringBlock, 25000, [
    <buildcraftsilicon:redstone_chipset:0>,
    <immersiveengineering:wirecoil:5> *2,
    <buildcrafttransport:wire:*> *4,
    <ore:blockSheetmetalSteel>
]);

//Structural Engineering Blueprint
recipes.addShaped("mce_challengemode_ie_machinepart_blueprint", <immersiveengineering:blueprint>.withTag({blueprint: "structural_engineering"}), [
	[<immersiveengineering:tool:0>, null, <openblocks:generic:11>],
	[<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],
	[<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]
]);

//Light Engineering Block
recipes.remove(IEItem.lightEngineeringBlock);
Blueprint.addRecipe("structural_engineering", IEItem.lightEngineeringBlock, [<ore:plateIron> *4, IEItem.ironMechComponent *2, <ore:ingotCopper>]);

//Heavy Engineering Block
recipes.remove(IEItem.heavyEngineeringBlock);
Blueprint.addRecipe("structural_engineering", IEItem.heavyEngineeringBlock, [<ore:plateSteel> *4, IEItem.steelMechComponent *2, <ore:ingotElectrum>]);

//Alloy Kiln
recipes.removeByRecipeName("immersiveengineering:stone_decoration/alloybrick");
recipes.addShaped("mce_challengemode_alloy_kiln_bricks", <immersiveengineering:stone_decoration:10> *2, [
    [<minecraft:brick>, <tconstruct:materials:2>, <minecraft:brick>],
    [<tconstruct:materials:2>, <quark:sandy_bricks>, <tconstruct:materials:2>],
    [<minecraft:brick>, <tconstruct:materials:2>, <minecraft:brick>]
]);

//Kinetic Dynamo
recipes.remove(IEItem.kineticDynamo);
recipes.addShaped("mce_challengemode_kinetic_dynamo", IEItem.kineticDynamo, [
    [null, <ore:ingotElectricalSteel>],
    [<buildcraftsilicon:redstone_chipset:0>, IEItem.copperCoil, AAItem.coilBasic],
    [null, <ore:ingotElectricalSteel>]
]);

//Thermoelectric Generator
basicDisable(<immersiveengineering:metal_device1:3>, "", true);

//LV Connector and Relay
recipes.remove(IEItem.connectorLV);
recipes.addShaped("mce_challengemode_lv_connector", IEItem.connectorLV *4, [
    [null, <ore:ingotCopper>],
    [<minecraft:hardened_clay>, <ore:ingotConductiveIron>, <minecraft:hardened_clay>],
    [<minecraft:hardened_clay>, <ore:ingotConductiveIron>, <minecraft:hardened_clay>]
]);

recipes.remove(IEItem.relayLV);
recipes.addShaped("mce_challengemode_lv_relay", IEItem.relayLV *4, [
    [null, <ore:ingotCopper>],
    [<minecraft:hardened_clay>, <ore:ingotConductiveIron>, <minecraft:hardened_clay>]
]);


//Wire stuff
val wireMaterials = [
    "Copper",
    "Electrum",
    "Steel",
    "Aluminum",
    "Gold"
] as string[];

for material in wireMaterials {
    val wire = oreDict.get("wire"+ material);
    recipes.remove(wire);
    recipes.addShapeless("mce_challengemode_"+ material +"_wire", wire.firstItem, [
        oreDict.get("stick"+ material),
        IEItem.wireCutters.transformNew(function(item as IItemStack){
            return damageIETool(item, 1);
        })
    ]);
}

//Blast Bricks
recipes.removeByRecipeName("immersiveengineering:stone_decoration/blastbrick");
//Convert to regular for deco
recipes.addShapeless("mce_challengemode_immersiveengineering_blast_brick_normal", <immersiveengineering:stone_decoration:1>, [<immersiveengineering:stone_decoration:2>]);
//Reinforced
recipes.addShaped("mce_challengemode_immersiveengineering_reinforced_blast_brick", <immersiveengineering:stone_decoration:2> *3, [
    [IEItem.hammer.transformNew(function(item as IItemStack){
        return damageIETool(item, 3);
    }), <ore:plateSteel>],
    [<thebetweenlands:mud_bricks>, <thebetweenlands:mud_bricks>, <thebetweenlands:mud_bricks>],
    [<ore:ingotBrickNetherGlazed>, <ore:plateSteel>, <ore:ingotBrickNetherGlazed>]
]);


//HOP Graphite
manufactory.removeRecipeWithInput([<ore:dustCoke>.firstItem]);
compressor.removeInputRecipe(<ore:dustCoke>.firstItem);

print("--- challenge/immersive_engineering.zs initialized ---");