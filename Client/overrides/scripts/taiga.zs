import crafttweaker.item.IItemStack;

import mods.immersiveengineering.Crusher;
import mods.mekanism.enrichment;
import mods.mekanism.crusher;

#MC Eternal Scripts

print("--- loading taiga.zs ---");

//TAIGA ore processing in additional things not supported by default
val taigaMaterials = [
    "tiberium",
    "aurorium",
    "jauxum",
    "ovium",
    "karmesine",
    "vibranium",
    "valyrium",
    "duranite",
    "prometheum",
    "eezo",
    "abyssum",
    "osram",
    "uru",
    "palladium"
] as string[];

for material in taigaMaterials {
    val currentOre = itemUtils.getItem("taiga:"+ material +"_ore");
    val currentDust = itemUtils.getItem("taiga:"+ material +"_dust");
    val currentIngot = itemUtils.getItem("taiga:"+ material +"_ingot");

    //IE Crusher
    mods.immersiveengineering.Crusher.addRecipe(currentDust *2, currentOre, 3072);

    //Mekanism Enrichment Chamber
    mods.mekanism.enrichment.addRecipe(currentOre, currentDust *2);
}


//TAIGA alloys in alloying machines
/*
	Alloying Things
		Arc Furnace (Immersive Engineering)
		Induction Smelter (Induction Smelter)
		Alloy Furnace (Nuclearcraft)
		Alloy Smelter (TechReborn)
		Electric Arc Furnace (Advanced Rocketry)
		Alloy Smelter (EnderIO)
*/

for recipe in taigaAlloyMap {
	val result as IItemStack = recipe.result[0];
	val ingredients as IItemStack[] = recipe.inputs;
	val materialName = result.definition.id.split(":")[1].split("_")[0];
	addUniversalAlloyRecipe(result, ingredients,
		"TAIGA Alloy - "+ materialName,
//		materialName.replace("\\w(?=\\w{"+ (materialName.length - 1) +"})", materialName.substring(0, 1).toUpperCase())
		false,
		{
			"IEKiln": {
				"challengeEnabled": 0
			}
		}
	);
}

print("--- taiga.zs initialized ---");