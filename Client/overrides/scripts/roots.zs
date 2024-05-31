import mods.roots.Mortar;
import mods.roots.RunicShears;

#MC Eternal Scripts

print("--- loading roots.zs ---");

//Unify Roots Flour recipe
Mortar.removeRecipe(<roots:flour>);
Mortar.addRecipe("wheat_flour", <nuclearcraft:flour>, [<ore:cropWheat>]);
Mortar.addRecipe("potato_flour", <nuclearcraft:flour>, [<ore:cropPotato>]);


//Runic Shearing

//Amphithere
RunicShears.addEntityRecipe("mce_amphithere_feather_from_amphithere", <iceandfire:amphithere_feather>, <entity:iceandfire:amphithere>, 1800);

//Hippocampus
RunicShears.addEntityRecipe("mce_shiny_scales_from_hippocampus", <iceandfire:shiny_scales>, <entity:iceandfire:hippocampus>, 3000);

//Runic Shearing end

print("--- roots.zs initialized ---");