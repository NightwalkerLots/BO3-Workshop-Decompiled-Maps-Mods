#include scripts\codescripts\struct;

#namespace namespace_dc7538ec;

/*
	Name: init
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0x8D8
	Size: 0x118
	Parameters: 0
	Flags: AutoExec
	Line Number: 14
*/
function autoexec init()
{
	SetDvar("scr_firstgumfree", 1);
	SetDvar("r_postFxIndex", -1);
	if(GetDvarString("cg_unlockall_loot") != "")
	{
		modvar("aae_boiii_maxplayers", GetDvarString("aae_boiii_maxplayers"));
	}
	thread function_d959c198();
	thread function_7c67602c();
	function_65312014();
	thread function_d50d0039();
	modvar("soundtest", "");
	modvar("aae_thirdperson", 0);
}

/*
	Name: function_1eb2e0a2
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0x9F8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function function_1eb2e0a2()
{
	while(GetDvarString("backmenu") != "")
	{
		foreach(player in GetPlayers())
		{
			IPrintLnBold(player.name);
			self CloseMenu("FrontendBack");
			self openMenu("FrontendBack");
		}
		IPrintLnBold("backmenu");
		SetDvar("backmenu", "");
		wait(0.05);
	}
}

/*
	Name: main
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0xB48
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 66
*/
function main()
{
}

/*
	Name: function_d50d0039
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0xB58
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function function_d50d0039()
{
	wait(1);
	SetDvar("fileshareAllowDownloadingOthersFiles", 1);
	SetDvar("tu4_enableCodPoints", 0);
	if(GetDvarString("cg_unlockall_loot") != "")
	{
		SetDvar("partyprivacyenabled", 1);
		SetDvar("tu4_partyprivacyuseglobal", 1);
		SetDvar("tu4_partyprivacyluacheck", 1);
	}
	SetDvar("ui_error_report", 0);
	return;
}

/*
	Name: function_7c67602c
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0xC38
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_7c67602c()
{
	SetDvar("chat_LastMs", GetDvarInt("chat_LastMs") + 1);
	for(;;)
	{
		SetDvar("developer", 0);
		SetDvar("logfile", 0);
		SetDvar("com_clientfieldsdebug", 0);
		if(GetDvarString("cg_unlockall_loot") == "")
		{
			SetDvar("live_steam_server_name", "^0-^5AAE^0-" + " ^2Waiting" + " ^3Host^7: " + GetDvarString("sv_hostname"));
			SetDvar("live_steam_server_description", "^2" + MakeLocalizedString("PLATFORM_AAE_VERSION"));
			else
			{
			}
		}
		function_94a79806(GetDvarString("aae_chooseforcehost") == "1");
		wait(0.2);
	}
}

/*
	Name: function_94a79806
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x510
	Parameters: 1
	Flags: None
	Line Number: 136
*/
function function_94a79806(bool)
{
	if(bool)
	{
		SetDvar("party_minplayers", 2);
		SetDvar("lobby_readyUpPercentRequired", 1);
		SetDvar("excellentPing", 75);
		SetDvar("goodPing", 150);
		SetDvar("terriblePing", 999);
		SetDvar("searchSessionDedicatedMaxPing", 940);
		SetDvar("migration_minclientcount", 2);
		SetDvar("allowAllNAT", 1);
		SetDvar("qosMaxAllowedPing", 1);
		SetDvar("lobbySearchPingLimits", 920);
		SetDvar("lobbySearchDediUnparkPingLimit", 930);
		SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
		SetDvar("party_mergingEnabled", 1);
		SetDvar("allowGuestSplitScreenOnline", 1);
		SetDvar("party_joinInProgressAllowed", 1);
		SetDvar("party_connectToOthers", 1);
		SetDvar("lobbySearchListenCountries", "");
		SetDvar("lobbyMergeEnabled", 0);
	}
	else
	{
		SetDvar("party_minplayers", 2);
		SetDvar("lobby_readyUpPercentRequired", 1);
		SetDvar("excellentPing", 75);
		SetDvar("goodPing", 150);
		SetDvar("terriblePing", 999);
		SetDvar("searchSessionDedicatedMaxPing", 940);
		SetDvar("migration_minclientcount", 2);
		SetDvar("allowAllNAT", 1);
		SetDvar("qosMaxAllowedPing", 910);
		SetDvar("lobbySearchPingLimits", 920);
		SetDvar("lobbySearchDediUnparkPingLimit", 930);
		SetDvar("party_keepPartyAliveWhileMatchmaking", 1);
		SetDvar("party_mergingEnabled", 1);
		SetDvar("allowGuestSplitScreenOnline", 1);
		SetDvar("party_joinInProgressAllowed", 1);
		SetDvar("party_connectToOthers", 1);
		SetDvar("lobbySearchListenCountries", "");
		SetDvar("lobbyMergeEnabled", 1);
	}
	SetDvar("lobbyAdvertiseShowInMatchmaking", 1);
	SetDvar("lobbySearchShowInMatchmaking", 1);
	SetDvar("lobbySearchAllowForceListen", 1);
	SetDvar("lobbyAdvertiseDirty", 1);
}

/*
	Name: function_d959c198
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0x12C0
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 196
*/
function function_d959c198()
{
	modvar("d", "");
	while(GetDvarString("d") != "")
	{
		string = GetDvarString("d");
		var_cde9f622 = StrTok(string, " ");
		string = ToLower(var_cde9f622[1]);
		dvar = ToLower(var_cde9f622[0]);
		SetDvar(dvar, string);
		IPrintLnBold("^5Dvar Set^7: " + dvar + " " + GetDvarString(dvar));
		SetDvar("d", "");
		if(GetDvarString("soundtest") != "")
		{
			string = GetDvarString("soundtest");
			playsoundatposition(string, (0, 0, 0));
			IPrintLnBold("Play Sound: " + string);
			SetDvar("soundtest", "");
		}
		if(GetDvarString("soundtest") != "")
		{
			string = GetDvarString("soundtest");
			playsoundatposition(string, (0, 0, 0));
			IPrintLnBold("Play Sound: " + string);
			SetDvar("soundtest", "");
		}
		if(GetDvarString("soundtest") != "")
		{
			string = GetDvarString("soundtest");
			playsoundatposition(string, (0, 0, 0));
			IPrintLnBold("Play Sound: " + string);
			SetDvar("soundtest", "");
		}
		wait(0.001);
	}
}

/*
	Name: function_f9a5da67
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0x1610
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 243
*/
function function_f9a5da67()
{
	while(GetDvarString("lua_iprintbold") != "")
	{
		IPrintLnBold(GetDvarString("lua_iprintbold"));
		SetDvar("lua_iprintbold", "");
		wait(0.048);
	}
}

/*
	Name: function_65312014
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0x1698
	Size: 0x5A8
	Parameters: 0
	Flags: None
	Line Number: 263
*/
function function_65312014()
{
	function_75fa32dc("aaeoption_hitmarker");
	function_75fa32dc("aaeoption_promod");
	function_75fa32dc("aaeoption_uicolor");
	function_75fa32dc("aaeoption_wallbuy");
	function_75fa32dc("aaeoption_extracam");
	function_75fa32dc("aaeoption_overhead");
	function_75fa32dc("aaeoption_extracam_doa");
	function_75fa32dc("aaeoption_centercross");
	function_75fa32dc("aaeoption_afk");
	function_75fa32dc("aaeoption_kick");
	function_75fa32dc("aaeoption_smoke");
	function_75fa32dc("aaeoption_minimap");
	function_75fa32dc("aaeoption_nozoom");
	function_75fa32dc("aaeoption_grenade");
	function_75fa32dc("aaeoption_ges");
	function_75fa32dc("aaeoption_flash");
	function_75fa32dc("aaeoption_flashblack");
	function_75fa32dc("aaeoption_forcelod");
	function_75fa32dc("aaeoption_blackbar");
	function_75fa32dc("aaeoption_starthint");
	function_75fa32dc("aaeoption_loading");
	function_75fa32dc("aaeoption_sm");
	function_75fa32dc("aaeoption_lowammo");
	function_75fa32dc("aaeoption_perkslot");
	function_75fa32dc("aaeoption_reloadhint");
	function_75fa32dc("aaeoption_startintro");
	function_75fa32dc("aaeoption_aat");
	function_75fa32dc("aaeoption_bgb_drop");
	function_75fa32dc("aaeoption_hinticon");
	function_75fa32dc("aaeoption_t6pap");
	function_75fa32dc("aaeoption_lockon");
	function_75fa32dc("aae_fovscale");
	function_75fa32dc("aaeoption_seewall");
	function_75fa32dc("aaeoption_lastzombie");
	function_75fa32dc("aaeoption_tombname");
	function_75fa32dc("aaeoption_za");
	function_75fa32dc("aaeoption_selfhp");
	function_75fa32dc("aaeoption_highround_timer");
	function_75fa32dc("aaeoption_spawn_dust");
	function_75fa32dc("aaeoption_rgb_eye");
	function_75fa32dc("aaeoption_points_color");
	function_75fa32dc("aaeoption_hitm_stay_m");
	function_75fa32dc("aaeoption_zcperk");
	function_75fa32dc("aaeoption_nopes");
	function_75fa32dc("aaeoption_papbox");
	function_75fa32dc("aaeoption_motionui");
	function_75fa32dc("aaeoption_motionui_float");
	function_75fa32dc("aaeoption_mwz_color");
	function_75fa32dc("aaeoption_headshot");
	function_75fa32dc("aaeoption_ammobag");
	function_75fa32dc("aaeoption_slothud");
	function_75fa32dc("aaeoption_staminabar");
	function_75fa32dc("aae_spectator");
	function_75fa32dc("aaeoption_autolean");
	function_75fa32dc("aaeoption_bgb_start");
	function_75fa32dc("aaeoption_c4ending");
	function_75fa32dc("aaeoption_t7hud");
	function_75fa32dc("aaeoption_tiphint");
	function_75fa32dc("aaeoption_barspin");
	function_75fa32dc("aaeoption_hudmove");
}

/*
	Name: function_75fa32dc
	Namespace: namespace_dc7538ec
	Checksum: 0x424F4353
	Offset: 0x1C48
	Size: 0x3C
	Parameters: 1
	Flags: None
	Line Number: 337
*/
function function_75fa32dc(name)
{
	modvar(name, GetDvarString(name, ""));
}

