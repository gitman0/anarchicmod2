main()
{
	setCullFog (0, 11000, .32, .36, .40, 0);
	ambientPlay("ambient_stanjel");	

	maps\mp\_load::main();
	maps\mp\mp_wesel::layout_images();
								
	level thread maps\mp\_tankdrive_gmi::main();
	level thread maps\mp\_jeepdrive_gmi::main();
	level thread maps\mp\_flak_gmi::main();
	thread env1();

	game["hud_allies_victory_image"] 	= "gfx/hud/hud@mp_victory_wesel_us.dds";
	game["hud_axis_victory_image"] 		= "gfx/hud/hud@mp_victory_wesel_g.dds";
	
	//	if(getCvar("scr_bas_basehealth") == "")		// healtg for each base
	//		setCvar("scr_bas_basehealth", "24500");	// 700 tank shell * 35
	//	if(getCvar("scr_bas_damagedhealth") == "")	// health to switch to damage model
	//		setCvar("scr_bas_damagedhealth", getCvarInt("scr_bas_basehealth")/2);

	game["bas_allies_rubble"] 	= "xmodel/mp_bunker_rhinevalley_rubble";
	game["bas_allies_complete"] 	= "xmodel/mp_bunker_rhinevalley";
	game["bas_allies_damaged"] 	= "xmodel/mp_bunker_rhinevalley_predmg";
	game["bas_allies_destroyed"] 	= "xmodel/mp_bunker_rhinevalley_dmg";
	game["bas_axis_rubble"] 	= "xmodel/mp_bunker_rhinevalley_rubble";
	game["bas_axis_complete"] 	= "xmodel/mp_bunker_rhinevalley";
	game["bas_axis_damaged"] 	= "xmodel/mp_bunker_rhinevalley_predmg";
	game["bas_axis_destroyed"] 	= "xmodel/mp_bunker_rhinevalley_dmg";
	//-------------------------------------------	

        maps\mp\_util_mp_gmi::base_swapper();

	game["allies"] = "american";
	game["axis"] = "german";

	game["attackers"] = "allies";
	game["defenders"] = "axis";
	
	game["american_soldiertype"] = "airborne";
	game["american_soldiervariation"] = "normal";
	game["german_soldiertype"] = "fallschirmjagercamo";
	game["german_soldiervariation"] = "normal";

	game["compass_range"] = 6124;

	// FOR BUILDING PAK FILES ONLY
	if (getcvar("fs_copyfiles") == "1")
	{
		precacheShader(game["bas_layoutimage"]);
		precacheShader(game["hud_allies_victory_image"]);
		precacheShader(game["hud_axis_victory_image"]);
}

	level._effect["smoke1"] = loadfx ("fx/smoke/chimneysmoke.efx");
	level._effect["smoke2"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke3"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke4"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke5"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke6"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke7"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke8"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke9"]= loadfx ("fx/atmosphere/snowgroundfog_n_down");
	level._effect["htsmoke"] = loadfx ("fx/smoke/largethick2.efx");
	level._effect["fire1"] = loadfx ("fx/map_mp/mp_fireplace_fire.efx");
	level._effect["htfire"] = loadfx ("fx/map_mp/mp_building_fire_big_2.efx");	
	level._effect["fog1"] = loadfx ("fx/atmosphere/snowgroundfog_n_down");
	level._effect["fog2"] = loadfx ("fx/atmosphere/snowgroundfog_n_down");
		
	maps\mp\_fx::loopfx("smoke1", (-7023, 6132, 440), 0.6);
	maps\mp\_fx::loopfx("smoke2", (-9652, 3424, 73), 0.6);
	maps\mp\_fx::loopfx("smoke3", (-13136, 8558, 85), 0.6);
	maps\mp\_fx::loopfx("smoke4", (-14074, 13426, 108), 0.6);
	maps\mp\_fx::loopfx("smoke5", (-5972, 11392, 24), 0.6);
	maps\mp\_fx::loopfx("smoke6", (-4212, 10112, 124), 0.6);
	maps\mp\_fx::loopfx("smoke7", (-1972, 10368, 277), 0.6);
	maps\mp\_fx::loopfx("smoke8", (-7216, 15612, -168), 0.6);
	maps\mp\_fx::loopfx("smoke9", (1985, 19638, -105), 0.6);
	maps\mp\_fx::loopfx("htsmoke", (-5888, 6919, 230), 0.6);
	maps\mp\_fx::loopfx("fire1", (-7007, 6174, 94), 0.6);
	maps\mp\_fx::loopfx("htfire", (-5888, 6919, 201), 0.6);
	maps\mp\_fx::loopfx("fog1", (-5932.0, 7004.0, 155.0), 0.5);
	maps\mp\_fx::loopfx("fog2", (-5724.0, 7004.0, 155.0), 0.5);

	}

env1()
{
	alert2 = getent ("htfires", "targetname");				
	alert2 playloopsound("htfires");

}

move_bases()
{
	base_movers = [];	
		
	entitytypes = getentarray();
	for(i = 0; i < entitytypes.size; i++)
	{
		if(isdefined(entitytypes[i].groupname))
		{
			if(entitytypes[i].groupname == "base_mover")
			{		
				entitytypes[i] moveto(entitytypes[i].origin+(0,0,256), 0.1,0,0);	
			}
	
		}
	}
}
layout_images()
{

	game["bas_layoutimage"] = "mp_wesel_bas";
	game["layoutimage"] = "mp_wesel";
}