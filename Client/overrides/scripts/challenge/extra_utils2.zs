#packmode challenge

import crafttweaker.item.IItemStack;

import mods.thaumcraft.ArcaneWorkbench;

#MC Eternal Scripts

print("--- loading challenge/extra_utils2.zs ---");

//Resonating Redstone Crystal
recipes.remove(<ore:gemRedstone>.firstItem);
addUniversalAlloyRecipe(<ore:gemRedstone>.firstItem, [<extrautils2:endershard> *2, AAItem.crystalRestonia *2],
	"MCE Challenge Mode: Resonating Redstone Crystal",
	false,
	{
        "ARArc": {
            "tweaker": 1
        },
        "EIOSmelter": {
            "energy": 2500,
            "tweaker": 1
        },
		"IEKiln": {
			"enabled": 0
		}
	}
);

//Eye of Redstone
recipes.remove(EXU2Item.redstoneEye);
addUniversalAlloyRecipe(EXU2Item.redstoneEye, [<minecraft:ender_eye>, <ore:gemRedstone>],
    "MCE Challenge Mode: Redstone Eye",
    false,
    {
        "ARArc": {
            "tweaker": 1
        },
        "EIOSmelter": {
            "energy": 2500,
            "tweaker": 1
        },
		"IEKiln": {
			"enabled": 0
		}
    }    
);

//Resonator
recipes.remove(<extrautils2:resonator>);
recipes.addShaped("mce_challengemode_exu2_resonator", <extrautils2:resonator>, [
    [<ore:ingotConductiveIron>, null, <ore:ingotConductiveIron>],
    [<ore:ingotRedstoneAlloy>, EXU2Item.redstoneEye, <ore:ingotRedstoneAlloy>],
    [<ore:ingotRedstoneAlloy>, AAItem.ironCasing, <ore:ingotRedstoneAlloy>]
]);

//Water Mill
recipes.remove(<extrautils2:passivegenerator:3>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_exu2_water_mill", "", 100, 
    [<aspect:aqua> *10, <aspect:ordo> *3, <aspect:ignis> *5],
    <extrautils2:passivegenerator:3>,
    [
        [EXU2Item.stoneburnt, manaResource.gaiaSpirit, EXU2Item.stoneburnt],
        [<immersiveengineering:wooden_device1:0>, <ore:gemRedstone>, <immersiveengineering:wooden_device1:0>],
        [EXU2Item.stoneburnt, manaResource.gaiaSpirit, EXU2Item.stoneburnt]
    ]
);

print("--- challenge/extra_utils2.zs initialized ---");