main()
{
	if (level.squadplay == 0)
		return;

	level.maxsquads = 6;	// per team
	level.squadsize = 5;	// players per squad

	level.squads["allies"]	= [];
	level.squads["axis"]	= [];

	level.squadcount["axis"] = 0;
	level.squadcount["allies"] = 0;

	game["squad1_headicon"] = "gfx/hud/headicon@squad1.tga";
	game["squad2_headicon"] = "gfx/hud/headicon@squad2.tga";
	game["squad3_headicon"] = "gfx/hud/headicon@squad3.tga";
	game["squad4_headicon"] = "gfx/hud/headicon@squad4.tga";
	game["squad5_headicon"] = "gfx/hud/headicon@squad5.tga";
	game["squad6_headicon"] = "gfx/hud/headicon@squad6.tga";

	game["obj_arrow_c"]  = "gfx/hud/hud@arrow-c.tga";
	game["obj_arrow_lc"] = "gfx/hud/hud@arrow-lc.tga";
	game["obj_arrow_rc"] = "gfx/hud/hud@arrow-rc.tga";
	game["obj_arrow_l"]  = "gfx/hud/hud@arrow-l.tga";
	game["obj_arrow_r"]  = "gfx/hud/hud@arrow-r.tga";

	// need to localize
	game["obj_str"]	= &"^1Press ^7[{+activate}]^1 to set the squad objective";
	game["m_str"] = &"m";

	precache();
}
precache()
{
	if(!isDefined(game["gamestarted"])) {
		precacheHeadIcon(game["squad1_headicon"]);
		precacheHeadIcon(game["squad2_headicon"]);
		precacheHeadIcon(game["squad3_headicon"]);
		precacheHeadIcon(game["squad4_headicon"]);
		precacheHeadIcon(game["squad5_headicon"]);
		precacheHeadIcon(game["squad6_headicon"]);

		precacheShader(game["obj_arrow_c"]);
		precacheShader(game["obj_arrow_lc"]);
		precacheShader(game["obj_arrow_rc"]);
		precacheShader(game["obj_arrow_l"]);
		precacheShader(game["obj_arrow_r"]);

		// need to localize
		precacheString(game["obj_str"]);
		precacheString(game["m_str"]);
	}
}
arrowtest()
{
	self.arrow = newclienthudelem(self);
	self.arrow.alignx = "center";
	self.arrow.aligny = "middle";
	self.arrow.x = 320;
	self.arrow.y = 50;
	self.arrow setshader(game["obj_arrow_c"], 64, 32);

	self.arrow1 = newclienthudelem(self);
	self.arrow1.alignx = "center";
	self.arrow1.aligny = "middle";
	self.arrow1.x = 100;
	self.arrow1.y = 100;
	self.arrow1 setshader(game["obj_arrow_lc"], 64, 32);

	self.arrow2 = newclienthudelem(self);
	self.arrow2.alignx = "center";
	self.arrow2.aligny = "middle";
	self.arrow2.x = 540;
	self.arrow2.y = 100;
	self.arrow2 setshader(game["obj_arrow_rc"], 64, 32);

	self.arrow3 = newclienthudelem(self);
	self.arrow3.alignx = "center";
	self.arrow3.aligny = "middle";
	self.arrow3.x = 620;
	self.arrow3.y = 220;
	self.arrow3 setshader(game["obj_arrow_r"], 64, 32);

	self.arrow = newclienthudelem(self);
	self.arrow.alignx = "center";
	self.arrow.aligny = "middle";
	self.arrow.x = 20;
	self.arrow.y = 220;
	self.arrow setshader(game["obj_arrow_l"], 64, 32);


}
squadspawn()
{
	if (level.squadplay == 0)
		return;

	//self arrowtest();

	if (isdefined(self.squad_id))
	{
		self thread squadobj();
		self.headicon = squadicon(self.squad_id);
	}

	if (isdefined(self.squad_leader) && self.squad_leader)
		self thread commandsquad();
}
squad(command, var)
{
	self endon("death");

	if (command == "squad.create")
	{
		if (isdefined(self.squad_id))
		{
			self iprintln("You'll need to leave your current squad before you can create a new one.");
			return;
		}
		team = self.pers["team"];

		if (level.squads[team].size >= level.maxsquads)
			self iprintln("Squad limit for your team reached.");
		else {

			// need a better way of creating the squad, look for empty idx

			level.squads[team][level.squads[team].size] = spawnstruct();
			idx = level.squads[team].size-1;
			level.squads[team][idx].id = idx;
			level.squads[team][idx].name = namebycolor(idx);
			level.squads[team][idx].members = 0;

			level.squads[team][idx].member = [];	
			level.squads[team][idx].member[0] = self;
			level.squads[team][idx].members++;

			self.squad_id = idx;
			self.squad_leader = true;
			self.headicon = squadicon(self.squad_id);

			level.squads[team][self.squad_id].objective = (-173,980,25);	// test
			self thread squadobj();
			self thread commandsquad();

			self iprintln("Squad " + self.squad_id + " created successfully.");
		}
	}	

	else if (command == "squad.join")
		self addMember((int)var);
	else if (command == "squad.leave")
		self removeMember();
	else if (command == "squad.attack")
	{
		if (isdefined(self.squad_id) && self.squad_leader)
			self thread attack_base((int)var);
	}
	else self iprintln("Unknown squad command.");
}
addMember(squad_id)
{
	if (isdefined(self.squad_id))
	{
		self iprintln("You'll need to leave your current squad before you can join a new one.");
		return;
	}

	team = self.pers["team"];

	if (!isdefined(level.squads[team][squad_id]))
	{
		self iprintln("That squad does not exist!");
		return;
	}
	member_num = 0;
	for (i=0;i<level.squads[team][squad_id].member.size;i++)
	{
		if (isdefined(level.squads[team][squad_id].member[i]))
			continue;
		else member_num = i;
	}

	if (member_num < 5)
	{
		level.squads[team][squad_id].member[i] = self;
		level.squads[team][squad_id].members++;
		self.squad_id = squad_id;
		self.squad_leader = false;
		self.headicon = squadicon(self.squad_id);
		self iprintln("Joined ^1" + game[team] + "^7 squad " + self.squad_id + ", member " + member_num);
		self thread squadobj();
	}
	else self iprintln("That squad is full!");
}

removeMember()
{
	squad_id = self.squad_id;
	if (!isdefined(squad_id))
		return;

	team = self.pers["team"];
	size = level.squads[team][squad_id].member.size;

	for (i=0;i<level.squads[team][squad_id].member.size;i++)
	{
		if (level.squads[team][squad_id].member[i] == self)
		{
			self notify("left_squad");
			self.squad_id = undefined;
			self.squad_leader = undefined;
			self.headicon = maps\mp\gametypes\_rank_gmi::GetRankHeadIcon(self);
			if (isdefined(self.obj_dist))
				self.obj_dist destroy();
			if (isdefined(self.obj_dist_m))
				self.obj_dist_m destroy();
			level.squads[team][squad_id].member[i] = undefined;
			level.squads[team][squad_id].members--;
			self iprintln("You left the squad!");
			if (level.squads[team][squad_id].members < 1)
				level.squads[team][squad_id] = undefined;
			break;
		}
		else continue;
	}
}
		
squadMessage()
{
}
// shows the squad member WHERE their objective is and HOW FAR AWAY it is
// should also notify player of new objectives
squadobj()
{
	self endon("death");
	self endon("player_died");
	self endon("left_squad");

	if (isdefined(self.obj_dist))
		self.obj_dist destroy();

	self.obj_dist = newclienthudelem(self);
	self.obj_dist.x = 618;
	self.obj_dist.y = 400;
	self.obj_dist.alignx = "right";
	self.obj_dist.aligny = "middle";
	self.obj_dist.fontscale = 0.8;
	self.obj_dist.color = (1, 0, 0);

	self.obj_dist_m = newclienthudelem(self);
	self.obj_dist_m.x = 622;
	self.obj_dist_m.y = 401;
	self.obj_dist_m.alignx = "center";
	self.obj_dist_m.aligny = "middle";
	self.obj_dist_m.fontscale = 0.7;
	self.obj_dist_m setText(game["m_str"]);

	for (;;)
	{
		wait 0.3;
		obj = level.squads[self.pers["team"]][self.squad_id].objective;
		while (!isdefined(obj))
			continue;
		angles = self.angles;
		point = self.origin + vscale(anglestoforward(angles),100000); 
		trace = bullettrace(self.origin,point,false,undefined); 
		//dotproduct = vectordot(obj, trace["position"]); 
		//distproduct = distance(self.origin,obj) * distance(self.origin,trace["position"]); 
		//angle = acos(dotproduct / distproduct);
		//self iprintln("angle: " + angle);
		//self iprintln("distance: " + distance(self.eyemarker.origin,trace["position"]));
		//self iprintln("angles: " + self.angles);
		line(self.origin, obj, (1, 0, 0));
		dist = noneg((int)((distance(self.origin, obj) - 20) * 0.0254));
		if (dist > 50) self.obj_dist.color = (1, 0, 0);
		else self.obj_dist.color = (0, 1, 0);
		self.obj_dist setValue(dist);
	}
}
noneg(x)
{
	if (x < 0)
		return 0;
	else return x;
}
vScale(v, s) 
{ 
	v = (v[0] * s, v[1] * s, v[2] * s); 
	return v;
} 
commandsquad()
{
	// few threads here..
	//  - watch the binocs for obj placement
	//  - intercept base attack commands via vsay
	//  - handle if the objective IS the squad leader
	if (self getweaponslotweapon("binocular") == "none")
		self setWeaponSlotWeapon("binoculars_mp");
	self thread attack_point();
	self playlocalsound("in_charge");

}
attack_base(base_id)
{
	if (level.gametype != "bas")
	{
		self iprintln("No bases!");
		return;
	}
	bases = getentarray("gmi_base","targetname");
	enemy_bases = [];
	x=0;
	for (i=0; i<bases.size; i++)
	{
		if (bases[i].script_team != self.pers["team"])
		{
			enemy_bases[x] = bases[i];
			x++;
		}
	}
	if (!isdefined(enemy_bases[base_id-1]))
	{
		self iprintln("No such base!");
		return;
	}
	for (i=0; i<enemy_bases.size; i++)
	{
		if (base_id == 1 && enemy_bases[i].script_noteworthy == "ammo")
		{
			target_base = enemy_bases[i];
			break;
		}
		else if (base_id == 2 && enemy_bases[i].script_noteworthy == "fuel")
		{
			target_base = enemy_bases[i];
			break;
		}
		else if (base_id == 3 && enemy_bases[i].script_noteworthy == "hq")
		{
			target_base = enemy_bases[i];
			break;
		}
	}
	level.squads[self.pers["team"]][self.squad_id].objective = target_base.origin;

	self iprintln("Objective updated!");	
}
attack_point() // via binocs
{
	self endon("death");
	self endon("player_died");
	self endon("left_squad");
	for (;;)
	{
		weapon = self getcurrentweapon();
		if ( (weapon == "binoculars_artillery_mp" || weapon == "binoculars_artillery_s_mp" || weapon == "binoculars_mp" ) && self isads() && self maps\mp\gametypes\_anarchic::isstand())
		{
			wait 0.6;
			self.place_obj = newclienthudelem(self);
			self.place_obj.x = 320;
			self.place_obj.y = 415;
			self.place_obj.alignx = "center";
			self.place_obj.aligny = "middle";
			self.place_obj.fontscale = 0.9;
			self.place_obj.color = (1, 1, 1);
			self.place_obj setText(game["obj_str"]);

			self thread binoc_exit();
			self thread waitforusebutton();
			self waittill("obj_usebutton");

			if (self.use_pressed) // then set the objective
				self thread setobjectivepoint();

			self.place_obj destroy();
			if (self.use_pressed) wait 2;
		}
		wait 0.5;
	}
	
}
// maybe have some sort of lock-on feature?
setobjectivepoint()
{
	self endon("death");
	self endon("player_died");
	self endon("left_squad");
	if(isdefined(self.eyemarker))
	{
		self.eyemarker unlink();
		self.eyemarker delete();
	}
	self.eyemarker = spawn("script_origin",(0,0,0));
	self.eyemarker linkto (self, "tag_eye", (0,0,0), (0,0,0));

	wait 0.05;
	
	angles = (self.eyemarker.angles[0]+17, self.angles[1], self.angles[2]);
	point = self.eyemarker.origin + vscale(anglestoforward(angles),100000); 
	trace = bullettrace(self.eyemarker.origin,point,false,undefined);
	level.squads[self.pers["team"]][self.squad_id].objective = trace["position"];
	self.eyemarker unlink();
	self.eyemarker delete();
	self iprintln("Objective placed");
	self playsound("zero_in");
	// notify_squad(self.pers["team"], "Objective updated");
}
binoc_exit()
{
	self endon("death");
	self endon("player_died");
	self endon("obj_usebutton");
	while ( (self getcurrentweapon() == "binoculars_artillery_mp" || self getcurrentweapon() == "binoculars_mp") 
		&& self isads() 
		&& self maps\mp\gametypes\_anarchic::isstand())
			wait 0.05;
	self notify("obj_usebutton");
}
waitforusebutton()
{
	self endon("death");
	self endon("player_died");
	self endon("obj_usebutton");
	self.use_pressed = false;
	while (!self usebuttonpressed())
		wait 0.1;
	self.use_pressed = true;
	self notify ("obj_usebutton");
}
namebycolor(squad_id)
{
	switch(squad_id) {
		case 0:
			return "^4BLUE Squad^7";
		case 1:
			return "^1RED Squad^7";
		case 2:
			return "^3YELLOW Squad^7";
		case 3:
			return "^2GREEN Squad^7";
		case 4:
			return "^0BLACK Squad^7";
		case 5:
			return "^5CYAN Squad^7";
		case 6:
			return "^4BLUE Squad^7";
		case 7:
			return "^1RED Squad^7";
		case 8:
			return "^3YELLOW Squad^7";
		case 9:
			return "^2GREEN Squad^7";
		case 10:
			return "^0BLACK Squad^7";
		case 11:
			return "^5CYAN Squad^7";
	}
}
squadicon(squad_id)
{
	switch(squad_id) {
		case 0:
			return game["squad1_headicon"];
		case 1:
			return game["squad2_headicon"];
		case 2:
			return game["squad3_headicon"];
		case 3:
			return game["squad4_headicon"];
		case 4:
			return game["squad5_headicon"];
		case 5:
			return game["squad6_headicon"];
		case 6:
			return game["squad1_headicon"];
		case 7:
			return game["squad2_headicon"];
		case 8:
			return game["squad3_headicon"];
		case 9:
			return game["squad4_headicon"];
		case 10:
			return game["squad5_headicon"];
		case 11:
			return game["squad6_headicon"];
	}
}