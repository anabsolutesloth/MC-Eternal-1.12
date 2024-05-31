#priority 5

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;

#MC Eternal Scripts

print("--- loading Globals.zs ---");

global isServer as bool = isNull(client);

print("Game Packmode: "+ packmode);
print("Game is Server?: "+ isServer);

global getFTBCrate as function(string) IItemStack = function
    (id as string) as IItemStack {
	return <ftbquests:lootcrate>.withTag({type: id as IData});
};

global addMultilineLocalizedTooltip as function(IItemStack, string) void = function
    (item as IItemStack, key as string) as void {
	for line in game.localize(key).split("<BR>") {
		item.addTooltip(format.gold(line));
	}
};


//Get an IItemStack from an IIngredient
// returns as IItemStack if the IIngredient is an IItemStack, or the first entry in the oredict entry if it is an IOreDictEntry.
// mainly used to allow a function (see below) to produce a Thermal Expansion Alloy Smelter recipe from an IIngredient set of parameters
// aswell as generate Copy-pastable XML data for EnderIO's Alloy Smelter and Advanced Rocketry's Arc Furnace
global getIngredientItemstack as function(IIngredient) IItemStack = function 
	(ingredient as IIngredient) as IItemStack {
	return ingredient.items[0] * ingredient.amount;
	/*
	if(ingredient instanceof IOreDictEntry){
		val oreDictEntry as IOreDictEntry = ingredient;
		val castedIngredient as IItemStack = oreDictEntry.firstItem;
		return castedIngredient;
	} else {
		val castedIngredient as IItemStack = ingredient;
		return items;
	}
	*/
};

global getXMLOreDictFromIngredient as function(IIngredient) string = function
	(ingredientStack as IIngredient) as string {
	return ingredientStack.commandString.split(":")[1].split(">")[0];
};

global alloyingBaseStats as int[string] = {
	"IESmelterTime": 200,
	"IEArcEnergy": 512,
	"thermalInductionEnergy": 4000,
	"NCFurnaceTime": 400,
	"NCFurnaceEnergy": 10,
	"TRSmelterTime": 200,
	"TRSmelterEnergy": 20,
	//The XML siblings
	"ARArcTime": 20,
	"ARArcEnergy": 10000,
	"EIOSmelterEnergy": 10000
};

//function to just generate copypastable XML data for AR and EIO alloy recipes
global generateXMLRecipes as function(IItemStack, IIngredient[], string, int[string][string], bool, bool) void = function
	(result as IItemStack, ingredients as IIngredient[], recipeID as string, params as int[string][string], printEIO as bool, printAR as bool) as void {

	var ARXMLIngredients as string = "";
	var EIOXMLIngredients as string = "";
	for ing in ingredients {
		
		val stackIng as IItemStack = ing;
		val oreIng as IOreDictEntry = ing;
		

		if(printAR){
			if(ing instanceof IItemStack)
				ARXMLIngredients += '
			<itemStack>'+ stackIng.definition.id +';'+ stackIng.amount +';'+ stackIng.metadata +'</itemStack>';

			else if(ing instanceof IOreDictEntry)
				ARXMLIngredients += '
			<oreDict>'+ oreIng.name +';'+ oreIng.amount +'</oreDict>';

			else {
				print("object "+ ing.commandString +" isn't IItemStack or IOreDictEntry, attempting to create Oredict name from IIngredient");
				ARXMLIngredients += '
			<oreDict>'+ getXMLOreDictFromIngredient(ing) +';'+ ing.amount +'</oreDict>';
			}
			/*
			ARXMLIngredients += ing instanceof IItemStack ? '
			<itemStack>'+ stackIngredient.definition.id +';'+ stackIngredient.amount +';'+ stackIngredient.metadata +'</itemStack>' : '
			<oreDict>'+ oreIngredient.name +';'+ oreIngredient.amount +'</oreDict>';
			*/
		}

		if(printEIO){
			if(ing instanceof IItemStack)
				EIOXMLIngredients += '
		<input name="'+ stackIng.definition.id +':'+ stackIng.metadata +'" amount="'+ stackIng.amount +'"/>';
			
			else if(ing instanceof IOreDictEntry)
				EIOXMLIngredients += '
		<input name="'+ oreIng.name +'" amount="'+ oreIng.amount +'">';

			else {
				print("object "+ ing.commandString +"isnt IItemStack ore IOreDictEntry, attempting to create Oredict name from IIngredient");
				EIOXMLIngredients += '
		<input name="'+ getXMLOreDictFromIngredient(ing) +'" amount="'+ ing.amount +'">';
			}
			/*
			EIOXMLIngredients += ing instanceof IItemStack ? '
			<input name="'+ stackIngredient.definition.id +':'+ stackIngredient.metadata +'" amount="'+ stackIngredient.amount +'"/>' : '
			<input name="'+ oreIngredient.name +'" amount="'+ oreIngredient.amount +'">';
			*/
		}
	}

	//AR Electric Arc Furnace XML Printing
	if(printAR){
		print("AR XML for "+ (!isNull(result.commandString) ? result.commandString : "Uh something"));
		print(
	'<!-- MCE: '+ recipeID +' -->
	<Recipe timeRequired="'+
	(!isNull(params.AR) && !isNull(params.AR.time) ? params.AR.time : alloyingBaseStats.ARArcTime)
+'" power="'+
	(!isNull(params.AR) && !isNull(params.AR.energy) ? params.AR.energy : alloyingBaseStats.ARArcEnergy)
+'">
		<input>'+
		ARXMLIngredients
+'
		</input>
		<output>
			<itemStack>'+
		result.definition.id
		+';'+
		result.amount
		+';'+
		result.metadata
		+'</itemStack>
		</output>
	</Recipe>'
		);
	}
	
	//EnderIO Alloy Smelter XML Printing
	if(printEIO && ingredients.length < 4){
		print("EIO XML for "+ (!isNull(result.commandString) ? result.commandString : "Uh something"));
		print(
'<recipe name=" MCE: '+
	recipeID
+'" required="true">
	<alloying energy="'+
	(!isNull(params.EIO) && !isNull(params.EIO.energy) ? params.EIO.energy : alloyingBaseStats.EIOSmelterEnergy)
	+'">'+
		EIOXMLIngredients
+'		
		<output name="'+ result.definition.id +'" amount="'+ result.amount +'"/>
	</alloying>
</recipe>'
		);
	}
};

global checkParamsEnables as function (string, int[string][string]) bool = function
	(machineID as string, params as int[string][string]) as bool {
	var isValid as bool = (
		!isNull(params[machineID])
		&& !isNull(params[machineID].enabled)
		? params[machineID].enabled == 1 : true
	);

	if(challengeMode && isValid) 
		isValid = (
			!isNull(params[machineID])
			&& !isNull(params[machineID].challengeEnabled)
			? params[machineID].challengeEnabled == 1 : true
		);

	return isValid;
};

//Simultaneously add an Alloying recipe to various Alloying machines 
/* Adds recipes to:
    IE's Arc Furnace
    Thermal's Induction Smelter
    Nuclearcraft's Alloy Furnace
    TechReborn's Alloy Furnace/Smelter

// Generates XML Data for:
    EnderIO's Alloy Smeltery
    Advanced Rocketry's Arc Furnace

*/
global addUniversalAlloyRecipe as function(IItemStack, IIngredient[], string, bool, int[string][string]) void = function 
	(result as IItemStack, ingredients as IIngredient[], recipeID as string, enableXMLPrint as bool, parameterMap as int[string][string]) as void {

	//IE Arc Furnace
	if(checkParamsEnables("IEArc", parameterMap)){
		var ingredientArrayWithoutFirst as IIngredient[] = [];
		for entry in ingredients {
			if(!(ingredients[0] in entry)) ingredientArrayWithoutFirst += entry;
		}

		mods.immersiveengineering.ArcFurnace.addRecipe(result, ingredients[0], null,
			(!isNull(parameterMap.IEArc)
				&& !isNull(parameterMap.IEArc.time) ? parameterMap.IEArc.time : alloyingBaseStats.IESmelterTime),
			(!isNull(parameterMap.IEArc)
				&& !isNull(parameterMap.IEArc.energy) ? parameterMap.IEArc.energy : alloyingBaseStats.IEArcEnergy),
			ingredientArrayWithoutFirst
		);
	}

	//EIO Alloy Smelter and Advanced Rocketry Arc Furnace
	if(enableXMLPrint){
		var xmlParams as int[string][string] = {};
		if(!isNull(parameterMap.ARArc))
			xmlParams["AR"] = parameterMap.ARArc;
		if(!isNull(parameterMap.EIO))
			xmlParams["EIO"] = parameterMap.EIOSmelter;

		generateXMLRecipes(result, ingredients, recipeID, xmlParams,
			checkParamsEnables("EIOSmelter", parameterMap),
			checkParamsEnables("ARArc", parameterMap)
		);
	} else {//*
		if(!isNull(parameterMap.ARArc) && !isNull(parameterMap.ARArc.tweaker) ? parameterMap.ARArc.tweaker == 1 : false){
			var stackIngredients as IItemStack[] = [];
			for ing in ingredients {
				stackIngredients += getIngredientItemstack(ing);
			}
			mods.advancedrocketry.ArcFurnace.addRecipe(result, 
				(!isNull(parameterMap.ARArc) && !isNull(parameterMap.ARArc.time) ? parameterMap.ARArc.time : alloyingBaseStats.ARArcTime),
				(!isNull(parameterMap.ARArc) && !isNull(parameterMap.ARArc.energy) ? parameterMap.ARArc.energy : alloyingBaseStats.ARArcEnergy),
				stackIngredients
			);
		}

		if(!isNull(parameterMap.EIOSmelter) && !isNull(parameterMap.EIOSmelter.tweaker) ? parameterMap.EIOSmelter.tweaker == 1 : false){
			mods.enderio.AlloySmelter.addRecipe(result, ingredients, 
				(!isNull(parameterMap.EIOSmelter) && !isNull(parameterMap.EIOSmelter.energy) ? parameterMap.EIOSmelter.energy : alloyingBaseStats.EIOSmelterEnergy)
			);
		}
		//*/
	}

	if(ingredients.length < 3){
		//Thermal Induction Smelter
		if(checkParamsEnables("thermalInduction", parameterMap))
			mods.thermalexpansion.InductionSmelter.addRecipe(result, getIngredientItemstack(ingredients[0]), getIngredientItemstack(ingredients[1]),
				(!isNull(parameterMap.thermalInduction)
					&& !isNull(parameterMap.thermalInduction.energy) ? parameterMap.thermalInduction.energy : alloyingBaseStats.thermalInductionEnergy)
			);
		
		//Nuclearcraft Alloy Furnace
		if(checkParamsEnables("NCFurnace", parameterMap))
			mods.nuclearcraft.alloy_furnace.addRecipe([ingredients[0], ingredients[1], result,
				(!isNull(parameterMap.NCFurnace)
					&& !isNull(parameterMap.NCFurnace.time) ? parameterMap.NCFurnace.time : alloyingBaseStats.NCFurnaceTime) / 400,
				(!isNull(parameterMap.NCFurnace)
					&& !isNull(parameterMap.NCFurnace.energy) ? parameterMap.NCFurnace.energy : alloyingBaseStats.NCFurnaceEnergy) / 10
			]);
		
		//TechReborn Alloy Smelter
		if(checkParamsEnables("TRSmelter", parameterMap))
			mods.techreborn.alloySmelter.addRecipe(result, getIngredientItemstack(ingredients[0]), getIngredientItemstack(ingredients[1]),
				(!isNull(parameterMap.TRSmelter)
					&& !isNull(parameterMap.TRSmelter.time) ? parameterMap.TRSmelter.time : alloyingBaseStats.TRSmelterTime),
				(!isNull(parameterMap.TRSmelter)
					&& !isNull(parameterMap.TRSmelter.energy) ? parameterMap.TRSmelter.energy : alloyingBaseStats.TRSmelterEnergy)
			);

		//Immersive Engineering Alloy Kiln
		if(checkParamsEnables("IEKiln", parameterMap))
			mods.immersiveengineering.AlloySmelter.addRecipe(result, ingredients[0], ingredients[1],
				(!isNull(parameterMap.IEKiln)
					&& !isNull(parameterMap.IEKiln.time) ? parameterMap.IEKiln.time : alloyingBaseStats.IESmelterTime)
			);
	}
};


//Fetch a Tinkers' tool part's ID as a string by using a shorthand name
global tconPart as string[string] = {
	"binding": "tconstruct:binding",
	"toolrod": "tconstruct:tool_rod",
	"handguard": "tconstruct:hand_guard",
	"knifeblade": "tconstruct:knife_blade",
	"wideguard": "tconstruct:wide_guard",
	"crossguard": "tconstruct:cross_guard",
	"armortrim": "conarm:armor_trim",
	"arrowhead": "tconstruct:arrow_head",
	"sharpeningkit": "tconstruct:sharpening_kit",
	"axehead": "tconstruct:axe_head",
	"shovelhead": "tconstruct:shovel_head",
	"kamahead": "tconstruct:kama_head",
	"swordblade": "tconstruct:sword_blade",
	"pickhead": "tconstruct:pick_head",
	"bowlimb": "tconstruct:bow_limb",
	"signhead": "tconstruct:sign_head",
	"toughrod": "tconstruct:tough_tool_rod",
	"toughbind": "tconstruct:tough_binding",
	"pan": "tconstruct:pan_head",
	"armorplate": "conarm:armor_plate",
	"helmcore": "conarm:helmet_core",
	"bootscore": "conarm:boots_core",
	"legscore": "conarm:leggings_core",
	"chestcore": "conarm:chest_core",
	"scythehead": "tconstruct:scythe_head",
	"largeblade": "tconstruct:large_sword_blade",
	"largeplate": "tconstruct:large_plate",
	"hammerhead": "tconstruct:hammer_head",
	"excavatorhead": "tconstruct:excavator_head",
	"broadaxehead": "tconstruct:broad_axe_head"
};

//Fetch a Tinkers' part of a specified material using the shorthand map name and material name
global getTconPart as function(string, string) IItemStack = function
    (part as string, mat as string) as IItemStack {
	return itemUtils.getItem(tconPart[part]).withTag({Material: mat});
};

//Fetch an AE resource's IItemStack from a shorthand name, instead of a magic number
global AEMaterials as IItemStack[string] = {
	//Processors
    "circuitEng": <appliedenergistics2:material:24>,
    "circuitLogic": <appliedenergistics2:material:22>,
    "circuitCalc": <appliedenergistics2:material:23>,
	//Storage Component
    "1kComponent": <appliedenergistics2:material:35>,
    "4kComponent": <appliedenergistics2:material:36>,
    "16kComponent": <appliedenergistics2:material:37>,
    "64kComponent": <appliedenergistics2:material:38>,
	//Fluid Components
    "1kFluid": <appliedenergistics2:material:54>,
    "4kFluid": <appliedenergistics2:material:55>,
    "16kFluid": <appliedenergistics2:material:56>,
    "64kFluid": <appliedenergistics2:material:57>,
	//Inscriber-related Materials
    "printEng": <appliedenergistics2:material:17>,
	"printCalc": <appliedenergistics2:material:16>,
	"printLogic": <appliedenergistics2:material:18>,
	"printSil": <appliedenergistics2:material:20>,
    "pressEng": <appliedenergistics2:material:14>,
	"pressCalc": <appliedenergistics2:material:13>,
	"pressLogic": <appliedenergistics2:material:15>,
	"pressSil": <appliedenergistics2:material:19>,
	//Everything else
    "coveredCable": <appliedenergistics2:part:36>,
    "quartzFiber": <appliedenergistics2:part:140>,
    "glassCable": <appliedenergistics2:part:16>,
    "denseCable": <appliedenergistics2:part:516>,
    "vibrantQuartzGlass": <appliedenergistics2:quartz_vibrant_glass>,
    "quartzGlass": <appliedenergistics2:quartz_glass>,
	"coreAnnihil": <appliedenergistics2:material:44>,
	"coreFormation": <appliedenergistics2:material:43>
};

//Get Botania flower with its String ID
global getBotaniaFlower as function(string) IItemStack = function
	(flowerName as string) as IItemStack {
	return <botania:specialflower>.withTag({type: flowerName});
};

//Simple function to remove an item's Crafting table recipes and add a "disabled" tooltip to it
global basicDisable as function(IItemStack, string, bool) void = function
	(item as IItemStack, recipeID as string, isChallengeOnly as bool) as void {
	if(!isServer){
		val tooltipType = isChallengeOnly ? "mce.generic.tip.challengemode_disabled" : "mce.generic.tip.disabled";
		item.addTooltip(format.red(game.localize(tooltipType)));
	}

	if(recipeID != ""){
		recipes.removeByRecipeName(recipeID);
	} else {
		recipes.remove(item);
	}
};

//"Simple" function to simultaneously add a Salis Mundus conversion, and add a tooltip to the Result item
global addSalisMundusConversion as function(IItemStack, IIngredient) void = function
	(result as IItemStack, input as IIngredient) as void {
	val debugThis = false;
	val isInputOredict as bool = input instanceof IOreDictEntry;
	var tooltipString as string = "mce.generic.tip.salis_mundus_craft";
	var inputStack as IItemStack = <minecraft:stone>;
	var inputDict as IOreDictEntry = <ore:stone>;

	if(input instanceof IItemStack){
		inputStack = getIngredientItemstack(input);
		if(!isServer)
			tooltipString = game.localize(tooltipString +".specific_mod_block")
				.replace("%s", inputStack.displayName)
				.replace("%m", game.localize("itemGroup."+ inputStack.definition.owner)
			);
	} else if(input instanceof IOreDictEntry && !isNull(inputDict)){
		val inputTemp as IOreDictEntry = input;
		inputDict = inputTemp;
		if(!isServer)
			tooltipString = game.localize(tooltipString).replace("%s", inputDict.name);
	}
	
	if(!isServer)
		for line in tooltipString.split("<BR>") {
			result.addTooltip(format.gold(line));
		}
	
	if(debugThis){
		print("Information for Salis Mundus conversion to "+ result.displayName);
		print("Input is Oredict: "+ isInputOredict);
		print("Tooltip: "+ tooltipString);
		print("Input Block: "+ input.commandString);
	}
	

	if(!isInputOredict){
		mods.thaumcraft.SalisMundus.addSingleConversion(inputStack, result);
	} else if(isInputOredict){
		mods.thaumcraft.SalisMundus.addSingleConversion(inputDict, result);
	}

	if(<ore:stone>.name == inputDict.name && inputStack.matches(<minecraft:stone>)){
		print("Salis Mundus Conversion for "+ result.displayName +" has default inputs of "+ inputDict.commandString +" and "+ inputStack.commandString +", was this intentional?");
	}
};

//Fetch an Astral Sorcery Marble variant by a shorthand name, instead of a magic number
global blockMarble as IItemStack[string] = {
	"normal": <astralsorcery:blockmarble:0>,
	"brick": <astralsorcery:blockmarble:1>,
	"pillar": <astralsorcery:blockmarble:2>,
	"arch": <astralsorcery:blockmarble:3>,
	"chiseled": <astralsorcery:blockmarble:4>,
	"engraved": <astralsorcery:blockmarble:5>,
	"runed": <astralsorcery:blockmarble:6>,

	"normalSooty": <astralsorcery:blockblackmarble:0>,
	"brickSooty": <astralsorcery:blockblackmarble:1>,
	"pillarSooty": <astralsorcery:blockblackmarble:2>,
	"archSooty": <astralsorcery:blockblackmarble:3>,
	"chiseledSooty": <astralsorcery:blockblackmarble:4>,
	"engravedSooty": <astralsorcery:blockblackmarble:5>,
	"runedSooty": <astralsorcery:blockblackmarble:6>
};

//Fetch one of a handful of Botania materials by a shorthand name, instead of a magic number
global manaResource as IItemStack[string] = {
	//Mana Materials
	"manaString": <botania:manaresource:16>,
	"manaCloth": <botania:manaresource:22>,
	"manaNugget": <botania:manaresource:17>,
	"manasteel": <botania:manaresource:0>,
	"manasteelBlock": <botania:storage:0>,
	"manaPearl": <botania:manaresource:1>,
	"manaDiamond": <botania:manaresource:2>,
	"manaDiamondBlock": <botania:storage:3>,
	"manaPowder": <botania:manaresource:23>,
	//Elven materials
	"elementiumNugget": <botania:manaresource:19>,
	"elementium": <botania:manaresource:7>,
	"elementiumBlock": <botania:storage:2>,
	"pixieDust": <botania:manaresource:8>,
	"dragonstone": <botania:manaresource:9>,
	"dragonstoneBlock": <botania:storage:4>,
	//Terra & Gaia
	"terrasteelNugget": <botania:manaresource:18>,
	"terrasteel": <botania:manaresource:4>,
	"terrasteelBlock": <botania:storage:1>,
	"gaiaSpirit": <botania:manaresource:5>,
	"gaiaIngot": <botania:manaresource:14>,
	//Etc.
	"redString": <botania:manaresource:12>
};

global MAEssenceTier as int[string] = {
	"prosperity": -1,
	"inferium": 0,
	"prudentium": 1,
	"intermedium": 2,
	"superium": 3,
	"supremium": 4
};

global MAResourceMap as int[string] = {
	"ingot": 33,
	"essence": 0,
	"souliumDust": 29,
	"souliumIngot": 38
};

global getMAResource as function(string, int) IItemStack = function
	(resourceType as string, tier as int) as IItemStack {
	return itemUtils.getItem("mysticalagriculture:crafting", MAResourceMap[resourceType] + tier);
};

//Fetch an EnderIO material by a shorthand name, instead of a magic number
global EIOMaterial as IItemStack[string] = {
	//Chassis
	"chassisSimple": <enderio:item_material:0>,
	"chassisMachine": <enderio:item_material:1>,
	"chassisSoul": <enderio:item_material:53>,
	"chassisEndsteel": <enderio:item_material:66>,
	"chassisEnhanced": <enderio:item_material:54>,
	"chassisSoulless": <enderio:item_material:55>,
	//Machine Dyes
	"organicDyeGreen": <enderio:item_material:48>,
	"organicDyeBrown": <enderio:item_material:49>,
	"organicDyeBlack": <enderio:item_material:50>,
	"industrialDye": <enderio:item_material:51>,
	"soulDye": <enderio:item_material:52>,
	"enhancedDye": <enderio:item_material:67>,
	//Grains
	"grainsPrescience": <enderio:item_material:34>,
	"grainsVibrant": <enderio:item_material:35>,
	"grainsPulsating": <enderio:item_material:36>,
	"grainsEnd": <enderio:item_material:37>,
	//Capacitors
	"capacitorBasic": <enderio:item_basic_capacitor:0>,
	"capacitorEnhanced": <enderio:item_basic_capacitor:1>,
	"capacitorOctadic": <enderio:item_basic_capacitor:2>
};

//Fetch an Immersive Engineering item by a shorthand name, instead of a magic number
global IEItem as IItemStack[string] = {
	//Multiblock Parts
	"redstoneEngineeringBlock": <immersiveengineering:metal_decoration0:3>,
	"lightEngineeringBlock": <immersiveengineering:metal_decoration0:4>,
	"heavyEngineeringBlock": <immersiveengineering:metal_decoration0:5>,
	"generatorBlock": <immersiveengineering:metal_decoration0:6>,
	"radiatorBlock": <immersiveengineering:metal_decoration0:7>,
	//Capacitors
	"capacitorLV": <immersiveengineering:metal_device0:0>,
	"capacitorMV": <immersiveengineering:metal_device0:1>,
	"capacitorHV": <immersiveengineering:metal_device0:2>,

	"redstoneBreaker": <immersiveengineering:connector:10>,
	"kineticDynamo": <immersiveengineering:metal_device1:2>,
	"ironMechComponent": <immersiveengineering:material:8>,
	"steelMechComponent": <immersiveengineering:material:9>,
	"toughFabric": <immersiveengineering:material:5>,
	"hempFiber": <immersiveengineering:material:4>,
	"slag": <immersiveengineering:material:7>,

	//Coils
	"copperCoil": <immersiveengineering:metal_decoration0:0>,
	"electrumCoil": <immersiveengineering:metal_decoration0:1>,
	"hvCoil": <immersiveengineering:metal_decoration0:2>,

	//Tools
	"hammer": <immersiveengineering:tool:0>,
	"wireCutters": <immersiveengineering:tool:1>,

	//Connectors and Relays
	"connectorLV": <immersiveengineering:connector:0>,
	"relayLV": <immersiveengineering:connector:1>,
	"connectorMV": <immersiveengineering:connector:2>,
	"relayMV": <immersiveengineering:connector:3>,
	"connectorHV": <immersiveengineering:connector:4>,
	"relayHV": <immersiveengineering:connector:5>,

	//Conveyor
	"conveyorNormal": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}),
	"conveyorRSIgnore": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:uncontrolled"}),
	"conveyorDropper": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:dropper"}),
	"conveyorVertical": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:vertical"}),
	"conveyorSplitting": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:splitter"}),
	"conveyorExtractor": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:extract"}),
	"conveyorCovered": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:covered"}),
	"conveyorCoveredDropper": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:droppercovered"}),
	"conveyorCoveredVertical": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"}),
	"conveyorCoveredExtractor": <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:extractcovered"})
};

//Actually Additions material map
global AAItem as IItemStack[string] = {
	"ironCasing": <actuallyadditions:block_misc:9>,
	"woodCasing": <actuallyadditions:block_misc:4>,
	"coilBasic": <actuallyadditions:item_misc:7>,
	"coilAdvanced": <actuallyadditions:item_misc:8>,
	//Crystals
	"blockVoid": <actuallyadditions:block_crystal:3>,
	"blockPalis": <actuallyadditions:block_crystal:1>,
	"blockRestonia": <actuallyadditions:block_crystal:0>,
	"blockEnori": <actuallyadditions:block_crystal:5>,
	"blockDiamatine": <actuallyadditions:block_crystal:2>,
	"blockEmeradic": <actuallyadditions:block_crystal:4>,
	"crystalVoid": <actuallyadditions:item_crystal:3>,
	"crystalPalis": <actuallyadditions:item_crystal:1>,
	"crystalRestonia": <actuallyadditions:item_crystal:0>,
	"crystalEnori": <actuallyadditions:item_crystal:5>,
	"crystalDiamatine": <actuallyadditions:item_crystal:2>,
	"crystalEmeradic": <actuallyadditions:item_crystal:4>,
	//Empowered Crystals
	"blockEmpoweredVoid": <actuallyadditions:block_crystal_empowered:3>,
	"blockEmpoweredPalis": <actuallyadditions:block_crystal_empowered:1>,
	"blockEmpoweredRestonia": <actuallyadditions:block_crystal_empowered:0>,
	"blockEmpoweredEnori": <actuallyadditions:block_crystal_empowered:5>,
	"blockEmpoweredDiamatine": <actuallyadditions:block_crystal_empowered:2>,
	"blockEmpoweredEmeradic": <actuallyadditions:block_crystal_empowered:4>,
	"crystalEmpoweredVoid": <actuallyadditions:item_crystal_empowered:3>,
	"crystalEmpoweredPalis": <actuallyadditions:item_crystal_empowered:1>,
	"crystalEmpoweredRestonia": <actuallyadditions:item_crystal_empowered:0>,
	"crystalEmpoweredEnori": <actuallyadditions:item_crystal_empowered:5>,
	"crystalEmpoweredDiamatine": <actuallyadditions:item_crystal_empowered:2>,
	"crystalEmpoweredEmeradic": <actuallyadditions:item_crystal_empowered:4>
};

//BM blood orb helpers
global bloodOrbTiers as string[int] = {
	1: "weak",
	2: "apprentice",
	3: "magician",
	4: "master",
	5: "archmage",
	6: "transcendent"
};

global getBloodOrb as function(string) IItemStack = function
	(tier as string) as IItemStack {
	return <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:"+ tier});
};

//Extra Utils material map
global EXU2Item as IItemStack[string] = {
	"redstoneEye": <extrautils2:ingredients:2>,
	"redCoal": <extrautils2:ingredients:4>,
	"etherealGlass": <extrautils2:ineffableglass:0>,
	"reverseEtheralGlass": <extrautils2:ineffableglass:1>,
	"ineffableGlass": <extrautils2:ineffableglass:2>,
	"darkIneffableGlass": <extrautils2:ineffableglass:3>,
	"polishedStone": <extrautils2:decorativesolid:2>,
	"stoneburnt": <extrautils2:decorativesolid:3>
};

//Thermal material map
global ThermalItem as IItemStack[string] = {
	"machineFrame": <thermalexpansion:frame:0>,
	"deviceFrame": <thermalexpansion:frame:64>,
	"cellFrame": <thermalexpansion:frame:128>,
	"hardenedCellFrame": <thermalexpansion:frame:129>,
	"reinforcedCellFrame": <thermalexpansion:frame:130>,
	"signalumCellFrame": <thermalexpansion:frame:131>,
	"resonantCellFrame": <thermalexpansion:frame:132>,
	"fullReinforcedFrame": <thermalexpansion:frame:146>,
	"fullSignalumFrame": <thermalexpansion:frame:147>,
	"fullResonantFrame": <thermalexpansion:frame:148>,
	"recieveCoil": <thermalfoundation:material:513>,
	"transmitCoil": <thermalfoundation:material:514>,
	"conductCoil": <thermalfoundation:material:515>
};

//NA bottled aura helper
global auraBottle as function(string) IItemStack = function
	(type as string) as IItemStack {
    return <naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:"+ type});
};

//IE Tool damaging for custom recipe use
// should be accurate to base mod behavior
static IEToolDurability as int[IItemStack] = {
	IEItem.hammer.withEmptyTag(): 100,
	IEItem.wireCutters.withEmptyTag(): 250
};

global damageIETool as function(IItemStack, int) IItemStack = function
	(tool as IItemStack, originalAmount as int) as IItemStack {
	var amount = originalAmount;

	for enchant in tool.enchantments {
		if(enchant.definition == <enchantment:minecraft:unbreaking>){
			for damage in 0 to originalAmount {
				if(amount == 0) break;
				if(IWorld.getFromID(0).getRandom().nextInt(enchant.level) != 0)
					amount -= 1;
			}
			break;
		}
	}

	var newTool as IItemStack = tool.updateTag({Damage: (!isNull(tool.tag.Damage) ? tool.tag.Damage : 0) + amount});

    if(newTool.tag.Damage as int < IEToolDurability[tool.withEmptyTag()])
		return newTool;
	else
		return null;
};

global IEMold as IItemStack[string] = {
	"plate": <immersiveengineering:mold:0>,
	"gear": <immersiveengineering:mold:1>,
	"rod": <immersiveengineering:mold:2>,
	"bullet": <immersiveengineering:mold:3>,
	"wire": <immersiveengineering:mold:4>,
	"packing2x": <immersiveengineering:mold:5>,
	"packing3x": <immersiveengineering:mold:6>,
	"unpacking": <immersiveengineering:mold:7>
};

// map of TAIGA alloying recipes as equal distributions of solid material
// some recipes have multiple entries for alternative inputs, mainly for cases where obsidiorite OR meteorite + obsidian can be used
global taigaAlloyMap as IItemStack[][string][] = [
	{
		"result": [<taiga:terrax_ingot> *2],
		"inputs": [<taiga:karmesine_ingot>, <taiga:ovium_ingot>, <taiga:jauxum_ingot>]
	},
	{
		"result": [<taiga:triberium_ingot>],
		"inputs": [<taiga:tiberium_ingot> *5, <taiga:basalt_ingot>]
	},
	{
		"result": [<taiga:triberium_ingot>],
		"inputs": [<taiga:tiberium_ingot> *5, <taiga:dilithium_ingot> *2]
	},
	{
		"result": [<taiga:fractum_ingot> *2],
		"inputs": [<taiga:triberium_ingot> *3, <thermalfoundation:material:770> *6, <taiga:abyssum_ingot>]
	},
	{
		"result": [<taiga:violium_ingot> *2],
		"inputs": [<taiga:aurorium_ingot> *3, <tconstruct:ingots:1> *2]
	},
	{
		"result": [<taiga:proxii_ingot> *3],
		"inputs": [<taiga:prometheum_ingot> *3, <taiga:palladium_ingot> *3, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:tritonite_ingot> *2],
		"inputs": [<tconstruct:ingots:0> *3, <taiga:terrax_ingot> *2]
	},
	{
		"result": [<taiga:ignitz_ingot> *2],
		"inputs": [<tconstruct:ingots:1> *2, <taiga:terrax_ingot> *2, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:imperomite_ingot> *2],
		"inputs": [<taiga:duranite_ingot> *3, <taiga:prometheum_ingot>, <taiga:abyssum_ingot>],
	},
	{
		"result": [<taiga:solarium_ingot> *2],
		"inputs": [<taiga:valyrium_ingot> *2, <taiga:uru_ingot> *2, <taiga:nucleum_ingot>]
	},
	{
		"result": [<taiga:adamant_ingot> *3],
		"inputs": [<taiga:vibranium_ingot>, <taiga:solarium_ingot>, <taiga:iox_ingot> *3]
	},
	{
		"result": [<taiga:seismum_ingot> *4],
		"inputs": [<thermalfoundation:material:770> *8, <taiga:triberium_ingot> *2, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:astrium_ingot> *2],
		"inputs": [<taiga:terrax_ingot> *3, <taiga:aurorium_ingot> *2]
	},
	{
		"result": [<taiga:niob_ingot> *3],
		"inputs": [<taiga:palladium_ingot> *3, <taiga:duranite_ingot>, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:yrdeen_ingot> *3],
		"inputs": [<taiga:uru_ingot> *3, <taiga:valyrium_ingot> *3, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:yrdeen_ingot> *3],
		"inputs": [<taiga:uru_ingot> *3, <taiga:valyrium_ingot> *3, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:yrdeen_ingot> *3],
		"inputs": [<taiga:uru_ingot> *3, <taiga:valyrium_ingot> *3, <taiga:abyssum_ingot>]
	},
	{
		"result": [<taiga:iox_ingot>],
		"inputs": [<taiga:eezo_ingot> *2, <taiga:abyssum_ingot> *2, <taiga:osram_ingot> *2, <taiga:obsidiorite_ingot> *9]
	},
	{
		"result": [<taiga:iox_ingot>],
		"inputs": [<taiga:eezo_ingot> *2, <taiga:abyssum_ingot> *2, <taiga:osram_ingot> *2, <taiga:meteorite_ingot> *9, <thermalfoundation:material:770> *18]
	},
	{
		"result": [<taiga:lumix_ingot>],
		"inputs": [<taiga:palladium_ingot>, <taiga:terrax_ingot>]
	},
	{
		"result": [<taiga:obsidiorite_ingot>],
		"inputs": [<taiga:meteorite_ingot>, <thermalfoundation:material:770> *2]
	},
	{
		"result": [<taiga:nucleum_ingot> *3],
		"inputs": [<taiga:proxii_ingot> *3, <taiga:abyssum_ingot>, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:nucleum_ingot> *3],
		"inputs": [<taiga:imperomite_ingot> *3, <taiga:osram_ingot>, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:nucleum_ingot> *3],
		"inputs": [<taiga:niob_ingot> *3, <taiga:eezo_ingot>, <taiga:abyssum_ingot>]
	},
	{
		"result": [<taiga:dyonite_ingot> *3],
		"inputs": [<taiga:triberium_ingot> *3, <taiga:fractum_ingot>, <taiga:seismum_ingot>, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:dyonite_ingot> *3],
		"inputs": [<taiga:tiberium_ingot> *12, <taiga:fractum_ingot>, <taiga:seismum_ingot>, <taiga:osram_ingot>]
	}
];

/*
global veryBuffedItemAttributes as double[string][IItemStack] = {};

global addAttributes as function(IItemStack, double[string]) void = function
	(item as IItemStack, attributes as double[string]) as void {
	veryBuffedItemAttributes[item] = attributes;
};
*/

print("--- Globals.zs initalized ---");