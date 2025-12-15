#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_utility;
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_951345fe;

/*
	Name: __init__sytem__
	Namespace: namespace_951345fe
	Checksum: 0x180FEE1D
	Offset: 0xC78
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 41
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_utility", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_951345fe
	Checksum: 0xF03B6776
	Offset: 0xCB8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function __init__()
{
	callback::on_spawned(&on_player_spawned);
	function_83833c81();
}

/*
	Name: on_player_spawned
	Namespace: namespace_951345fe
	Checksum: 0x15BF5E5B
	Offset: 0xCF8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function on_player_spawned()
{
	self.var_900bd247 = 1;
	self thread function_e97a7083();
	self thread function_bda3c2e();
	self thread function_d7273906();
}

/*
	Name: function_e97a7083
	Namespace: namespace_951345fe
	Checksum: 0xE6555369
	Offset: 0xD58
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function function_e97a7083()
{
	self notify("watch_staff_fired");
	self endon("disconnect");
	self endon("watch_staff_fired");
	while(1)
	{
		self waittill("missile_fire", e_projectile, str_weapon);
		if(!function_95be3a13(str_weapon))
		{
			continue;
		}
		if(isdefined(e_projectile.additional_shot) && e_projectile.additional_shot)
		{
			continue;
		}
		var_643e8b80 = Int(self GetWeaponAmmoClip(str_weapon));
		if(isdefined(self.var_900bd247) && self.var_900bd247 == 3)
		{
			self SetWeaponAmmoClip(str_weapon, var_643e8b80 - 5);
		}
		else if(isdefined(self.var_900bd247) && self.var_900bd247 == 2)
		{
			self SetWeaponAmmoClip(str_weapon, var_643e8b80 - 3);
		}
		weapon = undefined;
		switch(str_weapon.name)
		{
			case "t7_staff_fire":
			case "t7_staff_fire_upgraded":
			{
				weapon = "staff_fire";
				break;
			}
			case "t7_staff_water":
			case "t7_staff_water_upgraded":
			{
				weapon = "staff_water";
				break;
			}
			case "t7_staff_air":
			case "t7_staff_air_upgraded":
			{
				weapon = "staff_air";
				break;
			}
			case "t7_staff_bolt":
			case "t7_staff_bolt_upgraded":
			{
				weapon = "staff_bolt";
				break;
			}
			case "t7_staff_revive":
			{
				weapon = "staff_revive";
				break;
			}
		}
		if(isdefined(weapon))
		{
			self notify(weapon + "_fired", e_projectile, str_weapon, self.var_900bd247);
		}
	}
}

/*
	Name: function_bda3c2e
	Namespace: namespace_951345fe
	Checksum: 0xB1FECBA7
	Offset: 0xFA8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 165
*/
function function_bda3c2e()
{
	self endon("disconnect");
	self notify("hash_5972a089");
	self endon("hash_5972a089");
	while(isdefined(self))
	{
		w_weapon = self GetCurrentWeapon();
		if(is_weapon_upgraded_staff(w_weapon))
		{
			var_900bd247 = self function_d73989a(w_weapon);
			if(!isdefined(self.var_900bd247) || self.var_900bd247 != var_900bd247)
			{
				self.var_900bd247 = var_900bd247;
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_d7273906
	Namespace: namespace_951345fe
	Checksum: 0x3FBEE120
	Offset: 0x1070
	Size: 0x680
	Parameters: 0
	Flags: None
	Line Number: 195
*/
function function_d7273906()
{
	self notify("watch_staff_usage");
	self endon("watch_staff_usage");
	self endon("disconnect");
	while(1)
	{
		self waittill("weapon_change", weapon, old_weapon);
		has_upgraded_staff = 0;
		has_revive_staff = 0;
		weapon_is_upgraded_staff = is_weapon_upgraded_staff(weapon);
		str_upgraded_staff_weapon = undefined;
		a_str_weapons = self GetWeaponsList();
		_a820 = a_str_weapons;
		for(_k820 = getFirstArrayKey(_a820); isdefined(_k820); _k820 = getFirstArrayKey(_a820))
		{
			str_weapon = _a820[_k820];
			if(is_weapon_upgraded_staff(str_weapon))
			{
				has_upgraded_staff = 1;
				str_upgraded_staff_weapon = str_weapon;
			}
			if(str_weapon.name == "t7_staff_revive")
			{
				has_revive_staff = 1;
			}
		}
		if(has_upgraded_staff && !has_revive_staff)
		{
			self GiveWeapon(GetWeapon("t7_staff_revive"));
			has_revive_staff = 1;
		}
		if(!has_upgraded_staff && has_revive_staff)
		{
			self TakeWeapon(GetWeapon("t7_staff_revive"));
			has_revive_staff = 0;
		}
		if(weapon.name == "t7_staff_revive")
		{
			self SetActionSlot(3, "weapon", old_weapon);
		}
		else if(is_weapon_upgraded_staff(weapon))
		{
			self SetActionSlot(3, "weapon", GetWeapon("t7_staff_revive"));
			continue;
		}
		self SetActionSlot(3, "altMode");
		if(self zm_utility::get_player_melee_weapon() == GetWeapon("t7_one_inch_punch"))
		{
			continue;
		}
		if(self zm_utility::get_player_melee_weapon() == GetWeapon("t7_one_inch_punch_upgraded"))
		{
			continue;
		}
		if(!isdefined(self.var_662cc91e))
		{
			if(weapon.name == "t7_staff_water_upgraded")
			{
				self.var_d324b086 = self zm_utility::get_player_melee_weapon();
				self.var_662cc91e = GetWeapon("t7_staff_water_melee");
				self GiveWeapon(GetWeapon("t7_staff_water_melee"));
				self zm_utility::set_player_melee_weapon(GetWeapon("t7_staff_water_melee"));
			}
			if(weapon.name == "t7_staff_fire_upgraded")
			{
				self.var_d324b086 = self zm_utility::get_player_melee_weapon();
				self.var_662cc91e = GetWeapon("t7_staff_fire_melee");
				self GiveWeapon(GetWeapon("t7_staff_fire_melee"));
				self zm_utility::set_player_melee_weapon(GetWeapon("t7_staff_fire_melee"));
			}
			if(weapon.name == "t7_staff_bolt_upgraded")
			{
				self.var_d324b086 = self zm_utility::get_player_melee_weapon();
				self.var_662cc91e = GetWeapon("t7_staff_bolt_melee");
				self GiveWeapon(GetWeapon("t7_staff_bolt_melee"));
				self zm_utility::set_player_melee_weapon(GetWeapon("t7_staff_bolt_melee"));
			}
			if(weapon.name == "t7_staff_air_upgraded")
			{
				self.var_d324b086 = self zm_utility::get_player_melee_weapon();
				self.var_662cc91e = GetWeapon("t7_staff_air_melee");
				self GiveWeapon(GetWeapon("t7_staff_air_melee"));
				self zm_utility::set_player_melee_weapon(GetWeapon("t7_staff_air_melee"));
			}
		}
		else if(!is_weapon_upgraded_staff(weapon))
		{
			self TakeWeapon(self.var_662cc91e);
			self.var_662cc91e = undefined;
			self zm_utility::set_player_melee_weapon(self.var_d324b086);
			self.var_d324b086 = undefined;
		}
	}
}

/*
	Name: function_d73989a
	Namespace: namespace_951345fe
	Checksum: 0x24AB0CA9
	Offset: 0x16F8
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 301
*/
function function_d73989a(w_weapon)
{
	Array = [];
	Array[0] = 0;
	Array[1] = 0;
	Array[2] = 4;
	Array[3] = 6;
	var_643e8b80 = Int(self GetWeaponAmmoClip(w_weapon));
	var_900bd247 = 0;
	for(i = 0; i < self.chargeShotLevel; i++)
	{
		if(var_643e8b80 < Array[i])
		{
			break;
		}
		var_900bd247++;
	}
	return var_900bd247;
}

/*
	Name: function_95be3a13
	Namespace: namespace_951345fe
	Checksum: 0xA71BFABA
	Offset: 0x17F0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 331
*/
function function_95be3a13(weapon)
{
	switch(weapon.name)
	{
		case "t7_staff_air":
		case "t7_staff_air_upgraded":
		case "t7_staff_bolt":
		case "t7_staff_bolt_upgraded":
		case "t7_staff_fire":
		case "t7_staff_fire_upgraded":
		case "t7_staff_revive":
		case "t7_staff_water":
		case "t7_staff_water_upgraded":
		{
			return 1;
		}
		default
		{
			return 0;
		}
	}
}

/*
	Name: is_weapon_upgraded_staff
	Namespace: namespace_951345fe
	Checksum: 0xE5277CA9
	Offset: 0x1880
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 364
*/
function is_weapon_upgraded_staff(weapon)
{
	switch(weapon.name)
	{
		case "t7_staff_air_upgraded":
		case "t7_staff_bolt_upgraded":
		case "t7_staff_fire_upgraded":
		case "t7_staff_water_upgraded":
		{
			return 1;
		}
		default
		{
			return 0;
		}
	}
}

/*
	Name: function_8b325b40
	Namespace: namespace_951345fe
	Checksum: 0x492B6CCE
	Offset: 0x18E8
	Size: 0x1F8
	Parameters: 0
	Flags: None
	Line Number: 392
*/
function function_8b325b40()
{
	if(isdefined(self.var_2dce8d67) && self.var_2dce8d67)
	{
		return 1;
	}
	arch = self.archetype;
	switch(arch)
	{
		case "human":
		{
			return 0;
		}
		case "human_clone":
		{
			return 0;
		}
		case "human_riotshield":
		{
			return 0;
		}
		case "human_rpg":
		{
			return 0;
		}
		case "robot":
		{
			return 1;
		}
		case "warlord":
		{
			return 1;
		}
		case "zombie":
		{
			return 0;
		}
		case "zombie_dog":
		{
			return 0;
		}
		case "direwolf":
		{
			return 1;
		}
		case "skeleton":
		{
			return 1;
		}
		case "zod_companion":
		{
			return 1;
		}
		case "margwa":
		{
			return 1;
		}
		case "mechz":
		{
			return 1;
		}
		case "mannequin":
		{
			return 1;
		}
		case "thrasher":
		{
			return 1;
		}
		case "raz":
		{
			return 1;
		}
		case "keeper_companion":
		{
			return 1;
		}
		case "apothicon_fury":
		{
			return 1;
		}
		case "keeper":
		{
			return 1;
		}
		case "amws":
		{
			return 1;
		}
		case "hunter":
		{
			return 1;
		}
		case "quadtank":
		{
			return 1;
		}
		case "raps":
		{
			return 1;
		}
		case "scout":
		{
			return 1;
		}
		case "siegebot":
		{
			return 1;
		}
		case "turret":
		{
			return 1;
		}
		case "wasp":
		{
			return 1;
		}
		case "parasite":
		{
			return 1;
		}
		case "glaive":
		{
			return 1;
		}
		case "sentinel_drone":
		{
			return 1;
		}
		case "spider":
		{
			return 1;
		}
		default
		{
			return 0;
		}
	}
	return;
}

/*
	Name: function_880d6c62
	Namespace: namespace_951345fe
	Checksum: 0xF7C82649
	Offset: 0x1AE8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 543
*/
function function_880d6c62()
{
	self endon("death");
	wait(0.75);
	self delete();
}

/*
	Name: function_e300dd3
	Namespace: namespace_951345fe
	Checksum: 0xAE8F63B
	Offset: 0x1B20
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 560
*/
function function_e300dd3()
{
	self endon("death");
	self endon("delete");
	while(1)
	{
		self RotateTo((0, 0, 0), 0.5);
		wait(0.5);
		self RotateTo(VectorScale((0, 1, 0), 90), 0.5);
		wait(0.5);
		self RotateTo(VectorScale((0, 1, 0), 180), 0.5);
		wait(0.5);
		self RotateTo(VectorScale((0, 1, 0), 270), 0.5);
		wait(0.5);
	}
}

/*
	Name: zombie_gib_all
	Namespace: namespace_951345fe
	Checksum: 0xFDB91CDD
	Offset: 0x1C08
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 587
*/
function zombie_gib_all()
{
	if(!isdefined(self))
	{
		return;
	}
	if(self function_8b325b40())
	{
		return;
	}
	a_gib_ref = [];
	a_gib_ref[0] = level._ZOMBIE_GIB_PIECE_INDEX_ALL;
	self gib("normal", a_gib_ref);
	self ghost();
	wait(0.4);
	if(isdefined(self))
	{
		self delete();
		return;
	}
}

/*
	Name: zombie_gib_guts
	Namespace: namespace_951345fe
	Checksum: 0x84AFADBC
	Offset: 0x1CC0
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 619
*/
function zombie_gib_guts()
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.is_mechz) && self.is_mechz)
	{
		return;
	}
	v_origin = self GetTagOrigin("j_spinelower");
	if(isdefined(v_origin))
	{
		v_forward = AnglesToForward((0, RandomInt(360), 0));
		playFX(level._effect["zombie_guts_explosion"], v_origin, v_forward);
	}
	util::wait_network_frame();
	if(isdefined(self))
	{
		self ghost();
		wait(RandomFloatRange(0.4, 1.1));
		if(isdefined(self))
		{
			self delete();
		}
	}
}

/*
	Name: function_83833c81
	Namespace: namespace_951345fe
	Checksum: 0xB0594A5A
	Offset: 0x1DF8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 657
*/
function function_83833c81()
{
	var_74f946ae = struct::get_array("harrybo21_staff_upgrade", "script_noteworthy");
	if(!isdefined(var_74f946ae) || var_74f946ae.size < 1)
	{
		return;
	}
	for(i = 0; i < var_74f946ae.size; i++)
	{
		function_9bc003d1(var_74f946ae[i]);
	}
	return;
}

/*
	Name: function_6ddf8e1
	Namespace: namespace_951345fe
	Checksum: 0x61B4DA68
	Offset: 0x1E98
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 681
*/
function function_6ddf8e1(script_string)
{
	triggers = GetEntArray("harrybo21_staff_pedestal", "script_noteworthy");
	if(!isdefined(triggers) || triggers.size < 1)
	{
		return undefined;
	}
	for(i = 0; i < triggers.size; i++)
	{
		if(triggers[i].script_string == script_string)
		{
			return triggers[i];
		}
	}
	return undefined;
}

/*
	Name: function_c6b4c7a
	Namespace: namespace_951345fe
	Checksum: 0x7DBC8E28
	Offset: 0x1F50
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 708
*/
function function_c6b4c7a(script_string)
{
	triggers = GetEntArray("harrybo21_staff_upgrade", "script_noteworthy");
	if(!isdefined(triggers) || triggers.size < 1)
	{
		return undefined;
	}
	for(i = 0; i < triggers.size; i++)
	{
		if(triggers[i].script_string == script_string)
		{
			return triggers[i];
		}
	}
	return undefined;
}

/*
	Name: function_9bc003d1
	Namespace: namespace_951345fe
	Checksum: 0x3C1272AA
	Offset: 0x2008
	Size: 0x648
	Parameters: 1
	Flags: None
	Line Number: 735
*/
function function_9bc003d1(struct)
{
	trigger = spawn("trigger_radius_use", struct.origin - VectorScale((0, 0, 1), 30), 0, 40, 80);
	trigger.script_noteworthy = "harrybo21_staff_upgrade";
	trigger.script_string = struct.script_string;
	trigger.var_161131c4 = 0;
	trigger.open = 0;
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("");
	trigger.linked_model = spawn("script_model", struct.origin);
	trigger.linked_model.angles = struct.angles;
	struct_2 = struct::get(struct.target, "targetname");
	trigger.var_1efb32c0 = spawn("script_model", struct_2.origin - VectorScale((0, 0, 1), 96));
	trigger.var_1efb32c0.angles = struct_2.angles;
	struct_3 = struct::get(struct_2.target, "targetname");
	trigger.var_60c77236 = spawn("script_model", struct_3.origin);
	trigger.var_60c77236.angles = struct_3.angles;
	if(isdefined(struct.script_string))
	{
		switch(struct.script_string)
		{
			case "fire":
			{
				trigger.linked_model SetModel("wpn_t7_zmb_hd_staff_fire_world");
				trigger.var_1efb32c0 SetModel("p7_zm_ori_elm_plinth_top_fire");
				trigger.var_60c77236 SetModel("p7_zm_ori_elm_plinth_base_fire");
				trigger thread function_aef5e42e("t7_staff_fire", "t7_staff_fire_upgraded", "wpn_t7_zmb_hd_staff_fire_upgraded_world", "Press & hold ^3&&1^7 to take Kagutsuchi's Blood", trigger.script_string);
				break;
			}
			case "ice":
			{
				trigger.linked_model SetModel("wpn_t7_zmb_hd_staff_water_world");
				trigger.var_1efb32c0 SetModel("p7_zm_ori_elm_plinth_top_ice");
				trigger.var_60c77236 SetModel("p7_zm_ori_elm_plinth_base_ice");
				trigger thread function_aef5e42e("t7_staff_water", "t7_staff_water_upgraded", "wpn_t7_zmb_hd_staff_water_upgraded_world", "Press & hold ^3&&1^7 to take Ull's Arrow", trigger.script_string);
				break;
			}
			case "wind":
			{
				trigger.linked_model SetModel("wpn_t7_zmb_hd_staff_air_world");
				trigger.var_1efb32c0 SetModel("p7_zm_ori_elm_plinth_top_wind");
				trigger.var_60c77236 SetModel("p7_zm_ori_elm_plinth_base_wind");
				trigger thread function_aef5e42e("t7_staff_air", "t7_staff_air_upgraded", "wpn_t7_zmb_hd_staff_air_upgraded_world", "Press & hold ^3&&1^7 to take Boreas' Fury", trigger.script_string);
				break;
			}
			case "lightning":
			{
				trigger.linked_model SetModel("wpn_t7_zmb_hd_staff_lightning_world");
				trigger.var_1efb32c0 SetModel("p7_zm_ori_elm_plinth_top_lightning");
				trigger.var_60c77236 SetModel("p7_zm_ori_elm_plinth_base_lightning");
				trigger thread function_aef5e42e("t7_staff_bolt", "t7_staff_bolt_upgraded", "wpn_t7_zmb_hd_staff_lightning_upgraded_world", "Press & hold ^3&&1^7 to take Kimat's Bite", trigger.script_string);
				break;
				break;
			}
			default
			{
			}
		}
	}
	trigger.linked_model Hide();
	trigger.linked_model thread function_e300dd3();
}

/*
	Name: function_aef5e42e
	Namespace: namespace_951345fe
	Checksum: 0xCBBE2C9A
	Offset: 0x2658
	Size: 0x7F0
	Parameters: 5
	Flags: None
	Line Number: 812
*/
function function_aef5e42e(staff, staff_upgraded, var_fcf5b97b, hintString, script_string)
{
	self setHintString("Press & hold ^3&&1^7 to place " + GetWeapon(staff).displayName);
	while(1)
	{
		self waittill("trigger", player);
		var_1bcd223d = player GetCurrentWeapon();
		if(!isdefined(var_1bcd223d))
		{
			return;
		}
		else if(var_1bcd223d != level.weaponNone || !zm_weapons::is_weapon_included(var_1bcd223d))
		{
			return;
		}
		if(!(isdefined(self.open) && self.open))
		{
			continue;
		}
		if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
		{
			wait(0.05);
			continue;
		}
		if(isdefined(self.var_161131c4) && self.var_161131c4)
		{
			self setHintString("");
			self.linked_model Hide();
			player zm_weapons::weapon_give(GetWeapon(staff_upgraded), 0, 0, 1, 1);
			self.var_161131c4 = 0;
			var_8d609b3 = function_6ddf8e1(script_string);
			var_8d609b3.upgraded = 1;
			var_8d609b3.linked_model SetModel(var_fcf5b97b);
			player playlocalsound("wpn_staff_1straise_upgraded");
			wait(1);
			if(isdefined(self.var_7733aebb))
			{
				self.var_7733aebb delete();
			}
			var_8d609b3 thread function_6de6d98a(player, staff_upgraded);
			wait(1);
			self setHintString("Press & hold ^3&&1^7 to place " + GetWeapon(staff_upgraded).displayName);
		}
		else if(!(isdefined(self.var_161131c4) && self.var_161131c4) && player hasweapon(GetWeapon(staff_upgraded)))
		{
			self setHintString("");
			player zm_weapons::weapon_take(GetWeapon(staff_upgraded));
			self.var_161131c4 = 1;
			self.linked_model show();
			self setHintString("Press & hold ^3&&1^7 to take " + GetWeapon(staff_upgraded).displayName);
		}
		else if(!(isdefined(self.var_161131c4) && self.var_161131c4) && player hasweapon(GetWeapon(staff)))
		{
			self setHintString("");
			player zm_weapons::weapon_take(GetWeapon(staff));
			self.var_161131c4 = 1;
			self.linked_model show();
			self thread function_64e8e8cc();
			self waittill("hash_a915bade");
			self setHintString("Press & hold ^3&&1^7 to take " + GetWeapon(staff_upgraded).displayName);
			if(isdefined(self.var_7733aebb))
			{
				self.var_7733aebb delete();
			}
			self.var_7733aebb = spawn("script_model", self.origin + VectorScale((0, 0, 1), 25));
			self.var_7733aebb.angles = self.angles;
			self.var_7733aebb SetModel("tag_origin");
			if(isdefined(self.script_string))
			{
				switch(self.script_string)
				{
					case "fire":
					{
						PlayFXOnTag("harry/staff/fire/fx_staff_fire_upgrade_glow_complete", self.var_7733aebb, "tag_origin");
						PlayFXOnTag("harry/staff/fire/fx_staff_fire_upgrade_flash", self.var_7733aebb, "tag_origin");
						break;
					}
					case "ice":
					{
						PlayFXOnTag("harry/staff/water/fx_staff_water_upgrade_glow_complete", self.var_7733aebb, "tag_origin");
						PlayFXOnTag("harry/staff/water/fx_staff_water_upgrade_flash", self.var_7733aebb, "tag_origin");
						break;
					}
					case "wind":
					{
						PlayFXOnTag("harry/staff/air/fx_staff_wind_upgrade_glow_complete", self.var_7733aebb, "tag_origin");
						PlayFXOnTag("harry/staff/air/fx_staff_wind_upgrade_flash", self.var_7733aebb, "tag_origin");
						break;
					}
					case "lightning":
					{
						PlayFXOnTag("harry/staff/bolt/fx_staff_bolt_upgrade_glow_complete", self.var_7733aebb, "tag_origin");
						PlayFXOnTag("harry/staff/air/fx_staff_wind_upgrade_flash", self.var_7733aebb, "tag_origin");
						break;
						break;
					}
					default
					{
					}
				}
			}
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				players[i] playlocalsound("wpn_staff_1straise_upgraded");
			}
			self.linked_model SetModel(var_fcf5b97b);
			wait(1);
			self setHintString("Press & hold ^3&&1^7 to take " + GetWeapon(staff_upgraded).displayName);
		}
	}
}

/*
	Name: function_64e8e8cc
	Namespace: namespace_951345fe
	Checksum: 0xF3B46257
	Offset: 0x2E50
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 935
*/
function function_64e8e8cc()
{
	trigger = namespace_12c937e1::function_f2fa04c(self.var_60c77236.origin, self.angles, 1, 256, 128);
	trigger.script_noteworthy = "harrybo21_soul_chest";
	trigger.var_c29b85d1 = 5;
	trigger.kills = 0;
	trigger.timer = 0;
	trigger.var_21aeaaf7 = 0;
	trigger.active = 0;
	trigger.linked_model = self;
	trigger setcursorhint("HINT_NOICON");
	origin = self.origin;
	trigger.var_385d7ee7 = &function_5aed2bfc;
	trigger.var_afaa2468 = &function_5aed2bfc;
	while(1)
	{
		if(trigger.kills >= trigger.var_c29b85d1)
		{
			break;
		}
		trigger waittill("hash_abaab100");
	}
	trigger delete();
	self notify("hash_a915bade");
}

/*
	Name: function_5aed2bfc
	Namespace: namespace_951345fe
	Checksum: 0x9ACF73B8
	Offset: 0x2FE0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 971
*/
function function_5aed2bfc()
{
}

/*
	Name: function_acc69ce9
	Namespace: namespace_951345fe
	Checksum: 0xF7E48C6F
	Offset: 0x2FF0
	Size: 0x4E8
	Parameters: 7
	Flags: None
	Line Number: 985
*/
function function_acc69ce9(staff, var_838b88ce, hintString, var_3374f7a5, var_d6d22dae, var_7f35ffb5, script_string)
{
	trigger = spawn("trigger_radius_use", var_d6d22dae.origin, 0, 40, 80);
	trigger.script_noteworthy = "harrybo21_staff_pedestal";
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString(hintString);
	trigger.var_161131c4 = 1;
	trigger.upgraded = 0;
	trigger.script_string = script_string;
	trigger.linked_model = var_7f35ffb5;
	trigger.linked_model show();
	trigger thread function_e93a97dc(staff, var_838b88ce, hintString, var_3374f7a5, trigger.linked_model, script_string);
	trigger.player_clip = undefined;
	trigger.var_4b6d038d = undefined;
	while(1)
	{
		trigger waittill("trigger", player);
		var_1bcd223d = player GetCurrentWeapon();
		if(!isdefined(var_1bcd223d))
		{
			return;
		}
		else if(var_1bcd223d != level.weaponNone && !zm_weapons::is_weapon_included(var_1bcd223d))
		{
			return;
		}
		if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
		{
			wait(0.05);
			continue;
		}
		if(isdefined(trigger.var_161131c4) && trigger.var_161131c4)
		{
			trigger setHintString("");
			trigger.linked_model Hide();
			var_1f5363cd = staff;
			if(isdefined(trigger.upgraded) && trigger.upgraded)
			{
				var_1f5363cd = var_838b88ce;
			}
			player zm_weapons::weapon_give(GetWeapon(var_1f5363cd), 0, 0, 1, 1);
			if(isdefined(trigger.player_clip) && isdefined(trigger.var_4b6d038d))
			{
				player SetWeaponAmmoClip(GetWeapon(var_1f5363cd), trigger.player_clip);
				player SetWeaponAmmoStock(GetWeapon(var_1f5363cd), trigger.var_4b6d038d);
			}
			trigger thread function_6de6d98a(player, var_1f5363cd);
			trigger.var_161131c4 = 0;
			var_9a83e98e = function_c6b4c7a(trigger.script_string);
			if(isdefined(var_9a83e98e) && (!(isdefined(var_9a83e98e.open) && var_9a83e98e.open)))
			{
				var_9a83e98e thread function_a5a7a031(staff);
				continue;
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_6de6d98a
	Namespace: namespace_951345fe
	Checksum: 0xB70DCCB6
	Offset: 0x34E0
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 1058
*/
function function_6de6d98a(player, staff)
{
	player endon("disconnect");
	self notify("hash_6f3f1f7b");
	self endon("hash_6f3f1f7b");
	self.player_clip = 0;
	self.var_4b6d038d = 0;
	while(1)
	{
		if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
		{
			wait(0.05);
			continue;
		}
		if(!player hasweapon(GetWeapon(staff)) || !isalive(player))
		{
			break;
		}
		player_clip = player GetWeaponAmmoClip(GetWeapon(staff));
		var_4b6d038d = player GetWeaponAmmoStock(GetWeapon(staff));
		if(player_clip != self.player_clip)
		{
			self.player_clip = player_clip;
		}
		if(var_4b6d038d != self.var_4b6d038d)
		{
			self.var_4b6d038d = var_4b6d038d;
		}
		wait(0.05);
	}
}

/*
	Name: function_a5a7a031
	Namespace: namespace_951345fe
	Checksum: 0xC2695E61
	Offset: 0x3688
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 1100
*/
function function_a5a7a031(staff)
{
	self.open = 1;
	self.var_1efb32c0 moveto(self.var_1efb32c0.origin + VectorScale((0, 0, 1), 96), 5);
	self.var_7733aebb = spawn("script_model", self.origin + VectorScale((0, 0, 1), 25));
	self.var_7733aebb.angles = self.angles;
	self.var_7733aebb SetModel("tag_origin");
	if(isdefined(self.script_string))
	{
		switch(self.script_string)
		{
			case "fire":
			{
				PlayFXOnTag("harry/staff/fire/fx_staff_fire_upgrade_glow", self.var_7733aebb, "tag_origin");
				break;
			}
			case "ice":
			{
				PlayFXOnTag("harry/staff/water/fx_staff_water_upgrade_glow", self.var_7733aebb, "tag_origin");
				break;
			}
			case "wind":
			{
				PlayFXOnTag("harry/staff/air/fx_staff_wind_upgrade_glow", self.var_7733aebb, "tag_origin");
				break;
			}
			case "lightning":
			{
				PlayFXOnTag("harry/staff/bolt/fx_staff_bolt_upgrade_glow", self.var_7733aebb, "tag_origin");
				break;
				break;
			}
			default
			{
			}
		}
	}
	self setHintString("Press & hold ^3&&1^7 to place " + GetWeapon(staff).displayName);
}

/*
	Name: function_e93a97dc
	Namespace: namespace_951345fe
	Checksum: 0x2D7F5B72
	Offset: 0x3898
	Size: 0x290
	Parameters: 6
	Flags: None
	Line Number: 1150
*/
function function_e93a97dc(staff, var_838b88ce, hintString, var_3374f7a5, var_7f35ffb5, script_string)
{
	while(1)
	{
		if(isdefined(self.var_161131c4) && self.var_161131c4)
		{
			wait(0.05);
			continue;
		}
		var_9a83e98e = function_c6b4c7a(script_string);
		if(isdefined(var_9a83e98e) && (isdefined(var_9a83e98e.var_161131c4) && var_9a83e98e.var_161131c4))
		{
			wait(0.05);
			continue;
		}
		lost = 1;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] laststand::player_is_in_laststand() || (isdefined(players[i].intermission) && players[i].intermission))
			{
				lost = 0;
				break;
			}
			if(players[i] hasweapon(GetWeapon(staff)) || players[i] hasweapon(GetWeapon(var_838b88ce)))
			{
				lost = 0;
				break;
			}
		}
		if(isdefined(lost) && lost && (!(isdefined(self.var_161131c4) && self.var_161131c4)))
		{
			self.var_161131c4 = 1;
			var_7f35ffb5 show();
			if(isdefined(self.upgraded) && self.upgraded)
			{
				self setHintString(var_3374f7a5);
				continue;
			}
			self setHintString(hintString);
		}
		wait(0.05);
	}
}

