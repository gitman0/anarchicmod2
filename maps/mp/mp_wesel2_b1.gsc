main()
{
	setCullFog (1000, 8000, 0.30, 0.31, 0.31, 0);
	ambientPlay("ambient_mp_foy");	

	maps\mp\_load::main();
	maps\mp\mp_wesel2_b1::layout_images();
									
	level thread maps\mp\_tankdrive_gmi::main();
	level thread maps\mp\_jeepdrive_gmi::main();
	level thread maps\mp\_flak_gmi::main();
	
	game["hud_allies_victory_image"] 	= "gfx/hud/hud@mp_victory_wesel2_b1_b.dds";
	game["hud_axis_victory_image"] 		= "gfx/hud/hud@mp_victory_wesel2_b1_g.dds";
	game["layoutimage"] = "mp_wesel2_b1";
	
	//	if(getCvar("scr_bas_basehealth") == "")		
	//		setCvar("scr_bas_basehealth", "24500");	
	//	if(getCvar("scr_bas_damagedhealth") == "")	
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

	game["allies"] = "british";
	game["axis"] = "german";

	game["attackers"] = "allies";
	game["defenders"] = "axis";
	
	game["british_soldiertype"] = "commando";
	game["british_soldiervariation"] = "normal";
	game["german_soldiertype"] = "waffen";
	game["german_soldiervariation"] = "normal";

	game["compass_range"] = 6124;

	if (getcvar("fs_copyfiles") == "1")
	{
		precacheShader(game["bas_layoutimage"]);
		precacheShader(game["hud_allies_victory_image"]);
		precacheShader(game["hud_axis_victory_image"]);
}

	level._effect["smoke1"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke2"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke3"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke4"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke5"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
	level._effect["smoke6"] = loadfx ("fx/smoke/cratersmoke_tame.efx");
					
	maps\mp\_fx::loopfx("smoke1", (5820, -2142, -53), 0.6);
	maps\mp\_fx::loopfx("smoke2", (4260, -618, -75), 0.6);
	maps\mp\_fx::loopfx("smoke3", (1055, 308, -51), 0.6);
	maps\mp\_fx::loopfx("smoke4", (5304, -3656, -24), 0.6);
	maps\mp\_fx::loopfx("smoke5", (2867, -7750, -35), 0.6);
	maps\mp\_fx::loopfx("smoke6", (2174, -7250, -72), 0.6);
			
	level thread windmills();
}

windmills()
{
	level.windmill1 = getent("windmill1","targetname");	
	if (isdefined(level.windmill1))
		level.windmill1 thread maps\mp\_windmill_gmi::windmill_spin();
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

	game["bas_layoutimage"] = "mp_wesel2_b1_bas";
	game["layoutimage"] = "mp_wesel2_b1";
}