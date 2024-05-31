

#MC Eternal Scripts

print("--- loading agricraft.zs ---");

//fun(ny) cropstick recipes
// enforced in challengemode :)

//Treated Wood Stick
recipes.addShaped("mce_treated_wood_cropsticks", <agricraft:crop_sticks> *6, [
	[<ore:stickTreatedWood>, <ore:stickTreatedWood>],
	[<ore:stickTreatedWood>, <ore:stickTreatedWood>]
]);

//Impregnated Stick
mods.forestry.Carpenter.addRecipe(<agricraft:crop_sticks> *12, [
		[<forestry:oak_stick>, <forestry:oak_stick>],
		[<forestry:oak_stick>, <forestry:oak_stick>]
	],
	40
);

//Atum Sticks
mods.mekanism.sawmill.addRecipe(<ore:atumStick>, <agricraft:crop_sticks> *8);

print("--- agricraft.zs initialized ---");