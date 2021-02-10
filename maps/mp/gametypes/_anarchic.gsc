// use of this file for anything but anarchic servers means instant death
//
//    -gitman

main() {

	maps\mp\gametypes\_mortars::updateCvars();
	maps\mp\gametypes\_bombers::updateCvars();

	level.mapname 			= getcvar("mapname");
	level.gametype 			= getcvar("g_gametype");

	// Weapons limits cvars
	level.allied_smg		= cvardef("scr_allied_limit_smg", 99, 0, 99, "int");
	level.allied_mg			= cvardef("scr_allied_limit_mg", 99, 0, 99, "int");
	level.allied_sniper		= cvardef("scr_allied_limit_sniper", 99, 0, 99, "int");
	level.allied_lmg		= cvardef("scr_allied_limit_lmg", 99, 0, 99, "int");
	level.allied_rocket		= cvardef("scr_allied_limit_rocket", 99, 0, 99, "int");
	level.allied_flame		= cvardef("scr_allied_limit_flamethrower", 99, 0, 99, "int");
	level.axis_smg			= cvardef("scr_axis_limit_smg", 99, 0, 99, "int");
	level.axis_mg			= cvardef("scr_axis_limit_mg", 99, 0, 99, "int");
	level.axis_sniper		= cvardef("scr_axis_limit_sniper", 99, 0, 99, "int");
	level.axis_lmg			= cvardef("scr_axis_limit_lmg", 99, 0, 99, "int");
	level.axis_rocket		= cvardef("scr_axis_limit_rocket", 99, 0, 99, "int");
	level.axis_flame		= cvardef("scr_axis_limit_flamethrower", 99, 0, 99, "int");
	level.brit_silenced		= cvardef("scr_brit_limit_sten_silenced", 99, 0, 99, "int");

	// hud, messages
	level.disable_announce		= cvardef("scr_disable_announce", 0, 0, 1, "int");
	level.disableobits		= cvardef("scr_disable_announce_obituary", 0, 0, 1, "int");
	level.show_clockup		= cvardef("scr_show_hud_clockup", 0, 0, 1, "int");
	level.show_modhud		= cvardef("scr_show_modhud", 1, 0, 1, "int");
	level.modstr			= &"^9anarchicmod^12.0^7 - http://www.anarchic-x.com";
	level.notify_timeleft 		= cvardef("scr_notify_timeleft", 0, 0, 1, "int");
	level.notify_every 		= cvardef("scr_notify_timeleft_freq", 5, 1, 99, "int");
	level.nocrosshairs		= cvardef("scr_disable_crosshairs", 0, 0, 1, "int");
	level.nocrosshairnames		= cvardef("scr_disable_crosshair_names", 0, 0, 1, "int");
	level.nohud			= cvardef("scr_disable_hud", 0, 0, 1, "int");
	level.show_ratio		= cvardef("scr_show_hud_ratio", 0, 0, 1, "int");
	level.show_kdhud		= cvardef("scr_show_hud_score", 0, 0, 1, "int");
	level.nextmap_display		= cvardef("scr_show_nextmap", 1, 0, 1, "int");
	level.nextmap_delay		= cvardef("scr_show_nextmap_delay", 120, 60, 900, "int");
	level.onjoin_message		= getCvar("scr_onjoin_message");
	level.arty_timer		= cvardef("scr_show_artillery_timer", 1, 0, 1, "int");
	level.show_headshots		= cvardef("scr_show_headshots", 1, 0, 1, "int");
	level.show_melees		= cvardef("scr_show_melees", 1, 0, 1, "int");
	level.show_avglife		= cvardef("scr_show_avglife", 1, 0, 1, "int");


	level.awe_mapvote 		= cvardef("awe_map_vote", 0, 0, 1, "int");
	level.awe_mapvotetime		= cvardef("awe_map_vote_time", 20, 10, 180, "int");

	// gameplay, player
	level.spawn_assist		= cvardef("scr_spawn_assist", 0, 0, 99, "int");
	level.disable_tracers		= cvardef("scr_disable_tracers", 0, 0, 1, "int");
	level.tripFoot			= cvardef("scr_trip_foot_shot", 0, 0, 1, "int");
	level.tripLeg			= cvardef("scr_trip_leg_shot", 0, 0, 1, "int");
	level.droparm			= cvardef("scr_dropweapon_arm_shot", 0, 0, 1, "int");
	level.drophand			= cvardef("scr_dropweapon_hand_shot", 0, 0, 1, "int");
	level.tank_postdamage		= cvardef("scr_vehicle_postdamage", 1, 0, 1, "int");
	level.artillery_rank		= cvardef("scr_artillery_rank", 4, 0, 4, "int");
	level.bas_flak_damage		= cvardef("scr_bas_flak_damage", 1, 0, 1, "int");
	level.breath_fx			= cvardef("scr_breath_fx", 0, 0, 1, "int");
	level.nade_warn			= cvardef("scr_nade_warn", 0, 0, 1, "int");
	level.body_search		= cvardef("scr_bodysearch", 0, 0, 1, "int");
	level.painsounds 		= cvardef("scr_painsounds", 0, 0, 1, "int");
	level.coughsound		= cvardef("scr_coughsounds", 0, 0, 1, "int");
	level.heartbeat			= cvardef("scr_heartbeat", 0, 0, 1, "int");
	level.helmetpop			= cvardef("scr_helmetpop", 0, 0, 1, "int");
	level.rifles_only		= cvardef("scr_rifles_only", 0, 0, 1, "int");
	level.allow_secondary		= cvardef("scr_allow_secondary", 0, 0, 1, "int");
	level.medics			= cvardef("scr_medics", 0, 0, 1, "int");
	level.weapon_exhange		= cvardef("scr_weapon_exchange", 0, 0, 1, "int");
	level.admin_skins		= cvardef("scr_admin_skins", 1, 0, 1, "int");
	level.anarchic_balance		= cvardef("scr_ax_autobalance", 1, 0, 1, "int");
	level.antiflop			= cvardef("scr_antiflop", 1, 0, 1, "int");
	level.squadplay			= cvardef("scr_squadplay", 0, 0, 1, "int");

	// client
	level.forcerate			= cvardef("scr_force_rate", 25000, 2500, 25000, "int");
	level.rename_unknown		= cvardef("scr_rename_unknown_soldier", 0, 0, 1, "int");
	level.rename_unknown_prefix 	= getCvar("scr_rename_unknown_soldier_prefix");
	if (level.rename_unknown_prefix == "")
		level.rename_unknown_prefix = "^2unknown_soldier";
	level.forcedownload		= cvardef("scr_force_autodownload", 1, 0, 1, "int");
	level.cod_headicons		= cvardef("scr_use_cod_headicons", 1, 0, 1, "int");

	level.ex_ask_msg 		= &"^7Hold USE [{+activate}] to exchange weapons with teammate";
	level.ex_rec_msg 		= &"^7Teammate asking to exchange weapons, press USE [{+activate}]";
	level.ex_hint 			= "gfx/icons/hint_usable.dds";
	level.search_msg1 		= &"^7Hold [{+melee}] to";
	level.search_msg2 		= &"^7search the body for ammo";
	level.smokescreen_msg		= &"Press [{+melee}] for 1 second to set a smokescreen";
	level.str_colon 		= &":";

	if (isdefined(level.timelimit))
		level.max_time = level.timelimit;
	else level.max_time = getcvarint("scr_tdm_timelimit");

	level.time_current = 0;

	level.sky_flashes		= cvardef("scr_skyflashes", 0, 0, 99, "int");
	level.sky_flashes_delay_min	= cvardef("scr_skyflashes_delay_min", 0, 0, 99, "int");
	level.sky_flashes_delay_max	= cvardef("scr_skyflashes_delay_max", 5, 0, 99, "int");
	if (level.sky_flashes > 0) {
		level._effect["flash"][0] = loadfx("fx/atmosphere/longrangeflash_altocloud.efx");
		level._effect["flash"][1] = loadfx("fx/atmosphere/overhill_flash.efx");
		level._effect["flash"][2] = loadfx("fx/atmosphere/thunderhead.efx");
		level._effect["flash"][3] = loadfx("fx/atmosphere/stalin_skyflash.efx");
		level._effect["flash"][4] = loadfx("fx/pi_fx/lightning_sky.efx");
		level._effect["flash"][5] = loadfx("fx/pi_fx/lightning_sky_base.efx");
		level._effect["flash"][6] = loadfx("fx/atmosphere/thunderhead.efx");
	}

	level.use_raviradmin 		= cvardef("scr_use_raviradmin", 1, 0, 1, "int");
	if (level.use_raviradmin == 1) {
		level._effect["bombfire"] = loadfx("fx/explosions/explosion1_heavy.efx");
		level._effect["bombsmite"] = loadfx("fx/explosions/mp_bomb.efx");
	}
	level._effect["smkscrn"] = loadfx("fx/smoke/smoke_grenade.fx");

	// six objectives in bas
	level.camper_pos_id = 7;
	level.anarchic_debug = getcvarint("anarchic_debug");
	spawnpointsbygametype();

	maps\mp\gametypes\_squads::main();
}

Callback_StartGameType() {
	if (level.awe_mapvote) {
		level.mapvotetext["MapVote"]	= &"Press ^2FIRE^7 [{+attack}] to vote!          Votes";
		level.mapvotetext["TimeLeft"]	= &"Time Left: ";
		level.mapvotetext["MapVoteHeader"] = &"Next Map Vote";
	}
	if(!isDefined(game["gamestarted"])) {
		precacheString(level.modstr);

		if (level.awe_mapvote) {
			PrecacheString(level.mapvotetext["MapVote"]);
			PrecacheString(level.mapvotetext["TimeLeft"]);
			PrecacheString(level.mapvotetext["MapVoteHeader"]);
			PrecacheShader("white");
		}

		if (level.admin_skins) { 
			precacheModel("xmodel/basehead_a_11");
			precacheModel("xmodel/basehead2_a_11");
			precacheModel("xmodel/basehead3_a_11");
			precacheModel("xmodel/basehead4_11");
			precacheModel("xmodel/basehead5_a_11");
			precacheModel("xmodel/gear_US_helmet_scrim");

			if (game["german_soldiertype"] == "fallschirmjagergrey") {
				precacheModel("xmodel/gear_german_hat_officer_falshrm");
				precacheModel("xmodel/gear_german_mp40_falshrm");
				precacheModel("xmodel/gear_german_load3_falshrm");
			}

			if (game["german_soldiertype"] == "wehrmacht")
				precacheModel("xmodel/gear_german_hat_officer_wehr");	

			if (game["allies"] == "british") {
				precacheModel("xmodel/equipment_british_beret_red");
				precacheModel("xmodel/gear_british_air");
				precacheModel("xmodel/head_Price");
			}
		}
		if (level.body_search == 1) {
			precacheShader("black");
			precacheShader("white");
			precacheShader(level.ex_hint);
			precacheString(level.search_msg1);
			precacheString(level.search_msg2);
		}
		precacheString(level.smokescreen_msg);

		if (level.weapon_exhange == 1) {
			precacheShader(level.ex_hint);
			precacheString(level.ex_ask_msg);
			precacheString(level.ex_rec_msg);
		}

		if (level.sky_flashes > 0)
			precacheModel("xmodel/mp_bomb1");

		if (level.show_headshots == 1)
		{
			game["headshot_icon"] = "gfx/hud/death_headshot.dds";
			precacheShader(game["headshot_icon"]);
		}
		if (level.show_melees == 1)
		{
			game["melee_icon"] = "gfx/hud/death_melee.dds";
			precacheShader(game["melee_icon"]);
		}

		//precacheString(&"^2Ratio:");
		//precacheString(&"^7-----");

		precacheString(level.str_colon);
		precacheString(&"/");
		precacheShader(game["headicon_allies"]);
		precacheShader(game["headicon_axis"]);

		if (level.mapname == "mp_uo_townassault" || level.mapname == "mp_uo_gunassault")
			precacheModel("xmodel/mp_vehicle_panzeriv_camo");
		//if (winterMap() && (level.mapname != "ax_foy") && (game["allies"] == "american" || game["allies"] == "british"))
		//	precacheModel("xmodel/mp_v_us_lnd_willysjeep_snow");

		game["deaths_axis"] = 0;
		game["deaths_allies"] = 0;
		game["kills_axis"] = 0;
		game["kills_allies"] = 0;

		game["camper_icon"] = "gfx/hud/objective.tga";
		//precacheShader(game["camper_icon"]);
		if (level.spawn_assist > 1)
			precacheString(&"AX_SPAWN_ASSIST");
	}

	if (level.medics == 1)
		thread updateMedics();

	findmapdimensions();

	maps\mp\gametypes\_mortars::startMortars();
	maps\mp\gametypes\_bombers::Callback_StartGameType();
	maps\mp\gametypes\_weaponstash::main();

	thread roundtimer();

	if ((level.nextmap_display == 1) && (level.awe_mapvote == 0))
		thread shownextmap();

	if (level.breath_fx == 1)
		level._effect["breath_fx"] = loadfx ("fx/atmosphere/cold_breath.efx");

	nightMap();

	if (level.notify_timeleft == 1)
		thread notify_timeleft1();

	if (level.sky_flashes > 0)
		thread flashes();

	if (level.use_raviradmin == 1) {
		thread switchteam();
		thread killum();
		thread smiteplayer();
		thread forcename();
		thread freezeum();
		thread unfreezeum();
		thread wallops();
	}

	if ((level.show_kdhud == 1) && (level.gametype != "cnq"))
		thread miniscoreboard();

	thread modHud();

	thread setupTRP();

	if (level.mapname == "mp_uo_townassault")
		thread townassault_flak();

	if (level.mapname == "mp_uo_townassault" || level.mapname == "mp_uo_gunassault")
		thread camo_panzeriv();

	thread vehicle_printout();
	thread checksatchels();
	thread idlekick_watch();
	thread messages();
}
messages()
{
	level endon("round_ended");
	servername = getcvar("sv_hostname");

	list = [];

	list[list.size]	  = 	"^3Welcome to ^7" + servername;
	list[list.size] =	"^3We're an official Anarchic-X.com server!";
				//"^3A A A A A A A A A A A A A A A A A A A A ";
	list[list.size] = 	"^3Off-topic chat is frowned upon.";
	list[list.size] = 	"^3Please keep the chatting game-related.";
	list[list.size] = 	"^3Profanity and racism are NOT tolerated.";
	list[list.size] = 	"^3Recruiting & advertising is prohibited.";
	list[list.size] = 	"^3Please go to spectate if you are AFK.";
	list[list.size] = 	"^3Teamspeak server address: anarchic-x.com";
	list[list.size] = 	"^3Check out the download page on our site!";
				//"^3A A A A A A A A A A A A A A A A A A A A ";
	list[list.size] =	"^3Please join us on the community forums!";
	list[list.size] =	"^3Private slots are $7.50/mo! (0.25/day)";
	list[list.size] =	"^3Donations help keep this server alive!";
	list[list.size] =	"^3We accept Paypal, checks, & money orders";
	list[list.size] =	"^3Signup now @ http://slots.anarchic-x.com";
	list[list.size] =	"^3Please add us to your favorites list!";
	list[list.size] = 	"^3We also have Call of Duty 2 servers!";

	for (i=0;i<list.size;i++)
	{
		wait 45;
		iprintln(list[i]);
		if (i == list.size-1)
			i=0;
	}
}

idlekick_watch()
{
	level endon("stop_idlekick_watch");
	wait 0.05;
	if (isdefined(level.roundstarted) && !level.roundstarted)
		return;

	def_in_play = getcvarint("g_inactivity");
	def_in_spec = getcvarint("g_inactivityspectator");
	private_slots = getcvarint("sv_privateclients");
	public_slots = getcvarint("sv_maxclients");
	public_slots = public_slots - private_slots;
	idlekick = false;

	if (public_slots < 0) return; // private slots not setup right 

	if (def_in_play == 0 && def_in_spec == 0)
		return;

	thread idlekickwatch_mapend(def_in_play, def_in_spec);

	for (;;)
	{
		pubcount = 0;

		in_play = getcvarint("g_inactivity");
		in_spec = getcvarint("g_inactivityspectator");

		players = getentarray("player", "classname");
		for (i=0;i<players.size;i++)
		{
			num = players[i] getEntityNumber();
			if (num >= private_slots)
				pubcount++;
		}
		if (pubcount == public_slots) // then we need to kick some people
		{
			if (def_in_play != 0 && def_in_play != in_play)
				setcvar("g_inactivity", def_in_play);
			if (def_in_spec != 0 && def_in_spec != in_spec)
				setcvar("g_inactivityspectator", def_in_spec);
			if (!idlekick) iprintln("^3[*] All public slots filled, idle kicking activated.^7");
			idlekick = true;
		}
		if (pubcount < public_slots)
		{
			if (in_play > 0)
				setcvar("g_inactivity", 0);
			if (in_spec > 0)
				setcvar("g_inactivityspectator", 0);
			idlekick = false;
		}
		wait 15;
	}
}
idlekickwatch_mapend(in_play, in_spec)
{
	level waittill("intermission");
	level notify("stop_idlekick_watch");
	setcvar("g_inactivity", in_play);
	setcvar("g_inactivityspectator", in_spec);
}
checkSatchels()
{
	wait 0.05;
	satchels = getentarray("mpweapon_satchelcharge", "classname");
	if (satchels.size == 0)
		level.satchels_exist = false;
	else level.satchels_exist = true;
}
		
findGround(position, adj) {
	trace = bulletTrace(position + (0, 0, 10), position + (0, 0, -1200), false, undefined);
	ground = trace["position"];
	if (isdefined(adj))
		ground = ground + adj;
	return ground;
}
vehicle_printout() {
	wait 10;
	vehicles = [];
	if (getcvarint("anarchic_debug") == 1) {
		script_vehicles = getentarray ("script_vehicle","classname");
		for (i=0;i<script_vehicles.size;i++) {
			iprintln(script_vehicles[i].vehicletype);
			wait 0.05;
		}
	}
}
townassault_flak() {
	script_vehicles = getentarray ("script_vehicle","classname");
	for (i=0;i<script_vehicles.size;i++)
	{
		if(script_vehicles[i].vehicletype == "Flak88_MP" || script_vehicles[i].vehicletype == "flak88_mp") {
			if (script_vehicles[i].origin == (-4025, 3908, -36))
				script_vehicles[i] delete();
		}
	}
}
camo_panzeriv() {
	tanks = getentarray("script_vehicle","classname");

	for (i=0;i<tanks.size;i++) {
		if (tanks[i].vehicletype == "panzeriv_mp")
			tanks[i] setModel("xmodel/mp_vehicle_panzeriv_camo");
	}
}
getpanzermodel() {
	if (wintermap())
		return "xmodel/mp_vehicle_panzeriv_snow";		

	switch (level.mapname) {
		case "mp_uo_townassault":
		case "mp_uo_gunassault":
			return "xmodel/mp_vehicle_panzeriv_camo";
		default:
			return "xmodel/mp_vehicle_panzeriv";
	}
}
getwillymodel(model) {
	if (wintermap() && (model != "xmodel/mp_v_us_lnd_willysjeep_snow"))
		return "xmodel/mp_v_us_lnd_willysjeep_snow";		
	else return model;
}
gethorchmodel(model) {
	if (wintermap() && (model != "xmodel/mp_vehicle_horch1b"))
		return "xmodel/mp_vehicle_horch1b";		
	else return model;
}
Callback_PlayerConnect() {

	guid = self getGuid();
	if (isdefined(game["matchstarted"]) && game["matchstarted"]) {
		if (isdefined(level.lostplayer) && isdefined(level.lostplayer[guid]))
		{
			self.pers["kills"]	= level.lostplayer[guid].kills;
			self.pers["score"]	= level.lostplayer[guid].score;
			self.pers["deaths"]	= level.lostplayer[guid].deaths;
			self.pers["team"]	= level.lostplayer[guid].team;
			self.pers["headshots"]	= level.lostplayer[guid].headshots;
			self.pers["melees"]	= level.lostplayer[guid].melees;
		}
	}
	if (!isdefined(self.kills))
		self.kills = 0;
	if (!isdefined(self.pers["kills"]))
		self.pers["kills"] = 0;

	self.adminskin = false;
	self.ratio = 00.00;
	self.is_camping = false;
	self.is_searching = false;
	self.choosing_secondary = false;
	self.pers["oldspawnweapon"] = "none";
	self.pers["medic"] = false;
	self.spawn_assist = false;
	if (!isdefined(self.pers["headshots"]))
		self.pers["headshots"] = 0;
	if (!isdefined(self.pers["melees"]))
		self.pers["melees"] = 0;

	if (level.forcedownload == 1)
		self setClientCvar("cl_allowdownload", 1);
	if (level.nocrosshairs == 0)
		self setclientcvar("cg_drawcrosshair", 1);
	if (level.nohud == 0)
		self setclientcvar("cg_drawstatus", 1);
	if (level.forcerate > 0) 
		self setClientCvar("rate", level.forcerate);
	if ( (getcvar("scr_rifles_only") == "1") && (level.disable_tracers == 1) )
		self setClientCvar("cg_tracerchance", 0);
	self setClientCvar("cl_maxpackets", 30);
	self setClientCvar("cg_chattime", "12000");
	self checkName();
	self thread monitorHud();
	if (level.satchels_exist)
		self thread zero_satchel();
}
smokescreen()
{
	self endon("deactivated_player");
	self endon("death");
	self endon("player_died");
	while (self getweaponslotammo("smokegrenade") > 0)
	{
		if (!isdefined(self.smokescreen_use) && !isdefined(self.smokescreen_icon))
		{
			self smokescreen_hud();
			self thread smokescreen_hud_fade_fx();
		}
		i = 0;
		while (!self meleebuttonpressed())
			wait 0.1;
		while (self meleebuttonpressed() && i < 1.0)
		{
			i += 0.1;
			wait 0.1;
		}
		if (i<1) continue;
		self notify("stop_fade");
		self.smokescreen_use.alpha = 0.0;
		self.smokescreen_icon.alpha = 0.0;
		count = self getweaponslotammo("smokegrenade");
		self setweaponslotammo("smokegrenade", (count-1));
		count -= 1;
		if (count == 0)
		{
			self takeweapon("smokegrenade_mp");
			self iprintln("Smoke grenade ammo depleted.");
		}
		tank = self.vehicle;
		pos = maps\mp\gametypes\_weaponstash::findground(tank.origin);
		pos = pos + (0,0,-15);
		tank playsound("smokegrenade_explode");
		playfx(level._effect["smkscrn"], pos);
		wait 15;
		self thread smokescreen_hud_fade_fx();
	}
}
smokescreen_hud_fade_fx()
{
	self endon("stop_fade");
	self endon("deactivated_player");
	self endon("death");
	self endon("player_died");
	while (1)
	{	
		self.smokescreen_use fadeovertime(1.75);
		self.smokescreen_use.alpha = 0.7;

		self.smokescreen_icon fadeovertime(1.75);
		self.smokescreen_icon.alpha = 0.7;

		wait 1.75;

		self.smokescreen_use fadeovertime(1.75);
		self.smokescreen_use.alpha = 0;

		self.smokescreen_icon fadeovertime(1.75);
		self.smokescreen_icon.alpha = 0;

		wait 3;

	}
}
smokescreen_hud()
{
	if (isdefined(self.smokescreen_use))
		self.smokescreen_use destroy();
	if (isdefined(self.smokescreen_icon))
		self.smokescreen_icon destroy();
	
	self.smokescreen_use = newClientHudElem(self);
	self.smokescreen_use.archived = false;
	self.smokescreen_use.alignX = "center";
	self.smokescreen_use.alignY = "middle";
	self.smokescreen_use.x = 320;
	self.smokescreen_use.y = 435;
	self.smokescreen_use.alpha = 0;
	self.smokescreen_use.fontScale = 0.75;
	self.smokescreen_use.color = (1, 1, 1);
	self.smokescreen_use.sort = 1;
	self.smokescreen_use setText(level.smokescreen_msg);

	self.smokescreen_icon = newClientHudElem( self );
	self.smokescreen_icon.archived = false;
	self.smokescreen_icon.alignX = "center";
	self.smokescreen_icon.alignY = "middle";
	self.smokescreen_icon.x = 320;
	self.smokescreen_icon.y = 418;
	self.smokescreen_icon.alpha = 0;
	self.smokescreen_icon setShader(level.ex_hint, 24, 24);
}

rememberinfo(player)
{
	if (level.gametype != "bas")
		return;
	if (isdefined(game["matchstarted"]) && !game["matchstarted"])
		return;
	if (!isdefined(player.pers["team"]) || !isdefined(player.deaths) || !isdefined(player.pers["score"]) || !isdefined(player.pers["kills"]))
		return;
	if (!isdefined(level.lostplayer))
		level.lostplayer = [];

	guid = player getGuid();
	if (isdefined(level.lostplayer[guid]))
		level.lostplayer[guid] = undefined;
	level.lostplayer[guid] = spawnstruct();
	level.lostplayer[guid].team = player.pers["team"];
	level.lostplayer[guid].score = player.pers["score"];
	level.lostplayer[guid].kills = player.pers["kills"];
	level.lostplayer[guid].headshots = player.pers["headshots"];
	level.lostplayer[guid].melees = player.pers["melees"];
	level.lostplayer[guid].deaths = player.deaths;
	level thread timedundefined(guid, 600);
}
timedundefined(idx, time)
{
	wait time;
	level.lostplayer[idx] = undefined;
}
clearotherspawns() {
	if (level.gametype != "bas")
		return;

	spawns = getentarray("mp_teamdeathmatch_spawn", "classname");
	for (i=0;i<spawns.size;i++)
		spawn[i] delete();

	spawns = getentarray("mp_deathmatch_spawn", "classname");
	for (i=0;i<spawns.size;i++)
		spawn[i] delete();
}

showents() {
	wait 15;
	while (1) {
		ents = getentarray();
		for (i=0;i<ents.size;i++) {
			num = ents[i] getEntityNumber();
			if (isdefined(ents[i].classname)) {
				self iprintln("^1num:^7 " + num + ", ^1classname:^7 " + ents[i].classname);
				logPrint("num: " + num + ", classname: " + ents[i].classname + "\n");
			}
			wait 0.05;
		}
		self iprintln("^2Total ents:^7" + ents.size);
		wait 45;
	}
}

Callback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc) {

	if ( isPlayer(eAttacker) && (self != eAttacker) && (self.pers["team"] == eAttacker.pers["team"]) ) {
		if (level.friendlyfire == 1)
			hitfx = true;	// if ff is on, always do fx
		else hitfx = false;
	}
	else hitfx = true; // not a friendly, so do the fx

	if (sMeansOfDeath == "MOD_RIFLE_BULLET" || sMeansOfDeath == "MOD_PISTOL_BULLET") { // only bullets

		switch(sHitLoc) {
			case "right_arm_upper":
			case "right_arm_lower":
			case "left_arm_upper":
			case "left_arm_lower":
				if ((level.droparm == 1) && (randomint(10) < 5) && (hitfx))
					self dropItem(self getcurrentweapon());
				break;
			case "right_hand":
			case "left_hand":
			case "gun":
				if ((level.drophand == 1) && (randomint(2) == 1) && (hitfx))
					self dropItem(self getcurrentweapon());
				break;
			case "right_leg_lower":
			case "left_leg_lower":
				if ((level.tripleg == 1) && (hitfx))
					self setClientCvar("cl_stance", "2");
				break;
			case "right_foot":
			case "left_foot":
				if ((level.tripfoot == 1) && (hitfx))
					self setstance("prone");
				break;
			case "helmet":
			case "head":
				if ((level.helmetpop == 1) && (randomint(2) == 1) && (hitfx))
					popHelmet(vDir, iDamage);
				break;
		}
	}


	if ((level.painsounds == 1) && (self.health > iDamage))
		self thread painsound();
	if (isPistol(sWeapon) && sHitLoc == "head")
		level.anarchic_idamage = idamage * 2;
	else level.anarchic_idamage = idamage;
}
getdamage(iDamage, sMeansOfDeath, eAttacker, sWeapon)
{
	self devprint(sMeansOfDeath);

	mod_nade	= 0.15;
	mod_satchel	= 0.05;
	mod_bullet	= 0.50;
	mod_hop		= 0.10;
	mod_artillery	= 0.10;
	mod_projectile	= 0.30;

	if (self.spawn_assist)
	{
		switch(sMeansOfDeath) {
			case "MOD_EXPLOSIVE":
			case "MOD_GRENADE_SPLASH":
				if (sweapon == "satchelcharge_mp")
					mod = mod_satchel;
				else mod = mod_nade;
				break;
			case "MOD_ARTILLERY_SPLASH":
				mod = mod_artillery;
				break;
			case "MOD_PROJECTILE_SPLASH":
				mod = mod_projectile;
				break;
			case "MOD_RIFLE_BULLET":
			case "MOD_PISTOL_BULLET":
				mod = mod_bullet;
				break;
			default:
				mod = 1;
		}
		iDamage = iDamage * mod;
	}
	/*
	if (isdefined(eattacker))
		if (eAttacker.hopping && !isturret(sWeapon) && (sMeansOfDeath == "MOD_RIFLE_BULLET" || sMeansOfDeath == "MOD_PISTOL_BULLET"))
		{
			iDamage = iDamage * mod_hop;
		}
	*/
	return (int)iDamage;
}
injuredsound() {
	if (self.injured_sound)
		return;
	self playsound("injured");
	self.injured_sound = true;
	wait (6 + randomintrange(10,30));
	self.injured_sound = false;
}

Callback_PlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc) {

	self notify("player_died");
	self notify("stop_fade");

	if (isdefined(self.smokescreen_use))
		self.smokescreen_use destroy();
	if (isdefined(self.smokescreen_icon))
		self.smokescreen_icon destroy();	

	if ((!isvalidplayer(attacker)) || (!isdefined(attacker.pers["kills"])))
		return;

	if (isPlayer(attacker)) {
		if (attacker == self) {
			if (!isdefined (self.autobalance))
				attacker.pers["kills"]--;
		}
		else {
			if (self.pers["team"] == attacker.pers["team"]) // killed by a friendly
				attacker.pers["kills"]--;
			else {
				t = "kills_" + attacker.pers["team"];
				if (isdefined(game[t]))
					game[t]++;
				attacker.pers["kills"]++;
				if(sHitLoc == "head" && (sMeansOfDeath == "MOD_RIFLE_BULLET" || sMeansOfDeath == "MOD_PISTOL_BULLET"))
					attacker.pers["headshots"]++;
				if (sMeansOfDeath == "MOD_MELEE")
					attacker.pers["melees"]++;

			}
		}
	}
	else self.pers["kills"]--; // If you weren't killed by a player, you were in the wrong place at the wrong time

	if (isdefined(self.pers["team"]) && (self.pers["team"] != "spectator") && (isdefined(game["deaths_allies"])) && (isdefined(game["deaths_axis"]))) {
		s = "deaths_" + self.pers["team"];
		game[s]++;
	}

	if (level.body_search == 1) {
		self.ammo_pack = self makeAmmoPack();
		self search_cleanup();
	}

	if (getcvarint("anarchic_debug") == 1) {
		if (isdefined(eInflictor))
			iprintln("eInflictor: " + eInflictor.model);
		if (isdefined(attacker))
			iprintln("attacker: " + attacker.name);
		if (isdefined(attacker.pers["team"]))
			iprintln("attacker.team: " + attacker.pers["team"]);
		if (isdefined(sMeansOfDeath))	
			iprintln("sMeansOfDeath: " + sMeansOfDeath);
		if (isdefined(sWeapon))
			iprintln("sWeapon: " + sWeapon);
	}
	if (isdefined(self.arty_timer))
		self.arty_timer destroy();
	self spawn_assist_hud_destroy();
//	if (level.gametype == "bas" && !level.killcam)
//		if (sMeansOfDeath != "MOD_SUICIDE" && sWeapon != "none")
//			self deathbars();
	self.vehicle = undefined;

}
prespawn() {
	checkSnipers();
}
spawnPlayer() {

	if (!isdefined(self.seen_onjoin))
		self.seen_onjoin = false;
	if ((level.onjoin_message != "") && (!self.seen_onjoin))
		self do_onjoin();

	self adminskin();

	self.planting = 0;
	self.defusing = 0;

	self.helmet_popped = false;
	self.is_searching = false;
	self.maxspeed = getcvarint("g_speed");

	if (winterMap() && (level.breath_fx == 1))
		self thread breath_fx();
	if (level.coughsound == 1)
		self thread coughing();
	if (level.nade_warn == 1)
		self thread nadewarn();
	if (level.weapon_exhange == 1)
		self thread weapon_exchange();
	if (level.heartbeat == 1)
		self thread heartbeat();

	if ((level.show_kdhud == 1) && (level.gametype != "cnq"))
		self thread miniscore_myscore();

	checkSnipers();

	self maps\mp\gametypes\_anarchic::secondary_weapon();

	if (level.medics == 1)
		self thread healteammate();

	//self thread lifeloop();
	if (level.gametype == "bas")
		self thread rocket_nosprint();
	self thread antiflop();
	self thread spawn_assist();
	self thread maps\mp\gametypes\_squads::squadspawn();
	//self thread knife();
//	if (level.gametype == "bas" && !level.killcam)
//		self deathbars_fade();
	
	// avglife
	if (level.show_avglife)
	{
		self update_avglife();
		self thread lifecount();
	}
}
lifecount()
{
	self endon("death");
	self endon("player_died");

	self.pers["lifetime"] = 0;
	while (1)
	{
		wait 1;
		self.pers["lifetime"]++;
	}
}
update_avglife()
{
	if (self.deaths < 1 || !isdefined(self.pers["lifetime"]))
		return;

	if (!isdefined(self.pers["avglife"]))
		self.pers["avglife"] = 0;

	self.pers["avglife"] += self.pers["lifetime"];

	s_per_death = self.pers["avglife"] / self.deaths;
	mins = s_per_death / 60;
	secs = s_per_death & 60;

	self.hud_avglife_c.alpha = 1;
	self.hud_avglife_m.alpha = 1;

	self.hud_avglife_m setValue(mins);

	if (secs > 9)
	{
		self.hud_avglife_z.alpha = 0;
		self.hud_avglife_zs.alpha = 0;
		self.hud_avglife_s.alpha = 1;
		self.hud_avglife_s setValue(secs);
	}
	else
	{
		self.hud_avglife_z.alpha = 1;
		self.hud_avglife_zs.alpha = 1;
		self.hud_avglife_s.alpha = 0;
		self.hud_avglife_z setValue(0);
		self.hud_avglife_zs setValue(secs);
	}	
}
deathbars_fade()
{
	if (!isdefined(self.db_bottombar) || !isdefined(self.db_topbar))
		return;
	self thread db_top_fade();
	self thread db_bottom_fade();
	self thread deathbars_destroy();
}
db_top_fade()
{
	if (isdefined(self.db_topbar))
	{
		self.db_topbar fadeovertime(1.5);
		self.db_topbar.alpha = 0;
	}
}
db_bottom_fade()
{
	if (isdefined(self.db_bottombar))
	{
		self.db_bottombar fadeovertime(1.5);
		self.db_bottombar.alpha = 0;

	}
}
deathbars_destroy()
{
	wait 1.5;
	if (isdefined(self.db_topbar))
		self.db_topbar destroy();
	if (isdefined(self.db_bottombar))
		self.db_bottombar destroy();
}
deathbars()
{
	if(!isDefined(self.db_topbar))
	{
		self.db_topbar = newClientHudElem(self);
		self.db_topbar.archived = false;
		self.db_topbar.x = 0;
		self.db_topbar.y = 0;
		self.db_topbar.alpha = 0;
		self.db_topbar.sort = 0.9;
		self.db_topbar setShader("black", 640, 112);
		self.db_topbar fadeovertime(2);
		self.db_topbar.alpha = 1;

	}

	if(!isDefined(self.db_bottombar))
	{
		self.db_bottombar = newClientHudElem(self);
		self.db_bottombar.archived = false;
		self.db_bottombar.x = 0;
		self.db_bottombar.y = 368;
		self.db_bottombar.alpha = 0;
		self.db_bottombar.sort = 0.9;
		self.db_bottombar setShader("black", 640, 112);
		self.db_bottombar fadeovertime(2);
		self.db_bottombar.alpha = 1;
	}

}
knife()
{
	for (;;)
	{
		wait 0.05;
		weapon = self getcurrentweapon();
		if (!ispistol(weapon))
			continue;
		else
		{
			iprintln("Press F to switch to pistol");
			buttonpressed = false;
			while (!buttonpressed)
			{
				wait 0.05;
				if (self usebuttonpressed())
					buttonpressed = true;
			}
			// now switch to the knife
			self.pistol = weapon;
			self.pistol_ammo = self getweaponslotammo("pistol");
			self.pistol_ammo_clip = self getweaponslotclipammo("pistol");

			self takeWeapon(weapon);
			self setweaponslotweapon("pistol", "ranger_knife_mp");
			self setweaponslotammo("pistol", 80);
			self switchtoweapon("ranger_knife_mp");
		}
		if ((self getcurrentweapon()) == "ranger_knife_mp")
			break;
	}
}
				
spawn_assist()
{
	self endon("player_died");

	if (level.spawn_assist <= 0)
		return;

	self.spawn_assist = true;
	self thread spawn_assist_hud();
	wait level.spawn_assist;
	if (isplayer(self))
		self.spawn_assist = false;
	self spawn_assist_hud_destroy();
}
spawn_assist_hud() 
{
	if (!isdefined(self.spawn_assist_display_title)) {
		self.spawn_assist_display_title	= newClientHudElem(self);
		self.spawn_assist_display_title.x = 275;
		self.spawn_assist_display_title.y = 427;
		self.spawn_assist_display_title.alignx = "left";
		self.spawn_assist_display_title.aligny = "top";
		self.spawn_assist_display_title.font = "default";
		self.spawn_assist_display_title.fontscale = 0.8;
		self.spawn_assist_display_title.archived = false;
		self.spawn_assist_display_title.color = (1, 1, 1);
		self.spawn_assist_display_title setText(&"AX_SPAWN_ASSIST");
	}
	if (!isdefined(self.spawn_assist_display_sec)) {
		self.spawn_assist_display_sec = newClientHudElem(self);
		self.spawn_assist_display_sec.x = 335;
		self.spawn_assist_display_sec.y = 427;
		self.spawn_assist_display_sec.alignx = "left";
		self.spawn_assist_display_sec.aligny = "top";
		self.spawn_assist_display_sec.font = "default";
		self.spawn_assist_display_sec.fontscale = 0.8;
		self.spawn_assist_display_sec.archived = false;
		self.spawn_assist_display_sec.color = (1, 0, 0);
		self.spawn_assist_display_sec setTimer(level.spawn_assist);
	}
}
spawn_assist_hud_destroy()
{
	if (isdefined(self.spawn_assist_display_title))
		self.spawn_assist_display_title destroy();
	if (isdefined(self.spawn_assist_display_sec))
		self.spawn_assist_display_sec destroy();

}
rocket_nosprint()
{
	self endon("player_died");
	self endon("spawned");
	self.using_rocket = false;
	for (;;)
	{
		wait 0.5;
		if ( !isalive(self) || !isplayer(self) || self isInVehicle() || self.sessionstate != "playing" )
			continue;
		switch(self getcurrentweapon()) {
			case "panzerschreck_mp":
			case "bazooka_mp":
			case "panzerfaust_mp":
				if (!self.using_rocket) {
					oldFatigue = self getFatigue();
					self.using_rocket = true;
				}
				self setFatigue(0.0);
				break;
			default:
				if (self.using_rocket) {
					self.using_rocket = false;
					self setFatigue(oldFatigue);
				}
		}
	}
}
bombaction()
{
	if (isdefined(self.planting) && self.planting)
		return true;
	if (isdefined(self.defusing) && self.defusing)
		return true;
	else return false;
}
antiflop() {
	self endon("player_died");
	self endon("spawned");

	if (level.antiflop != 1)
		return;
	self.is_prone = self isProne();
	self.prior_stance = self getstance();

	while (1) {
		wait 0.05;
		if ( !isalive(self) || !isplayer(self) || self isInVehicle() || self.sessionstate != "playing" )
			continue;
		if ((!self.is_prone) && (self isProne())) { // just went prone
			current = self getcurrentweapon();
			primary = self getWeaponSlotWeapon("primary");
			primaryb = self getWeaponSlotWeapon("primaryb");

			if (current == primary)
				reloading = self getWeaponSlotClipAmmo("primary");
			else if (current == primaryb)
				reloading = self getWeaponSlotClipAmmo("primaryb");
			else reloading = 0;

			if ((reloading != 0) && (!self isScoped())) {
				switch (self.prior_stance) {
					case "stand":
						self disableweapon();
						wait 0.6;
						break;
					case "crouch":
						wait 0.0;
						break;
					default:
						break;
				}
				if (!self bombaction())
					self enableweapon();
			}
		}
		self.is_prone = self isProne();
		if (!self.is_prone)
			self.prior_stance = self getstance();
	}
}
breath_fx() {
	self endon("player_died");
	self endon("spawned");
	while (1) {
		wait 0.05;
		if ( !isalive(self) || !isplayer(self) || self isInVehicle() || self.sessionstate != "playing" )
			continue;
	
		playfxontag (level._effect["breath_fx"], self, "Bip01 Head");
		wait 2;
	}
}
coughing() {
	self endon("spawned");
	self.coughing = false;
	while (1) {
		wait 4.5;
		if (!isalive(self) || !isplayer(self))
			continue;
	
		if ((self.health < 50) && (!self.coughing) && (self getStance() != "sprint") && (!isdefined(self.painsound))) {
			self playsound("cough");
			self.coughing = true;
			wait(randomintrange(15,45));
			self.coughing = false;
		}
	}
}
heartbeat() {
	self endon("spawned");
	while (1) {
		//wait 0.738;
		wait 0.898;
		if (!isalive(self) || !isplayer(self))
			continue;

		if (self.health < 25)
			self playlocalsound("heartbeat");
	}
}
nadewarn() {
	self endon("spawned");
	i = 0;
	while (1) {
		wait 0.1;
		if ( !isalive(self) 
			|| !isplayer(self) 
			|| self isInVehicle() 
			|| self.sessionstate != "playing" 
			|| !isGrenade(self getcurrentweapon())
			|| !self attackbuttonpressed()
		)
			continue;

		while ( self attackbuttonpressed() && isGrenade(self getcurrentweapon()) ) {
			if (i > 1)
				break;
			i += 0.05;
			wait 0.05;
		}

		wait randomfloatrange(0.3,0.7);
		if (self closestTeammate() < 300) {
			if ( randomint(2) > 0 )
				self playsound(self getnadesound());
			//else iprintln("randomint was 1");
		}
		//else iprintln(self closestTeammate());
		
		while ( self attackbuttonpressed() && isGrenade(self getcurrentweapon()) ) {
			wait 0.1;
			continue;
		}
	}
}
zero_satchel() {
	while (1) {
		wait 0.5;
		if ( !isalive(self) || !isplayer(self) || self.sessionstate != "playing")
			continue;
		ammo = self getWeaponSlotAmmo("satchel");
		weapon = self getWeaponSlotWeapon("satchel");

		if ((ammo < 1) && (weapon == "satchelcharge_mp"))
			self setWeaponSlotAmmo("satchel", 1);
	}
	self devprint("zero satchel thread ended");
}
lifeLoop()
{
	self endon("player_died");
	self endon("disconnect");

	if (!isdefined(self.oldorigin))
		self.oldorigin = self.origin;
	if (!isdefined(self.pers["distance_travelled"]))
		self.pers["distance_travelled"] = 0;
	if (!isdefined(self.pers["teamproximity"]))
		self.pers["teamproximity"] = 0;
	self.using_rocket = false;
	bubble = 600;
	ammo = 0;

	for(;;)
	{

		if ( !isalive(self) || !isplayer(self) || self.sessionstate != "playing")
			return;

		// DISTANCE TRAVELLED
//		self.oldorigin = self.origin;

		wait 0.3;

//		self.pers["distance_travelled"] += distance(self.origin, self.oldorigin);

		// ZERO SATCHELS
		if (level.satchels_exist)
		{
			ammo = self getWeaponSlotAmmo("satchel");
			weapon = self getWeaponSlotWeapon("satchel");
			if ((ammo < 1) && (weapon == "satchelcharge_mp"))
				self setWeaponSlotAmmo("satchel", 1);
		}


		// TEAMWORKTIME
/*		players = getentarray("player", "classname");
		near = 0;
		for (i=0;i<players.size;i++)
		{
			player = players[i];
			if (player.pers["team"] == self.pers["team"] && distance(player.origin, self.origin) < bubble)
				near++;
		}
		if (near > 0)
			self.pers["teamproximity"] = self.pers["teamproximity"] + near;
*/
		// ROCKET NO SPRINT
		if ( (level.gametype == "bas") && (!self isinvehicle()) )
		{
			switch(self getcurrentweapon()) {
				case "panzerschreck_mp":
				case "bazooka_mp":
				case "panzerfaust_mp":
					if (!self.using_rocket) {
						oldFatigue = self getFatigue();
						self.using_rocket = true;
					}
					self setFatigue(0.0);
					break;
				default:
					if (self.using_rocket) {
						self.using_rocket = false;
						self setFatigue(oldFatigue);
					}
			}
		}


		// G_SPEED
		if (level.anarchic_debug == 1)
			self.maxspeed = getcvar("g_speed");	
	}
}

secondary_weapon()
{
	if (!level.allow_secondary)
		return;

	changed = false;
	switch(level.gametype)
	{
		case "tdm":
		case "dm":
			break;
		default:
			return;
	}

	if (self.pers["oldspawnweapon"] != self.pers["weapon"])
	{
		self.pers["weapon2"] = undefined;
		changed = true;
	}
	if (isdefined(self.pers["weapon2"])) {
		self giveSecondary();
		return;
	}

	self.choosing_secondary = true;

	self setClientCvar("ui_weapontab", "1");

	if(self.pers["team"] == "allies")
		self openMenu(game["menu_weapon_allies"]);
	else if(self.pers["team"] == "axis")
		self openMenu(game["menu_weapon_axis"]);
	for(;;)
	{
		self waittill("menuresponse", menu, response);		
		
		if(response == "open")
			continue;	

		if(response == "close")
		{
			break;
		}	

		if(response == "callvote" || response == "team" || response == "viewmap" )
		{
			break;
		}

		weapon = self maps\mp\gametypes\_teams::restrict_anyteam(response);
		if(weapon == "restricted" || weapon == self.pers["weapon"])
		{
			self openMenu(menu);
			continue;
		}
		else {
			self.pers["weapon2"] = weapon;
			break;
		}
	}
	self closeMenu();
 	wait .1;
	self closeMenu();
	self.choosing_secondary = false;
	self giveSecondary();
	if (changed)
	{
		self.pers["oldspawnweapon"] = self.pers["weapon"];
		changed = false;
	}

}
giveSecondary()
{
	if (!isdefined(self.pers["weapon2"]))
		return;
	clip_size = getfullclipammo(self.pers["weapon2"]);
	ammount = maps\mp\gametypes\_loadout_gmi::GetGunAmmo(self.pers["weapon2"]);

 	self setWeaponSlotWeapon("primaryb", self.pers["weapon2"]);

	//this will only give up to one full clip in the gun
	self setWeaponSlotClipAmmo("primaryb", ammount);
	if ( ammount > clip_size )
		self setWeaponSlotAmmo("primaryb", ammount - clip_size);

	name = getWeaponName(self.pers["weapon2"]);
	if(maps\mp\gametypes\_teams::useAn(self.pers["weapon2"]))
		self iprintln(&"GMI_WEAPON_EQUIPPED_WITH_AN", name);
	else
		self iprintln(&"GMI_WEAPON_EQUIPPED_WITH_A", name);
}

do_onjoin()
{
	if (isdefined(level.roundstarted) && !level.roundstarted)
		return;
	clientAnnouncement(self, "Welcome " + self.name + "^7!");
	clientAnnouncement(self, level.onjoin_message);
	self.seen_onjoin = true;
}
place_spawnpoints() {
	forced = getcvar("g_forced_spawnpoints");
	if (isdefined(forced) && forced != "")
		gt = forced;
	else gt = getcvar("g_Gametype");
	switch(gt) {
		case "tdm":
			spawnpointname = "mp_teamdeathmatch_spawn";
			spawnpoints = getentarray(spawnpointname, "classname");
	
			if(!spawnpoints.size)
			{
				maps\mp\gametypes\_callbacksetup::AbortLevel();
				return;
			}

			for(i = 0; i < spawnpoints.size; i++)
				spawnpoints[i] placeSpawnpoint();
			break;
		case "sd":
			spawnpointname = "mp_searchanddestroy_spawn_allied";
			spawnpoints = getentarray(spawnpointname, "classname");
	
			if(!spawnpoints.size)
			{
				maps\mp\gametypes\_callbacksetup::AbortLevel();
				return;
			}
			for(i = 0; i < spawnpoints.size; i++)
				spawnpoints[i] placeSpawnpoint();

			spawnpointname = "mp_searchanddestroy_spawn_axis";
			spawnpoints = getentarray(spawnpointname, "classname");

			if(!spawnpoints.size)
			{
				maps\mp\gametypes\_callbacksetup::AbortLevel();
				return;
			}

			for(i = 0; i < spawnpoints.size; i++)
				spawnpoints[i] PlaceSpawnpoint();
			break;
	}
}
getspawnpoint(team) {
	forced = getcvar("g_forced_spawnpoints");
	if (isdefined(forced) && forced != "")
		gt = forced;
	else gt = level.gametype;
	switch(gt) {
		case "tdm":
			return "mp_teamdeathmatch_spawn";
		case "sd":
			if(team == "allies")
				return "mp_searchanddestroy_spawn_allied";
			else
				return "mp_searchanddestroy_spawn_axis";
	}
}
getspawnmethod(spawnpoints) {
	forced = getcvar("g_forced_spawnpoints");
	if (isdefined(forced) && forced != "")
		gt = forced;
	else gt = level.gametype;
	switch(gt) {
		case "tdm":
			return maps\mp\gametypes\_spawnlogic11::getSpawnpoint_NearTeam(spawnpoints);
		case "sd":
			return maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);
	}
}
spawnSpectator() {
	self notify("player_died");
}
spawnSpec(origin, angles)
{
	self notify("spawned");
	self notify("player_died");

	resettimeout();

	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.archivetime = 0;
	self.friendlydamage = undefined;

	if(self.pers["team"] == "spectator")
		self.statusicon = "";
	
	if(isDefined(origin) && isDefined(angles))
		self spawn(origin, angles);
	else
	{
         	spawnpointname = level.awe_spawnspectatorname;
		spawnpoints = getentarray(spawnpointname, "classname");
		spawnpoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);
	
		if(isDefined(spawnpoint))
			self spawn(spawnpoint.origin, spawnpoint.angles);
		else
			maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
	}
}
spawnpointsByGametype()
{
	switch(level.gametype)
	{
		case "dm":
			level.awe_spawnalliedname = "mp_deathmatch_spawn";
			level.awe_spawnaxisname = "mp_deathmatch_spawn";
			level.awe_spawnspectatorname = "mp_deathmatch_intermission";
			break;
		case "re":
			level.awe_teamplay = true;
//			level.awe_roundbased = true;
			level.awe_spawnalliedname = "mp_retrieval_spawn_allied";
			level.awe_spawnaxisname = "mp_retrieval_spawn_axis";
			level.awe_spawnspectatorname = "mp_retrieval_intermission";
			break;
		case "sd":

		case "ctf":
			level.awe_teamplay = true;
//			level.awe_roundbased = true;
			level.awe_alternatehud = true;
			level.awe_spawnalliedname = "mp_uo_spawn_allies";
			level.awe_spawnaxisname	= "mp_uo_spawn_axis";
			level.awe_spawnspectatorname = "mp_ctf_intermission";
			break;
		case "dom":
			level.awe_teamplay = true;
//			level.awe_roundbased = true;
			level.awe_alternatehud = true;
			level.awe_spawnalliedname = "mp_uo_spawn_allies";
			level.awe_spawnaxisname	= "mp_uo_spawn_axis";
			level.awe_spawnspectatorname = "mp_dom_intermission";
			break;
		case "bas":
			level.awe_teamplay = true;
//			level.awe_roundbased = true;
			level.awe_alternatehud = true;
			level.awe_spawnalliedname = "mp_gmi_bas_allies_spawn";
			level.awe_spawnaxisname	= "mp_gmi_bas_axis_spawn";
			level.awe_spawnspectatorname = "mp_gmi_bas_intermission";
			break;
		case "cnq":
		case "tdm":
		case "bel":
		case "hq":
		default:
			level.awe_teamplay = true;
			level.awe_spawnalliedname = "mp_teamdeathmatch_spawn";
			level.awe_spawnaxisname = "mp_teamdeathmatch_spawn";
			level.awe_spawnspectatorname = "mp_teamdeathmatch_intermission";
			break;
	}
}

camper_watch() 
{
	self endon("player_died");

	radius = 500;
	timer = 0;
	maxtime = 0.5;	// minutes

	self.is_camping = false;
	bubble = self.origin;

	while (distance(self.origin, bubble) < radius) {
		wait 0.05;
		timer += 0.05;
		if (timer >= (maxtime * 60) && !self nearby_campers(bubble, radius)) {
			self.is_camping = true;
			iprintln(self.name + " is camping");
			break;
		}
	}
	if (self.is_camping)
		self thread camper_notify(bubble, radius);
	else {
		self thread camper_watch();
	}
}
nearby_campers(pos, radius) {
	players = getentarray("player", "classname");
	for (i=0;i<players.size;i++) {
		player = players[i];
		if (self == player)
			continue;
		if (distance(pos, player.origin) < radius) {
			if (player.is_camping) {
				return true;
			}
		}
		else continue;
	}
	return false;
}
camper_notify(pos, radius)
{
	objective_add(level.camper_pos_id, "current", pos, game["camper_icon"]);
	objective_team(level.camper_pos_id, otherTeam(self.pers["team"]));

	if (level.camper_pos_id < 15)	
		level.camper_pos_id++;
	else level.camper_pos_id = 6;	// bas has six objs

	// NEED TO CHECK IF ID IS IN USE

	self.camping_obj_id = level.camper_pos_id;

	// play a sound
	if (otherTeam(self.pers["team"]) == "axis")
	{
		switch(game["allies"]) {
			case "british":
				wav = "anticamp_german_british";
				break;
			case "russian":
				wav = "anticamp_german_russian";
				break;
			case "american":
				wav = "anticamp_german_american";
				break;
		}
	}
	else {
		switch(game["allies"]) {
			case "british":
				wav = "anticamp_british";
				break;
			case "russian":
				wav = "anticamp_russian";
				break;
			case "american":
				wav = "anticamp_american";
				break;
		}
	}	

	players = getentarray("player", "classname");

	for (i = 0; i < players.size; i++)
	{
		player = players[i];
		if (player.pers["team"] == otherTeam(self.pers["team"]) && isAlive(player))
			player playLocalSound(wav);
	}

	self endon("player_killed");

	while (distance(self.origin, pos) < radius) {
		wait 0.05;
		continue;
	}

	// what if we die, the objective never gets deleted? playerkilled?

	objective_delete(self.camping_obj_id);
	self.camping_obj_id = undefined;

	self thread camper_watch();
}	
otherTeam(team) {
	if (team == "allies")
		return "axis";
	else return "allies";
}
adminskin() {
	if (isadmin(self) && (!self.adminskin) && (level.admin_skins == 1)) {
		if ((self.pers["team"] == "allies") && ((game["allies"] == "american") || (game["allies"] == "british"))) {
			self detachAll();

			switch(game["allies"]) {
				case "american":
					self.hatModel = "xmodel/gear_US_helmet_scrim";
					switch(randomint(5)) {
						case 0:
							self.headModel = "xmodel/basehead4_11";
							break;
						case 1:
							self.headModel = "xmodel/basehead_a_11";
							break;
						case 2:
							self.headModel = "xmodel/basehead2_a_11";
							break;
						case 3:
							self.headModel = "xmodel/basehead3_a_11";
							break;
						case 4:
							self.headModel = "xmodel/basehead5_a_11";
							break;
					}
					self attach("xmodel/gear_US_load1");
					self attach("xmodel/gear_US_frntknklknfe");
					self attach("xmodel/gear_US_ammobelt");
					break;
				case "british":
					self.headModel = "xmodel/head_Price";
					self.hatModel = "xmodel/equipment_british_beret_red";
					self attach("xmodel/gear_british_air");
					break;
			}
			self attach(self.hatModel);
			self attach(self.headModel);

			self.pers["savedmodel"] = maps\mp\_utility::saveModel();
			maps\mp\_utility::loadModel(self.pers["savedmodel"]);

			self.adminskin = true;
		}
		else if (self.pers["team"] == "axis") {
			if ((game["german_soldiertype"] == "wehrmacht") && (game["german_soldiervariation"] == "normal")) {
				self detachAll();
				self.hatModel = "xmodel/gear_german_hat_officer_wehr";
				self.headModel = "xmodel/basehead_axis_a_06";
				self attach("xmodel/gear_german_load1_w");
				self attach("xmodel/gear_german_k98_w");
				self attach(self.hatModel);
				self attach(self.headModel);
				self.pers["savedmodel"] = maps\mp\_utility::saveModel();
				maps\mp\_utility::loadModel(self.pers["savedmodel"]);
				self.adminskin = true;
			}
			if ((game["german_soldiertype"] == "fallschirmjagergrey") && (game["german_soldiervariation"] == "normal")) {
				self detachAll();
				self.hatModel = "xmodel/gear_german_hat_officer_falshrm";
				self.headModel = "xmodel/basehead_axis_a_06";
				self attach("xmodel/gear_german_mp40_falshrm");
				self attach("xmodel/gear_german_load3_falshrm");
				self attach(self.hatModel);
				self attach(self.headModel);
				self.pers["savedmodel"] = maps\mp\_utility::saveModel();
				maps\mp\_utility::loadModel(self.pers["savedmodel"]);
				self.adminskin = true;
			}

		}
				
	}
	if (!isadmin(self) && self.adminskin) {
		self.pers["savedmodel"] = undefined;
		self.adminskin = false;
	}
}

endMap() {
	pastrotation();
	if (level.gametype == "bas")
		setCvar("scr_bas_basehealth", "24500");
	if (level.awe_mapvote == 1)
		maps\mp\gametypes\_mapvote::Initialise();
}

updateMedics()
{
	update_wait = 30;
	min_players = 16;
	medic_chance = 0.15;
	
	for (;;)
	{
		wait update_wait;

		count = fCountPlayers();

		if ((count["allies"] + count["axis"]) < min_players)
			continue;

		medic_allied = (int)(count["allies"] * medic_chance);
		medic_axis =  (int)(count["axis"] * medic_chance);

		// rank = 5: self.pers["rank"]
		// distance traveled: self.pers["distance_travelled"]
		// least deaths: self.deaths
		// most time near teammates: self.pers["teamproximity"]

		players = getentarray("player", "classname");

		possible = [];

		for (i=0;i<players.size;i++)
		{
			if (players[i].pers["rank"] == 5) {
				possible[possible.size] = players[i];
				possible[possible.size-1].team = players[i].pers["team"];
			}
		}
		
		
	}
		
}
fCountPlayers()
{
		count["allies"]	= 0.0;
		count["axis"]	= 0.0;

		players = getentarray("player", "classname");

		for (i=0;i<players.size;i++)
		{
			if (players[i].pers["team"] == "axis")
				count["axis"] = count["axis"] + 1.0;
			else if (players[i].pers["team"] == "allies")
				count["allies"] = count["allies"] + 1.0;
		}
		return count;
}

healTeammate() {
	//self availableHP();
	while (isalive(self)) {

		wait 0.5;

		target = undefined;
		skip = false;

		players = getentarray("player", "classname");
	
		for (i = 0; i < players.size; i++) {
			if (players[i] == self)
				continue;
			
			if (players[i].pers["team"] == self.pers["team"]
				&& isalive(players[i])
				&& (players[i].health < 100)
				&& distance(players[i].origin, self.origin) < 48) {

				target = players[i];
				break;
			}
		}
		if (!isdefined(target))
			continue;

		self iprintln("press F to heal");

		self thread waitforusebutton();
		while (!self.usebuttonpressed)
		{
			if (distance(target.origin, self.origin) >= 48)
			{
				skip = true;				
				break;
			}
			wait 0.05;
		}
		if (skip) continue;
		while ((distance(target.origin, self.origin) < 48) && (self usebuttonpressed()) && target.health < 100) {
			target.health += 1;
			wait 0.05;
		}
	}
}
waitforusebutton()
{
	self.usebuttonpressed = false;
	if (self usebuttonpressed())
	{
		while (self usebuttonpressed())
			wait 0.05;
	}
	while (!self usebuttonpressed())
		wait 0.05;
	self.usebuttonpressed = true;
}
	
weapslotinfo() {
	while (1) {
		wait 5;
		iprintln("weapslotammo: " + self getWeaponSlotAmmo("primary"));
		iprintln("weapslotclip: " + self getWeaponSlotClipAmmo("primary"));
	}
}

searchBodyThread(player) {
	self.pack = player.ammo_pack;
	self.id = randomint(10000);
	wait 0.5;
	self thread searchBodyTrigger();
	level thread body_vanish_hud_watch(self);
}
body_vanish_hud_watch(body) {
	id = body.id;
	while (isdefined(body))
		wait 0.05;

	players = getentarray("player", "classname");
	for (i = 0; i < players.size; i++) {
		player = players[i];
		if (!isdefined(player))
			continue;
		if (isalive(player) && (player.is_searching) && (player.is_searching_from == id)) {
			player search_cleanup();
			player notify ("clear_search_hint");
			level notify("body_" + id + "_clear");
		}
			
	}
}
// usage: player thread searchTrigger();
searchTrigger() {
	if (isdefined(self.msg))
		self.msg destroy();
	if (isdefined(self.msg2))
		self.msg2 destroy();
	if (isdefined(self.hint))
		self.hint destroy();
	if (!isdefined(self.msg)) {	
		self.msg = newClientHudElem( self );
		self.msg.alignX = "center";
		self.msg.alignY = "middle";
		self.msg.x = 570;
		self.msg.y = 192;
		self.msg.alpha = 0.8;
		self.msg.fontScale = 0.75;
		self.msg.color = (1, 1, 1);
		self.msg.sort = 1;
		self.msg setText(level.search_msg1);
	}
	if (!isdefined(self.msg2)) {
		self.msg2 = newClientHudElem( self );
		self.msg2.alignX = "center";
		self.msg2.alignY = "middle";
		self.msg2.x = 570;
		self.msg2.y = 202;
		self.msg2.alpha = 0.8;
		self.msg2.fontScale = 0.75;
		self.msg2.color = (1, 1, 1);
		self.msg2.sort = 1;
		self.msg2 setText(level.search_msg2);
	}
	if (!isdefined(self.hint)) {
		self.hint = newClientHudElem( self );
		self.hint.alignX = "center";
		self.hint.alignY = "middle";
		self.hint.x = 570;
		self.hint.y = 221;
		self.hint.alpha = 0.8;
		self.hint.color = (1, 0, 0);
		self.hint setShader(level.ex_hint, 20, 20);
	}
	self waittill("clear_search_hint");
	if (isdefined(self.msg))
		self.msg destroy();
	if (isdefined(self.msg2))
		self.msg2 destroy();
	if (isdefined(self.hint))
		self.hint destroy();

}

// usage: body thread searchBodyTrigger()
searchBodyTrigger() {
	level endon("body_" + self.id + "_clear");

	mindist = 64;
	minhold = 0.25;

	if (level.body_search != 1)
		return;

	if (!isdefined(self))
		iprintln("self not defined");
	if (!isdefined(self.pack)) // happens when a player crosses a minefield
		//iprintln("self.pack not defined");
		return;

	self.being_searched = 0;

	while (isdefined(self) && isdefined(self.pack)) {

		wait 0.2;

		if (self.being_searched == 1)
			continue;

		players = getentarray("player", "classname");
	
		for (i = 0; i < players.size; i++) {

			if (	isAlivePlayingNotDriving(players[i])
				&& (distance(players[i].origin, self.origin) < mindist)
				&& (!players[i].is_searching)
				&& !players[i] meleeButtonPressed()) {
			
				target = players[i];
				break;
			}
		}
		if (!isdefined(target))
			continue;


		target.is_searching = true;
		target.is_searching_from = self.id;
		
		target thread searchTrigger();

		holdtime = 0;
		
		while (isAlivePlayingNotDriving(target) && (distance(target.origin, self.origin) < mindist) && (holdtime < minhold)) {

			if (!isdefined(self.pack))
				break;
			if (target meleeButtonPressed())
				holdtime += 0.05;
			else holdtime = 0;
			wait 0.05;
		}
		
		if (!isalive(target))
			break;

		if (isdefined(target.msg))
			target.msg destroy();
		if (isdefined(target.msg2))
			target.msg2 destroy();
		if (isdefined(target.hint))
			target.hint destroy();

		target.is_searching = false;

		if ((self.being_searched == 0) && (holdtime >= minhold))
			target thread searchBody(self);

		target = undefined;
	}
}
// most of the hudelem code ripped from from bombzone_think()
// fix pistol problem
searchBody(body) {

	self endon("player_died");

	if (!isdefined(body.pack))
		return;

	packarr = body.pack;
	
	barsize = 80;
	planttime = 2;

	body.being_searched = 1;

	self.found_ammo = false;

	if(!isDefined(self.progressbackground)) {
		self.progressbackground = newClientHudElem(self);				
		self.progressbackground.alignX = "center";
		self.progressbackground.alignY = "middle";
		self.progressbackground.x = 320;
		self.progressbackground.y = 385;
		self.progressbackground.alpha = 0.5;
	}
	self.progressbackground setShader("black", (barsize + 4), 12);		

	if(!isDefined(self.progressbar)) {
		self.progressbar = newClientHudElem(self);				
		self.progressbar.alignX = "left";
		self.progressbar.alignY = "middle";
		self.progressbar.x = (320 - (barsize / 2.0));
		self.progressbar.y = 385;
	}
	self.progressbar setShader("white", 0, 8);
	self.progressbar scaleOverTime(planttime, barsize, 8);

	if (self isStand())
		self setStance("crouch");

	//self playsound("MP_bomb_plant");

	copy = spawn("script_model", body.origin);
	self linkTo(copy);
	self disableWeapon();

	self.progresstime = 0;
	while(isAlive(self) && self meleeButtonPressed() && (self.progresstime < planttime) )
	{
		self.progresstime += 0.05;
		wait 0.05;
	}

	if(isDefined(self.progressbackground))
		self.progressbackground destroy();
	if(isDefined(self.progressbar))
		self.progressbar destroy();

	if (self.progresstime >= planttime) {

		//iprintln("looking for common");

		if (isdefined(packarr))
			common = self commonAmmo(packarr);

		else common = [];

		//self iprintln("body.pack.size " + body.pack.size);
		//self iprintln("common.size " + common.size);
		if (common.size > 0) {
			for (i = 0; i < common.size; i++) {
				if (isdefined(common[i])) {
					item = common[i]["item"];
					slot = common[i]["slot"];
					ammo = common[i]["ammo"];
					self giveAmmoFromPack(slot, item, ammo);
					//self iprintln("giving ammo from: " + slot + " " + item + " " + ammo);
				}
			}
		}
		//if (common.size == 0)
			//iprintln("common.size is 0");
	}

	if (self.progresstime >= planttime) {
		if (!self.found_ammo)
			self iprintln("No ammo found or inventory full");
		else {
			if (isdefined(body))
				body.pack = undefined;
		}
	}

	if (!self bombaction())
		self enableWeapon();
	self unlink();
	copy delete();
	wait 1; // dont pop up the trigger right away
	if (isdefined(body))
		body.being_searched = 0;
	self.progress_time = 0;

}
search_cleanup() {
	if(isDefined(self.progressbackground))
		self.progressbackground destroy();
	if(isDefined(self.progressbar))
		self.progressbar destroy();
	if (isdefined(self.msg))
		self.msg destroy();
	if (isdefined(self.msg2))
		self.msg2 destroy();
	if (isdefined(self.hint))
		self.hint destroy();
	self.progress_time = 0;
	self.is_searching = false;
	self.is_searching_from = undefined;

}

makeAmmoPack() {
	// getWeaponSlotWeapon( sSlot ) "primary", "primaryb", "pistol", "grenade", "smokegrenade", "satchel", "binocular"
	// getWeaponSlotAmmo
	pack = [];

	dropped = self getcurrentweapon();
	
	if ((self getWeaponSlotWeapon("primary") != "none") && (self getWeaponSlotWeapon("primary") != dropped))
		pack[pack.size] = self saveWeaponSlot("primary");
	if ((self getWeaponSlotWeapon("primaryb") != "none") && (self getWeaponSlotWeapon("primaryb") != dropped))
		pack[pack.size] = self saveWeaponSlot("primaryb");
	if ((self getWeaponSlotWeapon("pistol") != "none") && (self getWeaponSlotWeapon("pistol") != dropped))
		pack[pack.size] = self saveWeaponSlot("pistol");
	if ((self getWeaponSlotWeapon("grenade") != "none") && (self getWeaponSlotWeapon("grenade") != dropped))
		pack[pack.size] = self saveWeaponSlot("grenade");
	if ((self getWeaponSlotWeapon("smokegrenade") != "none") && (self getWeaponSlotWeapon("smokegrenade") != dropped))
		pack[pack.size] = self saveWeaponSlot("smokegrenade");
	if ((self getWeaponSlotWeapon("satchel") != "none") && (self getWeaponSlotWeapon("satchel") != dropped))
		pack[pack.size] = self saveWeaponSlot("satchel");
	//println("ammo_pack.size " + pack.size);
	return pack;
}
giveAmmoFromPack(slot, item, ammo) {
	if (!isdefined(slot) || !isdefined(item) || !isdefined(ammo))
		return;

	if (isPistol(item))
		weapname = getWeaponName(self getWeaponSlotWeapon("pistol"));
	else weapname = getWeaponName(item);

	if (((slot == "grenade") && (self getWeaponSlotWeapon("grenade") == "none"))
	   || ((slot == "smokegrenade") && (self getWeaponSlotWeapon("smokegrenade") == "none"))
	   || ((slot == "satchel") && (self getWeaponSlotWeapon("satchel") == "none")))
	{
		self giveweapon(item);
		self setWeaponSlotClipAmmo(slot, 0);
		//self iprintln("setting " + slot + " to zero");
	}
	if (whichPrimary(item) == "none" && !isGrenadeSmoke(item) && !isPistol(item)
            && ((self getWeaponSlotWeapon("primary") == "none") || (self getWeaponSlotWeapon("primaryb") == "none")) ) { // then give us the weapon
		self giveweapon(item);
		self setWeaponSlotAmmo(whichPrimary(item), ammo);
		if (!isRocketorFlame(item))
			added = ammo + getfullclipammo(item);
		else added = ammo;
		self iprintln("Picked up the ", weapname, " with " + added + " rounds");
		self.found_ammo = true;
		return;
	}

	cur_ammo = self getWeaponSlotAmmo(slot);
	max_ammo = self getWeaponSlotMaxAmmo(slot);

	//iprintln("max_ammo: " + max_ammo + ", cur_ammo: " + cur_ammo);

	if (!isGrenadeSmoke(item)) {
		clip_size = getfullclipammo(item);
		clips = ammo / clip_size;
		if (ammo > clip_size)
			ammo = clip_size * clips;

		if (ammo > cur_ammo)
			added = ammo - cur_ammo;

		if (ammo <= cur_ammo) {
			if ((ammo + cur_ammo) > max_ammo)
				added = max_ammo - cur_ammo;
			else added = ammo;
		}
	}
	else {
		buf = max_ammo - cur_ammo;

		if (ammo > buf)
			added = buf;
		else added = ammo;
	}

	//self iprintln("added is " + added);

	if (added > 0)
		self setWeaponSlotAmmo(slot, cur_ammo + added);

	if (added > 0) {
		if (added > 1)
			plural = "s";
		else plural = "";
		if (!isGrenadeSmoke(item))
			self iprintln("Picked up " + added + " rounds for the ", weapname);
		else self iprintln("Picked up " + added, " ", weapname, plural);
		self.found_ammo = true;
	}
}

getWeaponSlotMaxAmmo(slot) {
	old_ammo = self getWeaponSlotAmmo(slot);
	self setWeaponSlotAmmo(slot, 99999);
	max_ammo = self getWeaponSlotAmmo(slot);
	self setWeaponSlotAmmo(slot, old_ammo);
	return max_ammo;
}
	
commonAmmo(pack) {
	arr = [];
	//iprintln("pack.size " + pack.size);
	for (i = 0; i < pack.size; i++) {
		if ( self isInventory(pack[i]["item"]) ) {
			arr[i]["item"] = pack[i]["item"];
			arr[i]["slot"] = pack[i]["slot"];
			arr[i]["ammo"] = pack[i]["ammo"];
			//self iprintln("found inventory!");
		}
		//else iprintln(pack[i]["item"] + " is not inventory!");
	}
	//iprintln("common.size " + arr.size);
	return arr;
}

// looks for pistol ammo, common primary ammo, common grenades
// satchel charges and smokegrenades

isInventory(item) {
	// assume pistols use the same ammo
	if ( self getWeaponSlotWeapon("pistol") != "none" && isPistol(item) )
		return true;

	primary = self getWeaponSlotWeapon("primary");
	primaryb = self getWeaponSlotWeapon("primaryb");

	if (item == primary || item == primaryb)
		return true;

	if ((primaryb == "none") || (primary == "none")) {
		if ((whichPrimary(item) == "none") && (!isGrenadeSmoke(item)))
			return true;
	}

	grenade = self getWeaponSlotWeapon("grenade");
	if (item == grenade)
		return true;

	if (isGrenadeSmoke(item) && (grenade == "none"))
		return true;

	if (item == "satchelcharge_mp")
		return true;
	if (item == "smokegrenade_mp")
		return true;

	else return false;
}
whichPrimary(item) {
	primary = self getWeaponSlotWeapon("primary");
	primaryb = self getWeaponSlotWeapon("primaryb");
	if (item == primary)
		return "primary";
	if (item == primaryb)
		return "primaryb";
	return "none";
}
// routine from AWE
saveWeaponSlot(slot)
{
	temp["item"] = self getWeaponSlotWeapon(slot);	
	temp["slot"] = slot;
	temp["ammo"] = self getWeaponSlotAmmo(slot);	
	temp["clip"] = self getWeaponSlotClipAmmo(slot);	

	return temp;
}
distFromPoint(pt) {
	while (1) {
		self iprintln("dist: " + distance(self.origin, pt));
		wait 7;
	}
}
foy_spawnkill_check(eInflictor, eAttacker, sWeapon) {
	switch (level.mapname) {
		case "ax_foy":
		case "mp_foy":
		case "mp_uo_barbarossa":
			break;
		default:
			return false;
	}

	if (!isdefined(eInflictor) || !isdefined(eInflictor.vehicletype))
		return false;

	switch (level.mapname) {
		case "mp_foy":
		case "ax_foy":
			if (eInflictor.vehicletype != "flak88_mp" && eInflictor.vehicletype != "Flak88_MP")
				return false;

			if (sWeapon != "flak88_turret_mp")
				return false;

			allied_spawn 	= (-4529, -7093, 280);
			axis_spawn	= (-1208, 7075, 56);
			bubble	     	= cvardef("scr_fskp_diameter", 2000, 0, 9999999, "int");
			break;
		case "mp_uo_barbarossa":
			if ((sWeapon != "pak40_turret_mp") || (eInflictor.vehicletype != "pak40_mp"))
				return false;
			allied_spawn	= (959, -10645, 101);
			axis_spawn	= (-22024, -7646, 536);
			bubble	     	= cvardef("scr_fskp_diameter", 2000, 0, 9999999, "int");
			break;
	}

	if(isPlayer(eAttacker) && (self.pers["team"] == eAttacker.pers["team"]))
		return false;


	if (self.pers["team"] == "allies")
		d = distance(self.origin, allied_spawn);
	else
		d = distance(self.origin, axis_spawn);

	if (d > bubble)
		return false;
	
	else {

		switch(eInflictor.vehicletype) {
			case "pak40_mp":
				means = "Pak40's";
				break;
			case "pak45_mp":
				means = "Pak45's";
				break;
			case "flak88_turret_mp":
				means = "Flak88's";
				break;
			default:
				means = "Artillery";
				break;
		}

		eAttacker thread spawnkill_warn(eAttacker, means);
		return true;
	}			
}
spawnkill_warn(eAttacker, means) {
	if (isdefined(self.fsk_warn))
		return;

	self.fsk_warn = 1;
	clientAnnouncement(eAttacker, "^1Warning:^7 Spawn killing with the " + means + " will not be tolerated.");
	wait 5;
	self.fsk_warn = undefined;
}
pastrotation() {
	limit = cvardef("scr_past_rotation_mem", 10, 0, 30, "int");
	r = getcvar("scr_past_rotation");
	if (r == "")
		setcvar("scr_past_rotation", level.mapname);

	else {
		//setcvar("scr_past_rotation", "");
		past = "";
		m = explode(r, ",");
		m[m.size] = level.mapname;

		if (m.size <= limit)
			i = 0;
		else i = (m.size-limit);

		start = i;

		while(i<m.size) {
			if (i==start)
				s = m[i];
			else
				s = "," + m[i];
			//setcvar("scr_past_rotation", getcvar("scr_past_rotation") + s);
			past = past + s;
			i++;
		}
		setcvar("scr_past_rotation", past);
	}
}
setupTRP() {
	switch (level.mapname) {
		case "mp_dawnville":
		case "mp_uo_dawnville":
			level.trp = [];
			level.trp[level.trp.size]["name"] = "(Church) ";
			level.trp[level.trp.size-1]["origin"] = (196, -15893, 94);
			level.trp[level.trp.size]["name"] = "(Garage) ";
			level.trp[level.trp.size-1]["origin"] = (-1733, -17451, 100);
			level.trp[level.trp.size]["name"] = "(Courtyard) ";
			level.trp[level.trp.size-1]["origin"] = (-2286, -18941, 60);
			level.trp[level.trp.size]["name"] = "(Alley) ";
			level.trp[level.trp.size-1]["origin"] = (1728, -16671, 48);
			level.trp[level.trp.size]["name"] = "(Cafe) ";
			level.trp[level.trp.size-1]["origin"] = (1370, -16953, 126);
			level.trp[level.trp.size]["name"] = "(Ruins) ";
			level.trp[level.trp.size-1]["origin"] = (908, -15590, 67);
			level.trp[level.trp.size]["name"] = "(Graveyard) ";
			level.trp[level.trp.size-1]["origin"] = (-619, -16179, 10);
			level.trp[level.trp.size]["name"] = "(Cottage) ";
			level.trp[level.trp.size-1]["origin"] = (-1228, -16030, 36);
			level.trp[level.trp.size]["name"] = "(Chicken Coops) ";
			level.trp[level.trp.size-1]["origin"] = (-2069, -16519, 67);
			level.trp[level.trp.size]["name"] = "(Post Office) ";
			level.trp[level.trp.size-1]["origin"] = (-743, -17121, 82);
			level.trp[level.trp.size]["name"] = "(Bank) ";
			level.trp[level.trp.size-1]["origin"] = (99, -17019, 100);
			level.trp[level.trp.size]["name"] = "(General Store) ";
			level.trp[level.trp.size-1]["origin"] = (-78, -18070, 118);
			level.trp[level.trp.size]["name"] = "(Hotel) ";
			level.trp[level.trp.size-1]["origin"] = (483, -18167, 108);
			level.trp[level.trp.size]["name"] = "(Outhouse) ";
			level.trp[level.trp.size-1]["origin"] = (24, -18455, 96);
			level.trp[level.trp.size]["name"] = "(Railway) ";
			level.trp[level.trp.size-1]["origin"] = (-107, -19295, 60);
			level.trp[level.trp.size]["name"] = "(Station) ";
			level.trp[level.trp.size-1]["origin"] = (-1174, -18565, 124);
			level.trp[level.trp.size]["name"] = "(Orphanage) ";
			level.trp[level.trp.size-1]["origin"] = (-1174, -18565, 124);

			break;
		case "mp_foy":
		case "mp_foy_dusk":
		case "ax_foy":
			level.trp = [];
			level.trp[level.trp.size]["name"] = "(Allied Spawn) ";
			level.trp[level.trp.size-1]["origin"] = (-4529, -7093, 280);
			level.trp[level.trp.size]["name"] = "(Allied Base #1) ";
			level.trp[level.trp.size-1]["origin"] = (-3895, -4360, 108);
			level.trp[level.trp.size]["name"] = "(Allied Base #3) ";
			level.trp[level.trp.size-1]["origin"] = (-1981, -7248, 241);
			level.trp[level.trp.size]["name"] = "(Stalls) ";
			level.trp[level.trp.size-1]["origin"] = (697, -5083, 71);
			level.trp[level.trp.size]["name"] = "(Haystacks) ";
			level.trp[level.trp.size-1]["origin"] = (1003, -6982, 133);
			level.trp[level.trp.size]["name"] = "(Allied Base #2) ";
			level.trp[level.trp.size-1]["origin"] = (3313, -4928, 71);
			level.trp[level.trp.size]["name"] = "(East Street) ";
			level.trp[level.trp.size-1]["origin"] = (3606, -1229, 36);
			level.trp[level.trp.size]["name"] = "(Axis Base #3) ";
			level.trp[level.trp.size-1]["origin"] = (2944, 2792, 266);
			level.trp[level.trp.size]["name"] = "(Bridge) ";
			level.trp[level.trp.size-1]["origin"] = (783, 4818, -129);
			level.trp[level.trp.size]["name"] = "(Axis Base #2) ";
			level.trp[level.trp.size-1]["origin"] = (1008, 6279, 60);
			level.trp[level.trp.size]["name"] = "(Axis Base #1) ";
			level.trp[level.trp.size-1]["origin"] = (-2492, 2121, 125);
			level.trp[level.trp.size]["name"] = "(Axis Spawn) ";
			level.trp[level.trp.size-1]["origin"] = (-1208, 7075, 56);
			level.trp[level.trp.size]["name"] = "(West River) ";
			level.trp[level.trp.size-1]["origin"] = (-2440, 4454, -179);
			level.trp[level.trp.size]["name"] = "(East River) ";
			level.trp[level.trp.size-1]["origin"] = (2626, 4791, -179);
			level.trp[level.trp.size]["name"] = "(Backyards) ";
			level.trp[level.trp.size-1]["origin"] = (1857, -209, 58);
			level.trp[level.trp.size]["name"] = "(Backyards) ";
			level.trp[level.trp.size-1]["origin"] = (2021, -2076, 58);
			level.trp[level.trp.size]["name"] = "(Church) ";
			level.trp[level.trp.size-1]["origin"] = (953, -1502, 76);
			level.trp[level.trp.size]["name"] = "(Church Tower) ";
			level.trp[level.trp.size-1]["origin"] = (494, -1486, 457);
			level.trp[level.trp.size]["name"] = "(Burned House) ";
			level.trp[level.trp.size-1]["origin"] = (-1622, -268, 68);
			level.trp[level.trp.size]["name"] = "(Courtyard Mansion) ";
			level.trp[level.trp.size-1]["origin"] = (-1920, -1444, 66);
			level.trp[level.trp.size]["name"] = "(South Hotel) ";
			level.trp[level.trp.size-1]["origin"] = (-390, -3246, 64);
			level.trp[level.trp.size]["name"] = "(Center Street) ";
			level.trp[level.trp.size-1]["origin"] = (291, -638, 45);
			level.trp[level.trp.size]["name"] = "(West Field) ";
			level.trp[level.trp.size-1]["origin"] = (-3598, -1234, 291);
			level.trp[level.trp.size]["name"] = "(East Field) ";
			level.trp[level.trp.size-1]["origin"] = (5198, -400, 135);
			level.trp[level.trp.size]["name"] = "(North Junction) ";
			level.trp[level.trp.size-1]["origin"] = (550, 1697, 67);
			level.trp[level.trp.size]["name"] = "(Southeast Backyard) ";
			level.trp[level.trp.size-1]["origin"] = (4420, -3112, 6);
			level.trp[level.trp.size]["name"] = "(Church) ";
			level.trp[level.trp.size-1]["origin"] = (524, -1509, 76);
			level.trp[level.trp.size]["name"] = "(Southeast Street) ";
			level.trp[level.trp.size-1]["origin"] = (3075, -2564, 16);
			level.trp[level.trp.size]["name"] = "(Northeast Street) ";
			level.trp[level.trp.size-1]["origin"] = (2812, 1200, 33);
			level.trp[level.trp.size]["name"] = "(North MG House) ";
			level.trp[level.trp.size-1]["origin"] = (63, 452, 168);
			level.trp[level.trp.size]["name"] = "(South MG House) ";
			level.trp[level.trp.size-1]["origin"] = (-1611, -2536, 48);
			break;
		default:
			level.trp = undefined;
	}
}
nearestTRP() {
	trp = sortTRP(self.origin, level.trp);
	if (isdefined(trp))
		return trp[0]["name"];
	else return 0;
}
sortTRP(point, array) {

	newarray = [];

	//	first we calculate how far each one is from point
	for(i=0;i<array.size;i++)
	{
		newarray[newarray.size] = array[i];

		if (isdefined(newarray[i]["origin"]))
			newarray[i]["distance"] = distance(newarray[i]["origin"],point);
		else
		{
			println("something in this array doesn't have an origin");
			println("BAILING");
			return;			
		}
	}
	// Sort them in order
	for(i = 0; i < newarray.size; i++)
	{
		for(j = i; j < newarray.size; j++)
		{
			if(newarray[i]["distance"] > newarray[j]["distance"])
			{
				temp = newarray[i];
				newarray[i] = newarray[j];
				newarray[j] = temp;
			}
		}
	}
	return(newarray);
}
doQuickMessage(soundalias, saytext)
{
	if(self.sessionstate != "playing")
		return;

	if (!isdefined(self.voice_used))
	{
		self.voice_used = 1;
		self.voice_spam = false;
		self thread checkspam();
	}
	else self.voice_used++;

	if (self.voice_spam)
		return;

	if(isdefined(level.QuickMessageToAll) && level.QuickMessageToAll)
	{
		self.headiconteam = "none";
		self.headicon = "gfx/hud/headicon@quickmessage";
		
		self playSound(soundalias);
		self sayAll(saytext);
	}
	else
	{
		if(self.sessionteam == "allies")
			self.headiconteam = "allies";
		else if(self.sessionteam == "axis")
			self.headiconteam = "axis";
		
		self.headicon = "gfx/hud/headicon@quickmessage";

		if (isdefined(level.trp)) {
			loc = self nearestTRP();
			self sayTeam(loc, saytext);
		}
		else self sayTeam(saytext);

		self playSound(soundalias);
		self pingPlayer();
	}
}
checkspam()
{
	for(i=0;i<20;i++)
	{
		if (self.voice_used > 2)
		{
			self.voice_spam = true;
			self iprintln("^3[*] Voicechat spam detected! Please do NOT spam the voice commands!^7");
			wait 1.4;
			self playlocalsound("radiospam");
			break;
		}
		wait 1;
	}
	if (self.voice_spam)
	{
		wait 30;
		self.voice_spam = false;
		self devprint("allowed to talk");
	}
	self.voice_used = undefined;
}
closestTeammate() {
	ldist = 0;
	players_found = 0;
	players = getentarray("player", "classname");

	for (i=0; i<players.size; i++) {

		player = players[i];

		if (player.pers["team"] != self.pers["team"] && player != self) 
			continue;
		dist = distance(player.origin, self.origin);
		players_found++;
		//iprintln("found teammate! " + player.pers["team"] + "/" + self.pers["team"] + ", " + player.name);		
		if (dist < ldist)
			ldist = dist;
	}
	if (players_found < 2)
		return 99999;
	else return ldist;
}
		
getnadesound() {
	if (self.pers["team"] == "allies")
		sound = game["allies"] + "_grenade";
	else sound = "german_grenade";
	return sound;
}
			
isGrenade(weapon)
{
	switch(weapon)
	{
	case "fraggrenade_mp":
	case "mk1britishfrag_mp":
	case "rgd-33russianfrag_mp":
	case "stielhandgranate_mp":
		return true;
	default:
		return false;
	}
}
isGrenadeSmoke(weapon)
{
	switch(weapon)
	{
	case "fraggrenade_mp":
	case "mk1britishfrag_mp":
	case "rgd-33russianfrag_mp":
	case "stielhandgranate_mp":
	case "smokegrenade_mp":
	case "satchelcharge_mp":
		return true;
	default:
		return false;
	}
}
isPistol(weapon)
{
	switch(weapon)
	{
	case "colt_mp":
	case "luger_mp":
	case "webley_mp":
	case "tt33_mp":
		return true;
	default:
		return false;
	}
}
isRocketorFlame(weapon)
{
	switch(weapon)
	{
	case "panzerfaust_mp":
	case "bazooka_mp":
	case "panzerschreck_mp":
	case "flamethrower_mp":
		return true;
	default:
		return false;
	}
}
isRocket(weapon)
{
	switch(weapon)
	{
	case "panzerfaust_mp":
	case "bazooka_mp":
	case "panzerschreck_mp":
		return true;
	default:
		return false;
	}
}
isturret(w)
{
	switch(w)
	{
		case "mg42_bipod_duck_mp":
		case "mg42_bipod_prone_mp":
		case "mg42_bipod_stand_mp":
		case "30cal_tank_mp":
		case "50cal_tank_mp":
		case "mg30Cal_mp":
		case "mg34_tank_mp":
		case "mg42_tank_mp":
		case "mg42_turret_mp":
		case "mg50cal_tripod_stand_mp":
		case "mg_sg43_stand_mp":

			return true;
		default:
			return false;
	}
}
isScoped() {
	switch (self getcurrentweapon()) {
		case "fg42_mp":
		case "fg42_semi_mp":
		case "kar98k_sniper_mp":
		case "mosin_nagant_sniper_mp":
		case "springfield_mp":
			if (self isADS())
				return true;
			else return false;
		default:
			return false;
	}
}
painsound() {
	if (isdefined(self.painsound))
		return;

	if (self.pers["team"] == "allies")
		sound = "mp_pain_" + game["allies"];
	else sound = "mp_pain_german";

	if ((self.health > 1) && (randomint(10) > 5))
		self playsound(sound);
	self.painsound = true;
	wait 5;
	self.painsound = undefined;
}
// allow players to exchange weapons
weapon_exchange() {
	while (isalive(self)) {

		wait 0.5;

		players = getentarray("player", "classname");
	
		for (i = 0; i < players.size; i++) {
			if (players[i] == self)
				continue;
			
			if (players[i].pers["team"] == self.pers["team"]
				&& isalive(players[i])
				&& distance(players[i].origin, self.origin) < 48) {

				target = players[i];
				break;
			}
		}
		if (!isdefined(target))
			continue;

		self exchangeMessage();

		while (distance(target.origin, self.origin) < 48) {
			wait 0.05;
			continue;
		}
	
	if (isdefined(self.exch_msg))
		self.exch_msg destroy();

	if (isdefined(self.exch_hint))
		self.exch_hint destroy();

	}
}
// prompt to exchange weapons
exchangeMessage() {

	if (isdefined(self.exch_msg))
		self.exch_msg destroy();

	if (isdefined(self.exch_hint))
		self.exch_hint destroy();

	self.exch_msg = newClientHudElem( self );
	self.exch_msg.alignX = "center";
	self.exch_msg.alignY = "middle";
	self.exch_msg.x = 320;
	self.exch_msg.y = 312;
	self.exch_msg.alpha = 0.8;
	self.exch_msg.fontScale = 0.85;
	self.exch_msg.color = (1, 1, 1);
	self.exch_msg.sort = 1;
	self.exch_msg setText(level.ex_ask_msg);

	self.exch_hint = newClientHudElem( self );
	self.exch_hint.alignX = "center";
	self.exch_hint.alignY = "middle";
	self.exch_hint.x = 320;
	self.exch_hint.y = 345;
	self.exch_hint.alpha = 0.8;
	self.exch_hint setShader(level.ex_hint, 40, 40);

}
// scripted "use" prompt
useTrigger(msg) {
	if (isdefined(self.msg))
		self.msg destroy();
	if (isdefined(self.hint))
		self.hint destroy();
	
	self.msg = newClientHudElem( self );
	self.msg.alignX = "center";
	self.msg.alignY = "middle";
	self.msg.x = 320;
	self.msg.y = 312;
	self.msg.alpha = 0.8;
	self.msg.fontScale = 0.85;
	self.msg.color = (1, 1, 1);
	self.msg.sort = 1;
	self.msg setText(msg);

	self.hint = newClientHudElem( self );
	self.hint.alignX = "center";
	self.hint.alignY = "middle";
	self.hint.x = 320;
	self.hint.y = 345;
	self.hint.alpha = 0.8;
	self.hint setShader(level.ex_hint, 40, 40);
}
// is this map a winter-based map?
winterMap() {
	if (!isdefined(level.mapname))
		return;

	switch (level.mapname) {
		case "mp_foy":
		case "mp_foy_dusk":
		case "ax_foy":
		case "ax_foy_night":
		case "mp_bastogne_b2":
		case "mp_bastogne_b2_night":
		case "mp_bastogne":
		case "mp_bastogne_night":
		case "mp_bastogne_b3":
		case "mp_luxembourg_b1":
		case "mp_luxembourg_b2":
		case "mp_luxembourg":
		case "ax_ardennes":
		case "mp_uo_ardennes1944":
		case "mp_uo_vitebsk_beta1":
		case "mp_uo_vitebsk":
		case "mp_uo_vitebsk_final":
		case "mp_hurtgen":
		case "mp_railyard":
		case "mp_harbor":
		case "mp_offensive":
		case "mp_maaloy":
		case "mp_uo_adlerstein":
		case "mp_stalingrad":
		case "mp_rocket":
			return true;
			break;
		default:
			return false;
	}
}
// set the night tracers for maps that don't already do it
nightMap() {
	if (getcvarint("sv_night") == 1)
		return; // already set
	map = getcvar("mapname");
	switch(map) {
		case "mp_offensive":
		case "mp_powcamp":
		case "mp_chateau":
		case "mp_bastogne_b2_night":
		case "mp_bastogne_b3":
			setcvar("sv_night", 1);
			break;
		default:
			setcvar("sv_night", 0);
	}
}
// this isn't used anymore
UOMap() {
	switch(level.mapname)
	{
	case "mp_arnhem":
	case "mp_cassino":
	case "mp_berlin":
	case "mp_foy":
	case "ax_foy":
	case "mp_foy_dusk":
	case "mp_italy":
	case "mp_kharkov":
	case "mp_kursk":
	case "mp_ponyri":
	case "mp_rhinevalley":
	case "mp_sicily":
	case "mp_uo_stanjel":
	case "mp_uo_townassault":
	case "mp_uo_barbarossa":
	case "mp_uo_vitebsk_final":
	case "mp_lazur_final":
	case "mp_uo_ardennes1944":
	case "mp_uo_gunassault":
	case "mp_wesel":
	case "mp_uo_tuchola_b2":
	case "mp_uo_smolensk":
	case "mp_broadsword":
	case "mp_uo_dragoon_beta1":
	case "mp_uo_dragoon_beta2":
	case "mp_uo_dragoon":
		return true;
	default:
		return false;
	}
}
// some AWE here	
shownextmap() {
	for (;;) {
		maprotcur = strip(getcvar("sv_maprotationcurrent"));
		if(maprotcur == "")
			maprotcur = strip(getcvar("sv_maprotation"));
		if (maprotcur != "") {
			temparr = explode(maprotcur," ");
			if(temparr[0]=="gametype") {
				nextgt=temparr[1];
				nextmap=temparr[3];
			}
			else {
				nextgt=getcvar("g_gametype");
				nextmap=temparr[1];
			}
		}
	if (isdefined(nextgt) && isdefined(nextmap))
		iprintln("^3* NEXT MAP:^7 " + nextmap + " (" + nextgt + ")");
	wait level.nextmap_delay;
	}
}

checkName() {

	// Renames unknown soldiers
	if (level.rename_unknown == 1) {
		if (self.name == "Unknown Soldier") {
			rand = level.rename_unknown_prefix + "..." + randomint(30) + "_" + randomint(3000);
			self setClientCvar("name", rand);
		}
	}
}

autoassign(allies, axis, oldresponse) {
	// if teams are equal return the team with the lowest score
	if(allies == axis) {
		// first check to see if the server is EMPTY
		if ((allies == 0) && (axis == 0))
			response = oldresponse;

		// now check if the score is equal
		else if(getTeamScore("allies") == getTeamScore("axis"))
			response = oldreponse; // dont want a random one
		
		// if not, return team with lower score
		else if(getTeamScore("allies") < getTeamScore("axis"))
			response = "allies";
		else
			response = "axis";
	}
	else if(allies < axis)
		response = "allies";
	else
		response = "axis";

	return response;
	
}

// overrides the allied team settings for rifles-only
teamoverride() {
	if (getcvar("scr_rifles_only") == "1") {

		/* NOT NECESSARY WITH ENFIELD FOR THE AMERICANS

		// thanks to bell for this, fixes the non precached player models
		if ( (getcvar("teams_oldgt") == getcvar("g_gametype")) && (getcvar("mapname") == getcvar("teams_oldmap")) ) {
			game["allies"] = getcvar("teams_oldteam");
			game[game["allies"] + "_soldiertype"] = getcvar("teams_oldtype");
			game[game["allies"] + "_soldiervariation"] = getcvar("teams_oldvar");
		}
		if (!isdefined(game["allies"]) || game["allies"] == "american") {
			x = randomint(2);
			switch (x) {
				case 0:
					game["allies"] = "russian";
					game["russian_soldiertype"] = "conscript";
					game["russian_soldiervariation"] = "normal";
					break;
				case 1:
					game["allies"] = "british";
					game["british_soldiertype"] = "commando";
					game["british_soldiervariation"] = "normal";
					break;
			}
		}
		setcvar("teams_oldteam",	game["allies"]);
		setcvar("teams_oldtype",	game[game["allies"] + "_soldiertype"]);
		setcvar("teams_oldvar",		game[game["allies"] + "_soldiervariation"]);
		setcvar("teams_oldgt",		getcvar("g_gametype"));
		setcvar("teams_oldmap",		getcvar("mapname"));

		*/
		
		ro_weapons();
	}
}
ro_weapons() {
	setcvar("scr_allow_m1carbine", 	"0");
	setcvar("scr_allow_m1garand", 	"0");
	setcvar("scr_allow_gewehr43",	"0");
	setcvar("scr_allow_svt40",	"0");
	setcvar("scr_allow_fg42",	"0");
	setcvar("scr_allow_sten",	"0");
	setcvar("scr_allow_sten_silenced", "0");
	setcvar("scr_allow_kar98ksniper", "0");
	setcvar("scr_allow_flamethrower", "0");
	setcvar("scr_allow_nagantsniper", "0");
	setcvar("scr_allow_springfield", "0");
	setcvar("scr_allow_bren",	"0");
	setcvar("scr_allow_mp40",	"0");
	setcvar("scr_allow_mp44",	"0");
	setcvar("scr_allow_ppsh",	"0");
	setcvar("scr_allow_bar",	"0");
	setcvar("scr_allow_mg34",	"0");
	setcvar("scr_allow_dp28",	"0");
	setcvar("scr_allow_mg30cal",	"0");
	setcvar("scr_allow_thompson",	"0");
	setcvar("scr_allow_bazooka",	"0");
	setcvar("scr_allow_panzerschreck", "0");
	setcvar("scr_allow_panzerfaust", "0");
	setcvar("scr_allow_pistols",	"0");
	setcvar("scr_allow_grenades",	"0");
	setcvar("scr_allow_satchel",	"0");
	setcvar("scr_allow_smoke",	"0");
	setcvar("scr_allow_artillery",	"0");

	setcvar("scr_allow_enfield",	"1");
	setcvar("scr_allow_nagant",	"1");
	setcvar("scr_allow_kar98k",	"1");

	/*
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_m1carbine");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_m1garand");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_thompson");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_bar");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_springfield");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_mg30cal");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_sten");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_sten_silenced");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_bren");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_mosinnagant");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_svt40");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_ppsh");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_mosinnagantsniper");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_dp28");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_kar98k");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_gewehr43");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_mp40");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_mp44");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_kar98ksniper");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_mg34");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_fg42");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_panzerfaust");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_panzerschreck");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_bazooka");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_flamethrower");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_binoculars");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_binoculars_artillery");
	maps\mp\gametypes\_teams::deletePlacedEntity("mpweapon_satchelcharge");
	*/
	maps\mp\gametypes\_teams::deletePlacedEntity("misc_mg42");
	maps\mp\gametypes\_teams::deletePlacedEntity("misc_turret");
	
}
// Displays mod version in upper left corner
modHud() {	
	if (level.show_modhud != 1)
		return;

	if(!isdefined(level.mod_title))
	{
		level.mod_title = newHudElem();
		level.mod_title.archived = false;
		level.mod_title.x = 5;
		level.mod_title.y = 5;
		level.mod_title.alignX = "left";
		level.mod_title.alignY = "top";
		//level.mod_title.font = "smallFixed";
		level.mod_title.fontScale = 0.8;
		level.mod_title.sort = 1;
		level.mod_title.color = (1, 1, 1);
	}
	level.mod_title setText(level.modstr);
}
miniscoreboard() {
	miniscore_seps();	// seperators
	miniscore_flags();	// team flags
	miniscore_teamscore();	// team score

	wait 0.5;

	while (1) {
		wait 0.5;

		if (!isdefined(game["kills_allies"]) || !isdefined(game["kills_axis"]))
			continue;
		if (!isdefined(game["deaths_allies"]) || !isdefined(game["deaths_axis"]))
			continue;

		level.kdhud_kills[0] setValue(game["kills_allies"]);
		level.kdhud_kills[1] setValue(game["kills_axis"]);
		level.kdhud_deaths[0] setValue(game["deaths_allies"]);
		level.kdhud_deaths[1] setValue(game["deaths_axis"]);
	}
}

miniscore_seps() {
	// setup the seperators
	sep_x = 615;
	sep_y = 37;
	level.kdhud_sep = [];
	level.kdhud_ratio = [];

	for (i = 0; i < 2; i++) {
		if (!isdefined(level.kdhud_sep[i])) {
			level.kdhud_sep[i] = newHudElem();
			level.kdhud_sep[i].archived = false;
			level.kdhud_sep[i].x = sep_x;
			level.kdhud_sep[i].y = sep_y;
			level.kdhud_sep[i].alignX = "left";
			level.kdhud_sep[i].alignY = "top";
			level.kdhud_sep[i].fontScale = 0.4;
			level.kdhud_sep[i].sort = 0.8;
			level.kdhud_sep[i].color = (1, 1, 1);		
		}
		sep_y = sep_y + 10;
		level.kdhud_sep[i] setText(&"/");
	}
}
miniscore_flags() {
	if(!isdefined(level.kdhud_flag0))
	{
		level.kdhud_flag0 = newHudElem();
		level.kdhud_flag0.archived = false;
		level.kdhud_flag0.x = 586;
		level.kdhud_flag0.y = 34;
		level.kdhud_flag0.alignX = "left";
		level.kdhud_flag0.alignY = "top";
		level.kdhud_flag0.sort = 0.8;
		level.kdhud_flag0.alpha = 1.5;
	}
	if(!isdefined(level.kdhud_flag1))
	{
		level.kdhud_flag1 = newHudElem();
		level.kdhud_flag1.archived = false;
		level.kdhud_flag1.x = 586;
		level.kdhud_flag1.y = 44;
		level.kdhud_flag1.alignX = "left";
		level.kdhud_flag1.alignY = "top";
		level.kdhud_flag1.sort = 0.8;
		level.kdhud_flag1.alpha = 1.5;
	}
	level.kdhud_flag0 setShader(game["headicon_allies"], 12, 12);
	level.kdhud_flag1 setShader(game["headicon_axis"], 12, 12);

}
miniscore_teamscore() {
	// setup the column for kills
	sep_x = 613;
	sep_y = 35;
	level.kdhud_kills = [];

	for (i = 0; i < 2; i++) {
		if (!isdefined(level.kdhud_kills[i])) {
			level.kdhud_kills[i] = newHudElem();
			level.kdhud_kills[i].archived = false;
			level.kdhud_kills[i].x = sep_x;
			level.kdhud_kills[i].y = sep_y;
			level.kdhud_kills[i].alignX = "right";
			level.kdhud_kills[i].alignY = "top";
			level.kdhud_kills[i].fontScale = 0.7;
			level.kdhud_kills[i].sort = 0.8;
			level.kdhud_kills[i].color = (1, 1, 1);		
		}
		sep_y = sep_y + 10;
	}

	// setup the column for deaths
	sep_x = 621;
	sep_y = 35;
	level.kdhud_deaths = [];

	for (i = 0; i < 3; i++) {
		if (!isdefined(level.kdhud_deaths[i])) {
			level.kdhud_deaths[i] = newHudElem();
			level.kdhud_deaths[i].archived = false;
			level.kdhud_deaths[i].x = sep_x;
			level.kdhud_deaths[i].y = sep_y;
			level.kdhud_deaths[i].alignX = "left";
			level.kdhud_deaths[i].alignY = "top";
			level.kdhud_deaths[i].fontScale = 0.7;
			level.kdhud_deaths[i].sort = 0.8;
			level.kdhud_deaths[i].color = (1, 1, 1);		
		}
		sep_y = sep_y + 10;
	}
}
miniscore_myscore() {
	self endon("player_died");

	if (!isdefined(self.kdhud_kills)) {
		self.kdhud_kills = newClientHudElem(self);
		self.kdhud_kills.archived = false;
		self.kdhud_kills.x = 613;
		self.kdhud_kills.y = 25;
		self.kdhud_kills.alignX = "right";
		self.kdhud_kills.alignY = "top";
		self.kdhud_kills.fontScale = 0.7;
		self.kdhud_kills.sort = 0.8;
		self.kdhud_kills.color = (1, 1, 1);		
	}
	if (!isdefined(self.kdhud_deaths)) {
		self.kdhud_deaths = newClientHudElem(self);
		self.kdhud_deaths.archived = false;
		self.kdhud_deaths.x = 621;
		self.kdhud_deaths.y = 25;
		self.kdhud_deaths.alignX = "left";
		self.kdhud_deaths.alignY = "top";
		self.kdhud_deaths.fontScale = 0.7;
		self.kdhud_deaths.sort = 0.8;
		self.kdhud_deaths.color = (1, 1, 1);		
	}
	if (!isdefined(self.kdhud_sep)) {
		self.kdhud_sep = newClientHudElem(self);
		self.kdhud_sep.archived = false;
		self.kdhud_sep.x = 615;
		self.kdhud_sep.y = 27;
		self.kdhud_sep.alignX = "left";
		self.kdhud_sep.alignY = "top";
		self.kdhud_sep.fontScale = 0.4;
		self.kdhud_sep.sort = 0.8;
		self.kdhud_sep.color = (1, 1, 1);		
	}
	self.kdhud_sep setText(&"/");

	if (level.show_headshots == 1) {
		if (!isdefined(self.hud_headshot)) {
			self.hud_headshot = newClientHudElem(self);
			self.hud_headshot.archived = false;
			self.hud_headshot.x = 587;
			self.hud_headshot.y = 57;
			self.hud_headshot.alignX = "left";
			self.hud_headshot.alignY = "top";
			self.hud_headshot.color = (1, 1, 1);
			self.hud_headshot.alpha = 0.8;
			self.hud_headshot setShader(game["headshot_icon"], 10, 10);
		}
		if (!isdefined(self.hud_headshot_count)) {
			self.hud_headshot_count = newClientHudElem(self);
			self.hud_headshot_count.archived = false;
			self.hud_headshot_count.x = 617;
			self.hud_headshot_count.y = 61;
			self.hud_headshot_count.alignX = "center";
			self.hud_headshot_count.alignY = "middle";
			self.hud_headshot_count.fontScale = 0.7;
			self.hud_headshot_count.sort = 0.8;
			self.hud_headshot_count.color = (1, 1, 1);
		}
	}
	if (level.show_melees == 1) {
		if (!isdefined(self.hud_melee)) {
			self.hud_melee = newClientHudElem(self);
			self.hud_melee.archived = false;
			self.hud_melee.x = 588;
			self.hud_melee.y = 69;
			self.hud_melee.alignX = "left";
			self.hud_melee.alignY = "top";
			self.hud_melee.color = (1, 1, 1);
			self.hud_melee.alpha = 0.65;
			self.hud_melee setShader(game["melee_icon"], 10, 10);
		}
		if (!isdefined(self.hud_melee_count)) {
			self.hud_melee_count = newClientHudElem(self);
			self.hud_melee_count.archived = false;
			self.hud_melee_count.x = 617;
			self.hud_melee_count.y = 73;
			self.hud_melee_count.alignX = "center";
			self.hud_melee_count.alignY = "middle";
			self.hud_melee_count.fontScale = 0.7;
			self.hud_melee_count.color = (1, 1, 1);
		}
	}
	if (level.show_avglife == 1) {
		if (!isdefined(self.hud_avglife_c)) {
			self.hud_avglife_c = newClientHudElem(self);
			self.hud_avglife_c.archived = false;
			self.hud_avglife_c.x = 614;
			self.hud_avglife_c.y = 86;
			self.hud_avglife_c.alignX = "center";
			self.hud_avglife_c.alignY = "middle";
			self.hud_avglife_c.fontScale = 0.6;
			self.hud_avglife_c.color = (1, 1, 0);
			self.hud_avglife_c.alpha = 0;
			self.hud_avglife_c setText(level.str_colon);
		}
		if (!isdefined(self.hud_avglife_m)) {
			self.hud_avglife_m = newClientHudElem(self);
			self.hud_avglife_m.archived = false;
			self.hud_avglife_m.x = 612;
			self.hud_avglife_m.y = 86;
			self.hud_avglife_m.alignX = "right";
			self.hud_avglife_m.alignY = "middle";
			self.hud_avglife_m.fontScale = 0.6;
			self.hud_avglife_m.color = (1, 1, 0);
			self.hud_avglife_m.alpha = 0;
		}
		if (!isdefined(self.hud_avglife_s)) {
			self.hud_avglife_s = newClientHudElem(self);
			self.hud_avglife_s.archived = false;
			self.hud_avglife_s.x = 616;
			self.hud_avglife_s.y = 86;
			self.hud_avglife_s.alignX = "left";
			self.hud_avglife_s.alignY = "middle";
			self.hud_avglife_s.fontScale = 0.6;
			self.hud_avglife_s.color = (1, 1, 0);
			self.hud_avglife_s.alpha = 0;
		}
		if (!isdefined(self.hud_avglife_z)) {
			self.hud_avglife_z = newClientHudElem(self);
			self.hud_avglife_z.archived = false;
			self.hud_avglife_z.x = 616;
			self.hud_avglife_z.y = 86;
			self.hud_avglife_z.alignX = "left";
			self.hud_avglife_z.alignY = "middle";
			self.hud_avglife_z.fontScale = 0.6;
			self.hud_avglife_z.color = (1, 1, 0);
			self.hud_avglife_z.alpha = 0;
		}
		if (!isdefined(self.hud_avglife_zs)) {
			self.hud_avglife_zs = newClientHudElem(self);
			self.hud_avglife_zs.archived = false;
			self.hud_avglife_zs.x = 621;
			self.hud_avglife_zs.y = 86;
			self.hud_avglife_zs.alignX = "left";
			self.hud_avglife_zs.alignY = "middle";
			self.hud_avglife_zs.fontScale = 0.6;
			self.hud_avglife_zs.color = (1, 1, 0);
			self.hud_avglife_zs.alpha = 0;
		}

	}

	self thread miniscore_myscore_destroy();


	while (1) {
		wait 0.05;

		if (!isdefined(self.pers["kills"]) || !isdefined(self.deaths))
			continue;

		self.kdhud_kills setValue(self.pers["kills"]);
		self.kdhud_deaths setValue(self.deaths);

		if (level.show_headshots == 1)
			self.hud_headshot_count setValue(self.pers["headshots"]);
		if (level.show_melees == 1)
			self.hud_melee_count setValue(self.pers["melees"]);

	}

}
miniscore_myscore_destroy() {
	self endon("death");
	self waittill("player_died");
	if (isdefined(self.kdhud_kills))
		self.kdhud_kills destroy();
	if (isdefined(self.kdhud_deaths))
		self.kdhud_deaths destroy();
	if (isdefined(self.kdhud_sep))
		self.kdhud_sep destroy();
}
miniscore_myratio() {
	if (!isdefined(self.kdhud_ratio_title)) {
		self.kdhud_ratio_title = newClientHudElem(self);
		self.kdhud_ratio_title.archived = false;
		self.kdhud_ratio_title.x = 597;
		self.kdhud_ratio_title.y = 57;
		self.kdhud_ratio_title.alignX = "left";
		self.kdhud_ratio_title.alignY = "top";
		self.kdhud_ratio_title.fontScale = 0.7;
		self.kdhud_ratio_title.sort = 1;
		self.kdhud_ratio_title.color = (1, 1, 1);		
	}
	self.kdhud_ratio_title setText(&"^2Ratio:");

	if (!isdefined(self.kdhud_ratio)) {
		self.kdhud_ratio = newClientHudElem(self);
		self.kdhud_ratio.archived = false;
		self.kdhud_ratio.x = 605;
		self.kdhud_ratio.y = 57;
		self.kdhud_ratio.alignX = "left";
		self.kdhud_ratio.alignY = "top";
		self.kdhud_ratio.fontScale = 0.7;
		self.kdhud_ratio.sort = 1;
		self.kdhud_ratio.color = (1, 1, 1);		
	}
}
roundtimer() {
	if (level.show_clockup == 1) {
		if (!isdefined(level.round_timer)) {
			r = 25;
			g = 247;
			b = 255;
			level.round_timer = newHudElem();
			level.round_timer.archived = false;
			level.round_timer.x = 5;
			level.round_timer.y = 370;
			level.round_timer.alignX = "left";
			level.round_timer.alignY = "top";
			level.round_timer.fontscale = 0.8;
			level.round_timer.color = ((float)r/(float)255, (float)g/(float)255, (float)b/(float)255);
			level.round_timer setTimerUp(0);
		}
	}
}

medic() {
	if (!isPlayer(self))
		return;
	
	for(;;) {
		if (self useButtonPressed() && self isOnGround() && self.medic) {
			holdtime = 0;
			while (self useButtonPressed() && self isOnGround() && self.medic && (holdtime < 1)) {
				holdtime += 0.05;
				wait 0.05;
			}
			self dropHealth();	
			self iprintln("dropping health");
		}
		wait (0.05);
	}
}
monitorHud() {
	self endon("disconnect");
	if ((level.nocrosshairs == 1) || (level.nocrosshairnames == 1) || (level.nohud == 1)) {
		for (;;) {
			if (level.nocrosshairs == 1) {
				self setClientCvar("cg_drawCrosshair", "0");
			}
			if (level.nocrosshairnames == 1) {
				self setClientCvar("cg_drawCrosshairnames", "0");
			}
			if ((level.nohud == 1) && (getcvar("g_Gametype") == "tdm")) {
				self setClientCvar("cg_drawStatus", "0");
				//self setClientCvar("cg_drawFPS", "0");
				//self setClientCvar("cg_lagometer", "0");
			}
			wait 3;
		}
	}
}
inc_time() {
	for (i=0;i<level.max_time;i++) {
		level.time_current = i;
		wait 60;
	}
}
notify_timeleft() {
	thread inc_time();
	x = 0;
	for (i=0;i<level.max_time;i++) {
		if (x == level.notify_every) {
			time_left = level.max_time - level.time_current;
			iprintln("* ^3There are ^1" + time_left + "^3 minutes left in this round");
			x = 0;
		}
	}
	wait 60;
	x++;
}
notify_timeleft1() {
	if (getcvar("g_gametype") != "tdm")
		return;

	timelimit = getcvarint("scr_tdm_timelimit");
	x = 0;
	for (i=0;i<timelimit;i++) {
		timeleft = timelimit - i;
		if (x == level.notify_every) {
			iprintln(level.clan_logo + ":^2 There are ^1" + timeleft + "^2 minutes left in this round");
			x = 0;
		}
		wait 60;
		x++;
	}
}
		
flashes() {
	wait 5;

	if (!isdefined(level.vMin) || !isdefined(level.vMax))
		return;

	if (level.bombers_altitude)
		z = level.bombers_altitude;
	else
		z = level.vMax[2];

	if (getcvarint("anarchic_debug") == 1)
	{
		iprintln("vMin[0]: " + level.vMin[0]);
		iprintln("vMin[1]: " + level.vMin[1]);
		iprintln("vMax[0]: " + level.vMax[0]);
		iprintln("vMax[1]: " + level.vMax[1]);
		iprintln("vMax[2]: " + level.vMax[2]);
	}
	while (1) {
		if (level.sky_flashes > 1)
			num = randomIntRange(1, level.sky_flashes);
		else num = 1;

		for (i = 0; i < num; i++) {
			x = randomIntRange(level.vMin[0], level.vMax[0]);
			y = randomIntRange(level.vMin[1], level.vMax[1]);
	
			//flash = spawn("script_model", (x, y, z));

			flash = spawn_model("xmodel/mp_bomb1", "flash", (x, y, z), (0, 0, 0));
			flash hide();
			flash thread flash_think();
		}

		time = randomIntRange(level.sky_flashes_delay_min, level.sky_flashes_delay_max);		
		
		wait time;
	}
}
flash_think() {
	fx = level._effect["flash"][randomInt(level._effect["flash"].size)];
	wait randomFloat(5.0);
	playfx(fx, self.origin);
	self playsound("skyflash");
	self thread flash_cleanup();
}
flash_cleanup() {
	wait 3;
	self delete();
}

substr(searchfor, searchin)
{
	location = -1;
	if(searchin.size < searchfor.size)
		return location;

	if(searchin.size == searchfor.size && searchin != searchfor)
		return location;

	if(searchfor.size == 0)
		return 0;

	for (c = 0; c < searchin.size; c++)
	{
		if(searchin[c] == searchfor[0]) // matched the first character
		{
			location = c;
			for(i = 0; i+c < searchin.size && i < searchfor.size && location > -1; i++)
			{
				if(searchin[i+c] != searchfor[i])
					location = -1;
			}
			if(i < searchfor.size)
				location = -1;
		}
	}

	return location;
}
/////////////////////////////////////////
// code loosely based on PRM for CoD 1.1
/////////////////////////////////////////
checkSnipers() {
	allied_sniper 	= 0;
	allied_smg 	= 0;
	allied_mg 	= 0;
	allied_lmg	= 0;
	allied_rocket	= 0;
	allied_flame	= 0;

	axis_sniper	= 0;
	axis_smg	= 0;
	axis_mg		= 0;
	axis_lmg	= 0;
	axis_rocket	= 0;
	axis_flame	= 0;

	brit_silenced	= 0;

	no_weapon = 0;

	lplayers = getentarray("player", "classname");

	for(i = 0; i < lplayers.size; i++) {
		lplayer = lplayers[i];

		if(!isdefined(lplayer.pers["weapon"])) {
			no_weapon++;
		}
		
		else {
			switch(lplayer.pers["weapon"]) {

				case "springfield_mp":
				case "mosin_nagant_sniper_mp":
					allied_sniper++;
					break;
				case "thompson_mp":
				case "sten_mp":
				case "ppsh_mp":
				case "ppsh_semi_mp":
					allied_smg++;
					break;
				case "bren_mp":
				case "bar_mp":
				case "bar_slow_mp":
					allied_mg++;
					break;
				case "dp28_mp":
				case "mg30cal_mp":
					allied_lmg++;
					break;
				case "kar98k_sniper_mp":
					axis_sniper++;
					break;
				case "mp40_mp":
					axis_smg++;
					break;
				case "mp44_mp":
					axis_mg++;
					break;
				case "mg34_mp":
					axis_lmg++;
					break;
				case "sten_silenced_mp":
					brit_silenced++;
					break;
				case "bazooka_mp":
					allied_rocket++;
					break;
				case "panzerschreck_mp":
					if ((game["allies"] == "russian") && (lplayer.pers["team"] == "allies"))
						allied_rocket++;
					else axis_rocket++;
					break;
				case "flamethrower_mp":
					if (lplayer.pers["team"] == "axis")
						axis_flame++;
					else allied_flame++;
					break;
				default:
					no_weapon++;
					break;
			}		
		}
	}

	switch (game["allies"]) {
		case "american":
			limitweapon("springfield", allied_sniper, level.allied_sniper, level.allow_springfield);
			limitweapon("thompson", allied_smg, level.allied_smg, level.allow_thompson);
			limitweapon("bar", allied_mg, level.allied_mg, level.allow_bar);
			limitweapon("mg30cal", allied_lmg, level.allied_lmg, level.allow_mg30cal);
			limitweapon("bazooka", allied_rocket, level.allied_rocket, level.allow_bazooka);
			limitweapon("flamethrower", allied_flame, level.allied_flame, level.allow_flamethrower);
			break;
		case "russian":
			limitweapon("nagantsniper", allied_sniper, level.allied_sniper, level.allow_nagantsniper);
			limitweapon("ppsh", allied_smg, level.allied_smg, level.allow_ppsh);
			limitweapon("dp28", allied_lmg, level.allied_lmg, level.allow_dp28);
			limitweapon("panzerschreck", allied_rocket, level.allied_rocket, level.allow_panzerschreck);
			limitweapon("flamethrower", allied_flame, level.allied_flame, level.allow_flamethrower);
			break;
		case "british":
			limitweapon("springfield", allied_sniper, level.allied_sniper, level.allow_springfield);
			limitweapon("sten", allied_smg, level.allied_smg, level.allow_sten);
			limitweapon("bren", allied_mg, level.allied_mg, level.allow_bren);
			limitweapon("mg30cal", allied_lmg, level.allied_lmg, level.allow_mg30cal);
			limitweapon("sten_silenced", brit_silenced, level.brit_silenced, level.allow_sten_silenced);
			limitweapon("bazooka", allied_rocket, level.allied_rocket, level.allow_bazooka);
			limitweapon("flamethrower", allied_flame, level.allied_flame, level.allow_flamethrower);
			break;
	}
	limitweapon("panzerschreck", axis_rocket, level.axis_rocket, level.allow_panzerschreck);
	limitweapon("kar98ksniper", axis_sniper, level.axis_sniper, level.allow_kar98ksniper);
	//iprintln("counted ^1" + axis_sniper + " ^7axis sniper"); 
	limitweapon("flamethrower", axis_flame, level.axis_flame, level.allow_flamethrower);
	limitweapon("mp40", axis_smg, level.axis_smg, level.allow_mp40);
	limitweapon("mp44", axis_mg, level.axis_mg, level.allow_mp44);
	limitweapon("mg34", axis_lmg, level.axis_lmg, level.allow_mg34);
}


limitweapon(weapon, count, limit, strict) {
	cvar_one = "scr_allow_" + weapon;
	cvar_two = "ui_allow_" + weapon;
	cvar_chk = getcvar(cvar_one);

	//if ((count < limit) && (level.weap_allow[weapon] == 1)) {
	if (count < limit) {
		if (cvar_chk == 0) {
			setcvar(cvar_one, "1");
			setcvar(cvar_two, "1");
		}
	}
	else {
		if (cvar_chk == 1) {
			setcvar(cvar_one, "0");
			setcvar(cvar_two, "0");
		}
	}
}
		
////////////////////////////////////////////////////////////////
/// following functions courtesy of raviradmin.gsc
////////////////////////////////////////////////////////////////
switchteam()
{
	self endon("boot");
	setcvar("g_switchteam", "");
	while(1)
	{
		if(getcvar("g_switchteam") != "")
		{
			if(getcvar("g_alliestag") != "" || getcvar("g_axistag") != "")
			{
				temptag = getcvar("g_alliestag");
				setcvar("g_alliestag", getcvar("g_axistag"));
				setcvar("g_axistag", temptag);
			}

			movePlayerNum = getcvarint("g_switchteam");
			players = getentarray("player", "classname");
			for(i = 0; i < players.size; i++)
			{
				thisPlayerNum = players[i] getEntityNumber();
				if(thisPlayerNum == movePlayerNum || movePlayerNum == -1) // this is the one we're looking for
				{

					if(players[i].pers["team"] == "axis")
						newTeam = "allies";
					if(players[i].pers["team"] == "allies")
						newTeam = "axis";

					players[i] suicide();

					if (isdefined(players[i].pers["score"]) && isdefined(players[i].pers["deaths"])) {
						players[i].pers["score"]++;
						players[i].pers["deaths"]--;
						players[i].score = players[i].pers["score"];
						players[i].deaths = players[i].pers["deaths"];
					}

					else {
						players[i].score++;
						players[i].deaths--;
					}

					players[i].pers["team"] = newTeam;
					players[i].pers["weapon"] = undefined;
					players[i].pers["weapon1"] = undefined;
					players[i].pers["weapon2"] = undefined;
					players[i].pers["spawnweapon"] = undefined;
					players[i].pers["savedmodel"] = undefined;

					players[i] setClientCvar("scr_showweapontab", "1");

					if(players[i].pers["team"] == "allies")
					{
						players[i] setClientCvar("g_scriptMainMenu", game["menu_weapon_allies"]);
						players[i] openMenu(game["menu_weapon_allies"]);
					}
					else
					{
						players[i] setClientCvar("g_scriptMainMenu", game["menu_weapon_axis"]);
						players[i] openMenu(game["menu_weapon_axis"]);
					}
					if(movePlayerNum != -1)
						iprintln(players[i].name + "^7 was forced to switch teams by the admin");
				}
			}
			if(movePlayerNum == -1)
				iprintln("The admin forced all players to switch teams.");

			setcvar("g_switchteam", "");
		}
		wait 0.05;
	}
}



killum()
{
	self endon("boot");
	setcvar("g_killum", "");
	while(1)
	{
		if(getcvar("g_killum") != "")
		{
			killPlayerNum = getcvarint("g_killum");
			players = getentarray("player", "classname");
			for(i = 0; i < players.size; i++)
			{
				thisPlayerNum = players[i] getEntityNumber();
				if(thisPlayerNum == killPlayerNum) // this is the one we're looking for
				{
					players[i] suicide();
					iprintln(players[i].name + "^7 was killed by the admin");
				}
			}
			setcvar("g_killum", "");
		}
		wait 0.05;
	}
}
smiteplayer() // make a player explode, will hurt people up to 15 feet away
{
	self endon("boot");
	setcvar("g_smite", "");
	while(1)
	{
		if(getcvar("g_smite") != "")
		{
			smitePlayerNum = getcvarint("g_smite");
			players = getentarray("player", "classname");
			for(i = 0; i < players.size; i++)
			{
				thisPlayerNum = players[i] getEntityNumber();
				if(thisPlayerNum == smitePlayerNum && players[i].sessionstate == "playing") // this is the one we're looking for
				{
					// explode 
					range = 180;
					maxdamage = 150;
					mindamage = 10;

					playfx(level._effect["bombsmite"], players[i].origin);
					playfx(level._effect["bombfire"], players[i].origin);
					radiusDamage(players[i].origin + (0,0,12), range, maxdamage, mindamage);
					iprintln("Lo, the admin smote " + players[i].name + " with fire!");
				}
			}
			setcvar("g_smite", "");
		}
		wait 0.05;
	}
}
// the following are based on ravir's stuff but with my own twist
wallOps()
{
	self endon("boot");
	setcvar ("wallop", "");
	while(1) {
		msg = getcvar("wallop");
		if (msg != "") {
			players = getentarray("player", "classname");
			for(i = 0; i < players.size; i++)
			{
				player = players[i];
				if (isadmin(player))
					clientAnnouncement(player, "^1admin^7CHAT: " + msg);
			}
			setcvar("wallop", "");
		}
		wait 0.1;
	}
}
forcename() {
	self endon("boot");
	setcvar ("g_forcename", "");
	while(1) {
		if (getcvar("g_forcename") != "") {
			ar = explode(getcvar("g_forcename"), ",");
			num = ar[0];
			name = ar[1];
			players = getentarray("player", "classname");
			if (isdefined(num) && isdefined(name))
			for(i = 0; i < players.size; i++)
			{
				this = players[i] getEntityNumber();
				if (this == num)
					players[i] setclientcvar("name", name);
			}
			setcvar("g_forcename", "");
		}
		wait 0.05;
	}
}
freezeum() {
	self endon("boot");

	setcvar("g_freeze", "");
	while(1)
	{
		if(getcvar("g_freeze") != "")
		{
			num = getcvarint("g_freeze");
			players = getentarray("player", "classname");
			for(i = 0; i < players.size; i++)
			{
				this = players[i] getEntityNumber();
				if(this == num && players[i].sessionstate == "playing") // this is the one we're looking for
				{
					level.stuck[players[i].name] = spawn ("script_model",(0,0,0));
					level.stuck[players[i].name].origin = players[i].origin;
					level.stuck[players[i].name].angles = players[i].angles;
					players[i] linkto (level.stuck[players[i].name]);
					players[i] disableweapon();
					iprintln("Lo, the admin froze " + players[i].name + "! Free kill!");
				}
			}
			setcvar("g_freeze", "");
		}
		wait 0.05;
	}
}
unfreezeum() {
	self endon("boot");

	setcvar("g_unfreeze", "");
	while(1)
	{
		if(getcvar("g_unfreeze") != "")
		{
			num = getcvarint("g_unfreeze");
			players = getentarray("player", "classname");
			for(i = 0; i < players.size; i++)
			{
				this = players[i] getEntityNumber();
				if(this == num && players[i].sessionstate == "playing") // this is the one we're looking for
				{
					if (isdefined(level.stuck[players[i].name])) {
						players[i] unlink();
						level.stuck[players[i].name] delete();
						players[i] enableweapon();
					}
				}
			}
			setcvar("g_unfreeze", "");
		}
		wait 0.05;
	}
}
////////////////////////////////////////////////////
// the following functions override _rank_gmi.gsc //
////////////////////////////////////////////////////
ranks() {
	rankLoadout();
	rankPoints();
}
rankPoints() {
	// default game["br_ppr"] is 10

	gt = getcvar("g_gametype");
	
	switch(gt) {
		case "tdm":
			game["br_rank_1"] = game["br_ppr"] * 1;
			game["br_rank_2"] = game["br_ppr"] * 2;
			game["br_rank_3"] = game["br_ppr"] * 3;
			game["br_rank_4"] = game["br_ppr"] * 3.5;
			break;
		default:
			game["br_rank_1"] = game["br_ppr"] * 1;
			game["br_rank_2"] = game["br_ppr"] * 2;
			game["br_rank_3"] = game["br_ppr"] * 3;
			game["br_rank_4"] = game["br_ppr"] * 4;
			break;
	}
}
rankLoadOut() {
	gt = getcvar("g_gametype");

	switch(gt) {
		case "tdm":
			game["br_ammo_gunclips_0"] = 5;
			game["br_ammo_gunclips_1"] = 5;
			game["br_ammo_gunclips_2"] = 6;
			game["br_ammo_gunclips_3"] = 6;
			game["br_ammo_gunclips_4"] = 7;

			game["br_ammo_pistolclips_0"] = 3;
			game["br_ammo_pistolclips_1"] = 3;
			game["br_ammo_pistolclips_2"] = 4;
			game["br_ammo_pistolclips_3"] = 4;
			game["br_ammo_pistolclips_4"] = 5;

			game["br_ammo_grenades_0"] = 1;
			game["br_ammo_grenades_1"] = 1;
			game["br_ammo_grenades_2"] = 2;
			game["br_ammo_grenades_3"] = 2;
			game["br_ammo_grenades_4"] = 3;

			game["br_ammo_smoke_grenades_0"] = 0;
			game["br_ammo_smoke_grenades_1"] = 0;
			game["br_ammo_smoke_grenades_2"] = 0;
			game["br_ammo_smoke_grenades_3"] = 1;
			game["br_ammo_smoke_grenades_4"] = 1;
	
			game["br_ammo_satchel_charge_0"] = 0;
			game["br_ammo_satchel_charge_1"] = 0;
			game["br_ammo_satchel_charge_2"] = 0;
			game["br_ammo_satchel_charge_3"] = 0;
			game["br_ammo_satchel_charge_4"] = 1;
			
			break;
		default:
			game["br_ammo_gunclips_0"] = 4;
			game["br_ammo_gunclips_1"] = 4;
			game["br_ammo_gunclips_2"] = 5;
			game["br_ammo_gunclips_3"] = 5;
			game["br_ammo_gunclips_4"] = 6;

			game["br_ammo_pistolclips_0"] = 2;
			game["br_ammo_pistolclips_1"] = 3;
			game["br_ammo_pistolclips_2"] = 3;
			game["br_ammo_pistolclips_3"] = 4;
			game["br_ammo_pistolclips_4"] = 4;

			game["br_ammo_grenades_0"] = 1;
			game["br_ammo_grenades_1"] = 2;
			game["br_ammo_grenades_2"] = 2;
			game["br_ammo_grenades_3"] = 2;
			game["br_ammo_grenades_4"] = 3;

			game["br_ammo_smoke_grenades_0"] = 1;
			game["br_ammo_smoke_grenades_1"] = 1;
			game["br_ammo_smoke_grenades_2"] = 2;
			game["br_ammo_smoke_grenades_3"] = 2;
			game["br_ammo_smoke_grenades_4"] = 2;
	
			game["br_ammo_satchel_charge_0"] = 0;
			game["br_ammo_satchel_charge_1"] = 1;
			game["br_ammo_satchel_charge_2"] = 2;
			game["br_ammo_satchel_charge_3"] = 2;
			game["br_ammo_satchel_charge_4"] = 2;

	}
}
giveBinoculars(spawnweapon)
{
	binoctype = "binoculars_mp";
	
	self takeWeapon("binoculars_mp");
	self takeWeapon("binoculars_artillery_mp");
	
	// if they are highest rank then they get the artillery strike binoculars
	if ( self.pers["rank"] == level.artillery_rank && level.allow_artillery)
	{
		
		if(self.pers["team"] == "allies")
		{
			switch(game["allies"])		
			{
			case "american":
				binoctype = "binoculars_artillery_mp";
				break;
	
			case "british":
				binoctype = "binoculars_artillery_mp";
				break;
	
			case "russian":
				binoctype = "binoculars_artillery_mp";
				break;
			}
		}
		else if(self.pers["team"] == "axis")
		{
			switch(game["axis"])
			{
			case "german":
				binoctype = "binoculars_artillery_mp";
				break;
			}			
		}
		
		self setWeaponSlotWeapon("binocular", binoctype);
		
		// They do not start with any ammo
		self setWeaponSlotClipAmmo("binocular", 0);
		
		// give them ammo regularly
		self thread maps\mp\gametypes\_rank_gmi::dispense_artillery_strike();
		self thread maps\mp\gametypes\_rank_gmi::artillery_strike_sounds();
		
	}
	else if ( self.pers["rank"] >= 2 && level.allow_binoculars )
	{
		if(self.pers["team"] == "allies")
		{
			switch(game["allies"])		
			{
			case "american":
				binoctype = "binoculars_mp";
				break;
	
			case "british":
				binoctype = "binoculars_mp";
				break;
	
			case "russian":
				binoctype = "binoculars_mp";
				break;
			}
		}
		else if(self.pers["team"] == "axis")
		{
			switch(game["axis"])
			{
			case "german":
				binoctype = "binoculars_mp";
				break;
			}			
		}
		
		self setWeaponSlotWeapon("binocular", binoctype);
	}
}

dispense_artillery_strike()
{
	first_interval = GetCvarInt("scr_artillery_first_interval");   
	interval = GetCvarInt("scr_artillery_interval");
	interval_range = GetCvarInt("scr_artillery_interval_range");
	
	if ( interval_range < 1 )
		interval_range = 1;
		
	self endon("death");
	
	// kill any currently running dispense_artillery_strike functions
	self notify("end dispense_artillery_strike");
	wait(0.1);
	self endon("end dispense_artillery_strike");
	
	// wait the first
	wait(first_interval);

	// does the map support artillery?
	arty_support = map_based_artillery();
	
	if (arty_support == 1) {
		while (1)
		{
			// go ahead and give them one ammo if they do not have any
			if ( self getWeaponSlotClipAmmo( "binocular" ) == 0 )
			{
				// let them know the artillery strike is available
				clientAnnouncement(self,&"GMI_RANK_ARTILLERY_IN_PLACE");
			
				// play a vo
				if ( self.pers["team"] == "allies" )	
				{
					switch( game["allies"])
					{
					case "british":
						sound = "uk_arty_gtg";
						break;
					case "russian":
						sound = "ru_arty_gtg";
						break;
					default:
						sound = "us_arty_gtg";
					}
				}
				else
				{
					sound = "ge_arty_gtg";
				}
				self playLocalSound(sound);
		
				// give them one
				self setWeaponSlotClipAmmo("binocular", 1);
			
				//set up the on screen icon
				maps\mp\gametypes\_rank_gmi::artillery_available_hud();
			}
		
			// wait until they use artillery
			self waittill("artillery");
	
			// now wait for one interval
			time = (interval + randomint(interval_range));
			self thread arty_timer(time);
			wait(time);
		}
	}
}
arty_timer(time)
{
	self endon("player_died");
	self endon("disconnect");

	if (level.arty_timer == 0)
		return;

	rand = (time * randomfloatrange(0.10,0.13)) + randomintrange(0,10);
	newtime = time - rand;
	if (newtime < 0) newtime = 0;
	wait newtime;

	if (!isdefined(self.arty_timer)) {
		r = 255;
		g = 255;
		b = 0;
		self.arty_timer = newClientHudElem(self);
		self.arty_timer.archived = false;
		self.arty_timer.x = 150;
		self.arty_timer.y = 450;
		self.arty_timer.alignX = "left";
		self.arty_timer.alignY = "top";
		self.arty_timer.fontscale = 0.8;
		self.arty_timer.color = ((float)r/(float)255, (float)g/(float)255, (float)b/(float)255);
		self.arty_timer setTimer(rand);
	}
	wait rand;
	if (isdefined(self.arty_timer))
		self.arty_timer destroy();

}
map_based_artillery() {
	mapname = getcvar("mapname");
	switch(mapname) {
		case "mp_nuenen":
		case "mp_offensive":
		case "mp_d-day+7":
		case "mp_saint-lo":
		case "mp_breakdown":
		case "mp_wolfsquare":
		case "mp_bonneville":
			return 0;
			break;
		default:
			return 1;
			break;
	}
}

dropHealth()
{
	if ( !getcvarint("scr_drophealth") )
		return;
		
	if(isDefined(level.healthqueue[level.healthqueuecurrent]))
		level.healthqueue[level.healthqueuecurrent] delete();
	
	level.healthqueue[level.healthqueuecurrent] = spawn("item_health", self.origin + (0, 0, 1));
	level.healthqueue[level.healthqueuecurrent].angles = (0, randomint(360), 0);

	level.healthqueuecurrent++;
	
	if(level.healthqueuecurrent >= 16)
		level.healthqueuecurrent = 0;
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
findmapdimensions()
{
	// Get entities
	entitytypes = getentarray();

	// Initialize
	iMaxX = entitytypes[0].origin[0];
	iMinX = iMaxX;
	iMaxY = entitytypes[0].origin[1];
	iMinY = iMaxY;
	iMaxZ = entitytypes[0].origin[2];
	iMinZ = iMaxZ;

	// Loop through the rest
	for(i = 1; i < entitytypes.size; i++)
	{
		// Find max values
		if (entitytypes[i].origin[0]>iMaxX)
			iMaxX = entitytypes[i].origin[0];

		if (entitytypes[i].origin[1]>iMaxY)
			iMaxY = entitytypes[i].origin[1];

		if (entitytypes[i].origin[2]>iMaxZ)
			iMaxZ = entitytypes[i].origin[2];

		// Find min values
		if (entitytypes[i].origin[0]<iMinX)
			iMinX = entitytypes[i].origin[0];

		if (entitytypes[i].origin[1]<iMinY)
			iMinY = entitytypes[i].origin[1];

		if (entitytypes[i].origin[2]<iMinZ)
			iMinZ = entitytypes[i].origin[2];
	}

	// Get middle of map
	iX = (int)(iMaxX + iMinX)/2;
	iY = (int)(iMaxY + iMinY)/2;
	iZ = (int)(iMaxZ + iMinZ)/2;

      // Find iMaxZ
	iTraceend = iZ;
	iTracelength = 10000;
	iTracestart = iTraceend + iTracelength;
	trace = bulletTrace((iX,iY,iTracestart),(iX,iY,iTraceend), false, undefined);
	if(trace["fraction"] != 1)
	{
		iMaxZ = iTracestart - (iTracelength * trace["fraction"]) - 100;
	} 
	
	// Find iMaxX
	iTraceend = iX;
	iTracelength = 30000;
	iTracestart = iTraceend + iTracelength;
	trace = bulletTrace((iTracestart,iY,iZ),(iTraceend,iY,iZ), false, undefined);
	if(trace["fraction"] != 1)
	{
		iMaxX = iTracestart - (iTracelength * trace["fraction"]) - 100;
	} 
	
	// Find iMaxY
	iTraceend = iY;
	iTracelength = 30000;
	iTracestart = iTraceend + iTracelength;
	trace = bulletTrace((iX,iTracestart,iZ),(iX,iTraceend,iZ), false, undefined);
	if(trace["fraction"] != 1)
	{
		iMaxY = iTracestart - (iTracelength * trace["fraction"]) - 100;
	} 

	// Find iMinX
	iTraceend = iX;
	iTracelength = 30000;
	iTracestart = iTraceend - iTracelength;
	trace = bulletTrace((iTracestart,iY,iZ),(iTraceend,iY,iZ), false, undefined);
	if(trace["fraction"] != 1)
	{
		iMinX = iTracestart + (iTracelength * trace["fraction"]) + 100;
	} 
	
	// Find iMinY
	iTraceend = iY;
	iTracelength = 30000;
	iTracestart = iTraceend - iTracelength;
	trace = bulletTrace((iX,iTracestart,iZ),(iX,iTraceend,iZ), false, undefined);
	if(trace["fraction"] != 1)
	{
		iMinY = iTracestart + (iTracelength * trace["fraction"]) + 100;
	} 

	// Find iMinZ
	iTraceend = iZ;
	iTracelength = 10000;
	iTracestart = iTraceend - iTracelength;
	trace = bulletTrace((iX,iY,iTracestart),(iX,iY,iTraceend), false, undefined);
	if(trace["fraction"] != 1)
	{
		iMinZ = iTracestart + (iTracelength * trace["fraction"]) + 100;
	} 

	level.vMax = (iMaxX, iMaxY, iMaxZ);
	level.vMin = (iMinX, iMinY, iMinZ);
}

isalpha(ch) {
	if (!isdefined(ch) || (ch == ""))
		return false;

	switch(ch) {
		// not working for " ' ; < >
		case "0": case "1": case "2": case "3": case "4":
		case "5": case "6": case "7": case "8": case "9":
		case "A": case "B": case "C": case "D": case "E":
		case "F": case "G": case "H": case "I": case "J":
		case "K": case "L": case "M": case "N": case "O":
		case "P": case "Q": case "R": case "S": case "T":
		case "U": case "V": case "W": case "X": case "Y":
		case "Z":
		case "a": case "b": case "c": case "d": case "e":
		case "f": case "g": case "h": case "i": case "j":
		case "k": case "l": case "m": case "n": case "o":
		case "p": case "q": case "r": case "s": case "t":
		case "u": case "v": case "w": case "x": case "y":
		case "z":
		case "~": case "`": case "!": case "@": case "#":
		case "$": case "%": case "^": case "&": case "*":
		case "(": case ")": case "_": case "-": case "=":
		case "+": case "[": case "]": case "{": case "}":
		case "|": case "\\": case "\<": case "\>": case "\'":
		case "\"": case "\;": case " ":
		case ",": case ".": case "/": case "?":
			break;

		default:
			return false;
	}
	return true;
}
isadmin(player) {
	guid = player getGuid();
	switch(guid) {
		//case 0:    // localhost
		case 140457: // gitman
		case 171786: // boog
		case 466441: // logik
		case 106576: // bella
		case 117375: // sterling
		case 196589: // maiden
		case 146229: // the plague
		case 137480: // ganoush
		case 100570: // clint
		case 105951: // powerforward
		case 208112: // iceman
		case 234055: // krovotnokov
		case 487227: // fullwood
		case 155123: // fishy
		case 391175: // drugcop
		case 111206: // cornrow
		case 120991: // veritas
		case 138251: // ransom
		case 156979: // geo
		case 531006: // sage
		case 153437: // hope
		case 229673: // rollin
		case 122849: // till
			return true;
		default:
			return false;
	}
}
skipbalancecheck(response) {
	self.ab_bp_r = "";
	if ((response == "axis") || (response == "allies")) {
		if (level.anarchic_balance == 0) {
			self.ab_bp_r = "auto-balance disabled";
			return true;
		}
		if (isadmin(self)) {
			self.ab_bp_r = "admin";
			return true;
		}
		numonteam["allies"] = 0;
		numonteam["axis"] = 0;

		players = getentarray("player", "classname");
		for(i = 0; i < players.size; i++) {
			player = players[i];
	
			if(!isDefined(player.pers["team"]) || player.pers["team"] == "spectator" || player == self)
				continue;

		numonteam[player.pers["team"]]++;
		}
		switch(response) {
			case "allies":
				if (numonteam["allies"] == 0) {
					self.ab_bp_r = "empty team";
					return true;
				}
			case "axis":
				if (numonteam["axis"] == 0) {
					self.ab_bp_r = "empty team";
					return true;
				}
			default:
				break;
		}
		if(numonteam["allies"] == numonteam["axis"]) {
			if(getTeamScore("allies") == getTeamScore("axis")) {
				self.ab_bp_r = "equal team, equal score";
				return true;
			}
		}
		return false;
	}
	return false;
}
warn_autoassign(var) {
	if (level.disable_announce)
		return;
	if (!var)
		self iprintln("^3* You have been auto-balanced.");
	else
		self iprintln("^3* Skipping auto-balance (" + self.ab_bp_r + ")");
}
			

nocolors(str) {
	tmp = "";
	for (i = 0; i < str.size; i++) {
		if (i+1 <= str.size) {
			if ((str[i] == "^") && (isnum(str[i+1])))
				i++;
			else tmp = tmp + str[i];
		}
		else break;
	}
	return tmp;
}
		
isnum(ch) {
	if (!isdefined(ch) || (ch == ""))
		return false;

	switch(ch) {
		case "1": case "2": case "3": case "4": case "5": case "6": case "7": case "8": case "9": case "0":
			return true;
		default:
			return false;
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

// Following code courtesy of AWE by bell
//
// Strip blanks at start and end of string
strip(s)
{
	if(s=="")
		return "";

	s2="";
	s3="";

	i=0;
	while(i<s.size && s[i]==" ")
		i++;

	// String is just blanks?
	if(i==s.size)
		return "";
	
	for(;i<s.size;i++)
	{
		s2 += s[i];
	}

	i=s2.size-1;
	while(s2[i]==" " && i>0)
		i--;

	for(j=0;j<=i;j++)
	{
		s3 += s2[j];
	}
		
	return s3;
}
explode(s,delimiter)
{
	j=0;
	temparr[j] = "";	

	for(i=0;i<s.size;i++)
	{
		if(s[i]==delimiter)
		{
			j++;
			temparr[j] = "";
		}
		else
			temparr[j] += s[i];
	}
	return temparr;
}
popHelmet( damageDir, damage)
{
	if(!isdefined(self.hatModel) || (self.helmet_popped))
		return;

	self.helmet_popped = true;

	//self detach( self.hatModel , "");
	self detach(self.hatModel);

	switch(self getstance())
	{
		case "prone":
			helmetoffset = (0,0,15);
			break;
		case "crouch":
			helmetoffset = (0,0,44);
			break;
		default:
			helmetoffset = (0,0,64);
			break;
	}

	switch(self.hatModel)
	{
		case "xmodel/equipment_british_beret_green":
		case "xmodel/equipment_british_beret_red":
		case "xmodel/equipment_german_kriegsmarine_hat":
		case "xmodel/sovietequipment_sidecap":
		case "xmodel/gear_german_hat_officer_wehr":
		case "xmodel/gear_german_hat_officer_falshrm":
			bounce = 0.2;
			impactsound = undefined;
			break;
		default:
			bounce = 0.7;
			impactsound = "grenade_bounce_default";
			break;
	}		

	rotation = (randomFloat(540), randomFloat(540), randomFloat(540));
	offset = (0,0,-6);
	radius = 6;
	velocity = maps\mp\_utility::vectorScale(damageDir, (damage/20 + randomFloat(5)) ) + (0,0,(damage/20 + randomFloat(5)) );

	helmet = spawn("script_model", self.origin + helmetoffset );
	helmet setmodel( self.hatModel );
	helmet.angles = self.angles;
	helmet thread bounceObject(rotation, velocity, offset, (-90,0,-90), radius, 15, bounce, impactsound, undefined, "helmet");
}

//
// bounceObject
//
// rotation		(pitch, yaw, roll) degrees/seconds
// velocity		start velocity
// offset		offset between the origin of the object and the desired rotation origin.
// angles		angles offset between anchor and object
// radius		radius between rotation origin and object surfce
// ttl		time to live
// falloff		velocity falloff for each bounce 0 = no bounce, 1 = bounce forever
// bouncesound	soundalias played at bounching
// bouncefx		effect to play on bounce
//
bounceObject(vRotation, vVelocity, vOffset, angles, radius, ttl, falloff, bouncesound, bouncefx, objecttype)
{
	// Hide until everthing is setup
	self hide();

	// Setup default values
	if(!isdefined(vRotation))	vRotation = (0,0,0);
	pitch = (float)vRotation[0]/(float)20;	// Pitch/frame
	yaw	= (float)vRotation[1]/(float)20;	// Yaw/frame
	roll	= (float)vRotation[2]/(float)20;	// Roll/frame

	if(!isdefined(vVelocity))	vVelocity = (0,0,0);
	if(!isdefined(vOffset))		vOffset = (0,0,0);
	if(!isdefined(falloff))		falloff = 0.5;
	if(!isdefined(ttl))		ttl = 30;

	// Spawn anchor (the object that we will rotate)
	anchor = spawn("script_model", self.origin );
	anchor.angles = self.angles;

	// Link to anchor
	self linkto( anchor, "", vOffset, angles );
	self show();
	wait .05;	// Let it happen

	// Set gravity
	vGravity = (0,0,-2);

	stopme = 0;
	// Drop with gravity
	while(1)
	{
		// Let gravity do, what gravity do best
		vVelocity +=vGravity;

		// Get destination origin
		neworigin = anchor.origin + vVelocity;

		// Check for impact, check for entities but not myself.
		trace=bulletTrace(anchor.origin,neworigin,true,self); 
		if(trace["fraction"] != 1)	// Hit something
		{
			// Place object at impact point - radius
			distance = distance(anchor.origin,trace["position"]);
			if(distance)
			{
				fraction = (distance - radius) / distance;
				delta = trace["position"] - anchor.origin;
				delta2 = maps\mp\_utility::vectorScale(delta,fraction);
				neworigin = anchor.origin + delta2;
			}
			else
				neworigin = anchor.origin;


			// Play sound if defined
			if(isdefined(bouncesound)) anchor playSound(bouncesound);

			// Test if we are hitting ground and if it's time to stop bouncing
			if(vVelocity[2] <= 0 && vVelocity[2] > -10) stopme++;
			if(stopme==5) break;

			// Play effect if defined and it's a hard hit
			if(isdefined(bouncefx) && length(vVelocity) > 20) playfx(bouncefx,trace["position"]);

			// Decrease speed for each bounce.
			vSpeed = length(vVelocity) * falloff;

			// Calculate new direction (Thanks to Hellspawn this is finally done correctly)
			vNormal = trace["normal"];
			vDir = maps\mp\_utility::vectorScale(vectorNormalize( vVelocity ),-1);
			vNewDir = ( maps\mp\_utility::vectorScale(maps\mp\_utility::vectorScale(vNormal,2),vectorDot( vDir, vNormal )) ) - vDir;

			// Scale vector
			vVelocity = maps\mp\_utility::vectorScale(vNewDir, vSpeed);
	
			// Add a small random distortion
			vVelocity += (randomFloat(1)-0.5,randomFloat(1)-0.5,randomFloat(1)-0.5);
		}

		anchor.origin = neworigin;

		// Rotate pitch
		a0 = anchor.angles[0] + pitch;
		while(a0<0) a0 += 360;
		while(a0>359) a0 -=360;

		// Rotate yaw
		a1 = anchor.angles[1] + yaw;
		while(a1<0) a1 += 360;
		while(a1>359) a1 -=360;

		// Rotate roll
		a2 = anchor.angles[2] + roll;
		while(a2<0) a2 += 360;
		while(a2>359) a2 -=360;
		anchor.angles = (a0,a1,a2);
		
		// Wait one frame
		wait .05;
		ttl -= .05;
		if(ttl<=0) break;
	}

	// Set origin to impactpoint	
	anchor.origin = neworigin;

	// Unlink and remove the anchor
	self unlink();
	anchor delete();

	// Stay for the specified amount of time
	if(ttl>0) wait ttl;

	// Vanish
	self delete();
}
getWeaponName(weapon)
{
	switch(weapon)
	{
	case "m1carbine_mp":
		weaponname = &"WEAPON_M1A1CARBINE";
		break;
	case "m1garand_mp":
		weaponname = &"WEAPON_M1GARAND";
		break;
	case "thompson_mp":
	case "thompson_semi_mp":
		weaponname = &"WEAPON_THOMPSON";
		break;
	case "bar_mp":
	case "bar_slow_mp":
		weaponname = &"WEAPON_BAR";
		break;
	case "springfield_mp":
		weaponname = &"WEAPON_SPRINGFIELD";
		break;
	case "mg30cal_mp":
		weaponname = &"GMI_WEAPON_30CAL";
		break;
	case "enfield_mp":
		weaponname = &"WEAPON_LEEENFIELD";
		break;
	case "sten_mp":
		weaponname = &"WEAPON_STEN";
		break;
	case "sten_silenced_mp":
		weaponname = &"GMI_WEAPON_SILENCED_STEN";
		break;		
	case "bren_mp":
		weaponname = &"WEAPON_BREN";
		break;
	case "mosin_nagant_mp":
		weaponname = &"WEAPON_MOSINNAGANT";
		break;
	case "svt40_mp":
		weaponname = &"GMI_WEAPON_SVT40";
		break;
	case "ppsh_mp":
	case "ppsh_semi_mp":
		weaponname = &"WEAPON_PPSH";
		break;
	case "mosin_nagant_sniper_mp":
		weaponname = &"WEAPON_SCOPEDMOSINNAGANT";
		break;
	case "dp28_mp":
		weaponname = &"GMI_WEAPON_DP28";
		break;
	case "kar98k_mp":
		weaponname = &"WEAPON_KAR98K";
		break;
	case "gewehr43_mp":
		weaponname = &"GMI_WEAPON_GEWEHR43";
		break;
	case "mp40_mp":
		weaponname = &"WEAPON_MP40";
		break;
	case "mp44_mp":
	case "mp44_semi_mp":
		weaponname = &"WEAPON_MP44";
		break;
	case "mg34_mp":
		weaponname = &"GMI_WEAPON_MG34";
		break;
	case "kar98k_sniper_mp":
		weaponname = &"WEAPON_SCOPEDKAR98K";
		break;
	case "fraggrenade_mp":
		weaponname = &"WEAPON_M2FRAGGRENADE";
		break;
	case "mk1britishfrag_mp":
		weaponname = &"WEAPON_MK2FRAGGRENADE";
		break;
	case "stielhandgranate_mp":
		weaponname = &"WEAPON_GERMANGRENADE";
		break;
	case "rgd-33russianfrag_mp":
		weaponname = &"WEAPON_RUSSIANGRENADE";
		break;
	case "bazooka_mp":
		weaponname = &"GMI_WEAPON_BAZOOKA";
		break;
	case "panzerschreck_mp":
		weaponname = &"GMI_WEAPON_PANZERSCHRECK";
		break;
	case "flamethrower_mp":
		weaponname = &"GMI_WEAPON_FLAMMENWERFER";
		break;
	case "webley_mp":
		weaponname = &"GMI_WEAPON_WEBLEY";
		break;
	case "satchelcharge_mp":
		weaponname = &"GMI_WEAPON_SATCHEL";
		break;
	case "tt33_mp":
		weaponname = &"GMI_WEAPON_TT33";
		break;
	case "colt_mp":
		weaponname = &"WEAPON_COLT45";
		break;
	case "luger_mp":
		weaponname = &"WEAPON_LUGER";
		break;
	case "fg42_mp":
	case "fg42_semi_mp":
		weaponname = &"WEAPON_FG42";
		break;
	case "panzerfaust_mp":
		weaponname = &"WEAPON_PANZERFAUST";
		break;
	case "smokegrenade_mp":
		weaponname = &"GMI_WEAPON_SMOKEGRENADE";
		break;

	default:
		weaponname = &"WEAPON_UNKNOWNWEAPON";
		iprintln("weapon unknown: " + weapon);
		break;
	}

	return weaponname;
}
isPrivateClient(player) {
	playerslot = player getEntityNumber();
	privateslots = getcvar("sv_privateclients");

	if ( !isdefined(playerslot) || !isdefined(privateslots) )
		return false;

	if (playerslot < privateslots)
		return true;
	else return false;
}
isAlivePlayingNotDriving(player) {
		if (	isPlayer(player)
			&& isalive(player)
			&& (player.sessionstate == "playing")
			&& !player isInVehicle()
		   )
			return true;
		else return false;
}
isStand() {
	switch (self getStance()) {
		case "stand":
			return true;
		default:
			return false;
	}
}
isCrouch() {
	switch (self getStance()) {
		case "crouch":
			return true;
		default:
			return false;
	}
}
isProne() {
	switch (self getStance()) {
		case "prone":
			return true;
		default:
			return false;
	}
}
setStance(s) {
	switch (s) {
		case "prone":
			self setClientCvar("cl_stance", 2);
			break;
		case "crouch":
			self setClientCvar("cl_stance", 1);
			break;
		case "stand":
			self setClientCvar("cl_stance", 0);
			break;
	}
}
debugOrigin() {
	for (;;)
	{
		self iprintln("self origin: " + self.origin);
		wait 5;
	}
}
abs(x) {
	return ( (x*x)/2 );
}
devprint(str)
{
	if (getcvarint("anarchic_debug") == 1)
		self iprintln(str);
}
