#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

#MC Eternal Scripts

print("--- loading challenge/loottweaker.zs ---");

/*
Get the given Pool from the given Table in shorter form
    getPoolFromTable (table as string, pool as string) as LootPool

Add and get a new Pool for the given table
    getNewPool (table as string, pool as string, params as int[string]) as LootPool


Remove Arrays of loot entries from the given Table's pools, according to Map structure
    removeLootFromTable (tableName as string, entry as string[][string])
*/

//Frequently used Tables

//CQR Material table
val CQRMaterial = getPoolFromTable("cqrepoured:chests/material", "chests/material_pool");
//CQR Treasure table
val CQRTreasureRevival = getNewPool("cqrepoured:chests/treasure", "mce:revival_gem", {});

//Randomthings Magic Bean pod
val customBeanpodPool = getNewPool("randomthings:beanpod", "mce:randomthings/beanpod/mce_additions", {});

//Artifacts Underground Chest pool
val simpleIngotsPool = LootTweaker.newTable("mce:simple_ingots").addPool("mce:simple_ingots", 4, 9, 0, 3);


//Treasure2 Pools
//Treasure2 Common Items
val commonTreasureItems = getPoolFromTable("treasure2:pools/items/common", "common_items");
//Treasure2 Uncommon Items
val uncommonTreasureItems = getPoolFromTable("treasure2:pools/items/uncommon", "uncommon_items");
//Treasure2 Scarce Items
val scarceTreasureItems = getPoolFromTable("treasure2:pools/items/scarce", "scarce_items");
//Treasure2 Rare Items
val rareTreasureItems = getPoolFromTable("treasure2:pools/items/rare", "rare_items");
//Treasure2 Epic Items
val epicTreasureItems = getPoolFromTable("treasure2:pools/items/epic", "epic_items");



//adding Electrical Steel to more Loot Tables than just Village Blacksmith
CQRMaterial.addItemEntry(<ore:ingotElectricalSteel>.firstItem, 30, 0, [
        Functions.setCount(1, 5)
    ], [], "mce:electrical_steel_ingot");

customBeanpodPool.addItemEntry(<ore:ingotElectricalSteel>.firstItem, 1, 0, [
        Functions.setCount(6, 13)
    ], [], "mce:electrical_steel_ingot");

simpleIngotsPool.addItemEntry(<ore:ingotElectricalSteel>.firstItem, 20, 0, [
        Functions.setCount(3, 8)
    ], [], "mce:electrical_steel_ingot");


//adding Dark Steel to some modded Loot Tables too
CQRMaterial.addItemEntry(<ore:ingotDarkSteel>.firstItem, 20, 0, [
        Functions.setCount(1, 3)
    ], [], "mce:dark_steel_ingot");

customBeanpodPool.addItemEntry(<ore:ingotDarkSteel>.firstItem, 1, 0, [
        Functions.setCount(4, 9)
    ], [], "mce:dark_steel_ingot");

simpleIngotsPool.addItemEntry(<ore:ingotDarkSteel>.firstItem, 20, 0, [
        Functions.setCount(3, 10)
    ], [], "mce:dark_steel_ingot");


//Devoritium
customBeanpodPool.addItemEntry(<ancientspellcraft:devoritium_ingot>, 1, 0, [
        Functions.setCount(4, 10)
    ], [], "mce:devoritium_ingot");

simpleIngotsPool.addItemEntry(<ancientspellcraft:devoritium_ingot>, 10, 0, [
        Functions.setCount(2, 6)
    ], [], "mce:devoritium_ingot");


//Crystal Silver
CQRMaterial.addItemEntry(<ancientspellcraft:crystal_silver_nugget>, 10, 0, [
        Functions.setCount(3, 11)
    ], [], "mce:crystal_silver_nugget");

customBeanpodPool.addItemEntry(<ancientspellcraft:crystal_silver_nugget>, 1, 0, [
        Functions.setCount(3, 15)
    ], [], "mce:crystal_silver_nugget");

simpleIngotsPool.addItemEntry(<ancientspellcraft:crystal_silver_nugget>, 10, 0, [
        Functions.setCount(3, 12)
    ], [], "mce:crystal_silver_nugget");


//Resonating Redstone Crystal
uncommonTreasureItems.addItemEntry(<ore:gemRedstone>.firstItem, 15, 0, [
        Functions.setCount(2, 4)
    ], [], "mce:resonating_redstone_crystal");


//Adding the Ingots table to Artifacts' Underground Chests
getPoolFromTable("artifacts:chest_underground", "main").addLootTableEntry("mce:simple_ingots", 10, 0, [], "mce:simple_ingots");

//Adding the Ingots table to Treasure2's Scarce Items pool
scarceTreasureItems.addLootTableEntry("mce:simple_ingots", 20, 0, [], "mce:simple_ingots");


//Revival Gem
CQRTreasureRevival.addItemEntry(<contenttweaker:revival_gem>, 5, 2, [], [], "mce:revival_gem");

CQRTreasureRevival.addEmptyEntry(25, 0, "mce:empty");


//Stoneling Carried items pool
val stonelingCarry = getPoolFromTable("quark:entities/stoneling_carry", "main");

stonelingCarry.addItemEntry(<taiga:karmesine_ore>, 30, 0, [
        Functions.setCount(2, 5)
    ], [], "mce:karmesine_ore");

stonelingCarry.addItemEntry(<taiga:jauxum_ore>, 30, 0, [
        Functions.setCount(2, 5)
    ], [], "mce:jauxum_ore");

stonelingCarry.addItemEntry(<taiga:ovium_ore>, 30, 0, [
        Functions.setCount(2, 5)
    ], [], "mce:ovium_ore");



//Fishing Loot additions
val fishingPool = getPoolFromTable("minecraft:gameplay/fishing/treasure", "main");

//Yeta Wrench
// unsure on this, i think playtesting is needed
fishingPool.addItemEntry(<enderio:item_yeta_wrench>, 1, 0, [], [], "mce:yeta_wrench");


//removing Wooden and Iron Casing from AA Engineer House loot
removeLootFromTable("actuallyadditions:engineer_house", {
    "main": ["actuallyadditions:woodenCase", "actuallyadditions:ironCase"]
});

//removing Drop of Evil (because its evil, and i am too :)
removeLootFromTable("minecraft:entities/wither_skeleton", {
    "xuLootDropOfEvil": ["xuLootDropOfEvil"]
});


//removing Nr. Spectre Coils
// a bit too OP for the power balance to be obtained from normal loot
removeLootFromTable("minecraft:chests/simple_dungeon", {
    "spectrecoil_number": ["item"]
});

removeLootFromTable("minecraft:chests/abandoned_mineshaft", {
    "spectrecoil_number": ["item"]
});

removeLootFromTable("minecraft:chests/end_city_treasure", {
    "spectrecoil_number": ["item"]
});


//Removing some TechReborn components from loot
// craft them >:)
val trTableMap = {
    ["abandoned_mineshaft", "desert_pyramid", "igloo_chest", "jungle_temple", "simple_dungeon", "village_blacksmith"]: 
        ["refined_iron_ingot", "advanced_alloy_ingot", "mixed_metal_ingot", "basic_frame", "basic_circuit"],

    ["nether_bridge", "stronghold_corridor", "stronghold_crossing", "stronghold_library"]:
        ["steel_ingot", "zinc_ingot", "reinforced_frame", "data_storage_circuit", "data_control_circuit"],

    ["end_city_treasure", "woodland_mansion"]:
        ["chrome_ingot", "iridium_ingot", "tungsten_ingot", "hot_tungstensteel_iron_ingot", "tungstensteel_ingot", "iridium_alloy_ingot", "advanced_frame", "energy_flow_circuit"]

} as string[][string[]];

for tableList,components in trTableMap {
    for table in tableList {
        removeLootFromTable("techreborn:chests/"+ table, {
            "techreborn": components
        });
    }
}

//Removing disabled Cyclic items from loot
val lootableDisabledCyclicItems = {
    ["abandoned_mineshaft", "desert_pyramid", "jungle_temple", "nether_bridge", "simple_dungeon", "stronghold_corridor", "stronghold_crossing", "stronghold_library", "village_blacksmith"]:
        ["cyclicmagic:item.tool_elevate", "cyclicmagic:item.book_ender", "cyclicmagic:item.inventory_food"],

    ["igloo_chest"]:
        [],

    ["spawn_bonus_chest"]:
        [],

    ["end_city_treasure"]:
        [],

    ["woodland_mansion"]:
        []
} as string[][string[]];
for tableList,entries in lootableDisabledCyclicItems {
    for table in tableList {
        removeLootFromTable("minecraft:chests/"+ table, {
            "main": entries
        });
    }
}


print("--- challenge/loottweaker.zs initialized ---");