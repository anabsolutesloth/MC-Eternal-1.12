#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#MC Eternal Scripts

print("--- Loading challenge/buildcraft.zs ---");

//Assembly Laser
recipes.remove(<buildcraftsilicon:laser>);
recipes.addShaped("mce_challengemode_buildcraft_laser", <buildcraftsilicon:laser>, [
	[<ore:fusedGlass>, EXU2Item.redstoneEye, <ore:fusedGlass>],
	[<ore:fusedGlass>, <actuallyadditions:block_laser_relay>, <ore:fusedGlass>],
	[AAItem.blockVoid, <buildcrafttransport:pipe_gold_power>, AAItem.blockVoid]
]);

//Assembly Table
recipes.remove(<buildcraftsilicon:assembly_table>);
recipes.addShaped("mce_challengemode_assembly_table", <buildcraftsilicon:assembly_table>, [
	[AAItem.blockVoid, EXU2Item.redstoneEye, AAItem.blockVoid],
	[IEItem.conveyorNormal, <ore:fusedGlass>, IEItem.conveyorNormal],
	[AAItem.blockVoid, null, AAItem.blockVoid]
]);


//MJ Energy Producer
recipes.remove(<energyconverters:energy_producer_mj>);


print("--- challenge/buildcraft.zs initialized ---");