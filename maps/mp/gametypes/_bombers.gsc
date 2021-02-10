updateCvars() {
	level.bombers = cvardef("scr_awe_bombers", 1, 0, 1, "int");
	level.bombers_delay = cvardef("scr_awe_bombers_delay", 300, 1, 1440, "int");

	level.bombers_altitude = cvardef("scr_awe_bombers_altitude", 0, 0, 10000, "int");
	level.bombers_distance = cvardef("scr_awe_bombers_distance", 0, -25000, 25000, "int");
	if (level.bombers == 1)
		level._effect["bombers"] = loadfx ("fx/atmosphere/c47flyover2d.efx");
}

Callback_StartGameType() {
      if(level.bombers) {
		iX = (int)(level.vMax[0] + level.vMin[0])/2;
	
		if(level.bombers_distance)
			iY = level.bombers_distance;
		else
			iY = level.vMin[1];	
	
		if(level.bombers_altitude)
			iZ = level.bombers_altitude;
		else
			iZ = level.vMax[2];	

		//iprintln("starting bombers! alt: " + iZ );

		// Loop effect
		maps\mp\_fx::loopfx("bombers", (iX - 500, iY, iZ), level.bombers_delay);
		maps\mp\_fx::loopfx("bombers", (iX + 500, iY, iZ), level.bombers_delay + 10);

		//thread modelC47();

/*		maps\mp\_fx::loopfx("bombers", (level.bombers_position - 500, level.bombers_distance, level.bombers_altitude), level.bombers_delay);
		maps\mp\_fx::loopfx("bombers", (level.bombers_position + 500, level.bombers_distance, level.bombers_altitude), level.bombers_delay+10);
		// this needs to be uncommented once c47drone alias is fixed
		//thread C47sounds( (level.bombers_position - 500, level.bombers_distance, level.bombers_altitude), level.bombers_delay);
*/
      }

}


modelC47() {
	wait 15;
	iX = (int)(level.vMax[0] + level.vMin[0])/2;

	//x0 = spawn_model("xmodel/c47", "c47", (iX, level.vMin[1], level.vMax[2]), (0, 90, 0));
	//snd = spawn_model("xmodel/mp_bomb1", "snd", (iX, level.vMin[1]+500, level.vMax[2]), (0, 90, 0));

	x0 = spawn("script_model", (iX, level.vMin[1], level.vMax[2]));
	x0.angles = (0, 90, 0);
	x0 hide();
	x0 setModel("xmodel/c47");
	x0.targetname = "c47";
	wait 0.5;
	x0_snd = spawn("script_model", x0.origin + (0, 800, -200));
	wait 0.5;
	x0 thread moveC47();
	x0_snd thread moveSnd();
	//snd playsound("ge_victory");
	//snd playSoundinSpace("ge_victory", snd.origin);

	
	//x0_snd moveSnd();

	//x1 = spawn_model("xmodel/c47", "c47", (iX - randomintrange(5000, 6000), level.vMin[1] + randomint(1000), level.vMax[2]), (0, 90, 0));
	//x1 thread moveC47();

	//x2 = spawn_model("xmodel/c47", "c47", (iX + randomintrange(1000, 2000), level.vMin[1] + randomint(1000), level.vMax[2] - randomint(600)), (0, 90, 0));
	//x2 thread moveC47();

	//x3 = spawn_model("xmodel/c47", "c47", (iX - randomintrange(1600, 2600), level.vMin[1] + randomint(1000), level.vMax[2] - randomint(700)), (0, 90, 0));
	//x3 thread moveC47();

	//x4 = spawn_model("xmodel/c47", "c47", (iX + randomintrange(3500, 4500), level.vMin[1] + randomint(1000), level.vMax[2] - randomint(500)), (0, 90, 0));
	//x4 thread moveC47();

	//x5 = spawn_model("xmodel/c47", "c47", (iX - randomintrange(3000, 4000), level.vMin[1] + randomint(1000), level.vMax[2] - randomint(300)), (0, 90, 0));

}

moveC47() {
	wait 2;
	self show();
	startpos = self.origin;
	endpos = self.origin + (0, level.vMax[1]*5, 0);

	s = distance(startpos, endpos);
	v = 2000;
	t = s / v;

	self moveto(endpos, t);
}
moveSnd() {
	wait 0.5;
	startpos = self.origin;
	endpos = self.origin + (0, level.vMax[1]*5, 0);

	self setcontents(0);

	s = distance(startpos, endpos);
	v = 1500; //move slower?
	t = s / v;

	self playsound("c47flyby");
	wait 2;
	self moveto(endpos, t);
}

doline() {
	self endon("death");
	while(1)
	{
		line(self.origin, (self.origin + (0, level.vMax[1]*5, 0)));
		wait 0.05;
	}
}

C47sounds(startpos, delay)
{
	for(;;)
	{
		wait delay;
		thread C47sound(startpos, delay);
	}
}

C47sound(startpos, delay)
{
	// start sound behind the effect
	startpos = startpos - (0,500,0);
	sndobject = spawn("script_model",startpos);
	wait 0.05;

	// Move the sound object a bit longer to get better fading of sound
	s = level.vMax[1] - startpos[1] + 1000;
	v = 150;

	t = s / v;

	// play sound
	sndobject playloopsound("c47drone");

	// move object
	sndobject moveto( startpos + (0,s,0) , t);
	wait t;
	sndobject stoploopsound();
	sndobject delete();
}
playSoundinSpace (alias, origin)
{
	org = spawn ("script_origin",(0,0,1));
	org.origin = origin;
	org playsound (alias, "sounddone");
	org waittill ("sounddone");
	org delete();
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