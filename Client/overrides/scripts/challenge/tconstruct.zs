#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.liquid.ILiquidStack;

import mods.enderio.AlloySmelter;

import mods.roots.Pyre;

import mods.tconstruct.Casting;

#MC Eternal Scripts

print("--- loading challenge/tconstruct.zs ---");

//Seared Bricks
//Alloy Smelter
AlloySmelter.addRecipe(<ore:ingotBrickSeared>.firstItem *8, [<ore:blockClay>, <ore:sand> *4, <ore:gravel> *4], 500);
//Pyre
Pyre.addRecipe("mce_challengemode_seared_brick", <ore:ingotBrickSeared>.firstItem *8, [
    <ore:blockClay>,
    <ore:sand>,
    <ore:sand>,
    <ore:gravel>,
    <ore:gravel>
]);



//Casts
recipes.addShapeless("mce_challengemode_cut_plate_cast", <tconstruct:cast_custom:3>, [
	<tconstruct:cast:0>,
	<ore:itemQuartzKnife>.transformDamage(1),
	<minecraft:stone_pressure_plate>.reuse()
]);


//Casting Edits
//Material map
val castableResources = {
    "Dilithium": [<liquid:dilithium>, <liquid:dilithium_fluid>],
    "AncientDebris": [<liquid:ancient_debris>],
    "AstralStarmetal": [<liquid:astral_starmetal>, <liquid:starmetal>],
    "Mithril": [<liquid:mithril>],
    "Octine": [<liquid:octine>],
    "Syrmorite": [<liquid:syrmorite>],
    "Iron": [<liquid:iron>],
    "Cobalt": [<liquid:cobalt>],
    "Ardite": [<liquid:ardite>],
    "Copper": [<liquid:copper>],
    "Bronze": [<liquid:bronze>],
    "Lead": [<liquid:lead>],
    "Silver": [<liquid:silver>],
    "Electrum": [<liquid:electrum>],
    "Steel": [<liquid:steel>],
    "Gold": [<liquid:gold>],
    "Brass": [<liquid:brass>],
    "Tin": [<liquid:tin>],
    "Nickel": [<liquid:nickel>],
    "Zinc": [<liquid:zinc>],
    "Aluminum": [<liquid:aluminum>],
    "Constantan": [<liquid:constantan>],
    "Boron": [<liquid:boron>],
    "Thorium": [<liquid:thorium>],
    "Uranium": [<liquid:uranium>],
    "Magnesium": [<liquid:magnesium>],
    "Invar": [<liquid:invar>],
    "Osmium": [<liquid:osmium>],
    "Tungsten": [<liquid:tungsten>],
    "Titanium": [<liquid:titanium>],
    "Iridium": [<liquid:iridium>],
    "Lumium": [<liquid:lumium>],
    "Signalum": [<liquid:signalum>],
    "Platinum": [<liquid:platinum>],
    "Enderium": [<liquid:enderium>],
    "Thaumium": [<liquid:thaumium>],
	"Lithium": [<liquid:lithium>]
} as ILiquidStack[][string];

for material,liquids in castableResources {
    Casting.removeTableRecipe(oreDict.get("plate"+ material).firstItem);
    for fluid in liquids {
        Casting.addTableRecipe(oreDict.get("plate"+ material).firstItem, <tconstruct:cast_custom:3>, fluid, 432, false, 80);
    }
}
//TR Titanium plate has a recipe from JAOPCA, and for some reason, it doesn't get removed by the loop
Casting.removeTableRecipe(<techreborn:plates:31>);


print("--- challenge/tconstruct.zs initialized ---");
