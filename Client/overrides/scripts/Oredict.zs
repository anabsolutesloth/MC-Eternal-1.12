#priority 4

#MC Eternal Scripts

print("--- loading Oredict.zs ---");

<ore:RavenFeather>.add(<twilightforest:raven_feather>);
<ore:RavenFeather>.add(<bewitchment:ravens_feather>);

<ore:oreDilithium>.add(<taiga:dilithium_ore>);
<ore:blockWarpCoreRim>.add(<techreborn:storage:2>);

<ore:gemAmethyst>.add(<mysticalworld:amethyst_gem>);
<ore:blockAmethyst>.add(<mysticalworld:amethyst_block>);

<ore:ingotCopper>.add(<mysticalworld:copper_ingot>);
<ore:blockCopper>.add(<mysticalworld:copper_block>);
<ore:nuggetCopper>.add(<mysticalworld:copper_nugget>);
<ore:dustCopper>.add(<mysticalworld:copper_dust>);

<ore:ingotSilver>.add(<mysticalworld:silver_ingot>);
<ore:blockSilver>.add(<mysticalworld:silver_block>);
<ore:nuggetSilver>.add(<mysticalworld:silver_nugget>);
<ore:dustSilver>.add(<mysticalworld:silver_dust>);

<ore:dustEnder>.add(<techreborn:dust:20>);

<ore:atumStick>.add([<atum:palm_stick>, <atum:deadwood_stick>, <atum:dusty_bone_stick>]);

<ore:foodFlour>.add(<nuclearcraft:flour>);

<ore:leavesBL>.add([<thebetweenlands:leaves_weedwood_tree>, <thebetweenlands:leaves_sap_tree>, <thebetweenlands:leaves_rubber_tree>, <thebetweenlands:leaves_hearthgrove_tree>, <thebetweenlands:leaves_nibbletwig_tree>]);

<ore:logAncient>.add([<naturesaura:ancient_log>, <naturesaura:ancient_bark>]);

<ore:itemCoin>.add([<lodsofemone:coin_small>, <lodsofemone:coin_big>]);

<ore:petAnalyzeTool>.add(<agricraft:magnifying_glass>);

//separating AR Dilithium from other Dilithium
<ore:gemDilithium>.remove(<libvulpes:productgem:0>);
<ore:dustDilithium>.remove(<libvulpes:productdust:0>);
<ore:oreDilithium>.remove(<libvulpes:ore0:0>);

<ore:oreMozzarellium>.add(<libvulpes:ore0:0>);
<ore:dustMozzarellium>.add(<libvulpes:productdust:0>);
<ore:wireGold>.add(<icbmclassic:wire:1>);

#Atum Relics (relicItemAtum)

var relicNames = [
	"eyes_of_atum",
	"body_of_atum",
	"legs_of_atum",
	"feet_of_atum",
	"atums_will",
	"atums_protection",
	"atums_bounty",
	"atums_homecoming",
	"halo_of_ra",
	"body_of_ra",
	"legs_of_ra",
	"feet_of_ra",
	"ras_fury",
	"ptahs_decadence",
	"ptahs_undoing",
	"gebs_toil",
	"gebs_grounding",
	"gebs_might",
	"tefnuts_rain",
	"tefnuts_call",
	"tefnuts_blessing",
	"shus_breath",
	"shus_exile",
	"shus_swiftness",
	"horuss_soaring",
	"horuss_ascension",
	"seths_sting",
	"seths_venom",
	"isis_healing",
	"montus_blast",
	"montus_strike",
	"anubiss_mercy",
	"anubiss_wrath",
	"nuits_vanishing",
	"nuits_duality",
	"nuits_ire",
	"nuits_quarter",
	"anputs_hunger"
] as string[];

for relic in relicNames {
	<ore:relicItemAtum>.add(itemUtils.getItem("atum:"~relic));
}

print("--- Oredict.zs initialized ---");	
