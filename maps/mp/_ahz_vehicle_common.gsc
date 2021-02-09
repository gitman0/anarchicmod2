get_allied_spawnpoints () {

	gt = getcvar("g_gametype");
	switch (gt) {
		case "sd":case "mc_sd":case "dem":case "mc_dem":case "rsd":case "mc_rsd":
			spawn_allied   = getentarray("mp_searchanddestroy_spawn_allied", "classname");
			break;

		case "re":case "mc_re":
			spawn_allied   = getentarray("mp_retrieval_spawn_allied", "classname");
			break;

		case "bas":case "mc_bas":
			spawn_allied   = getentarray("mp_gmi_bas_allies_spawn", "classname");
			break;

		case "actf":case "mc_actf":
			spawn_allied   = getentarray("mp_retrieval_spawn_allied", "classname");
			if(!spawn_allied.size) {
				spawn_allied   = getentarray("mp_searchanddestroy_spawn_allied", "classname");
			}
			break;

		case "lts":case "mc_lts":
			spawn_allied   = getentarray("mp_searchanddestroy_spawn_allied", "classname");
			if(!spawn_allied.size) {
				spawn_allied   = getentarray("mp_retrieval_spawn_allied", "classname");
			}
			if(!spawn_allied.size) {
				spawn_allied   = getentarray("mp_teamdeathmatch_spawn", "classname");
			}
			if(!spawn_allied.size) {
				spawn_allied   = getentarray("mp_deathmatch_spawn", "classname");
			}
			break;

		case "ctf":case "mc_ctf":case "dom":case "mc_dom":
			spawn_allied   = getentarray("mp_uo_spawn_allied", "classname");
			if(!spawn_allied.size)
				spawn_allied = getentarray("mp_uo_spawn_allied_secondary", "classname");
			break;

		case "cnq":
			
				//for attackers get the id = 0 spawners
				if (game["attackers"] == "allied") {
					spawn_allied = getentarray("attackers0", "targetname");
					if (!isdefined(spawn_allied) && (spawn_allied.size == 0))
						spawn_allied = getentarray("attackers1", "targetname");
				} else {
					
					//for defenders, go through all the spawn objectives and find the last one
					//then use that to pull the spawners there
					conquest_objectives = getentarray("spawnobjective","targetname");
					lastObj = 0;
					for(i = 0; i < conquest_objectives.size; i++) 	{
						if (conquest_objectives[i].script_idnumber > lastObj)
							lastObj = conquest_objectives[i].script_idnumber;
					}
					spawn_allied = getentarray("defenders"+lastObj, "targetname");
				}
			break;

		default:
			spawn_allied   = getentarray("mp_teamdeathmatch_spawn", "classname");
			break;
	}
	if (!spawn_allied.size)	spawn_allied = getentarray("mp_teamdeathmatch_spawn", "classname");
	if (!spawn_allied.size)	spawn_allied = getentarray("mp_deathmatch_spawn", "classname");

	return spawn_allied;
}

get_axis_spawnpoints () {

	gt = getcvar("g_gametype");
	switch (gt) {
		case "sd":case "mc_sd":case "dem":case "mc_dem":case "rsd":case "mc_rsd":
			spawn_axis   = getentarray("mp_searchanddestroy_spawn_axis", "classname");
			break;

		case "re":case "mc_re":
			spawn_axis   = getentarray("mp_retrieval_spawn_axis", "classname");
			break;

		case "bas":case "mc_bas":
			spawn_axis   = getentarray("mp_gmi_bas_axis_spawn", "classname");
			break;

		case "actf":case "mc_actf":
			spawn_axis   = getentarray("mp_retrieval_spawn_axis", "classname");
			if(!spawn_axis.size) {
				spawn_axis   = getentarray("mp_searchanddestroy_spawn_axis", "classname");
			}
			break;

		case "lts":case "mc_lts":
			spawn_axis   = getentarray("mp_searchanddestroy_spawn_axis", "classname");
			if(!spawn_axis.size) {
				spawn_axis   = getentarray("mp_retrieval_spawn_axis", "classname");
			}
			if(!spawn_axis.size) {
				spawn_axis   = getentarray("mp_teamdeathmatch_spawn", "classname");
			}
			if(!spawn_axis.size) {
				spawn_axis   = getentarray("mp_deathmatch_spawn", "classname");
			}
			break;

		case "ctf":case "mc_ctf":case "dom":case "mc_dom":
			spawn_axis   = getentarray("mp_uo_spawn_axis", "classname");
			if(!spawn_axis.size)
				spawn_axis = getentarray("mp_uo_spawn_axis_secondary", "classname");
			break;

		case "cnq":
			
				//for attackers get the id = 0 spawners
				if (game["attackers"] == "axis") {
					spawn_axis = getentarray("attackers0", "targetname");
					if (!isdefined(spawn_axis) && (spawn_axis.size == 0))
						spawn_axis = getentarray("attackers1", "targetname");
				} else {
					
					//for defenders, go through all the spawn objectives and find the last one
					//then use that to pull the spawners there
					conquest_objectives = getentarray("spawnobjective","targetname");
					lastObj = 0;
					for(i = 0; i < conquest_objectives.size; i++) 	{
						if (conquest_objectives[i].script_idnumber > lastObj)
							lastObj = conquest_objectives[i].script_idnumber;
					}
					spawn_axis = getentarray("defenders"+lastObj, "targetname");
				}
			break;

		default:
			spawn_axis   = getentarray("mp_teamdeathmatch_spawn", "classname");
			break;
	}
	if (!spawn_axis.size)	spawn_axis = getentarray("mp_teamdeathmatch_spawn", "classname");
	if (!spawn_axis.size)	spawn_axis = getentarray("mp_deathmatch_spawn", "classname");

	return spawn_axis;
}