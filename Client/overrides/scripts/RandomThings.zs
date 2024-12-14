#MC Eternal Scripts

print("--- loading RandomThings.zs ---");

#Add Recipe
recipes.addShaped(<randomthings:ingredient:5>, [[<ore:dustGlowstone>, <minecraft:red_mushroom>]]);

// Spectre Energy Injector
recipes.remove(<randomthings:spectreenergyinjector>);
recipes.addShaped("mce_spectre_energy_injector", <randomthings:spectreenergyinjector>, [
	[<minecraft:obsidian>, <randomthings:spectrelens>, <minecraft:obsidian>],
	[<randomthings:ingredient:12>, <actuallyadditions:block_phantom_energyface>, <randomthings:ingredient:12>],
	[<minecraft:obsidian>, <randomthings:ingredient:12>, <minecraft:obsidian>]
]);

print("--- RandomThings.zs initialized ---");	