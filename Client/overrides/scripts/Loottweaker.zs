#priority 1

import crafttweaker.item.IItemStack;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

#MC Eternal Scripts
print("--- loading Loottweaker.zs ---");

//Get the given Pool from the given Table in shorter form
global getPoolFromTable as function(string, string) LootPool = function
	(table as string, pool as string) as LootPool {
	return LootTweaker.getTable(table).getPool(pool);
};

//Add and get a new Pool for the given table
global getNewPool as function(string, string, int[string]) LootPool = function
	(table as string, pool as string, params as int[string]) as LootPool {
	return LootTweaker.getTable(table).addPool(pool, 
		!isNull(params.maxRolls) ? params.maxRolls : 1,
		!isNull(params.minRolls) ? params.minRolls : 1,
		!isNull(params.maxBonusRolls) ? params.maxBonusRolls : 0,
		!isNull(params.minBonusRolls) ? params.minBonusRolls : 0
	);
};

//Remove Arrays of loot entries from the given Table's pools, according to Map structure
global removeLootFromTable as function(string, string[][string]) void = function
	(tableName as string, entry as string[][string]) as void {
	val table = LootTweaker.getTable(tableName);
	for poolName,items in entry {
		val pool = table.getPool(poolName);
		for itemName in items {
			pool.removeEntry(itemName);
		}
	}
};

//Remove Potion Orbs due to Random Registry selection
removeLootFromTable("arcaneworld:raid_1", {
	"raid_1": ["arcaneworld:potion_orb"]
});

//Remove Random Registry selected potions :v
removeLootFromTable("artifacts:underground_chest/potions", {
	"main": ["minecraft:potion", "minecraft:splash_potion", "minecraft:lingering_potion", "minecraft:tipped_arrow"]
});


val skyScarabCrest as IItemStack = <contenttweaker:sky_scarab_crest>;
val skyScarabPool = LootTweaker.getTable("atum:chests/pharaoh").addPool("mce:sky_scarab", 1, 1, 0, 0);

skyScarabPool.addItemEntry(skyScarabCrest, 1, 0, [], [], "mce:sky_scarab_crest");
skyScarabPool.addEmptyEntry(3, "mce:sky_scarab_emtpy");


val kikokuStick as IItemStack = <contenttweaker:kikoku_stick>;

LootTweaker.getTable("theaurorian:entities/moonqueen").addPool("mce:kikoku_stick", 1, 1, 0, 0)
	.addItemEntry(kikokuStick, 1, 0, [], [], "mce:stick_of_a_thousand_clicks");


val cqUniqueEquipment = LootTweaker.newTable("mce:cqrepoured/unique_equipment").addPool("main", 1, 1, 0, 0);

for type in ["slime", "bull", "spider"] as string[] {
	for slot in ["helmet", "chestplate", "leggings", "boots"] as string[] {
		val equipName = slot +"_"+ type;
		cqUniqueEquipment.addItemEntry(itemUtils.getItem("cqrepoured:"+ equipName), 1, 0, "mce:"+ equipName);
	}
}

for entry in [<cqrepoured:bubble_pistol>, <cqrepoured:bubble_rifle>, <cqrepoured:boots_cloud>] as IItemStack[] {
	cqUniqueEquipment.addItemEntry(entry, 1, 0, "mce:"+ entry.name.split("\\.")[1]);
}


print("--- Loottweaker.zs initialized ---");