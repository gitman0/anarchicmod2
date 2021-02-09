main()
{
	maps\mp\_load::main();
	maps\mp\dday7_fx::main();

	setCullFog (0, 9000, .32, .36, .40, 0);
	ambientPlay("ambient_mp_brecourt");

	level._effect["smoke"] = loadfx ("fx/smoke/neuville_smoke1.efx");
	maps\mp\_fx::loopfx("smoke", (1708, 1208, 188), 0.7);

	game["allies"] = "american";
	game["axis"] = "german";

	game["american_soldiertype"] = "airborne";
	game["american_soldiervariation"] = "normal";
	game["german_soldiertype"] = "fallschirmjagercamo";
	game["german_soldiervariation"] = "normal";

	game["attackers"] = "allies";
	game["defenders"] = "axis";

	//game["layoutimage"] = "D-Day+7";

	if (getcvar("g_gametype") == "hq") {

		//spawn radio 1
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (3200, -300, 176);
		radio.angles = (0, 225, 0);
		radio.targetname = "hqradio";

		//spawn radio 2
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (3768, 220, 74);
		radio.angles = (0, 225, 0);
		radio.targetname = "hqradio";

		//spawn radio 3
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (4270, 3048, 16);
		radio.angles = (0, 270, 0);
		radio.targetname = "hqradio";

		//spawn radio 4
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (3616, 4300, 192);
		radio.angles = (0, 0, 0);
		radio.targetname = "hqradio";

		//spawn radio 5
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (-870, 3302, 100);
		radio.angles = (0, 180, 0);
		radio.targetname = "hqradio";

		//spawn radio 6
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (-936, 0, 46);
		radio.angles = (0, 0, 0);
		radio.targetname = "hqradio";
	}

	level thread blockBox((2200,-530,74), (300,10,180));

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