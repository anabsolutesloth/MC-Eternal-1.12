#packmode challenge
#priority 4

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.potions.IPotion;

#MC Eternal Scripts

print("--- loading challenge/_challengeconfig.zs ---");


//Grave Key Teleportation nerfing options

// This mechanic is nerfed by default in Challenge Mode because it effectively enables players to negate their death at a minor cost (an Ender Pearl or Grave Soul (which is literally free after investment))

//Are Grave Keys allowed to Teleport the player to their Grave at all? [default: true]
static graveKeyTeleportation as bool = true;

//Should teleporting to your Grave via key apply intense temporary Debuffs?
// (does nothing if graveKeyTeleportation is disabled, which should be pretty obvious)
static graveKeyTeleportationDebuffs as bool = true;

//List of Debuffs applied when sucessfully teleporting with an Enchanted Grave Key
// (does nothing if graveKeyTeleportationDebuffs is disabled)
static graveKeyTeleportationDebuffList as int[string][IPotion] = {
    //Example
    // add another / at the start of the next comment to enable the example.
    /*
    <potion:minecraft:poison>: { // potion name, associated to a list of parameters
        "level": 1, // Level of the effect, defaults to be 1 if not provided (Amplifier = this - 1)
        "duration": 100 // Duration in game Ticks, defaults to 200 (10s) if not provided (1/20ths of a second)
    },
    //*/
    <potion:minecraft:weakness>: { // potion name, associated to a list of parameters
        "level": 5, // Level of the effect, defaults to be 1 if not provided (Amplifier = this - 1)
        "duration": 200 // Duration in game Ticks, defaults to 200 (10s) if not provided (1/20ths of a second)
    },
    <potion:minecraft:hunger>: {
        "level": 2,
        "duration": 300
    },
    <potion:champions:jailed>: {
        "duration": 60
    },
    <potion:ebwizardry:arcane_jammer>: {
        "level": 4,
        "duration": 160
    },
    <potion:tconstruct:enderference>: {
        "duration": 600
    },
    <potion:potioncore:dispel>: {
        "duration": 100
    }
};

//Grave Key Soul Enchanting

//Are Grave Keys allowed to be enchanted through Grave Souls? [default: true]
// (does nothing if graveKeyTeleportation is disabled)
static graveKeySoulEnchantment as bool = true;

//Should enchanting a Grave Key with a Grave Soul require an item (specificed below) in the offhand to do? [default: true]
// (does nothing if graveKeySoulEnchantment is disabled)
static graveKeySoulEnchantmentCosts as bool = true;

//What should enchanting a Grave Key with a Grave Soul require in the offhand? [default: <contenttweaker:revival_gem>]
// (does nothing if graveKeySoulEnchantment is disabled)
static graveKeySoulEnchantmentCatalyst as IItemStack = <contenttweaker:revival_gem>;

//Should enchanting a Grave Key that is "Naturally" enchanted require a Soul from a Grave? [default: true]
// (does nothing if graveKeySoulEnchantment is disabled)
static naturallyEnchantedKeyRequiresSoul as bool = true;


//Grave Key Crafting

//Should Enchanting a Grave Key through Crafting be possible? [default: false]
// (does nothing if graveKeyTeleportation is disabled)
static graveKeyEnchantCraft as bool = false;

//What should Enchanting a Grave Key through Crafting cost? [default: [<contenttweaker:revival_gem>]]
// (does nothing if graveKeyEnchantCraft is disabled)
// Tip: use "/mt hand" while holding the *exact* (Including NBT!) item you want to add to the recipe to get it copied to your clipboard in Crafttweaker's syntax
// you can use any IIngredient (https://docs.blamejared.com/1.12/en/Vanilla/Variable_Types/IIngredient) methods on items in this array.
static graveKeyEnchantCraftItems as IIngredient[] = [
    <contenttweaker:revival_gem>,
    <ore:itemEnderCrystal>.reuse()
];


print("--- challenge/_challengeconfig.zs initialized ---");