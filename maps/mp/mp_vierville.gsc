/*mp_vierville designed by Stephen Kielinen.  aka *M.M.S.* Wyatt Earp */

main()
{	//Start main thread

	setCullFog (0, 7300, .40, .40, .40, 0);
	ambientPlay("ambient_mp_brecourt");
	
	//Load main function for Call of Duty
	maps\mp\_load::main();							//Loading Main function
	maps\mp\mp_vierville_fx::main();					//Loading _fx function
						//Sound gsc
							//Mortar damage
								//Targeting array
	
	

	

	//Loading Special effects
		
	//FIRE Area 
	level._effect["fire"] = loadfx ("fx/fire/tinybon.efx");
	maps\mp\_fx::loopfx("fire", (-4767, -5282, 90), 0.6); //Church Tiger
	//*********************************************************************	
	
	//SMOKE Area 
	level._effect["smoke"] = loadfx ("fx/smoke/ash_smoke.efx");
	maps\mp\_fx::loopfx("smoke", (3952, -1119, 40), 0.7); //Center Tiger
        maps\mp\_fx::loopfx("smoke", (582, -1119, 94), 0.7); // North Tiger
        maps\mp\_fx::loopfx("smoke", (2494, 434, 94), 0.7); //West Tiger 1
        maps\mp\_fx::loopfx("smoke", (2688, 582, 94), 0.7); //West Tiger 2
        maps\mp\_fx::loopfx("smoke", (-4767, -5282, 90), 0.7); //Church Tiger
        
        
        
        //Bomber area
        // Bomber
	maps\mp\_fx::loopfx("bombers", (-2017, -8501, 2600), 60);
	
	//*********************************************************************

						
		
	
	//Set sides for teams	
	game["allies"] = "american";
	game["axis"] = "german";

	// Set uniforms for teams
	game["american_soldiertype"] = "airborne";
	game["american_soldiervariation"] = "normal";
	game["german_soldiertype"] = "fallschirmjagergrey";
	game["german_soldiervariation"] = "normal";

	//Set Search and destroy sides
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	
	//Layout picture
	game["layoutimage"] = "mp_vierville";
	
	//*********************************************************************
	//Retreival settings
	//Using Codebook for the Artillery Map
	
	level.obj["1"] = (&"RE_OBJ_CODE_BOOK");					//script_game_objective 
	game["re_attackers"] = "allies";
	game["re_defenders"] = "axis";
	//Using default text from Call of Duty
	game["re_attackers_obj_text"] = "Capture the code book, eliminate all resistance.";
	game["re_defenders_obj_text"] = "Defend the code book at all cost.";
	game["re_spectator_obj_text"] = "Allies: Must capture the code book";
	game["re_attackers_intro_text"] = "Capture the book, so we can\n decipher the coded\n Artillery list.";
	game["re_defenders_intro_text"] = "Defend the code book containing the coded list of Artillery emplacements.";
	
	//************************************************************************


	// block exploits (bell, bystander) updated for vierville by gitman
	level thread blockBox((-1030,-3871,132), (30,5,80));

	
}  	//End of main

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