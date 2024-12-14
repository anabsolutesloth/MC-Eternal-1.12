import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;

import crafttweaker.event.EntityLivingDamageEvent;

#MC Eternal Scripts

print("--- DamageTypeModification.zs initialized ---");

//Enable Debug? (prints detailed info when this code runs.)
val debug = false;

//Print incoming damage information? victim of damage, and the amount
// use "all" for all entities or "player" for only players. any other value will disable it.
val printDamageInfo = "player";

//Player Only Mode?
// checks if the victim of Damage is a player, if it is not, code will not be run.
// should help performance subtly, especially against players with high attackspeeds.
val playerOnlyMode = true;

//example NBT to reduce "generic" damage by 40% on an armor piece
/*

{
	typeReduction: [
		{
			type: "generic",
			value: 0.6,
			effect: "factor"
		}
	]
}
the "mob" element can be used to reduce the damage type only when it is detected to be caused by an entity with a specific ID
ex; mob: "minecraft:zombie"

the "absorb" element can be used to allow damage to be reduced below zero, functionally healing the wearer
ex; absorb: true
*/

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){
	//Determine damage logging type
	val damageInfoCheck = printDamageInfo == "all" || printDamageInfo == "player" && event.entity instanceof IPlayer;

	if(damageInfoCheck){
		//Log damage pre-modification
		print("");
		print("Incoming damage, Victim: '"+ event.entity.displayName +"', Type: '"+ event.damageSource.getDamageType() +"', Amount: "+ event.amount);
	}
	
	if(event.entity.armorInventory.length != 0){
		for armor in event.entity.armorInventory {
			if(!isNull(armor)){
				if(debug)
					print(armor.commandString);

				if(!isNull(armor.tag.typeReduction)){
					for entry in armor.tag.typeReduction.asList() {
						if(debug)
							print(entry);
						if(!isNull(entry.type)){

							//Check if damage type matches
							if(event.damageSource.getDamageType() == entry.type){
								if(debug){
									print("Incoming Type '"+ event.damageSource.getDamageType() +"' matches Type in Data '"+ entry.type +"'");
									if(!isNull(entry.mob) && !isNull(event.damageSource.trueSource) && event.damageSource.trueSource instanceof IEntityLivingBase){
										print("attacking entity '"+ event.damageSource.trueSource.definition.id +"' matches stored ID '"+ entry.mob.asString() +"' : "+ (event.damageSource.trueSource.definition.id == entry.mob.asString()));
									}
								}

								if(!isNull(entry.mob) && !isNull(event.damageSource.trueSource) && event.damageSource.trueSource instanceof IEntityLivingBase && event.damageSource.trueSource.definition.id != entry.mob.asString())
									return;

								//Check if
								if(!isNull(entry.value) && !isNull(entry.effect)){

									//'factor' modification multiplies all damage from given source by given value
									// can be used to reduce (less than 1.0) or increase (more than 1.0)
									if(entry.effect == "factor"){
										event.amount *= entry.value;
										if(debug)
											print("'factor' modification of '"+ entry.value +"' applied for type '"+ entry.type +"' from '"+ armor.displayName +"'");

									//'flat' modification removes the given amount from all damage from given source
									// will not make damage negative (heal) unless 'absorb' element is present in an entry and true
									} else if(entry.effect == "flat"){
										event.amount -= entry.value;

										if(event.amount < 0){
											//Default to not absorbing damage if tag is not present
											if(isNull(entry.absorb) || entry.absorb == false){
												event.amount = 0;

											//Do nothing (except print) if absorb is true
											} else if(debug == true && entry.absorb == true){
												print("Damage Absorb enabled for '"+ armor.displayName +"'");

											//Prevent absorbing if tag is false
											}/* else if(entry.absorb == false){
												event.amount = 0;
											}*/
										}
										
										if(debug)
											print("'flat' modification of '"+ entry.value +"' applied for type '"+ entry.type +"' from '"+ armor.displayName +"'");
									}

								//Print post-modification damage
								if(damageInfoCheck) 
									print("Damage after modification: "+ event.amount);
								if(debug)
									print("");
								//Only allow modifying any given type once per armor piece
								// mild performance reasons
								break;
								} else if(debug)
									print("'value' or 'effect' tag of '"+ armor.displayName +"' worn by '"+ event.entity.displayName +"' is invalid!");
							}
						//Log
						} else if(debug) 
							print("No 'type' defined for entry on '"+ armor.displayName +"' worn by '"+ event.entity.displayName +"' at "+ event.entity.posX as int +"x "+ event.entity.posY as int +"y "+ event.entity.posZ as int +"z");
						if(debug) print("");
					}

				//Log when no reduction tag is found
				} else if(debug){
					print("No reduction data found on '"+ armor.displayName +"' worn by '"+ event.entity.displayName +"'");
					print("");
				}
			}
		}
	}
});

print("--- DamageTypeModification.zs initialized ---");

//give @p twilightforest:yeti_chestplate 1 0 {ench: [{lvl: 6, id: 3}, {lvl: 5, id: 1}], Unbreakable: 1b, typeReduction: [{effect: "factor", absorb: 0b, type: "dragon_ice", value: 0.5}], display: {Lore: ["Warm on the inside, Cold to the touch on the outside...", "§dExclusive Twilight Relic"], Name: "§9§lJacket of the Frozen Alpha"}, AttributeModifiers: [{UUIDMost: 4328, UUIDLeast: 54780304, Amount: 15, Slot: "chest", AttributeName: "generic.armor", Operation: 0, Name: "Frozen Alpha Jacket - Armor"}]}