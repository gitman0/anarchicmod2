main()
{   
	setCullFog (0, 6144, 0.8, 0.8, 0.8, 0);
	ambientPlay("ambient");
	
	// set the nighttime flag to be off
	setcvar("sv_night", "0" );

	maps\mp\_load::main();
	level thread maps\mp\mp_uo_dragoon_beta2::layout_images();
	maps\mp\_flak_gmi::main();
	level thread maps\mp\_tankdrive_gmi::main();
	level thread maps\mp\_jeepdrive_gmi::main();

	level thread maps\mp\_gazaa_drive::init();
	level thread maps\mp\_sdkfz_drive::init();
	level thread maps\mp\_mortar_::init();

	level thread maps\mp\_gazaa_drive::main();
	level thread maps\mp\_sdkfz_drive::main();
	level thread maps\mp\_mortar_::main();


//	-------------------------------------------	
//	BASE ASSAULT SETUP
	if(getCvar("scr_bas_basehealth") == "")		// healtg for each base
		setCvar("scr_bas_basehealth", "9100");	// 700 tank shell * 13
//	if(getCvar("scr_bas_damagedhealth") == "")	// health to switch to damage model
//		setCvar("scr_bas_damagedhealth", getCvarInt("scr_bas_basehealth")/2);


	game["bas_allies_rubble"] 	= "xmodel/mp_bunker_italy_rubble";
	game["bas_allies_complete"] 	= "xmodel/mp_bunker_italy";
	game["bas_allies_damaged"] 	= "xmodel/mp_bunker_italy_predmg";
	game["bas_allies_destroyed"] 	= "xmodel/mp_bunker_italy_dmg";
	game["bas_axis_rubble"] 	= "xmodel/mp_bunker_rhinevalley_rubble";
	game["bas_axis_complete"] 	= "xmodel/mp_bunker_rhinevalley";
	game["bas_axis_damaged"] 	= "xmodel/mp_bunker_rhinevalley_predmg";
	game["bas_axis_destroyed"] 	= "xmodel/mp_bunker_rhinevalley_dmg";
//	-------------------------------------------	

        maps\mp\_util_mp_gmi::base_swapper();


	game["allies"] = "american";
	game["axis"] = "german";

	game["american_soldiertype"] = "airborne";
	game["american_soldiervariation"] = "normal";
	game["german_soldiertype"] = "fallschirmjagergrey";
	game["german_soldiervariation"] = "normal";

	game["attackers"] = "allies";
	game["defenders"] = "axis";
	
	game["hud_allies_victory_image"] = "gfx/hud/hud@mp_victory_dragoon_beta2_us.dds";
      game["hud_axis_victory_image"] = "gfx/hud/hud@mp_victory_dragoon_beta2_g.dds";

	// FOR BUILDING PAK FILES ONLY
	if (getcvar("fs_copyfiles") == "1")
	{
		precacheShader(game["ctf_layoutimage"]);
		precacheShader(game["bas_layoutimage"]);
		precacheShader(game["layoutimage"]);
		precacheShader(game["hud_allies_victory_image"]);
		precacheShader(game["hud_axis_victory_image"]);
	}

	level thread maps\mp\_exploit_blocker::blockBox((950,1480,180), (2,55,65));
}

layout_images()
{

	game["bas_layoutimage"] = "mp_uo_dragoon_beta2_bas";
	game["ctf_layoutimage"] = "mp_uo_dragoon_beta2_ctf";
	game["layoutimage"] = "mp_uo_dragoon_beta2";
}
