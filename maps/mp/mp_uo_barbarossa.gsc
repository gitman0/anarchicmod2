main()
{
	setCullFog (512, 9000, .32, .36, .40, 2);
	ambientPlay("ambient_mp_kursk");

	maps\mp\_load::main();
  
	
	game["allies"] = "russian";
	game["axis"] = "german";

	prepareVehicles();

	maps\mp\barb_fx::init();

	game["american_soldiertype"] = "conscript";
	game["american_soldiervariation"] = "normal";
	game["german_soldiertype"] = "waffen";
	game["german_soldiervariation"] = "winter";

	game["attackers"] = "axis";
	game["defenders"] = "allies";

	game["hud_allies_victory_image"] 	= "gfx/hud/hud@mp_victory_barb_r.dds";
	game["hud_axis_victory_image"] 		= "gfx/hud/hud@mp_victory_barb_g.dds";
	

	maps\mp\barb_fx::main();

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
	
	//block any map exploits
	fixExploits();
	
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
	level thread maps\mp\_ba10_drive::init();	
	level thread maps\mp\_stugiii_::init();
	level thread maps\mp\_gazaa_drive::init();
	level thread maps\mp\_sdkfz_drive::init();
	level thread maps\mp\_t34_76_drive::init();
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
	level thread maps\mp\_ba10_drive::main();
	level thread maps\mp\_stugiii_::main();	
	level thread maps\mp\_sdkfz_drive::main();	
	level thread maps\mp\_gazaa_drive::main();
	level thread maps\mp\_t34_76_drive::main();
	level thread maps\mp\_mortar_::main();

}


layout_images()
{
	game["bas_layoutimage"] = "barb1_bas";
	game["ctf_layoutimage"] = "barb1_ctf";
	game["cnq_layoutimage"] = "barb1_cnq";
	game["cnq_layoutimage"] = "barb1_s&d";
        game["layoutimage"] = "barb1_cnq";
	
}

fixExploits() {

	//fixes by innocent bystander, www.after-hourz.com

	// Block access to player clip exploits
	level thread maps\mp\_exploit_blocker::blockBox((-17292, -16321, 225), (700,1,200));
	level thread maps\mp\_exploit_blocker::blockBox((-16423, -16328, 225), (500,1,200));

	//check for and nerf any landsharks
 	level thread maps\mp\_exploit_blocker::sharkScanner(-540, 2, "lt");

	
}