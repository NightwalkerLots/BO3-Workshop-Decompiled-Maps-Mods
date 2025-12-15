#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_b1bc995c;

/*
	Name: init
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0xF50
	Size: 0x5B8
	Parameters: 0
	Flags: AutoExec
	Line Number: 42
*/
function autoexec init()
{
	clientfield::register("scriptmover", "boss_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_weak_point_shader", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_teleport_fx", 5000, 1, "counter");
	clientfield::register("scriptmover", "boss_elemental_storm_cast_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_elemental_storm_explode_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_elemental_storm_stunned_keeper_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_elemental_storm_stunned_spikes_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_demongate_cast_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_demongate_chomper_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_demongate_chomper_bite_fx", 5000, 1, "counter");
	clientfield::register("scriptmover", "boss_rune_prison_erupt_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_rune_prison_rock_fx", 5000, 1, "int");
	clientfield::register("scriptmover", "boss_rune_prison_explode_fx", 5000, 1, "int");
	clientfield::register("allplayers", "boss_rune_prison_dot_fx", 5000, 1, "int");
	clientfield::register("world", "boss_wolf_howl_fx_change", 5000, 1, "int");
	clientfield::register("scriptmover", "change_exposure_bank", 5000, 1, "int");
	level flag::init("temple_steps");
	level flag::init("pressure_pads_activated");
	level flag::init("boss_fight_ready");
	level flag::init("clone_to_boss");
	level flag::init("boss_fight_begin");
	level flag::init("boss_elemental_storm_cast_in_progress");
	level flag::init("boss_stunned");
	level flag::init("boss_completed_early");
	level flag::init("boss_fight_completed");
	level thread function_19cd06d9();
	level waittill("hash_eff9bce7");
	level flag::set("temple_steps");
	thread function_cb7632cd();
	level flag::set("clone_to_boss");
	level flag::set("boss_fight_begin");
	var_15ed352b = GetEntArray("grav_pad_trigger", "targetname");
	foreach(var_3b9a12e0 in var_15ed352b)
	{
		var_3b9a12e0 thread function_e49e9c09();
	}
	var_1af36687 = spawnstruct();
	var_fe7002de = var_1af36687 function_71130ea();
	var_fe7002de function_1261fd50();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_19cd06d9
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x1510
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_19cd06d9()
{
	wait(1);
	level.var_1ed1d9a6 = GetEntArray("jump_thingy", "targetname");
	foreach(thingy in level.var_1ed1d9a6)
	{
		thingy thread function_46c531ee();
	}
	while(level.var_1ed1d9a6.size > 0)
	{
		wait(0.05);
	}
	level LUI::screen_flash(0.3, 1.4, 0.8, 1, "white");
	wait(0.3);
	obj = util::spawn_model("tag_origin", (0, 0, 0), (0, 0, 0));
	obj clientfield::set("change_exposure_bank", 1);
	playsoundatposition("flash", (0, 0, 0));
	level util::set_lighting_state(1);
	wait(2);
	obj delete();
}

/*
	Name: function_46c531ee
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x16E0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_46c531ee()
{
	self waittill("hash_482e9fd1", player);
	self.var_4288770f = player;
	self.e_mover = util::spawn_model("tag_origin", self.origin, self.angles);
	self LinkTo(self.e_mover);
	self.e_mover thread scene::Play("ai_zm_dlc1_chomper_boss_locomotion", self);
	self clientfield::set("boss_demongate_chomper_fx", 1);
	self function_7398c59d();
	if(IsInArray(level.var_1ed1d9a6, self))
	{
		ArrayRemoveValue(level.var_1ed1d9a6, self);
	}
	self delete();
	self.e_mover delete();
}

/*
	Name: function_cb7632cd
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x1828
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 156
*/
function function_cb7632cd()
{
	level.customSpawnLogic = &function_32230b9b;
	thread function_92a9fe4a();
	while(level flag::get("temple_steps"))
	{
		wait(0.05);
	}
	level notify("hash_255098f2");
	level.customSpawnLogic = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_92a9fe4a
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x18A8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_92a9fe4a()
{
	level endon("hash_255098f2");
	while(1)
	{
		level waittill("hash_c3d9c4c");
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			e_player = players[i];
			e_player zm::spectator_respawn_player();
		}
		level waittill("hash_97c7c4a7");
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			e_player = players[i];
			e_player zm::spectator_respawn_player();
		}
	}
}

/*
	Name: function_32230b9b
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x19B8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 212
*/
function function_32230b9b(chose)
{
	struct = struct::get("temple_respawn_" + self.characterindex);
	return struct;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2777756a
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x1A08
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_2777756a()
{
	ai_zombie = self;
	ai_zombie waittill("death", e_attacker);
	if(isPlayer(e_attacker))
	{
		[[level.hero_power_update]](e_attacker, ai_zombie);
	}
}

/*
	Name: function_4e3a8fa9
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x1A70
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 249
*/
function function_4e3a8fa9(b_on)
{
	if(b_on)
	{
		level clientfield::set("boss_wolf_howl_fx_change", 1);
		level clientfield::set("boss_gravity_spike_fx_change", 1);
		level._effect["dog_gib"] = "dlc1/castle/fx_ee_keeper_dog_explosion_zmb";
		level._effect["lightning_dog_spawn"] = "dlc1/castle/fx_ee_keeper_dog_lightning_buildup_zmb";
	}
	else
	{
		level clientfield::set("boss_wolf_howl_fx_change", 0);
		level clientfield::set("boss_gravity_spike_fx_change", 0);
		level._effect["dog_gib"] = "zombie/fx_dog_explosion_zmb";
		level._effect["lightning_dog_spawn"] = "zombie/fx_dog_lightning_buildup_zmb";
	}
}

/*
	Name: function_7e9f0faf
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x1B80
	Size: 0x210
	Parameters: 3
	Flags: None
	Line Number: 277
*/
function function_7e9f0faf(var_4a032429, var_f759b439, var_610499ec)
{
	if(!isdefined(var_4a032429))
	{
		var_4a032429 = 0;
	}
	if(!isdefined(var_f759b439))
	{
		var_f759b439 = 0;
	}
	if(!isdefined(var_610499ec))
	{
		var_610499ec = 0;
	}
	a_valid_spawn_points = [];
	var_a55896c4 = [];
	b_all_points_used = 0;
	if(var_4a032429)
	{
		var_a55896c4 = self.var_f7afb996;
		return var_a55896c4;
	}
	if(var_f759b439)
	{
		var_a55896c4 = self.var_9680b225;
		return var_a55896c4;
	}
	if(var_610499ec)
	{
		var_a55896c4 = self.var_772c4512;
		return var_a55896c4;
	}
	var_a55896c4 = self.var_828cb4c9;
	while(!a_valid_spawn_points.size)
	{
		foreach(s_spawn_point in var_a55896c4)
		{
			if(!isdefined(s_spawn_point.spawned_zombie) || b_all_points_used)
			{
				s_spawn_point.spawned_zombie = 0;
			}
			if(!s_spawn_point.spawned_zombie)
			{
				Array::add(a_valid_spawn_points, s_spawn_point, 0);
			}
		}
		if(!a_valid_spawn_points.size)
		{
			b_all_points_used = 1;
		}
		wait(0.05);
	}
	s_spawn_point = Array::random(a_valid_spawn_points);
	s_spawn_point.spawned_zombie = 1;
	return s_spawn_point;
}

/*
	Name: function_71130ea
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x1D98
	Size: 0x718
	Parameters: 0
	Flags: None
	Line Number: 344
*/
function function_71130ea()
{
	if(GetDvarInt("splitscreen_playerCount") > 2)
	{
		level.var_1a4b8a19 = 1;
	}
	else
	{
		level.var_1a4b8a19 = 0;
	}
	self.var_7e383b58 = 0;
	level.var_2b421938 = level.players.size;
	self.n_health = 20000 * level.var_2b421938;
	if(self.n_health > 30000)
	{
		self.n_health = 30000;
	}
	self.var_4bd4bce6 = 20000 * level.var_2b421938;
	if(level.round_number < 25)
	{
		level.var_74b7ddca = level.zombie_vars["zombie_health_start"];
		for(i = 2; i <= 25; i++)
		{
			if(i >= 10)
			{
				old_health = level.var_74b7ddca;
				level.var_74b7ddca = level.var_74b7ddca + Int(level.var_74b7ddca * level.zombie_vars["zombie_health_increase_multiplier"]);
				if(level.var_74b7ddca < old_health)
				{
					level.var_74b7ddca = old_health;
					break;
					continue;
				}
			}
			level.var_74b7ddca = Int(level.var_74b7ddca + level.zombie_vars["zombie_health_increase"]);
		}
	}
	else
	{
		level.var_74b7ddca = level.zombie_health;
	}
	if(level.var_1a4b8a19)
	{
		level.var_de21b83b = level.var_74b7ddca * 0.75;
	}
	else
	{
		level.var_de21b83b = level.var_74b7ddca * 0.25;
	}
	var_8880cc35 = struct::get("boss_keeper", "targetname");
	self.var_40b46e43 = util::spawn_anim_model("c_zom_dlc1_keeper_archon_fb", var_8880cc35.origin, var_8880cc35.angles);
	self.var_40b46e43 EnableLinkTo();
	var_b444c5cd = self.var_40b46e43 GetTagOrigin("tag_aim");
	var_9f10f5d3 = self.var_40b46e43 GetTagAngles("tag_aim");
	self.var_e3d9917e = GetEnt("boss_weak_point", "targetname");
	self.var_e3d9917e.origin = var_b444c5cd;
	self.var_e3d9917e.angles = var_9f10f5d3;
	var_bf34fcda = 59000 * GetPlayers().size;
	if(var_bf34fcda > 89000)
	{
		var_bf34fcda = 89000;
	}
	level.var_bf34fcda = var_bf34fcda;
	self.var_40b46e43.takedamage = 1;
	self.var_e3d9917e LinkTo(self.var_40b46e43, "tag_aim", (-7, 0, -15));
	self.var_64274e35 = GetEnt("boss_weak_point_blocker", "targetname");
	self.var_64274e35.origin = var_b444c5cd;
	self.var_64274e35.angles = var_9f10f5d3;
	self.var_64274e35 LinkTo(self.var_40b46e43, "tag_aim", (-17, 0, -15));
	self.var_a2e9e777 = GetEnt("boss_player_collision", "targetname");
	self.var_a2e9e777 LinkTo(self.var_40b46e43);
	self.var_83296dfe = GetEnt("boss_dot_area", "targetname");
	self.var_83296dfe notsolid();
	self.var_83296dfe LinkTo(self.var_40b46e43);
	self.var_40b46e43 ghost();
	self.var_1e4b92cb = [];
	self.var_1e4b92cb = struct::get_array("boss_teleport_point", "targetname");
	s_temp = struct::get("boss_cast_elemental_storm_start", "targetname");
	self.var_266e735f = s_temp.origin;
	s_temp = struct::get("boss_cast_elemental_storm_end", "targetname");
	self.var_c7117234 = s_temp.origin;
	self.var_ee000bfc = 0;
	self.var_92904d31 = [];
	if(level.var_1a4b8a19)
	{
		var_d7ca411c = 6;
	}
	else
	{
		var_d7ca411c = 16;
	}
	for(i = 0; i < var_d7ca411c; i++)
	{
		self.var_92904d31[i] = util::spawn_anim_model("p7_fxanim_zm_bow_rune_prison_red_mod", (-3008, 6976, -1215), (0, 0, 0));
		self.var_92904d31[i].takedamage = 1;
		self.var_92904d31[i].var_552a692 = 0;
	}
	self.var_29204bf = [];
	self.var_77e69b0f = [];
	self.var_8016f006 = [];
	wait(0.05);
	self.var_40b46e43 clientfield::set("boss_fx", 1);
	self.var_40b46e43 clientfield::set("boss_weak_point_shader", 1);
	return self;
}

/*
	Name: function_1466b3f1
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x24B8
	Size: 0x708
	Parameters: 0
	Flags: None
	Line Number: 460
*/
function function_1466b3f1()
{
	var_df15467c = struct::get_array("boss_mech_spawn_point", "targetname");
	for(i = 0; i < var_df15467c.size; i++)
	{
		switch(i)
		{
			case 0:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2940, 7476, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 1:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2789, 7578, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 2:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2577, 7341, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 3:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2479, 7134, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 4:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2548, 6958, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 5:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2577, 6636, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 6:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2711, 6442, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 7:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3127, 6403, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 8:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3369, 6559, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 9:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3499, 6644, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 10:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3617, 6853, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 11:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3513, 7013, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 12:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3438, 7346, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 13:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-3230, 7509, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
				break;
			}
			default
			{
			}
		}
	}
	return var_df15467c;
}

/*
	Name: function_a1658f19
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x2BC8
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 570
*/
function function_a1658f19(str_anim, str_loop)
{
	if(!isdefined(str_loop))
	{
		str_loop = "ai_zm_dlc1_archon_float_idle";
	}
	self notify("hash_26fd8ff7");
	if(isdefined(str_anim) && str_anim != "ai_zm_dlc1_archon_float_spell_elemental_charge_intro")
	{
		self animation::Play(str_anim);
	}
	else if(isdefined(str_anim))
	{
		self animation::Play(str_anim, self.origin, self.angles, 0.3);
	}
	if(isdefined(self))
	{
		self thread animation::Play(str_loop);
	}
}

/*
	Name: function_1261fd50
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x2CA0
	Size: 0x2B0
	Parameters: 0
	Flags: None
	Line Number: 601
*/
function function_1261fd50()
{
	level endon("_zombie_game_over");
	level endon("hash_e32fa83");
	var_1e84d44a = struct::get("boss_start_point", "targetname");
	self function_1b20ff86(var_1e84d44a.origin);
	wait(1);
	wait(1);
	self notify("hash_ff6409a6");
	Array::run_all(level.players, &PlayRumbleOnEntity, "zm_castle_boss_roar");
	self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_roar");
	self.var_40b46e43 playsound("vox_keeper_round_1");
	self function_ca8445e1();
	wait(3);
	self.var_7e383b58 = 1;
	while(1)
	{
		self thread function_96db213f();
		self function_28bb5727(0);
		if(level flag::get("boss_completed_early"))
		{
			self notify("hash_ed87af95");
			self.var_40b46e43 thread function_a1658f19("ai_zm_dlc1_archon_float_cleanse_ending");
			self.var_40b46e43 playsound("zmb_keeper_downed");
			Array::run_all(level.players, &PlayRumbleOnEntity, "zm_castle_boss_cleanse_ending");
			return 1;
		}
		self notify("hash_ed87af95");
		self.var_40b46e43 playsound("vox_keeper_round_1");
		wait(2.5);
		self.var_7e383b58++;
	}
	self.var_40b46e43 playsound("zmb_keeper_downed");
	self.var_40b46e43 thread function_a1658f19("ai_zm_dlc1_archon_float_cleanse_ending");
	Array::run_all(level.players, &PlayRumbleOnEntity, "zm_castle_boss_cleanse_ending");
}

/*
	Name: function_1b20ff86
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x2F58
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 648
*/
function function_1b20ff86(var_5ed78a5f)
{
	self.var_a2e9e777 solid();
	self.var_40b46e43.origin = var_5ed78a5f;
	var_91930983 = Array::random(level.activePlayers);
	angle = VectorToAngles(var_91930983.origin - self.var_40b46e43.origin);
	self.var_40b46e43.angles = (self.var_40b46e43.angles[0], angle[1], self.var_40b46e43.angles[2]);
	self.var_40b46e43 clientfield::increment("boss_teleport_fx", 1);
	self.var_40b46e43 playsound("zmb_keeper_spawn_in");
	wait(0.5);
	self.var_40b46e43 show();
	self.var_40b46e43 solid();
	self.var_40b46e43 function_a1658f19();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ca8445e1
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x30E0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 675
*/
function function_ca8445e1()
{
	self.var_a2e9e777 notsolid();
	self.var_40b46e43 notsolid();
	self.var_40b46e43 clientfield::increment("boss_teleport_fx", 1);
	self.var_40b46e43 playsound("zmb_keeper_spawn_out");
	wait(0.5);
	self.var_40b46e43 ghost();
	self.var_40b46e43 animation::stop();
	self.var_40b46e43.origin = self.var_40b46e43.origin - VectorScale((0, 0, 1), 500);
}

/*
	Name: function_e3ea9055
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x31C8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 697
*/
function function_e3ea9055(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	if(!var_70f504b7)
	{
		wait(6);
		return;
	}
}

/*
	Name: function_28bb5727
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3200
	Size: 0x5E0
	Parameters: 1
	Flags: None
	Line Number: 720
*/
function function_28bb5727(var_4a14cd40)
{
	level endon("_zombie_game_over");
	if(!isdefined(self.var_41c1a53f))
	{
		self.var_41c1a53f = [];
	}
	if(self.var_7e383b58 == 5)
	{
		var_cfe6cb9 = [];
	}
	self.var_42433bc = 0;
	var_19427a0d = self.var_41c1a53f.size;
	var_bb2bcd1a = self.var_41c1a53f.size;
	var_48d25fcc = 0;
	NB = randomIntRange(2, 5);
	while(!var_48d25fcc)
	{
		wait(0.05);
		for(i = 0; i < NB; i++)
		{
			while(!isdefined(self.var_551d8fa5))
			{
				n_rand = RandomInt(self.var_1e4b92cb.size);
				self.var_551d8fa5 = self.var_1e4b92cb[n_rand].origin;
				if(isdefined(self.var_c5bd1959))
				{
					if(self.var_c5bd1959 == self.var_551d8fa5 || DistanceSquared(self.var_c5bd1959, self.var_551d8fa5) < 40000)
					{
						self.var_551d8fa5 = undefined;
						wait(0.05);
						continue;
					}
				}
				foreach(player in level.players)
				{
					if(DistanceSquared(self.var_551d8fa5, player.origin) < 40000)
					{
						self.var_551d8fa5 = undefined;
						break;
					}
				}
			}
			self function_1b20ff86(self.var_551d8fa5);
			self.var_c5bd1959 = self.var_551d8fa5;
			self.var_551d8fa5 = undefined;
			var_c62c34d4 = Array("attack_one", "attack_two");
			var_b44290ac = Array::random(var_c62c34d4);
			switch(var_b44290ac)
			{
				case "attack_one":
				{
					self function_f6b53f16(0);
					break;
				}
				case "attack_two":
				{
					self function_a77c2ade(0);
					break;
				}
			}
			wait(1);
			self function_ca8445e1();
			wait(2);
		}
		var_48d25fcc = self function_abdb4498();
		if(!var_48d25fcc)
		{
			self function_ca8445e1();
			if(self.n_health < 20000)
			{
				self.n_health = 20000;
			}
		}
		else if(level.var_bf34fcda <= 0)
		{
			self.var_40b46e43 playsound("zmb_keeper_downed");
			Array::run_all(level.players, &PlayRumbleOnEntity, "zm_castle_boss_cleanse_ending");
			self.var_40b46e43 animation::Play("ai_zm_dlc1_archon_float_cleanse_ending");
			var_92a56887 = util::spawn_anim_model("c_zom_dlc1_keeper_archon_fb", self.var_40b46e43.origin, self.var_40b46e43.angles);
			self.var_40b46e43 delete();
			level notify("hash_c3d9c4c");
			var_92a56887 animation::Play("ai_zm_dlc1_archon_float_cleanse_ending");
			var_92a56887 clientfield::increment("boss_teleport_fx", 1);
			var_92a56887 delete();
			level flag::clear("boss_fight_begin");
			wait(0.1);
			level notify("hash_b33dffc");
			wait(0.05);
			level notify("hash_e32fa83");
			wait(0.05);
			break;
		}
		else
		{
			level notify("hash_cd6f3cf8");
			wait(0.05);
			Array::run_all(level.players, &PlayRumbleOnEntity, "zm_castle_boss_roar_pain");
			self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_roar", "ai_zm_dlc1_archon_float_idle");
			break;
		}
	}
}

/*
	Name: function_96db213f
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x37E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 834
*/
function function_96db213f()
{
	self endon("hash_ed87af95");
	self.var_40b46e43 endon("death");
	wait(randomIntRange(7, 20));
	while(1)
	{
		self.var_40b46e43 playsound("vox_keeper_amb");
		wait(randomIntRange(18, 40));
	}
}

/*
	Name: function_e2f41bf2
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3870
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 856
*/
function function_e2f41bf2()
{
	level endon("_zombie_game_over");
	level endon("hash_e991baf");
	level endon("hash_cd6f3cf8");
	switch(self.var_7e383b58)
	{
		case 0:
		case 1:
		{
			var_67536a25 = 8 + level.var_2b421938;
			var_830f8197 = 3;
			break;
		}
		case 3:
		{
			var_67536a25 = 12 + level.var_2b421938;
			if(level.var_2b421938 == 1)
			{
				var_67536a25 = var_67536a25 - 3;
			}
			var_830f8197 = 2.75;
			break;
		}
		case 5:
		{
			var_67536a25 = 14 + level.var_2b421938;
			if(level.var_2b421938 == 1)
			{
				var_67536a25 = var_67536a25 - 3;
			}
			var_830f8197 = 2.5;
			break;
		}
	}
	while(1)
	{
		self.var_8016f006 = Array::remove_dead(self.var_8016f006, 0);
		self.var_8016f006 = Array::remove_undefined(self.var_8016f006, 0);
		while(self.var_8016f006.size < var_67536a25)
		{
			s_spawn_point = self function_7e9f0faf(1);
			ai_zombie = function_20559b9e(s_spawn_point, self.var_20f219b1);
			if(isdefined(ai_zombie))
			{
				Array::add(self.var_8016f006, ai_zombie, 0);
			}
			self.var_8016f006 = Array::remove_dead(self.var_8016f006, 0);
			self.var_8016f006 = Array::remove_undefined(self.var_8016f006, 0);
			wait(0.05);
		}
		wait(0.05);
		self function_5e437060(var_830f8197);
	}
}

/*
	Name: function_5e437060
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3AD8
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 922
*/
function function_5e437060(n_time)
{
	self endon("hash_ff6409a6");
	wait(n_time);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_be0acb1a
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3B00
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 940
*/
function function_be0acb1a(n_index)
{
	wait(0.75);
	self thread [[self.var_41c1a53f[n_index]]](1);
}

/*
	Name: function_1dddcbf0
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3B38
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 956
*/
function function_1dddcbf0()
{
	level endon("_zombie_game_over");
	level endon("hash_e991baf");
	self function_ca8445e1();
	var_bc61c0c2 = [];
	var_c0fca9d = 0;
	var_ee22b3cb = 0;
	if(self.var_7e383b58 == 2)
	{
		var_466a9f43 = 3;
		var_740f7270 = 2;
		var_39253c05 = 2 + level.var_2b421938;
	}
	else
	{
		var_466a9f43 = 2;
		var_740f7270 = 2;
		var_39253c05 = 4 + level.var_2b421938;
		if(level.var_2b421938 == 1)
		{
			var_39253c05 = var_39253c05 - 1;
		}
	}
	self thread function_10739686(var_466a9f43);
	var_bd3370a1 = GetTime() / 1000;
	var_5f67a965 = 0;
	while(1)
	{
		n_time_current = GetTime() / 1000;
		var_5f67a965 = n_time_current - var_bd3370a1;
		var_bc61c0c2 = Array::remove_dead(var_bc61c0c2, 0);
		var_bc61c0c2 = Array::remove_undefined(var_bc61c0c2, 0);
		if(var_c0fca9d >= var_39253c05 && var_bc61c0c2.size <= 0)
		{
			break;
		}
		if(var_5f67a965 >= 8)
		{
			while(var_c0fca9d < var_39253c05 && var_bc61c0c2.size < var_740f7270)
			{
				var_c0fca9d++;
				wait(RandomFloatRange(0.25, 0.5));
			}
			var_5f67a965 = 0;
		}
		wait(0.05);
	}
	level notify("hash_c1965039");
	wait(3);
}

/*
	Name: function_10739686
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3D88
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 1018
*/
function function_10739686(var_466a9f43)
{
	level endon("hash_c1965039");
	level endon("_zombie_game_over");
	if(!isdefined(self.var_c660deed))
	{
		self.var_c660deed = [];
	}
	var_f9b87179 = 18 + level.var_2b421938;
	if(level.var_2b421938 == 1)
	{
		var_f9b87179 = var_f9b87179 - 3;
	}
	while(1)
	{
		self.var_c660deed = Array::remove_dead(self.var_c660deed, 0);
		self.var_c660deed = Array::remove_undefined(self.var_c660deed, 0);
		while(self.var_c660deed.size < var_f9b87179)
		{
			s_spawn_point = self function_7e9f0faf();
			ai_zombie = function_20559b9e(s_spawn_point, self.var_20f219b1);
			if(isdefined(ai_zombie))
			{
				Array::add(self.var_c660deed, ai_zombie, 0);
			}
			wait(0.05);
		}
		wait(var_466a9f43);
	}
}

/*
	Name: function_abdb4498
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x3EF8
	Size: 0x3A8
	Parameters: 0
	Flags: None
	Line Number: 1059
*/
function function_abdb4498()
{
	level flag::set("boss_elemental_storm_cast_in_progress");
	self.var_cc5c4782 = 0;
	self thread function_e20da5e0();
	self function_1b20ff86(self.var_266e735f);
	var_c88619e2 = struct::get_array("cast_fx_ball");
	foreach(STR in var_c88619e2)
	{
		STR.model = util::spawn_model("tag_origin", STR.origin, STR.angles);
		STR.model thread clientfield::set("boss_elemental_storm_cast_fx", 1);
	}
	self.var_a2e9e777 notsolid();
	self notify("hash_ff6409a6");
	self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_elemental_charge_intro", "ai_zm_dlc1_archon_float_spell_elemental_charge_loop");
	foreach(STR in var_c88619e2)
	{
		STR.model thread clientfield::set("boss_elemental_storm_cast_fx", 0);
		wait(0.05);
		STR.model delete();
	}
	level flag::clear("boss_elemental_storm_cast_in_progress");
	level notify("hash_adcabea1");
	if(self.var_cc5c4782 > 0)
	{
		model = util::spawn_model("tag_origin", self.var_40b46e43.origin, self.var_40b46e43.angles);
		model clientfield::set("boss_elemental_storm_stunned_spikes_fx", 1);
		var_48d25fcc = self function_dc38a37e();
		model clientfield::set("boss_elemental_storm_stunned_spikes_fx", 0);
		model delete();
	}
	else
	{
		self function_39a8c4bd();
		var_48d25fcc = 0;
	}
	level flag::clear("pressure_pads_activated");
	return var_48d25fcc;
}

/*
	Name: function_e20da5e0
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x42A8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1109
*/
function function_e20da5e0()
{
	level endon("hash_adcabea1");
	level thread function_3fa7f11a();
	level flag::wait_till("pressure_pads_activated");
	self.var_cc5c4782++;
}

/*
	Name: function_842eab53
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4300
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1127
*/
function function_842eab53()
{
}

/*
	Name: function_3fa7f11a
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4310
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 1141
*/
function function_3fa7f11a()
{
	var_15ed352b = GetEntArray("grav_pad_trigger", "targetname");
	level.var_d19d5236 = 0;
	level.var_cddeb078 = [];
	structs = struct::get_array("waypoint_pressure");
	for(i = 0; i < structs.size; i++)
	{
		objective_add(22 + i, "active", structs[i].origin, istring("zm_waypoint_pressure"));
	}
	thread function_7c4d599b(structs, var_15ed352b);
	while(level flag::get("boss_elemental_storm_cast_in_progress"))
	{
		wait(0.05);
	}
	for(i = 0; i < structs.size; i++)
	{
		objective_delete(22 + i);
	}
}

/*
	Name: function_7c4d599b
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4498
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 1172
*/
function function_7c4d599b(structs, var_15ed352b)
{
	while(level.var_d19d5236 < var_15ed352b.size)
	{
		wait(0.05);
	}
	for(i = 0; i < structs.size; i++)
	{
		objective_delete(22 + i);
	}
	level flag::set("pressure_pads_activated");
	return;
	i++;
}

/*
	Name: function_e49e9c09
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4540
	Size: 0x360
	Parameters: 0
	Flags: None
	Line Number: 1197
*/
function function_e49e9c09()
{
	var_8ecbce0a = GetEnt(self.target, "targetname");
	var_8ecbce0a EnableLinkTo();
	var_4f15c74f = GetEnt(var_8ecbce0a.target, "targetname");
	var_4f15c74f EnableLinkTo();
	var_4f15c74f LinkTo(var_8ecbce0a);
	var_2e8e2853 = var_8ecbce0a.origin - VectorScale((0, 0, 1), 5);
	var_93f2a402 = var_8ecbce0a.origin;
	var_879d6e8a = 0;
	while(1)
	{
		self waittill("trigger", e_who);
		if(!level flag::get("boss_elemental_storm_cast_in_progress"))
		{
			wait(0.05);
			continue;
		}
		var_8ecbce0a moveto(var_2e8e2853, 0.25);
		playsoundatposition("evt_stone_plate_down", var_8ecbce0a.origin);
		var_8ecbce0a waittill("movedone");
		n_start_time = GetTime();
		n_end_time = n_start_time + 250;
		while(e_who istouching(self))
		{
			n_time = GetTime();
			if(n_time >= n_end_time)
			{
				level.var_d19d5236++;
				exploder::exploder("lgt_" + self.script_string);
				e_who PlayRumbleOnEntity("zm_castle_low_grav_panel_rumble");
				var_879d6e8a = 1;
				break;
			}
			wait(0.05);
		}
		if(var_879d6e8a && level flag::get("boss_elemental_storm_cast_in_progress"))
		{
			break;
		}
		var_8ecbce0a moveto(var_93f2a402, 0.5);
	}
	var_8ecbce0a SetModel("p7_zm_sha_pap_gear_pressure_plate_red_emissive");
	playsoundatposition("evt_stone_plate_up", var_8ecbce0a.origin);
	level waittill("hash_adcabea1");
	var_8ecbce0a SetModel("p7_zm_sha_pap_gear_pressure_plate_red");
	var_8ecbce0a moveto(var_93f2a402, 0.5);
	wait(1);
	self thread function_e49e9c09();
}

/*
	Name: function_dc38a37e
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x48A8
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 1258
*/
function function_dc38a37e()
{
	n_wait = getanimlength("ai_zm_dlc1_archon_float_spell_elemental_pain_hitspike");
	self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_elemental_pain_hitspike", "ai_zm_dlc1_archon_float_spell_elemental_pain_hitspike_idle");
	self.var_40b46e43 clientfield::set("boss_elemental_storm_stunned_keeper_fx", 1);
	self.var_40b46e43 clientfield::set("boss_weak_point_shader", 0);
	level flag::set("boss_stunned");
	self.var_40b46e43 playsound("zmb_keeper_vox_pain");
	self.var_40b46e43 solid();
	self thread function_eda57e8b();
	n_time_started = GetTime() / 1000;
	n_time_elapsed = 0;
	while(n_time_elapsed < 15)
	{
		n_time_current = GetTime() / 1000;
		n_time_elapsed = n_time_current - n_time_started;
		if(self.var_42433bc >= self.n_health)
		{
			if(level.var_bf34fcda <= 0)
			{
				level flag::set("boss_completed_early");
				return 1;
			}
			level flag::clear("boss_stunned");
			self.var_40b46e43 clientfield::set("boss_elemental_storm_stunned_keeper_fx", 0);
			self.var_40b46e43 clientfield::set("boss_weak_point_shader", 1);
			self.var_40b46e43 playsound("zmb_keeper_damaged");
			return 1;
		}
		wait(0.05);
	}
	level flag::clear("boss_stunned");
	self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_elemental_pain_hitspike_2_float");
	self.var_ee000bfc = self.var_ee000bfc - self.var_42433bc;
	wait(0.1);
	self.var_40b46e43 clientfield::set("boss_elemental_storm_stunned_keeper_fx", 0);
	self.var_40b46e43 clientfield::set("boss_weak_point_shader", 1);
	return 0;
}

/*
	Name: function_eda57e8b
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4B98
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1308
*/
function function_eda57e8b()
{
	self.var_40b46e43 setcandamage(1);
	while(level flag::get("boss_stunned"))
	{
		self.var_40b46e43 waittill("damage", n_damage, e_attacker);
		if(!(isdefined(e_attacker.var_5ace6d11) && e_attacker.var_5ace6d11) && isPlayer(e_attacker))
		{
			thread function_41b85b21(e_attacker);
		}
		level.var_bf34fcda = level.var_bf34fcda - n_damage;
		self.var_42433bc = self.var_42433bc + n_damage;
		self.var_ee000bfc = self.var_ee000bfc + n_damage;
	}
	self.var_40b46e43 setcandamage(0);
}

/*
	Name: function_41b85b21
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4CC0
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 1335
*/
function function_41b85b21(player)
{
	player.var_5ace6d11 = 1;
	player.hud_damagefeedback.alpha = 0;
	player.hud_damagefeedback SetShader("robit_hitmarker_death", 64, 64);
	player.hud_damagefeedback.color = (1, 1, 1);
	player.hud_damagefeedback ScaleOverTime(0.1, 32, 32);
	player.hud_damagefeedback.x = -32;
	player.hud_damagefeedback.y = -32;
	player.hud_damagefeedback MoveOverTime(0.1);
	player.hud_damagefeedback.x = -16;
	player.hud_damagefeedback.y = -16;
	player.hud_damagefeedback.alpha = 1;
	player.hud_damagefeedback fadeOverTime(0.9);
	player.hud_damagefeedback.alpha = 0;
	wait(0.9);
	player.var_5ace6d11 = 0;
	return 0;
}

/*
	Name: function_39a8c4bd
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4E80
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1365
*/
function function_39a8c4bd()
{
	level endon("hash_e991baf");
	self.var_40b46e43 thread function_a1658f19("ai_zm_dlc1_archon_float_spell_elemental_charge_outro");
	wait(1);
	exploder::exploder("fxexp_605");
	exploder::exploder("fxexp_606");
	self.var_40b46e43 playsound("zmb_keeper_storm_explo");
	var_9a7102d5 = GetEntArray("boss_elemental_storm_safe_area", "targetname");
	n_time_started = GetTime() / 1000;
	n_time_elapsed = 0;
	while(n_time_elapsed < 2)
	{
		n_time_current = GetTime() / 1000;
		n_time_elapsed = n_time_current - n_time_started;
		wait(0.05);
	}
	exploder::exploder_stop("fxexp_606");
	self.var_40b46e43 function_a1658f19();
	wait(0.5);
	self function_ca8445e1();
}

/*
	Name: function_1b1fe540
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x4FF8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1398
*/
function function_1b1fe540(var_70f504b7)
{
	if(!var_70f504b7)
	{
		self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_demongate_charge_intro", "ai_zm_dlc1_archon_float_spell_demongate_charge_loop");
		self.var_40b46e43 clientfield::set("boss_demongate_cast_fx", 1);
	}
}

/*
	Name: function_624b877f
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5068
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 1417
*/
function function_624b877f(var_70f504b7, var_39f71e77)
{
	if(!var_70f504b7)
	{
		wait(var_39f71e77);
		self.var_40b46e43 clientfield::set("boss_demongate_cast_fx", 0);
		level notify("hash_152946de");
		self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_demongate_deploy");
	}
	else
	{
		var_d0d6e681 = getanimlength("ai_zm_dlc1_archon_float_spell_demongate_charge_intro");
		wait(var_d0d6e681);
		level notify("hash_152946de");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_74d4ae55
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5128
	Size: 0x210
	Parameters: 1
	Flags: None
	Line Number: 1446
*/
function function_74d4ae55(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	self function_1b1fe540(var_70f504b7);
	switch(self.var_7e383b58)
	{
		case 1:
		{
			var_33efb6fa = 2;
			var_39f71e77 = 1.5;
			break;
		}
		case 3:
		case 5:
		{
			var_33efb6fa = 3;
			var_39f71e77 = 1.25;
			break;
		}
	}
	var_c4ceda7e = self.var_40b46e43 GetTagOrigin("tag_weapon_right");
	var_ea42537d = 0;
	for(i = 0; i < level.activePlayers.size; i++)
	{
		var_76ecb142 = 0;
		while(var_76ecb142 < var_33efb6fa)
		{
			if(!isdefined(self.var_29204bf[var_ea42537d]))
			{
				self thread function_36927923(var_c4ceda7e, level.activePlayers[i], var_ea42537d, undefined);
				var_76ecb142++;
			}
			else if(self.var_29204bf[var_ea42537d].var_552a692 === 0)
			{
				self thread function_36927923(var_c4ceda7e, level.activePlayers[i], var_ea42537d, self.var_29204bf[var_ea42537d]);
				var_76ecb142++;
			}
			var_ea42537d++;
			if(var_ea42537d >= 24)
			{
				break;
			}
			wait(0.05);
		}
	}
	self function_624b877f(var_70f504b7, var_39f71e77);
}

/*
	Name: function_a77c2ade
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5340
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 1507
*/
function function_a77c2ade(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	self function_1b1fe540(var_70f504b7);
	switch(self.var_7e383b58)
	{
		case 1:
		{
			var_33efb6fa = 1;
			var_39f71e77 = 1.5;
			break;
		}
		default
		{
			var_33efb6fa = 2;
			var_39f71e77 = 1.25;
			break;
		}
	}
	var_c4ceda7e = self.var_40b46e43 GetTagOrigin("tag_weapon_right");
	var_ea42537d = 0;
	var_76ecb142 = 0;
	var_91930983 = Array::random(level.activePlayers);
	while(var_76ecb142 < var_33efb6fa)
	{
		if(!isdefined(self.var_29204bf[var_ea42537d]))
		{
			self thread function_36927923(var_c4ceda7e, var_91930983, var_ea42537d, undefined);
			var_76ecb142++;
		}
		else if(self.var_29204bf[var_ea42537d].var_552a692 === 0)
		{
			self thread function_36927923(var_c4ceda7e, var_91930983, var_ea42537d, self.var_29204bf[var_ea42537d]);
			var_76ecb142++;
		}
		var_ea42537d++;
		if(var_ea42537d >= 4)
		{
			break;
		}
		wait(0.05);
	}
	self function_624b877f(var_70f504b7, var_39f71e77);
	return;
}

/*
	Name: function_36927923
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5540
	Size: 0x3A0
	Parameters: 4
	Flags: None
	Line Number: 1566
*/
function function_36927923(var_67eb721b, p_target, var_ea42537d, var_4a243bdd)
{
	level waittill("hash_152946de");
	if(!isdefined(var_4a243bdd))
	{
		var_ba9ce66e = util::spawn_anim_model("c_zom_chomper_boss", var_67eb721b, self.var_40b46e43.angles);
		var_ba9ce66e.e_mover = util::spawn_model("tag_origin", var_67eb721b, self.var_40b46e43.angles);
		var_ba9ce66e.e_mover EnableLinkTo();
		var_ba9ce66e LinkTo(var_ba9ce66e.e_mover);
		var_ba9ce66e.takedamage = 1;
		self.var_29204bf[var_ea42537d] = var_ba9ce66e;
	}
	else
	{
		var_ba9ce66e = var_4a243bdd;
		var_ba9ce66e.e_mover.origin = var_67eb721b;
		var_ba9ce66e show();
	}
	wait(0.05);
	var_ba9ce66e.e_mover thread scene::Play("ai_zm_dlc1_chomper_boss_locomotion", var_ba9ce66e);
	var_ba9ce66e.var_552a692 = 1;
	var_ba9ce66e solid();
	var_ba9ce66e clientfield::set("boss_demongate_chomper_fx", 1);
	var_ba9ce66e thread function_2cef3631();
	var_ba9ce66e.e_mover.origin = var_ba9ce66e.e_mover.origin + (0, 0, randomIntRange(Int(-51.2), Int(51.2)));
	var_ba9ce66e.e_mover.angles = (var_ba9ce66e.e_mover.angles[0] + randomIntRange(-30, 30), var_ba9ce66e.e_mover.angles[1] + randomIntRange(-45, 45), var_ba9ce66e.e_mover.angles[2]);
	v_goto = var_ba9ce66e.e_mover.origin + AnglesToForward(var_ba9ce66e.e_mover.angles) * 128;
	var_ba9ce66e.e_mover moveto(v_goto, 0.6, 0.36, 0.12);
	wait(0.6);
	var_ba9ce66e function_30e15c1e(p_target);
}

/*
	Name: function_e5dafbe3
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x58E8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1608
*/
function function_e5dafbe3()
{
	self.var_552a692 = 0;
	self clientfield::set("boss_demongate_chomper_fx", 0);
	wait(0.25);
	self.e_mover moveto(self.origin, 0.1);
	wait(0.15);
	self.e_mover.origin = self.origin - VectorScale((0, 0, 1), 1000);
	self.e_mover scene::stop();
	self notsolid();
	self notify("hash_38c87755");
}

/*
	Name: function_30e15c1e
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x59C0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1631
*/
function function_30e15c1e(p_target)
{
	self endon("hash_38c87755");
	if(isdefined(p_target) && (!(isdefined(p_target laststand::player_is_in_laststand()) && p_target laststand::player_is_in_laststand())))
	{
		self.var_4288770f = p_target;
	}
	else
	{
		self function_7574c93e();
	}
	if(isdefined(self.var_4288770f))
	{
		self function_7398c59d();
	}
	else
	{
		self function_e5dafbe3();
	}
}

/*
	Name: function_7574c93e
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5A78
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1662
*/
function function_7574c93e()
{
	self endon("hash_38c87755");
	self.var_4288770f = undefined;
	var_237d778f = ArraySortClosest(level.players, self.origin, level.players.size);
	if(var_237d778f.size)
	{
		n_index = 0;
		while(!isdefined(self.var_4288770f) && n_index < var_237d778f.size)
		{
			if(isdefined(var_237d778f[n_index]) && (!(isdefined(var_237d778f[n_index] laststand::player_is_in_laststand()) && var_237d778f[n_index] laststand::player_is_in_laststand())) && isalive(var_237d778f[n_index]))
			{
				var_9183256c = var_237d778f[n_index];
				self.var_4288770f = var_9183256c;
				wait(0.05);
			}
			else
			{
				n_index++;
				wait(0.05);
			}
		}
	}
}

/*
	Name: function_7398c59d
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5BB8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1697
*/
function function_7398c59d()
{
	self endon("hash_38c87755");
	self function_9a0bf5f4();
	if(isdefined(self.var_4288770f) && isalive(self.var_4288770f) && (!(isdefined(self.var_4288770f laststand::player_is_in_laststand()) && self.var_4288770f laststand::player_is_in_laststand())))
	{
		self clientfield::increment("boss_demongate_chomper_bite_fx", 1);
		if(level.var_1a4b8a19)
		{
			n_damage = 50;
		}
		else
		{
			n_damage = 25;
		}
		self.var_4288770f DoDamage(n_damage, self.origin, self);
	}
	else
	{
		self thread function_30e15c1e();
		return;
	}
	self function_e5dafbe3();
}

/*
	Name: function_9a0bf5f4
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5CF0
	Size: 0x300
	Parameters: 0
	Flags: None
	Line Number: 1732
*/
function function_9a0bf5f4()
{
	self endon("hash_38c87755");
	var_b710c4e5 = self.var_4288770f GetEye();
	n_dist = DistanceSquared(self.origin, var_b710c4e5);
	var_e5e24312 = 1;
	var_4e26e12a = -1;
	var_ba9ce66e = self.e_mover;
	while(n_dist > 2304 && isdefined(self.var_4288770f) && isalive(self.var_4288770f) && !self.var_4288770f laststand::player_is_in_laststand())
	{
		var_b710c4e5 = self.var_4288770f GetEye();
		n_time = sqrt(n_dist) / 196;
		var_5d76b65c = 1 / var_e5e24312;
		var_ef096040 = VectorScale((0, 0, 1), 160) * var_5d76b65c;
		var_c5a0d28e = AnglesToRight(VectorToAngles(var_b710c4e5 - var_ba9ce66e.origin)) * 256;
		var_c5a0d28e = var_c5a0d28e * var_5d76b65c;
		var_c5a0d28e = var_c5a0d28e * var_4e26e12a;
		var_74490e48 = var_b710c4e5 + var_c5a0d28e + var_ef096040;
		var_ba9ce66e moveto(var_74490e48, n_time, 0, 0);
		var_ba9ce66e RotateTo(VectorToAngles(var_74490e48 - var_ba9ce66e.origin), n_time * 0.5, n_time * 0.5);
		n_time = n_time * 0.3;
		n_time = n_time;
		wait(n_time);
		var_e5e24312++;
		n_dist = DistanceSquared(var_ba9ce66e.origin, var_b710c4e5);
	}
	if(isdefined(self.var_4288770f) && isalive(self.var_4288770f) && !self.var_4288770f laststand::player_is_in_laststand())
	{
		var_ba9ce66e.origin = var_b710c4e5;
		return;
	}
}

/*
	Name: function_2cef3631
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x5FF8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1775
*/
function function_2cef3631()
{
	level endon("_zombie_game_over");
	self endon("hash_38c87755");
	for(var_b5f846f3 = 0; var_b5f846f3 < level.var_de21b83b; var_b5f846f3++)
	{
		self waittill("damage", n_damage, e_attacker);
	}
	self function_e5dafbe3();
}

/*
	Name: function_379868a6
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x6080
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1796
*/
function function_379868a6(var_70f504b7)
{
	if(!var_70f504b7)
	{
		self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_runeprison_charge_intro", "ai_zm_dlc1_archon_float_spell_runeprison_charge_loop");
	}
	else
	{
		var_ab274f52 = getanimlength("ai_zm_dlc1_archon_float_spell_runeprison_charge_intro");
		wait(var_ab274f52);
	}
}

/*
	Name: function_78d09fbd
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x60F8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1819
*/
function function_78d09fbd(var_70f504b7)
{
	if(!var_70f504b7)
	{
		switch(self.var_7e383b58)
		{
			case 1:
			{
				wait(1.5);
				break;
			}
			case 3:
			case 5:
			{
				wait(1.25);
				break;
			}
		}
		self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_runeprison_deploy");
		level notify("hash_2d0d7f9c");
	}
	else
	{
		var_e6e938b9 = getanimlength("ai_zm_dlc1_archon_float_spell_runeprison_deploy");
		wait(var_e6e938b9);
		level notify("hash_2d0d7f9c");
	}
}

/*
	Name: function_f6b53f16
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x61C8
	Size: 0x400
	Parameters: 1
	Flags: None
	Line Number: 1858
*/
function function_f6b53f16(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	self function_379868a6(var_70f504b7);
	var_eafe595f = 0;
	for(i = 0; i < level.players.size; i++)
	{
		v_target = GetClosestPointOnNavMesh(level.players[i].origin + VectorScale((1, 1, 0), 128), 384);
		if(isdefined(v_target))
		{
			if(!self.var_92904d31[var_eafe595f].var_552a692)
			{
				self.var_92904d31[var_eafe595f].origin = v_target;
				self.var_92904d31[var_eafe595f] move_away_from_edges();
				self.var_92904d31[var_eafe595f] thread function_ad721cc0();
			}
		}
		v_target = GetClosestPointOnNavMesh(level.players[i].origin + VectorScale((1, 0, 0), 192), 384);
		if(isdefined(v_target))
		{
			if(!self.var_92904d31[var_eafe595f + 1].var_552a692)
			{
				self.var_92904d31[var_eafe595f + 1].origin = v_target;
				self.var_92904d31[var_eafe595f + 1] move_away_from_edges();
				self.var_92904d31[var_eafe595f + 1] thread function_ad721cc0();
			}
		}
		v_target = GetClosestPointOnNavMesh(level.players[i].origin + VectorScale((1, -1, 0), 128), 384);
		if(isdefined(v_target))
		{
			if(!self.var_92904d31[var_eafe595f + 2].var_552a692)
			{
				self.var_92904d31[var_eafe595f + 2].origin = v_target;
				self.var_92904d31[var_eafe595f + 2] move_away_from_edges();
				self.var_92904d31[var_eafe595f + 2] thread function_ad721cc0();
			}
		}
		v_target = GetClosestPointOnNavMesh(level.players[i].origin + (-128, -96, 0), 384);
		if(isdefined(v_target))
		{
			if(!self.var_92904d31[var_eafe595f + 3].var_552a692)
			{
				self.var_92904d31[var_eafe595f + 3].origin = v_target;
				self.var_92904d31[var_eafe595f + 3] move_away_from_edges();
				self.var_92904d31[var_eafe595f + 3] thread function_ad721cc0();
			}
		}
		var_eafe595f = var_eafe595f + 4;
	}
	wait(0.05);
	self function_78d09fbd(var_70f504b7);
}

/*
	Name: function_93570bbc
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x65D0
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 1924
*/
function function_93570bbc(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	self function_379868a6(var_70f504b7);
	var_eafe595f = 0;
	var_91930983 = Array::random(level.activePlayers);
	v_target = GetClosestPointOnNavMesh(var_91930983.origin + VectorScale((1, 1, 0), 128), 384);
	if(isdefined(v_target))
	{
		if(!self.var_92904d31[var_eafe595f].var_552a692)
		{
			self.var_92904d31[var_eafe595f].origin = v_target;
			self.var_92904d31[var_eafe595f] move_away_from_edges();
			self.var_92904d31[var_eafe595f] thread function_ad721cc0();
		}
	}
	v_target = GetClosestPointOnNavMesh(var_91930983.origin + VectorScale((1, 0, 0), 192), 384);
	if(isdefined(v_target))
	{
		if(!self.var_92904d31[var_eafe595f + 1].var_552a692)
		{
			self.var_92904d31[var_eafe595f + 1].origin = v_target;
			self.var_92904d31[var_eafe595f + 1] move_away_from_edges();
			self.var_92904d31[var_eafe595f + 1] thread function_ad721cc0();
		}
	}
	v_target = GetClosestPointOnNavMesh(var_91930983.origin + VectorScale((1, -1, 0), 128), 384);
	if(isdefined(v_target))
	{
		if(!self.var_92904d31[var_eafe595f + 2].var_552a692)
		{
			self.var_92904d31[var_eafe595f + 2].origin = v_target;
			self.var_92904d31[var_eafe595f + 2] move_away_from_edges();
			self.var_92904d31[var_eafe595f + 2] thread function_ad721cc0();
		}
	}
	wait(0.05);
	self function_78d09fbd(var_70f504b7);
}

/*
	Name: function_45988f28
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x68C0
	Size: 0x638
	Parameters: 1
	Flags: None
	Line Number: 1977
*/
function function_45988f28(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	self function_379868a6(var_70f504b7);
	self.var_92904d31[0].origin = GetClosestPointOnNavMesh((-2616, 6976, -255), 384);
	self.var_92904d31[0] move_away_from_edges();
	self.var_92904d31[1].origin = GetClosestPointOnNavMesh((-2688, 6720, -255), 384);
	self.var_92904d31[1] move_away_from_edges();
	self.var_92904d31[2].origin = GetClosestPointOnNavMesh((-2880, 6592, -255), 384);
	self.var_92904d31[2] move_away_from_edges();
	self.var_92904d31[3].origin = GetClosestPointOnNavMesh((-3136, 6592, -255), 384);
	self.var_92904d31[3] move_away_from_edges();
	self.var_92904d31[4].origin = GetClosestPointOnNavMesh((-3328, 6720, -255), 384);
	self.var_92904d31[4] move_away_from_edges();
	self.var_92904d31[5].origin = GetClosestPointOnNavMesh((-3400, 6976, -255), 384);
	self.var_92904d31[5] move_away_from_edges();
	self.var_92904d31[6].origin = GetClosestPointOnNavMesh((-3328, 7232, -255), 384);
	self.var_92904d31[6] move_away_from_edges();
	self.var_92904d31[7].origin = GetClosestPointOnNavMesh((-3072, 7400, -255), 384);
	self.var_92904d31[7] move_away_from_edges();
	self.var_92904d31[8].origin = GetClosestPointOnNavMesh((-2944, 7400, -255), 384);
	self.var_92904d31[8] move_away_from_edges();
	self.var_92904d31[9].origin = GetClosestPointOnNavMesh((-2688, 7232, -255), 384);
	self.var_92904d31[9] move_away_from_edges();
	self.var_92904d31[10].origin = GetClosestPointOnNavMesh((-2616, 6824, -255), 384);
	self.var_92904d31[10] move_away_from_edges();
	self.var_92904d31[11].origin = GetClosestPointOnNavMesh((-3008, 6512, -255), 384);
	self.var_92904d31[11] move_away_from_edges();
	self.var_92904d31[12].origin = GetClosestPointOnNavMesh((-3432, 6816, -255), 384);
	self.var_92904d31[12] move_away_from_edges();
	self.var_92904d31[13].origin = GetClosestPointOnNavMesh((-3264, 7360, -255), 384);
	self.var_92904d31[13] move_away_from_edges();
	self.var_92904d31[14].origin = GetClosestPointOnNavMesh((-2752, 7360, -255), 384);
	self.var_92904d31[14] move_away_from_edges();
	wait(0.05);
	for(i = 0; i < self.var_92904d31.size; i++)
	{
		self.var_92904d31[i] thread function_ad721cc0();
	}
	self function_78d09fbd(var_70f504b7);
}

/*
	Name: function_ad721cc0
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x6F00
	Size: 0x250
	Parameters: 0
	Flags: None
	Line Number: 2032
*/
function function_ad721cc0()
{
	self thread clientfield::set("boss_rune_prison_erupt_fx", 1);
	level waittill("hash_2d0d7f9c");
	self thread clientfield::set("boss_rune_prison_erupt_fx", 0);
	self.var_552a692 = 1;
	self solid();
	wait(0.05);
	self thread clientfield::set("boss_rune_prison_rock_fx", 1);
	self thread function_49bf49de();
	wait(0.2);
	n_time_started = GetTime() / 1000;
	n_time_elapsed = 0;
	while(n_time_elapsed < 5)
	{
		n_time_current = GetTime() / 1000;
		n_time_elapsed = n_time_current - n_time_started;
		foreach(player in level.players)
		{
			var_6e2679f8 = (player.origin[0], player.origin[1], 0);
			var_75f2c6b7 = (self.origin[0], self.origin[1], 0);
			if(DistanceSquared(var_6e2679f8, var_75f2c6b7) < 2304)
			{
				self thread function_3995b832(player);
				return;
			}
		}
		if(self.var_43030eb5)
		{
			break;
		}
		wait(0.05);
	}
	self function_c20e4083();
}

/*
	Name: function_3995b832
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x7158
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 2078
*/
function function_3995b832(player)
{
	level endon("_zombie_game_over");
	self clientfield::set("boss_rune_prison_explode_fx", 1);
	player thread burnplayer::SetPlayerBurning(0.5, 0.25, 12.5, player, undefined);
	if(level.var_1a4b8a19)
	{
		n_damage = 50;
	}
	else
	{
		n_damage = 25;
	}
	player DoDamage(n_damage, player.origin, player);
	player clientfield::set("boss_rune_prison_dot_fx", 1);
	wait(0.5);
	player clientfield::set("boss_rune_prison_dot_fx", 0);
	self function_c20e4083();
	self notify("hash_a2b2e823");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_49bf49de
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x7290
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2111
*/
function function_49bf49de()
{
	level endon("_zombie_game_over");
	self endon("hash_a2b2e823");
	self.var_43030eb5 = 0;
	for(var_b5f846f3 = 0; var_b5f846f3 < level.var_de21b83b; var_b5f846f3++)
	{
		self waittill("damage", n_damage, e_attacker);
	}
	self.var_43030eb5 = 1;
}

/*
	Name: function_c20e4083
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x7318
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2133
*/
function function_c20e4083()
{
	self thread clientfield::set("boss_rune_prison_rock_fx", 0);
	wait(0.75);
	self.var_552a692 = 0;
	self notsolid();
	self.origin = self.origin + VectorScale((0, 0, -1), 1000);
	self notify("hash_a2b2e823");
}

/*
	Name: function_db1c6f68
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x7398
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 2153
*/
function function_db1c6f68(var_70f504b7)
{
	if(!isdefined(var_70f504b7))
	{
		var_70f504b7 = 0;
	}
	level endon("hash_e991baf");
	if(!var_70f504b7)
	{
		self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_wolfhowl_charge_intro", "ai_zm_dlc1_archon_float_spell_wolfhowl_charge_loop");
	}
	var_85436420 = self.var_40b46e43.origin;
	for(i = 0; i < 2; i++)
	{
		switch(i)
		{
			case 0:
			{
				var_15e88aa5 = var_85436420 + VectorScale((1, 1, 0), 32);
				break;
			}
			case 1:
			{
				var_15e88aa5 = var_85436420 + VectorScale((1, -1, 0), 32);
				break;
			}
		}
		if(i < 2)
		{
			var_15e88aa5 = GetClosestPointOnNavMesh(var_15e88aa5, 200);
			self.var_9680b225[i].origin = var_15e88aa5;
			self.var_9680b225[i] move_away_from_edges();
		}
	}
	var_ab34fc8e = 0;
	if(self.var_7e383b58 == 3)
	{
		var_3cf40dd7 = 8;
		var_90aa6e9 = 8;
	}
	else
	{
		var_3cf40dd7 = 6;
		var_90aa6e9 = 8;
	}
	if(level.var_1a4b8a19 || level.var_2b421938 == 1)
	{
		var_3cf40dd7 = var_3cf40dd7 - 2;
		var_90aa6e9 = 6;
	}
	if(!var_70f504b7)
	{
		wait(1.5);
		self.var_40b46e43 function_a1658f19("ai_zm_dlc1_archon_float_spell_wolfhowl_deploy");
	}
}

/*
	Name: move_away_from_edges
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x75D0
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 2220
*/
function move_away_from_edges()
{
	v_orig = self.origin;
	n_angles = self.angles;
	queryResult = PositionQuery_Source_Navigation(self.origin, 0, 200, 100, 2, 26);
	if(queryResult.data.size)
	{
		foreach(point in queryResult.data)
		{
			if(BulletTracePassed(point.origin + VectorScale((0, 0, 1), 20), v_orig + VectorScale((0, 0, 1), 20), 0, self, undefined, 0, 0))
			{
				self.origin = point.origin;
				self.angles = n_angles;
				break;
			}
		}
	}
}

/*
	Name: function_20559b9e
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x7738
	Size: 0x358
	Parameters: 2
	Flags: None
	Line Number: 2249
*/
function function_20559b9e(s_spawn_point, var_f328e82)
{
	if(level.round_number < 25)
	{
		ai_zombie = zombie_utility::spawn_zombie(var_f328e82[0], "spell_stage_zombie", s_spawn_point, 25);
	}
	else
	{
		ai_zombie = zombie_utility::spawn_zombie(var_f328e82[0], "spell_stage_zombie", s_spawn_point, level.round_number);
	}
	if(isdefined(ai_zombie))
	{
		ai_zombie thread function_2777756a();
		ai_zombie SetGoal(ai_zombie.origin);
		ai_zombie PathMode("move allowed");
		ai_zombie.script_string = "find_flesh";
		ai_zombie.zombie_think_done = 1;
		ai_zombie.is_elemental_zombie = 1;
		ai_zombie.no_gib = 1;
		ai_zombie.canDamage = 1;
		ai_zombie.is_zombie = 1;
		ai_zombie.deathpoints_already_given = 1;
		ai_zombie.no_damage_points = 1;
		ai_zombie.exclude_distance_cleanup_adding_to_total = 1;
		ai_zombie.exclude_cleanup_adding_to_total = 1;
		ai_zombie.heroweapon_kill_power = 4;
		ai_zombie.sword_kill_power = 4;
		ai_zombie.no_powerups = 1;
		util::wait_network_frame();
		ai_zombie.maxhealth = Int(level.var_74b7ddca);
		ai_zombie.health = ai_zombie.maxhealth;
		n_roll = RandomInt(10);
		if(n_roll <= 6)
		{
			ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
		}
		else
		{
			ai_zombie zombie_utility::set_zombie_run_cycle("run");
		}
		if(isdefined(ai_zombie) && ai_zombie.archetype === "zombie")
		{
			ai_zombie.animName = "zombie";
			ai_zombie thread zm_spawner::play_ambient_zombie_vocals();
			ai_zombie thread zm_audio::zmbAIVox_NotifyConvert();
			ai_zombie.zmb_vocals_attack = "zmb_vocals_zombie_attack";
			ai_zombie zombie_utility::delayed_zombie_eye_glow();
		}
		return ai_zombie;
	}
	return undefined;
}

/*
	Name: function_369525ff
	Namespace: namespace_b1bc995c
	Checksum: 0x424F4353
	Offset: 0x7A98
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 2312
*/
function function_369525ff()
{
	ai_zombie = self;
	if(!isdefined(ai_zombie) || ai_zombie.nuked === 1 || ai_zombie.archetype !== "zombie")
	{
		return;
	}
	if(IsActor(ai_zombie))
	{
		ai_zombie zombie_utility::zombie_eye_glow_stop();
		GibServerUtils::Annihilate(ai_zombie);
	}
}

