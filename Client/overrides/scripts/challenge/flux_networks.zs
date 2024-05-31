#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import thaumcraft.aspect.CTAspectStack;

#MC Eternal Scripts

print("--- Loading challenge/flux_networks.zs ---");

val fluxnetItemNames = [
	"fluxcontroller",
	"fluxpoint",
	"fluxplug",
	"fluxstorage",
	"herculeanfluxstorage",
	"gargantuanfluxstorage",
	"fluxblock"
] as string[];

for name in fluxnetItemNames {
	recipes.removeByRecipeName("fluxnetworks:tile.fluxnetworks."+ name);
}

// Flux Cores
recipes.remove(<fluxnetworks:fluxcore>);
recipes.addShaped("mce_challengemode_flux_core", <fluxnetworks:fluxcore> *8, [
	[<fluxnetworks:flux>, <tconstruct:large_plate>.withTag({Material: "obsidiorite"}), <dimdoors:world_thread>],
	[<nuclearcraft:part:5>, <appliedenergistics2:material:48>, <nuclearcraft:part:5>],
	[<dimdoors:world_thread>, <tconstruct:large_plate>.withTag({Material: "obsidiorite"}), <fluxnetworks:flux>],
]);

//Flux Block
recipes.addShaped("mce_challengemode_flux_block", <fluxnetworks:fluxblock>, [
	[<fluxnetworks:flux>, <fluxnetworks:fluxcore>, <fluxnetworks:flux>],
	[<fluxnetworks:fluxcore>, <quark:biotite_block>, <fluxnetworks:fluxcore>],
	[<fluxnetworks:flux>, <fluxnetworks:fluxcore>, <fluxnetworks:flux>]
]);

//Flux Controller
// Enables FluxNet Wireless charging, which is very op
mods.thaumcraft.Infusion.registerRecipe("mce_challengemode_flux_controller", "", <fluxnetworks:fluxcontroller>, 8, [
        <aspect:spiritus> * 200,
        <aspect:machina> * 150,
        <aspect:motus> * 75
    ], 
    <randomthings:spectrecharger:2>, 
    [
        <fluxnetworks:gargantuanfluxstorage>,
        <rats:psionic_rat_brain>,
        <iceandfire:fire_dragon_heart>,
        <fluxnetworks:gargantuanfluxstorage>,
        <rats:arcane_technology>,
        <iceandfire:ice_dragon_heart>
]);

// Flux Point
recipes.addShaped("mce_challengemode_flux_point", <fluxnetworks:fluxpoint>, [
	[null, <fluxnetworks:fluxcore>],
	[<fluxnetworks:fluxcore>, <randomthings:spectrecoil_ender>, <fluxnetworks:fluxcore>],
	[null, <fluxnetworks:fluxcore>]
]);

// Flux Plug
recipes.addShaped("mce_challengemode_flux_plug", <fluxnetworks:fluxplug>, [
	[null, <fluxnetworks:fluxcore>],
	[<fluxnetworks:fluxcore>, <randomthings:spectreenergyinjector>, <fluxnetworks:fluxcore>],
	[null, <fluxnetworks:fluxcore>]
]);

// Flux Storages
//Basic
recipes.addShaped("mce_challengemode_flux_storage", <fluxnetworks:fluxstorage>, [
	[null, <fluxnetworks:fluxcore>, null],
	[<fluxnetworks:fluxcore>, <rftools:powercell>, <fluxnetworks:fluxcore>],
	[null, <fluxnetworks:fluxcore>, null]
]);

//Herculean
recipes.addShaped("mce_challengemode_flux_storage_herculean", <fluxnetworks:herculeanfluxstorage>, [
	[null, <fluxnetworks:fluxstorage>, null],
	[<fluxnetworks:fluxstorage>, <rftools:powercell_advanced>, <fluxnetworks:fluxstorage>],
	[<fluxnetworks:fluxblock>, <fluxnetworks:fluxstorage>, <fluxnetworks:fluxblock>]
]);

//Gargantuan
recipes.addShaped("mce_challengemode_flux_storage_gargantuan", <fluxnetworks:gargantuanfluxstorage>, [
	[<fluxnetworks:fluxblock>, <fluxnetworks:herculeanfluxstorage>, <fluxnetworks:fluxblock>],
	[<fluxnetworks:herculeanfluxstorage>, <mekanism:machineblock3:0>, <fluxnetworks:herculeanfluxstorage>],
	[<fluxnetworks:fluxblock>, <fluxnetworks:herculeanfluxstorage>, <fluxnetworks:fluxblock>]
]);

print("--- challenge/flux_networks.zs initialized ---");