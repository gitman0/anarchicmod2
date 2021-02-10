/* Destructible Flak88 mod by |ax|gitman (http://www.anarchic-x.net) */

#using_animtree("flak88");
main()
{
	initArtilleryCvars();
	restrictPlacedArtillery();

	precacheShader( "gfx/hud/tank_reticle25.dds");
	precacheShader( "gfx/hud/tank_reticle50.dds");
	precacheShader( "gfx/hud/tank_reticle75.dds");
	precacheShader( "gfx/hud/tank_reticle100.dds");

	script_vehicles = getentarray ("script_vehicle","classname");
	for (i=0;i<script_vehicles.size;i++)
	{
		if(script_vehicles[i].vehicletype == "Flak88_MP" || script_vehicles[i].vehicletype == "flak88_mp")
		{
			precacheshader("gfx/hud/hud@fire_ready_shell.tga");
			precachevehicle("Flak88_MP");
			if ((script_vehicles[i].model == "xmodel/turret_flak88"))
			{
				precachemodel ("xmodel/turret_flak88_d");
				script_vehicles[i].dead_model = ("xmodel/turret_flak88_d");
			}
			else if ((script_vehicles[i].model == "xmodel/mp_artillery_flak88") || (script_vehicles[i].model == "xmodel/mp_artillery_flak88_snow"))
			{
				precachemodel ("xmodel/mp_artillery_flak88_d");
				script_vehicles[i].dead_model = ("xmodel/mp_artillery_flak88_d");
			}
			else
			{
				precachemodel ("xmodel/mp_artillery_flak88_d");
				script_vehicles[i].dead_model = ("xmodel/mp_artillery_flak88_d");
			}
			script_vehicles[i] thread flak_init();
		}
	}
}

initArtilleryCvars()
{
	level.allow_flak88 = getCvar("scr_allow_flak88");
	if(level.allow_flak88 == "")
		level.allow_flak88 = "1";
	setCvar("scr_allow_flak88", level.allow_flak88);
	setCvar("ui_allow_flak88", level.allow_flak88);
	makeCvarServerInfo("ui_allow_flak88", "1");

	// set to something greather than 0 to enable
	level.flak_health = cvardef("scr_flak_health", 1600, 0, 99999999, "int");
	// do the flaks take friendly damage? (with a gunner)
	level.flak_friendly = cvardef("scr_flak_friendlyfire", 0, 0, 1, "int");
	// flak respawns after death?
	level.flak_respawn = cvardef("scr_flak_respawn", 1, 0, 1, "int");
	// time to wait for flak to respawn?
	level.flak_respawn_wait = cvardef("scr_flak_respawn_wait", 90, 0, 99999999, "int");
}

restrictPlacedArtillery()
{
	if(level.allow_flak88 != "1")
	{
		deletePlacedEntity("Flak88_MP");
		deletePlacedEntity("flak88_mp");
	}
}

deletePlacedEntity(vehicletype)
{
	tanks = getentarray("script_vehicle","classname");

	for(i=0;i<tanks.size;i++)
	{
		if (tanks[i].vehicletype == vehicletype)
		{
			// precache effects and setup for death model change
//			println("DELETED: ", tanks[i].vehicletype);
			tanks[i] delete();
		}
	}
}

flak_init()
{
	if (level.flak_health == 0) {
		if(isdefined(self.script_health))
		{
			self.health = self.script_health;
		}
		else
		{
			self.regen_health = 20000;
			self.health = self.regen_health;
			// and regen
			self thread flak_regen();
		}
	}

	self.gunner = undefined;

	if (level.flak_health > 0) 
		self thread flak_health();
	
	self thread wait_for_activate();
}

flak_health() {
	self setTakeDamage(true);
	self.basehealth = level.flak_health;
	self.health = self.basehealth;
	self.hud_width = 128;
	self.hud_maxwidth = self.hud_width;
	self.spawn_count = 0;
	basewidth = self.hud_width;

	takenDamage = 0;

	while(self.basehealth > takenDamage)
	{
		self waittill ("damage", amount, attacker, dir, point, mod, inflictor);

		// if we are in ceasefire mode vehicles can not be damaged
		if(level.ceasefire)
		{
			self.health = self.health + amount;
			continue;
		}

		if ( !isdefined(inflictor) )
			inflictor = attacker;
			
		owner = self getvehicleowner();

		// no damage if friendly fire
		if(isdefined(attacker) && isPlayer(attacker) && isdefined(owner) 
			&& (self != inflictor) && (owner.pers["team"] == attacker.pers["team"])
			&& level.flak_friendly == "0" && getcvar("g_gametype") != "dm" 
			&& (owner != attacker) )
				self.health = self.health + amount;
		else takenDamage += amount;

		self.hud_width = (self.health * basewidth)/self.basehealth;

		self notify ("flak_hud_update");
	}
	// kill the tank
	self thread flak_death(amount, attacker, point, mod, inflictor);
}

flak_death(amount, attacker, point, mod, inflictor)
{
	//iprintln("running death thread");
	if ( mod != "MOD_WATER")
	{
		// big explosion
		if (isDefined( attacker ))
		{
			self DoDamage( 10000, (self.origin[0],self.origin[1],self.origin[2]+25),  attacker, inflictor, mod );
			radiusDamage ( (self.origin[0],self.origin[1],self.origin[2]+180), 300,  150, 10, attacker, inflictor);
		}
		else
		{
			self DoDamagemod( 10000, (self.origin[0],self.origin[1],self.origin[2]+25), mod );
			radiusDamage ( (self.origin[0],self.origin[1],self.origin[2]+180), 300, 150, 10, self);
		}
	}
	// clone it and make it unusable
	dead = self cloneEnt();
	dead setModel(self.dead_model);

	self hide();
	self makevehicleunusable();

	self notify ("death");

	wait 0.05;

	self thread flak_deathfx();
	self playsound("explo_mine");

	if (level.flak_respawn > 0)
		self thread flak_respawn(dead);
}
flak_deathfx() {
	if (!isdefined(self.deathfx)) {
		self.deathfx    = loadfx ("fx/explosions/vehicles/t34_mp_n/burn_smoke.efx");
		self.explode1fx = loadfx( "fx/explosions/vehicles/t34_mp_n/1st_exp_v2.efx" );
		self.explode2fx = loadfx( "fx/explosions/vehicles/t34_mp_n/2nd_exp.efx" );
	}

	playfxontag( self.explode1fx, self, "tag_origin" );		
	earthquake( 0.25, 3, self.origin, 1050 );
	self thread playLoopSoundOnTag("distantfire");
	time_to_play = (level.flak_respawn_wait / 3);
	self thread flakPlayFXUntil( self.deathfx, time_to_play );

}
flakPlayFXUntil( fxId, time )
{
	// spawn the smoke_ent
	smoke_ent = PlayLoopedFX( fxId, 1, self.origin );
	
	wait (time);
	
	smoke_ent delete();
}
playLoopSoundOnTag(alias, tag)
{
	org = spawn ("script_origin",(0,0,0));
	if (isdefined (tag))
		org linkto (self, tag, (0,0,0), (0,0,0));
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org linkto (self);
	}
	org playloopsound (alias);
	self waittill ("stop sound " + alias);
	org stoploopsound (alias);
	org delete();
}
flak_respawn(death) {
	spawn_limit = getCvarInt("scr_vehicle_spawn_limit");
	
	// dont respawn this vehicle if it is over the spawn_limit
	if ( spawn_limit > 0 && self.spawn_count >= spawn_limit )
	{
		self delete();
		return;
	}

	wait level.flak_respawn_wait;
	
	// play an explosion again, a la GMI tanks
	playfxontag( self.explode2fx, self, "tag_origin" );

	// delete the death model
	death delete();

	wait 2;
	
	// bring it back and make it usable
	self show();
	self makevehicleusable();
	self.damaged = undefined;

	self.spawn_count++;
	self thread flak_init();
}
wait_for_activate()
{
	self endon("death");

	while (1)
	{
		self waittill("activated", vehpos, gunner);
		self thread flak_activated_delay(gunner);
	}
}

flak_activated_delay(gunner)
{
	wait 0.1;	// wait for a dismount to be processed if on same frame


	fireicon[0] = newClientHudElem(gunner );
	fireicon[0].alignX = "center";
	fireicon[0].alignY = "middle";
	fireicon[0].x = 320;
	fireicon[0].y = 240;
	fireicon[0] setShader("gfx/hud/tank_reticle25.dds", 64, 64);

	fireicon[1] = newClientHudElem(gunner );
	fireicon[1].alignX = "center";
	fireicon[1].alignY = "middle";
	fireicon[1].x = 320;
	fireicon[1].y = 240;
	fireicon[1] setShader("gfx/hud/tank_reticle50.dds", 64, 64);

	fireicon[2] = newClientHudElem(gunner );
	fireicon[2].alignX = "center";
	fireicon[2].alignY = "middle";
	fireicon[2].x = 320;
	fireicon[2].y = 240;
	fireicon[2] setShader("gfx/hud/tank_reticle75.dds", 64, 64);

	fireicon[3] = newClientHudElem(gunner );
	fireicon[3].alignX = "center";
	fireicon[3].alignY = "middle";
	fireicon[3].x = 320;
	fireicon[3].y = 240;
	fireicon[3] setShader("gfx/hud/tank_reticle100.dds", 64, 64);

	for (q=0;q<4;q++)
	{
		fireicon[q].threaded = 0;
		fireicon[q].alpha = 0;
	}

	if (level.flak_health > 0) {
		littletank = newClientHudElem(gunner);
		littletank setShader("gfx/hud/hud@littletank.dds", 12, 10);
		littletank.alignX = "left";
		littletank.alignY = "top";
		littletank.x = 488;
		littletank.y = 445;

		tankhud = newClientHudElem( gunner );
		tankhud.color = (1.0,0.0,0.0);
		tankhud setShader(level.tank_hud_bar, self.hud_width,8);
		tankhud.alignX = "left";
		tankhud.alignY = "top";
		tankhud.x = 488+13;
		tankhud.y = 446;

		tankhud2 = newClientHudElem( gunner );
		tankhud2 setShader("gfx/hud/hud@vehiclehealth.dds", 128, 32);
		tankhud2.alignX = "left";
		tankhud2.alignY = "top";
		tankhud2.x = 488+13;
		tankhud2.y = 452-16;

		level thread flak_health_hud_destroy_think ( self, gunner, littletank, tankhud, tankhud2 );
		level thread flak_health_hud_deactivated_think ( self, gunner, littletank, tankhud, tankhud2 );
		self thread flak_hud_update(gunner, tankhud);
	}

	level thread flak_hud_destroy_think( self, gunner, fireicon );

	// wait for the tank to be deactivated
	level thread flak_hud_deactivated_think( self, gunner, fireicon );

	// Incase we want to use this else where.
	self.gunner = gunner; 

	self thread flak_fire_think(fireicon, gunner);
	self thread flak_dismount();

	

}
flak_hud_update(gunner, hud) {
	self endon("death");
	gunner endon("death");
	gunner endon("stop_flak_hud");

	minwidth = 0;

	while(1)
	{
		self waittill("flak_hud_update");

		if ( !isAlive(self) || !isDefined(hud) )
			continue;
			
		if(self.hud_width > minwidth)
			hud setShader(level.tank_hud_bar, self.hud_width,8);
		else
		{
			hud setShader(level.tank_hud_bar, minwidth,8);
			break;
		}
	}
}
flak_health_hud_destroy_think(flak, gunner, littletank, tankhud, tankhud2) {
	gunner waittill("stop_flak_hud");

	if (!isvalidplayer(gunner))
		return;

	if (isdefined(littletank))
		littletank destroy();
	if (isdefined(tankhud))
		tankhud destroy();
	if (isdefined(tankhud2))
		tankhud2 destroy();
}

flak_hud_destroy_think(flak, driver, fireicon)
{
	driver waittill("stop_flak_hud");

	if (!isValidPlayer( driver ))
	{
		// already disconnected, hudelem's must have been destroyed
		return;
	}

	if (isdefined(fireicon))
	{
		if (isdefined( fireicon[0] )) fireicon[0] destroy();
		if (isdefined( fireicon[1] )) fireicon[1] destroy();
		if (isdefined( fireicon[2] )) fireicon[2] destroy();
		if (isdefined( fireicon[3] )) fireicon[3] destroy();
	}
}
flak_hud_deactivated_think( flak, activator, fireicon )
{
	flak waittill("deactivated", deactivator);
		
	if (!isValidPlayer( activator ))
	{
		// already disconnected, hudelem's must have been destroyed
		return;
	}

	if (isdefined(fireicon))
	{
		if (isdefined( fireicon[0] )) fireicon[0] destroy();
		if (isdefined( fireicon[1] )) fireicon[1] destroy();
		if (isdefined( fireicon[2] )) fireicon[2] destroy();
		if (isdefined( fireicon[3] )) fireicon[3] destroy();
	}
}

flak_health_hud_deactivated_think( flak, activator, littletank, tankhud, tankhud2 )
{
	flak waittill("deactivated", deactivator);
		
	if (!isValidPlayer( activator ))
	{
		// already disconnected, hudelem's must have been destroyed
		return;
	}

	if (isdefined(littletank))
		littletank destroy();
	if (isdefined(tankhud))
		tankhud destroy();
	if (isdefined(tankhud2))
		tankhud2 destroy();
}

flak_dismount()
{
	self endon("death");
	self waittill("deactivated", activator);
	
	if ( isalive(activator) )
		activator notify("stop_flak_hud");

	self.gunner = undefined;
}

flak_regen()
{
	self endon("death");
	
	while (1)
	{
		self waittill("damage");
		self.health = self.regen_health;		
	}
}

fadeoff()
{
	while(self.alpha > 0.0)
	{
		self.alpha = self.alpha - 0.1;
		wait(0.05);
	}
	self.threaded = 0;
}

flak_fire_think(fireicon, driver)
{
	self endon("death");
	driver endon("death");
	driver endon("stop_flak_hud");	

	if (!isdefined(fireicon)) {
		if (isdefined(self.gunner))
			clientAnnouncement(self.gunner, "Fireicon not defined, please inform gitman!!");
		return;	//	oh shit
	}


	while (self.health>0)
	{
		self waittill ("turret_fire");

		if(level.ceasefire == 2)
			continue;

		for (q=0;q<4;q++)
		{
			if ( isdefined( fireicon[q] ) )
				fireicon[q].alpha = 1.0;
		}
		self FireTurret();

		wait .5;
		self playsound ("flak_reload");
	
		while (self isTurretReady() != true)
		{
			val = self get_fire_time() / 1000;
			if (val<=3)
			{
				if (isdefined( fireicon[val] ) && fireicon[val].threaded == 0)
				{
					fireicon[val].threaded = 1;
					fireicon[val] thread fadeoff();
				}
			}
			wait .25;
		}
	}
/*
	while(self.health > 0)
	{
		fire_icon.alpha = 1;
		self waittill ("turret_fire");
		fire_icon.alpha = 0;
		self FireTurret();
		wait .5;
		self playsound ("flak_reload");
		while (self isTurretReady() != true)
			wait .2;
	}
*/
}


cloneEnt() {
	if ( !isdefined(self) || !isdefined(self.origin) || !isdefined(self.model) )
		return;

	spawn = spawn("script_model", (0, 0, 0));
	if (isdefined(self.origin))
		spawn.origin = self.origin;

	if (isdefined(self.model))
		spawn setModel (self.model);

	if (isdefined(self.targetname))
		spawn.targetname = self.targetname;

	if (isdefined(self.angles))
		spawn.angles = self.angles;

	return spawn;
}
cvardef(varname, vardefault, min, max, type)
{
	mapname = getcvar("mapname");		// "mp_dawnville", "mp_rocket", etc.
	gametype = getcvar("g_gametype");	// "tdm", "bel", etc.

	tempvar = varname + "_" + gametype;	// i.e., scr_teambalance becomes scr_teambalance_tdm
	if(getcvar(tempvar) != "") 		// if the gametype override is being used
		varname = tempvar; 		// use the gametype override instead of the standard variable

	tempvar = varname + "_" + mapname;	// i.e., scr_teambalance becomes scr_teambalance_mp_dawnville
	if(getcvar(tempvar) != "")		// if the map override is being used
		varname = tempvar;		// use the map override instead of the standard variable


	// get the variable's definition
	switch(type)
	{
		case "int":
			if(getcvar(varname) == "")		// if the cvar is blank
				definition = vardefault;	// set the default
			else
				definition = getcvarint(varname);
			break;
		case "float":
			if(getcvar(varname) == "")		// if the cvar is blank
				definition = vardefault;	// set the default
			else
				definition = getcvarfloat(varname);
			break;
		case "string":
		default:
			if(getcvar(varname) == "")		// if the cvar is blank
				definition = vardefault;	// set the default
			else
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

