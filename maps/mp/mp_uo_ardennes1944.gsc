main()
{
	setCullFog (0, 8500, .8, .8, .8, 0);
	ambientPlay("ambient_mp_hurtgen");

	maps\mp\_load::main();

	prepareVehicles();

        maps\mp\ardennes1944_fx::main();

	//	we set the different base models here for base assault
	//	note we COULD use different models for each team 

//	-------------------------------------------	
	//	BASE ASSAULT SETUP
	game["bas_allies_rubble"] 	= "xmodel/mp_bunker_foy_rubble";
	game["bas_allies_complete"] 	= "xmodel/mp_bunker_foy";
	game["bas_allies_damaged"] 	= "xmodel/mp_bunker_foy_predmg";
	game["bas_allies_destroyed"] 	= "xmodel/mp_bunker_foy_dmg";
	game["bas_axis_rubble"] 	= "xmodel/mp_bunker_foy_rubble";
	game["bas_axis_complete"] 	= "xmodel/mp_bunker_foy";
	game["bas_axis_damaged"] 	= "xmodel/mp_bunker_foy_predmg";
	game["bas_axis_destroyed"] 	= "xmodel/mp_bunker_foy_dmg";
//	-------------------------------------------	

        maps\mp\_util_mp_gmi::base_swapper();
    
        game["allies"] = "american";
	game["axis"] = "german";

        game["hud_allies_victory_image"] 	= "gfx/hud/hud@mp_victory_ardennes1944_us.dds";
        game["hud_axis_victory_image"] 		= "gfx/hud/hud@mp_victory_ardennes1944_g.dds";
	game["layoutimage"] = "mp_uo_ardennes1944";
	game["ctf_layoutimage"] = "mp_uo_ardennes1944_ctf";
        game["bas_layoutimage"] = "mp_uo_ardennes1944_bas";
        game["dom_layoutimage"] = "mp_uo_ardennes1944_dom";

	game["american_soldiertype"] = "airborne";
	game["american_soldiervariation"] = "winter";
	game["german_soldiertype"] = "wehrmacht";
	game["german_soldiervariation"] = "winter";

        game["compass_range"] = 6124; //How far the compass is zoomed in

        game["attackers"] = "axis";
        game["defenders"] = "allies";

	//Flag Setup
	//There must be a set of the following for each flag in your map.
	flag1 = getent("flag1","targetname");			// identifies the flag you're setting up
	flag1.script_timer = 8;					// how many seconds a capture takes with one player
	flag1.description = (&"The Northtown Farm");
	
       	flag2 = getent("flag2","targetname");
	flag2.script_timer = 12;
	flag2.description = (&"The Westtown");

        flag3 = getent("flag3","targetname");
	flag3.script_timer = 18;
	flag3.description = (&"The Eastern Farm");

        flag4 = getent("flag4","targetname");
	flag4.script_timer = 12;
	flag4.description = (&"The Valley");

        flag5 = getent("flag5","targetname");
	flag5.script_timer = 8;
	flag5.description = (&"The Crossings");

	startVehicles();

	level thread blockBox((6128, -5325, 46), (300,5,100));
	level thread blockBox((-5568, 9400, 133), (10,350,100));
	
}

prepareVehicles() {
	
	level thread maps\mp\_tankdrive_gmi::main();
	level thread maps\mp\_jeepdrive_gmi::main();
	level thread maps\mp\_treefall_gmi::main();
	level thread maps\mp\_jagd_winter_drive::init();
	level thread maps\mp\_pak40_::init();
	
}

startVehicles() {
	
	wait (2);
	level thread maps\mp\_jagd_winter_drive::main();
	level thread maps\mp\_pak40_::main();

}
blockBox(origin,size)
{
	blocker = spawn("script_origin", origin);
	blocker setbounds( ((0,0,0)-size), size );
	blocker setcontents(1);

	if(getcvar("g_exploit_debug") == "1")
	{
		x = size[0];
		y = size[1];
		z = size[2];
		for(;;)
		{
			line(origin + (0-x,  y,  z), origin + (  x,  y,  z), (1,0,0));
			line(origin + (0-x,  y,0-z), origin + (  x,  y,0-z), (1,0,0));
			line(origin + (0-x,  y,  z), origin + (0-x,  y,0-z), (1,0,0));
			line(origin + (  x,  y,  z), origin + (  x,  y,0-z), (1,0,0));

			line(origin + (0-x,0-y,  z), origin + (  x,0-y,  z), (0,1,0));
			line(origin + (0-x,0-y,0-z), origin + (  x,0-y,0-z), (0,1,0));
			line(origin + (0-x,0-y,  z), origin + (0-x,0-y,0-z), (0,1,0));
			line(origin + (  x,0-y,  z), origin + (  x,0-y,0-z), (0,1,0));

			line(origin + (0-x,  y,  z), origin + (0-x,0-y,  z), (0,0,1));
			line(origin + (  x,  y,  z), origin + (  x,0-y,  z), (0,0,1));
			line(origin + (0-x,  y,0-z), origin + (0-x,0-y,0-z), (0,0,1));
			line(origin + (  x,  y,0-z), origin + (  x,0-y,0-z), (0,0,1));

			line(origin + (0-x,0-y,  z), origin + (  x,  y,0-z), (1,0,1));
			line(origin + (0-x,  y,  z), origin + (  x,0-y,0-z), (1,0,1));
			line(origin + (  x,0-y,  z), origin + (0-x,  y,0-z), (1,0,1));
			line(origin + (  x,  y,  z), origin + (0-x,0-y,0-z), (1,0,1));

			wait .05;
		}
	}
}





