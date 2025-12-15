#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_weapons;

#namespace namespace_de74c222;

/*
	Name: __init__sytem__
	Namespace: namespace_de74c222
	Checksum: 0x91947F07
	Offset: 0x300
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_ammo_counter", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_de74c222
	Checksum: 0x342E7569
	Offset: 0x348
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	clientfield::register("toplayer", "ammo_counter", 9000, 2, "int", &function_27ddf5d7, 0, 1);
	level._effect["ammo_counter"] = [];
	level._effect["ammo_counter"][0] = "harry/ammo_counter/fx_ammo_counter_0";
	level._effect["ammo_counter"][1] = "harry/ammo_counter/fx_ammo_counter_1";
	level._effect["ammo_counter"][2] = "harry/ammo_counter/fx_ammo_counter_2";
	level._effect["ammo_counter"][3] = "harry/ammo_counter/fx_ammo_counter_3";
	level._effect["ammo_counter"][4] = "harry/ammo_counter/fx_ammo_counter_4";
	level._effect["ammo_counter"][5] = "harry/ammo_counter/fx_ammo_counter_5";
	level._effect["ammo_counter"][6] = "harry/ammo_counter/fx_ammo_counter_6";
	level._effect["ammo_counter"][7] = "harry/ammo_counter/fx_ammo_counter_7";
	level._effect["ammo_counter"][8] = "harry/ammo_counter/fx_ammo_counter_8";
	level._effect["ammo_counter"][9] = "harry/ammo_counter/fx_ammo_counter_9";
}

/*
	Name: function_27ddf5d7
	Namespace: namespace_de74c222
	Checksum: 0xC7C27BD3
	Offset: 0x4F0
	Size: 0x58
	Parameters: 7
	Flags: None
	Line Number: 61
*/
function function_27ddf5d7(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	self.var_2bc0c962 = newVal;
	self notify("hash_c0020fe6");
}

/*
	Name: __main__
	Namespace: namespace_de74c222
	Checksum: 0x689D5F2B
	Offset: 0x550
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function __main__()
{
	callback::on_localplayer_spawned(&localplayer_spawned);
}

/*
	Name: localplayer_spawned
	Namespace: namespace_de74c222
	Checksum: 0x6B76343C
	Offset: 0x580
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 92
*/
function localplayer_spawned(localClientNum)
{
	self thread function_c2c67d49(localClientNum);
	self thread function_6b6176ae(localClientNum);
}

/*
	Name: function_6b6176ae
	Namespace: namespace_de74c222
	Checksum: 0xA0E7B1D9
	Offset: 0x5C8
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 108
*/
function function_6b6176ae(localClientNum)
{
	self endon("disconnect");
	current_ammo = 0;
	while(1)
	{
		currentWeapon = GetCurrentWeapon(localClientNum);
		clip_ammo = GetWeaponAmmoClip(localClientNum, currentWeapon);
		if(!isdefined(clip_ammo))
		{
			clip_ammo = 0;
		}
		if(clip_ammo != current_ammo)
		{
			current_ammo = clip_ammo;
			self notify("hash_c0020fe6");
		}
		wait(0.01);
	}
}

/*
	Name: function_c2c67d49
	Namespace: namespace_de74c222
	Checksum: 0xDFE63A0E
	Offset: 0x690
	Size: 0x440
	Parameters: 1
	Flags: None
	Line Number: 139
*/
function function_c2c67d49(localClientNum)
{
	self endon("disconnect");
	var_4a0e34bc = -1;
	var_b294dc67 = -1;
	var_bea10aa8 = -1;
	current_weapon = undefined;
	var_e98e1a7a = undefined;
	var_f9094e3 = undefined;
	var_9d8925a8 = undefined;
	while(1)
	{
		self waittill("hash_c0020fe6");
		if(!isdefined(self.var_2bc0c962) || !self.var_2bc0c962)
		{
			if(isdefined(var_e98e1a7a))
			{
				stopfx(localClientNum, var_e98e1a7a);
			}
			if(isdefined(var_f9094e3))
			{
				stopfx(localClientNum, var_f9094e3);
			}
			if(isdefined(var_9d8925a8))
			{
				stopfx(localClientNum, var_9d8925a8);
				continue;
			}
		}
		currentWeapon = GetCurrentWeapon(localClientNum);
		clip_ammo = GetWeaponAmmoClip(localClientNum, currentWeapon);
		if(!isdefined(clip_ammo))
		{
			clip_ammo = 0;
		}
		var_4f50b01b = Int(clip_ammo % 10);
		var_cb03f742 = Int(clip_ammo - var_4f50b01b % 100 / 10);
		var_7e9a814f = Int(clip_ammo - var_4f50b01b + var_cb03f742 * 10 / 100);
		if(var_7e9a814f != var_bea10aa8 || currentWeapon != current_weapon)
		{
			if(isdefined(var_e98e1a7a))
			{
				stopfx(localClientNum, var_e98e1a7a);
			}
			if(clip_ammo > 99 && ViewmodelHasTag(localClientNum, "j_counter_0"))
			{
				var_e98e1a7a = PlayViewmodelFX(localClientNum, level._effect["ammo_counter"][var_7e9a814f], "j_counter_0");
			}
			var_bea10aa8 = var_7e9a814f;
		}
		if(var_cb03f742 != var_b294dc67 || currentWeapon != current_weapon)
		{
			if(isdefined(var_f9094e3))
			{
				stopfx(localClientNum, var_f9094e3);
			}
			if(clip_ammo > 9 && ViewmodelHasTag(localClientNum, "j_counter_1"))
			{
				var_f9094e3 = PlayViewmodelFX(localClientNum, level._effect["ammo_counter"][var_cb03f742], "j_counter_1");
			}
			var_b294dc67 = var_cb03f742;
		}
		if(var_4f50b01b != var_4a0e34bc || currentWeapon != current_weapon)
		{
			if(isdefined(var_9d8925a8))
			{
				stopfx(localClientNum, var_9d8925a8);
			}
			if(ViewmodelHasTag(localClientNum, "j_counter_2"))
			{
				var_9d8925a8 = PlayViewmodelFX(localClientNum, level._effect["ammo_counter"][var_4f50b01b], "j_counter_2");
			}
			var_4a0e34bc = var_4f50b01b;
		}
		current_weapon = currentWeapon;
	}
}

