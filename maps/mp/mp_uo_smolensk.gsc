main()
{
	setCullFog (1024, 9000, .32, .36, .40, 0);

	ambientPlay("ambient_mp_dawnville");

	maps\mp\_load::main();
     	maps\mp\mp_uo_smolensk::layout_images();
	
	game["allies"] = "russian";
	game["axis"] = "german";

	prepareVehicles();

//	maps\mp\barb_fx::init();

	game["american_soldiertype"] = "conscript";
	game["american_soldiervariation"] = "normal";
	game["german_soldiertype"] = "waffen";
	game["german_soldiervariation"] = "normal";

	game["attackers"] = "axis";
	game["defenders"] = "allies";

	game["hud_allies_victory_image"] = "gfx/hud/hud@mp_victory_barb_r.dds";
	game["hud_axis_victory_image"] 	= "gfx/hud/hud@mp_victory_barb_g.dds";

//	EFX play...copy to EFX.gsc

     maps\mp\_fx::loopfx("s3", (3218, -18932, -182), 0.4);
     maps\mp\_fx::loopfx("s3", (-8204, -6658, 512), 0.4);	
     maps\mp\_fx::loopfx("s3", (6110, -18146, -144), 0.4);
     maps\mp\_fx::loopfx("f3", (6740, -8008, -122), 0.4);
     maps\mp\_fx::loopfx("s1", (2994, -3714, -62), 0.4);
     maps\mp\_fx::loopfx("s3", (-24312, -17408, 192), 0.4);
     maps\mp\_fx::loopfx("s3", (-21698, -19742, 100), 0.4);

     level._effect["s1"] = loadfx ("fx/smoke/dawnville_smoke.efx");
     level._effect["s3"] = loadfx ("fx/smoke/dawnville_smoke3.efx");
     level._effect["f3"] = loadfx ("fx/fire/building_fire_big.efx");

  game["bas_allies_rubble"] = "xmodel/mp_bunker_italy_rubble";
  game["bas_allies_complete"] = "xmodel/mp_bunker_italy";
  game["bas_allies_damaged"] = "xmodel/mp_bunker_italy_predmg";
  game["bas_allies_destroyed"] = "xmodel/mp_bunker_italy_dmg";
  game["bas_axis_rubble"] = "xmodel/mp_bunker_italy_rubble";
  game["bas_axis_complete"] = "xmodel/mp_bunker_italy";
  game["bas_axis_damaged"] = "xmodel/mp_bunker_italy_predmg";
  game["bas_axis_destroyed"] = "xmodel/mp_bunker_italy_dmg";

  maps\mp\_util_mp_gmi::base_swapper();   
	startVehicles();	
	
}

prepareVehicles() {
	
	level thread maps\mp\_tankdrive_gmi::main();
	level thread maps\mp\_jeepdrive_gmi::main();
	level thread maps\mp\_kv1_drive::init();
	level thread maps\mp\_pak40_::init();
	level thread maps\mp\_pak45_::init();
	level thread maps\mp\_bt7_drive::init();
	level thread maps\mp\_pziii_drive::init();
	level thread maps\mp\_pziv_drive::init();
	level thread maps\mp\_t34_76_drive::init();	
	level thread maps\mp\_stugiii_::init();
	level thread maps\mp\_gazaa_drive::init();
	level thread maps\mp\_sdkfz_drive::init();
	level thread maps\mp\_mortar_::init();
	
}

startVehicles() {
	
	wait (2);
	level thread maps\mp\_kv1_drive::main();
	level thread maps\mp\_pak40_::main();
	level thread maps\mp\_pak45_::main();
	level thread maps\mp\_bt7_drive::main();
	level thread maps\mp\_pziii_drive::main();
	level thread maps\mp\_pziv_drive::main();
	level thread maps\mp\_t34_76_drive::main();
	level thread maps\mp\_stugiii_::main();	
	level thread maps\mp\_sdkfz_drive::main();	
	level thread maps\mp\_gazaa_drive::main();
	level thread maps\mp\_mortar_::main();

}


layout_images()
{
	game["bas_layoutimage"] = "smolensk_base";
	game["ctf_layoutimage"] = "smolensk_ctf";
	game["cnq_layoutimage"] = "smolensk_cnq";
//	game["sd_layoutimage"] = "barb1_s&d";
//      game["layoutimage"] = "smo";
	
	
}