#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;

#namespace namespace_8d90a844;

/*
	Name: __init__sytem__
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x3F8
	Size: 0x48
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	if(function_5e7a117f())
	{
		system::register("aae_perk_divetonuke", &__init__, undefined, undefined);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5e7a117f
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x448
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function function_5e7a117f()
{
	switch(GetDvarString("mapname"))
	{
		case "zm_zod":
		{
			return 1;
			break;
		}
		case "zm_factory":
		{
			return 1;
			break;
		}
		case "zm_castle":
		{
			return 1;
			break;
		}
		case "zm_island":
		{
			return 1;
			break;
		}
		case "zm_stalingrad":
		{
			return 1;
			break;
		}
		case "zm_genesis":
		{
			return 1;
			break;
		}
		case "zm_theater":
		{
			return 1;
			break;
		}
		case "zm_prototype":
		{
			return 1;
			break;
		}
		case "zm_asylum":
		{
			return 1;
			break;
		}
		case "zm_sumpf":
		{
			return 1;
			break;
		}
		case "zm_moon":
		{
			return 1;
			break;
		}
		case "zm_temple":
		{
			return 1;
			break;
		}
		case "zm_cosmodrome":
		{
			return 1;
			break;
		}
		case "zm_tomb":
		{
			return 1;
			break;
		}
		case "zm_prison":
		{
			return 1;
			break;
		}
		case "zm_k7":
		{
			return 1;
			break;
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x5A0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 141
*/
function __init__()
{
	enable_divetonuke_perk_for_level();
	level.var_508fe397 = 1;
	level.w_bgb_slaughter_slide = GetWeapon("frag_grenade_slaughter_slide");
	level.var_18c6a1c5 = GetWeapon("launcher_standard_upgraded");
	level.var_38a07441 = GetWeapon("pistol_standard_upgraded");
	return;
}

/*
	Name: enable_divetonuke_perk_for_level
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x630
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 161
*/
function enable_divetonuke_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_flakjacket", "divetonuke", 7000, &"ZOMBIE_PERK_DIVETONUKE", GetWeapon("zombie_perk_bottle_doubletap"));
	zm_perks::register_perk_precache_func("specialty_flakjacket", &divetonuke_precache);
	zm_perks::register_perk_clientfields("specialty_flakjacket", &divetonuke_register_clientfield, &divetonuke_set_clientfield);
	zm_perks::register_perk_machine("specialty_flakjacket", &divetonuke_perk_machine_setup);
	zm_perks::register_perk_host_migration_params("specialty_flakjacket", "vending_divetonuke", "divetonuke_light");
	zm_perks::register_perk_threads("specialty_flakjacket", &function_e93a2eb3, &function_65e4a45a);
}

/*
	Name: divetonuke_precache
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x768
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 181
*/
function divetonuke_precache()
{
	if(isdefined(level.divetonuke_precache_override_func))
	{
		[[level.divetonuke_precache_override_func]]();
		return;
	}
	level._effect["divetonuke_light"] = "zombie/fx_perk_doubletap2_zmb";
	level.machine_assets["divetonuke"] = spawnstruct();
	level.machine_assets["divetonuke"].weapon = GetWeapon("zombie_perk_bottle_doubletap");
	level.machine_assets["divetonuke"].off_model = "p7_zm_vending_nuke";
	level.machine_assets["divetonuke"].on_model = "p7_zm_vending_nuke";
	level thread function_7b7027d6();
}

/*
	Name: divetonuke_register_clientfield
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x868
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function divetonuke_register_clientfield()
{
	clientfield::register("clientuimodel", "hudItems.perks.dive_to_nuke", 1, 2, "int");
}

/*
	Name: divetonuke_set_clientfield
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x8A8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 221
*/
function divetonuke_set_clientfield(state)
{
	self clientfield::set_player_uimodel("hudItems.perks.dive_to_nuke", state);
}

/*
	Name: divetonuke_perk_machine_setup
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x8E0
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 236
*/
function divetonuke_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_phd_jingle";
	use_trigger.script_string = "divetonuke_perk";
	use_trigger.script_label = "mus_perks_phd_sting";
	use_trigger.target = "vending_divetonuke";
	perk_machine.script_string = "divetonuke_perk";
	perk_machine.targetname = "vending_divetonuke";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "divetonuke_perk";
	}
}

/*
	Name: function_7b7027d6
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x9A8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function function_7b7027d6()
{
	level endon("end_game");
	level thread function_5d84743b();
	return;
}

/*
	Name: function_ad04b29f
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x9D8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 277
*/
function function_ad04b29f()
{
	playsoundatposition("mus_phd_aae", (0, 0, 0));
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(!level.activePlayers[i] hasPerk("specialty_flakjacket"))
		{
			level.activePlayers[i] zm_perks::give_perk("specialty_flakjacket");
		}
	}
}

/*
	Name: function_5d84743b
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 299
*/
function function_5d84743b()
{
	level endon("end_game");
	var_76332716 = undefined;
	if(level.script == "zm_moon")
	{
		level waittill("between_round_over");
	}
	for(;;)
	{
		level waittill("between_round_over");
		if(zm::get_round_number() < 4)
		{
			result = function_e4dadf7();
			if(result)
			{
				var_76332716 = 1;
				continue;
				return;
			}
			else
			{
			}
		}
		else if(isdefined(var_76332716))
		{
			playsoundatposition("zmb_object_final_success", (0, 0, 0));
			continue;
			return;
		}
		else
		{
		}
	}
	for(;;)
	{
		level waittill("end_of_round");
		for(i = 0; i < level.activePlayers.size; i++)
		{
			if(level.activePlayers[i].pers["grenade_kills"] >= 115)
			{
				level.var_508fe397 = 0;
				level thread function_ad04b29f();
				return;
			}
		}
	}
}

/*
	Name: function_e4dadf7
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0xBE8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function function_e4dadf7()
{
	for(i = 0; i < level.activePlayers.size; i++)
	{
		if(isdefined(level.activePlayers[i].rebuild_barrier_reward))
		{
			round_number = level.round_number - 1;
			if(round_number < 1)
			{
				round_number = 1;
			}
			maxreward = 50 * round_number;
			if(maxreward > 500)
			{
				maxreward = 500;
			}
			if(level.activePlayers[i].rebuild_barrier_reward >= maxreward)
			{
				return 1;
			}
		}
	}
	return 0;
	ERROR: Bad function call
}

/*
	Name: function_16f690f
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0xCD0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 394
*/
function function_16f690f()
{
	if(self GamepadUsedLast())
	{
		return self WeaponSwitchButtonPressed();
	}
	return self useButtonPressed();
}

/*
	Name: function_e93a2eb3
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0xD28
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 413
*/
function function_e93a2eb3()
{
	self endon("death");
	self endon("disconnect");
	self endon("bled_out");
	self endon("hash_cefe86d9");
	self thread function_d70f5e81();
	while(level.var_508fe397)
	{
		wait(0.05);
	}
	var_b2128177 = 0;
	self.var_76b4d478 = 0;
	var_6ecbaf85 = 0;
	self thread function_577aeaed();
	for(;;)
	{
		self waittill("hash_80cb64f2");
		if(self function_16f690f() && self.var_76b4d478 > 1)
		{
			var_6ecbaf85++;
			self thread function_5eb58289();
			while(self.var_76b4d478)
			{
				if(var_6ecbaf85 > 1 && self AttackButtonPressed())
				{
					var_6ecbaf85 = 0;
					trace = beamtrace(self.origin + VectorScale((0, 0, 1), 10), self.origin + VectorScale((0, 0, 1), 1000), 0, self, 1);
					self thread function_62be5ec2(trace["position"], level.var_18c6a1c5, 50, 0.1);
				}
				wait(0.05);
			}
			continue;
		}
		else
		{
			self SetVelocity(self getvelocity() * 1.5);
		}
		v_start_position = self.origin;
		self waittill("hash_13577306");
		n_distance = Distance(v_start_position, self.origin);
		var_b2128177 = var_b2128177 + n_distance;
		if(var_b2128177 >= 590.55)
		{
			self.var_76b4d478++;
			var_b2128177 = 0;
			self function_796be46c();
		}
	}
}

/*
	Name: function_577aeaed
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x88
	Parameters: 0
	Flags: Private
	Line Number: 474
*/
function private function_577aeaed()
{
	self endon("death");
	self endon("disconnect");
	self endon("bled_out");
	self endon("hash_cefe86d9");
	for(;;)
	{
		grenade = self function_565dca8b();
		if(isdefined(grenade))
		{
			self thread function_beab9a3(grenade);
		}
		util::wait_network_frame();
	}
}

/*
	Name: function_d70f5e81
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1040
	Size: 0x110
	Parameters: 0
	Flags: Private
	Line Number: 501
*/
function private function_d70f5e81()
{
	self endon("death");
	self endon("disconnect");
	self endon("bled_out");
	self endon("hash_cefe86d9");
	for(;;)
	{
		wait(0.005);
		while(self IsOnGround())
		{
			wait(0.005);
		}
		var_2455864d = self.origin;
		while(!self IsOnGround())
		{
			wait(0.005);
		}
		var_866cc0d9 = self.origin;
		if(Distance2D(var_2455864d, var_866cc0d9) < 500 && var_2455864d[2] - var_866cc0d9[2] > 140)
		{
			self function_796be46c();
		}
	}
}

/*
	Name: function_beab9a3
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1158
	Size: 0x130
	Parameters: 2
	Flags: Private
	Line Number: 537
*/
function private function_beab9a3(grenade, weapon)
{
	self endon("death");
	self endon("disconnect");
	grenade util::waittill_any_return("stationary", "grenade_bounce", "death");
	if(!isdefined(grenade))
	{
		return;
	}
	origin = grenade.origin;
	grenade delete();
	for(i = 0; i < 10; i++)
	{
		self MagicGrenadeType(level.w_bgb_slaughter_slide, origin, (randomIntRange(-75, 75), randomIntRange(-75, 75), 400), 1);
		wait(0.2);
		util::wait_network_frame();
	}
}

/*
	Name: function_565dca8b
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1290
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 566
*/
function function_565dca8b()
{
	self notify("hash_565dca8b");
	self endon("hash_565dca8b");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon === level.zombie_lethal_grenade_player_init)
		{
			return grenade;
		}
		wait(0.05);
	}
}

/*
	Name: function_5eb58289
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1320
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 593
*/
function function_5eb58289()
{
	self endon("disconnect");
	self notify("hash_76b4d478");
	self endon("hash_76b4d478");
	self endon("bled_out");
	self SetVelocity(self getvelocity() * 10);
	while(self IsSliding())
	{
		if(!self IsOnGround())
		{
			trace = GroundTrace(self.origin + VectorScale((0, 0, 1), 5), self.origin - VectorScale((0, 0, 1), 500), 0, self, 1);
			if(Distance(self.origin, trace["position"]) > 60)
			{
				self SetVelocity(VectorScale((0, 0, -1), 100));
				return;
			}
		}
		wait(0.05);
	}
	time = GetTime();
	while(time + 1000 > GetTime())
	{
		if(!self IsOnGround())
		{
			trace = GroundTrace(self.origin + VectorScale((0, 0, 1), 5), self.origin - VectorScale((0, 0, 1), 500), 0, self, 1);
			if(Distance(self.origin, trace["position"]) > 60)
			{
				self SetVelocity(VectorScale((0, 0, -1), 100));
				return;
			}
		}
		wait(0.05);
	}
	self.var_76b4d478 = 0;
}

/*
	Name: function_65e4a45a
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1558
	Size: 0x160
	Parameters: 3
	Flags: None
	Line Number: 640
*/
function function_65e4a45a(b_pause, str_perk, str_result)
{
	self notify("specialty_flakjacket" + "_stop");
	if(level.var_508fe397)
	{
		return;
	}
	self endon("disconnect");
	self endon("death");
	self endon("player_revived");
	self endon("player_suicide");
	self endon("zombified");
	self endon("spawned_player");
	self endon("disconnect");
	wait(0.05);
	if(self laststand::player_is_in_laststand())
	{
		trace = beamtrace(self.origin + VectorScale((0, 0, 1), 10), self.origin + VectorScale((0, 0, 1), 1000), 0, self, 1);
		self thread function_62be5ec2(trace["position"], level.var_18c6a1c5, 50, 0.1);
	}
	self waittill("bled_out");
	self.score = self.score + 4000;
	return;
	ERROR: Bad function call
}

/*
	Name: function_c66a20b7
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x16C0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 676
*/
function function_c66a20b7()
{
	if(level.round_number > 20)
	{
		return 1;
	}
	if(level.round_number > 12)
	{
		return 2;
	}
	return 3;
}

/*
	Name: function_62be5ec2
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0xE0
	Parameters: 4
	Flags: Private
	Line Number: 699
*/
function private function_62be5ec2(origin, weapon, time, delay)
{
	if(!isdefined(time))
	{
		time = 1;
	}
	if(!isdefined(delay))
	{
		delay = 0.5;
	}
	for(i = 0; i < time; i++)
	{
		self function_a2d9c5b2(weapon, origin, (randomIntRange(0, 370), randomIntRange(0, 370), -10000));
		wait(delay);
		util::wait_network_frame();
	}
}

/*
	Name: function_796be46c
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x17E8
	Size: 0xA4
	Parameters: 0
	Flags: Private
	Line Number: 727
*/
function private function_796be46c()
{
	if(isdefined(level.var_508fe397) && !level.var_508fe397)
	{
		self function_a2d9c5b2(level.var_18c6a1c5, self.origin + VectorScale((0, 0, 1), 40), VectorScale((0, 0, -1), 10000));
	}
	else
	{
		self function_a2d9c5b2(level.var_38a07441, self.origin + VectorScale((0, 0, 1), 40), VectorScale((0, 0, -1), 10000));
	}
}

