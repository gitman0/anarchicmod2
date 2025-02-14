// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
main()
{
	self setModel("xmodel/playerbody_american_airborne");
	character\_utility::attachFromArray(xmodelalias\head_allied_ax::main());
	self.hatModel = character\_utility::randomelement(xmodelalias\helmet_allied_airborne::main());
	self attach(self.hatModel);
	self setViewmodel("xmodel/viewmodel_hands_us");

	switch(randomint(9))
	{
	case 0:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load1");
			self attach("xmodel/gear_US_bandolier");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 1:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load1");
			self attach("xmodel/gear_US_frntgnrc");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 2:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load1");
			self attach("xmodel/gear_US_frntknklknfe");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 3:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load2");
			self attach("xmodel/gear_US_bandolier");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 4:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load2");
			self attach("xmodel/gear_US_frntgnrc");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 5:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load2");
			self attach("xmodel/gear_US_frntknklknfe");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 6:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load3");
			self attach("xmodel/gear_US_bandolier");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 7:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load3");
			self attach("xmodel/gear_US_frntgnrc");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	case 8:
		if (character\_utility::useOptionalModels())
		{
			self attach("xmodel/gear_US_load3");
			self attach("xmodel/gear_US_frntknklknfe");
			self attach("xmodel/gear_US_ammobelt");
		}
		break;
	}
	self.voice = "american";
}

precache()
{
	precacheModel("xmodel/playerbody_american_airborne");
	character\_utility::precacheModelArray(xmodelalias\head_allied_ax::main());
	character\_utility::precacheModelArray(xmodelalias\helmet_allied_airborne::main());
	precacheModel("xmodel/viewmodel_hands_us");
	if (character\_utility::useOptionalModels())
	{
		precacheModel("xmodel/gear_US_load1");
		precacheModel("xmodel/gear_US_load2");
		precacheModel("xmodel/gear_US_load3");
		precacheModel("xmodel/gear_US_bandolier");
		precacheModel("xmodel/gear_US_ammobelt");
		precacheModel("xmodel/gear_US_frntgnrc");
		precacheModel("xmodel/gear_US_frntknklknfe");
	}
}
