main() {
	setCullFog (0, 13500, .32, .36, .40, 0);
	ambientPlay("ambient_mp_brecourt");

	maps\mp\_load::main();

	level._effect["smoke"] = loadfx ("fx/smoke/ash_smoke.efx");
	maps\mp\_fx::loopfx("smoke", (1736, -272, 64), 0.7);

	game["allies"] = "american";
	game["axis"] = "german";

	game["russian_soldiertype"] = "airborne";
	game["russian_soldiervariation"] = "normal";
	game["german_soldiertype"] = "fallschirmjagercamo";
	game["german_soldiervariation"] = "normal";

	game["attackers"] = "allies";
	game["defenders"] = "axis";


	if (getcvar("g_gametype") == "hq") {

		//spawn radio 1
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (-1374, -1362, 10);
		radio.angles = (0, 315, 0);
		radio.targetname = "hqradio";

		//spawn radio 2
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (-934, -3496, 4);
		radio.angles = (0, 0, 0);
		radio.targetname = "hqradio";

		//spawn radio 3
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (-964, -256, 152);
		radio.angles = (0, 45, 0);
		radio.targetname = "hqradio";

		//spawn radio 4
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (288, -560, 8);
		radio.angles = (0, 180, 0);
		radio.targetname = "hqradio";

		//spawn radio 5
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (74, 660, 18);
		radio.angles = (0, 180, 0);
		radio.targetname = "hqradio";

		//spawn radio 6
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (444, -3330, 264);
		radio.angles = (0, 0, 6);
		radio.targetname = "hqradio";

		//spawn radio 7
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (412, -2292, 52);
		radio.angles = (0, 180, 0);
		radio.targetname = "hqradio";

		//spawn radio 8
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (582, -2526, 176);
		radio.angles = (0, 180, 0);
		radio.targetname = "hqradio";

		//spawn radio 9
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (1860, -546, 0);
		radio.angles = (0, 180, 0);
		radio.targetname = "hqradio";

		//spawn radio 10
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (1664, 2218, 2);
		radio.angles = (0, 270, 0);
		radio.targetname = "hqradio";

		//spawn radio 11
		radio = spawn ("script_model", (0,0,0));
		radio.origin = (-1558, 552, -14);
		radio.angles = (0, 0, 0);
		radio.targetname = "hqradio";
	}
}