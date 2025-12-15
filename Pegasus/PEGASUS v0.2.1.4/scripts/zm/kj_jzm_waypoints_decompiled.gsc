#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;

#namespace namespace_bc075b67;

/*
	Name: __init__sytem__
	Namespace: namespace_bc075b67
	Checksum: 0x73571777
	Offset: 0x8B8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 23
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_waypoints", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_bc075b67
	Checksum: 0x9ACF73B8
	Offset: 0x900
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_bc075b67
	Checksum: 0xFB90DCC5
	Offset: 0x910
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __main__()
{
	gameobjects::main();
	level.numGametypeReservedObjectives = 1;
}

/*
	Name: function_2795f3b6
	Namespace: namespace_bc075b67
	Checksum: 0xFF64D6CF
	Offset: 0x938
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function function_2795f3b6()
{
	MapName = GetDvarString("mapname");
	if(isdefined(MapName) && MapName == "zm_tomb")
	{
		return;
	}
	players = GetPlayers();
	var_e15e8e9e = self.var_1ad2f4ac + "'s Bot";
	wait(0.05);
	if(players.size > 1)
	{
		foreach(player in players)
		{
			player function_d10d3e99(var_e15e8e9e);
		}
	}
	wait(0.5);
	if(isdefined(level.var_bc4bfe7c))
	{
		return;
	}
	wait(0.05);
	spawner::add_archetype_spawn_function("zombie", &function_aa1405d4);
	spawner::add_archetype_spawn_function("zombie_dog", &function_aa1405d4);
	level thread function_f4d696e5();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d10d3e99
	Namespace: namespace_bc075b67
	Checksum: 0x3180149
	Offset: 0xAF8
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 108
*/
function function_d10d3e99(var_e15e8e9e)
{
	self endon("disconnect");
	level endon("game_ended");
	self.OBJECTIVE_ID = gameobjects::get_next_obj_id();
	if(isdefined(self.OBJECTIVE_ID))
	{
		objective_add(self.OBJECTIVE_ID, "active", self, istring("objective_pegasus_player"));
		Objective_OnEntity(self.OBJECTIVE_ID, self);
		Objective_SetProgress(self.OBJECTIVE_ID, 1);
		wait(0.75);
		Objective_SetVisibleToAll(self.OBJECTIVE_ID);
		if(self IsTestClient())
		{
			playerName = "JZMUIName" + var_e15e8e9e;
		}
		else
		{
			playerName = "JZMUIName" + self.var_1ad2f4ac;
		}
		wait(0.5);
		if(isdefined(playerName))
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", playerName);
		}
		if(isdefined(self.var_fc421594))
		{
			var_c0326061 = "JZMUIImage" + self.var_fc421594;
			wait(0.5);
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", var_c0326061);
		}
		if(isdefined(self.var_1c43abc3))
		{
			if(isdefined(self.var_9d6730be) && self.var_9d6730be > 0)
			{
				var_1d37f2d9 = "JZMUINumberP" + self.var_9d6730be + " R" + self.var_1c43abc3;
			}
			else
			{
				var_1d37f2d9 = "JZMUINumber" + self.var_1c43abc3;
			}
			wait(0.5);
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", var_1d37f2d9);
		}
		if(self IsTestClient())
		{
			return;
		}
		var_268d0ae8 = "0.47,0,0.7";
		wait(0.5);
	}
}

/*
	Name: function_1e8a4bc9
	Namespace: namespace_bc075b67
	Checksum: 0x45A981A8
	Offset: 0xDA0
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 171
*/
function function_1e8a4bc9(OBJECTIVE_ID)
{
	self endon("disconnect");
	level endon("game_ended");
	while(isdefined(self))
	{
		if(self.health == self.maxhealth)
		{
			Objective_SetProgress(OBJECTIVE_ID, 1);
			health = self.health / self.maxhealth;
			self waittill("damage");
		}
		wait(0.25);
		if(isdefined(health) && health != self.health / self.maxhealth && self.health != self.maxhealth)
		{
			health = self.health / self.maxhealth;
			Objective_SetProgress(OBJECTIVE_ID, health);
		}
		wait(0.05);
	}
}

/*
	Name: function_aa1405d4
	Namespace: namespace_bc075b67
	Checksum: 0xEEB94072
	Offset: 0xEB0
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function function_aa1405d4()
{
	wait(1);
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	self.OBJECTIVE_ID = gameobjects::get_next_obj_id();
	Number = self.OBJECTIVE_ID;
	if(isdefined(self.OBJECTIVE_ID))
	{
		objective_add(self.OBJECTIVE_ID, "active", self, istring("objective_pegasus_zombie"));
		Objective_OnEntity(self.OBJECTIVE_ID, self);
		wait(0.05);
		Objective_SetInvisibleToAll(self.OBJECTIVE_ID);
		wait(0.5);
		self function_796ac5e3();
		wait(0.5);
		self function_268250ac();
		self thread function_c2fe7596(self.OBJECTIVE_ID);
		self thread function_dfd2fcc8(Number);
	}
}

/*
	Name: function_268250ac
	Namespace: namespace_bc075b67
	Checksum: 0x3A5FE4ED
	Offset: 0x1010
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_268250ac()
{
	if(isdefined(level.var_33a8b9af))
	{
		function_78931f1b(self.OBJECTIVE_ID, "damage_bar", level.var_33a8b9af);
	}
	else if(isdefined(level.var_5eeabc5e))
	{
		self function_6d6b8d8d();
	}
}

/*
	Name: function_6d6b8d8d
	Namespace: namespace_bc075b67
	Checksum: 0xF369F21D
	Offset: 0x1080
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 259
*/
function function_6d6b8d8d()
{
	color = RandomInt(8);
	if(isdefined(color))
	{
		if(color == 0)
		{
			return;
		}
		else if(color == 1)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "0.9,0,0");
		}
		else if(color == 2)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "0,1,0");
		}
		else if(color == 3)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "0,0,1");
		}
		else if(color == 4)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "1,0.3,1");
		}
		else if(color == 5)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "1,1,0.2");
		}
		else if(color == 6)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "1,0.5,0");
		}
		else if(color == 7)
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "0.2,1,1");
		}
	}
}

/*
	Name: function_dfd2fcc8
	Namespace: namespace_bc075b67
	Checksum: 0x4FBB2212
	Offset: 0x1258
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 309
*/
function function_dfd2fcc8(Number)
{
	self waittill("death", attacker);
	if(isdefined(attacker) && isdefined(self) && isdefined(self.marked_for_death) && !self.marked_for_death)
	{
		if(IsInArray(attacker.var_dcdf2d7, self))
		{
			ArrayRemoveValue(attacker.var_dcdf2d7, self);
		}
	}
	if(isdefined(Number))
	{
		Objective_SetProgress(self.OBJECTIVE_ID, 0.01);
		wait(0.6);
		objective_delete(Number);
		gameobjects::release_obj_id(Number);
	}
}

/*
	Name: function_c2fe7596
	Namespace: namespace_bc075b67
	Checksum: 0x8FA65068
	Offset: 0x1358
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 338
*/
function function_c2fe7596(n_obj_id)
{
	self endon("death");
	while(isdefined(self))
	{
		self waittill("damage", n_damage, e_attacker);
		Objective_SetProgress(n_obj_id, self.health / self.maxhealth);
	}
}

/*
	Name: function_796ac5e3
	Namespace: namespace_bc075b67
	Checksum: 0x30F7540F
	Offset: 0x13D0
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 358
*/
function function_796ac5e3()
{
	if(isdefined(self.var_15fcbd2f))
	{
		var_15fcbd2f = "JZMUIName" + self.var_15fcbd2f;
		function_78931f1b(self.OBJECTIVE_ID, "damage_bar", var_15fcbd2f);
		return;
	}
	else if(isdefined(self.var_86951bba))
	{
		function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameGeorge Romero");
		return;
	}
	else if(isdefined(self.var_a68e3d39))
	{
		function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameChemical Boss");
		return;
	}
	switch(self.archetype)
	{
		case "zombie":
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameZombie");
			break;
		}
		case "zombie_dog":
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameHellhound");
			break;
		}
		case "zombie_quad":
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameNova Crawler");
			break;
		}
		case "cellbreaker":
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameBrutus");
			break;
		}
		default
		{
			function_78931f1b(self.OBJECTIVE_ID, "damage_bar", "JZMUINameZombie");
			break;
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_f4d696e5
	Namespace: namespace_bc075b67
	Checksum: 0x6EC73759
	Offset: 0x15D8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 418
*/
function function_f4d696e5()
{
	foreach(player in GetPlayers())
	{
		if(!self IsTestClient())
		{
			player thread function_1ed2142b();
		}
	}
}

/*
	Name: function_1ed2142b
	Namespace: namespace_bc075b67
	Checksum: 0x3A06C6C6
	Offset: 0x1690
	Size: 0x3A0
	Parameters: 0
	Flags: None
	Line Number: 439
*/
function function_1ed2142b()
{
	level endon("end_game");
	self endon("disconnect");
	wait(0.05);
	self.var_dcdf2d7 = Array();
	for(;;)
	{
		wait(0.5);
		foreach(zomb in GetAITeamArray("axis"))
		{
			if(!IsInArray(self.var_dcdf2d7, zomb))
			{
				if(self function_6058297e(zomb) && isdefined(zomb.OBJECTIVE_ID) && Distance(self.origin, zomb.origin) < 2000 && BulletTracePassed(zomb.origin + VectorScale((0, 0, 1), 45), self GetEye(), 0, undefined))
				{
					Objective_SetVisibleToPlayer(zomb.OBJECTIVE_ID, self);
					wait(0.05);
					if(!isdefined(self.var_dcdf2d7))
					{
						self.var_dcdf2d7 = [];
					}
					else if(!IsArray(self.var_dcdf2d7))
					{
						self.var_dcdf2d7 = Array(self.var_dcdf2d7);
					}
					self.var_dcdf2d7[self.var_dcdf2d7.size] = zomb;
				}
			}
			if(IsInArray(self.var_dcdf2d7, zomb))
			{
				if(!self function_6058297e(zomb) && isdefined(zomb.OBJECTIVE_ID))
				{
					Objective_SetInvisibleToPlayer(zomb.OBJECTIVE_ID, self);
					if(IsInArray(self.var_dcdf2d7, zomb))
					{
						ArrayRemoveValue(self.var_dcdf2d7, zomb);
						continue;
					}
				}
				if(self function_6058297e(zomb) && isdefined(zomb.OBJECTIVE_ID) && !BulletTracePassed(zomb.origin + VectorScale((0, 0, 1), 45), self GetEye(), 0, undefined))
				{
					Objective_SetInvisibleToPlayer(zomb.OBJECTIVE_ID, self);
					if(IsInArray(self.var_dcdf2d7, zomb))
					{
						ArrayRemoveValue(self.var_dcdf2d7, zomb);
					}
				}
			}
		}
	}
}

/*
	Name: function_5d1567ef
	Namespace: namespace_bc075b67
	Checksum: 0xFC70E7E7
	Offset: 0x1A38
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 501
*/
function function_5d1567ef()
{
	level endon("end_game");
	self endon("disconnect");
	for(;;)
	{
		level waittill("between_round_over");
		self.var_dcdf2d7 = Array();
	}
}

/*
	Name: is_looking_at
	Namespace: namespace_bc075b67
	Checksum: 0xB831801E
	Offset: 0x1A88
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 522
*/
function is_looking_at(ent_or_org, n_dot_range)
{
	if(!isdefined(n_dot_range))
	{
		n_dot_range = 0.5;
	}
	if(IsVec(ent_or_org))
	{
	}
	else
	{
	}
	v_point = ent_or_org.origin;
	b_use_tag_eye = 0;
	if(isPlayer(self) || isai(self))
	{
		b_use_tag_eye = 1;
	}
	n_dot = self math::get_dot_direction(v_point + VectorScale((0, 0, 1), 50), 0, 1, "forward", b_use_tag_eye);
	if(n_dot > n_dot_range)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_6058297e
	Namespace: namespace_bc075b67
	Checksum: 0x41FD0B00
	Offset: 0x1BA8
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 561
*/
function function_6058297e(ent_or_org, n_dot_range)
{
	if(!isdefined(n_dot_range))
	{
		n_dot_range = 0.9;
	}
	if(IsVec(ent_or_org))
	{
	}
	else
	{
	}
	v_point = ent_or_org.origin;
	b_use_tag_eye = 0;
	if(isPlayer(self) || isai(self))
	{
		b_use_tag_eye = 1;
	}
	n_dot = self math::get_dot_direction(v_point + VectorScale((0, 0, 1), 50), 0, 1, "forward", b_use_tag_eye);
	if(n_dot > n_dot_range)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_d03146db
	Namespace: namespace_bc075b67
	Checksum: 0xA7207A46
	Offset: 0x1CC8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 600
*/
function function_d03146db()
{
	level endon("game_ended");
	self endon("disconnect");
	self.var_96abad5f = 0;
	if(isdefined(self.var_aa8ac74d))
	{
		self.var_aa8ac74d delete();
		if(isdefined(self.var_50aecb08))
		{
			self.var_50aecb08 = undefined;
			objective_delete(self.var_3d231107);
		}
	}
	else
	{
		direction = AnglesToForward(self getPlayerAngles());
		wait(0.05);
		if(isdefined(direction))
		{
			var_98a6cce8 = self.origin + VectorScale((0, 0, 1), 60);
			var_41af8f4 = var_98a6cce8 + direction * 2000;
			if(isdefined(var_41af8f4))
			{
				wait(0.05);
				trace = bullettrace(var_98a6cce8, var_41af8f4, 1, self);
				if(trace["surfacetype"] !== "none")
				{
					self.var_50aecb08 = trace["position"];
					if(isdefined(self.var_50aecb08))
					{
						self thread function_2b4544a6();
					}
				}
			}
		}
	}
	else
	{
	}
}

/*
	Name: function_2b4544a6
	Namespace: namespace_bc075b67
	Checksum: 0xB6E57B5C
	Offset: 0x1E68
	Size: 0x878
	Parameters: 0
	Flags: None
	Line Number: 652
*/
function function_2b4544a6()
{
	ents = GetAITeamArray("axis");
	wait(0.05);
	foreach(ent in ents)
	{
		if(Distance(ent.origin, self.var_50aecb08) < 60)
		{
			self.var_aa8ac74d = spawn("script_model", self.var_50aecb08 + VectorScale((0, 0, -1), 75));
			self.var_aa8ac74d SetModel("tag_origin");
			self.var_96abad5f = 1;
			self.var_aa8ac74d LinkTo(ent);
			if(isdefined(self.var_3d231107))
			{
				objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
				Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
				Objective_SetVisibleToAll(self.var_3d231107);
				wait(0.05);
				var_64a2313f = "ZOMBIE," + self.var_fc421594;
				function_78931f1b(self.var_3d231107, "damage_bar", var_64a2313f);
				IPrintLnBold(self.var_1ad2f4ac + ": ^7Pinged Zombie");
				return;
			}
		}
	}
	if(isdefined(self.var_96abad5f) && !self.var_96abad5f)
	{
		self.var_aa8ac74d = spawn("script_model", self.var_50aecb08 + VectorScale((0, 0, -1), 75));
		self.var_aa8ac74d SetModel("tag_origin");
		var_b4f2b884 = GetEntArray("zombie_vending", "targetname");
		if(isdefined(var_b4f2b884) && var_b4f2b884.size > 0)
		{
			foreach(perk in var_b4f2b884)
			{
				if(isdefined(perk.script_noteworthy))
				{
					if(Distance(self.var_aa8ac74d.origin, perk.origin) < 80)
					{
						IPrintLnBold(self.var_1ad2f4ac + ": ^7Pinged A Perk: " + perk.script_noteworthy);
						self function_29c0c59e(perk.script_noteworthy);
						return;
					}
				}
			}
		}
		wait(0.05);
		Wallbuys = struct::get_array("weapon_upgrade", "targetname");
		if(isdefined(Wallbuys) && Wallbuys.size > 0)
		{
			foreach(wallbuy in Wallbuys)
			{
				if(Distance(self.var_aa8ac74d.origin, wallbuy.origin) < 80)
				{
					var_cf84c036 = GetWeapon(wallbuy.weapon.name);
					var_c5a6e8bc = MakeLocalizedString(var_cf84c036.displayName);
					IPrintLnBold(self.var_1ad2f4ac + ": ^7Pinged A Weapon: " + var_c5a6e8bc);
					self function_d4db9512(var_cf84c036, var_c5a6e8bc);
					return;
				}
			}
		}
		boxes = struct::get_array("treasure_chest_use", "targetname");
		if(isdefined(boxes) && boxes.size > 0)
		{
			for(i = 0; i < boxes.size; i++)
			{
				if(Distance(self.var_aa8ac74d.origin, boxes[i].origin) < 80)
				{
					self function_19322856();
					IPrintLnBold(self.var_1ad2f4ac + ": ^7Pinged The Magicbox");
					return;
				}
			}
		}
		var_b8481387 = struct::get_array("perksacola", "targetname");
		if(isdefined(var_b8481387) && var_b8481387.size > 0)
		{
			for(i = 0; i < var_b8481387.size; i++)
			{
				if(Distance(self.var_aa8ac74d.origin, var_b8481387[i].origin) < 80)
				{
					self function_18fc8c22();
					IPrintLnBold(self.var_1ad2f4ac + ": ^7Pinged Pack-A-Punch");
					return;
				}
			}
		}
		wait(0.05);
		if(isdefined(self.var_3d231107))
		{
			objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
			Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
			Objective_SetVisibleToAll(self.var_3d231107);
			wait(0.05);
			var_64a2313f = self.var_1ad2f4ac + "," + self.var_fc421594;
			function_78931f1b(self.var_3d231107, "damage_bar", var_64a2313f);
			IPrintLnBold(self.var_1ad2f4ac + ": ^7Pinged a location");
		}
	}
}

/*
	Name: function_18fc8c22
	Namespace: namespace_bc075b67
	Checksum: 0x6AADC528
	Offset: 0x26E8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 763
*/
function function_18fc8c22()
{
	if(isdefined(self.var_3d231107))
	{
		objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
		Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
		Objective_SetVisibleToAll(self.var_3d231107);
		wait(0.05);
		function_78931f1b(self.var_3d231107, "damage_bar", "Pack-A-Punch,t7_icon_rank_zm_prestige_41");
	}
}

/*
	Name: function_a8c7d0b1
	Namespace: namespace_bc075b67
	Checksum: 0x9D6ED939
	Offset: 0x27B0
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 785
*/
function function_a8c7d0b1()
{
	if(isdefined(self.var_3d231107))
	{
		objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
		Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
		Objective_SetVisibleToAll(self.var_3d231107);
		wait(0.05);
		function_78931f1b(self.var_3d231107, "damage_bar", "Locked,playlist_custom");
	}
}

/*
	Name: function_19322856
	Namespace: namespace_bc075b67
	Checksum: 0xEDC101FC
	Offset: 0x2878
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 807
*/
function function_19322856()
{
	if(isdefined(self.var_3d231107))
	{
		objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
		Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
		Objective_SetVisibleToAll(self.var_3d231107);
		wait(0.05);
		function_78931f1b(self.var_3d231107, "damage_bar", "Mystery Box,t7_icon_rank_zm_prestige_51");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d4db9512
	Namespace: namespace_bc075b67
	Checksum: 0xD7FED61D
	Offset: 0x2940
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 831
*/
function function_d4db9512(var_cf84c036, var_c5a6e8bc)
{
	if(isdefined(self.var_3d231107))
	{
		objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
		Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
		Objective_SetVisibleToAll(self.var_3d231107);
		wait(0.05);
		self function_9cbd4f00(var_cf84c036, var_c5a6e8bc);
	}
}

/*
	Name: function_9cbd4f00
	Namespace: namespace_bc075b67
	Checksum: 0x3F91299F
	Offset: 0x2A10
	Size: 0x2A0
	Parameters: 2
	Flags: None
	Line Number: 853
*/
function function_9cbd4f00(var_cf84c036, var_c5a6e8bc)
{
	weaponClass = util::getWeaponClass(var_cf84c036);
	if(isdefined(weaponClass))
	{
		switch(weaponClass)
		{
			case "weapon_assault":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_menu_mp_weapons_primary_big";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_smg":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_icon_weapon_smg_standard_kf";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_sniper":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_icon_weapon_sniper_fastbolt_kf";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_lmg":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_icon_weapon_lmg_light_kf";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_cqb":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_icon_weapon_shotgun_pump_kf";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_pistol":
			{
				var_8950f131 = var_c5a6e8bc + ",hud_icon_colt";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_knife":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_icon_weapon_special_knife_kf";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			case "weapon_grenade":
			{
				var_8950f131 = var_c5a6e8bc + ",t7_menu_mp_weapons_lethal_big";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
			default
			{
				var_8950f131 = var_c5a6e8bc + ",waypoint_dogtags";
				function_78931f1b(self.var_3d231107, "damage_bar", var_8950f131);
				break;
			}
		}
	}
}

/*
	Name: function_29c0c59e
	Namespace: namespace_bc075b67
	Checksum: 0xA7E7389D
	Offset: 0x2CB8
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 928
*/
function function_29c0c59e(str_perk)
{
	if(isdefined(self.var_3d231107))
	{
		objective_add(self.var_3d231107, "active", self.var_aa8ac74d, istring("objective_pegasus_ping"));
		Objective_OnEntity(self.var_3d231107, self.var_aa8ac74d);
		Objective_SetVisibleToAll(self.var_3d231107);
		wait(0.05);
		function_ee97ec71(str_perk);
	}
}

/*
	Name: function_ee97ec71
	Namespace: namespace_bc075b67
	Checksum: 0xF56E79C9
	Offset: 0x2D78
	Size: 0x278
	Parameters: 1
	Flags: None
	Line Number: 950
*/
function function_ee97ec71(str_perk)
{
	if(str_perk == "specialty_additionalprimaryweapon")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Mule Kick,specialty_giant_three_guns_zombies");
	}
	else if(str_perk == "specialty_armorvest")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Juggernog,specialty_giant_juggernaut_zombies");
	}
	else if(str_perk == "specialty_deadshot")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Deadshot DAIQUIRI,specialty_giant_ads_zombies");
	}
	else if(str_perk == "specialty_doubletap2")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Double Tapp,specialty_giant_doubletap_zombies");
	}
	else if(str_perk == "specialty_electriccherry")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Electric Cherry,specialty_blue_electric_cherry_zombies");
	}
	else if(str_perk == "specialty_fastreload")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Speed Cola,specialty_giant_fastreload_zombies");
	}
	else if(str_perk == "specialty_quickrevive")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Quick Revive,specialty_giant_quickrevive_zombies");
	}
	else if(str_perk == "specialty_staminup")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Stamin-Up,specialty_giant_marathon_zombies");
	}
	else if(str_perk == "specialty_widowswine")
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "Widows Wine,specialty_widows_wine_zombies");
	}
	else
	{
		function_78931f1b(self.var_3d231107, "damage_bar", "PERK,t7_icons_challenges_zm_survivalist");
	}
}

/*
	Name: function_a7dde5ed
	Namespace: namespace_bc075b67
	Checksum: 0xD55EAFC6
	Offset: 0x2FF8
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1004
*/
function function_a7dde5ed(weapon)
{
	objective_add(self.var_c77b20b7, "active", self.var_dde1833d, istring("objective_pegasus_ping"));
	Objective_OnEntity(self.var_c77b20b7, self.var_dde1833d);
	Objective_SetVisibleToAll(self.var_c77b20b7);
	wait(0.05);
	self thread function_7fde7dd0(weapon);
}

/*
	Name: function_7fde7dd0
	Namespace: namespace_bc075b67
	Checksum: 0x252983E0
	Offset: 0x30A8
	Size: 0x2BE
	Parameters: 1
	Flags: None
	Line Number: 1023
*/
function function_7fde7dd0(weapon)
{
	weapon_name = MakeLocalizedString(weapon.displayName);
	weaponClass = util::getWeaponClass(weapon);
	if(isdefined(weaponClass))
	{
		switch(weaponClass)
		{
			case "weapon_assault":
			{
				var_ef75a782 = weapon_name + ",t7_menu_mp_weapons_primary_big";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_smg":
			{
				var_ef75a782 = weapon_name + ",t7_icon_weapon_smg_standard_kf";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_sniper":
			{
				var_ef75a782 = weapon_name + ",t7_icon_weapon_sniper_fastbolt_kf";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_lmg":
			{
				var_ef75a782 = weapon_name + ",t7_icon_weapon_lmg_light_kf";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_cqb":
			{
				var_ef75a782 = weapon_name + ",t7_icon_weapon_shotgun_pump_kf";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_pistol":
			{
				var_ef75a782 = weapon_name + ",hud_icon_colt";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_knife":
			{
				var_ef75a782 = weapon_name + ",t7_icon_weapon_special_knife_kf";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			case "weapon_grenade":
			{
				var_ef75a782 = weapon_name + ",t7_menu_mp_weapons_lethal_big";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
			default
			{
				var_ef75a782 = weapon_name + ",waypoint_dogtags";
				function_78931f1b(self.var_c77b20b7, "damage_bar", var_ef75a782);
				break;
			}
		}
	}
}

