/*
	****************************************************************************************************************
	OneShotfx: Fires an effect once.
	maps\_fx_gmi::OneShotfx( effectname, (x y z), predelay);

	Example:
	maps\_fx_gmi::OneShotfx(level.medFire,		// Medium fire effect
					(-701, -18361, 148),	// Origin
					5);						// Wait 5 seCaconds before doing effect
	****************************************************************************************************************


	****************************************************************************************************************
	Loopfx: Loops an effect with a waittime.
	maps\_fx_gmi::loopfx( effectname, (x y z), delay_between_shots);

	Example:
	maps\_fx_gmi::loopfx(level.medFire,			// Medium fire effect
					(-701, -18361, 148),	// Origin
					0.3);					// Wait 0.3 seconds between shots
	****************************************************************************************************************


	****************************************************************************************************************
	GunFireLoopfx: Simulates bursts of fire.
	maps\_fx_gmi::gunfireloopfx(fxId, fxPos, shotsMin, shotsMax, shotdelayMin, shotdelayMax, betweenSetsMin, betweenSetsMax)

	Example:
	maps\_fx_gmi::gunfireloopfx (level.medFire,			// Medium fire effect
							(-701, -18361, 148),	// Origin
							10, 15,					// 10 to 15 shots
							0.1, 0.3,				// 0.1 to 0.3 seconds between shots
							2.5, 9);				// 2.5 to 9 seconds between sets of shots.
	****************************************************************************************************************

	****************************************************************************************************************
	GrenadeExplosionfx: Creates a grenade explosion with view jitter.
	maps\_fx_gmi::GrenadeExplosionfx((x y z));

	Example:
	maps\_fx_gmi::GrenadeExplosionfx( (-701, -18361, 148) ); // origin
	****************************************************************************************************************
*/

/*
{
"origin" "-451 -14930 26"
"targetname" "auto1166"
"classname" "script_origin"
}
*/

print_org (fxcommand, fxId, fxPos, waittime)
{
	if (getcvar("debug") == "1")
	{
		println ("{");
		println ("\"origin\" \"" + fxpos[0] + " " + fxpos[1] + " " + fxpos[2] + "\"");
		println ("\"classname\" \"script_model\"");
		println ("\"model\" \"xmodel/fx\"");
		println ("\"script_fxcommand\" \"" + fxcommand + "\"");
		println ("\"script_fxid\" \"" + fxid + "\"");
		println ("\"script_delay\" \"" + waittime + "\"");
		println ("}");
	}
}

OneShotfx(fxId, fxPos, waittime, fxPos2)
{
	level thread print_org ("OneShotfx", fxId, fxPos, waittime);
    level thread OneShotfxthread (fxId, fxPos, waittime, fxPos2);
}

OneShotfxthread ( fxId, fxPos, waittime, fxPos2 )
{
	//maps\_spawner_gmi::waitframe();

    wait waittime;
    if (isdefined (fxPos2))
		fxPos2 = vectornormalize (fxPos2 - fxPos);

	if (isdefined (fxPos2))
		playfx ( level._effect[fxId], fxPos, fxPos2 );
	else
		playfx ( level._effect[fxId], fxPos);
}

loopfx(fxId, fxPos, waittime, fxPos2, fxStart, fxStop, timeout, low_fxId, lod_dist)
{
	level thread print_org ("loopfx", fxId, fxPos, waittime);
	level thread loopfxthread (fxId, fxPos, waittime, fxPos2, fxStart, fxStop, timeout, low_fxId, lod_dist);
}

// OLD : loopfxthread ( fxId, fxPos, waittime, fxPos2, fxStart, fxStop, timeout)
loopfxthread ( fxId, fxPos, waittime, fxPos2, fxStart, fxStop, timeout, low_fxId, lod_dist)
{
	//maps\_spawner_gmi::waitframe();
	if ((isdefined (level.scr_sound)) && (isdefined (level.scr_sound[fxId])))
	{
		loopSound(level.scr_sound[fxId], fxPos, undefined, fxStop);
	}

	if (isdefined (fxPos2))
	{
		fxPos2 = vectornormalize (fxPos2 - fxPos);
	}

	dist = 0;

	if (isdefined (fxStart))
	{
		level waittill ("start fx " + fxStart);
	}

	while (1)
	{
		if(isdefined(low_fxId))
		{
			thread lod_loopfx_think(fxId, fxPos, waittime, fxPos2, dist, fxStop, timeout, low_fxId, lod_dist);
		}
		else
		{
			thread loopfxthread_think ( fxId, fxPos, waittime, fxPos2, dist, fxStop, timeout);
		}

		if (isdefined (fxStop))
		{
			level waittill ("stop fx " + fxStop);
		}
		else
		{
			return;
		}
			
		if (isdefined (fxStart))
		{
			level waittill ("start fx " + fxStart);
		}
		else
		{
			return;
		}
	}
}

lod_loopfx_think( fxId, fxPos, waittime, fxPos2, dist, fxStop, timeout, low_fxId, lod_dist)
{
	if(!isdefined(lod_dist))
	{
		lod_dist = 1024;
	}


	// MikeD: Forcing the LOD on the loopingfx to be a really close dist, if
	// scr_gmi_fast is set to anything other than 0.
	if(getcvar("scr_gmi_fast") != "" && getcvarint("scr_gmi_fast") > 0)
	{
		if(getcvarint("scr_gmi_fast") < 2)
		{
			lod_dist = 512;
		}
		else
		{
			lod_dist = 256;
		}
	}

	// Used for changing waittime, optimizes the 
	// fx even more when far away from it.
	if(waittime < 0.5)
	{
		lod_waittime = (waittime * 2);
	}
	else
	{
		lod_waittime = waittime;
	}

	if(isdefined(low_fxId) && low_fxId == "same")
	{
		low_fxId = fxId;
	}

	println("LOD_WAITTIME = ",lod_waittime, " ",fxPos, " ",level._effect[low_fxId], " ", low_fxId);

	if (isdefined (fxPos2))
	{
		if(distance(fxpos, level.player.origin) > lod_dist)
		{
			looper = playLoopedFx( level._effect[low_fxId], lod_waittime, fxPos, dist, fxPos2 );
		}
		else
		{
			looper = playLoopedFx( level._effect[fxId], waittime, fxPos, dist, fxPos2 );
		}
	}
	else
	{
		if(distance(fxpos, level.player.origin) > lod_dist)
		{
			looper = playLoopedFx( level._effect[low_fxId], lod_waittime, fxPos, dist );
		}
		else
		{
			looper = playLoopedFx( level._effect[fxId], waittime, fxPos, dist );
		}
	}

	looper endon("death");

	if (isdefined (fxStop))
	{
		level thread lod_loopfxstop(looper, fxstop, fxId);
	}

	if (!isdefined(looper))
	{
		return;
	}

	if (isdefined(timeout))
	{
		level thread loopfxStop(looper, timeout);
	}
	
	if(distance(fxPos, level.player.origin) > lod_dist )
	{
		looper.lod = true;
	}
	else
	{
		looper.lod = false;
	}

//MikeD need to fix this as it constantly makes new loopers.
	while(1)
	{
		if(!isdefined(looper))
		{
			return;
		}

		if(!looper.lod && distance(looper.origin, level.player.origin) > lod_dist)
		{
			if(isdefined(looper))
			{
				looper delete();
			}
			
			if (isdefined (fxPos2))
			{
				looper = playLoopedFx( level._effect[low_fxId], lod_waittime, fxPos, dist, fxPos2 );
			}
			else
			{
				looper = playLoopedFx( level._effect[low_fxId], lod_waittime, fxPos, dist );
			}
			if (isdefined (fxStop))
			{
				level thread lod_loopfxstop(looper, fxstop, fxId);
			}

			pdist = distance(looper.origin, level.player.origin);
			looper.lod = true;

			pdist = distance(looper.origin, level.player.origin);
			println("^3Changing Effect from ", low_fxid, "^3 to ", fxId, "^3 at position: ",fxpos, " ^3 Rate: ",lod_waittime);
		}
		else if(looper.lod && distance(looper.origin, level.player.origin) < lod_dist)
		{
			if(isdefined(looper))
			{
				looper delete();
			}

			if (isdefined (fxPos2))
			{
				looper = playLoopedFx( level._effect[fxId], waittime, fxPos, dist, fxPos2 );
			}
			else
			{
				looper = playLoopedFx( level._effect[fxId], waittime, fxPos, dist );

			}
			if (isdefined (fxStop))
			{
				level thread lod_loopfxstop(looper, fxstop, fxId);
			}

			looper.lod = false;

			pdist = distance(looper.origin, level.player.origin);
			println("^3Changing Effect from ", low_fxid, "^3 to ", fxId, "^3 at position: ",fxpos, " ^3 Rate: ",waittime);
		}

//		pdist = distance(looper.origin, level.player.origin);
//		println("^3Player Dist: ",pdist," ^3Set Dist: ",lod_dist);
		wait 1;
	}

	if(isdefined (fxStop) && isdefined(looper))
	{
		level thread lod_loopfxstop(looper, fxstop, fxId);
	}
}

lod_loopfxstop(looper, fxstop, fxid)
{
	looper endon("death");
	level waittill ("stop fx " + fxStop);
	println("^1FX STOPPED: ",fxstop);
	looper notify("death");
	looper delete();
}

loopfxStop (looper, timeout)
{
	looper endon("death");
	wait(timeout);
	looper delete();
}

loopfxthread_think ( fxId, fxPos, waittime, fxPos2, dist, fxStop, timeout)
{
	if (isdefined (fxPos2))
	{
		if(isdefined(level._effect[fxId]))
		{
			looper = playLoopedFx( level._effect[fxId], waittime, fxPos, dist, fxPos2 );
		}
		else
		{
			println("^1(loopfxthread_think): level._effect[fxId] ", fxId," ^1is undefined! Aborting FX loop...");
			return;
		}
	}
	else
	{
		if(isdefined(level._effect[fxId]))
		{
			looper = playLoopedFx( level._effect[fxId], waittime, fxPos, dist );
		}
		else
		{
			println("^1(loopfxthread_think): level._effect[fxId] ", fxId," ^1is undefined! Aborting FX loop...");
			return;
		}
	}
println("^3Playing Effect ", fxId, "^3 at position: ",fxpos);
	looper endon("death");

	if (isdefined(timeout))
	{
		level thread loopfxStop(looper, timeout);
	}
	
	if (isdefined (fxStop))
	{
		level waittill ("stop fx " + fxStop);
		looper delete();
	}
}

loopSound(sound, Pos, waittime, fxStop)
{
//	level thread print_org ("loopSound", sound, Pos, waittime);
	level thread loopSoundthread (sound, Pos, waittime, fxStop);
}

loopSoundthread ( sound, Pos, waittime, fxStop )
{
	org = spawn ("script_origin", (pos));

	org.origin = pos;
//	println ("hello1 ", org.origin, sound);
	org playLoopSound ( sound );

	if(isdefined(fxStop))
	{
		println("^3 Waiting to stop fx w/ sound, "+fxStop);
		level waittill ("stop fx " + fxStop);
		org StopLoopSound( sound );
		println("^1LOOP FX w/ Sound stopped. " + fxstop);
		wait 3;
		org delete();
	}
}

gunfireloopfx(fxId, fxPos, shotsMin, shotsMax, shotdelayMin, shotdelayMax, betweenSetsMin, betweenSetsMax, wait_till)
{
    thread gunfireloopfxthread (fxId, fxPos, shotsMin, shotsMax, shotdelayMin, shotdelayMax, betweenSetsMin, betweenSetsMax, wait_till);
}

gunfireloopfxthread (fxId, fxPos, shotsMin, shotsMax, shotdelayMin, shotdelayMax, betweenSetsMin, betweenSetsMax, wait_till)
{
	if(isdefined(wait_till))
	{
		level endon(wait_till);
	}
	//maps\_spawner_gmi::waitframe();

	if (betweenSetsMax < betweenSetsMin)
	{
		temp = betweenSetsMax;
		betweenSetsMax = betweenSetsMin;
		betweenSetsMin = temp;
	}

	betweenSetsBase = betweenSetsMin;
	betweenSetsRange = betweenSetsMax - betweenSetsMin;

	if (shotdelayMax < shotdelayMin)
	{
		temp = shotdelayMax;
		shotdelayMax = shotdelayMin;
		shotdelayMin = temp;
	}

	shotdelayBase = shotdelayMin;
	shotdelayRange = shotdelayMax - shotdelayMin;

	if (shotsMax < shotsMin)
	{
		temp = shotsMax;
		shotsMax = shotsMin;
		shotsMin = temp;
	}

	shotsBase = shotsMin;
	shotsRange = shotsMax - shotsMin;

    for (;;)
    {
		shotnum = shotsBase + randomint (shotsRange);
		for (i=0;i<shotnum;i++)
		{
			playfx ( level._effect[fxId], fxPos );
			wait (betweenSetsBase + randomfloat(betweenSetsRange));
		}
        wait (shotdelayBase + randomfloat (shotdelayRange));
    }
}

setup_fx()
{
	if ((!isdefined (self.script_fxid)) || (!isdefined (self.script_fxcommand)) || (!isdefined (self.script_delay)))
	{
//		println (self.script_fxid);
//		println (self.script_fxcommand);
//		println (self.script_delay);
//		println ("Effect at origin ", self.origin," doesn't have script_fxid/script_fxcommand/script_delay");
//		self delete();
		return;
	}

//	println ("^a Command:", self.script_fxcommand, " Effect:", self.script_fxID, " Delay:", self.script_delay, " ", self.origin);
	if (isdefined (self.model))
		if (self.model == "xmodel/toilet")
		{
			self thread burnville_paratrooper_hack();
			return;
		}

	if (isdefined (self.target))
		org = getent (self.target).origin;

	if (isdefined (self.script_fxstart))
		fxStart = self.script_fxstart;

	if (isdefined (self.script_fxstop))
		fxStop = self.script_fxstop;

	if (self.script_fxcommand == "OneShotfx")
		OneShotfx(self.script_fxId, self.origin, self.script_delay, org);
	if (self.script_fxcommand == "loopfx")
		loopfx(self.script_fxId, self.origin, self.script_delay, org, fxStart, fxStop);
	if (self.script_fxcommand == "loopsound")
		loopsound(self.script_fxId, self.origin, self.script_delay);

	self delete();
}

burnville_paratrooper_hack()
{
	normal = (0, 0, self.angles[1]);
//	println ("z:       paratrooper fx hack: ", normal);
	id = level._effect[self.script_fxId];
	origin = self.origin;

//	if (isdefined (self.script_delay))
//		wait (self.script_delay);

	wait 1;
	level thread burnville_paratrooper_hack_loop(normal, origin, id);
	self delete();
}

burnville_paratrooper_hack_loop(normal, origin, id)
{
	while (1)
	{
	//	iprintln ("z:        playing paratrooper fx", origin);

		playfx (id, origin);
		wait (30 +randomfloat (40));
	}
}

script_print_fx()
{
	if ((!isdefined (self.script_fxid)) || (!isdefined (self.script_fxcommand)) || (!isdefined (self.script_delay)))
	{
		println ("Effect at origin ", self.origin," doesn't have script_fxid/script_fxcommand/script_delay");
		self delete();
		return;
	}

	if (isdefined (self.target))
		org = getent (self.target).origin;
	else
		org = "undefined";

//	println ("^a Command:", self.script_fxcommand, " Effect:", self.script_fxID, " Delay:", self.script_delay, " ", self.origin);
	if (self.script_fxcommand == "OneShotfx")
		println ("maps\_fx_gmi::OneShotfx(\"" + self.script_fxid + "\", " + self.origin + ", " + self.script_delay + ", " + org + ");");

	if (self.script_fxcommand == "loopfx")
		println ("maps\_fx_gmi::LoopFx(\"" + self.script_fxid + "\", " + self.origin + ", " + self.script_delay + ", " + org + ");");

	if (self.script_fxcommand == "loopsound")
		println ("maps\_fx_gmi::LoopSound(\"" + self.script_fxid + "\", " + self.origin + ", " + self.script_delay + ", " + org + ");");
}

script_playfx ( id, pos, pos2 )
{
	if (!id)
		return;

	if (isdefined (pos2))
		playfx (id,pos,pos2);
	else
		playfx (id,pos);
}

script_playfxontag ( id, ent, tag )
{
	if (!id)
		return;

	playfxontag (id,ent,tag);
}

GrenadeExplosionfx(pos)
{
	playfx (level._effect["mechanical explosion"], pos);
	earthquake(0.15, 0.5, pos, 250);
	// TODO: Add explosion effect and view jitter
//	println("The script command grenadeExplosionEffect has been removed. maps\\_fx_gmi::GrenadeExplosionfx must be set up to make an effect and jitter the view.");
}
