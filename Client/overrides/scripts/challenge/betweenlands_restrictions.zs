#packmode challenge

import crafttweaker.event.EntityTravelToDimensionEvent;
import crafttweaker.event.EntityLivingEquipmentChangeEvent;
import crafttweaker.event.PlayerOpenContainerEvent;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.ITickEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.text.ITextComponent;

import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;

#MC Eternal Scripts

print("--- loading challenge/betweenlands_restrictions.zs ---");

static scriptDebug as bool = false;
/*
val extraIllegalInBetween = [
    <minecraft:stone>,
    <minecraft:dirt:*>
] as IItemStack[];

<ore:extraIllegalInBetween>.add(extraIllegalInBetween);
/*
    TODO

    Bauble check (and Enderchest check?) - DONE

    Damage Dealt cap and Damage Taken floor
        respects Brews

    Equipment Change drop - DONE

    check player inventory periodically for naughty items
*

//41 entities that can hurt you in BL, a
val damageLimits as float[IEntityDefinition] = {
    <entity:thebetweenlands:swamp_hag> : 0.5
};
*/

static betweenlandsID as int = 20;

function baubleCheck (player as IPlayer) as bool {
    if(player.nbt.ForgeCaps.asMap()["baubles:container"].Items.length != 0){
        if(scriptDebug) print(player.name +" has Baubles equipped");
        return false;
    }
    return true;
}

function itemCheck (stack as IItemStack) as bool {
    if(!isNull(stack) && (stack.definition.owner == "thebetweenlands" || stack.definition.id == "tombstone:grave_key"))
        return false;
    if(scriptDebug) print("Failed itemCheck on: "+ stack.commandString);
    return true;
}

function doEquipmentDrop (stack as IItemStack, slot as IEntityEquipmentSlot, player as IPlayer) as void {
        if(scriptDebug) print(player.name +" tried to hold "+ stack.commandString +" in The Betweenlands, it has been forcibly dropped due to Challenge Mode restrictions");
        val itemEntity = stack.createEntityItem(player.world, player.position);
        itemEntity.posX = player.posX;
        itemEntity.posY = player.posY + 3.0;
        itemEntity.posZ = player.posZ;
        itemEntity.motionY = 0.3;
        player.world.spawnEntity(itemEntity);
        player.setItemToSlot(slot, null);
}

events.onEntityTravelToDimension(function(event as EntityTravelToDimensionEvent){
    if(!event.entity.world.remote && event.dimension == betweenlandsID){
        if(event.entity instanceof IPlayer){
            val player as IPlayer = event.entity;
            var isAllowedBetween = true;
            var currentStack as IItemStack;
            var equipIndex = 0;

            //Armor, Offhand, and Mainhand check
            for equip in player.equipmentAndArmor {
                if(!isNull(equip) && itemCheck(equip)){
                    if(scriptDebug) print("Item in equip slot "+ equipIndex +": "+ equip.commandString +", Mod: "+ equip.definition.owner);
                    isAllowedBetween = false;
                    break;
                }
                equipIndex += 1;
            }

            //Baubles check
            if(isAllowedBetween) isAllowedBetween = baubleCheck(player);

            //Main Inventory check
            if(isAllowedBetween) for index in 0 to 36 {
                currentStack = player.getInventoryStack(index);
                if(!isNull(currentStack) && itemCheck(player.getInventoryStack(index))){
                    if(scriptDebug) print("Item in slot "+ index +": "+ currentStack.commandString +", Mod: "+ currentStack.definition.owner);
                    isAllowedBetween = false;
                    break;
                }
            }
            /*
            //Enderchest check code incase it needs to be more draconian
            if(isAllowedBetween) for enderItem in player.nbt.EnderItems.asList() {
                if(enderItem.id as string.split(":")[0] != "thebetweenlands"){
                    if(scriptDebug) print("Ender Chest Item in slot "+ enderItem.Slot +": "+ enderItem.id);
                    isAllowedBetween = false;
                    break;
                }
            }
            //*/
            if(scriptDebug) print("Can "+ player.name +" go to The Betweenlands?: "+ isAllowedBetween);

            if(!isAllowedBetween){
                player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.betweenlands_restrictions.denied_entry_message.1"));
                player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.betweenlands_restrictions.denied_entry_message.2"));
                if(scriptDebug) print(player.name +" attempted travel to The Betweenlands, but was rejected due to having disallowed Items.");
                event.cancel();
            }
            return;

            //Deny non-BL entities travelling to BL
            // prevents very mean entities from going in and being a massive problem, and also cheese of getting non-BL items inside via item entities or those with accessible inventories
        } else if(event.entity.definition.id.split(":")[0] != "thebetweenlands"){
            if(scriptDebug) print("Entity "+ event.entity.definition.id +" attempted entry to The Betweenlands at [x"+ event.entity.x as int +" y"+ event.entity.y as int +" z"+ event.entity.z as int +"], but was rejected due to Challenge Mode restrictions");
            event.cancel();
            return;
        }
    }
});

//Drop Non-BL items equipped or held in hand(s) when in BL
events.onEntityLivingEquipmentChange(function(event as EntityLivingEquipmentChangeEvent){
    if(!event.entityLivingBase.world.remote && event.entityLivingBase.dimension == betweenlandsID && event.entityLivingBase instanceof IPlayer && !isNull(event.newItem)){
        val player as IPlayer = event.entityLivingBase;
        if(itemCheck(event.newItem)){
            player.sendChat(game.localize("mce.challengemode.betweenlands_restrictions.equipped_restricted_item"));
            doEquipmentDrop(event.newItem, event.slot, player);
        } else if(event.newItem.isEnchanted){
            player.sendChat(game.localize("mce.challengemode.betweenlands_restrictions.equipped_enchanted_item"));
            doEquipmentDrop(event.newItem, event.slot, player);
        }
    }
});

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){
    if(!event.entity.world.remote && event.entity.dimension == betweenlandsID){

        if(scriptDebug) print("Starting Damage: "+ event.amount);
        if(event.entity instanceof IPlayer){
            
            val player as IPlayer = event.entity;
            /*
            if(!(event.damageSource.trueSource instanceof IPlayer) && event.damageSource.trueSource.definition.id.split(":")[0] == "thebetweenlands"){
                var currentMin = damageLimits[event.damageSource.trueSource.definition] as float;

                for effect in player.activePotionEffects {
                    if(effect.effectName == "effect.resistance"){
                        event.amount *= (1.0 - (0.2 * ((effect.amplifier + 1) < 3 ? effect.amplifier : 3)));
                        if(!scriptDebug) break;
                    }
                    if(scriptDebug){
                        print(effect.effectName);
                        print("Damage after Resistance compensation: "+ event.amount);
                    }
                }

                if(scriptDebug){
                    print("Attacker ID: "+ event.damageSource.trueSource.definition.id);
                    print("Starting Amount: "+ event.amount);
                    print("Cap from this Entity: "+ currentMin);
                    print("Player's active Potion Effects:");
                }

                if(event.amount < currentMin) event.amount = currentMin;
            }
            */
        } else if(event.damageSource.trueSource instanceof IPlayer){
            /*
            val player as IPlayer = event.damageSource.trueSource;
            print("Player-Sourced attack, Details: Source Entity: "+ event.damageSource.trueSource.displayName +", Victim: "+ event.entity.displayName +", Amount: "+ event.amount);
            if(event.amount > 12.0){
                var strengthCompensation as float;
                for effect in player.activePotionEffects {
                    if(effect.effectName == "effect.strength"){
                        strengthCompensation += (3.0 * (effect.amplifier + 1)) as float;
                        break;
                    } else if(effect.effectName == "bl.elixir.strength"){
                        strengthCompensation += (3.5 * (effect.amplifier + 1)) as float;
                    }
                }
                event.amount = 12.0 + strengthCompensation;
            }
            //*/
        } else if(scriptDebug){
            print("Environmental Damage of type: "+ event.damageSource.damageType +", Amount: "+ event.amount);
        }
    }
});

//Modifier UUID for health clamp attribute
static decayHPUUID as string = "3cdcc970-7d9e-4b89-8290-e4ebb02a0a36";

//Betweenlands' Decay Health Modifier UUID
// taken from Betweenlands source code at "thebetweenlands.common.handler.PlayerDecayHandler"
static BLDecayHPUUID as string = "033f5f10-67b3-42f3-8511-67a575fbb099";

//force max health to 20 in betweenlands
events.onPlayerTick(function(event as PlayerTickEvent){
    //*
    if(!event.player.world.remote && event.player.world.time % 20 == 0 && event.phase == "START"){
        val healthAttribute = event.player.getAttribute("generic.maxHealth");

        //remove modifier outside of betweenlands
        if(event.player.dimension != betweenlandsID){
            if(!isNull(healthAttribute.getModifier(decayHPUUID)))
                healthAttribute.removeModifier(decayHPUUID);
            return;
        }

        val BLDecayAmount = !isNull(healthAttribute.getModifier(BLDecayHPUUID)) ? healthAttribute.getModifier(BLDecayHPUUID).getAmount() : 0.0;
        val currentModifier as double = !isNull(healthAttribute.getModifier(decayHPUUID)) ? healthAttribute.getModifier(decayHPUUID).getAmount() : 0.0;
        val amount = ((20.0 - event.player.maxHealth) + currentModifier + BLDecayAmount) as double;

        if(scriptDebug){
            print("health already removed by Decay: "+ BLDecayAmount);
            print("current health reduction: "+ currentModifier);
            print("calculated amount to remove: "+ amount);
        }

        //return if calculation is identical
        //removing and then reapplying the modifer is an unecessary operation
        if(amount == currentModifier) return;

        //update modifier with new amount
        if(!isNull(healthAttribute.getModifier(decayHPUUID)))
            healthAttribute.removeModifier(decayHPUUID);
        healthAttribute.applyModifier(AttributeModifier.createModifier("MCE - Betweenlands Challenge Mode Health Reduction", amount, 0, decayHPUUID));
    }
    //*/
});

/*
events.onPlayerOpenContainer(function(event as PlayerOpenContainerEvent){
    print(event.container as string);
});
*/

print("--- challenge/betweenlands_restrictions.zs initialized ---");
