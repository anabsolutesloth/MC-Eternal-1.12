#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.astralsorcery.Altar;
import mods.astralsorcery.StarlightInfusion;
import mods.astralsorcery.LightTransmutation;
import mods.astralsorcery.Utils;

import mods.roots.Pyre;

import scripts.challenge.misc_magic;

#MC Eternal Scripts

print("--- Loading challenge/astral_sorcery.zs ---");

val anyCrystal = Utils.getCrystalORIngredient(false, false);
val anyCelestialCrystal = Utils.getCrystalORIngredient(true, false);
val anyAttunedCrystal = Utils.getCrystalORIngredient(false, true);
val anyAttunedCelestialCrystal = Utils.getCrystalORIngredient(true, true);

//Sooty Marble
recipes.removeByRecipeName("astralsorcery:shaped/marble_black_raw");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/marble_black_raw");

Pyre.addRecipe("mce_challengemode_sooty_marble", blockMarble.normalSooty * 4, [
	<bloodmagic:inscription_tool:2>.transformNew(function(item as IItemStack){
		return misc_magic.useInscriptionTool(item);
	}),
	<ore:stoneMarble>,
	<ore:stoneMarble>,
	<ore:stoneMarble>,
	<ore:stoneMarble>
]);

//Ritual Pedestal
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/ritualpedestal");
Altar.addAttunementAltarRecipe("mce:shaped/altar/challengemode/ritual_pedestal", <astralsorcery:blockritualpedestal>, 1200, 200, [
	blockMarble.chiseled, <minecraft:nether_star>, blockMarble.chiseled,
	blockMarble.pillar, <fluid:astralsorcery.liquidstarlight> *1000, blockMarble.pillar,
	blockMarble.runed, <ebwizardry:runestone_pedestal:*>, blockMarble.runed,
	<taiga:lumix_ingot>, <taiga:lumix_ingot>,
	blockMarble.pillar, blockMarble.pillar
]);

//Attunement Altar
Altar.removeAltarRecipe("astralsorcery:shaped/attunementaltar");
Altar.addAttunementAltarRecipe("mce:shaped/altar/challengemode/attunement_altar", <astralsorcery:blockattunementaltar>, 1200, 300, [
	null, mods.astralsorcery.Utils.getCrystalORIngredient(false, false), null,
	<ore:ingotAstralStarmetal>, <minecraft:nether_star>, <ore:ingotAstralStarmetal>,
	blockMarble.runed, <astralsorcery:blockattunementrelay>, blockMarble.runed,
	<ore:gemAquamarine>, <ore:gemAquamarine>,
	blockMarble.runed, blockMarble.runed
]);

//Lightwell
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/lightwell");
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/lightwell", <astralsorcery:blockwell>, 800, 200, [
	blockMarble.runed, null, blockMarble.runed,
	<botania:livingrock:4>, anyCrystal, <botania:livingrock:4>,
	<ore:gemAquamarine>, blockMarble.runed, <ore:gemAquamarine>
]);

//Glass Lens
// use Archaic Glass recipes
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/glasslens");
StarlightInfusion.removeInfusion(<astralsorcery:itemcraftingcomponent:3>);

//Nocturnal Powder
// use Ebonite recipe
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/nocturnalpowder");

//Cake conversion is kill
// very op for Botania Mana with the Kekimurus
LightTransmutation.removeTransmutation(<minecraft:cake>, false);

print("--- challenge/astral_sorcery.zs initialized ---");