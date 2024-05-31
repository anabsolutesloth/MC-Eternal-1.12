#packmode challenge
#priority 2

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import thaumcraft.aspect.CTAspectStack;

import mods.astralsorcery.Altar;

import mods.bloodmagic.TartaricForge;

import mods.thaumcraft.Crucible;

#MC Eternal Scripts

print("--- loading challenge/misc_magic.zs ---");


#remove vistical agriculture:tm:
// super op by deleting any kind of challenges with essentia
val validSeedAspects = [
		//Base TC
		<aspect:aer>,
		<aspect:terra>,
		<aspect:ignis>,
		<aspect:aqua>,
		<aspect:ordo>,
		<aspect:perditio>,
		<aspect:vacuos>,
		<aspect:lux>,
		<aspect:motus>,
		<aspect:gelum>,
		<aspect:vitreus>,
		<aspect:metallum>,
		<aspect:victus>,
		<aspect:mortuus>,
		<aspect:potentia>,
		<aspect:permutatio>,
		<aspect:praecantatio>,
		<aspect:auram>,
		<aspect:alkimia>,
		<aspect:vitium>,
		<aspect:tenebrae>,
		<aspect:alienis>,
		<aspect:volatus>,
		<aspect:herba>,
		<aspect:instrumentum>,
		<aspect:fabrico>,
		<aspect:machina>,
		<aspect:vinculum>,
		<aspect:spiritus>,
		<aspect:cognitio>,
		<aspect:sensus>,
		<aspect:aversio>,
		<aspect:praemunio>,
		<aspect:desiderium>,
		<aspect:exanimis>,
		<aspect:bestia>,
		<aspect:humanus>,
		
		//TAdditions
		<aspect:fluctus>,
		<aspect:sonus>,
		<aspect:exitium>,
		<aspect:caeles>,
		<aspect:draco>,
		<aspect:infernum>,
		<aspect:ventus>,
		<aspect:visum>,
		<aspect:imperium>
] as CTAspectStack[];
	
for aspectStack in validSeedAspects {
	var aspect = aspectStack.internal.name.toLowerCase();
	Crucible.removeRecipe("thaumadditions:"+ aspect +"_vis_seed");
	itemUtils.getItem("thaumadditions:vis_seeds/"+ aspect).addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));
}

function useInscriptionTool (tool as IItemStack) as IItemStack {
	if(isNull(tool.tag.uses) || tool.tag.uses == 1) return null;
	return tool.updateTag({uses: tool.tag.uses - 1});
}

//Living Alloy

//Creating Amalgameat
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/amalgameat", <contenttweaker:amalgameat>, 600, 40, [
	<ore:allFlesh>, <ore:allFlesh>, <ore:allFlesh>,
	<ore:allFlesh>, <fossil:bio_goo>, <ore:allFlesh>,
	<ore:allFlesh>, <ore:allFlesh>, <ore:allFlesh>
]);
//Techy Amalgameat creation
mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:amalgameat>, <ore:allFlesh>, IEMold.packing3x, 4000, 8);

//Adding the Living to the Alloy
TartaricForge.addRecipe(<contenttweaker:living_alloy>, [<contenttweaker:amalgameat>, <thaumcraft:brain>], 48.0, 4.0);


//Tooltips
if(!isServer){
	val itemsCraftedUsingInscriptionTool = [
		blockMarble.normalSooty,
		<roots:elemental_soil>,
		<botania:corporeaspark>
	] as IItemStack[];

	for item in itemsCraftedUsingInscriptionTool {
		val inscriptionCraftingTip = game.localize("mce.challengemode.generic.tip.damages_inscription_tool_instead_of_consume").split("<BR>");
		item.addShiftTooltip(format.gold(inscriptionCraftingTip[0]), format.gold(game.localize("mce.challengemode.generic.tip.has_crafting_quirk")));
		item.addShiftTooltip(format.gold(inscriptionCraftingTip[1]));
	}
}

print("--- challenge/misc_magic.zs initialized ---");