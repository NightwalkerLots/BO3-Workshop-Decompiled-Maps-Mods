#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_raps;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_timer;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\zm_zod_craftables;
#include scripts\zm\zm_zod_quest;
#include scripts\zm\zm_zod_smashables;
#include scripts\zm\zm_zod_util;

#namespace namespace_b8707f8e;

/*
	Name: __init__sytem__
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x21F8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 43
*/
function autoexec __init__sytem__()
{
	system::register("zm_zod_vo", &__init__, undefined, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2238
	Size: 0x420
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function __init__()
{
	callback::on_spawned(&on_player_spawned);
	level.a_e_speakers = [];
	level flag::init("story_vo_playing");
	level thread function_50460ed1();
	level thread function_7884e6b8();
	level.var_95981590 = undefined;
	level thread function_2cc571f6();
	level thread function_f8939df5();
	level thread function_f9003879("visited_workshop");
	level thread function_f9003879("visited_gym");
	level thread function_f9003879("visited_burlesque");
	level thread function_f9003879("visited_ruby");
	level thread function_e8972612();
	level.var_f8b68299 = [];
	if(!isdefined(level.var_f8b68299))
	{
		level.var_f8b68299 = [];
	}
	else if(!IsArray(level.var_f8b68299))
	{
		level.var_f8b68299 = Array(level.var_f8b68299);
	}
	level.var_f8b68299[level.var_f8b68299.size] = "vox_shad_keepers_defeated_0";
	if(!isdefined(level.var_f8b68299))
	{
		level.var_f8b68299 = [];
	}
	else if(!IsArray(level.var_f8b68299))
	{
		level.var_f8b68299 = Array(level.var_f8b68299);
	}
	level.var_f8b68299[level.var_f8b68299.size] = "vox_shad_keepers_defeated_1";
	if(!isdefined(level.var_f8b68299))
	{
		level.var_f8b68299 = [];
	}
	else if(!IsArray(level.var_f8b68299))
	{
		level.var_f8b68299 = Array(level.var_f8b68299);
	}
	level.var_f8b68299[level.var_f8b68299.size] = "vox_shad_keepers_defeated_2";
	if(!isdefined(level.var_f8b68299))
	{
		level.var_f8b68299 = [];
	}
	else if(!IsArray(level.var_f8b68299))
	{
		level.var_f8b68299 = Array(level.var_f8b68299);
	}
	level.var_f8b68299[level.var_f8b68299.size] = "vox_shad_keepers_defeated_3";
	if(!isdefined(level.var_f8b68299))
	{
		level.var_f8b68299 = [];
	}
	else if(!IsArray(level.var_f8b68299))
	{
		level.var_f8b68299 = Array(level.var_f8b68299);
	}
	level.var_f8b68299[level.var_f8b68299.size] = "vox_shad_keepers_defeated_4";
	level flag::init("vo_beastmode_hint");
	level thread function_992ae7cf();
	level thread function_b18c02d7();
	level.audio_get_mod_type = &function_642e6aef;
	level.custom_door_deny_vo_func = &function_33bc3cb3;
	level._magic_box_used_VO = &function_ffa05390;
}

/*
	Name: on_player_spawned
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2660
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 138
*/
function on_player_spawned()
{
	SetDvar("playerEnergy_enabled", 0);
	self.isSpeaking = 0;
	self.n_vo_priority = 0;
	self.var_aefa986d = 0;
	self.var_5a34308d = Array(0, 1, 2, 3, 4);
	self.var_5a34308d = Array::randomize(self.var_5a34308d);
	self.var_f5df7d5f = 0;
	self notify("hash_50a35f19");
	self endon("hash_50a35f19");
	self endon("disconnect");
	self endon("bled_out");
	self endon("death");
	level endon("hash_604f913b");
	if(!level flag::get("ee_boss_started") && !isdefined(self.var_b91625df))
	{
		level flag::wait_till("ritual_pap_complete");
		while(!level flag::get("ee_boss_started"))
		{
			wait(2);
			if(zm_utility::is_player_valid(self, 0, 0))
			{
				if(self.origin[2] > 128)
				{
					self.var_b91625df = 1;
					if(self.characterindex == 3)
					{
						self function_7b697614("vox_plr_3_city_transform_0", 0, 1, 100);
						self thread function_7b697614("vox_plr_3_city_transform_1", 0, 1, 100);
					}
					else
					{
						self thread function_7b697614("vox_plr_" + self.characterindex + "_city_transform_0", 0, 1, 100);
						return;
					}
				}
			}
		}
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x28A0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 190
*/
function on_player_connect()
{
	self endon("disconnect");
	self endon("death");
	while(!isdefined(self.var_d89174ae))
	{
		wait(0.048);
	}
}

/*
	Name: function_aca1bc0c
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x28E0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 210
*/
function function_aca1bc0c(var_356fbd8b)
{
	var_af1cee3 = function_766f6914(var_356fbd8b);
	str_line = "vox_idgun_greet_player_" + var_af1cee3;
	self function_1a180bd3(str_line);
}

/*
	Name: function_1a180bd3
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2950
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 227
*/
function function_1a180bd3(str_line)
{
	function_a59cecd7();
	self function_cf8fccfe(1);
	self function_7b697614(str_line);
}

/*
	Name: function_1f2b0c20
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x29A8
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 244
*/
function function_1f2b0c20(var_5140f86e, var_da3dac0c)
{
	function_a59cecd7();
	self function_cf8fccfe(1);
	str_vo = "vox_sword" + var_da3dac0c + "_greet_player_" + var_5140f86e;
	self function_7b697614(str_vo, 0, 1);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_766f6914
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2A38
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 264
*/
function function_766f6914(var_356fbd8b)
{
	switch(level.idgun[var_356fbd8b].var_e4be281f)
	{
		case "idgun_0":
		{
			return 0;
		}
		case "idgun_1":
		{
			return 1;
		}
		case "idgun_2":
		{
			return 2;
		}
		case "idgun_3":
		{
			return 3;
		}
	}
}

/*
	Name: function_a59cecd7
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2AA8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_a59cecd7()
{
	while(level flag::get("story_vo_playing"))
	{
		wait(0.1);
	}
}

/*
	Name: function_218256bd
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2AE8
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 315
*/
function function_218256bd(var_eca8128e)
{
	if(var_eca8128e)
	{
		foreach(player in level.activePlayers)
		{
			while(isdefined(player) && (isdefined(player.isSpeaking) && player.isSpeaking))
			{
				wait(0.1);
			}
		}
	}
	foreach(player in level.activePlayers)
	{
		if(isdefined(player))
		{
			player.dontspeak = var_eca8128e;
			player clientfield::set_to_player("isspeaking", var_eca8128e);
		}
	}
}

/*
	Name: function_cf8fccfe
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2C60
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 347
*/
function function_cf8fccfe(var_eca8128e)
{
	self.dontspeak = var_eca8128e;
	self clientfield::set_to_player("isspeaking", var_eca8128e);
	if(var_eca8128e)
	{
		while(isdefined(self) && (isdefined(self.isSpeaking) && self.isSpeaking))
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_7b697614
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2CD8
	Size: 0x318
	Parameters: 5
	Flags: None
	Line Number: 370
*/
function function_7b697614(var_96896ff5, n_delay, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	self endon("death");
	self endon("disconnect");
	if(!self flag::exists("in_beastmode") || !self flag::get("in_beastmode"))
	{
		if(zm_audio::areNearbySpeakersActive(10000) && isdefined(var_d1295208) && !var_d1295208)
		{
			return;
		}
		if(isdefined(self.isSpeaking) && self.isSpeaking || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
		{
			if(isdefined(b_wait_if_busy) && b_wait_if_busy)
			{
				while(self.isSpeaking || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
				{
					wait(0.1);
				}
				wait(0.35);
				return;
			}
			else
			{
			}
		}
		if(n_delay > 0)
		{
			wait(n_delay);
		}
		if(isdefined(self.isSpeaking) && self.isSpeaking && (isdefined(self.b_wait_if_busy) && self.b_wait_if_busy))
		{
			while(self.isSpeaking)
			{
				wait(0.1);
			}
		}
		else if(isdefined(self.isSpeaking) && self.isSpeaking && (!(isdefined(self.b_wait_if_busy) && self.b_wait_if_busy)) || (isdefined(level.sndVoxOverride) && level.sndVoxOverride))
		{
			return;
		}
		self.isSpeaking = 1;
		self.n_vo_priority = var_a8564a44;
		self.str_vo_being_spoken = var_96896ff5;
		Array::add(level.a_e_speakers, self, 1);
		var_2df3d133 = var_96896ff5 + "_vo_done";
		thread namespace_cc012897::Send(var_96896ff5);
		if(IsActor(self) || isPlayer(self))
		{
			self playsoundwithnotify(var_96896ff5, var_2df3d133, "J_head");
		}
		else
		{
			self playsoundwithnotify(var_96896ff5, var_2df3d133);
		}
		self waittill(var_2df3d133);
		self function_8995134a();
	}
}

/*
	Name: function_8995134a
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x2FF8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 451
*/
function function_8995134a()
{
	self.str_vo_being_spoken = "";
	self.n_vo_priority = 0;
	self.isSpeaking = 0;
	b_in_a_e_speakers = 0;
	foreach(e_checkme in level.a_e_speakers)
	{
		if(e_checkme == self)
		{
			b_in_a_e_speakers = 1;
			break;
		}
	}
	if(isdefined(b_in_a_e_speakers) && b_in_a_e_speakers)
	{
		ArrayRemoveValue(level.a_e_speakers, self);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_502f946b
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x30F8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 483
*/
function function_502f946b()
{
	self endon("death");
	if(isdefined(self.str_vo_being_spoken) && self.str_vo_being_spoken != "")
	{
		self stopsound(self.str_vo_being_spoken);
	}
	function_8995134a();
}

/*
	Name: function_2426269b
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x3160
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 503
*/
function function_2426269b(v_pos, n_range)
{
	if(!isdefined(n_range))
	{
		n_range = 1000;
	}
	if(isdefined(level.a_e_speakers))
	{
		foreach(var_d211180f in level.a_e_speakers)
		{
			if(!isdefined(var_d211180f))
			{
				continue;
			}
			if(!isdefined(v_pos) || DistanceSquared(var_d211180f.origin, v_pos) <= n_range * n_range)
			{
				if(isdefined(var_d211180f.str_vo_being_spoken) && var_d211180f.str_vo_being_spoken != "")
				{
					var_d211180f stopsound(var_d211180f.str_vo_being_spoken);
				}
				var_d211180f.deleteme = 1;
				var_d211180f.str_vo_being_spoken = "";
				var_d211180f.n_vo_priority = 0;
				var_d211180f.isSpeaking = 0;
			}
		}
		i = 0;
		while(isdefined(level.a_e_speakers) && i < level.a_e_speakers.size)
		{
			if(isdefined(level.a_e_speakers[i].deleteme) && level.a_e_speakers[i].deleteme == 1)
			{
				ArrayRemoveValue(level.a_e_speakers, level.a_e_speakers[i]);
				i = 0;
			}
			else
			{
				i++;
			}
		}
	}
}

/*
	Name: function_897246e4
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x33A0
	Size: 0x1D8
	Parameters: 5
	Flags: None
	Line Number: 555
*/
function function_897246e4(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(n_wait))
	{
		n_wait = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	var_81132431 = StrTok(var_96896ff5, "_");
	if(var_81132431[1] === "plr")
	{
		var_edf0b06 = Int(var_81132431[2]);
		e_speaker = zm_utility::get_specific_character(var_edf0b06);
	}
	else if(var_81132431[1] === "shad")
	{
		e_speaker = undefined;
		level function_b2392771(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
	}
	else
	{
		e_speaker = undefined;
		/#
			/#
				Assert(0, "Dev Block strings are not supported" + var_96896ff5 + "Dev Block strings are not supported");
			#/
		#/
	}
	if(zm_utility::is_player_valid(e_speaker, 0, 1))
	{
		e_speaker function_7b697614(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
	}
}

/*
	Name: function_b2392771
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x3580
	Size: 0x110
	Parameters: 4
	Flags: None
	Line Number: 609
*/
function function_b2392771(str_dialog, var_853e20ac, b_wait_if_busy, var_a8564a44)
{
	if(!isdefined(var_853e20ac))
	{
		var_853e20ac = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	function_218256bd(1);
	for(i = 1; i < level.activePlayers.size; i++)
	{
		level.activePlayers[i] thread function_7b697614(str_dialog, var_853e20ac + 0.1, b_wait_if_busy, var_a8564a44);
	}
	level.activePlayers[0] function_7b697614(str_dialog, var_853e20ac, b_wait_if_busy, var_a8564a44);
	function_218256bd(0);
}

/*
	Name: function_63c44c5a
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x3698
	Size: 0x120
	Parameters: 5
	Flags: None
	Line Number: 638
*/
function function_63c44c5a(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	function_218256bd(1);
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			var_e27770b1 = var_e21e86b8[i];
		}
		else
		{
			var_e27770b1 = 0;
		}
		self function_7b697614(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208);
	}
	function_218256bd(0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7aa5324a
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x37C0
	Size: 0x118
	Parameters: 5
	Flags: None
	Line Number: 680
*/
function function_7aa5324a(a_str_vo, var_e21e86b8, b_wait_if_busy, var_a8564a44, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_a8564a44))
	{
		var_a8564a44 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	function_218256bd(1);
	for(i = 0; i < a_str_vo.size; i++)
	{
		if(isdefined(var_e21e86b8))
		{
			var_e27770b1 = var_e21e86b8[i];
		}
		else
		{
			var_e27770b1 = 0;
		}
		function_897246e4(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208);
	}
	function_218256bd(0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_c23e3a71
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x38E0
	Size: 0x160
	Parameters: 6
	Flags: None
	Line Number: 722
*/
function function_c23e3a71(var_49fefccd, n_index, var_f781d8ce, b_wait_if_busy, var_7e649f23, var_d1295208)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_7e649f23))
	{
		var_7e649f23 = 0;
	}
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	/#
		/#
			Assert(isdefined(var_49fefccd), "Dev Block strings are not supported");
		#/
	#/
	/#
		/#
			Assert(n_index < var_49fefccd.size, "Dev Block strings are not supported");
		#/
	#/
	var_3b5e4c24 = var_49fefccd[n_index];
	var_123bfae = undefined;
	if(isdefined(var_f781d8ce))
	{
		/#
			/#
				Assert(n_index < var_f781d8ce.size, "Dev Block strings are not supported");
			#/
		#/
		var_123bfae = var_f781d8ce[n_index];
	}
	function_7aa5324a(var_3b5e4c24, var_123bfae, b_wait_if_busy, var_7e649f23, var_d1295208);
	return;
}

/*
	Name: function_642e6aef
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x3A48
	Size: 0x480
	Parameters: 7
	Flags: None
	Line Number: 771
*/
function function_642e6aef(impact, mod, weapon, zombie, instakill, dist, player)
{
	close_dist = 4096;
	med_dist = 15376;
	far_dist = 160000;
	if(zombie.damageWeapon.name == "sticky_grenade_widows_wine")
	{
		return "default";
	}
	if(zm_utility::is_placeable_mine(weapon))
	{
		if(!instakill)
		{
			return "betty";
		}
		return "weapon_instakill";
	}
	if(zombie.damageWeapon.name == "cymbal_monkey")
	{
		if(instakill)
		{
			return "weapon_instakill";
		}
		return "monkey";
	}
	if(weapon.name == "ray_gun" && dist > far_dist)
	{
		if(!instakill)
		{
			return "raygun";
		}
		return "weapon_instakill";
	}
	if(zm_utility::is_headshot(weapon, impact, mod) && dist >= far_dist)
	{
		return "headshot";
	}
	if(mod == "MOD_MELEE" || (mod == "MOD_UNKNOWN" && dist < med_dist))
	{
		foreach(a_w_swords in level.var_15954023.weapons)
		{
			foreach(w_sword in a_w_swords)
			{
				if(weapon == w_sword)
				{
					return "sword_slash";
				}
			}
		}
	}
	else if(mod == "MOD_MELEE" || (mod == "MOD_UNKNOWN" && dist < close_dist))
	{
		if(!instakill)
		{
			return "melee";
		}
		return "melee_instakill";
	}
	if(zm_utility::is_explosive_damage(mod) && weapon.name != "ray_gun" && (!(isdefined(zombie.is_on_fire) && zombie.is_on_fire)))
	{
		if(!instakill)
		{
			return "explosive";
		}
		return "weapon_instakill";
	}
	if(weapon.doesFireDamage && (mod == "MOD_BURNED" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH"))
	{
		if(!instakill)
		{
			return "flame";
		}
		return "weapon_instakill";
	}
	if(!isdefined(impact))
	{
		impact = "";
	}
	if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
	{
		if(!instakill)
		{
			return "bullet";
		}
		return "weapon_instakill";
	}
	if(instakill)
	{
		return "default";
	}
	if(mod != "MOD_MELEE" && zombie.missingLegs)
	{
		return "crawler";
	}
	if(mod != "MOD_BURNED" && dist < close_dist)
	{
		return "close";
	}
	return "default";
}

/*
	Name: function_6bccb368
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x3ED0
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 882
*/
function function_6bccb368()
{
	self endon("_zombie_game_over");
	self endon("disconnect");
	self endon("death");
	if(!level flag::exists("someone_saw_zombie"))
	{
		level flag::init("someone_saw_zombie");
	}
	while(!level flag::get("someone_saw_zombie"))
	{
		a_enemies = zombie_utility::get_round_enemy_array();
		if(!self flag::get("in_beastmode") && isdefined(a_enemies) && a_enemies.size > 0)
		{
			var_670979e7 = undefined;
			for(i = 0; !isdefined(var_670979e7) && i < a_enemies.size; i++)
			{
				if(self function_2d942575(a_enemies[i], 300))
				{
					var_670979e7 = a_enemies[i];
				}
			}
			if(isdefined(var_670979e7))
			{
				var_43c4688f = "vox_plr_" + self.characterindex + "_first_encounter_" + RandomInt(2);
				self thread function_7b697614(var_43c4688f);
				level flag::set("someone_saw_zombie");
			}
		}
		if(self flag::get("in_beastmode"))
		{
			wait(1.5);
		}
		else
		{
			wait(0.5);
		}
	}
}

/*
	Name: function_2d942575
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x40F0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 932
*/
function function_2d942575(var_47db2fcf, var_72259a3d)
{
	if(isdefined(self) && isdefined(var_47db2fcf))
	{
		return self zm_sidequests::is_facing(var_47db2fcf) && Distance(self.origin, var_47db2fcf.origin) < var_72259a3d;
	}
	return 0;
}

/*
	Name: weapon_type_check_custom
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x4168
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 951
*/
function weapon_type_check_custom(weapon, magic_box)
{
	if(weapon.isDualWield)
	{
		return "dualwield";
		return;
	}
}

/*
	Name: function_ce1aa14e
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x41A8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 970
*/
function function_ce1aa14e(table)
{
	if(isdefined(table.a_piecestubs))
	{
		for(i = 0; i < table.a_piecestubs.size; i++)
		{
			table.a_piecestubs[i].vox_id = table.a_piecestubs[i].pieceName;
		}
	}
}

/*
	Name: function_7884e6b8
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x4240
	Size: 0x2048
	Parameters: 0
	Flags: None
	Line Number: 991
*/
function function_7884e6b8()
{
	self endon("_zombie_game_over");
	var_2aceef24 = [];
	var_2aceef24[0] = Array("vox_plr_3_interaction_nero_rose_1_0", "vox_plr_2_interaction_nero_rose_1_0");
	var_2aceef24[1] = Array("vox_plr_3_interaction_nero_rose_2_0", "vox_plr_2_interaction_nero_rose_2_0");
	var_2aceef24[2] = Array("vox_plr_3_interaction_nero_rose_3_0", "vox_plr_2_interaction_nero_rose_3_0");
	var_2aceef24[3] = Array("vox_plr_2_interaction_nero_rose_4_0", "vox_plr_3_interaction_nero_rose_4_0");
	var_2aceef24[4] = Array("vox_plr_3_interaction_nero_rose_5_0", "vox_plr_2_interaction_nero_rose_5_0");
	var_2e0bdd7c = [];
	var_2e0bdd7c[0] = Array(0, 0.5);
	var_2e0bdd7c[1] = Array(0, 0.5);
	var_2e0bdd7c[2] = Array(0, 0.5);
	var_2e0bdd7c[3] = Array(0, 0.5);
	var_2e0bdd7c[4] = Array(0, 0.5);
	var_cd89e034 = 0;
	var_a6212a19 = [];
	var_a6212a19[0] = Array("vox_plr_3_interaction_nero_floyd_1_0", "vox_plr_0_interaction_nero_floyd_1_0");
	var_a6212a19[1] = Array("vox_plr_3_interaction_nero_floyd_2_0", "vox_plr_0_interaction_nero_floyd_2_0");
	var_a6212a19[2] = Array("vox_plr_3_interaction_nero_floyd_3_0", "vox_plr_0_interaction_nero_floyd_3_0");
	var_a6212a19[3] = Array("vox_plr_3_interaction_nero_floyd_4_0", "vox_plr_0_interaction_nero_floyd_4_0");
	var_a6212a19[4] = Array("vox_plr_3_interaction_nero_floyd_5_0", "vox_plr_0_interaction_nero_floyd_5_0");
	var_89c75715 = [];
	var_89c75715[0] = Array(0, 0.5);
	var_89c75715[1] = Array(0, 0.5);
	var_89c75715[2] = Array(0, 0.5);
	var_89c75715[3] = Array(0, 0.5);
	var_89c75715[4] = Array(0, 0.5);
	var_13c9923f = 0;
	var_9c641b00 = [];
	var_9c641b00[0] = Array("vox_plr_1_interaction_nero_jack_1_0", "vox_plr_3_interaction_nero_jack_1_0");
	var_9c641b00[1] = Array("vox_plr_3_interaction_nero_jack_2_0", "vox_plr_1_interaction_nero_jack_2_0");
	var_9c641b00[2] = Array("vox_plr_3_interaction_nero_jack_3_0", "vox_plr_1_interaction_nero_jack_3_0", "vox_plr_3_interaction_nero_jack_3_1");
	var_9c641b00[3] = Array("vox_plr_1_interaction_nero_jack_4_0", "vox_plr_3_interaction_nero_jack_4_0");
	var_9c641b00[4] = Array("vox_plr_3_interaction_nero_jack_5_0", "vox_plr_1_interaction_nero_jack_5_0");
	var_ed6dbab8 = [];
	var_ed6dbab8[0] = Array(0, 0.5);
	var_ed6dbab8[1] = Array(0, 0.5);
	var_ed6dbab8[2] = Array(0, 0.5, 0.5);
	var_ed6dbab8[3] = Array(0, 0.5);
	var_ed6dbab8[4] = Array(0, 0.5);
	var_6c01a9d8 = 0;
	var_80d70a6a = [];
	var_80d70a6a[0] = Array("vox_plr_2_interaction_rose_floyd_1_0", "vox_plr_0_interaction_rose_floyd_1_0");
	var_80d70a6a[1] = Array("vox_plr_0_interaction_rose_floyd_2_0", "vox_plr_2_interaction_rose_floyd_2_0");
	var_80d70a6a[2] = Array("vox_plr_2_interaction_rose_floyd_3_0", "vox_plr_0_interaction_rose_floyd_3_0");
	var_80d70a6a[3] = Array("vox_plr_0_interaction_rose_floyd_4_0", "vox_plr_2_interaction_rose_floyd_4_0");
	var_80d70a6a[4] = Array("vox_plr_0_interaction_rose_floyd_5_0", "vox_plr_2_interaction_rose_floyd_5_0");
	var_71f5a15c = [];
	var_71f5a15c[0] = Array(0, 0.5);
	var_71f5a15c[1] = Array(0, 0.5);
	var_71f5a15c[2] = Array(0, 0.5);
	var_71f5a15c[3] = Array(0, 0.5);
	var_71f5a15c[4] = Array(0, 0.5);
	var_78e21714 = 0;
	var_c92f1b5 = [];
	var_c92f1b5[0] = Array("vox_plr_1_interaction_rose_jack_1_0", "vox_plr_2_interaction_rose_jack_1_0");
	var_c92f1b5[1] = Array("vox_plr_1_interaction_rose_jack_2_0", "vox_plr_2_interaction_rose_jack_2_0");
	var_c92f1b5[2] = Array("vox_plr_1_interaction_rose_jack_3_0", "vox_plr_2_interaction_rose_jack_3_0");
	var_c92f1b5[3] = Array("vox_plr_2_interaction_rose_jack_4_0", "vox_plr_1_interaction_rose_jack_4_0");
	var_c92f1b5[4] = Array("vox_plr_2_interaction_rose_jack_5_0", "vox_plr_1_interaction_rose_jack_5_0");
	var_abdc92f = [];
	var_abdc92f[0] = Array(0, 0.5);
	var_abdc92f[1] = Array(0, 0.5);
	var_abdc92f[2] = Array(0, 0.5);
	var_abdc92f[3] = Array(0, 0.5);
	var_abdc92f[4] = Array(0, 0.5);
	var_153b39c5 = 0;
	var_74dec714 = [];
	var_74dec714[0] = Array("vox_plr_1_interaction_floyd_jack_1_0", "vox_plr_0_interaction_floyd_jack_1_0");
	var_74dec714[1] = Array("vox_plr_1_interaction_floyd_jack_2_0", "vox_plr_0_interaction_floyd_jack_2_0");
	var_74dec714[2] = Array("vox_plr_1_interaction_floyd_jack_3_0", "vox_plr_0_interaction_floyd_jack_3_0");
	var_74dec714[3] = Array("vox_plr_1_interaction_floyd_jack_4_0", "vox_plr_0_interaction_floyd_jack_4_0");
	var_74dec714[4] = Array("vox_plr_0_interaction_floyd_jack_5_0", "vox_plr_1_interaction_floyd_jack_5_0");
	var_8c491a82 = [];
	var_8c491a82[0] = Array(0, 0.5);
	var_8c491a82[1] = Array(0, 0.5);
	var_8c491a82[2] = Array(0, 0.5);
	var_8c491a82[3] = Array(0, 0.5);
	var_8c491a82[4] = Array(0, 0.5);
	var_8e5923d6 = 0;
	var_7e83078b = [];
	var_7e83078b[0] = Array("vox_shad_convo_shadowman_1_0", "vox_plr_0_convo_shadowman_1_0");
	var_7e83078b[1] = Array("vox_shad_convo_shadowman_2_0");
	var_7e83078b[2] = Array("vox_shad_convo_shadowman_3_0", "vox_plr_0_convo_shadowman_3_0");
	var_ada1803 = 0;
	var_8bc75ab1 = [];
	var_8bc75ab1[0] = Array(0, 0.5);
	var_8bc75ab1[1] = Array(0);
	var_8bc75ab1[2] = Array(0, 0.5);
	var_9abcfc3a = [];
	var_9abcfc3a[0] = Array("vox_shad_convo_shadowman_1_0", "vox_plr_1_convo_shadowman_1_0");
	var_9abcfc3a[1] = Array("vox_shad_convo_shadowman_2_0");
	var_9abcfc3a[2] = Array("vox_shad_convo_shadowman_3_0", "vox_plr_1_convo_shadowman_3_0");
	var_2fe96e24 = 0;
	var_77205e6c = [];
	var_77205e6c[0] = Array(0, 0.5);
	var_77205e6c[1] = Array(0);
	var_77205e6c[2] = Array(0, 0.5);
	var_580b69be = [];
	var_580b69be[0] = Array("vox_shad_convo_shadowman_1_0", "vox_plr_2_convo_shadowman_1_0");
	var_580b69be[1] = Array("vox_shad_convo_shadowman_2_0");
	var_580b69be[2] = Array("vox_shad_convo_shadowman_3_0", "vox_plr_2_convo_shadowman_3_0");
	var_79fa2e10 = 0;
	var_15769b50 = [];
	var_15769b50[0] = Array(0, 0.5);
	var_15769b50[1] = Array(0);
	var_15769b50[2] = Array(0, 0.5);
	var_6d5a2d1 = [];
	var_6d5a2d1[0] = Array("vox_shad_convo_shadowman_1_0", "vox_plr_3_convo_shadowman_1_0");
	var_6d5a2d1[1] = Array("vox_shad_convo_shadowman_2_0");
	var_6d5a2d1[2] = Array("vox_shad_convo_shadowman_3_0", "vox_plr_3_convo_shadowman_3_0");
	var_427d9c1f = 0;
	var_561dc75 = [];
	var_561dc75[0] = Array(0, 0.5);
	var_561dc75[1] = Array(0);
	var_561dc75[2] = Array(0, 0.5);
	level waittill("all_players_connected");
	var_363bbdaa = GetPlayers();
	level._audio_custom_weapon_check = &weapon_type_check_custom;
	zm_audio::zmbVoxAdd("weapon_pickup", "dualwield", "box_dual", 100, 0);
	zm_audio::zmbVoxAdd("general", "idgun_assemble_final", "idgun_assemble", 100, 0);
	zm_audio::zmbVoxAdd("general", "part_heart_pickup", "pickup_heart", 100, 0);
	zm_audio::zmbVoxAdd("general", "part_skeleton_pickup", "pickup_skeleton", 100, 0);
	zm_audio::zmbVoxAdd("general", "part_xenomatter_pickup", "pickup_zenomatter", 100, 0);
	zm_audio::zmbVoxAdd("general", "archon_appears_0", "archon_appears_0", 100, 0);
	zm_audio::zmbVoxAdd("general", "archon_appears_1", "archon_appears_1", 100, 0);
	zm_craftables::add_zombie_craftable_vox_category("idgun", "idgun_assemble");
	zm_craftables::add_zombie_craftable_vox_category("second_idgun", "idgun_assemble");
	if(isdefined(level.zombie_include_craftables["idgun"]))
	{
		function_ce1aa14e(level.zombie_include_craftables["idgun"]);
	}
	if(isdefined(level.zombie_include_craftables["second_idgun"]))
	{
		function_ce1aa14e(level.zombie_include_craftables["second_idgun"]);
	}
	wait(1);
	level flag::init("someone_saw_1st_zombie");
	foreach(dude in level.activePlayers)
	{
		dude thread function_6bccb368();
	}
	while(1)
	{
		var_4a606162 = 0;
		var_ed1bf2cd = zm::get_round_number();
		if(var_ed1bf2cd <= 4 && !level flag::get("ritual_pap_complete"))
		{
			if(var_ed1bf2cd < 2)
			{
				function_5a3465d8();
				continue;
			}
			if(var_ed1bf2cd > 1)
			{
				level waittill("start_of_round");
			}
			if(!level flag::get("ritual_in_progress") && !level flag::get("ritual_pap_complete"))
			{
				var_ed1bf2cd = zm::get_round_number();
				function_218256bd(1);
				var_95496ba8 = "vox_shad_round" + var_ed1bf2cd + "_start_0";
				var_5bc4a435 = Array::random(level.activePlayers);
				var_58d3f663 = "vox_plr_" + var_5bc4a435.characterindex + "_round" + var_ed1bf2cd + "_start_0";
				if(var_ed1bf2cd < 4)
				{
					var_308b02ed = Array(var_95496ba8, var_58d3f663);
				}
				else
				{
					var_308b02ed = Array("vox_shad_round4_start_0", var_58d3f663, "vox_shad_round4_start_1");
				}
				var_4d029563 = Array(0, 0.5);
				function_7aa5324a(var_308b02ed, var_4d029563, 1);
				function_218256bd(0);
				level waittill("end_of_round");
				if(!level flag::get("ritual_in_progress") && !level flag::get("ritual_pap_complete"))
				{
					var_ed1bf2cd = zm::get_round_number();
					n_previous_round = var_ed1bf2cd - 1;
					var_5bc4a435 = Array::random(level.activePlayers);
					if(level flag::get("vo_beastmode_hint"))
					{
						function_218256bd(1);
						function_897246e4("vox_shad_hints_beastmode_0", 0, 1);
						level flag::clear("vo_beastmode_hint");
						function_218256bd(0);
					}
					else if(n_previous_round < 2)
					{
						var_76393213 = "vox_plr_" + var_5bc4a435.characterindex + "_round" + n_previous_round + "_end_0";
						function_218256bd(1);
						if(isdefined(var_5bc4a435))
						{
							var_5bc4a435 function_7b697614(var_76393213, 0, 1);
						}
						function_218256bd(0);
					}
					else if(n_previous_round == 3)
					{
						function_218256bd(1);
						function_897246e4("vox_shad_keepers_ritual_0", 0, 1);
						function_218256bd(0);
					}
					else
					{
						var_5bc4a435 function_b19fc986("positive", 0, 1);
					}
				}
			}
		}
		else
		{
			level waittill("start_of_round");
			if(!level flag::get("ritual_in_progress"))
			{
				e_speaker = Array::random(level.activePlayers);
				if(level flag::exists("wasp_round") && level flag::get("wasp_round"))
				{
					do
					{
						var_26378eb = RandomInt(3);
					}
					while(!var_26378eb === self.var_e3244016);
					var_d485f9b4 = "vox_plr_" + e_speaker.characterindex + "_round_parasite_" + var_26378eb;
					e_speaker.var_e3244016 = var_26378eb;
					e_speaker function_7b697614(var_d485f9b4, 2.5);
				}
				else if(level flag::exists("raps_round") && level flag::get("raps_round"))
				{
					do
					{
						var_26378eb = RandomInt(5);
					}
					while(!var_26378eb === e_speaker.var_465e4929);
					var_9f08831f = "vox_plr_" + e_speaker.characterindex + "_round_elemental_" + var_26378eb;
					e_speaker.var_796f13cd = var_26378eb;
					e_speaker function_7b697614(var_9f08831f, 1.5);
				}
				level waittill("end_of_round");
				if(level.activePlayers.size > 1 && !level flag::get("ritual_in_progress"))
				{
					n_player_index = RandomInt(level.activePlayers.size);
					var_e8669 = level.activePlayers[n_player_index];
					var_a68de872 = Array::remove_index(level.activePlayers, n_player_index);
					var_261100d2 = ArrayGetClosest(var_e8669.origin, var_a68de872);
					if(zm_utility::is_player_valid(var_e8669) && zm_utility::is_player_valid(var_261100d2) && Distance(var_e8669.origin, var_261100d2.origin) <= 900)
					{
						var_3b5e4c24 = undefined;
						var_123bfae = Array(0, 0);
						if(var_e8669.characterindex == 3 && var_261100d2.characterindex == 2 || (var_261100d2.characterindex == 3 && var_e8669.characterindex == 2))
						{
							if(var_cd89e034 < var_2aceef24.size)
							{
								function_c23e3a71(var_2aceef24, var_cd89e034, var_2e0bdd7c, 1);
								var_cd89e034++;
							}
							else
							{
								var_4a606162 = 1;
							}
						}
						else if(var_e8669.characterindex == 3 && var_261100d2.characterindex == 0 || (var_261100d2.characterindex == 3 && var_e8669.characterindex == 0))
						{
							if(var_13c9923f < var_a6212a19.size)
							{
								function_c23e3a71(var_a6212a19, var_13c9923f, var_89c75715, 1);
								var_13c9923f++;
							}
							else
							{
								var_4a606162 = 1;
							}
						}
						else if(var_e8669.characterindex == 3 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 3 && var_e8669.characterindex == 1))
						{
							if(var_6c01a9d8 < var_9c641b00.size)
							{
								function_c23e3a71(var_9c641b00, var_6c01a9d8, var_ed6dbab8, 1);
								var_6c01a9d8++;
							}
							else
							{
								var_4a606162 = 1;
							}
						}
						else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 0 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 0))
						{
							if(var_78e21714 < var_80d70a6a.size)
							{
								function_c23e3a71(var_80d70a6a, var_78e21714, var_71f5a15c, 1);
								var_78e21714++;
							}
							else
							{
								var_4a606162 = 1;
							}
						}
						else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 1))
						{
							if(var_153b39c5 < var_c92f1b5.size)
							{
								function_c23e3a71(var_c92f1b5, var_153b39c5, var_abdc92f, 1);
								var_153b39c5++;
							}
							else
							{
								var_4a606162 = 1;
							}
						}
						else if(var_e8669.characterindex == 0 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 0 && var_e8669.characterindex == 1))
						{
							if(var_8e5923d6 < var_74dec714.size)
							{
								function_c23e3a71(var_74dec714, var_8e5923d6, var_8c491a82, 1);
								var_8e5923d6++;
							}
							else
							{
								var_4a606162 = 1;
							}
						}
					}
				}
				else
				{
					var_4a606162 = 1;
				}
			}
		}
		if(var_4a606162 && !level flag::get("ritual_in_progress") && !level flag::get("ritual_pap_complete"))
		{
			var_5bc4a435 = Array::random(level.activePlayers);
			switch(var_5bc4a435.characterindex)
			{
				case 0:
				{
					if(var_ada1803 < var_7e83078b.size)
					{
						function_7aa5324a(var_7e83078b[var_ada1803], var_8bc75ab1[var_ada1803], 1);
						var_ada1803++;
					}
					else
					{
						var_5bc4a435 function_b19fc986("positive", 0, 1);
						break;
					}
				}
				case 1:
				{
					if(var_2fe96e24 < var_9abcfc3a.size)
					{
						function_7aa5324a(var_9abcfc3a[var_2fe96e24], var_77205e6c[var_2fe96e24], 1);
						var_2fe96e24++;
					}
					else
					{
						var_5bc4a435 function_b19fc986("positive", 0, 1);
						break;
					}
				}
				case 2:
				{
					if(var_79fa2e10 < var_580b69be.size)
					{
						function_7aa5324a(var_580b69be[var_79fa2e10], var_15769b50[var_79fa2e10], 1);
						var_79fa2e10++;
					}
					else
					{
						var_5bc4a435 function_b19fc986("positive", 0, 1);
						break;
					}
				}
				case 3:
				{
					if(var_427d9c1f < var_6d5a2d1.size)
					{
						function_7aa5324a(var_6d5a2d1[var_427d9c1f], var_561dc75[var_427d9c1f], 1);
						var_427d9c1f++;
					}
					else
					{
						var_5bc4a435 function_b19fc986("positive", 0, 1);
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_5a3465d8
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x6290
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 1394
*/
function function_5a3465d8()
{
	level flag::wait_till("start_zombie_round_logic");
	round_number = zm::get_round_number();
	var_f7ea4005 = "vox_shad_round" + round_number + "_start_0";
	level function_b2392771(var_f7ea4005, 0, 0, 99);
	wait(0.5);
	level thread function_7470769c("round" + round_number + "_start_0", "end_of_round", "start_of_round");
	level waittill("end_of_round");
	level thread function_7470769c("round" + round_number + "_end_0", "end_of_round", "start_of_round");
}

/*
	Name: function_7470769c
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x63A8
	Size: 0x160
	Parameters: 3
	Flags: None
	Line Number: 1416
*/
function function_7470769c(sound, end_notify, var_c04a5f82)
{
	struct = spawnstruct();
	level thread function_1fce12e5(struct, end_notify, var_c04a5f82, sound + "_vo_done");
	players = Array::randomize(level.activePlayers);
	foreach(player in players)
	{
		if(zm_utility::is_player_valid(player, 0, 1))
		{
			player function_23952569(sound);
		}
		if(isdefined(struct.var_c6011baf))
		{
			level notify(sound + "_vo_done");
			return;
		}
	}
}

/*
	Name: function_23952569
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x6510
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 1445
*/
function function_23952569(sound_name)
{
	self endon("disconnect");
	self endon("death");
	sound_to_play = "vox_plr_" + self.characterindex + "_" + sound_name;
	self function_7b697614(sound_to_play, 0, 1, 100);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1fce12e5
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x6590
	Size: 0x88
	Parameters: 4
	Flags: None
	Line Number: 1465
*/
function function_1fce12e5(struct, end_notify, var_c04a5f82, var_4f92cc15)
{
	while(!isdefined(struct.var_c6011baf))
	{
		level util::waittill_any_array(Array(end_notify, var_c04a5f82, var_4f92cc15));
		struct.var_c6011baf = 1;
		return;
	}
}

/*
	Name: function_992ae7cf
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x6620
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1485
*/
function function_992ae7cf()
{
	self endon("_zombie_game_over");
	level endon("hash_571c8e3c");
	level waittill("end_of_round");
	level flag::set("vo_beastmode_hint");
}

/*
	Name: function_50460ed1
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x6670
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 1503
*/
function function_50460ed1()
{
	self endon("_zombie_game_over");
	level waittill("hash_571c8e3c");
	if(level.activePlayers.size > 1)
	{
		var_4993c84e = zm_utility::get_specific_character(level.var_9ecbc81);
		var_2a7f708 = [];
		for(i = 0; i < level.players.size; i++)
		{
			if(level.players[i] !== var_4993c84e && level.players[i].beastmode !== 1)
			{
				Array::add(var_2a7f708, level.players[i]);
			}
		}
		if(isdefined(var_2a7f708) && var_2a7f708.size != 0)
		{
			e_closest_player = ArrayGetClosest(var_4993c84e.origin, var_2a7f708);
			if(zm_utility::is_player_valid(e_closest_player) && e_closest_player.beastmode !== 1 && Distance(e_closest_player.origin, var_4993c84e.origin) <= 900)
			{
				var_f8ca415d = "vox_plr_" + e_closest_player.characterindex + "_transform_beast_0";
				function_897246e4(var_f8ca415d, 0.75, 1);
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_32c9e1d9
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x6858
	Size: 0x7B0
	Parameters: 1
	Flags: None
	Line Number: 1542
*/
function function_32c9e1d9(var_e78e30c4)
{
	var_5f56f0a = [];
	var_5f56f0a[0] = Array("vox_plr_0_pickup_badge_0", "vox_plr_0_pickup_badge_1", "vox_plr_0_pickup_badge_2");
	var_5f56f0a[1] = Array("vox_plr_1_pickup_badge_0", "vox_plr_1_pickup_badge_1", "vox_plr_1_pickup_badge_2");
	var_5f56f0a[2] = Array("vox_plr_2_pickup_badge_0", "vox_plr_2_pickup_badge_1", "vox_plr_2_pickup_badge_2");
	var_5f56f0a[3] = Array("vox_plr_3_pickup_badge_0", "vox_plr_3_pickup_badge_1", "vox_plr_3_pickup_badge_2");
	var_fe25e09 = [];
	var_452c2069[0] = Array(0, 0, 0);
	var_452c2069[1] = Array(0, 0, 0);
	var_452c2069[2] = Array(0, 0, 0);
	var_452c2069[3] = Array(0, 0, 0);
	var_f562c91a = [];
	var_f562c91a[0] = Array("vox_plr_0_pickup_belt_0", "vox_plr_0_pickup_belt_1", "vox_plr_0_pickup_belt_2");
	var_f562c91a[1] = Array("vox_plr_1_pickup_belt_0", "vox_plr_1_pickup_belt_1", "vox_plr_1_pickup_belt_2");
	var_f562c91a[2] = Array("vox_plr_2_pickup_belt_0", "vox_plr_2_pickup_belt_1", "vox_plr_2_pickup_belt_2");
	var_f562c91a[3] = Array("vox_plr_3_pickup_belt_0", "vox_plr_3_pickup_belt_1", "vox_plr_3_pickup_belt_2");
	var_28b212db = [];
	var_d9fec6bf[0] = Array(0, 0, 0);
	var_d9fec6bf[1] = Array(0, 0, 0);
	var_d9fec6bf[2] = Array(0, 0, 0);
	var_d9fec6bf[3] = Array(0, 0, 0);
	var_a289b84d = [];
	var_a289b84d[0] = Array("vox_plr_0_pickup_hairpiece_0", "vox_plr_0_pickup_hairpiece_1", "vox_plr_0_pickup_hairpiece_2");
	var_a289b84d[1] = Array("vox_plr_1_pickup_hairpiece_0", "vox_plr_1_pickup_hairpiece_1", "vox_plr_1_pickup_hairpiece_2", "vo_options_plr_1_pickup_hairpiece_3");
	var_a289b84d[2] = Array("vox_plr_2_pickup_hairpiece_0", "vox_plr_2_pickup_hairpiece_1", "vox_plr_2_pickup_hairpiece_2");
	var_a289b84d[3] = Array("vox_plr_3_pickup_hairpiece_0", "vox_plr_3_pickup_hairpiece_1", "vox_plr_3_pickup_hairpiece_2");
	var_72506842 = [];
	var_838979be[0] = Array(0, 0, 0);
	var_838979be[1] = Array(0, 0, 0);
	var_838979be[2] = Array(0, 0, 0);
	var_838979be[3] = Array(0, 0, 0);
	var_a545e2b6 = [];
	var_a545e2b6[0] = Array("vox_plr_0_pickup_pen_0", "vox_plr_0_pickup_pen_1", "vox_plr_0_pickup_pen_2");
	var_a545e2b6[1] = Array("vox_plr_1_pickup_pen_0", "vox_plr_1_pickup_pen_2", "vox_plr_1_pickup_pen_3");
	var_a545e2b6[2] = Array("vox_plr_2_pickup_pen_0", "vox_plr_2_pickup_pen_1", "vox_plr_2_pickup_pen_2");
	var_a545e2b6[3] = Array("vox_plr_3_pickup_pen_0", "vox_plr_3_pickup_pen_1", "vox_plr_3_pickup_pen_2");
	var_1d235ae1 = [];
	var_5af762b1[0] = Array(0, 0, 0);
	var_5af762b1[1] = Array(0, 0, 0);
	var_5af762b1[2] = Array(0, 0, 0);
	var_5af762b1[3] = Array(0, 0, 0);
	switch(var_e78e30c4)
	{
		case "memento_boxer":
		{
			var_c62848ef = RandomInt(var_f562c91a[self.characterindex].size);
			self function_7b697614(var_f562c91a[self.characterindex][var_c62848ef], var_d9fec6bf[self.characterindex][var_c62848ef], 1);
			break;
		}
		case "memento_detective":
		{
			var_c62848ef = RandomInt(var_5f56f0a[self.characterindex].size);
			self function_7b697614(var_5f56f0a[self.characterindex][var_c62848ef], var_452c2069[self.characterindex][var_c62848ef], 1);
			break;
		}
		case "memento_femme":
		{
			var_c62848ef = RandomInt(var_a289b84d[self.characterindex].size);
			self function_7b697614(var_a289b84d[self.characterindex][var_c62848ef], var_838979be[self.characterindex][var_c62848ef], 1);
			break;
		}
		case "memento_magician":
		{
			var_c62848ef = RandomInt(var_a545e2b6[self.characterindex].size);
			self function_7b697614(var_a545e2b6[self.characterindex][var_c62848ef], var_5af762b1[self.characterindex][var_c62848ef], 1);
			break;
		}
	}
}

/*
	Name: function_2e3f1a98
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7010
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1623
*/
function function_2e3f1a98()
{
	if(zm_utility::is_player_valid(self) && !isdefined(self.var_f5d71a04))
	{
		var_f7937450 = "vox_plr_" + self.characterindex + "_ritual_end_0_0";
		self function_7b697614(var_f7937450);
		function_b2392771("vox_shad_ritual_end_1_0");
		var_f7937450 = "vox_plr_" + self.characterindex + "_ritual_end_2_0";
		self function_7b697614(var_f7937450);
		function_b2392771("vox_shad_ritual_end_3_0");
		self.var_f5d71a04 = 1;
	}
}

/*
	Name: function_53b96c8f
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x70F8
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 1647
*/
function function_53b96c8f()
{
	if(zm_utility::is_player_valid(self))
	{
		if(!isdefined(level.var_dff34a19))
		{
			level.var_2294b9be = Array(0, 1, 2, 3, 4, 5);
			level.var_2294b9be = Array::randomize(level.var_2294b9be);
		}
		if(!isdefined(level.var_f05f7ce3))
		{
			level.var_f05f7ce3 = 0;
		}
		else
		{
			level.var_f05f7ce3++;
		}
		if(!isdefined(self.var_eaf7c404))
		{
			self.var_eaf7c404 = 0;
		}
		else
		{
			self.var_eaf7c404++;
		}
		if(self.var_eaf7c404 < self.var_5a34308d.size)
		{
			var_3dbab226 = "vox_plr_" + self.characterindex + "_pickup_key_" + self.var_5a34308d[self.var_eaf7c404];
			var_597589b9 = Array(var_3dbab226);
		}
		if(level.var_f05f7ce3 < level.var_2294b9be.size)
		{
			var_3dbab226 = "vox_shad_pickup_key_response_" + level.var_2294b9be[level.var_f05f7ce3];
			Array::add(var_597589b9, var_3dbab226);
		}
		function_7aa5324a(var_597589b9, undefined, 1);
	}
}

/*
	Name: function_b18c02d7
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x72B0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1696
*/
function function_b18c02d7()
{
	self endon("_zombie_game_over");
	flag::wait_till("vo_placeworm_hint");
	function_897246e4("vox_shad_place_worms_0", 0, 1);
}

/*
	Name: function_4de46cf5
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7300
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1713
*/
function function_4de46cf5(str_context)
{
	switch(str_context)
	{
		case "pickup":
		{
			self zm_audio::create_and_play_dialog("sprayer", "pickup");
			break;
		}
		case "use":
		{
			self zm_audio::create_and_play_dialog("sprayer", "use");
			break;
		}
	}
}

/*
	Name: function_bcf7d3ea
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7388
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 1740
*/
function function_bcf7d3ea(a_spawners)
{
	var_ec05e7d4 = (0, 0, 0);
	if(isdefined(a_spawners) && a_spawners.size > 0)
	{
		foreach(x in a_spawners)
		{
			var_ec05e7d4 = var_ec05e7d4 + x.origin;
		}
		var_ec05e7d4 = var_ec05e7d4 / a_spawners.size;
	}
	e_closest_player = ArrayGetClosest(var_ec05e7d4, level.activePlayers);
	var_d84d185d = "vox_plr_" + e_closest_player.characterindex + "_keepers_arrive_" + RandomInt(3);
	function_897246e4(var_d84d185d, 1, 1);
}

/*
	Name: function_93f0e7bd
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x74F0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1766
*/
function function_93f0e7bd()
{
	if(level.var_f8b68299.size > 0)
	{
		var_f7937450 = Array::random(level.var_f8b68299);
		ArrayRemoveValue(level.var_f8b68299, var_f7937450);
	}
	function_b2392771(var_f7937450);
}

/*
	Name: function_f9003879
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7568
	Size: 0x2A8
	Parameters: 1
	Flags: None
	Line Number: 1786
*/
function function_f9003879(var_d3be01d9)
{
	self endon("_zombie_game_over");
	self endon(var_d3be01d9 + "_done");
	e_trig = GetEnt(var_d3be01d9, "targetname");
	var_6afd6b = undefined;
	while(!zombie_utility::is_player_valid(var_6afd6b))
	{
		e_trig waittill("trigger", var_6afd6b);
		if(var_6afd6b flag::get("in_beastmode"))
		{
			var_6afd6b = undefined;
		}
		if(level flag::get("ritual_pap_complete"))
		{
			return;
		}
	}
	if(zm_utility::is_player_valid(var_6afd6b))
	{
		switch(var_d3be01d9)
		{
			case "visited_burlesque":
			{
				var_71d49619 = "vox_shad_shadowman_burl_appears_0";
				var_4f5189a8 = "vox_plr_" + var_6afd6b.characterindex + "_shadowman_burl_appears_response_0";
				var_e0884ede = "memento_boxer_found";
				break;
			}
			case "visited_gym":
			{
				var_71d49619 = "vox_shad_shadowman_gym_appears_0";
				var_4f5189a8 = "vox_plr_" + var_6afd6b.characterindex + "_shadowman_gym_appears_response_0";
				var_e0884ede = "memento_detective_found";
				break;
			}
			case "visited_ruby":
			{
				var_71d49619 = "vox_shad_shadowman_ruby_appears_0";
				var_4f5189a8 = "vox_plr_" + var_6afd6b.characterindex + "_shadowman_ruby_appears_response_0";
				var_e0884ede = "memento_femme_found";
				break;
			}
			case "visited_workshop":
			{
				var_71d49619 = "vox_shad_shadowman_workshop_appears_0";
				var_4f5189a8 = "vox_plr_" + var_6afd6b.characterindex + "_shadowman_workshop_appears_response_0";
				var_e0884ede = "memento_magician_found";
				break;
			}
		}
		level function_b2392771(var_71d49619, 0, 1);
		var_6afd6b function_7b697614(var_4f5189a8, 1, 1);
		level thread function_6e30d0bd(var_e0884ede);
		level notify(var_d3be01d9 + "_done");
	}
}

/*
	Name: function_6e30d0bd
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7818
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 1854
*/
function function_6e30d0bd(flag)
{
	level endon("hash_c5a1aed4");
	level endon("hash_7c61dd0");
	if(isdefined(level.var_5eb948f))
	{
		return;
	}
	if(level flag::get(flag) && level flag::get("quest_key_found") && !level flag::get("ritual_pap_complete") && !level flag::get("ritual_in_progress"))
	{
		wait(1);
		if(level flag::get(flag) && level flag::get("quest_key_found") && !level flag::get("ritual_pap_complete") && !level flag::get("ritual_in_progress"))
		{
			level thread function_b2392771("vox_shad_enter_ritualroom_item_0", 1, 1, 99);
			level.var_5eb948f = 1;
		}
	}
}

/*
	Name: function_c41d3e2e
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7988
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1883
*/
function function_c41d3e2e(var_1e0c5b50)
{
	a_str_location = [];
	a_str_location["memento_boxer"] = "gym";
	a_str_location["memento_detective"] = "ruby";
	a_str_location["memento_femme"] = "burlesque";
	a_str_location["memento_magician"] = "workshop";
	if(RandomInt(100) < 60)
	{
		var_5eb0b65c = "vox_plr_" + self.characterindex + "_place_item_" + a_str_location[var_1e0c5b50] + "_0";
		self function_7b697614(var_5eb0b65c, 0, 0);
	}
}

/*
	Name: function_24b80509
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7A88
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1907
*/
function function_24b80509()
{
	var_7cd0d = "vox_plr_" + self.characterindex + "_place_worms_response_" + self.var_aefa986d;
	self function_7b697614(var_7cd0d, 1, 1);
	self.var_aefa986d++;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_658d89a3
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7AF0
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 1926
*/
function function_658d89a3(var_6a363796)
{
	if(!isdefined(level.var_6a0fa91e))
	{
		level.var_6a0fa91e = 1;
		var_71d49619 = "vox_shad_ritual_start_0";
		var_e5924747 = "altar_pos_" + var_6a363796;
		var_9c058564 = GetEnt(var_e5924747, "targetname");
		/#
			/#
				Assert(isdefined(var_e5924747), "Dev Block strings are not supported" + var_e5924747 + "Dev Block strings are not supported");
			#/
		#/
		var_5d92c9b8 = ArrayGetClosest(var_9c058564.origin, level.activePlayers);
		var_5605fb9 = "vox_plr_" + var_5d92c9b8.characterindex + "_ritual_start_response_0";
	}
	else
	{
		var_71d49619 = "vox_shad_ritual_start_response_0";
		var_e5924747 = "altar_pos_" + var_6a363796;
		var_9c058564 = GetEnt(var_e5924747, "targetname");
		/#
			/#
				Assert(isdefined(var_e5924747), "Dev Block strings are not supported" + var_e5924747 + "Dev Block strings are not supported");
			#/
		#/
		var_5d92c9b8 = ArrayGetClosest(var_9c058564.origin, level.activePlayers);
		var_5605fb9 = "vox_plr_" + var_5d92c9b8.characterindex + "_keepers_ritual_response_" + RandomInt(3);
	}
	level function_b2392771(var_71d49619, 0, 1);
	if(isdefined(var_5605fb9))
	{
		var_5d92c9b8 function_7b697614(var_5605fb9, 0.5, 1);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e8972612
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x7D38
	Size: 0x868
	Parameters: 0
	Flags: None
	Line Number: 1974
*/
function function_e8972612()
{
	level.var_fdb003be = [];
	level.var_fdb003be["boxer"] = Array("vox_prom_victim_promoter_0", "vox_prom_victim_promoter_1", "vox_prom_victim_promoter_2", "vox_prom_victim_promoter_3", "vox_prom_victim_promoter_4", "vox_prom_victim_promoter_5");
	level.var_fdb003be["detective"] = Array("vox_part_victim_partner_0", "vox_part_victim_partner_1", "vox_part_victim_partner_2", "vox_part_victim_partner_3", "vox_part_victim_partner_5", "vox_part_victim_partner_6");
	level.var_fdb003be["femme"] = Array("vox_prod_victim_producer_0", "vox_prom_victim_producer_1", "vox_prod_victim_producer_2", "vox_prod_victim_producer_3", "vox_prod_victim_producer_4", "vox_prod_victim_producer_5");
	level.var_fdb003be["magician"] = Array("vox_lawy_victim_lawyer_0", "vox_lawy_victim_lawyer_1", "vox_lawy_victim_lawyer_2", "vox_lawy_victim_lawyer_3", "vox_lawy_victim_lawyer_4", "vox_lawy_victim_lawyer_5");
	level.var_6cef52da = [];
	level.var_6cef52da["boxer"] = Array(3, 4);
	level.var_6cef52da["detective"] = Array(3, 5);
	level.var_6cef52da["femme"] = Array(3, 4);
	level.var_6cef52da["magician"] = Array(3, 4);
	var_d7ca8739 = [];
	var_d7ca8739[0] = 0;
	var_d7ca8739[1] = 1;
	var_d7ca8739[2] = 2;
	var_d7ca8739[3] = 3;
	var_d7ca8739[4] = 4;
	var_d7ca8739 = Array::randomize(var_d7ca8739);
	var_c9c3f423 = [];
	var_c9c3f423[0] = "vox_shad_shadowman_defeat_0_1";
	var_c9c3f423[1] = "vox_shad_shadowman_defeat_2_0";
	var_c9c3f423[2] = "vox_shad_shadowman_defeat_2_1";
	function_2e49446d();
	level function_b2392771("vox_shad_enter_ritualroom_0", 0, 1, 99);
	level flag::wait_till("ritual_pap_complete");
	level flag::set("power_on");
	function_45a44235();
	level function_b2392771("vox_shad_shadowman_taunts_6_0", 0, 1, 99);
	level thread function_7470769c("shadowman_taunts_response_6_0", "ee_book", "end_game");
	level flag::wait_till("totem_placed");
	level function_3c3fbce1(function_99b5a935(0, var_d7ca8739[0]), function_99b5a935(1, var_d7ca8739[0]));
	ArrayRemoveValue(var_d7ca8739, var_d7ca8739[0], 0);
	current_round = zm::get_round_number();
	level thread function_e703e77a();
	function_17b42a98();
	if(isdefined(level.var_1d436a7e) && !level flag::get("ee_boss_started"))
	{
		sound_to_play = "vox_plr_" + level.var_1d436a7e.characterindex + "_archon_appears_0_0";
		level.var_1d436a7e function_7b697614(sound_to_play, 0, 0, 100);
	}
	while(!level flag::get("ee_boss_started"))
	{
		if(current_round != zm::get_round_number())
		{
			current_round = zm::get_round_number();
			level flag::wait_till_any(Array("totem_placed", "ee_boss_started"));
			if(level flag::get("ee_boss_started"))
			{
				break;
			}
			current_round = zm::get_round_number();
			var_d7ca8739 = Array::randomize(var_d7ca8739);
			level function_3c3fbce1(function_99b5a935(0, var_d7ca8739[0]), function_99b5a935(1, var_d7ca8739[0]));
			ArrayRemoveValue(var_d7ca8739, var_d7ca8739[0], 0);
		}
		wait(1);
	}
	level flag::wait_till("ee_boss_vulnerable");
	level thread function_b2392771("vox_shad_shadowman_defeat_0_0", 0, 1, 99);
	level flag::wait_till("ee_boss_defeated");
	playsoundatposition(var_c9c3f423[0], (0, 0, 0));
	thread namespace_cc012897::Send(var_c9c3f423[0]);
	wait(soundgetplaybacktime(var_c9c3f423[0]) / 1000);
	playsoundatposition(var_c9c3f423[1], (0, 0, 0));
	thread namespace_cc012897::Send(var_c9c3f423[1]);
	wait(soundgetplaybacktime(var_c9c3f423[1]) / 1000);
	playsoundatposition(var_c9c3f423[2], (0, 0, 0));
	thread namespace_cc012897::Send(var_c9c3f423[2]);
	wait(soundgetplaybacktime(var_c9c3f423[2]) / 1000);
	wait(2);
	if(math::cointoss())
	{
		level thread function_7470769c("shadowman_defeat_1_0", "ee_boss_defeated", "end_game");
	}
	else
	{
		level thread function_7470769c("shadowman_defeat_3_0", "end_game", "end_game");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e703e77a
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x85A8
	Size: 0xB0
	Parameters: 0
	Flags: Private
	Line Number: 2067
*/
function private function_e703e77a()
{
	level endon("hash_604f913b");
	for(;;)
	{
		wait(0.05);
		foreach(player in level.activePlayers)
		{
			if(isdefined(player.var_11104075))
			{
				level.var_1d436a7e = player;
			}
		}
	}
}

/*
	Name: function_17b42a98
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8660
	Size: 0xF8
	Parameters: 0
	Flags: Private
	Line Number: 2093
*/
function private function_17b42a98()
{
	level endon("hash_604f913b");
	var_9eb45ed3 = Array("boxer", "detective", "femme", "magician");
	for(;;)
	{
		wait(0.05);
		foreach(var_d7e2a718 in var_9eb45ed3)
		{
			if(level flag::get("ee_keeper_" + var_d7e2a718 + "_resurrected"))
			{
				return;
			}
		}
	}
}

/*
	Name: function_45a44235
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8760
	Size: 0x70
	Parameters: 0
	Flags: Private
	Line Number: 2120
*/
function private function_45a44235()
{
	level endon("hash_cc361fa0");
	var_f6cae73 = randomIntRange(2, 5);
	for(i = 0; i < var_f6cae73; i++)
	{
		level waittill("end_of_round");
	}
}

/*
	Name: function_2e49446d
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x87D8
	Size: 0xF8
	Parameters: 0
	Flags: Private
	Line Number: 2140
*/
function private function_2e49446d()
{
	var_609504f9 = [];
	var_609504f9[var_609504f9.size] = "memento_boxer_found";
	var_609504f9[var_609504f9.size] = "memento_detective_found";
	var_609504f9[var_609504f9.size] = "memento_femme_found";
	var_609504f9[var_609504f9.size] = "memento_magician_found";
	for(;;)
	{
		foreach(var_f548a646 in var_609504f9)
		{
			if(level flag::get(var_f548a646))
			{
				return;
			}
		}
		wait(2);
	}
}

/*
	Name: function_99b5a935
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x88D8
	Size: 0xC8
	Parameters: 2
	Flags: Private
	Line Number: 2170
*/
function private function_99b5a935(is_player, num)
{
	if(!isdefined(is_player))
	{
		is_player = 0;
	}
	if(!isdefined(num))
	{
		num = 1;
	}
	if(is_player)
	{
		if(num < 4)
		{
			return "shadowman_taunt_response_" + num + "_0";
		}
		else
		{
			return "shadowman_taunts_response_" + num + "_0";
		}
	}
	else if(num < 4)
	{
		return "vox_shad_shadowman_taunt_" + num + "_0";
	}
	else
	{
		return "vox_shad_shadowman_taunts_" + num + "_0";
		return;
	}
}

/*
	Name: function_a15b7ea1
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x89A8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 2212
*/
function function_a15b7ea1()
{
	var_9eb45ed3 = Array("boxer", "detective", "femme", "magician");
	foreach(sword in var_9eb45ed3)
	{
		if(level flag::get("ee_keeper_" + sword + "_armed"))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_2cd4514a
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8A98
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 2235
*/
function function_2cd4514a()
{
	players = [];
	for(i = 0; i < 4; i++)
	{
		var_6ecdf7bd = struct::get("ee_keeper_8_" + i, "targetname");
		players[players.size] = ArrayGetClosest(var_6ecdf7bd.origin, level.activePlayers);
	}
	player = undefined;
	for(i = 0; i < players.size; i++)
	{
		if(!isdefined(player))
		{
			player = players[i];
			continue;
		}
		if(player == players[i])
		{
			return player;
		}
	}
}

/*
	Name: function_3c3fbce1
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8BB0
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 2268
*/
function function_3c3fbce1(var_d7ca8739, player_vox)
{
	level function_b2392771(var_d7ca8739, 1, 0, 99);
	level thread function_7470769c(player_vox, "totem_placed", "ee_boss_started");
}

/*
	Name: function_335f3a81
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8C18
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 2284
*/
function function_335f3a81(var_13a31044, var_8df092ed)
{
	if(!isdefined(var_13a31044))
	{
		var_13a31044 = 0;
	}
	if(!isdefined(var_8df092ed))
	{
		var_8df092ed = 0;
	}
	if(isdefined(level.var_9bc9c61f) && var_13a31044 < level.var_fdb003be[level.var_9bc9c61f].size)
	{
		var_c404914c = "altar_pos_" + level.var_9bc9c61f;
		level.var_d344b932 = GetEnt(var_c404914c, "targetname");
		switch(var_13a31044)
		{
			case 0:
			{
				str_vo_line = level.var_fdb003be[level.var_9bc9c61f][0];
				break;
			}
			case 3:
			{
				var_5557a55d = level.var_fdb003be[level.var_9bc9c61f].size - 1;
				str_vo_line = level.var_fdb003be[level.var_9bc9c61f][var_5557a55d];
				break;
			}
			default
			{
				if(var_8df092ed)
				{
					var_13a31044 = var_13a31044 + 2;
				}
				str_vo_line = level.var_fdb003be[level.var_9bc9c61f][var_13a31044];
				break;
			}
		}
		level.var_d344b932 thread function_7b697614(str_vo_line, 0, 1, 0, 1);
		return 1;
	}
	return 0;
}

/*
	Name: function_17f92643
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8DC8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2337
*/
function function_17f92643()
{
	function_7a64d508();
}

/*
	Name: function_7a64d508
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x8DE8
	Size: 0x3C8
	Parameters: 0
	Flags: None
	Line Number: 2352
*/
function function_7a64d508()
{
	switch(level.var_8280ab5f)
	{
		case "boxer":
		{
			var_76541c53 = 0;
			break;
		}
		case "detective":
		{
			var_76541c53 = 1;
			break;
		}
		case "femme":
		{
			var_76541c53 = 2;
			break;
		}
		case "magician":
		{
			var_76541c53 = 3;
			break;
		}
	}
	var_f3aa6934 = [];
	foreach(plr in level.activePlayers)
	{
		Array::add(var_f3aa6934, plr.characterindex);
	}
	var_3352e74 = 0;
	foreach(n_index in var_f3aa6934)
	{
		if(n_index == var_76541c53)
		{
			var_3352e74 = 1;
			break;
		}
	}
	if(isdefined(var_3352e74) && var_3352e74)
	{
		a_str_confessor = [];
		a_str_confessor[0] = "floyd";
		a_str_confessor[1] = "jack";
		a_str_confessor[2] = "rose";
		a_str_confessor[3] = "nero";
		var_f42a2187 = RandomInt(3) + 1;
		var_5a4782f7 = "vox_plr_" + var_76541c53 + "_confession_" + a_str_confessor[var_76541c53] + "_" + var_f42a2187 + "_0";
		var_90788992 = Array(var_5a4782f7);
		var_678774f0 = Array(0);
		if(var_f3aa6934.size > 1)
		{
			do
			{
				var_2789c6f = Array::random(var_f3aa6934);
			}
			while(!var_2789c6f == var_76541c53);
			var_e84013bc = "vox_plr_" + var_2789c6f + "_confession_" + a_str_confessor[var_76541c53] + "_response_" + var_f42a2187 + "_0";
			Array::add(var_90788992, var_e84013bc);
			Array::add(var_678774f0, 0.5);
		}
		function_7aa5324a(var_90788992, var_678774f0, 1, 0, 1);
	}
}

/*
	Name: function_edca6dc9
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x91B8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 2427
*/
function function_edca6dc9()
{
	wait(2);
	var_daf99a63 = Array("vox_shad_ritual_complete_0");
	e_responder = Array::random(level.activePlayers);
	var_49617378 = "vox_plr_" + e_responder.characterindex + "_ritual_complete_response_0";
	var_6f63ede1 = "vox_plr_" + e_responder.characterindex + "_ritual_complete_response_1";
	Array::add(var_daf99a63, var_49617378);
	Array::add(var_daf99a63, var_6f63ede1);
	function_7aa5324a(var_daf99a63, undefined, 0);
	var_7a05a0de = GetEnt("quest_key_pickup", "targetname");
	var_7a05a0de Hide();
	var_7a05a0de clientfield::set("shadowman_fx", 2);
	level notify("hash_8503ab8c");
}

/*
	Name: function_b19fc986
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9330
	Size: 0x140
	Parameters: 3
	Flags: None
	Line Number: 2453
*/
function function_b19fc986(var_93447b81, n_delay, b_wait_if_busy)
{
	if(!isdefined(var_93447b81))
	{
		var_93447b81 = "positive";
	}
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(var_93447b81 == "positive")
	{
		str_suffix = "_generic_responses_positive_";
		n_vo_index = function_5803cf05(3, self.var_4d38f64b);
		self.var_4d38f64b = n_vo_index;
	}
	else
	{
		str_suffix = "_generic_responses_negative_";
		n_vo_index = function_5803cf05(3, self.var_f7882113);
		self.var_b06d973b = n_vo_index;
	}
	var_c2e1519d = "vox_plr_" + self.characterindex + str_suffix + n_vo_index;
	self function_7b697614(var_c2e1519d, n_delay, b_wait_if_busy);
}

/*
	Name: function_d33751d
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9478
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 2493
*/
function function_d33751d(n_delay, b_wait_if_busy)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	str_suffix = "_pickup_generic_";
	n_vo_index = function_5803cf05(3, self.var_bd5e7320);
	self.var_bd5e7320 = n_vo_index;
	var_b0415d5f = "vox_plr_" + self.characterindex + str_suffix + n_vo_index;
	self function_7b697614(var_b0415d5f, n_delay, b_wait_if_busy);
}

/*
	Name: function_2cc571f6
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9550
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 2520
*/
function function_2cc571f6()
{
	self endon("_zombie_game_over");
	while(1)
	{
		level waittill("hash_c484afcb");
		if(isdefined(level.var_95981590))
		{
			var_d708b800 = undefined;
			while(!zombie_utility::is_player_valid(var_d708b800))
			{
				wait(0.5);
				foreach(plr in level.activePlayers)
				{
					if(!plr flag::get("in_beastmode") && plr function_2d942575(level.var_95981590, 660) && zm_utility::is_player_valid(plr))
					{
						var_d708b800 = plr;
					}
				}
			}
			if(!isdefined(var_d708b800.var_a57f7e6c))
			{
				var_4443c4b2 = "vox_plr_" + var_d708b800.characterindex + "_margwar_spotted_1st_0";
				var_d708b800.var_a57f7e6c = RandomInt(3);
			}
			else
			{
				var_a8056961 = function_5803cf05(3, var_d708b800.var_a57f7e6c);
				var_d708b800.var_a57f7e6c = var_a8056961;
				var_4443c4b2 = "vox_plr_" + var_d708b800.characterindex + "_margwar_spotted_again_" + var_a8056961;
			}
			var_d708b800 function_502f946b();
			if(!(isdefined(var_d708b800.isSpeaking) && var_d708b800.isSpeaking) && (!(isdefined(level.sndVoxOverride) && level.sndVoxOverride)))
			{
				var_d708b800 function_7b697614(var_4443c4b2, 0, 1);
			}
			level notify("hash_aaa21b88");
		}
		wait(10);
	}
}

/*
	Name: function_f8939df5
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x97F0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 2572
*/
function function_f8939df5()
{
	self endon("_zombie_game_over");
	f_wait = RandomFloatRange(15, 20);
	while(1)
	{
		level waittill("hash_aaa21b88");
		while(level.var_6e63e659 > 0)
		{
			wait(f_wait);
			e_player = function_43b03c7f(5000);
			if(zm_utility::is_player_valid(e_player))
			{
				e_player zm_audio::create_and_play_dialog("margwa", "fight");
				f_wait = RandomFloatRange(15, 20);
			}
			else
			{
				f_wait = 1;
			}
		}
	}
}

/*
	Name: function_43b03c7f
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x98E8
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 2606
*/
function function_43b03c7f(var_f30428a8)
{
	self endon("_zombie_game_over");
	var_d8dc8b3c = 0;
	var_e1b29e02 = undefined;
	while(!var_d8dc8b3c)
	{
		var_60852196 = getaiarchetypearray("margwa");
		var_9f338373 = [];
		a_e_players = GetPlayers();
		i = 0;
		foreach(var_4ef2ab6 in var_60852196)
		{
			var_9f338373[i] = ArraySortClosest(a_e_players, var_4ef2ab6.origin, a_e_players.size, 0, var_f30428a8);
			i++;
		}
		if(var_9f338373.size == 1)
		{
			var_e1b29e02 = Array::random(var_9f338373[0]);
		}
		if(var_9f338373.size > 1)
		{
			var_12e29d53 = [];
			for(i = 0; i < var_9f338373.size; i++)
			{
				ArrayCombine(var_12e29d53, var_9f338373[i], 0, 0);
			}
			var_e1b29e02 = Array::random(var_12e29d53);
		}
		if(var_9f338373.size > 0)
		{
			foreach(var_4ef2ab6 in var_60852196)
			{
				if(isdefined(var_e1b29e02) && var_e1b29e02 function_2d942575(var_4ef2ab6, var_f30428a8) && !var_e1b29e02 flag::get("in_beastmode"))
				{
					var_d8dc8b3c = 1;
					break;
				}
			}
		}
		wait(0.1);
	}
	return var_e1b29e02;
}

/*
	Name: function_7e398d3
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9BC8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 2661
*/
function function_7e398d3()
{
	self endon("_zombie_game_over");
	self endon("disconnect");
	self endon("death");
	self zm_audio::create_and_play_dialog("margwa", "headshot");
}

/*
	Name: function_c11b8117
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9C20
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2679
*/
function function_c11b8117(var_e02e9917)
{
	self endon("_zombie_game_over");
	e_closest_player = ArrayGetClosest(var_e02e9917, level.activePlayers);
	if(zm_utility::is_player_valid(e_closest_player))
	{
		var_887dbc1f = function_5803cf05(3, e_closest_player.var_3cf58348);
		e_closest_player.var_3cf58348 = var_887dbc1f;
		var_9dfd6beb = "vox_plr_" + e_closest_player.characterindex + "_margwar_dead_" + var_887dbc1f;
		e_closest_player function_7b697614(var_9dfd6beb, 0.5, 1);
	}
}

/*
	Name: function_9bd30516
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9D20
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2702
*/
function function_9bd30516()
{
	self endon("_zombie_game_over");
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(!isdefined(self.var_74a00938))
	{
		str_vo = "vox_plr_" + self.characterindex + "_pickup_egg_" + RandomInt(3);
		self.var_74a00938 = 0;
	}
	else
	{
		str_vo = "vox_plr_" + self.characterindex + "_pickup_egg_charged_" + self.var_74a00938;
		self.var_74a00938++;
	}
	self function_7b697614(str_vo, 0, 1);
}

/*
	Name: function_c10cc6c5
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9E00
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 2731
*/
function function_c10cc6c5()
{
	self endon("_zombie_game_over");
	self endon("death");
	self endon("disconnect");
	self endon("death");
	if(!isdefined(self.var_d094704f))
	{
		self.var_d094704f = 0;
	}
	if(self.var_d094704f < 3)
	{
		str_vo = "vox_plr_" + self.characterindex + "_place_egg_" + self.var_d094704f;
		self.var_d094704f++;
	}
	else
	{
		str_vo = "vox_plr_" + self.characterindex + "_place_egg_sword_" + RandomInt(3);
	}
	self function_7b697614(str_vo, 0, 1);
	return;
}

/*
	Name: function_da45447a
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9EF8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2764
*/
function function_da45447a()
{
	self endon("_zombie_game_over");
	self endon("disconnect");
	self endon("death");
	var_86757168 = function_5803cf05(3, self.var_8faf79c9);
	self.var_8faf79c9 = var_86757168;
	str_vo = "vox_plr_" + self.characterindex + "_charge_egg_" + var_86757168;
	self function_7b697614(str_vo);
}

/*
	Name: function_a543408d
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0x9FA8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2785
*/
function function_a543408d()
{
	self endon("_zombie_game_over");
	self endon("disconnect");
	self endon("death");
	var_6c37d9ef = function_5803cf05(3, self.var_106675e6);
	self.var_106675e6 = var_6c37d9ef;
	str_vo = "vox_plr_" + self.characterindex + "_take_sword_" + var_6c37d9ef;
	self function_7b697614(str_vo);
}

/*
	Name: function_81ba60e2
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0xA058
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2806
*/
function function_81ba60e2()
{
	var_b00cc93b = "vox_plr_" + self.characterindex + "_power_on_" + RandomInt(2);
	self function_7b697614(var_b00cc93b);
}

/*
	Name: function_5803cf05
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0xA0C0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 2822
*/
function function_5803cf05(n_max, var_6e653641)
{
	/#
		/#
			Assert(!isdefined(var_6e653641) || var_6e653641 < n_max, "Dev Block strings are not supported");
		#/
	#/
	do
	{
		var_ee3cd374 = RandomInt(n_max);
	}
	while(!var_ee3cd374 === var_6e653641);
	return var_ee3cd374;
}

/*
	Name: function_82091017
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0xA150
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 2847
*/
function function_82091017(str_name, a_str_vo)
{
	level zm_audio::sndConversation_Init(str_name);
	for(i = 0; i < a_str_vo.size; i++)
	{
		level zm_audio::sndConversation_AddLine(str_name, a_str_vo[i], self.characterindex);
	}
	level zm_audio::sndConversation_Play(str_name);
	return;
	ERROR: Bad function call
}

/*
	Name: function_33bc3cb3
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0xA1F0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2869
*/
function function_33bc3cb3()
{
	zm_audio::create_and_play_dialog("general", "outofmoney_gate");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ffa05390
	Namespace: namespace_b8707f8e
	Checksum: 0x424F4353
	Offset: 0xA220
	Size: 0x44
	Parameters: 0
	Flags: None
	Line Number: 2886
*/
function function_ffa05390()
{
	if(!isdefined(self.var_7e6819c4))
	{
		self.var_7e6819c4 = 1;
		self zm_audio::create_and_play_dialog("box", "first_use");
	}
}

