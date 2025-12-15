#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_clientdvar;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\charindex;
#include scripts\zm\motherfucker;

#namespace namespace_75eda680;

/*
	Name: init
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x6A8
	Size: 0x2D8
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec init()
{
	players = GetDvarInt("com_maxclients");
	if(GetDvarString("cg_unlockall_loot") != "")
	{
		thread function_1f7b6905();
	}
	if(players >= 5)
	{
		MapName = GetDvarString("mapname");
		for(i = 4; i < players; i++)
		{
			if(MapName == "zm_pot_noahj" || MapName == "zm_moon" || MapName == "zm_tomb" || MapName == "zm_stalingrad" || MapName == "zm_genesis")
			{
				clientfield::register("world", "player" + i + "wearableItem", 21000, 5, "int");
			}
			if(MapName == "zm_tomb")
			{
				clientfield::register("world", "player" + i + "hasItem", 21000, 2, "int");
			}
			if(MapName == "zm_castle")
			{
				clientfield::register("world", "player" + i + "hasItem", 1, 1, "int");
			}
			if(MapName == "zm_leviathan")
			{
				RegisterClientField("world", "player" + i + "wearableItem", 1, 4, "int");
				RegisterClientField("world", "player" + i + "hasItem", 1, 4, "int");
			}
		}
		thread function_ed7995b4();
		if(MapName == "zm_asylum")
		{
			callback::on_spawned(&function_e2614caa);
		}
		charIndex::init();
		return;
	}
}

/*
	Name: function_1f7b6905
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function function_1f7b6905()
{
	for(;;)
	{
		SetDvar("com_maxclients", GetDvarInt("aae_boiii_maxplayers"));
		wait(0.048);
	}
}

/*
	Name: function_e2614caa
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 94
*/
function function_e2614caa()
{
	if(level clientfield::get("sndZMBFadeIn") != 1)
	{
		wait(0.2);
		points = struct::get_array("initial_spawn_points", "targetname");
		self SetOrigin(points[self.characterindex].origin);
	}
}

/*
	Name: function_887cf2c0
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0xA68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function function_887cf2c0()
{
}

/*
	Name: function_ed7995b4
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0xA78
	Size: 0xB98
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function function_ed7995b4()
{
	wait(0.1);
	MapName = GetDvarString("mapname");
	level.func_get_zombie_spawn_delay = &get_zombie_spawn_delay;
	if(MapName == "zm_castle")
	{
		thread function_86854473();
		for(i = 4; i < GetDvarInt("com_maxclients"); i++)
		{
			level.struct_class_names["targetname"]["boss_start_tele_point"][i] = level.struct_class_names["targetname"]["boss_start_tele_point"][i - 4];
			level.struct_class_names["targetname"]["boss_complete_tele_point"][i] = level.struct_class_names["targetname"]["boss_complete_tele_point"][i - 4];
			level.struct_class_names["targetname"]["past_laboratory_telepoints"][i] = level.struct_class_names["targetname"]["past_laboratory_telepoints"][i - 4];
			level.struct_class_names["targetname"]["teleport_room_pos"][i] = level.struct_class_names["targetname"]["teleport_room_pos"][i - 4];
			level.struct_class_names["targetname"]["pf9292_auto1"][i] = level.struct_class_names["targetname"]["pf9292_auto1"][i - 4];
			level.struct_class_names["targetname"]["pf9292_auto2"][i] = level.struct_class_names["targetname"]["pf9292_auto2"][i - 4];
		}
	}
	else if(MapName == "zm_island")
	{
		callback::on_connect(&function_c3da47f9);
	}
	if(MapName == "zm_stalingrad")
	{
		for(i = 4; i < GetDvarInt("com_maxclients"); i++)
		{
			level.struct_class_names["targetname"]["gauntlet_bgb_teleport_" + i] = level.struct_class_names["targetname"]["gauntlet_bgb_teleport_" + i - 4];
			level.struct_class_names["targetname"]["s_pavlov_player"][i] = level.struct_class_names["targetname"]["s_pavlov_player"][i - 4];
		}
		level.var_e66ebd0c = Array(18, 20, 22, 24, 24, 24, 24, 24, 24, 24);
		level.var_8447be11 = Array(1, 1, 2, 2, 2, 2, 2, 2, 2, 2);
		level.var_ce49fa61 = Array(10000, 13000, 16000, 19000, 22000, 22000, 22000, 22000, 22000, 22000);
	}
	if(MapName == "zm_genesis")
	{
		for(i = 4; i < GetDvarInt("com_maxclients"); i++)
		{
			level.struct_class_names["targetname"]["t_teleport_pad_ee"][i] = level.struct_class_names["targetname"]["t_teleport_pad_ee"][i - 4];
			level.struct_class_names["targetname"]["dark_arena_teleport_hijack"][i] = level.struct_class_names["targetname"]["dark_arena_teleport_hijack"][i - 4];
			level.struct_class_names["script_noteworthy"]["sams_room_pos"][i] = level.struct_class_names["script_noteworthy"]["sams_room_pos"][i - 4];
		}
	}
	else if(isdefined(level.struct_class_names["targetname"]["tele_room_org"]) && level.struct_class_names["targetname"]["tele_room_org"].size != 0)
	{
		for(i = level.struct_class_names["targetname"]["tele_room_org"].size; i < GetDvarInt("com_maxclients"); i++)
		{
			level.struct_class_names["targetname"]["tele_room_org"][i] = level.struct_class_names["targetname"]["tele_room_org"][i - level.struct_class_names["targetname"]["tele_room_org"].size];
		}
	}
	else if(isdefined(level.struct_class_names["targetname"]["mainframe_org"]) && level.struct_class_names["targetname"]["mainframe_org"].size != 0)
	{
		for(i = level.struct_class_names["targetname"]["mainframe_org"].size; i < GetDvarInt("com_maxclients"); i++)
		{
			level.struct_class_names["targetname"]["mainframe_org"][i] = level.struct_class_names["targetname"]["mainframe_org"][i - level.struct_class_names["targetname"]["mainframe_org"].size];
		}
	}
	for(i = 0; i < 4; i++)
	{
		var_70a237dd = GetEnt("origin_teleport_player_" + i, "targetname");
		if(isdefined(var_70a237dd))
		{
			var_52ea7b94 = spawn(var_70a237dd.classname, var_70a237dd.origin + VectorScale((1, 1, 1), 4), 0, 15, 72);
			var_52ea7b94.targetname = "origin_teleport_player_" + i + 4;
		}
		var_cf6f39de = GetEnt("teleport_room_" + i, "targetname");
		if(isdefined(var_cf6f39de))
		{
			var_b6752dfb = spawn(var_cf6f39de.classname, var_cf6f39de.origin + VectorScale((1, 1, 1), 4), 0, 15, 72);
			var_b6752dfb.targetname = "teleport_room_" + i + 4;
		}
	}
	var_70a237dd = GetEnt("origin_teleport_player_0", "targetname");
	if(isdefined(var_70a237dd))
	{
		var_52ea7b94 = spawn(var_70a237dd.classname, var_70a237dd.origin + VectorScale((1, 1, 1), 4), 0, 15, 72);
		var_52ea7b94.targetname = "origin_teleport_player_8";
	}
	var_70a237dd = GetEnt("origin_teleport_player_1", "targetname");
	if(isdefined(var_70a237dd))
	{
		var_52ea7b94 = spawn(var_70a237dd.classname, var_70a237dd.origin + VectorScale((1, 1, 1), 4), 0, 15, 72);
		var_52ea7b94.targetname = "origin_teleport_player_9";
	}
	var_cf6f39de = GetEnt("teleport_room_" + i, "targetname");
	if(isdefined(var_cf6f39de))
	{
		var_b6752dfb = spawn(var_cf6f39de.classname, var_cf6f39de.origin + VectorScale((1, 1, 1), 4), 0, 15, 72);
		var_b6752dfb.targetname = "teleport_room_8";
	}
	var_cf6f39de = GetEnt("teleport_room_" + i, "targetname");
	if(isdefined(var_cf6f39de))
	{
		var_b6752dfb = spawn(var_cf6f39de.classname, var_cf6f39de.origin + VectorScale((1, 1, 1), 4), 0, 15, 72);
		var_b6752dfb.targetname = "teleport_room_9";
	}
	if(GetDvarString("elmg_cheats") != "1")
	{
		thread function_a51f392d();
	}
	level flag::wait_till("initial_blackscreen_passed");
	thread function_c5a7f907();
	level.player_name_directive = [];
	for(i = 0; i < GetDvarInt("com_maxclients"); i++)
	{
		level.player_name_directive[i] = "[{player_name_" + i + "}]";
	}
}

/*
	Name: function_c5a7f907
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x1618
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 246
*/
function function_c5a7f907()
{
	if(level.script == "zm_zod")
	{
		level.zombie_weapons[GetWeapon("octobomb")].is_in_box = 0;
		level.zombie_weapons[GetWeapon("tesla_gun")].is_in_box = 0;
	}
	if(level.script == "zm_castle" || level.script == "zm_stalingrad" || level.script == "zm_zod")
	{
		level.zombie_weapons[GetWeapon("ray_gun")].is_in_box = 0;
	}
	if(level.script == "zm_stalingrad")
	{
		level.zombie_weapons[GetWeapon("raygun_mark3")].is_in_box = 0;
		level.zombie_weapons[GetWeapon("k7_raygun_mark3")].is_in_box = 0;
		level.zombie_weapons[GetWeapon("launcher_multi")].is_in_box = 0;
		level.zombie_weapons[GetWeapon("special_crossbow_dw")].is_in_box = 0;
	}
}

/*
	Name: function_a51f392d
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x17D0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 276
*/
function function_a51f392d()
{
	modvar("zm_player", "");
	modvar("zm_dog", "");
	for(;;)
	{
		function_b3b2c14b();
		wait(0.05);
	}
}

/*
	Name: function_b3b2c14b
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x1838
	Size: 0x890
	Parameters: 0
	Flags: None
	Line Number: 297
*/
function function_b3b2c14b()
{
	if(GetDvarString("zm_player") != "")
	{
		level.zombie_vars["zombie_ai_per_player"] = GetDvarInt("zm_player");
		IPrintLnBold(&"ELMG_ZM_PLAYER", level.zombie_vars["zombie_ai_per_player"]);
		SetDvar("zm_player", "");
	}
	if(GetDvarString("zm_dog") != "")
	{
		level.zombie_vars["dog_spawn_per_player"] = GetDvarInt("zm_dog");
		IPrintLnBold("Total number of dogs per player sets to ^5", level.zombie_vars["dog_spawn_per_player"]);
		SetDvar("zm_dog", "");
	}
	if(GetDvarString("tp") != "")
	{
		string = GetDvarString("tp");
		var_cde9f622 = StrTok(string, " ");
		guy1 = ToLower(var_cde9f622[1]);
		guy0 = ToLower(var_cde9f622[0]);
		i = Int(guy0);
		i--;
		player0 = Motherfucker::function_4800e2e4(i);
		i = Int(guy1);
		i--;
		player1 = Motherfucker::function_4800e2e4(i);
		if(!isdefined(player0) || !isdefined(player1) || player1 == player0)
		{
			IPrintLnBold("This path will never cross-");
		}
		else
		{
			player0 thread Motherfucker::function_d3ee1304(player1.origin, player1.angles);
			IPrintLnBold("^1", player0.name, " ^7Teleporter to ^2", player1.name);
		}
		SetDvar("tp", "");
	}
	if(GetDvarString("tp2") != "")
	{
		i = Int(GetDvarString("tp2"));
		i--;
		pos = Motherfucker::function_4800e2e4(i);
		if(!isdefined(pos))
		{
			IPrintLnBold("This path will never cross-");
		}
		else
		{
			foreach(player in level.players)
			{
				if(player != pos)
				{
					player thread Motherfucker::function_d3ee1304(pos.origin, pos.angles);
				}
			}
			IPrintLnBold("^1Everyone ^7Teleport to ^2", pos.name);
		}
		SetDvar("tp2", "");
	}
	dvar = GetDvarString("link");
	if(dvar != "")
	{
		switch(dvar)
		{
			case "0":
			{
				IPrintLnBold("Everyone Unlink");
				level.var_4410e35d = undefined;
				foreach(player in level.players)
				{
					if(player GetEntityNumber() != 0)
					{
						player Unlink();
					}
					player SetPlayerCollision(1);
					player show();
				}
				break;
			}
			case "1":
			{
				IPrintLnBold("Everyone Linkto Host");
				host = function_ecea1802();
				foreach(player in level.players)
				{
					if(player != host)
					{
						player playerLinkTo(host);
					}
				}
				break;
			}
			case "2":
			{
				IPrintLnBold("SetPlayerCollision");
				if(isdefined(level.var_4410e35d))
				{
					level.var_4410e35d = undefined;
					foreach(player in level.players)
					{
						player show();
						player SetPlayerCollision(1);
					}
				}
				else
				{
					level.var_4410e35d = 1;
					foreach(player in level.players)
					{
						player Hide();
						player SetPlayerCollision(0);
					}
					break;
				}
			}
		}
		SetDvar("link", "");
	}
}

/*
	Name: function_c3da47f9
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x20D0
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 427
*/
function function_c3da47f9()
{
	self endon("disconnect");
	self endon("death");
	level endon("hash_c21b52e7");
	level flag::wait_till("trilogy_released");
	while(self namespace_93b7f03::validation() && self JumpButtonPressed() && isdefined(level.var_c003f5b) && self GetCurrentWeapon() == level.var_c003f5b && zm_utility::is_player_valid(self))
	{
		self namespace_93b7f03::activation();
		while(self JumpButtonPressed())
		{
			wait(0.048);
		}
		wait(0.048);
	}
}

/*
	Name: function_86854473
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x21E0
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 454
*/
function function_86854473()
{
	thread function_123d9cfd();
	for(;;)
	{
		wait(0.1);
		foreach(player in level.activePlayers)
		{
			weapons = player getweaponslistprimaries();
			foreach(weapon in weapons)
			{
				if(IsSubStr(weapon.name, "bow_storm"))
				{
					if(!isdefined(level.var_4329abbd))
					{
						level.var_4329abbd = player getXuid(1);
					}
					if(isdefined(level.var_4329abbd))
					{
						if(level.var_4329abbd != player getXuid(1))
						{
							player zm_weapons::weapon_take(weapon);
						}
					}
				}
				if(IsSubStr(weapon.name, "bow_demongate"))
				{
					if(!isdefined(level.var_d5960c6))
					{
						level.var_d5960c6 = player getXuid(1);
					}
					if(isdefined(level.var_d5960c6))
					{
						if(level.var_d5960c6 != player getXuid(1))
						{
							player zm_weapons::weapon_take(weapon);
						}
					}
				}
				if(IsSubStr(weapon.name, "bow_rune_prison"))
				{
					if(!isdefined(level.var_c48fc4))
					{
						level.var_c48fc4 = player getXuid(1);
					}
					if(isdefined(level.var_c48fc4))
					{
						if(level.var_c48fc4 != player getXuid(1))
						{
							player zm_weapons::weapon_take(weapon);
						}
					}
				}
				if(IsSubStr(weapon.name, "bow_wolf_howl"))
				{
					if(!isdefined(level.var_67149d3f))
					{
						level.var_67149d3f = player getXuid(1);
					}
					if(isdefined(level.var_67149d3f))
					{
						if(level.var_67149d3f != player getXuid(1))
						{
							player zm_weapons::weapon_take(weapon);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_123d9cfd
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x25A8
	Size: 0x5E0
	Parameters: 0
	Flags: None
	Line Number: 536
*/
function function_123d9cfd()
{
	for(;;)
	{
		wait(0.1);
		if(isdefined(level.var_4329abbd))
		{
			var_ed72a4a1 = 0;
			foreach(player in level.activePlayers)
			{
				if(level.var_4329abbd == player getXuid(1))
				{
					foreach(weapon in player getweaponslistprimaries())
					{
						if(IsSubStr(weapon.name, "bow_storm"))
						{
							var_ed72a4a1 = 1;
							continue;
						}
					}
				}
			}
			if(var_ed72a4a1 == 0)
			{
				level.var_4329abbd = undefined;
			}
		}
		if(isdefined(level.var_d5960c6))
		{
			var_3153ec6 = 0;
			foreach(player in level.players)
			{
				if(level.var_d5960c6 == player getXuid(1))
				{
					foreach(weapon in player getweaponslistprimaries())
					{
						if(IsSubStr(weapon.name, "bow_demongate"))
						{
							var_3153ec6 = 1;
							continue;
						}
					}
				}
			}
			if(var_3153ec6 == 0)
			{
				level.var_d5960c6 = undefined;
			}
		}
		if(isdefined(level.var_c48fc4))
		{
			var_bafac094 = 0;
			foreach(player in level.players)
			{
				if(level.var_c48fc4 == player getXuid(1))
				{
					foreach(weapon in player getweaponslistprimaries())
					{
						if(IsSubStr(weapon.name, "bow_rune_prison"))
						{
							var_bafac094 = 1;
							continue;
						}
					}
				}
			}
			if(var_bafac094 == 0)
			{
				level.var_c48fc4 = undefined;
			}
		}
		if(isdefined(level.var_67149d3f))
		{
			var_f13861bb = 0;
			foreach(player in level.players)
			{
				if(level.var_67149d3f == player getXuid(1))
				{
					foreach(weapon in player getweaponslistprimaries())
					{
						if(IsSubStr(weapon.name, "bow_wolf_howl"))
						{
							var_f13861bb = 1;
							continue;
						}
					}
				}
			}
			if(var_f13861bb == 0)
			{
				level.var_67149d3f = undefined;
			}
		}
	}
}

/*
	Name: function_d55e4f98
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x2B90
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 642
*/
function function_d55e4f98()
{
	level endon("game_ended");
	while(isdefined(level.var_b366f2dc) && level.var_b366f2dc == 0)
	{
		wait(1);
		level flag::wait_till("boss_fight_begin");
		level.zombie_ai_limit = 10;
		level.zombie_actor_limit = 10;
		level flag::wait_till("boss_fight_completed");
		level.zombie_ai_limit = 24;
		level.zombie_actor_limit = 24;
		return;
		wait(0.05);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_zombie_spawn_delay
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x2C48
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 671
*/
function get_zombie_spawn_delay(n_round)
{
	if(n_round > 60)
	{
		n_round = 60;
	}
	n_multiplier = 0.95;
	switch(level.activePlayers.size)
	{
		case 1:
		{
			n_delay = 2;
			break;
		}
		case 2:
		{
			n_delay = 1.5;
			break;
		}
		case 3:
		{
			n_delay = 0.89;
			break;
		}
		default
		{
			n_delay = 0.67;
			break;
		}
	}
	for(i = 1; i < n_round; i++)
	{
		n_delay = n_delay * n_multiplier;
		if(n_delay <= 0.1)
		{
			n_delay = 0.1;
			break;
		}
	}
	return n_delay;
}

/*
	Name: function_ecea1802
	Namespace: namespace_75eda680
	Checksum: 0x424F4353
	Offset: 0x2D68
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 723
*/
function function_ecea1802()
{
	foreach(player in level.players)
	{
		if(player GetEntityNumber() == 0)
		{
			return player;
		}
	}
	return;
}

