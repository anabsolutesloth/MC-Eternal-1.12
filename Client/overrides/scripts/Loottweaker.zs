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

/*
item.mce.atum_sky_scarab_crest.desc=
Only the most ancient of the Pharaohs of Atum were<BR>
members of a now lost Order of the Sky Scarab,<BR>
dedicated to sealing outsiders from using the<BR>
power of Flight within their desert home.<BR>
perhaps with a lingering shard of their magic,<BR>
you may be able to forge a workaround to the curse.
*/


val kikokuStick as IItemStack = <contenttweaker:kikoku_stick>;

val kikokuStickPool = LootTweaker.getTable("theaurorian:entities/moonqueen").addPool("mce:kikoku_stick", 1, 1, 0, 0);
kikokuStickPool.addItemEntry(kikokuStick, 1, 0, [], [], "mce:stick_of_a_thousand_clicks");

/*
item.mce.kikoku_stick.desc=
A Stick passed down throughout the<BR>
Aurorian Royal lineage, once the handle<BR>
of a terrible weapon that could cut at<BR>
impossible speeds, seperated from the<BR>
weapon to prevent its misuse.
*/


print("--- Loottweaker.zs initialized ---");