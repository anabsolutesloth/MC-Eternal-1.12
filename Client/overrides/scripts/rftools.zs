

#MC Eternal Scripts

print("--- loading rftools.zs ---");

//Dimension Builder
// balanced
recipes.remove(<rftoolsdim:dimension_builder>);
recipes.addShaped("dimbuilder_mce", <rftoolsdim:dimension_builder>,
	[[<theaurorian:auroriansteelblock>,<rats:idol_of_ratlantis>,<erebus:jade_block>],
	[<ore:relicItemAtum>,<rftools:machine_frame>,<tconstruct:materials:50>],
	[<rftools:shield_block4>,<fossil:time_machine>,<rftools:shield_block4>]]
);

print("--- rftools.zs initialized ---");