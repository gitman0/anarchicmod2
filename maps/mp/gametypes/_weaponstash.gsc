main() {
	updatecvars();

	level.weapon_loop_delay = 120;

	if (level.anarchic_mg42 == 1) 
		thread carentan_mg42();

	if ((level.anarchic_fg42 == 1) && (level.allow_fg42 == 1))
		thread weapon_loop("fg42", 20);

	thread weapon_loop("bazooka", 1);
	thread weapon_loop("springfield", 30);
	thread weapon_loop("kar98k_scoped", 30);
	thread weapon_loop("mp44", 30);
	thread weapon_loop("mosinnagantsniper", 30);

	//thread count_entities();

	if (getcvar("scr_rifles_only") == 1)
		deletePlacedEntity("misc_mg42");

	if (level.mapname == "mp_bocage" || level.mapname == "mp_chateau")
		deleteByInfo("misc_mg42", "mg42_bipod_prone_mp"); // thank you patch 1.51
}
deleteByInfo(entity, info) {
	entities = getentarray(entity, "classname");
	for(i = 0; i < entities.size; i++) {
		if (entities[i].weaponinfo == info)
			entities[i] delete();
	}
}
updatecvars() {
	precacheModel("xmodel/mg42_bipod");
	precacheTurret("mg42_bipod_duck_mp");
	precacheTurret("mg42_bipod_prone_mp");
	precacheTurret("mg42_bipod_stand_mp");

	level.anarchic_fg42	= cvardef("scr_anarchic_fg42", 1, 0, 1, "int");
	level.anarchic_mg42	= cvardef("scr_anarchic_mg42", 1, 0, 1, "int");
	level.weapon_loop_delay = cvardef("scr_anarchic_weapon_delay", 15, 0, 999, "int");
	
	if (level.anarchic_fg42 == 1)
		precacheItem("fg42_mp");
}
count_entities()
{
	while (1) {
	
		totalEntities = getentarray();
		iprintln ("Total entities = " + totalEntities.size);
	
		wait 15;
	}

}
findGround(position, adj) {
	trace = bulletTrace(position + (0, 0, 10), position + (0, 0, -1200), false, undefined);
	ground = trace["position"];
	if (isdefined(adj))
		ground = ground + adj;
	return ground;
}

carentan_mg42() {
	map = getcvar("mapname");
	adj = (0, 0, -2);
	switch (map) {
		case "mp_carentan":
			//pos = (505, 1091, 191);
			pos = (728, 1094, 185);
			ang = (0, -90, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			pos = (1094, 2846, 52);
			pos = findground(pos, adj);
			ang = (0, -135, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_harbor":
			pos = (-8854, -8750, 233);
			ang = (0, 180, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_dawnville":
		case "mp_uo_dawnville":
			pos = (2292, -15658, -23);
			ang = (0, 120, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			pos = (-1220, -16718, 63);
			ang = (0, 15, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_pavlov":
			pos = (-9637, 9146, 41);
			ang = (0, 90, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			pos = (-10568, 11009, 38);
			ang = (0, 0, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_railyard":
			pos = (-2345, 1510, 34);
			ang = (0, 30, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_rocket":
			pos = (10438, 2184, 325);
			ang = (0, 90, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_brecourt":
			pos = (-227, -2500, 69);
			ang = (0, 90, 0);
			w = "mg42_bipod_prone_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_chateau":
			pos = (-824, 2083, 152);
			pos = findground(pos, adj);
			ang = (0, -57, 0);
			w = "mg42_bipod_prone_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_powcamp":
			pos = (-1070, 3734, 346);
			pos = findground(pos, adj);
			ang = (0, 0, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			pos = (1728,5185,322);
			pos = findground(pos, adj);
			ang = (0, -90, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_foy":
			pos = (-1460, -2713, 208);
			pos = findground(pos, adj);
			ang = (0, 0, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_uo_adlerstein":
			pos = (-2376, 2551, 979);
			pos = findground(pos, adj);
			ang = (0, -30, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			pos = findground((2038, 2344, 856), adj);
			ang = (0, 173, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_vierville":
			pos = findground((1351,-4237,50), adj);
			ang = (0, 135, 0);
			w = "mg42_bipod_duck_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_offensive":
			pos = findground((1124,2688,52), adj);
			ang = (0, -90, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_nuenen":
			pos = findground((-17, 393, 72), adj);
			ang = (0, -90, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_maaloy":
			pos = findground((2987,1540,-591), adj);
			ang = (0, -90, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_bonneville":
			pos = findground((188, 1952, 238), adj);
			ang = (0, 0, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_uo_redoktober":
			pos = findground((5392, -193, 25), adj);
			ang = (0, -180, 0);
			w = "mg42_bipod_stand_mp";
			spawn_mg42(pos, ang, w);
			break;
		case "mp_uo_townassault":
			spawn_mg42(findground((-1465, 14433, 311), adj), (0, -90, 0), "mg42_bipod_duck_mp");
			spawn_mg42(findground((-2259, 16981, 322), adj), (0, -90, 0), "mg42_bipod_stand_mp");
			spawn_mg42(findground((-4676, 13797, 285), adj), (0, -40, 0), "mg42_bipod_duck_mp");
			spawn_mg42(findground((-2484, 5628, 214), adj), (0, 90, 0), "mg42_bipod_stand_mp");
			break;
		case "mp_uo_vitebsk_beta1":
		case "mp_uo_vitebsk":
		case "mp_uo_vitebsk_final":
			//spawn_sg43(findground((-5581, -3330, 228), adj), (0, 76, 0), "mg_sg43_stand_mp");
			spawn_sg43(findground((-5893, 293, 63), adj), (0, 85, 0), "mg_sg43_stand_mp");
			spawn_mg42(findground((669, 10994, 160), adj), (0, -90, 0), "mg42_bipod_duck_mp");
			break;
	}
	
}
spawn_mg42(pos, ang, w, toparc, bottomarc, leftarc, rightarc) {
	if ( isdefined(pos) && isdefined(ang) && isdefined(w) ) {
		mg42 = spawnTurret("misc_mg42", pos, w);
		mg42 setmodel("xmodel/mg42_bipod");
		mg42.angles = ang;
		mg42.origin = pos;
		mg42.weaponinfo = w;
		mg42.export = 3;
		//mg42.harc = 12;
		if (isdefined(toparc))
			mg42.toparc = toparc;
		if (isdefined(bottomarc))
			mg42.bottomarc = bottomarc;
		if (isdefined(leftarc))
			mg42.leftarc = leftarc;
		if (isdefined(rightarc))
			mg42.rightarc = rightarc;
		mg42 show();
	}
}
spawn_sg43(pos, ang, w) {
	if ( isdefined(pos) && isdefined(ang) && isdefined(w) ) {
		mg42 = spawnTurret("misc_turret", pos, w);
		mg42 setmodel("xmodel/w_ru_lmg_sg43_bipod_noshield");
		mg42.angles = ang;
		mg42.origin = pos;
		mg42.weaponinfo = w;
		mg42.export = 3;
		//mg42.harc = 12;
		mg42 show();
	}
}


weaponPos(map, weapon) {
	x = [];
	switch(weapon) {
		case "fg42":
			switch(level.mapname) {
				case "mp_brecourt":
					x[x.size] = (62, -1757, 66);
					x[x.size] = (0, 90, 90);
					break;
				case "mp_carentan":
					x[x.size] = (599, 1387, 7);
					x[x.size] = (0, 90, 90);
					break;
				case "mp_dawnville":
				case "mp_uo_dawnville":
					x[x.size] = (-2161, -16184, -21);
					x[x.size] = (0, 90, 90);
					break;	
				case "mp_chateau":
					x[x.size] = (1549, 664, 202);
					x[x.size] = (0, 115, 90);
					break;
			}
			if (map == "mp_depot") {
				x[x.size] = (-2017, 265, 157);
				x[x.size] = (0, 96, 90);
			}
			if (map == "mp_harbor") {
				x[0] = (-9347, -7168, 176);
				x[1] = (0, 42, 90);
			}
			if (map == "mp_hurtgen") {
				x[0] = (447, -2352, -54);
				x[1] = (0, 90, 90);
			}
			if (map == "mp_pavlov") {
				x[0] = (-10406, 8704, -17);
				x[1] = (0, 0, 90);
			}
			if (map == "mp_powcamp") {
				x[0] = (-563, 2045, 155);
				x[1] = (0, 77, 90);
			}
			if (map == "mp_railyard") {
				x[0] = (-1038, 3290, -40);
				x[1] = (0, 180, 90);
			}
			if (map == "mp_rocket") {
				x[0] = (10716, 4440, 419);
				x[1] = (0, 92, 90);
			}
			if (map == "mp_foy") {
				x[x.size] = (-4899, -7832, 407);
				x[x.size] = (0, 0, 90);
				x[x.size] = (1086, -1710, 27);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-2101, -126, 11);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-1769, 6696, 171);
				x[x.size] = (0, 0, 90);
				x[x.size] = (2471, -1519, 83);
				x[x.size] = (0, 0, 90);
			}
			if (map == "mp_italy") {
				x[x.size] = (-748, -8991, -47);
				x[x.size] = (0, 0, 90);
				x[x.size] = (7769, -494, -880);
				x[x.size] = (0, 0, 90);
				x[x.size] = (902, -49, -55);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-3717, -142, 492);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-4044, 5829, -192);
				x[x.size] = (0, 0, 90);
			}
			if (map == "mp_kursk") {
				x[x.size] = (2830, -15378, 107);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-625, -7370, 1190);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-3437, -10285, 1001);
				x[x.size] = (0, 0, 90);
				x[x.size] = (3492, -7889, 708);
				x[x.size] = (0, 0, 90);
				x[x.size] = (2179, -1737, 539);
				x[x.size] = (0, 0, 90);
			}
			if (map == "mp_rhinevalley") {
				x[x.size] = (2018, -16662, 1225);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-7576, -7601, 1171);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-6378, -4252, 1827);
				x[x.size] = (0, 0, 90);
				x[x.size] = (7303, -8398, 2824);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-487, -6580, 3787);
				x[x.size] = (0, 0, 90);
				x[x.size] = (-413, 3202, 1023);
				x[x.size] = (0, 0, 90);
			}
			if (map == "mp_ponyri") {
				x[0] = (4148, 1917, -52);
				x[1] = (0, 0, 90);
				x[2] = (8292, -5007, 351);
				x[3] = (0, 0, 90);
				x[4] = (3415, -4723, 667);
				x[5] = (0, 0, 90);
				x[6] = (637, -5100, -101);
				x[7] = (0, 0, 90);
				x[8] = (3428, -10583, 284);
				x[9] = (0, 0, 90);
			}
			if (map == "mp_uo_vitebsk_beta1" || map == "mp_uo_vitebsk_final" || map == "mp_uo_vitebsk") {
				x[x.size] = (-1411, 16160, -42);
				x[x.size] = (0, 0, 0);
				x[x.size] = (-3189, 2037, 183);
				x[x.size] = (0, 0, -180);
				x[x.size] = (-3971, 6316, 115);
				x[x.size] = (0, 0, -180);
				x[x.size] = (248, -11257, 125);
				x[x.size] = (0, 0, 0);

			/*	x[0] = (-2294, 5171, 94);
				x[1] = (0, 0, -180);
				x[2] = (-1518, -2216, 366);
				x[3] = (0, 0, -90);
				x[4] = (-2927, 9717, 282);
				x[5] = (0,0,0);
				x[6] = (-1079, 517, 56);
				x[7] = (0, 0, 180);
				x[8] = (-523, -12255, 172);
				x[9] = (0, 0, 173);		*/
			}
			if (map == "mp_uo_ardennes1944" || map == "ax_ardennes") {
				x[x.size] = (-4423, -9092, 11);
				x[x.size] = (0,0,0);
				x[x.size] = (-12616, -3779, 51);
				x[x.size] = (0,-144,0);
				x[x.size] = (-14408, 5543, 91);
				x[x.size] = (0,-91,0);
				x[x.size] = (7470, -7766, -52);
				x[x.size] = (0,-146,0);
				x[x.size] = (7422, -1536, 3);
				x[x.size] = (0,-86,0);
				
/*				x[0] = (-10263,3112,78); //allied 2
				x[1] = (0,0,0);
				x[2] = (-3506,-3332,32); //axis 1 (bush)
				x[3] = (0,0,0);
				x[4] = (-15331, -162, 44); //allied 3
				x[5] = (0,0,90);
				x[6] = (-11645,-5171,88); //westtown+northfarm
				x[7] = (0,0,90);
				x[8] = (-4126,10075,47); //allied 1
				x[9] = (0,0,-39);
				x[10] = (1697,-3062,70); //axis 3
				x[11] = (0,0,180);
				x[12] = (3184,-6866,111); //axis 2
				x[13] = (0,0,-46);

*/				
			}
			break;
		case "bazooka":
			/*if (map == "mp_foy") {
				x[0] = (1965, -3106, 217);
				x[1] = (0, -45, 0);
			}*/
			if (map == "mp_italy") {
				x[0] = (914, 290, 144);
				x[1] = (0, -90, 0);
				x[2] = (1233, 2343, 99);
				x[3] = (0, 0, 0);
			}

			break;
		case "springfield":
			/*switch(level.mapname) {
				case "mp_foy":
					x[0] = (-4752, -6540, 299);
					x[1] = (0, 90, 90);
					break;
			}*/
			break;
		case "kar98k_scoped":
			switch(level.mapname) {
				/*case "mp_foy":
					x[0] = (-542, 7322, 68);
					x[1] = (0, -90, 90);
					break;*/
				case "mp_uo_vitebsk_beta1":
				case "mp_uo_vitebsk_final":
					x[0] = (1277, 7552, 98);
					x[1] = (0, 0, 90);
					break;
			}
			break;
		case "mp44":
			switch(level.mapname) {
				case "mp_uo_vitebsk_beta1":
				case "mp_uo_vitebsk_final":
					x[0] = (-1518, -2157, 366);
					x[1] = (0,0,90);
					break;
			}
			break;
		case "mosinnagantsniper":
			switch(level.mapname) {
				case "mp_uo_vitebsk_beta1":
				case "mp_uo_vitebsk_final":
					x[x.size] = (2469, 1817,-171);
					x[x.size] = (0,0,0);
					break;
			}
			break;

		default:
			x = 0;
	}
	return x;
}
weapon_loop(weapon, ammo) {
	adj = (0, 0, 1);
	map = getCvar("mapname");
	posArray = weaponPos(map, weapon);
	weapcname = "mpweapon_" + weapon;
	if (isdefined(posArray)) {
		for (i = 0; i < posArray.size; i++) {
			pos = findground(posArray[i], adj);
			ang = posArray[i+1];

			level thread weaploop_thread(weapcname, weapon, pos, ang, ammo);
			i++;
		}
	}
}
// do somethin here with bullettrace()
weaploop_thread(weapon, target, pos, ang, ammo) {
	while (1) {
		x = spawn_weapon(weapon, target, pos, ang, ammo);
		wait level.weapon_loop_delay;
		x delete();
	}
}

spawn_weapon_stash(weapon, num, ammo) {
	map = getCvar("mapname");
	posArray = weaponPos(map, weapon);
	weapcname = "mpweapon_" + weapon;
	if (isdefined(posArray)) {
		for (i = 0; i < posArray.size; i++) {
			pos = posArray[i];
			ang = posArray[i+1];

			for (t = 0; t < num; t++) {
				tmp = spawn_weapon(weapcname, weapon, pos, ang, ammo);
			}
			i++;
		}
	}
}

spawn_weapon(classname,targetname,origin,angles,ammo) { 
	if (!isdefined(classname) || !isdefined(targetname) || !isdefined(origin))
	return undefined;

	if (!isdefined(angles)) angles = (0,0,0);
	if (!isdefined(ammo)) ammo = 100;

	weapon            = spawn (classname,origin);
	weapon.targetname = targetname;
	weapon.angles     = angles;
	weapon.count      = ammo;

	return weapon;
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
deletePlacedEntity(entity)
{
	entities = getentarray(entity, "classname");
	for(i = 0; i < entities.size; i++)
	{
		//println("DELETED: ", entities[i].classname);
		entities[i] delete();
	}
}
