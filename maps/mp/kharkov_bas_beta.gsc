main()
{
	setCullFog(0, 18000, 0.35, 0.345, 0.33, 0 );
	ambientPlay("ambient_mp_berlin");

	setcvar("sv_night", "0" );

	maps\mp\_load::main();
	level thread maps\mp\_flak_gmi::main();
	level thread maps\mp\kharkov_bas_beta_fx::main();
	maps\mp\kharkov_bas_beta::layout_images();
	level thread maps\mp\_tankdrive_gmi::main();
	level thread maps\mp\_jeepdrive_gmi::main();

	level thread firesounds();

	//precachemodel("xmodel/mp_artillery_flak88");

	game["allies"] = "russian";
	game["axis"] = "german";

	game["hud_allies_victory_image"] = "gfx/hud/hud@mp_victory_kharkov_r.dds";
	game["hud_axis_victory_image"] = "gfx/hud/hud@mp_victory_kharkov_g.dds";
      

	game["attackers"] = "axis";
	game["defenders"] = "allies";

	game["compass_range"] = 4000;

      game["bas_allies_rubble"] 	= "xmodel/mp_bunker_rhinevalley_rubble";
	game["bas_allies_complete"] 	= "xmodel/mp_bunker_rhinevalley";
	game["bas_allies_damaged"] 	= "xmodel/mp_bunker_rhinevalley_predmg";
	game["bas_allies_destroyed"] 	= "xmodel/mp_bunker_rhinevalley_dmg";
	game["bas_axis_rubble"] 	= "xmodel/mp_bunker_rhinevalley_rubble";
	game["bas_axis_complete"] 	= "xmodel/mp_bunker_rhinevalley";
	game["bas_axis_damaged"] 	= "xmodel/mp_bunker_rhinevalley_predmg";
	game["bas_axis_destroyed"] 	= "xmodel/mp_bunker_rhinevalley_dmg";

	if (getcvar("fs_copyfiles") == "1")
	{

		precacheShader(game["bas_layoutimage"]);
		precacheShader(game["hud_allies_victory_image"]);
		precacheShader(game["hud_axis_victory_image"]);
	}
      
}

firesounds()
{
	org1 = spawn("script_model",(1376, -1600, -32));
	org1 playloopsound ("medfire");
	org2 = spawn("script_model",(2048, 3392, 376));
	org2 playloopsound ("bigfire");
	org3 = spawn("script_model",(-110, -4496, -42));
	org3 playloopsound ("medfire");
	org4 = spawn("script_model",(3776, -1024, -16));
	org4 playloopsound ("medfire");
}

layout_images()
{
      game["bas_layoutimage"] = "kharkov_beta";
}




      

	

