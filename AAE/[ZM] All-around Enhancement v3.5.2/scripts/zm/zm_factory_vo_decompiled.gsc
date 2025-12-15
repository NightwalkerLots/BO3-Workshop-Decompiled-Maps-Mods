#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_utility;

#namespace namespace_4787588d;

/*
	Name: __init__sytem__
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0xB38
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_factory_vo", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0xB80
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	return;
}

/*
	Name: __main__
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0xB90
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	level thread function_7884e6b8();
	if(level.script == "zm_factory")
	{
		level thread function_eeb2c07();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_eeb2c07
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_eeb2c07()
{
	level flag::wait_till("teleporter_pad_link_3");
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_GIANT_PERK_EE_TITLE&AAE_TIP_GIANT_PERK_EE_CONTENT&-178&313&154");
	level flag::wait_till("snow_ee_completed");
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_GIANT_PERK_EE_TITLE");
}

/*
	Name: function_7884e6b8
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0xC70
	Size: 0xC08
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_7884e6b8()
{
	self endon("_zombie_game_over");
	level.a_e_speakers = [];
	var_f01f6eb2 = [];
	Array::add(var_f01f6eb2, Array("vox_plr_3_interaction_takeo_rich_1_0", "vox_plr_2_interaction_takeo_rich_1_0"));
	Array::add(var_f01f6eb2, Array("vox_plr_3_interaction_takeo_rich_2_0", "vox_plr_2_interaction_takeo_rich_2_0"));
	Array::add(var_f01f6eb2, Array("vox_plr_3_interaction_takeo_rich_3_0", "vox_plr_2_interaction_takeo_rich_3_0"));
	Array::add(var_f01f6eb2, Array("vox_plr_3_interaction_takeo_rich_4_0", "vox_plr_2_interaction_takeo_rich_4_0"));
	Array::add(var_f01f6eb2, Array("vox_plr_3_interaction_takeo_rich_5_0", "vox_plr_2_interaction_takeo_rich_5_0"));
	var_e140097c = 0;
	var_5fda2472 = [];
	Array::add(var_5fda2472, Array("vox_plr_0_interaction_takeo_demp_1_0", "vox_plr_3_interaction_takeo_demp_1_0"));
	Array::add(var_5fda2472, Array("vox_plr_0_interaction_takeo_demp_2_0", "vox_plr_3_interaction_takeo_demp_2_0"));
	Array::add(var_5fda2472, Array("vox_plr_0_interaction_takeo_demp_3_0", "vox_plr_3_interaction_takeo_demp_3_0"));
	Array::add(var_5fda2472, Array("vox_plr_0_interaction_takeo_demp_4_0", "vox_plr_3_interaction_takeo_demp_4_0"));
	Array::add(var_5fda2472, Array("vox_plr_0_interaction_takeo_demp_5_0", "vox_plr_3_interaction_takeo_demp_5_0"));
	var_b7adf76 = 0;
	var_aeae7aa1 = [];
	Array::add(var_aeae7aa1, Array("vox_plr_3_interaction_niko_takeo_1_0", "vox_plr_1_interaction_niko_takeo_1_0"));
	Array::add(var_aeae7aa1, Array("vox_plr_3_interaction_niko_takeo_2_0", "vox_plr_1_interaction_niko_takeo_2_0"));
	Array::add(var_aeae7aa1, Array("vox_plr_1_interaction_niko_takeo_3_0", "vox_plr_3_interaction_niko_takeo_3_0"));
	Array::add(var_aeae7aa1, Array("vox_plr_3_interaction_niko_takeo_4_0", "vox_plr_1_interaction_niko_takeo_4_0"));
	Array::add(var_aeae7aa1, Array("vox_plr_3_interaction_niko_takeo_5_0", "vox_plr_1_interaction_niko_takeo_5_0"));
	var_e60d01d = 0;
	var_db90c17b = [];
	Array::add(var_db90c17b, Array("vox_plr_0_interaction_demp_rich_1_0", "vox_plr_2_interaction_demp_rich_1_0"));
	Array::add(var_db90c17b, Array("vox_plr_0_interaction_demp_rich_2_0", "vox_plr_2_interaction_demp_rich_2_0"));
	Array::add(var_db90c17b, Array("vox_plr_0_interaction_demp_rich_3_0", "vox_plr_2_interaction_demp_rich_3_0"));
	Array::add(var_db90c17b, Array("vox_plr_0_interaction_demp_rich_4_0", "vox_plr_2_interaction_demp_rich_4_0"));
	Array::add(var_db90c17b, Array("vox_plr_0_interaction_demp_rich_5_0", "vox_plr_2_interaction_demp_rich_5_0"));
	var_93378973 = 0;
	var_e341729a = [];
	Array::add(var_e341729a, Array("vox_plr_1_interaction_niko_rich_1_0", "vox_plr_2_interaction_niko_rich_1_0"));
	Array::add(var_e341729a, Array("vox_plr_1_interaction_niko_rich_2_0", "vox_plr_2_interaction_niko_rich_2_0"));
	Array::add(var_e341729a, Array("vox_plr_1_interaction_niko_rich_3_0", "vox_plr_2_interaction_niko_rich_3_0"));
	Array::add(var_e341729a, Array("vox_plr_1_interaction_niko_rich_4_0", "vox_plr_2_interaction_niko_rich_4_0"));
	Array::add(var_e341729a, Array("vox_plr_2_interaction_niko_rich_5_0", "vox_plr_1_interaction_niko_rich_5_0"));
	var_94078d12 = 0;
	var_4c7aad4a = [];
	Array::add(var_4c7aad4a, Array("vox_plr_0_interaction_niko_demp_1_0", "vox_plr_1_interaction_niko_demp_1_0"));
	Array::add(var_4c7aad4a, Array("vox_plr_1_interaction_niko_demp_2_0", "vox_plr_0_interaction_niko_demp_2_0"));
	Array::add(var_4c7aad4a, Array("vox_plr_1_interaction_niko_demp_3_0", "vox_plr_0_interaction_niko_demp_3_0"));
	Array::add(var_4c7aad4a, Array("vox_plr_1_interaction_niko_demp_4_0", "vox_plr_0_interaction_niko_demp_4_0"));
	Array::add(var_4c7aad4a, Array("vox_plr_1_interaction_niko_demp_5_0", "vox_plr_0_interaction_niko_demp_5_0"));
	var_22f40782 = 0;
	level waittill("all_players_spawned");
	zm_audio::zmbVoxAdd("box_pickup", "hero_annihilator", "anni_get", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "hero_annihilator", "anni_get", 100, 0);
	level.zombie_weapons[GetWeapon("hero_annihilator")].vox = "hero_annihilator";
	wait(1);
	while(1)
	{
		if(level.round_number > 4)
		{
			level waittill("end_of_round");
			if(level.activePlayers.size > 1 && !level flag::get("flytrap"))
			{
				n_player_index = RandomInt(level.activePlayers.size);
				var_e8669 = level.activePlayers[n_player_index];
				var_a68de872 = Array::remove_index(level.activePlayers, n_player_index);
				var_261100d2 = ArrayGetClosest(var_e8669.origin, var_a68de872);
				if(zm_utility::is_player_valid(var_e8669) && zm_utility::is_player_valid(var_261100d2) && Distance(var_e8669.origin, var_261100d2.origin) <= 900)
				{
					var_3b5e4c24 = undefined;
					if(var_e8669.characterindex == 3 && var_261100d2.characterindex == 2 || (var_261100d2.characterindex == 3 && var_e8669.characterindex == 2))
					{
						if(var_e140097c < var_f01f6eb2.size)
						{
							function_c23e3a71(var_f01f6eb2, var_e140097c, 1);
							var_e140097c++;
						}
					}
					else if(var_e8669.characterindex == 3 && var_261100d2.characterindex == 0 || (var_261100d2.characterindex == 3 && var_e8669.characterindex == 0))
					{
						if(var_b7adf76 < var_5fda2472.size)
						{
							function_c23e3a71(var_5fda2472, var_b7adf76, 1);
							var_b7adf76++;
						}
					}
					else if(var_e8669.characterindex == 3 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 3 && var_e8669.characterindex == 1))
					{
						if(var_e60d01d < var_aeae7aa1.size)
						{
							function_c23e3a71(var_aeae7aa1, var_e60d01d, 1);
							var_e60d01d++;
						}
					}
					else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 0 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 0))
					{
						if(var_93378973 < var_db90c17b.size)
						{
							function_c23e3a71(var_db90c17b, var_93378973, 1);
							var_93378973++;
						}
					}
					else if(var_e8669.characterindex == 2 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 2 && var_e8669.characterindex == 1))
					{
						if(var_94078d12 < var_e341729a.size)
						{
							function_c23e3a71(var_e341729a, var_94078d12, 1);
							var_94078d12++;
						}
					}
					else if(var_e8669.characterindex == 0 && var_261100d2.characterindex == 1 || (var_261100d2.characterindex == 0 && var_e8669.characterindex == 1))
					{
						if(var_22f40782 < var_4c7aad4a.size)
						{
							function_c23e3a71(var_4c7aad4a, var_22f40782, 1);
							var_22f40782++;
						}
					}
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_c23e3a71
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0x1880
	Size: 0xF8
	Parameters: 5
	Flags: None
	Line Number: 221
*/
function function_c23e3a71(var_49fefccd, n_index, b_wait_if_busy, var_7e649f23, var_d1295208)
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
	function_7aa5324a(var_3b5e4c24, b_wait_if_busy, var_7e649f23, var_d1295208);
}

/*
	Name: function_7aa5324a
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0x1980
	Size: 0x110
	Parameters: 4
	Flags: None
	Line Number: 259
*/
function function_7aa5324a(a_str_vo, b_wait_if_busy, var_a8564a44, var_d1295208)
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
		if(i == 0)
		{
			var_e27770b1 = 0;
		}
		else
		{
			var_e27770b1 = 0.5;
		}
		function_897246e4(a_str_vo[i], var_e27770b1, b_wait_if_busy, var_a8564a44, var_d1295208);
	}
	function_218256bd(0);
}

/*
	Name: function_218256bd
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0x1A98
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 299
*/
function function_218256bd(var_eca8128e)
{
	foreach(player in level.activePlayers)
	{
		if(isdefined(player))
		{
			player.dontspeak = var_eca8128e;
			player clientfield::set_to_player("isspeaking", var_eca8128e);
		}
	}
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
}

/*
	Name: function_897246e4
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0x1C10
	Size: 0x180
	Parameters: 5
	Flags: None
	Line Number: 331
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
	else
	{
		e_speaker = undefined;
		/#
			/#
				Assert(0, "Dev Block strings are not supported" + var_96896ff5 + "Dev Block strings are not supported");
			#/
		#/
	}
	if(zm_utility::is_player_valid(e_speaker))
	{
		e_speaker function_7b697614(var_96896ff5, n_wait, b_wait_if_busy, var_a8564a44);
	}
}

/*
	Name: function_7b697614
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x358
	Parameters: 5
	Flags: None
	Line Number: 380
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
	if(!isdefined(var_d1295208))
	{
		var_d1295208 = 0;
	}
	self endon("death");
	self endon("disconnect");
	if(!self flag::exists("in_beastmode") || !self flag::get("in_beastmode"))
	{
		if(zm_audio::areNearbySpeakersActive(10000) && (!(isdefined(var_d1295208) && var_d1295208)))
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
		if(IsActor(self) || isPlayer(self))
		{
			self playsoundwithnotify(var_96896ff5, var_2df3d133, "J_head");
		}
		else
		{
			self playsoundwithnotify(var_96896ff5, var_2df3d133);
		}
		var_53a95046 = soundgetplaybacktime(var_96896ff5);
		thread namespace_cc012897::Send(var_96896ff5, "all", var_53a95046);
		self waittill(var_2df3d133);
		self function_8995134a();
	}
}

/*
	Name: function_8995134a
	Namespace: namespace_4787588d
	Checksum: 0x424F4353
	Offset: 0x20F8
	Size: 0xF4
	Parameters: 0
	Flags: None
	Line Number: 466
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
	}
}

