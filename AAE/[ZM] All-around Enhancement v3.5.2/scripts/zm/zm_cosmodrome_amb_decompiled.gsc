#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_audio_zhd;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\zm_cosmodrome_eggs;
#include scripts\zm\zm_cosmodrome_lander;

#namespace namespace_9dd378ec;

/*
	Name: main
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 26
*/
function main()
{
	level.var_fb6a8851 = &new_lander_intro;
	level._blackhole_bomb_valid_area_check = &function_a0f14d15;
	level thread function_5b4692c9();
	level thread function_e32302e3();
	level thread radio_easter_eggs();
	level thread function_7624a208();
	level thread function_4947258a();
	level thread function_337aada8();
	level thread function_ba0eb696();
	level thread play_intro_music();
	thread function_74c0fd9d();
	level.customHudReveal = &customHudReveal;
}

/*
	Name: play_intro_music
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x7C0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function play_intro_music()
{
	level flag::wait_till("all_players_connected");
	level thread zm_audio::sndmusicsystem_playstate("round_start_first_lander");
}

/*
	Name: power_clangs
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x810
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function power_clangs()
{
	clangs = struct::get_array("amb_power_clang", "targetname");
	for(i = 0; i < clangs.size; i++)
	{
		playsoundatposition("zmb_circuit", clangs[i].origin);
		wait(RandomFloatRange(0.25, 0.7));
	}
}

/*
	Name: play_cosmo_announcer_vox
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 88
*/
function play_cosmo_announcer_vox(alias, var_33dae1e3, wait_override)
{
	if(!isdefined(alias))
	{
		return;
	}
	if(!isdefined(level.var_93826d64))
	{
		level.var_93826d64 = 0;
	}
	if(!isdefined(var_33dae1e3))
	{
		var_33dae1e3 = 0;
	}
	if(!isdefined(wait_override))
	{
		wait_override = 0;
	}
	if(level.var_93826d64 == 0 && wait_override == 0)
	{
		level.var_93826d64 = 1;
		if(!var_33dae1e3)
		{
			level play_initial_alarm();
		}
		level zm_utility::really_play_2D_sound(alias);
		level.var_93826d64 = 0;
		return;
	}
	if(wait_override == 1)
	{
		level zm_utility::really_play_2D_sound(alias);
	}
}

/*
	Name: function_524d0ceb
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 133
*/
function function_524d0ceb(alias)
{
	if(!isdefined(alias))
	{
		return;
	}
	if(!isdefined(level.var_b81d5aac))
	{
		level.var_b81d5aac = 0;
	}
	if(level.var_b81d5aac == 0)
	{
		level.var_b81d5aac = 1;
		level zm_utility::really_play_2D_sound(alias);
		level.var_b81d5aac = 0;
	}
}

/*
	Name: play_initial_alarm
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xA48
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 161
*/
function play_initial_alarm()
{
	structs = struct::get_array("amb_warning_siren", "targetname");
	wait(1);
	for(i = 0; i < structs.size; i++)
	{
		playsoundatposition("evt_cosmo_alarm_single", structs[i].origin);
	}
	wait(0.5);
}

/*
	Name: function_e32302e3
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xAE8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function function_e32302e3()
{
	wait(3);
	while(1)
	{
		level flag::wait_till("monkey_round");
		level thread play_cosmo_announcer_vox("vox_ann_monkey_begin");
		level waittill("between_round_over");
		level thread play_cosmo_announcer_vox("vox_ann_monkey_end");
		wait(10);
	}
	return;
}

/*
	Name: radio_easter_eggs
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function radio_easter_eggs()
{
	var_385d0c76 = struct::get_array("radio_egg", "targetname");
	Array::thread_all(var_385d0c76, &function_5fd10b57);
	return;
	ERROR: Bad function call
}

/*
	Name: function_5fd10b57
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xBD0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function function_5fd10b57()
{
	self zm_unitrigger::create_unitrigger();
	self waittill("trigger_activated");
	namespace_cc012897::Send("vox_radio_egg_" + self.script_int);
	playsoundatposition("vox_radio_egg_" + self.script_int, self.origin);
}

/*
	Name: function_7624a208
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xC58
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 242
*/
function function_7624a208()
{
	level thread namespace_52adc03e::function_e753d4f();
	level flag::wait_till("snd_song_completed");
	level thread zm_audio::sndmusicsystem_playstate("abracadavre");
}

/*
	Name: function_337aada8
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xCC0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 259
*/
function function_337aada8()
{
	level.var_568da27 = 0;
	var_85d06ae4 = struct::get_array("egg_phone", "targetname");
	while(1)
	{
		level waittill("hash_b524a8eb");
		level.var_568da27++;
		if(level.var_568da27 == var_85d06ae4.size)
		{
			break;
		}
	}
	level notify("hash_2d7a77fa");
	level thread zm_audio::sndmusicsystem_playstate("not_ready_to_die");
}

/*
	Name: function_10544d8
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function function_10544d8()
{
	self endon("hash_58b9d0eb");
	self endon("timeout");
	self.t_damage = spawn("trigger_damage", self.origin, 0, 5, 5);
	while(1)
	{
		self.t_damage waittill("damage", n_amount, e_attacker, dir, point, str_means_of_death);
		if(!namespace_52adc03e::function_8090042c())
		{
			continue;
		}
		if(!isPlayer(e_attacker))
		{
			continue;
		}
		if(str_means_of_death != "MOD_MELEE")
		{
			continue;
		}
		if(DistanceSquared(e_attacker.origin, self.origin) > 4225)
		{
			continue;
			break;
		}
	}
	self.broken = 1;
	self notify("hash_b524a8eb");
	if(isdefined(self.var_48df29fd))
	{
		self.var_48df29fd delete();
	}
	level notify("hash_b524a8eb");
	playsoundatposition("zmb_redphone_destroy", self.origin);
	self.t_damage delete();
}

/*
	Name: function_4947258a
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0xF28
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 333
*/
function function_4947258a()
{
	level endon("hash_2d7a77fa");
	var_85d06ae4 = struct::get_array("egg_phone", "targetname");
	a_n_radio = Array(0, 1, 2, 3, 4, 5, 6, 7, 8);
	if(var_85d06ae4.size <= 0)
	{
		return;
	}
	var_693fabd9 = undefined;
	while(1)
	{
		wait(randomIntRange(90, 240));
		while(1)
		{
			s_phone = Array::random(var_85d06ae4);
			ArrayRemoveValue(var_85d06ae4, s_phone);
			if(var_85d06ae4.size <= 0)
			{
				var_85d06ae4 = struct::get_array("egg_phone", "targetname");
			}
			if(isdefined(s_phone.broken) && s_phone.broken)
			{
				continue;
				break;
			}
		}
		activation = s_phone function_de8ef595();
		if(isdefined(activation) && activation)
		{
			n_radio = Array::random(a_n_radio);
			ArrayRemoveValue(a_n_radio, n_radio);
			if(a_n_radio.size <= 0)
			{
				a_n_radio = Array(0, 1, 2, 3, 4, 5, 6, 7, 8);
			}
			namespace_cc012897::Send("vox_egg_redphone_" + n_radio);
			playsoundatposition("vox_egg_redphone_" + n_radio, s_phone.origin);
			var_693fabd9 = n_radio;
			wait(30);
		}
	}
}

/*
	Name: function_de8ef595
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x11C0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function function_de8ef595()
{
	level endon("hash_2d7a77fa");
	self endon("hash_b524a8eb");
	self thread function_99199901();
	self thread function_d772340();
	self thread function_10544d8();
	self.var_a3f075d6 = 1;
	str_notify = self util::waittill_any_return("phone_activated", "timeout");
	self.var_a3f075d6 = 0;
	if(isdefined(self.t_damage))
	{
		self.t_damage delete();
	}
	if(str_notify === "timeout")
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_99199901
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x12B0
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 418
*/
function function_99199901()
{
	level endon("hash_2d7a77fa");
	self endon("timeout");
	self endon("hash_b524a8eb");
	self.var_7f6e3a35 = spawn("trigger_radius", self.origin - VectorScale((0, 0, 1), 200), 0, 75, 400);
	self.var_48df29fd = spawn("script_origin", self.origin);
	self.var_48df29fd PlayLoopSound("zmb_egg_phone_loop", 0.05);
	while(1)
	{
		self.var_7f6e3a35 waittill("trigger", who);
		if(!isPlayer(who))
		{
			wait(0.05);
			continue;
		}
		while(who istouching(self.var_7f6e3a35))
		{
			if(who useButtonPressed())
			{
				self notify("hash_58b9d0eb");
				self.var_7f6e3a35 delete();
				self.var_48df29fd delete();
				return;
			}
			wait(0.05);
		}
	}
}

/*
	Name: function_d772340
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1450
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 458
*/
function function_d772340()
{
	level endon("hash_2d7a77fa");
	self endon("hash_58b9d0eb");
	self endon("hash_b524a8eb");
	wait(10);
	self notify("timeout");
	self.var_7f6e3a35 delete();
	self.var_48df29fd delete();
}

/*
	Name: function_ba0eb696
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x14C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 479
*/
function function_ba0eb696()
{
	wait(10);
	for(i = 0; i < 4; i++)
	{
		ent = GetEnt("doll_egg_" + i, "targetname");
		if(!isdefined(ent))
		{
			return;
		}
		ent thread function_25d6399c(i);
	}
}

/*
	Name: function_25d6399c
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1560
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 503
*/
function function_25d6399c(num)
{
	if(!isdefined(self))
	{
		return;
	}
	self UseTriggerRequireLookAt();
	self setcursorhint("HINT_NOICON");
	alias = undefined;
	while(1)
	{
		self waittill("trigger", player);
		index = zm_utility::get_player_index(player);
		switch(index)
		{
			case 0:
			{
				alias = "vox_egg_doll_response_" + num + "_0";
				break;
			}
			case 1:
			{
				alias = "vox_egg_doll_response_" + num + "_1";
				break;
			}
			case 3:
			{
				alias = "vox_egg_doll_response_" + num + "_2";
				break;
			}
			case 2:
			{
				alias = "vox_egg_doll_response_" + num + "_3";
				break;
			}
		}
		namespace_cc012897::Send(alias);
		self playsoundwithnotify(alias, "sounddone" + alias);
		self waittill("sounddone" + alias);
		player zm_audio::create_and_play_dialog("weapon_pickup", "dolls");
		wait(8);
	}
}

/*
	Name: function_a0f14d15
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1740
	Size: 0xC0
	Parameters: 3
	Flags: None
	Line Number: 557
*/
function function_a0f14d15(grenade, model, player)
{
	var_7d5605b7 = GetEnt("sndzhdeggtrig", "targetname");
	if(!isdefined(var_7d5605b7))
	{
		return 0;
	}
	if(model istouching(var_7d5605b7))
	{
		model clientfield::set("toggle_black_hole_deployed", 1);
		level thread function_61c7f9a3(grenade, model, var_7d5605b7);
		return 1;
	}
	return 0;
}

/*
	Name: function_5b4692c9
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1808
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 583
*/
function function_5b4692c9()
{
	var_7533f11 = struct::get_array("s_ballerina_bhb", "targetname");
	if(var_7533f11.size <= 0)
	{
		return;
	}
	var_ead6e450 = Array::sort_by_script_int(var_7533f11, 1);
	foreach(s_ballerina in var_ead6e450)
	{
		s_ballerina function_2e4843da();
	}
	level flag::set("snd_zhdegg_activate");
	level._blackhole_bomb_valid_area_check = undefined;
}

/*
	Name: function_2e4843da
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1920
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 609
*/
function function_2e4843da()
{
	self.mdl_ballerina = util::spawn_model(self.model, self.origin, self.angles);
	e_trig = spawn("trigger_radius", self.origin + VectorScale((0, 0, -1), 120), 0, 175, 200);
	e_trig.targetname = "sndzhdeggtrig";
	e_trig.s_target = self;
	e_trig waittill("hash_de264026");
	self.mdl_ballerina delete();
	e_trig delete();
}

/*
	Name: function_61c7f9a3
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1A08
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 630
*/
function function_61c7f9a3(grenade, model, var_7d5605b7)
{
	wait(1);
	time = 3;
	var_7d5605b7.s_target.mdl_ballerina moveto(grenade.origin + VectorScale((0, 0, 1), 50), time, time - 0.05);
	wait(time);
	playsoundatposition("zmb_gersh_teleporter_out", grenade.origin + VectorScale((0, 0, 1), 50));
	model delete();
	var_7d5605b7 notify("hash_de264026");
}

/*
	Name: function_cfeb7b8c
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1B08
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 651
*/
function function_cfeb7b8c()
{
	level flag::wait_till("rerouted_power");
	a_switches = struct::get_array("sync_switch_start", "targetname");
	button_pressed = 0;
	while(!level flag::get("switches_synced"))
	{
		foreach(s_switch in a_switches)
		{
			if(isdefined(s_switch.pressed) && s_switch.pressed)
			{
				button_pressed++;
			}
		}
		if(button_pressed == level.players.size)
		{
			foreach(s_switch in a_switches)
			{
				s_switch.pressed = 1;
			}
		}
		button_pressed = 0;
		wait(0.05);
	}
}

/*
	Name: function_65ebdc24
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1CC8
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 687
*/
function function_65ebdc24()
{
	level flag::wait_till("pressure_sustained");
	lander = GetEnt("lander", "targetname");
	while(!level flag::get("passkey_confirmed"))
	{
		level waittill("lander_launched");
		if(level.players.size == 1)
		{
			if(lander.called)
			{
				start = lander.depart_station;
				dest = lander.station;
				letter = level.var_8093285f[start][dest];
				model = level.var_46651379[letter];
				lander thread function_20fb11dc(letter, model);
			}
		}
		level flag::wait_till("lander_grounded");
	}
}

/*
	Name: function_20fb11dc
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1E20
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 719
*/
function function_20fb11dc(letter, model)
{
	level endon("lander_grounded");
	while(1)
	{
		if(DistanceSquared(model.origin, self.origin) < 32000)
		{
			break;
		}
		wait(0.05);
	}
	level flag::set("letter_acquired");
	playsoundatposition("zmb_powerup_grabbed", model.origin);
	model ghost();
	if(letter == level.var_ce30083b[level.var_4a825f7])
	{
		level.var_4a825f7++;
		if(level.var_4a825f7 == level.var_ce30083b.size)
		{
			level flag::set("passkey_confirmed");
		}
	}
	else
	{
		level.var_4a825f7 = 0;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8cafa0a3
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x1F58
	Size: 0xC8
	Parameters: 3
	Flags: None
	Line Number: 759
*/
function function_8cafa0a3(grenade, model, info)
{
	if(isdefined(level.var_81ac6ac4) && grenade istouching(level.var_81ac6ac4))
	{
		trig = spawn("trigger_damage", grenade.origin, 0, 15, 72);
		grenade thread function_61f25aa1(trig);
		if(level.activePlayers.size == 1)
		{
			trig thread function_bb7cbe69();
		}
	}
	return 0;
}

/*
	Name: function_6d87905c
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x2028
	Size: 0x1D8
	Parameters: 3
	Flags: None
	Line Number: 783
*/
function function_6d87905c(model, trig, var_c45fbbb9)
{
	model endon("death");
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("weapon_fired", weapon);
		if(weapon.name == "thundergun_upgraded" || weapon.name == "thundergun_upgraded_lh" || weapon.name == "thundergun_upgraded_og")
		{
			if(DistanceSquared(self.origin, var_c45fbbb9.origin) < 90000)
			{
				var_a9399ec7 = VectorNormalize(var_c45fbbb9.origin - self GetWeaponMuzzlePoint());
				var_8e3e37c9 = self GetWeaponForwardDir();
				angle_diff = ACos(VectorDot(var_a9399ec7, var_8e3e37c9));
				if(angle_diff <= 20)
				{
					level flag::set("thundergun_hit");
					radiusdamage(trig.origin, 5, 1, 1, self);
				}
			}
		}
	}
}

/*
	Name: function_61f25aa1
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x2208
	Size: 0x290
	Parameters: 1
	Flags: None
	Line Number: 818
*/
function function_61f25aa1(trig)
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self thread namespace_f23e8c1a::function_cc6ea79(trig);
	var_c45fbbb9 = struct::get("weapon_combo_spot", "targetname");
	var_68345fe = 0;
	var_83e9f930 = 0;
	Array::thread_all(level.activePlayers, &function_6d87905c, self, trig, var_c45fbbb9);
	for(;;)
	{
		trig waittill("damage", amount, inflictor, direction, point, type, tagName, modelName, partName, weapon);
		if(isdefined(inflictor))
		{
			if(type == "MOD_PROJECTILE" && (weapon.name == "ray_gun_upgraded" || weapon.name == "raygun_mark2_upgraded" || weapon.name == "ray_gun_upgraded_cw" || weapon.name == "ray_gun_upgraded_lh"))
			{
				var_68345fe = 1;
			}
			else if(weapon.name == "nesting_dolls" || weapon.name == "nesting_dolls_single")
			{
				var_83e9f930 = 1;
			}
			if(var_68345fe && var_83e9f930 && level flag::get("thundergun_hit"))
			{
				level flag::set("weapons_combined");
				level thread namespace_f23e8c1a::function_d0a93ec2(self, trig.origin);
				return;
			}
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_bb7cbe69
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x24A0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 863
*/
function function_bb7cbe69()
{
	wait(0.05);
	self notify("damage", 1, level.activePlayers[0], undefined, undefined, undefined, undefined, undefined, undefined, GetWeapon("nesting_dolls"));
}

/*
	Name: function_15e37703
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x24F0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 879
*/
function function_15e37703()
{
	level endon("end_game");
	weapon = GetWeapon("bouncingbetty");
	while(level flag::get("monkey_round"))
	{
		for(i = 0; i < level.activePlayers.size; i++)
		{
			if(level.activePlayers[i] hasweapon(weapon))
			{
				level.activePlayers[i] SetWeaponAmmoClip(weapon, 2);
			}
		}
		wait(10);
	}
}

/*
	Name: customHudReveal
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x25C8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 906
*/
function customHudReveal()
{
	self endon("disconnect");
	self endon("death");
	level flag::wait_till("lander_grounded");
	self zm::ShowHudAndPlayPromo();
}

/*
	Name: function_74c0fd9d
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x2620
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 924
*/
function function_74c0fd9d()
{
	level waittill("all_players_connected");
	vending = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending.size; i++)
	{
		if(vending[i].script_noteworthy == "specialty_deadshot" || vending[i].script_noteworthy == "specialty_doubletap2")
		{
			vending[i].realorigin = VectorScale((0, 0, -1), 10000);
		}
	}
	thread function_15e37703();
	function_cfeb7b8c();
	function_65ebdc24();
	wait(0.05);
	level.black_hole_bomb_loc_check_func = &function_8cafa0a3;
}

/*
	Name: function_8d8e3ac0
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x2748
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 952
*/
function function_8d8e3ac0()
{
	self endon("death");
	while(!level flag::get("all_players_connected"))
	{
		self waittill("all_players_connected");
	}
}

/*
	Name: new_lander_intro
	Namespace: namespace_9dd378ec
	Checksum: 0x424F4353
	Offset: 0x2790
	Size: 0x2FC
	Parameters: 0
	Flags: None
	Line Number: 971
*/
function new_lander_intro()
{
	level function_8d8e3ac0();
	lander = GetEnt("lander", "targetname");
	lander namespace_9d4ce396::lock_players_intro();
	lander PlayLoopSound("zmb_lander_exhaust_loop");
	lander.sound_ent = spawn("script_origin", lander.origin);
	lander.sound_ent LinkTo(lander);
	lander.sound_ent playsound("zmb_lander_launch");
	lander.sound_ent PlayLoopSound("zmb_lander_flying_low_loop");
	lander_struct = struct::get("lander_station5", "targetname");
	spot1 = lander_struct.origin;
	level thread namespace_9d4ce396::lander_engine_fx();
	lander.anchor moveto(spot1, 8, 0.1, 7.9);
	level notify("lander_launched");
	util::delay(6, undefined, &flag::set, "lander_intro_done");
	lander.anchor waittill("movedone");
	level.intro_lander = 0;
	level flag::set("lander_grounded");
	level thread play_cosmo_announcer_vox("vox_ann_startup");
	lander.sound_ent StopLoopSound(3);
	lander StopLoopSound(3);
	playsoundatposition("zmb_lander_land", lander.sound_ent.origin);
	namespace_9d4ce396::open_lander_gate();
	namespace_9d4ce396::unlock_players();
	level thread namespace_9d4ce396::force_wait_for_gersh_line();
}

