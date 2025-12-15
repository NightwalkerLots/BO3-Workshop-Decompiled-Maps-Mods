#include scripts\shared\flag_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace clientfield;

/*
	Name: init
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x588
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec init()
{
	system::Ignore("zm_flashlight");
	modvar("viewmodel_p0_move0", "");
}

/*
	Name: function_e9ab88a4
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x5D0
	Size: 0x4E8
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function function_e9ab88a4()
{
	version = MakeLocalizedString("PLATFORM_AAE_VERSION");
	if(IsSubStr(version, "TU24"))
	{
		SetDvar("tu10_validationFatal", 0);
		return;
	}
	while(GetDvarString("aae_no_support") != "1")
	{
		wait(0.05);
	}
	var_acbc754c = NewHudElem();
	var_acbc754c.alignX = "center";
	var_acbc754c.alignY = "middle";
	var_acbc754c.horzAlign = "center";
	var_acbc754c.vertAlign = "middle";
	var_acbc754c.x = 0;
	var_acbc754c.y = 0;
	var_acbc754c.foreground = 1;
	var_acbc754c.fontscale = 3;
	var_acbc754c.alpha = 1;
	var_acbc754c.color = (1, 1, 1);
	var_acbc754c.hidewheninmenu = 0;
	var_acbc754c setText(&"AAEOPTIONS_NO_SUPPORT_LINE1");
	var_acbc754c = NewHudElem();
	var_acbc754c.alignX = "center";
	var_acbc754c.alignY = "middle";
	var_acbc754c.horzAlign = "center";
	var_acbc754c.vertAlign = "middle";
	var_acbc754c.x = 0;
	var_acbc754c.y = 0;
	var_acbc754c.foreground = 1;
	var_acbc754c.fontscale = 2;
	var_acbc754c.alpha = 1;
	var_acbc754c.color = (1, 1, 1);
	var_acbc754c.hidewheninmenu = 0;
	var_acbc754c setText(&"AAEOPTIONS_NO_SUPPORT_LINE2");
	var_acbc754c = NewHudElem();
	var_acbc754c.alignX = "center";
	var_acbc754c.alignY = "middle";
	var_acbc754c.horzAlign = "center";
	var_acbc754c.vertAlign = "middle";
	var_acbc754c.x = 0;
	var_acbc754c.y = 0;
	var_acbc754c.foreground = 1;
	var_acbc754c.fontscale = 2;
	var_acbc754c.alpha = 1;
	var_acbc754c.color = (1, 1, 1);
	var_acbc754c.hidewheninmenu = 0;
	var_acbc754c setText(&"AAEOPTIONS_NO_SUPPORT_LINE3");
	var_acbc754c = NewHudElem();
	var_acbc754c.alignX = "center";
	var_acbc754c.alignY = "middle";
	var_acbc754c.horzAlign = "center";
	var_acbc754c.vertAlign = "middle";
	var_acbc754c.x = 0;
	var_acbc754c.y = 0;
	var_acbc754c.foreground = 1;
	var_acbc754c.fontscale = 2;
	var_acbc754c.alpha = 1;
	var_acbc754c.color = (1, 1, 1);
	var_acbc754c.hidewheninmenu = 0;
	var_acbc754c setText(&"AAEOPTIONS_NO_SUPPORT_LINE4");
	for(;;)
	{
		SetDvar("cg_draw2d", 1);
		SetDvar("aae_no_support", 1);
		wait(0.05);
	}
}

/*
	Name: register
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xAC0
	Size: 0x70
	Parameters: 5
	Flags: None
	Line Number: 115
*/
function register(str_pool_name, str_name, n_version, n_bits, str_type)
{
	if(function_90b279c9(str_name))
	{
		RegisterClientField(str_pool_name, str_name, n_version, n_bits, str_type);
	}
}

/*
	Name: set
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xB38
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 133
*/
function set(str_field_name, n_value)
{
	function_350dbef5();
	if(function_90b279c9(str_field_name))
	{
		if(self == level)
		{
			CodeSetWorldClientField(str_field_name, n_value);
		}
		else if(str_field_name == "sndRattle" && level.script == "zm_moon")
		{
			self.owner notify("projectile_impact", GetWeapon("bouncingbetty"), self.origin);
		}
		CodeSetClientField(self, str_field_name, n_value);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_to_player
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 162
*/
function set_to_player(str_field_name, n_value)
{
	function_350dbef5();
	if(function_90b279c9(str_field_name))
	{
		CodeSetPlayerStateClientField(self, str_field_name, n_value);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: set_player_uimodel
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xC88
	Size: 0x188
	Parameters: 2
	Flags: None
	Line Number: 183
*/
function set_player_uimodel(str_field_name, n_value)
{
	function_350dbef5();
	if(function_90b279c9(str_field_name))
	{
		if(!IsEntity(self))
		{
			return;
		}
		CodeSetUIModelClientField(self, str_field_name, n_value);
		if(level.script == "zm_cosmodrome" && IsSubStr(str_field_name, "hudItems.perks.") && n_value == 2)
		{
			hudItems = [];
			hudItems["hudItems.perks.juggernaut"] = "zmb_hud_flash_jugga";
			hudItems["hudItems.perks.quick_revive"] = "zmb_hud_flash_revive";
			hudItems["hudItems.perks.sleight_of_hand"] = "zmb_hud_flash_speed";
			hudItems["hudItems.perks.additional_primary_weapon"] = "zmb_hud_flash_speed";
			hudItems["hudItems.perks.marathon"] = "zmb_hud_flash_stamina";
			hudItems["hudItems.perks.widows_wine"] = "zmb_hud_flash_phd";
			if(isdefined(hudItems[str_field_name]))
			{
				self playlocalsound(hudItems[str_field_name]);
			}
		}
	}
}

/*
	Name: get_player_uimodel
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xE18
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 220
*/
function get_player_uimodel(str_field_name)
{
	if(function_90b279c9(str_field_name))
	{
		return CodeGetUIModelClientField(self, str_field_name);
		return;
	}
}

/*
	Name: increment
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xE60
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 239
*/
function increment(str_field_name, n_increment_count)
{
	if(!isdefined(n_increment_count))
	{
		n_increment_count = 1;
	}
	function_350dbef5();
	if(str_field_name == "low_grav_powerup_triggered")
	{
		playsoundatposition("zmb_cha_ching", self.origin);
		return;
	}
	if(function_90b279c9(str_field_name))
	{
		for(i = 0; i < n_increment_count; i++)
		{
			if(self == level)
			{
				CodeIncrementWorldClientField(str_field_name);
				continue;
			}
			CodeIncrementClientField(self, str_field_name);
		}
	}
}

/*
	Name: increment_uimodel
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0xF58
	Size: 0x150
	Parameters: 2
	Flags: None
	Line Number: 275
*/
function increment_uimodel(str_field_name, n_increment_count)
{
	if(!isdefined(n_increment_count))
	{
		n_increment_count = 1;
	}
	function_350dbef5();
	if(function_90b279c9(str_field_name))
	{
		if(self == level)
		{
			foreach(player in level.players)
			{
				for(i = 0; i < n_increment_count; i++)
				{
					CodeIncrementUIModelClientField(player, str_field_name);
				}
			}
		}
		else
		{
			for(i = 0; i < n_increment_count; i++)
			{
				CodeIncrementUIModelClientField(self, str_field_name);
			}
		}
	}
}

/*
	Name: increment_to_player
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x10B0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 314
*/
function increment_to_player(str_field_name, n_increment_count)
{
	if(!isdefined(n_increment_count))
	{
		n_increment_count = 1;
	}
	function_350dbef5();
	if(function_90b279c9(str_field_name))
	{
		for(i = 0; i < n_increment_count; i++)
		{
			CodeIncrementPlayerStateClientField(self, str_field_name);
		}
	}
}

/*
	Name: get
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1150
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 340
*/
function get(str_field_name)
{
	function_350dbef5();
	if(function_90b279c9(str_field_name))
	{
		if(self == level)
		{
			return CodeGetWorldClientField(str_field_name);
		}
		return CodeGetClientField(self, str_field_name);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_to_player
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x11C8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 365
*/
function get_to_player(field_name)
{
	function_350dbef5();
	if(function_90b279c9(field_name))
	{
		return CodeGetPlayerStateClientField(self, field_name);
	}
}

/*
	Name: function_350dbef5
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x1220
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 384
*/
function function_350dbef5()
{
	if(GetDvarString("ui_mapname") == "3218859077")
	{
		if(!level flag::get("system_init_complete"))
		{
			level flag::wait_till("system_init_complete");
			util::wait_network_frame();
		}
	}
}

/*
	Name: function_90b279c9
	Namespace: clientfield
	Checksum: 0x424F4353
	Offset: 0x12A0
	Size: 0x474
	Parameters: 1
	Flags: None
	Line Number: 406
*/
function function_90b279c9(cf)
{
	if(GetDvarString("mapname") == "zm_castle" && (cf == "low_grav_powerup_triggered" || cf == "zombie_wall_dust"))
	{
		return 0;
	}
	if(cf == "force_stream")
	{
		return 0;
	}
	if(cf == "flashlight_fx_view" || cf == "flashlight_fx_world")
	{
		return 0;
	}
	if(cf == "clientfield_perk_intro_fx")
	{
		return 0;
	}
	if(cf == "sndZombieContext")
	{
		return 0;
	}
	if(cf == "zombie_keyline_render")
	{
		return 0;
	}
	if(cf == "mechz_claw_detached")
	{
		return 0;
	}
	if(cf == "hudItems.doublePointsActive")
	{
		return 0;
	}
	if(IsSubStr(cf, "Hitmarker"))
	{
		return 0;
	}
	if(IsSubStr(cf, "ShowReticle"))
	{
		return 0;
	}
	if(IsSubStr(cf, "laststand_update"))
	{
		return 0;
	}
	if(IsSubStr(cf, "mulekick"))
	{
		return 0;
	}
	if(IsSubStr(cf, "score_cf_"))
	{
		return 0;
	}
	if(IsSubStr(cf, "trialWidget") || IsSubStr(cf, "pillar") && GetDvarString("mapname") == "zm_island" && GetDvarInt("com_maxclients") >= 5)
	{
		return 0;
	}
	if(IsSubStr(cf, "trialWidget") || cf == "pr_b" || cf == "pr_c" || cf == "pr_l_c" || cf == "challenge_grave_fire" && GetDvarString("mapname") == "zm_stalingrad" && GetDvarInt("com_maxclients") >= 5)
	{
		return 0;
	}
	if(IsSubStr(cf, "trialWidget") || cf == "challenge1state" || cf == "challenge2state" || cf == "challenge3state" || cf == "challenge_board_eyes" || cf == "challenge_board_base" || cf == "challenge_board_reward" && GetDvarString("mapname") == "zm_genesis" && GetDvarInt("com_maxclients") >= 5)
	{
		return 0;
	}
	if(IsSubStr(cf, "mechz") && IsSubStr(cf, "detached") && (level.script == "zm_castle" || level.script == "zm_genesis" || level.script == "zm_tomb"))
	{
		return 0;
	}
	if(IsSubStr(cf, "raz") && IsSubStr(cf, "detach") && level.script == "zm_stalingrad")
	{
		return 0;
	}
	return 1;
}

