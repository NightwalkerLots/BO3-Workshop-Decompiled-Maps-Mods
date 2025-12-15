#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weapons;

#namespace namespace_951345fe;

/*
	Name: __init__sytem__
	Namespace: namespace_951345fe
	Checksum: 0xC6D2456
	Offset: 0x308
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_utility", &__init__, undefined, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_951345fe
	Checksum: 0x7F95B986
	Offset: 0x348
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	callback::on_localplayer_spawned(&on_player_spawned);
}

/*
	Name: function_f988edf4
	Namespace: namespace_951345fe
	Checksum: 0x92475D95
	Offset: 0x378
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 51
*/
function function_f988edf4(local_client_num)
{
	self endon("death_or_disconnect");
	self notify("hash_f988edf4");
	self endon("hash_f988edf4");
	while(isdefined(self))
	{
		level waittill("hash_8a03971d", var_3d850ea0, w_weapon, var_fd1c865f);
		if(local_client_num != var_3d850ea0)
		{
			continue;
		}
		if(!is_weapon_upgraded_staff(w_weapon))
		{
			continue;
		}
		self MapShaderConstant(local_client_num, 0, "scriptVector2", 0, 1, self.var_d83abf7, 0);
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_951345fe
	Checksum: 0x137DA388
	Offset: 0x450
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function on_player_spawned(local_client_num)
{
	self thread function_bda3c2e(local_client_num);
	self thread function_b0d70f63(local_client_num);
	self thread function_f988edf4(local_client_num);
}

/*
	Name: function_b0d70f63
	Namespace: namespace_951345fe
	Checksum: 0x67C8689A
	Offset: 0x4B0
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 98
*/
function function_b0d70f63(local_client_num)
{
	self endon("death_or_disconnect");
	self notify("hash_b0d70f63");
	self endon("hash_b0d70f63");
	while(1)
	{
		self waittill("weapon_change", w_weapon, w_old_weapon);
		if(!isdefined(w_weapon) || w_weapon == level.weaponNone)
		{
			continue;
		}
		if(function_95be3a13(w_weapon))
		{
			self.var_900bd247 = 4;
			ui_model = CreateUIModel(GetUIModelForController(local_client_num), "hudItems.showDpadLeft_Staff");
			if(is_weapon_upgraded_staff(w_weapon))
			{
				SetUIModelValue(ui_model, 1);
			}
			else if(w_weapon.name != "t7_staff_revive")
			{
				SetUIModelValue(ui_model, 0);
			}
			ui_model = CreateUIModel(GetUIModelForController(local_client_num), "hudItems.dpadLeftAmmo");
			if(w_weapon.name == "t7_staff_revive")
			{
				SetUIModelValue(ui_model, 1);
				continue;
			}
			SetUIModelValue(ui_model, 0);
			continue;
		}
		ui_model = CreateUIModel(GetUIModelForController(local_client_num), "hudItems.showDpadLeft_Staff");
		SetUIModelValue(ui_model, 0);
	}
}

/*
	Name: function_bda3c2e
	Namespace: namespace_951345fe
	Checksum: 0xB9DA274
	Offset: 0x6E8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 146
*/
function function_bda3c2e(local_client_num)
{
	self endon("disconnect");
	self notify("hash_5972a089");
	self endon("hash_5972a089");
	while(isdefined(self))
	{
		w_weapon = GetCurrentWeapon(local_client_num);
		if(is_weapon_upgraded_staff(w_weapon))
		{
			var_900bd247 = function_d73989a(local_client_num, w_weapon);
			if(!isdefined(self.var_900bd247) || self.var_900bd247 != var_900bd247)
			{
				self function_1d77665e(local_client_num, w_weapon, var_900bd247);
				self MapShaderConstant(local_client_num, 0, "scriptVector2", 0, 1, var_900bd247, 0);
				self.var_900bd247 = var_900bd247;
			}
		}
		wait(0.01);
	}
}

/*
	Name: function_d73989a
	Namespace: namespace_951345fe
	Checksum: 0xF5DB6DB3
	Offset: 0x818
	Size: 0x118
	Parameters: 2
	Flags: None
	Line Number: 178
*/
function function_d73989a(local_client_num, w_weapon)
{
	Array = [];
	Array[0] = 0;
	Array[1] = 0;
	Array[2] = 4;
	Array[3] = 6;
	var_fd1c865f = function_11e8db(local_client_num);
	var_643e8b80 = Int(GetWeaponAmmoClip(local_client_num, w_weapon));
	var_900bd247 = 0;
	for(i = 0; i < var_fd1c865f; i++)
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
	Name: function_1d77665e
	Namespace: namespace_951345fe
	Checksum: 0x773969C3
	Offset: 0x938
	Size: 0x1C8
	Parameters: 3
	Flags: None
	Line Number: 209
*/
function function_1d77665e(local_client_num, w_weapon, n_charge_level)
{
	if(!isdefined(n_charge_level) || n_charge_level < 1)
	{
		self StopAllLoopSounds(0.5);
		return;
	}
	loop_sound = undefined;
	switch(w_weapon.name)
	{
		case "t7_staff_fire_upgraded":
		{
			loop_sound = "wpn_firestaff_charge_loop";
			self playsound(local_client_num, "wpn_firestaff_charge_" + n_charge_level);
			break;
		}
		case "t7_staff_water_upgraded":
		{
			loop_sound = "wpn_waterstaff_charge_loop";
			self playsound(local_client_num, "wpn_waterstaff_charge_" + n_charge_level);
			break;
		}
		case "t7_staff_air_upgraded":
		{
			loop_sound = "wpn_airstaff_charge_loop";
			self playsound(local_client_num, "wpn_airstaff_charge_" + n_charge_level);
			break;
		}
		case "t7_staff_bolt_upgraded":
		{
			loop_sound = "wpn_lightningstaff_charge_loop";
			self playsound(local_client_num, "wpn_lightningstaff_charge_" + n_charge_level);
			break;
			break;
		}
		default
		{
		}
	}
	if(n_charge_level != 1 || !isdefined(loop_sound))
	{
		return;
	}
	self PlayLoopSound(loop_sound, 0.5);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_95be3a13
	Namespace: namespace_951345fe
	Checksum: 0xF7696051
	Offset: 0xB08
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 267
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
	Checksum: 0xF68C0409
	Offset: 0xB98
	Size: 0x5A
	Parameters: 1
	Flags: None
	Line Number: 300
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

