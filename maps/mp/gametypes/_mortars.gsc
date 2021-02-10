startMortars() {
	for(i = 0; i < level.awe_mortar; i++)
		thread incoming();
}

updateCvars()
{
	// turn on ambient mortars
	level.awe_mortar = cvardef("scr_awe_mortar", 0, 0, 10, "int");

	if (level.awe_mortar > 0) {
		// quake?
		level.awe_mortar_quake = cvardef("scr_awe_mortar_quake", 1, 0, 1, "int");
		// random?
		level.awe_mortar_random = cvardef("scr_awe_mortar_random", 0, 0, 1, "int");
		// make them safe for players
		level.awe_mortar_safety = cvardef("scr_awe_mortar_safety", 1, 0, 1, "int");
		// minimum delay between mortars
		level.awe_mortar_delay_min = cvardef("scr_awe_mortar_delay_min", 20, 5, 179, "int");
		// maximum delay between mortars
		level.awe_mortar_delay_max = cvardef("scr_awe_mortar_delay_max", 60, level.awe_mortar_delay_min+1, 180, "int");


		level.awe_mortarfx["generic"] = loadfx("fx/weapon/explosions/mortar_generic.efx");
		level.awe_mortarfx["brick"]	= loadfx("fx/weapon/explosions/artillery_brick.efx");
		level.awe_mortarfx["concrete"]= loadfx("fx/weapon/explosions/artillery_concrete.efx");
		level.awe_mortarfx["dirt"]	= loadfx("fx/weapon/explosions/artillery_dirt.efx");
		level.awe_mortarfx["grass"]	= loadfx("fx/weapon/explosions/artillery_grass.efx");
		level.awe_mortarfx["gravel"]	= loadfx("fx/weapon/explosions/artillery_gravel.efx");
		level.awe_mortarfx["metal"]	= loadfx("fx/weapon/explosions/artillery_metal.efx");
		level.awe_mortarfx["snow"]	= loadfx("fx/weapon/explosions/artillery_snow.efx");
		level.awe_mortarfx["water"]	= loadfx("fx/weapon/explosions/artillery_water.efx");
		level.awe_mortarfx["wood"]	= loadfx("fx/weapon/explosions/artillery_wood.efx");

		level.awe_mortarmodel = "xmodel/105";

		level.awe_mortars = [];
		level.awe_mortars[level.awe_mortars.size]["incoming"] = "mortar_incoming2";
		level.awe_mortars[level.awe_mortars.size-1]["delay"] = 0.65;
		level.awe_mortars[level.awe_mortars.size]["incoming"] = "mortar_incoming1";
		level.awe_mortars[level.awe_mortars.size-1]["delay"] = 1.05;
		level.awe_mortars[level.awe_mortars.size]["incoming"] = "mortar_incoming3";
		level.awe_mortars[level.awe_mortars.size-1]["delay"] = 1.5;
		level.awe_mortars[level.awe_mortars.size]["incoming"] = "mortar_incoming4";
		level.awe_mortars[level.awe_mortars.size-1]["delay"] = 2.1;
		level.awe_mortars[level.awe_mortars.size]["incoming"] = "mortar_incoming5";
		level.awe_mortars[level.awe_mortars.size-1]["delay"] = 3.0;
	}
}

incoming()
{
	level endon("awe_boot");

	if(level.bombers_altitude)
		maxz = level.bombers_altitude;
	else
		maxz = level.vMax[2];

	surfaces = [];
	surfaces[surfaces.size] = "brick";
	surfaces[surfaces.size] = "concrete";
	surfaces[surfaces.size] = "dirt";
	surfaces[surfaces.size] = "generic";
	surfaces[surfaces.size] = "grass";
	surfaces[surfaces.size] = "gravel";
	surfaces[surfaces.size] = "metal";
	surfaces[surfaces.size] = "wood";

	mortar = spawn("script_model", (0,0,0));
	mortar setModel(level.awe_mortarmodel);
	mortar hide();

	for(;;)
	{
		range = (int)(level.awe_mortar_delay_max - level.awe_mortar_delay_min);
		delay = randomInt(range);
		delay = delay + level.awe_mortar_delay_min;
		wait delay;

		distance = -1;
		// if the safety is on for mortars, make sure they don't hit a player
		range = 1000000;
		while(distance < level.awe_mortar_safety * range * 2)
		{
			// Get a random mortar incoming sound
			m = randomInt(level.awe_mortars.size);

			// Random strength
			pc = randomInt(100);

			// Get it's damage range
			range = 200 + pc*360/100;

			// Get players
			allplayers = getentarray("player", "classname");
			players = [];
			for(i=0;i<allplayers.size;i++)
				if(allplayers[i].sessionstate == "playing")
					players[players.size] = allplayers[i];
	
			if(!level.awe_mortar_random && players.size)
			{
				// Get a random player
				p = randomInt(players.size);
				// Get a random angle			
				angle = (0,randomInt(360),0);
				// Convert to vector
				vector = anglesToForward(angle);
				// Scale vector differently depending on safety
				variance = maps\mp\_utility::vectorScale(vector, range*level.awe_mortar_safety*2 + randomInt(range*3) );
				// Set mortar origin;
				endorigin = players[p].origin + variance;
			}
			else
			{
				x = level.vMin[0] + randomInt(level.vMax[0]-level.vMin[0]);
				y = level.vMin[1] + randomInt(level.vMax[1]-level.vMin[1]);
				trace = bulletTrace((x,y,maxz),(x,y,level.vMin[2]), false, undefined);
				if(trace["fraction"] != 1)
					z = trace["position"][2];
				else
					z = level.vMin[2];
				endorigin = (x,y,z);
			}

			// Check if any other player is within range
			if(level.awe_mortar_safety && players.size)
			{
				bplayers = sortByDist(players, mortar);
				distance = distance(endorigin, bplayers[0].origin);
			}
			else
				break;

			wait 0.2;  // in case it has to loop a lot because of safety
		}

		// find the impact point
		trace = bulletTrace((endorigin[0],endorigin[1],maxz),(endorigin[0],endorigin[1],level.vMin[2]), false, undefined);
		surface = trace["surfacetype"];
		if(trace["fraction"] != 1)
			endorigin = trace["position"];

		// Start point for mortar
		startpoint = ( (endorigin[0] - 200 + randomInt(400)) , (endorigin[1] - 200 + randomInt(400)) ,maxz);

		mortar.origin = startpoint;

		wait .05;

		// play the incoming sound
		mortar playsound(level.awe_mortars[m]["incoming"]);

		// Make closest player yell warning
		if(isdefined(level.awe_teamplay) && !level.awe_mortar_safety)
		{
			allplayers = getentarray("player", "classname");
			players = [];
			for(i=0;i<allplayers.size;i++)
				if(allplayers[i].sessionstate == "playing")
					players[players.size] = allplayers[i];
			if(players.size)
			{
				bplayers = sortByDist(players, mortar);
				distance = distance(mortar.origin, bplayers[0].origin);
			}
		}

		falltime = .5;

		// wait for it to hit
		wait level.awe_mortars[m]["delay"] - 0.05 - falltime;

		// Show visible mortar object
		mortar.angles = vectortoangles(vectornormalize(mortar.origin - startpoint)) + (90,0,0);
		mortar show();
		wait .05;

		// Move visible mortar
		mortar moveto(endorigin, falltime);

		// wait for it to hit
		wait falltime;

		// play the visual effect
		if(isdefined(level.awe_mortarfx[surface]))
		{
			playfx(level.awe_mortarfx[surface], endorigin);
		}
		else
		{
			if(isdefined(level.awe_wintermap))
				playfx(level.awe_mortarfx["snow"], endorigin);
			else
				playfx(level.awe_mortarfx[surfaces[randomInt(surfaces.size)]], endorigin);
		}
		if (surface == "none")
			surface = "default";

		// play the hit sound
		mortar playsound("mortar_explode_" + surface);

		//iprintln("mortar hit on surfacetype: " + surface);

		// Hide visible mortar
		mortar hide();

		// just to be extra safe, since a player MIGHT move in range during the "incoming" sound
		if(!level.awe_mortar_safety)
		{
			// do the damage
			max = 200 + 200*pc/100;
			min = 10;
			radiusDamage(endorigin + (0,0,12), range, max, min);
		}

		if(level.awe_mortar_quake)
		{
			// rock their world
			strength = 0.5 + 0.5 * pc /100;
			length = 1 + 3*pc/100;;
			range = 600 + 600*pc/100;
			earthquake(strength, length, endorigin, range); 
		}
	}
}

cvardef(varname, vardefault, min, max, type)
{
	mapname = getcvar("mapname");  // "mp_dawnville", "mp_rocket", etc.

	if(getcvar(varname) == "") // if the cvar is blank
		setcvar(varname, vardefault); // set the default

	mapvar = varname + "_" + mapname; // i.e., scr_teambalance becomes scr_teambalance_mp_dawnville
	if(getcvar(mapvar) != "") // if the map override is being used
		varname = mapvar; // use the map override instead of the standard variable

	// get the variable's definition
	switch(type)
	{
		case "int":
			definition = getcvarint(varname);
			break;
		case "float":
			definition = getcvarfloat(varname);
			break;
		case "string":
		default:
			definition = getcvar(varname);
			break;
	}

	// if it's a number, with a minimum, that violates the parameter
	if((type == "int" || type == "float") && min != "" && definition < min)
		definition = min;

	// if it's a number, with a maximum, that violates the parameter
	if((type == "int" || type == "float") && max != "" && definition > max)
		definition = max;

	return definition;
}

sortByDist(points, startpoint, maxdist, mindist)
{
	if(!isdefined(points))
		return undefined;
	if(!isdefineD(startpoint))
		return undefined;

	if(!isdefined(mindist))
		mindist = -1000000;
	if(!isdefined(maxdist))
		maxdist = 1000000; // almost 16 miles, should cover everything.

	sortedpoints = [];

	max = points.size-1;
	for(i = 0; i < max; i++)
	{
		nextdist = 1000000;
		next = undefined;

		for(j = 0; j < points.size; j++)
		{
			if (isdefined(points[j].origin)) {
				thisdist = distance(startpoint.origin, points[j].origin);
				if(thisdist <= nextdist && thisdist <= maxdist && thisdist >= mindist)
				{
					next = j;
					nextdist = thisdist;
				}
			}
		}

		if(!isdefined(next))
			break; // didn't find one that fit the range, stop trying

		sortedpoints[i] = points[next];

		// shorten the list, fewer compares
		points[next] = points[points.size-1]; // replace the closest point with the end of the list
		points[points.size-1] = undefined; // cut off the end of the list
	}

	sortedpoints[sortedpoints.size] = points[0]; // the last point in the list

	return sortedpoints;
}
spawn_model(model,name,origin,angles)
{
	if (!isdefined(model) || !isdefined(name) || !isdefined(origin))
		return undefined;

	if (!isdefined(angles))
		angles = (0,0,0);

	spawn = spawn ("script_model",(0,0,0));
	spawn.origin = origin;
	spawn setmodel (model);
	spawn.targetname = name;
	spawn.angles = angles;

	return spawn;
}