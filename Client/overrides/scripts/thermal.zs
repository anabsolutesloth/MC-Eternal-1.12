

#MC Eternal Scripts

print("--- loading thermal.zs ---");

//Custom dynamo fuels

// Tiberium as Dynamo fuel
mods.thermalexpansion.EnervationDynamo.addFuel(<taiga:tiberium_crystal>, 1000000);

//Mutative reaction
mods.thermalexpansion.ReactantDynamo.addReaction(<fossil:failuresaurus_flesh>, <liquid:mutagen> *200, 1200000);

//Starlight reaction
mods.thermalexpansion.ReactantDynamo.addReaction(<astralsorcery:itemcraftingcomponent:2>, <liquid:astralsorcery.liquidstarlight> *100, 600000);

print("--- thermal.zs initialized ---");