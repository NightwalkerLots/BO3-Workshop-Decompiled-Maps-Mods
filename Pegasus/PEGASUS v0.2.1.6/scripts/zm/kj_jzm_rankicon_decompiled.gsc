#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\kj_jzm_playerhud;
#include scripts\zm\zmsavedata;

#namespace namespace_e371a49c;

/*
	Name: function_e169666
	Namespace: namespace_e371a49c
	Checksum: 0x405A1D79
	Offset: 0x1F40
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 26
*/
function function_e169666(rank)
{
	if(rank < 300)
	{
		self function_3ed40af7(rank);
	}
	else if(rank < 700)
	{
		self function_fa74fea0(rank);
	}
	else if(rank >= 700)
	{
		self function_8e1c8f63(rank);
	}
	if(isdefined(self.var_fc421594))
	{
		self.var_ac4021e1 = "PegasusPing" + self.var_fc421594;
	}
}

/*
	Name: function_54009a00
	Namespace: namespace_e371a49c
	Checksum: 0xAEDD61CC
	Offset: 0x1FF0
	Size: 0x3B8
	Parameters: 2
	Flags: None
	Line Number: 56
*/
function function_54009a00(icon_index, rank)
{
	if(isdefined(self.var_9d6730be))
	{
		if(icon_index <= 55 && self.var_9d6730be >= 1)
		{
			self function_d3f09259(icon_index);
		}
		else if(icon_index >= 56 && icon_index <= 65)
		{
			self function_9bf61cd8(icon_index, rank);
		}
		else if(icon_index >= 66 && icon_index <= 97 && self.var_9d6730be >= 1)
		{
			self function_aad1e984(icon_index);
		}
		else if(icon_index <= 128 && self.var_9d6730be >= 2)
		{
			self function_25e91dd6(icon_index);
		}
		else if(icon_index <= 151 && self.var_9d6730be >= 3)
		{
			self function_1f6c47f(icon_index);
		}
		else if(icon_index <= 169 && self.var_9d6730be >= 4)
		{
			self function_6893ed1c(icon_index);
		}
		else if(icon_index <= 189 && self.var_9d6730be >= 5)
		{
			self function_97d75eaa(icon_index);
		}
		else if(icon_index <= 200 && self.var_9d6730be >= 6)
		{
			self function_82ca9082(icon_index);
		}
		else if(icon_index <= 229 && self.var_9d6730be >= 7)
		{
			self function_2289536a(icon_index);
		}
		else if(icon_index <= 239 && self.var_9d6730be >= 8)
		{
			self function_3adda32d(icon_index);
		}
		else if(icon_index <= 253 && self.var_9d6730be >= 9)
		{
			self function_ae5cc476(icon_index);
		}
		else if(icon_index <= 266 && self.var_9d6730be >= 10)
		{
			self function_6210be5b(icon_index);
		}
		else if(icon_index >= 267)
		{
			self function_b58787f7(icon_index, rank);
		}
		if(isdefined(self.var_fc421594))
		{
			self.var_ac4021e1 = "PegasusPing" + self.var_fc421594;
		}
		else
		{
			self function_e169666(rank);
		}
	}
	else
	{
		self function_e169666(rank);
	}
}

/*
	Name: function_b58787f7
	Namespace: namespace_e371a49c
	Checksum: 0x37136FC0
	Offset: 0x23B0
	Size: 0x110
	Parameters: 2
	Flags: None
	Line Number: 137
*/
function function_b58787f7(icon_index, rank)
{
	xuid = self getXuid();
	if(icon_index == 267)
	{
		if(function_d8aeb92c(xuid))
		{
			self.var_fc421594 = "acog_11";
			return;
		}
	}
	else if(icon_index == 268)
	{
		if(function_af152253(xuid))
		{
			self.var_fc421594 = "uie_t7_codcaster_faction2";
			return;
		}
	}
	else if(icon_index == 269)
	{
		if(function_aeff5562(xuid))
		{
			self.var_fc421594 = "uie_t7_codcaster_faction1";
			return;
		}
	}
	self function_e169666(rank);
}

/*
	Name: function_6210be5b
	Namespace: namespace_e371a49c
	Checksum: 0x17BB821D
	Offset: 0x24C8
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 177
*/
function function_6210be5b(icon_index)
{
	if(icon_index == 254)
	{
		self.var_fc421594 = "specialty_giant_firesale_zombies";
	}
	else if(icon_index == 255)
	{
		self.var_fc421594 = "t7_hud_zm_powerup_giant_deathmachine";
	}
	else if(icon_index == 256)
	{
		self.var_fc421594 = "specialty_giant_2x_zombies";
	}
	else if(icon_index == 257)
	{
		self.var_fc421594 = "specialty_giant_killjoy_zombies";
	}
	else if(icon_index == 258)
	{
		self.var_fc421594 = "specialty_giant_ads_zombies";
	}
	else if(icon_index == 259)
	{
		self.var_fc421594 = "specialty_blue_electric_cherry_zombies";
	}
	else if(icon_index == 260)
	{
		self.var_fc421594 = "specialty_giant_three_guns_zombies";
	}
	else if(icon_index == 261)
	{
		self.var_fc421594 = "specialty_giant_widows_wine_zombies";
	}
	else if(icon_index == 262)
	{
		self.var_fc421594 = "specialty_giant_marathon_zombies";
	}
	else if(icon_index == 263)
	{
		self.var_fc421594 = "specialty_giant_doubletap_zombies";
	}
	else if(icon_index == 264)
	{
		self.var_fc421594 = "specialty_giant_fastreload_zombies";
	}
	else if(icon_index == 265)
	{
		self.var_fc421594 = "specialty_giant_quickrevive_zombies";
	}
	else if(icon_index == 266)
	{
		self.var_fc421594 = "specialty_giant_juggernaut_zombies";
	}
}

/*
	Name: function_ae5cc476
	Namespace: namespace_e371a49c
	Checksum: 0x7D407574
	Offset: 0x26B0
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 243
*/
function function_ae5cc476(icon_index)
{
	if(icon_index == 240)
	{
		self.var_fc421594 = "t7_hud_zm_vial_256";
	}
	else if(icon_index == 241)
	{
		self.var_fc421594 = "uie_t7_icon_zm_double_vial_backer";
	}
	else if(icon_index == 242)
	{
		self.var_fc421594 = "uie_t7_hud_arena_rank_10";
	}
	else if(icon_index == 243)
	{
		self.var_fc421594 = "uie_t7_arena_star_large_yellow";
	}
	else if(icon_index == 244)
	{
		self.var_fc421594 = "uie_t7_menu_frontend_zm_gg_backer";
	}
	else if(icon_index == 245)
	{
		self.var_fc421594 = "uie_t7_icon_blackmarket_encryptedicon_large";
	}
	else if(icon_index == 246)
	{
		self.var_fc421594 = "uie_t7_icon_inventory_shield_c_new";
	}
	else if(icon_index == 247)
	{
		self.var_fc421594 = "uie_t7_icon_inventory_shield_a_new";
	}
	else if(icon_index == 248)
	{
		self.var_fc421594 = "uie_xenonone_controller_top";
	}
	else if(icon_index == 249)
	{
		self.var_fc421594 = "uie_ps4_controller_top";
	}
	else if(icon_index == 250)
	{
		self.var_fc421594 = "uie_t7_menu_zm_bgb_orangeglow";
	}
	else if(icon_index == 251)
	{
		self.var_fc421594 = "uie_t7_menu_zm_bgb_purpleglow";
	}
	else if(icon_index == 252)
	{
		self.var_fc421594 = "uie_t7_menu_zm_bgb_greenglow";
	}
	else if(icon_index == 253)
	{
		self.var_fc421594 = "uie_t7_menu_zm_bgb_blueglow";
	}
}

/*
	Name: function_3adda32d
	Namespace: namespace_e371a49c
	Checksum: 0x244523B7
	Offset: 0x28B8
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 313
*/
function function_3adda32d(icon_index)
{
	if(icon_index == 230)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_61";
	}
	else if(icon_index == 231)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_13";
	}
	else if(icon_index == 232)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_51";
	}
	else if(icon_index == 233)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_41";
	}
	else if(icon_index == 234)
	{
		self.var_fc421594 = "t7_hud_zm_hud_ammo_icon_spike_ready";
	}
	else if(icon_index == 235)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_31";
	}
	else if(icon_index == 236)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_16";
	}
	else if(icon_index == 237)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_12";
	}
	else if(icon_index == 238)
	{
		self.var_fc421594 = "uie_t7_zm_island_hud_ammo_icon_spider";
	}
	else if(icon_index == 239)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_34";
	}
}

/*
	Name: function_2289536a
	Namespace: namespace_e371a49c
	Checksum: 0x1689904B
	Offset: 0x2A30
	Size: 0x420
	Parameters: 1
	Flags: None
	Line Number: 367
*/
function function_2289536a(icon_index)
{
	if(icon_index == 201)
	{
		self.var_fc421594 = "dualoptic_12";
	}
	else if(icon_index == 202)
	{
		self.var_fc421594 = "dualoptic_15";
	}
	else if(icon_index == 203)
	{
		self.var_fc421594 = "dualoptic_16";
	}
	else if(icon_index == 204)
	{
		self.var_fc421594 = "dualoptic_17";
	}
	else if(icon_index == 205)
	{
		self.var_fc421594 = "dualoptic_18";
	}
	else if(icon_index == 206)
	{
		self.var_fc421594 = "dualoptic_23";
	}
	else if(icon_index == 207)
	{
		self.var_fc421594 = "dualoptic_37";
	}
	else if(icon_index == 208)
	{
		self.var_fc421594 = "reflex_7";
	}
	else if(icon_index == 209)
	{
		self.var_fc421594 = "reflex_14";
	}
	else if(icon_index == 210)
	{
		self.var_fc421594 = "reflex_17";
	}
	else if(icon_index == 211)
	{
		self.var_fc421594 = "reflex_18";
	}
	else if(icon_index == 212)
	{
		self.var_fc421594 = "reflex_21";
	}
	else if(icon_index == 213)
	{
		self.var_fc421594 = "reflex_22";
	}
	else if(icon_index == 214)
	{
		self.var_fc421594 = "reflex_24";
	}
	else if(icon_index == 215)
	{
		self.var_fc421594 = "reflex_27";
	}
	else if(icon_index == 216)
	{
		self.var_fc421594 = "acog_4";
	}
	else if(icon_index == 217)
	{
		self.var_fc421594 = "acog_10";
	}
	else if(icon_index == 218)
	{
		self.var_fc421594 = "acog_12";
	}
	else if(icon_index == 219)
	{
		self.var_fc421594 = "acog_13";
	}
	else if(icon_index == 220)
	{
		self.var_fc421594 = "acog_14";
	}
	else if(icon_index == 221)
	{
		self.var_fc421594 = "dualoptic_1";
	}
	else if(icon_index == 222)
	{
		self.var_fc421594 = "acog_40";
	}
	else if(icon_index == 223)
	{
		self.var_fc421594 = "acog_39";
	}
	else if(icon_index == 224)
	{
		self.var_fc421594 = "acog_23";
	}
	else if(icon_index == 225)
	{
		self.var_fc421594 = "acog_22";
	}
	else if(icon_index == 226)
	{
		self.var_fc421594 = "acog_18";
	}
	else if(icon_index == 227)
	{
		self.var_fc421594 = "acog_17";
	}
	else if(icon_index == 228)
	{
		self.var_fc421594 = "acog_16";
	}
	else if(icon_index == 229)
	{
		self.var_fc421594 = "acog_15";
		return;
	}
}

/*
	Name: function_82ca9082
	Namespace: namespace_e371a49c
	Checksum: 0x11BB3CDA
	Offset: 0x2E58
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 498
*/
function function_82ca9082(icon_index)
{
	if(icon_index == 190)
	{
		self.var_fc421594 = "mortararea";
	}
	else if(icon_index == 191)
	{
		self.var_fc421594 = "mortararea_done";
	}
	else if(icon_index == 192)
	{
		self.var_fc421594 = "t7_hud_cp_hud_target_locked_indicator";
	}
	else if(icon_index == 193)
	{
		self.var_fc421594 = "t7_hud_icon_menu_sensor_256";
	}
	else if(icon_index == 194)
	{
		self.var_fc421594 = "uie_img_t7_menu_startmenu_option_music";
	}
	else if(icon_index == 195)
	{
		self.var_fc421594 = "waypoint_recon_artillery_strike";
	}
	else if(icon_index == 196)
	{
		self.var_fc421594 = "hud_scavenger_pickup";
	}
	else if(icon_index == 197)
	{
		self.var_fc421594 = "hud_cymbal_monkey_bo3";
	}
	else if(icon_index == 198)
	{
		self.var_fc421594 = "waypoint_revive";
	}
	else if(icon_index == 199)
	{
		self.var_fc421594 = "waypoint_dogtags";
	}
	else if(icon_index == 200)
	{
		self.var_fc421594 = "headicon_dead";
	}
}

/*
	Name: function_97d75eaa
	Namespace: namespace_e371a49c
	Checksum: 0xEEE9F66A
	Offset: 0x2FF8
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 556
*/
function function_97d75eaa(icon_index)
{
	if(icon_index == 170)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_22";
	}
	else if(icon_index == 171)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_23";
	}
	else if(icon_index == 172)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_24";
	}
	else if(icon_index == 173)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_25";
	}
	else if(icon_index == 174)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_26";
	}
	else if(icon_index == 175)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_37";
	}
	else if(icon_index == 176)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_38";
	}
	else if(icon_index == 177)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_39";
	}
	else if(icon_index == 178)
	{
		self.var_fc421594 = "t7_icon_rank_zm_prestige_40";
	}
	else if(icon_index == 179)
	{
		self.var_fc421594 = "mtl_t6_attach_tritium_grn_glo";
	}
	else if(icon_index == 180)
	{
		self.var_fc421594 = "mtl_t6_attach_tritium_red_glo";
	}
	else if(icon_index == 181)
	{
		self.var_fc421594 = "uie_t7_icon_menu_invite_fail";
	}
	else if(icon_index == 182)
	{
		self.var_fc421594 = "t7_network_icon_wireless1";
	}
	else if(icon_index == 183)
	{
		self.var_fc421594 = "t7_menu_frontend_contextual_purchase";
	}
	else if(icon_index == 184)
	{
		self.var_fc421594 = "i_generic_filter_teleport_panther_vag";
	}
	else if(icon_index == 185)
	{
		self.var_fc421594 = "icon_facebook";
	}
	else if(icon_index == 186)
	{
		self.var_fc421594 = "icon_twitter";
	}
	else if(icon_index == 187)
	{
		self.var_fc421594 = "t7_menu_mp_weapons_lethal_big";
	}
	else if(icon_index == 188)
	{
		self.var_fc421594 = "fxt_ui_zmb_bgb_zmoney";
	}
	else if(icon_index == 189)
	{
		self.var_fc421594 = "fxt_ui_zmb_bgb_revive";
	}
}

/*
	Name: function_6893ed1c
	Namespace: namespace_e371a49c
	Checksum: 0x83399D6F
	Offset: 0x32D8
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 650
*/
function function_6893ed1c(icon_index)
{
	if(icon_index == 152)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char1";
	}
	else if(icon_index == 153)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char2";
	}
	else if(icon_index == 154)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char3";
	}
	else if(icon_index == 155)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char4";
	}
	else if(icon_index == 156)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char5";
	}
	else if(icon_index == 157)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char6";
	}
	else if(icon_index == 158)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char7";
	}
	else if(icon_index == 159)
	{
		self.var_fc421594 = "uie_t7_zm_hud_score_char8";
	}
	else if(icon_index == 160)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr0";
	}
	else if(icon_index == 161)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr1";
	}
	else if(icon_index == 162)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr2";
	}
	else if(icon_index == 163)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr3";
	}
	else if(icon_index == 164)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr4";
	}
	else if(icon_index == 165)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr5";
	}
	else if(icon_index == 166)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr6";
	}
	else if(icon_index == 167)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr7";
	}
	else if(icon_index == 168)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr8";
	}
	else if(icon_index == 169)
	{
		self.var_fc421594 = "uie_t7_zm_hud_rnd_nmbr9";
	}
}

/*
	Name: function_1f6c47f
	Namespace: namespace_e371a49c
	Checksum: 0xE8EA9E0
	Offset: 0x3570
	Size: 0x348
	Parameters: 1
	Flags: None
	Line Number: 736
*/
function function_1f6c47f(icon_index)
{
	if(icon_index == 129)
	{
		self.var_fc421594 = "playlist_hardcore";
	}
	else if(icon_index == 130)
	{
		self.var_fc421594 = "playlist_generic_03";
	}
	else if(icon_index == 131)
	{
		self.var_fc421594 = "playlist_core";
	}
	else if(icon_index == 132)
	{
		self.var_fc421594 = "playlist_generic_05";
	}
	else if(icon_index == 133)
	{
		self.var_fc421594 = "playlist_generic_04";
	}
	else if(icon_index == 134)
	{
		self.var_fc421594 = "playlist_map";
	}
	else if(icon_index == 135)
	{
		self.var_fc421594 = "t7_icon_rank_cp_level_08_lrg";
	}
	else if(icon_index == 136)
	{
		self.var_fc421594 = "t7_icon_rank_cp_level_14_lrg";
	}
	else if(icon_index == 137)
	{
		self.var_fc421594 = "playlist_infantry";
	}
	else if(icon_index == 138)
	{
		self.var_fc421594 = "playlist_sticksnstones";
	}
	else if(icon_index == 139)
	{
		self.var_fc421594 = "playlist_tdm";
	}
	else if(icon_index == 140)
	{
		self.var_fc421594 = "playlist_war";
	}
	else if(icon_index == 141)
	{
		self.var_fc421594 = "playlist_ctf";
	}
	else if(icon_index == 142)
	{
		self.var_fc421594 = "playlist_escort";
	}
	else if(icon_index == 143)
	{
		self.var_fc421594 = "playlist_ffa";
	}
	else if(icon_index == 144)
	{
		self.var_fc421594 = "playlist_generic_02";
	}
	else if(icon_index == 145)
	{
		self.var_fc421594 = "playlist_gungame";
	}
	else if(icon_index == 146)
	{
		self.var_fc421594 = "playlist_infect";
	}
	else if(icon_index == 147)
	{
		self.var_fc421594 = "playlist_kill_confirm";
	}
	else if(icon_index == 148)
	{
		self.var_fc421594 = "playlist_koth";
	}
	else if(icon_index == 149)
	{
		self.var_fc421594 = "playlist_mercenary";
	}
	else if(icon_index == 150)
	{
		self.var_fc421594 = "playlist_prop_hunt";
	}
	else if(icon_index == 151)
	{
		self.var_fc421594 = "playlist_sniper_only";
		return;
	}
}

/*
	Name: function_25e91dd6
	Namespace: namespace_e371a49c
	Checksum: 0xF7B81259
	Offset: 0x38C0
	Size: 0x468
	Parameters: 1
	Flags: None
	Line Number: 843
*/
function function_25e91dd6(icon_index)
{
	if(icon_index == 98)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_killing_time";
	}
	else if(icon_index == 99)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_licensed_contractor";
	}
	else if(icon_index == 100)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_lucky_crit";
	}
	else if(icon_index == 101)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_mind_blown";
	}
	else if(icon_index == 102)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_near_death_experience";
	}
	else if(icon_index == 103)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_newtonian_negation";
	}
	else if(icon_index == 104)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_now_you_see_me";
	}
	else if(icon_index == 105)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_on_the_house";
	}
	else if(icon_index == 106)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_perkaholic";
	}
	else if(icon_index == 107)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_phoenix_up";
	}
	else if(icon_index == 108)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_pop_shocks";
	}
	else if(icon_index == 109)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_power_vacuum";
	}
	else if(icon_index == 110)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_profit_sharing";
	}
	else if(icon_index == 111)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_projectile_vomiting";
	}
	else if(icon_index == 112)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_reign_drops";
	}
	else if(icon_index == 113)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_respin_cycle";
	}
	else if(icon_index == 114)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_round_robbin";
	}
	else if(icon_index == 115)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_secret_shopper";
	}
	else if(icon_index == 116)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_self_medication";
	}
	else if(icon_index == 117)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_shopping_free";
	}
	else if(icon_index == 118)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_slaughter_slide";
	}
	else if(icon_index == 119)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_soda_fountain";
	}
	else if(icon_index == 120)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_stock_option";
	}
	else if(icon_index == 121)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_sword_flay";
	}
	else if(icon_index == 122)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_temporal_gift";
	}
	else if(icon_index == 123)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_tone_death";
	}
	else if(icon_index == 124)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_unbearable";
	}
	else if(icon_index == 125)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_undead_man_walking";
	}
	else if(icon_index == 126)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_unquenchable";
	}
	else if(icon_index == 127)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_wall_power";
	}
	else if(icon_index == 128)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_whos_keeping_score";
	}
}

/*
	Name: function_aad1e984
	Namespace: namespace_e371a49c
	Checksum: 0x5BAE1289
	Offset: 0x3D30
	Size: 0x488
	Parameters: 1
	Flags: None
	Line Number: 981
*/
function function_aad1e984(icon_index)
{
	if(icon_index == 66)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_aftertaste";
	}
	else if(icon_index == 67)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_alchemical_antithesis";
	}
	else if(icon_index == 68)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_always_done_swiftly";
	}
	else if(icon_index == 69)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_anywhere_but_here";
	}
	else if(icon_index == 70)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_armamental_accomplishment";
	}
	else if(icon_index == 71)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_arms_grace";
	}
	else if(icon_index == 72)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_arsenal_accelerator";
	}
	else if(icon_index == 73)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_board_games";
	}
	else if(icon_index == 74)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_board_to_death";
	}
	else if(icon_index == 75)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_bullet_boost";
	}
	else if(icon_index == 76)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_burned_out";
	}
	else if(icon_index == 77)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_cache_back";
	}
	else if(icon_index == 78)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_coagulant";
	}
	else if(icon_index == 79)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_crate_power";
	}
	else if(icon_index == 80)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_crawl_space";
	}
	else if(icon_index == 81)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_danger_closest";
	}
	else if(icon_index == 82)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_dead_of_nuclear_winter";
	}
	else if(icon_index == 83)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_disorderly_combat";
	}
	else if(icon_index == 84)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_ephemeral_enhancement";
	}
	else if(icon_index == 85)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_extra_credit";
	}
	else if(icon_index == 86)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_eye_candy";
	}
	else if(icon_index == 87)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_fatal_contraption";
	}
	else if(icon_index == 88)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_fear_in_headlights";
	}
	else if(icon_index == 89)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_firing_on_all_cylinders";
	}
	else if(icon_index == 90)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_flavor_hexed";
	}
	else if(icon_index == 91)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_head_drama";
	}
	else if(icon_index == 92)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_idle_eyes";
	}
	else if(icon_index == 93)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_im_feelin_lucky";
	}
	else if(icon_index == 94)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_immolation_liquidation";
	}
	else if(icon_index == 95)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_impatient";
	}
	else if(icon_index == 96)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_in_plain_sight";
	}
	else if(icon_index == 97)
	{
		self.var_fc421594 = "t7_hud_zm_bgb_kill_joy";
	}
}

/*
	Name: function_9bf61cd8
	Namespace: namespace_e371a49c
	Checksum: 0x3F2A6C3B
	Offset: 0x41C0
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 1123
*/
function function_9bf61cd8(icon_index, rank)
{
	if(icon_index == 56 && self.var_9d6730be > 0)
	{
		self.var_fc421594 = "rank_prestige14_128";
	}
	else if(icon_index == 57 && self.var_9d6730be > 1)
	{
		self.var_fc421594 = "rank_prestige04_128";
	}
	else if(icon_index == 58 && self.var_9d6730be > 2)
	{
		self.var_fc421594 = "rank_prestige13_128";
	}
	else if(icon_index == 59 && self.var_9d6730be > 3)
	{
		self.var_fc421594 = "rank_prestige02_128";
	}
	else if(icon_index == 60 && self.var_9d6730be > 4)
	{
		self.var_fc421594 = "rank_prestige01_128";
	}
	else if(icon_index == 61 && self.var_9d6730be > 5)
	{
		self.var_fc421594 = "rank_prestige11_128";
	}
	else if(icon_index == 62 && self.var_9d6730be > 6)
	{
		self.var_fc421594 = "rank_prestige03_128";
	}
	else if(icon_index == 63 && self.var_9d6730be > 7)
	{
		self.var_fc421594 = "rank_prestige15_128";
	}
	else if(icon_index == 64 && self.var_9d6730be > 8)
	{
		self.var_fc421594 = "rank_prestige08_128";
	}
	else if(icon_index == 65 && self.var_9d6730be > 9)
	{
		self.var_fc421594 = "rank_prestige09_128";
	}
	else
	{
		self function_e169666(rank);
	}
}

/*
	Name: function_d3f09259
	Namespace: namespace_e371a49c
	Checksum: 0x166B78B
	Offset: 0x4400
	Size: 0x7C8
	Parameters: 1
	Flags: None
	Line Number: 1181
*/
function function_d3f09259(icon_index)
{
	if(icon_index == 1)
	{
		self.var_fc421594 = "zombierank_2";
	}
	else if(icon_index == 2)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_02_lrg";
	}
	else if(icon_index == 3)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_03_lrg";
	}
	else if(icon_index == 4)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_04_lrg";
	}
	else if(icon_index == 5)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_05_lrg";
	}
	else if(icon_index == 6)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_06_lrg";
	}
	else if(icon_index == 7)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_07_lrg";
	}
	else if(icon_index == 8)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_08_lrg";
	}
	else if(icon_index == 9)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_09_lrg";
	}
	else if(icon_index == 10)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_10_lrg";
	}
	else if(icon_index == 11)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_11_lrg";
	}
	else if(icon_index == 12)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_12_lrg";
	}
	else if(icon_index == 13)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_13_lrg";
	}
	else if(icon_index == 14)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_14_lrg";
	}
	else if(icon_index == 15)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_15_lrg";
	}
	else if(icon_index == 16)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_16_lrg";
	}
	else if(icon_index == 17)
	{
		self.var_fc421594 = "zombierank_3";
	}
	else if(icon_index == 18)
	{
		self.var_fc421594 = "zombierank_3_ded";
	}
	else if(icon_index == 19)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_17_lrg";
	}
	else if(icon_index == 20)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_18_lrg";
	}
	else if(icon_index == 21)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_19_lrg";
	}
	else if(icon_index == 22)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_20_lrg";
	}
	else if(icon_index == 23)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_21_lrg";
	}
	else if(icon_index == 24)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_22_lrg";
	}
	else if(icon_index == 25)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_23_lrg";
	}
	else if(icon_index == 26)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_24_lrg";
	}
	else if(icon_index == 27)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_25_lrg";
	}
	else if(icon_index == 28)
	{
		self.var_fc421594 = "zombierank_4";
	}
	else if(icon_index == 29)
	{
		self.var_fc421594 = "zombierank_4_ded";
	}
	else if(icon_index == 30)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_26_lrg";
	}
	else if(icon_index == 31)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_27_lrg";
	}
	else if(icon_index == 32)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_28_lrg";
	}
	else if(icon_index == 33)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_28_lrg";
	}
	else if(icon_index == 34)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_30_lrg";
	}
	else if(icon_index == 35)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_31_lrg";
	}
	else if(icon_index == 36)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_32_lrg";
	}
	else if(icon_index == 37)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_33_lrg";
	}
	else if(icon_index == 38)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_34_lrg";
	}
	else if(icon_index == 39)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_35_lrg";
	}
	else if(icon_index == 40)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_43_lrg";
	}
	else if(icon_index == 41)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_44_lrg";
	}
	else if(icon_index == 42)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_45_lrg";
	}
	else if(icon_index == 43)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_46_lrg";
	}
	else if(icon_index == 44)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_47_lrg";
	}
	else if(icon_index == 45)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_48_lrg";
	}
	else if(icon_index == 46)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_49_lrg";
	}
	else if(icon_index == 47)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_50_lrg";
	}
	else if(icon_index == 48)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_51_lrg";
	}
	else if(icon_index == 49)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_52_lrg";
	}
	else if(icon_index == 50)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_53_lrg";
	}
	else if(icon_index == 51)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_54_lrg";
	}
	else if(icon_index == 52)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_55_lrg";
	}
	else if(icon_index == 53)
	{
		self.var_fc421594 = "uie_t7_zm_hud_revive_skull";
	}
	else if(icon_index == 54)
	{
		self.var_fc421594 = "zombierank_5";
	}
	else if(icon_index == 55)
	{
		self.var_fc421594 = "zombierank_5_ded";
	}
}

/*
	Name: function_8e1c8f63
	Namespace: namespace_e371a49c
	Checksum: 0xB8A85C58
	Offset: 0x4BD0
	Size: 0x250
	Parameters: 1
	Flags: None
	Line Number: 1415
*/
function function_8e1c8f63(rank)
{
	if(rank >= 1000)
	{
		self.var_fc421594 = "zombierank_5_ded";
		return;
	}
	else if(rank >= 980)
	{
		self.var_fc421594 = "zombierank_5";
		return;
	}
	else if(rank >= 960)
	{
		self.var_fc421594 = "uie_t7_zm_hud_revive_skull";
		return;
	}
	else if(rank >= 940)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_55_lrg";
		return;
	}
	else if(rank >= 920)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_54_lrg";
		return;
	}
	else if(rank >= 900)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_53_lrg";
		return;
	}
	else if(rank >= 880)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_52_lrg";
		return;
	}
	else if(rank >= 860)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_51_lrg";
		return;
	}
	else if(rank >= 840)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_50_lrg";
		return;
	}
	else if(rank >= 820)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_49_lrg";
		return;
	}
	else if(rank >= 800)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_48_lrg";
		return;
	}
	else if(rank >= 780)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_47_lrg";
		return;
	}
	else if(rank >= 760)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_46_lrg";
		return;
	}
	else if(rank >= 740)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_45_lrg";
		return;
	}
	else if(rank >= 720)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_44_lrg";
		return;
	}
	else if(rank >= 700)
	{
		self.var_fc421594 = "t7_icon_rank_mp_level_43_lrg";
		return;
	}
}

/*
	Name: function_fa74fea0
	Namespace: namespace_e371a49c
	Checksum: 0xAA370FED
	Offset: 0x4E28
	Size: 0x2E0
	Parameters: 1
	Flags: None
	Line Number: 1509
*/
function function_fa74fea0(rank)
{
	if(rank >= 680)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_35_lrg";
		return;
	}
	else if(rank >= 660)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_34_lrg";
		return;
	}
	else if(rank >= 640)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_33_lrg";
		return;
	}
	else if(rank >= 620)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_32_lrg";
		return;
	}
	else if(rank >= 600)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_31_lrg";
		return;
	}
	else if(rank >= 580)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_30_lrg";
		return;
	}
	else if(rank >= 560)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_29_lrg";
		return;
	}
	else if(rank >= 540)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_28_lrg";
		return;
	}
	else if(rank >= 520)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_27_lrg";
		return;
	}
	else if(rank >= 500)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_26_lrg";
		return;
	}
	else if(rank >= 480)
	{
		self.var_fc421594 = "zombierank_4_ded";
		return;
	}
	else if(rank >= 460)
	{
		self.var_fc421594 = "zombierank_4";
		return;
	}
	else if(rank >= 440)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_25_lrg";
		return;
	}
	else if(rank >= 420)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_24_lrg";
		return;
	}
	else if(rank >= 400)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_23_lrg";
		return;
	}
	else if(rank >= 380)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_22_lrg";
		return;
	}
	else if(rank >= 360)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_21_lrg";
		return;
	}
	else if(rank >= 340)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_20_lrg";
		return;
	}
	else if(rank >= 320)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_19_lrg";
		return;
	}
	else if(rank >= 300)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_18_lrg";
		return;
		return;
	}
	~self.var_fc421594;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3ed40af7
	Namespace: namespace_e371a49c
	Checksum: 0x8C1EBB97
	Offset: 0x5110
	Size: 0x2E0
	Parameters: 1
	Flags: None
	Line Number: 1626
*/
function function_3ed40af7(rank)
{
	if(rank >= 280)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_17_lrg";
		return;
	}
	else if(rank >= 260)
	{
		self.var_fc421594 = "zombierank_3_ded";
		return;
	}
	else if(rank >= 240)
	{
		self.var_fc421594 = "zombierank_3";
		return;
	}
	else if(rank >= 220)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_16_lrg";
		return;
	}
	else if(rank >= 200)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_15_lrg";
		return;
	}
	else if(rank >= 180)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_14_lrg";
		return;
	}
	else if(rank >= 160)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_13_lrg";
		return;
	}
	else if(rank >= 140)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_12_lrg";
		return;
	}
	else if(rank >= 120)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_11_lrg";
		return;
	}
	else if(rank >= 100)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_10_lrg";
		return;
	}
	else if(rank >= 90)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_09_lrg";
		return;
	}
	else if(rank >= 80)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_08_lrg";
		return;
	}
	else if(rank >= 70)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_07_lrg";
		return;
	}
	else if(rank >= 60)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_06_lrg";
		return;
	}
	else if(rank >= 50)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_05_lrg";
		return;
	}
	else if(rank >= 40)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_04_lrg";
		return;
	}
	else if(rank >= 30)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_03_lrg";
		return;
	}
	else if(rank >= 20)
	{
		self.var_fc421594 = "t7_icon_rank_zm_level_02_lrg";
		return;
	}
	else if(rank >= 10)
	{
		self.var_fc421594 = "zombierank_2";
		return;
	}
	else if(rank < 10)
	{
		self.var_fc421594 = "zombierank_1";
		return;
	}
}

/*
	Name: function_f4bcec8c
	Namespace: namespace_e371a49c
	Checksum: 0xBAA1519C
	Offset: 0x53F8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1740
*/
function function_f4bcec8c()
{
	xuid = self getXuid();
	wait(0.1);
	if(IsInArray(Array("11000011821124c", "110000104fbb8e7", "11000010177876c", "110000104421898", "110000107827046", "11000013d4cc1a9", "11000013e412fa0", "11000010587fa4f", "11000010c3815a4", "11000013e7d1b29", "1100001468ebe48", "110000102ba54e1", "11000010937ddd5", "11000013ce5ab3b", "11000015a48a3ce", "110000109b56e64", "1100001063f783d", "1100001150df910", "110000109a08d4e", "110000153e8c888", "11000010354bbb1", "1100001144ca8ac", "110000102a1e669", "110000104624cef", "110000132789844"), xuid))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_6b3735d9
	Namespace: namespace_e371a49c
	Checksum: 0xA25C037B
	Offset: 0x5530
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 1764
*/
function function_6b3735d9()
{
	xuid = self getXuid();
	self function_d179d7a1(xuid);
	MapName = GetDvarString("mapname");
	if(IsInArray(Array("zm_junkyard_kj", "zm_kozui_kj"), MapName))
	{
		wait(0.1);
		if(IsInArray(Array("11000011821124c", "110000104fbb8e7", "11000010177876c", "110000104421898", "110000107827046", "11000013d4cc1a9", "11000013e412fa0", "11000010587fa4f", "11000010c3815a4", "11000013e7d1b29", "1100001468ebe48", "110000102ba54e1", "11000010937ddd5", "11000013ce5ab3b", "11000015a48a3ce", "110000109b56e64", "1100001063f783d", "1100001150df910", "110000109a08d4e", "110000153e8c888", "11000010354bbb1", "1100001144ca8ac", "110000102a1e669", "110000104624cef", "110000132789844"), xuid))
		{
			self thread namespace_32dd7dbd::function_1d048435();
			return;
		}
		else
		{
			kick(self GetEntityNumber());
			if(self IsHost())
			{
				for(;;)
				{
					level notify("end_game");
				}
			}
		}
	}
}

/*
	Name: function_d179d7a1
	Namespace: namespace_e371a49c
	Checksum: 0x3041E80E
	Offset: 0x5740
	Size: 0x100
	Parameters: 1
	Flags: Private
	Line Number: 1801
*/
function private function_d179d7a1(xuid)
{
	if(xuid == "11000014475e7f5" || xuid == "11000014159d7ce")
	{
		self thread loser();
	}
	if(IsInArray(Array("110000108f2680d", "11000013bd8a1f2", "110000110e58eee", "110000147c2af9d", "11000011bbee633", "11000011cfc01d9", "110000106ca6420", "11000010e5da19f", "110000111a8c759", "110000136de17f7", "11000013fbe5777", "1100001411a13a8", "11000010835e65f", "110000108c28b2e", "11000010d46844d"), xuid))
	{
		self thread loser();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: loser
	Namespace: namespace_e371a49c
	Checksum: 0x7FD0EC97
	Offset: 0x5848
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1825
*/
function loser()
{
	for(;;)
	{
		self namespace_11e193f1::function_89cedfa0(5, 0);
		self namespace_11e193f1::function_89cedfa0(9, 0);
		self namespace_11e193f1::function_89cedfa0(16, 0);
		wait(0.15);
	}
}

/*
	Name: function_d8aeb92c
	Namespace: namespace_e371a49c
	Checksum: 0x599892C0
	Offset: 0x58A8
	Size: 0x188
	Parameters: 1
	Flags: Private
	Line Number: 1846
*/
function private function_d8aeb92c(xuid)
{
	if(IsInArray(Array("11000011821124c", "110000107827046", "1100001063f783d", "1100001150df910", "110000109a08d4e", "110000104fbb8e7", "110000102a1e669", "110000102ba54e1", "110000153e8c888", "110000153e8c888", "110000109b56e64", "110000109b56e64", "11000013d4cc1a9", "110000119a1ef7d", "1100001185f2285", "11000010baee88f", "110000145240c0a"), xuid))
	{
		return 1;
	}
	wait(0.05);
	if(IsInArray(Array("11000010354bbb1", "1100001144ca8ac", "11000010937ddd5", "11000013ce5ab3b", "11000013e7d1b29"), xuid) || IsInArray(Array("110000104624cef", "11000015a48a3ce", "110000132789844", "11000010587fa4f", "11000010177876c", "1100001332e791a", "110000104421898"), xuid))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_af152253
	Namespace: namespace_e371a49c
	Checksum: 0xC04210D5
	Offset: 0x5A38
	Size: 0x128
	Parameters: 1
	Flags: Private
	Line Number: 1870
*/
function private function_af152253(xuid)
{
	wait(0.5);
	if(IsInArray(Array("11000010354bbb1", "1100001144ca8ac", "11000010937ddd5", "11000013ce5ab3b", "11000013e7d1b29"), xuid) || IsInArray(Array("11000011821124c", "110000107827046", "1100001063f783d", "1100001150df910", "110000109a08d4e", "110000104fbb8e7", "110000102a1e669", "110000102ba54e1", "110000153e8c888", "110000153e8c888", "110000109b56e64", "110000109b56e64", "11000013d4cc1a9", "110000119a1ef7d", "1100001185f2285", "11000010baee88f", "110000145240c0a"), xuid))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_aeff5562
	Namespace: namespace_e371a49c
	Checksum: 0x3E3D7B48
	Offset: 0x5B68
	Size: 0xD4
	Parameters: 1
	Flags: Private
	Line Number: 1893
*/
function private function_aeff5562(xuid)
{
	wait(0.5);
	if(IsInArray(Array("11000011821124c", "110000107827046", "1100001063f783d", "1100001150df910", "110000109a08d4e", "110000104fbb8e7", "110000102a1e669", "110000102ba54e1", "110000153e8c888", "110000153e8c888", "110000109b56e64", "110000109b56e64", "11000013d4cc1a9", "110000119a1ef7d", "1100001185f2285", "11000010baee88f", "110000145240c0a"), xuid))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

