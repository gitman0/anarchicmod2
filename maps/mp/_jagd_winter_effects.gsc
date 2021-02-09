init( precache )
{
	self.collision_fx_str = "fx/vehicle/vehicle_collision.efx";

	if (precache)
	{
		loadfx("fx/explosions/vehicles/t34_mp_n/burn_smoke.efx");
		loadfx("fx/explosions/vehicles/t34_mp_n/1st_exp_v2.efx");
		loadfx("fx/explosions/vehicles/t34_mp_n/2nd_exp.efx");
		loadfx("fx/map_mp/mp_smoke_vehicle_damage.efx");
		loadfx( self.collision_fx_str );
	}
	
	if (self.vehicletype == "jagd_wintertank_mp")
	{
		if (self.model == "xmodel/mp_jagd_winter")
			self.deathmodel = "xmodel/mp_vehicle_jagd_winter_d";
		
		if (precache)
			precachevehicle("jagd_wintertank_mp");
	}

	if (!isdefined( self.deathmodel ))
	{
		println("vehicle unknown, check that vehicle type and model are both lowercase");
		return;
	}

	if (precache)
	{
		precachemodel(self.deathmodel);
	}

	// start the collision thinker
	self thread tank_collision_thread();
}

tank_collision_thread()
{
	self endon("death");
	
	self.collision_fx = loadfx( self.collision_fx_str );
	
	while (1)
	{
		self waittill("vehicle_collision", pos, dir );
		
		// spawn the collision fx
		playfx( self.collision_fx, pos, dir );
	}
	
}

tank_damaged_smoke()
{
	self endon ("death");
	
	smokefx = loadfx("fx/map_mp/mp_smoke_vehicle_damage.efx");
	
	while (1)
	{
		self waittill ("damage");
	
		if (!isDefined( self.hud_height ))
		{
			// wait for the hud to initialize
			wait 0.5;
		}
		else
		{
			if (self.hud_height < 0.35*self.hud_maxheight)
			{
				// it's now smoking, so stay in this section until death
				while (1)
				{
					if (!isDefined( smoke_ent ))
					{
						// spawn the smoke_ent
						smoke_ent = PlayLoopedFX( smokefx, 0.3, self.origin, 2048 );
						// kill it once we're dead
						self thread tank_damaged_smoke_stop( smoke_ent );
					}
					else
					{
						// update the position
						smoke_ent.origin = self.origin;
					}
					
					wait 0.1;
				}
			}
		}
	}
}

tank_damaged_smoke_stop(smoke_ent)
{
	self waittill("death");
	
	smoke_ent delete();
}

tank_death()
{
	self.deathfx    = loadfx ("fx/explosions/vehicles/t34_mp_n/burn_smoke.efx");
	self.explode1fx = loadfx( "fx/explosions/vehicles/t34_mp_n/1st_exp_v2.efx" );
	self.explode2fx = loadfx( "fx/explosions/vehicles/t34_mp_n/2nd_exp.efx" );
	self waittill( "death" );
	
	if (!isdefined(self.deepwater))
	{
		if (isdefined( self.deathmodel ))
			self setmodel( self.deathmodel );

		// 1st explode
		playfxontag( self.explode1fx, self, "tag_origin" );
		earthquake( 0.25, 3, self.origin, 1050 );
		self thread playLoopSoundOnTag("distantfire");
		self thread tankPlayFXUntilEvent( self.deathfx, "allow_explode" );

		self waittill( "allow_explode" );
		println( "recieved allow_explode death");
	
		self notify ("stop sound distantfire");

		// 2nd explode
		playfxontag( self.explode2fx, self, "tag_origin" );

		// wait for effects to finish
		wait 0.5;
	
		// this will keep the tank from blocking the radius damage
		self setcontents(0);

		if (level.tank_postdamage == 1)
			radiusDamage ( (self.origin[0],self.origin[1],self.origin[2]+25), 512, 200, 0);
	}
	else
	{
		println("water death");
		self waittill( "allow_explode" );
	}
	
	// we currently need to remove it straight away, in case it's sitting in the place of the spawning in tank
	self delete();
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
//	println ("playing loop sound ", alias," on entity at origin ", self.origin, " at ORIGIN ", org.origin);
	self waittill ("stop sound " + alias);
	org stoploopsound (alias);
	org delete();
}
tankPlayFXUntilEvent( fxId, eventStr )
{
	// spawn the smoke_ent
	smoke_ent = PlayLoopedFX( fxId, 1, self.origin );

	self waittill( eventStr );

	smoke_ent delete();
}
