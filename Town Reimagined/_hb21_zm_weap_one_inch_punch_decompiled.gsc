#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\callbacks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_staff_air;
#include scripts\zm\_hb21_zm_weap_staff_fire;
#include scripts\zm\_hb21_zm_weap_staff_lightning;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_hb21_zm_weap_staff_water;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_7529ddc1;

/*
	Name: __init__sytem__
	Namespace: namespace_7529ddc1
	Checksum: 0x579F834E
	Offset: 0x4F8
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 27
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_one_inch_punch", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_7529ddc1
	Checksum: 0xC8538E8C
	Offset: 0x540
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	areas = GetEntArray("harrybo21_one_inch_punch_upgrade", "script_noteworthy");
	if(!isdefined(areas) || areas.size < 1)
	{
		return;
	}
	for(i = 0; i < areas.size; i++)
	{
		areas[i] thread function_5098edf9();
	}
	level thread function_89a5a739();
}

/*
	Name: function_89a5a739
	Namespace: namespace_7529ddc1
	Checksum: 0x3C0774C5
	Offset: 0x5F8
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function function_89a5a739()
{
	trigger_struct = struct::get("oip_trigger", "targetname");
	if(!isdefined(trigger_struct))
	{
		return;
	}
	trigger = spawn("trigger_radius_use", trigger_struct.origin + VectorScale((0, 0, 1), 30), 0, 40, 80);
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("Press & hold ^3&&1^7 for One Inch Punch");
	model = GetEnt(trigger_struct.target, "targetname");
	PlayFXOnTag("harry/one_inch_punch/fx_one_inch_punch_zombie_glow", model, "tag_origin");
	while(1)
	{
		trigger waittill("trigger", player);
		if(player hasweapon(GetWeapon("t7_one_inch_punch")))
		{
			continue;
		}
		player thread zm_melee_weapon::award_melee_weapon("t7_one_inch_punch");
	}
}

/*
	Name: __main__
	Namespace: namespace_7529ddc1
	Checksum: 0x5D65B4E5
	Offset: 0x7E0
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function __main__()
{
	callback::on_connect(&on_player_connect);
	zm_utility::register_melee_weapon_for_level("t7_one_inch_punch");
	zm_melee_weapon::init("t7_one_inch_punch", "t7_one_inch_punch_flourish", undefined, undefined, 10000, "oip_upgrade", "Hold ^3&&1^7 to buy One Inch Punch [Cost: 10000]", "oip", undefined);
	zm_melee_weapon::init("t7_one_inch_punch_upgraded", "t7_one_inch_punch_flourish", undefined, undefined, 10000, "oip_upgraded_upgrade", "Hold ^3&&1^7 to buy One Inch Punch [Cost: 10000]", "oip", undefined);
	zm_melee_weapon::set_fallback_weapon("t7_one_inch_punch", "knife");
	zm_melee_weapon::set_fallback_weapon("t7_one_inch_punch_upgraded", "knife");
}

/*
	Name: function_5098edf9
	Namespace: namespace_7529ddc1
	Checksum: 0x64914065
	Offset: 0x8E8
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_5098edf9()
{
	while(1)
	{
		var_76eeadf4 = 0;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] istouching(self) && (!(isdefined(players[i].var_e5f8f649) && players[i].var_e5f8f649)) && players[i] hasweapon(GetWeapon("t7_one_inch_punch")))
			{
				var_76eeadf4 = 1;
				break;
			}
		}
		if(!var_76eeadf4)
		{
			wait(0.05);
			continue;
		}
		a_zombies = GetAISpeciesArray(level.zombie_team, "all");
		for(i = 0; i < a_zombies.size; i++)
		{
			if(a_zombies[i] istouching(self) && (!(isdefined(a_zombies[i].in_area) && a_zombies[i].in_area)))
			{
				a_zombies[i] function_503c2ed(self);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_503c2ed
	Namespace: namespace_7529ddc1
	Checksum: 0xA2CCE67C
	Offset: 0xAC8
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function function_503c2ed(area)
{
	self.in_area = 1;
	if(isdefined(self.right_fx) && IsEntity(self.right_fx))
	{
		self.right_fx delete();
	}
	if(isdefined(self.left_fx) && IsEntity(self.left_fx))
	{
		self.left_fx delete();
	}
	if(isdefined(self.a.gib_ref) && self.a.gib_ref == "right_arm")
	{
		continue;
	}
	self.right_fx = spawn("script_model", self GetTagOrigin("j_wrist_ri"));
	self.right_fx SetModel("tag_origin");
	self.right_fx.angles = self GetTagAngles("j_wrist_ri");
	self.right_fx LinkTo(self, "j_wrist_ri");
	PlayFXOnTag("harry/one_inch_punch/fx_one_inch_punch_zombie_glow", self.right_fx, "tag_origin");
	if(isdefined(self.a.gib_ref) && self.a.gib_ref == "left_arm")
	{
		continue;
	}
	self.left_fx = spawn("script_model", self GetTagOrigin("j_wrist_le"));
	self.left_fx SetModel("tag_origin");
	self.left_fx.angles = self GetTagAngles("j_wrist_le");
	self.left_fx LinkTo(self, "j_wrist_le");
	PlayFXOnTag("harry/one_inch_punch/fx_one_inch_punch_zombie_glow", self.left_fx, "tag_origin");
	self thread watch_for_death();
	self thread function_66793c57(area);
}

/*
	Name: watch_for_death
	Namespace: namespace_7529ddc1
	Checksum: 0x423B0CF3
	Offset: 0xDA8
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 209
*/
function watch_for_death()
{
	self endon("delete");
	self endon("hash_4ae55c95");
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.right_fx) && IsEntity(self.right_fx))
	{
		self.right_fx delete();
	}
	if(isdefined(self.left_fx) && IsEntity(self.left_fx))
	{
		self.left_fx delete();
	}
	attacker = self.attacker;
	if(isdefined(attacker.var_e5f8f649) && attacker.var_e5f8f649)
	{
		return;
	}
	if(!isdefined(attacker.var_1e65cf85))
	{
		attacker.var_1e65cf85 = 0;
	}
	attacker.var_1e65cf85++;
	if(attacker.var_1e65cf85 >= 5)
	{
		attacker.var_e5f8f649 = 1;
		trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 48), 0, 40, 80);
		trigger TriggerIgnoreTeam();
		trigger setvisibletoall();
		trigger SetTeamForTrigger("none");
		trigger UseTriggerRequireLookAt();
		trigger setcursorhint("HINT_NOICON");
		trigger setHintString("Press & hold ^3&&1^7 to take upgrade");
		tablet = spawn("script_model", self.origin + VectorScale((0, 0, 1), 48));
		tablet SetModel("p7_zm_ori_tablet_stone");
		PlayFXOnTag("harry/one_inch_punch/fx_one_inch_punch_zombie_glow", tablet, "tag_origin");
		tablet thread namespace_951345fe::function_e300dd3();
		trigger thread function_c9162859(tablet, attacker);
		return;
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_66793c57
	Namespace: namespace_7529ddc1
	Checksum: 0xD8BCEF7A
	Offset: 0x10A8
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function function_66793c57(area)
{
	self endon("delete");
	self endon("hash_4ae55c95");
	while(isdefined(self) && isdefined(area))
	{
		if(isdefined(self.a.gib_ref) && self.a.gib_ref == "right_arm" && isdefined(self.right_fx) && IsEntity(self.right_fx))
		{
			self.right_fx delete();
		}
		if(isdefined(self.a.gib_ref) && self.a.gib_ref == "left_arm" && isdefined(self.left_fx) && IsEntity(self.left_fx))
		{
			self.left_fx delete();
		}
		var_76eeadf4 = 0;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] istouching(area) && (!(isdefined(players[i].var_e5f8f649) && players[i].var_e5f8f649)) && players[i] hasweapon(GetWeapon("t7_one_inch_punch")))
			{
				var_76eeadf4 = 1;
				break;
			}
		}
		if(!self istouching(area))
		{
			var_76eeadf4 = 0;
		}
		if(!var_76eeadf4)
		{
			if(isdefined(self.right_fx) && IsEntity(self.right_fx))
			{
				self.right_fx delete();
			}
			if(isdefined(self.left_fx) && IsEntity(self.left_fx))
			{
				self.left_fx delete();
			}
			self.in_area = undefined;
			break;
		}
		wait(0.05);
	}
}

/*
	Name: function_c9162859
	Namespace: namespace_7529ddc1
	Checksum: 0x3201CC5
	Offset: 0x1378
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 322
*/
function function_c9162859(model, owner)
{
	while(1)
	{
		self waittill("trigger", player);
		if(player != owner)
		{
			continue;
		}
		if(isdefined(model))
		{
			model delete();
		}
		player thread zm_melee_weapon::award_melee_weapon("t7_one_inch_punch_upgraded");
		break;
	}
	if(isdefined(self))
	{
		self delete();
		return;
	}
}

/*
	Name: function_b2145e76
	Namespace: namespace_7529ddc1
	Checksum: 0xB763BFF1
	Offset: 0x1430
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 355
*/
function function_b2145e76()
{
	while(isdefined(self))
	{
		self waittill("trigger", player);
		if(!player hasweapon(GetWeapon("t7_one_inch_punch")))
		{
			continue;
		}
		player thread zm_melee_weapon::award_melee_weapon("t7_one_inch_punch_upgraded");
	}
}

/*
	Name: init
	Namespace: namespace_7529ddc1
	Checksum: 0x9ACF73B8
	Offset: 0x14A8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 378
*/
function init()
{
	return;
}

/*
	Name: on_player_connect
	Namespace: namespace_7529ddc1
	Checksum: 0xE9C51F08
	Offset: 0x14B8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function on_player_connect()
{
	self thread monitor_melee_swipe();
}

/*
	Name: function_924e32bf
	Namespace: namespace_7529ddc1
	Checksum: 0x5AEAEF8B
	Offset: 0x14E0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 408
*/
function function_924e32bf()
{
	if(self hasweapon(GetWeapon("t7_one_inch_punch_upgraded")))
	{
		if(self hasweapon(GetWeapon("t7_staff_fire_upgraded")))
		{
			return "fire";
		}
		else if(self hasweapon(GetWeapon("t7_staff_air_upgraded")))
		{
			return "air";
		}
		else if(self hasweapon(GetWeapon("t7_staff_water_upgraded")))
		{
			return "ice";
		}
		else if(self hasweapon(GetWeapon("t7_staff_bolt_upgraded")))
		{
			return "lightning";
			continue;
		}
		return "upgraded";
	}
	return undefined;
	~;
}

/*
	Name: monitor_melee_swipe
	Namespace: namespace_7529ddc1
	Checksum: 0x308C0C
	Offset: 0x1608
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 445
*/
function monitor_melee_swipe()
{
	self endon("disconnect");
	self notify("stop_monitor_melee_swipe");
	self endon("stop_monitor_melee_swipe");
	while(1)
	{
		self waittill("weapon_melee", weapon);
		if(weapon.name != "t7_one_inch_punch" && weapon.name != "t7_one_inch_punch_upgraded")
		{
			continue;
		}
		element = self function_924e32bf();
		range_mod = 1;
		v_punch_effect_fwd = AnglesToForward(self getPlayerAngles());
		v_punch_yaw = get2DYaw((0, 0, 0), v_punch_effect_fwd);
		if(isdefined(element) && element == "air")
		{
			range_mod = range_mod * 2;
		}
		a_zombies = GetAISpeciesArray(level.zombie_team, "all");
		a_zombies = util::get_array_of_closest(self.origin, a_zombies, undefined, undefined, 100);
		_a147 = a_zombies;
		for(_k147 = getFirstArrayKey(_a147); isdefined(_k147); _k147 = getFirstArrayKey(_a147))
		{
			zombie = _a147[_k147];
			if(self is_player_facing(zombie, v_punch_yaw) && DistanceSquared(self.origin, zombie.origin) <= 4096 * range_mod)
			{
				self thread zombie_punch_damage(zombie, 1, element, weapon);
			}
			else if(self is_player_facing(zombie, v_punch_yaw))
			{
				self thread zombie_punch_damage(zombie, 0.5, element);
			}
		}
	}
}

/*
	Name: get2DYaw
	Namespace: namespace_7529ddc1
	Checksum: 0xB04F3A14
	Offset: 0x18E0
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 493
*/
function get2DYaw(start, end)
{
	vector = (end[0] - start[0], end[1] - start[1], 0);
	return vectoangles(vector);
}

/*
	Name: vectoangles
	Namespace: namespace_7529ddc1
	Checksum: 0xE6417B44
	Offset: 0x1950
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 509
*/
function vectoangles(vector)
{
	yaw = 0;
	vecX = vector[0];
	vecY = vector[1];
	if(vecX == 0 && vecY == 0)
	{
		return 0;
	}
	if(vecY < 0.001 && vecY > -0.001)
	{
		vecY = 0.001;
	}
	yaw = ATan(vecX / vecY);
	if(vecY < 0)
	{
		yaw = yaw + 180;
	}
	return 90 - yaw;
}

/*
	Name: is_player_facing
	Namespace: namespace_7529ddc1
	Checksum: 0x38149CD4
	Offset: 0x1A38
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 540
*/
function is_player_facing(zombie, v_punch_yaw)
{
	v_player_to_zombie_yaw = get2DYaw(self.origin, zombie.origin);
	yaw_diff = v_player_to_zombie_yaw - v_punch_yaw;
	if(yaw_diff < 0)
	{
		yaw_diff = yaw_diff * -1;
	}
	if(yaw_diff < 35)
	{
		return 1;
		continue;
	}
	return 0;
}

/*
	Name: zombie_punch_damage
	Namespace: namespace_7529ddc1
	Checksum: 0xFAD82870
	Offset: 0x1AD8
	Size: 0x3F0
	Parameters: 4
	Flags: None
	Line Number: 566
*/
function zombie_punch_damage(ai_zombie, n_mod, element, weapon)
{
	self endon("disconnect");
	if(isdefined(element))
	{
		n_base_damage = 11275;
		continue;
	}
	n_base_damage = 2250;
	n_damage = Int(n_base_damage * n_mod);
	ai_zombie DoDamage(n_damage, ai_zombie.origin, self, self, 0, "MOD_MELEE", 0, weapon);
	if(isdefined(element))
	{
		switch(element)
		{
			case "fire":
			{
				ai_zombie thread namespace_ec041286::function_a8df72d5(n_mod, weapon, self, n_base_damage);
				break;
			}
			case "ice":
			{
				ai_zombie thread namespace_18deef8b::function_85c833b0(n_mod, weapon, self, n_base_damage);
				break;
			}
			case "lightning":
			{
				ai_zombie thread namespace_39f88dbc::function_7ed6978f(n_mod, weapon, self, n_base_damage);
				break;
			}
			case "air":
			{
				if(!isalive(ai_zombie) && (!(isdefined(ai_zombie namespace_951345fe::function_8b325b40()) && ai_zombie namespace_951345fe::function_8b325b40())))
				{
					self thread zombie_punch_death(ai_zombie);
				}
				else if(isalive(ai_zombie) && (!(isdefined(ai_zombie namespace_951345fe::function_8b325b40()) && ai_zombie namespace_951345fe::function_8b325b40())))
				{
					ai_zombie thread namespace_6d0a1fae::function_d3ecdb82(weapon, self);
					break;
				}
			}
			case "upgraded":
			{
				if(!isalive(ai_zombie) && (!(isdefined(ai_zombie namespace_951345fe::function_8b325b40()) && ai_zombie namespace_951345fe::function_8b325b40())))
				{
					self thread zombie_punch_death(ai_zombie);
				}
				else if(isalive(ai_zombie) && (!(isdefined(ai_zombie namespace_951345fe::function_8b325b40()) && ai_zombie namespace_951345fe::function_8b325b40())))
				{
					ai_zombie thread namespace_6d0a1fae::function_d3ecdb82(weapon, self);
					break;
				}
			}
		}
	}
	else if(!isalive(ai_zombie) && (!(isdefined(ai_zombie namespace_951345fe::function_8b325b40()) && ai_zombie namespace_951345fe::function_8b325b40())))
	{
		self thread zombie_punch_death(ai_zombie);
	}
	else if(isalive(ai_zombie) && (!(isdefined(ai_zombie namespace_951345fe::function_8b325b40()) && ai_zombie namespace_951345fe::function_8b325b40())))
	{
		ai_zombie thread namespace_6d0a1fae::function_d3ecdb82(weapon, self);
	}
}

/*
	Name: gib_zombies_head
	Namespace: namespace_7529ddc1
	Checksum: 0xC556F7E0
	Offset: 0x1ED0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 642
*/
function gib_zombies_head(player)
{
	player endon("disconnect");
	self zombie_utility::zombie_head_gib();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: zombie_punch_death
	Namespace: namespace_7529ddc1
	Checksum: 0x7EEA0A56
	Offset: 0x1F08
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 660
*/
function zombie_punch_death(ai_zombie)
{
	ai_zombie thread gib_zombies_head(self);
	if(isdefined(ai_zombie))
	{
		ai_zombie zombie_launch(ai_zombie.attacker);
	}
}

/*
	Name: zombie_launch
	Namespace: namespace_7529ddc1
	Checksum: 0x801EF0EA
	Offset: 0x1F68
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 679
*/
function zombie_launch(e_attacker)
{
	self DoDamage(self.health, self.origin, self, self, 0, "MOD_MELEE", 0, e_attacker.current_melee_weapon);
	self StartRagdoll();
	self LaunchRagdoll(determine_launch_vector(e_attacker, self));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: determine_launch_vector
	Namespace: namespace_7529ddc1
	Checksum: 0x6E9BA4D9
	Offset: 0x2000
	Size: 0x8C
	Parameters: 2
	Flags: None
	Line Number: 698
*/
function determine_launch_vector(e_attacker, ai_target)
{
	v_launch = VectorNormalize(ai_target.origin - e_attacker.origin) * randomIntRange(125, 150) + (0, 0, randomIntRange(75, 150));
	return v_launch;
}

