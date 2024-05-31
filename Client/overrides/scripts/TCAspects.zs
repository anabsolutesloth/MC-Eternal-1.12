#priority 3

import crafttweaker.item.IItemStack;
import thaumcraft.aspect.CTAspect;
import thaumcraft.aspect.CTAspectStack;

#MC Eternal Scripts

print("--- Loading TCAspects.zs ---");

//This script adds Thaumcraft Aspect support to various mods and items in MC Eternal which lack them
// you may use parts of this script for your own modpack if you wish, provided credit is given
// -Emperdog

//The map of all time
val itemAspects as CTAspectStack[][IItemStack] = {

    //Actually Additions
    <actuallyadditions:block_misc:9>: [<aspect:metallum> *45, <aspect:vitreus> *10, <aspect:potentia> *20, <aspect:tenebrae> *5],
    <actuallyadditions:block_misc:0>: [<aspect:vitreus> *7, <aspect:tenebrae> *7],
    <actuallyadditions:block_misc:1>: [<aspect:vitreus> *15, <aspect:tenebrae> *15],
    <actuallyadditions:block_misc:2>: [<aspect:vitreus> *15, <aspect:tenebrae> *15],
    <actuallyadditions:item_misc:5>: [<aspect:vitreus> *5, <aspect:tenebrae> *5],
    <actuallyadditions:item_misc:7>: [<aspect:vitreus> *20, <aspect:potentia> *15],
    <actuallyadditions:item_misc:7>: [<aspect:vitreus> *15, <aspect:potentia> *20, <aspect:metallum> *5, <aspect:desiderium> *5],
    <actuallyadditions:block_energizer>: [<aspect:metallum> *40, <aspect:potentia> *40, <aspect:vitreus> *20, <aspect:vinculum> *10],
    <actuallyadditions:block_enervator>: [<aspect:metallum> *40, <aspect:potentia> *40, <aspect:vitreus> *20, <aspect:desiderium> *10],
    <actuallyadditions:block_battery_box>: [<aspect:metallum> *60, <aspect:potentia> *50, <aspect:vitreus> *20, <aspect:permutatio> *15],
    <actuallyadditions:block_item_viewer>: [<aspect:vitreus> *25, <aspect:potentia> *10, <aspect:vacuos> *10, <aspect:permutatio> *10, <aspect:cognitio> *10],
    <actuallyadditions:block_item_viewer_hopping>: [<aspect:vitreus> *20, <aspect:potentia> *10, <aspect:vacuos> *10, <aspect:permutatio> *15, <aspect:cognitio> *10, <aspect:machina> *5],
    <actuallyadditions:block_farmer>: [<aspect:metallum> *30, <aspect:machina> *15, <aspect:herba> *10, <aspect:vitreus> *20],
    <actuallyadditions:block_bio_reactor>: [<aspect:metallum> *20, <aspect:potentia> *40, <aspect:herba> *15],
    //Crystals
    <actuallyadditions:item_crystal:3>: [<aspect:vitreus> *10, <aspect:tenebrae> *5],
	<actuallyadditions:item_crystal:1>: [<aspect:vitreus> *10, <aspect:instrumentum> *5],
	<actuallyadditions:item_crystal:0>: [<aspect:vitreus> *10, <aspect:potentia> *5],
	<actuallyadditions:item_crystal:5>: [<aspect:vitreus> *10, <aspect:motus> *5],
	<actuallyadditions:item_crystal:2>: [<aspect:vitreus> *10, <aspect:auram> *5],
	<actuallyadditions:item_crystal:4>: [<aspect:vitreus> *10, <aspect:permutatio> *5],
    <actuallyadditions:block_crystal:3>: [<aspect:vitreus> *67, <aspect:tenebrae> *33],
	<actuallyadditions:block_crystal:1>: [<aspect:vitreus> *67, <aspect:instrumentum> *33],
	<actuallyadditions:block_crystal:0>: [<aspect:vitreus> *67, <aspect:potentia> *33],
	<actuallyadditions:block_crystal:5>: [<aspect:vitreus> *67, <aspect:motus> *33],
	<actuallyadditions:block_crystal:2>: [<aspect:vitreus> *67, <aspect:auram> *33],
	<actuallyadditions:block_crystal:4>: [<aspect:vitreus> *67, <aspect:permutatio> *33],
    //Empowered Crystals
    <actuallyadditions:item_crystal_empowered:3>: [<aspect:vitreus> *10, <aspect:vacuos> *10, <aspect:potentia> *5],
	<actuallyadditions:item_crystal_empowered:1>: [<aspect:vitreus> *15, <aspect:instrumentum> *5, <aspect:potentia> *5],
	<actuallyadditions:item_crystal_empowered:0>: [<aspect:vitreus> *10, <aspect:potentia> *15],
	<actuallyadditions:item_crystal_empowered:5>: [<aspect:vitreus> *10, <aspect:motus> *5, <aspect:potentia> *7],
	<actuallyadditions:item_crystal_empowered:2>: [<aspect:vitreus> *10, <aspect:auram> *5, <aspect:praecantatio> *10, <aspect:potentia> *5],
	<actuallyadditions:item_crystal_empowered:4>: [<aspect:vitreus> *10, <aspect:permutatio> *10, <aspect:potentia> *5],
    <actuallyadditions:block_crystal_empowered:3>: [<aspect:vitreus> *67, <aspect:vacuos> *67, <aspect:potentia> *33],
	<actuallyadditions:block_crystal_empowered:1>: [<aspect:vitreus> *101, <aspect:instrumentum> *33, <aspect:potentia> *33],
	<actuallyadditions:block_crystal_empowered:0>: [<aspect:vitreus> *67, <aspect:potentia> *101],
	<actuallyadditions:block_crystal_empowered:5>: [<aspect:vitreus> *67, <aspect:motus> *33, <aspect:potentia> *47],
	<actuallyadditions:block_crystal_empowered:2>: [<aspect:vitreus> *67, <aspect:auram> *33, <aspect:praecantatio> *67, <aspect:potentia> *33],
	<actuallyadditions:block_crystal_empowered:4>: [<aspect:vitreus> *67, <aspect:permutatio> *67, <aspect:potentia> *33],
    //Crystal Shards and Crystal Clusters
    <actuallyadditions:item_crystal_shard:3>: [<aspect:vitreus> *1],
    <actuallyadditions:item_crystal_shard:1>: [<aspect:vitreus> *1],
    <actuallyadditions:item_crystal_shard:0>: [<aspect:vitreus> *1],
    <actuallyadditions:item_crystal_shard:5>: [<aspect:vitreus> *1],
    <actuallyadditions:item_crystal_shard:2>: [<aspect:vitreus> *1],
    <actuallyadditions:item_crystal_shard:4>: [<aspect:vitreus> *1],
    <actuallyadditions:block_crystal_cluster_coal>: [<aspect:vitreus> *12, <aspect:tenebrae> *6],
    <actuallyadditions:block_crystal_cluster_lapis>: [<aspect:vitreus> *12, <aspect:instrumentum> *6],
    <actuallyadditions:block_crystal_cluster_redstone>: [<aspect:vitreus> *12, <aspect:potentia> *6],
    <actuallyadditions:block_crystal_cluster_iron>: [<aspect:vitreus> *12, <aspect:motus> *6],
    <actuallyadditions:block_crystal_cluster_diamond>: [<aspect:vitreus> *12, <aspect:auram> *6],
    <actuallyadditions:block_crystal_cluster_emerald>: [<aspect:vitreus> *12, <aspect:permutatio> *6],
    //Actually Additions Fluids
    <forge:bucketfilled>.withTag({FluidName: "canolaoil", Amount: 1000}): [<aspect:metallum> *33, <aspect:herba> *15, <aspect:potentia> *5],
    <forge:bucketfilled>.withTag({FluidName: "refinedcanolaoil", Amount: 1000}): [<aspect:metallum> *33, <aspect:herba> *10, <aspect:potentia> *10],
    <forge:bucketfilled>.withTag({FluidName: "crystaloil", Amount: 1000}): [<aspect:metallum> *33, <aspect:potentia> *20, <aspect:vitreus> *15],
    <forge:bucketfilled>.withTag({FluidName: "empoweredoil", Amount: 1000}): [<aspect:metallum> *33, <aspect:potentia> *30, <aspect:vitreus> *10, <aspect:praecantatio> *10],

    //Gendustry
    <gendustry:labware>: [<aspect:vitreus> *1, <aspect:alkimia> *1, <aspect:instrumentum> *1],
    <gendustry:waste>: [<aspect:mortuus> *5, <aspect:exanimis> *2],
    <gendustry:gene_sample_blank>: [<aspect:metallum> *15, <aspect:vitreus> *10, <aspect:potentia> *7],
    <gendustry:gene_sample>: [<aspect:metallum> *15, <aspect:vitreus> *10, <aspect:potentia> *7, <aspect:victus> *8],
    <gendustry:mutagen_tank>: [<aspect:metallum> *20, <aspect:vitreus> *5, <aspect:vacuos> *10],
    <gendustry:bee_receptacle>: [<aspect:metallum> *30, <aspect:potentia> *10, <aspect:machina> *10, <aspect:sensus> *3],
    <gendustry:power_module>: [<aspect:metallum> *60, <aspect:machina> *15, <aspect:potentia> *25],
    <gendustry:genetics_processor>: [<aspect:vitreus> *30, <aspect:potentia> *15, <aspect:alienis> *8, <aspect:victus> *15],
    <gendustry:env_processor>: [<aspect:metallum> *10, <aspect:vitreus> *25, <aspect:sensus> *10, <aspect:terra> *15],
    <gendustry:upgrade_frame>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:potentia> *15, <aspect:machina> *7],
    <gendustry:climate_module>: [<aspect:metallum> *40, <aspect:potentia> *15, <aspect:aer> *10, <aspect:terra> *10],
    <gendustry:pollen_kit>: [<aspect:vitreus> *1, <aspect:herba> *2, <aspect:instrumentum> *2],
    <gendustry:eject_cover>: [<aspect:metallum> *15, <aspect:machina> *10, <aspect:motus> *10],
    <gendustry:import_cover>: [<aspect:metallum> *15, <aspect:machina> *10, <aspect:motus> *10],
    <gendustry:error_sensor_cover>: [<aspect:machina> *15, <aspect:vitreus> *5, <aspect:potentia> *25, <aspect:perditio> *5, <aspect:machina> *15],
    <gendustry:mutagen_producer>: [<aspect:machina> *50, <aspect:potentia> *40, <aspect:victus> *10],
    <gendustry:mutatron>: [<aspect:machina> *45, <aspect:potentia> *50, <aspect:vitreus> *20, <aspect:sensus> *8],
    <gendustry:industrial_apiary>: [<aspect:machina> *40, <aspect:potentia> *5, <aspect:vitreus> *10],
    <gendustry:imprinter>: [<aspect:machina> *45, <aspect:vitreus> *30, <aspect:victus> *20, <aspect:potentia> *30],
    <gendustry:sampler>: [<aspect:machina> *45, <aspect:vitreus> *25, <aspect:potentia> *20, <aspect:victus> *15],
    <gendustry:mutatron_advanced>: [<aspect:machina> *60, <aspect:potentia> *60, <aspect:vitreus> *30, <aspect:sensus> *15, <aspect:ordo> *15],
    <gendustry:liquifier>: [<aspect:machina> *40, <aspect:potentia> *20, <aspect:victus> *25, <aspect:aqua> *15],
    <gendustry:extractor>: [<aspect:machina> *40, <aspect:potentia> *20, <aspect:victus> *30, <aspect:vitreus> *15],
    <gendustry:transposer>: [<aspect:machina> *45, <aspect:potentia> *25, <aspect:victus> *5, <aspect:vitreus> *30, <aspect:desiderium> *10, <aspect:motus> *10],
    <gendustry:replicator>: [<aspect:machina> *50, <aspect:potentia> *40, <aspect:victus> *35, <aspect:desiderium> *25, <aspect:ordo> *15, <aspect:fabrico> *20],
    <gendustry:gene_template>: [<aspect:metallum> *25, <aspect:vitreus> *20, <aspect:desiderium> *10],
    <gendustry:industrial_grafter>: [<aspect:metallum> *40, <aspect:vitreus> *30, <aspect:instrumentum> *40, <aspect:potentia> *15, <aspect:herba> *10],
    <gendustry:industrial_scoop>: [<aspect:metallum> *40, <aspect:vitreus> *10, <aspect:instrumentum> *40, <aspect:potentia> *15, <aspect:vinculum> *15],
    //Industrial Apiary Upgrades
    // sorted in JEI order
    <gendustry:apiary.upgrade:17>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *8, <aspect:terra> *13, <aspect:herba> *5],
    <gendustry:apiary.upgrade:11>: [<aspect:metallum> *25, <aspect:vitreus> *30, <aspect:lux> *20, <aspect:sensus> *10],
    <gendustry:apiary.upgrade:2>: [<aspect:metallum> *25, <aspect:vitreus> *25, <aspect:herba> *10, <aspect:desiderium> *4],
    <gendustry:apiary.upgrade:20>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *8, <aspect:gelum> *5, <aspect:terra> *5],
    <gendustry:apiary.upgrade:5>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *5, <aspect:ignis> *8],
    <gendustry:apiary.upgrade:14>: [<aspect:metallum> *35, <aspect:vitreus> *15, <aspect:potentia> *15, <aspect:machina> *10, <aspect:sensus> *5],
    <gendustry:apiary.upgrade:4>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *5, <aspect:aqua> *8],
    <gendustry:apiary.upgrade:13>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *8, <aspect:ignis> *25],
    <gendustry:apiary.upgrade:22>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:herba> *10, <aspect:mortuus> *20],
    <gendustry:apiary.upgrade:16>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *8, <aspect:ignis> *8, <aspect:terra> *8],
    <gendustry:apiary.upgrade:7>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:auram> *5, <aspect:gelum> *10],
    <gendustry:apiary.upgrade:1>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:mortuus> *10, <aspect:bestia> *8],
    <gendustry:apiary.upgrade:10>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:vacuos> *10, <aspect:aer> *5],
    <gendustry:apiary.upgrade:19>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:victus> *15, <aspect:ordo> *15, <aspect:alienis> *5],
    <gendustry:apiary.upgrade:18>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *8, <aspect:herba> *15, <aspect:terra> *10],
    <gendustry:apiary.upgrade:3>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *5, <aspect:vacuos> *5, <aspect:desiderium> *8],
    <gendustry:apiary.upgrade:21>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *8, <aspect:aqua> *20],
    <gendustry:apiary.upgrade:12>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:aer> *10, <aspect:lux> *10, <aspect:vacuos> *8],
    <gendustry:apiary.upgrade:6>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:auram> *5, <aspect:ignis> *10],
    <gendustry:apiary.upgrade:15>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:herba> *5, <aspect:desiderium> *8],
    <gendustry:apiary.upgrade:0>: [<aspect:metallum> *25, <aspect:vitreus> *15, <aspect:desiderium> *15, <aspect:machina> *5, <aspect:potentia> *10],
    //Gendustry Fluids
    <forge:bucketfilled>.withTag({FluidName: "mutagen", Amount: 1000}): [<aspect:metallum> *33, <aspect:victus> *15, <aspect:perditio> *10],
    <forge:bucketfilled>.withTag({FluidName: "liquiddna", Amount: 1000}): [<aspect:metallum> *33, <aspect:victus> *15, <aspect:ordo> *10],
    <forge:bucketfilled>.withTag({FluidName: "protein", Amount: 1000}): [<aspect:metallum> *33, <aspect:victus> *30]
};

//Loop time
for item,aspects in itemAspects {
    item.setAspects(aspects);
}

print("--- TCAspects.zs initialized ---");