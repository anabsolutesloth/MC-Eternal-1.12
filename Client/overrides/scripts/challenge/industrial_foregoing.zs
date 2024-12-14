#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.industrialforegoing.Extractor;

#MC Eternal Scripts

print("--- Loading challenge/industrial_foregoing.zs ---");

val IFMachines as string[] = [
    "petrified_fuel_generator",
    "enchantment_refiner",
    "enchantment_extractor",
    "enchantment_aplicator",
    "mob_relocator",
    "potion_enervator",
    "animal_independence_selector",
    "animal_stock_increaser",
    "crop_sower",
    "crop_enrich_material_injector",
    "crop_recolector",
    "water_condensator",
    "water_resources_collector",
    "animal_resource_harvester",
    "mob_slaughter_factory",
    "mob_duplicator",
    "block_destroyer",
    "block_placer",
    "tree_fluid_extractor",
    "latex_processing_unit",
    "sewage_composter_solidifier",
    "animal_byproduct_recolector",
    "sludge_refiner",
    "mob_detector",
    "lava_fabricator",
    "bioreactor",
    "biofuel_generator",
    "laser_base",
    "laser_drill",
    "ore_processor",
    "black_hole_controller_reworked",
    "dye_mixer",
    "enchantment_invoker",
    "spores_recreator",
    "animal_growth_increaser",
    "material_stonework_factory",
    "resourceful_furnace",
    "villager_trade_exchanger",
    "energy_field_provider",
    "oredictionary_converter",
    "protein_reactor",
    "protein_generator",
    "hydrator",
    "wither_builder",
    "fluid_pump",
    "fluid_crafter",
    "plant_interactor",
    "item_splitter",
    "fluiddictionary_converter",
    "froster",
    "ore_washer",
    "ore_fermenter",
    "ore_sieve",
    "pitiful_fuel_generator"
];

//Make IF Machines not craftable with Thermal or EIO frames
for machine in IFMachines {
    recipes.removeByRecipeName("industrialforegoing:"+ machine + "_thermal");
    recipes.removeByRecipeName("industrialforegoing:"+ machine + "_enderio");
}

//Plastic stuff


print("--- challenge/industrial_foregoing.zs initialized ---");