#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_weapons;

#namespace zm_perk_additionalprimaryweapon;

/*
	Name: __init__sytem__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x5CBEBB92
	Offset: 0x380
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_additionalprimaryweapon", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x6D6786D2
	Offset: 0x3C8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		enable_additional_primary_weapon_perk_for_level();
	}
}

/*
	Name: __main__
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x8A260A66
	Offset: 0x400
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function __main__()
{
	if(isdefined(1) && 1)
	{
		function_7699414c();
	}
}

/*
	Name: enable_additional_primary_weapon_perk_for_level
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xFE46C378
	Offset: 0x438
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function enable_additional_primary_weapon_perk_for_level()
{
	zm_perks::register_perk_basic_info("specialty_additionalprimaryweapon", "additionalprimaryweapon", 4000, &"ZOMBIE_PERK_ADDITIONALPRIMARYWEAPON", GetWeapon("zombie_perk_bottle_additionalprimaryweapon"));
	zm_perks::register_perk_precache_func("specialty_additionalprimaryweapon", &additional_primary_weapon_precache);
	zm_perks::register_perk_clientfields("specialty_additionalprimaryweapon", &additional_primary_weapon_register_clientfield, &additional_primary_weapon_set_clientfield);
	zm_perks::register_perk_machine("specialty_additionalprimaryweapon", &additional_primary_weapon_perk_machine_setup);
	zm_perks::register_perk_threads("specialty_additionalprimaryweapon", &function_8a679456, &function_c493ba04);
	zm_perks::register_perk_host_migration_params("specialty_additionalprimaryweapon", "vending_additionalprimaryweapon", "specialty_additionalprimaryweapon");
}

/*
	Name: additional_primary_weapon_precache
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x815811D6
	Offset: 0x570
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function additional_primary_weapon_precache()
{
	level._effect["specialty_additionalprimaryweapon"] = "harry/zm_perks/fx_perk_mule_kick";
	level.machine_assets["specialty_additionalprimaryweapon"] = spawnstruct();
	level.machine_assets["specialty_additionalprimaryweapon"].weapon = GetWeapon("zombie_perk_bottle_additionalprimaryweapon");
	level.machine_assets["specialty_additionalprimaryweapon"].off_model = "p7_zm_vending_three_gun";
	level.machine_assets["specialty_additionalprimaryweapon"].on_model = "p7_zm_vending_three_gun";
}

/*
	Name: additional_primary_weapon_register_clientfield
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xFB950546
	Offset: 0x638
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function additional_primary_weapon_register_clientfield()
{
	clientfield::register("clientuimodel", "additional_primary_weapon_ui_glow", 1, 1, "int");
	clientfield::register("clientuimodel", "hudItems.perks.additional_primary_weapon", 1, 2, "int");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: additional_primary_weapon_set_clientfield
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x6D9C9AA8
	Offset: 0x6A8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 130
*/
function additional_primary_weapon_set_clientfield(n_state)
{
	if(n_state != 0 && (level namespace_b8afaefc::function_9f353429("specialty_additionalprimaryweapon") || self namespace_b8afaefc::function_9f353429("specialty_additionalprimaryweapon")))
	{
		n_state = 2;
	}
	if(n_state != 1)
	{
		self clientfield::set_player_uimodel("additional_primary_weapon_ui_glow", 0);
	}
	self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", n_state);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: additional_primary_weapon_perk_machine_setup
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x9C309C4F
	Offset: 0x760
	Size: 0x100
	Parameters: 4
	Flags: None
	Line Number: 155
*/
function additional_primary_weapon_perk_machine_setup(var_39cc5a0b, var_8bcf7b93, var_3189c3fc, e_collision)
{
	var_39cc5a0b.script_sound = "mus_perks_mulekick_jingle";
	var_39cc5a0b.script_string = "mule_perk";
	var_39cc5a0b.script_label = "mus_perks_mulekick_sting";
	var_39cc5a0b.target = "vending_additionalprimaryweapon";
	var_8bcf7b93.script_string = "mule_perk";
	var_8bcf7b93.targetname = "vending_additionalprimaryweapon";
	if(isdefined(var_3189c3fc))
	{
		var_3189c3fc.script_string = "mule_perk";
	}
	var_8bcf7b93 thread namespace_b8afaefc::function_2a628bd("specialty_additionalprimaryweapon", "i_fxt_zmb_mule_kick", (0.141176, 0.70196, 0.239215));
}

/*
	Name: function_8a679456
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x1ED27B73
	Offset: 0x868
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 180
*/
function function_8a679456()
{
	namespace_b8afaefc::function_ffb18d9f("specialty_additionalprimaryweapon", "3.0.4");
	if(level namespace_b8afaefc::function_9f353429("specialty_additionalprimaryweapon"))
	{
		self namespace_b8afaefc::function_7932e598("specialty_additionalprimaryweapon");
	}
	if(self namespace_b8afaefc::function_9f353429("specialty_additionalprimaryweapon"))
	{
		return;
	}
	self function_a5ed14f(1);
}

/*
	Name: function_c493ba04
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xA9722DD5
	Offset: 0x918
	Size: 0x88
	Parameters: 3
	Flags: None
	Line Number: 204
*/
function function_c493ba04(b_pause, str_perk, str_result)
{
	self function_a5ed14f(0, isdefined(b_pause) && b_pause || (isdefined(str_result) && isdefined(str_perk) && str_result == str_perk));
	self clientfield::set_player_uimodel("additional_primary_weapon_ui_glow", 0);
}

/*
	Name: function_7699414c
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xF0AF2985
	Offset: 0x9A8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 220
*/
function function_7699414c()
{
	level.additionalprimaryweapon_limit = 3;
	level.return_additionalprimaryweapon = &function_9b34aca3;
	callback::on_spawned(&function_f6f1c02e);
	if(isdefined(1) && 1)
	{
		namespace_b8afaefc::function_38f810ea("specialty_additionalprimaryweapon");
	}
}

/*
	Name: function_a5ed14f
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x923DF087
	Offset: 0xA20
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 241
*/
function function_a5ed14f(b_enabled, var_c48ac85d)
{
	if(isdefined(b_enabled) && b_enabled)
	{
		self function_9b34aca3();
		continue;
	}
	self clientfield::set_player_uimodel("additional_primary_weapon_ui_glow", 0);
	self function_ce6595fa(var_c48ac85d);
}

/*
	Name: function_ce6595fa
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xCE841A20
	Offset: 0xAA0
	Size: 0x1E8
	Parameters: 1
	Flags: None
	Line Number: 262
*/
function function_ce6595fa(var_c48ac85d)
{
	var_4c4f699a = [];
	var_e87eb6d6 = [];
	var_6c6831af = self getweaponslistprimaries();
	for(i = 0; i < var_6c6831af.size; i++)
	{
		if(isdefined(self.laststandpistol) && self.laststandpistol == var_6c6831af[i])
		{
			continue;
		}
		var_e87eb6d6[var_e87eb6d6.size] = var_6c6831af[i];
	}
	if(!isdefined(var_e87eb6d6) || !IsArray(var_e87eb6d6) || var_e87eb6d6.size < 3)
	{
		return;
	}
	for(i = 2; i < var_e87eb6d6.size; i++)
	{
		var_1d7eacf9 = var_e87eb6d6[i];
		var_4c4f699a[var_4c4f699a.size] = zm_weapons::get_player_weapondata(self, var_1d7eacf9);
		if(var_1d7eacf9 == self GetCurrentWeapon() && !self laststand::player_is_in_laststand() && (isdefined(var_c48ac85d) && var_c48ac85d))
		{
			self SwitchToWeapon(var_e87eb6d6[0]);
		}
		self TakeWeapon(var_1d7eacf9);
	}
	self.weapon_taken_by_losing_specialty_additionalprimaryweapon = 1;
	self.var_79157148 = var_4c4f699a;
}

/*
	Name: function_9b34aca3
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0xF607A906
	Offset: 0xC90
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 303
*/
function function_9b34aca3(var_e857983d)
{
	if(!(isdefined(1) && 1))
	{
		return;
	}
	if(!isdefined(self.var_79157148) || !IsArray(self.var_79157148) || self.var_79157148 < 1)
	{
		return;
	}
	for(i = 0; i < self.var_79157148.size; i++)
	{
		self zm_weapons::weapondata_give(self.var_79157148[i]);
	}
	self.var_79157148 = undefined;
	self.weapon_taken_by_losing_specialty_additionalprimaryweapon = undefined;
	return;
	i++;
}

/*
	Name: function_f6f1c02e
	Namespace: zm_perk_additionalprimaryweapon
	Checksum: 0x2B4513F
	Offset: 0xD50
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 333
*/
function function_f6f1c02e()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_1fa06f4");
	self endon("hash_1fa06f4");
	if(isdefined(self.var_79157148) && (isdefined(1) && 1))
	{
		self.weapon_taken_by_losing_specialty_additionalprimaryweapon = undefined;
		self.var_79157148 = undefined;
	}
	if(!(isdefined(1) && 1))
	{
		return;
	}
	while(1)
	{
		self util::waittill_any("weapon_change", "weapon_change_complete");
		if(!self clientfield::get_player_uimodel("hudItems.perks.additional_primary_weapon"))
		{
			continue;
		}
		w_weapon = self GetCurrentWeapon();
		var_6c6831af = self getweaponslistprimaries();
		if(!isdefined(w_weapon) || !isdefined(var_6c6831af) || var_6c6831af.size < 1)
		{
			self clientfield::set_player_uimodel("additional_primary_weapon_ui_glow", 0);
			continue;
		}
		var_8d35cfa2 = 0;
		for(i = 0; i < var_6c6831af.size; i++)
		{
			if(w_weapon == var_6c6831af[i] && i > 1 && self hasPerk("specialty_additionalprimaryweapon"))
			{
				var_8d35cfa2 = 1;
				break;
			}
		}
		self clientfield::set_player_uimodel("additional_primary_weapon_ui_glow", isdefined(var_8d35cfa2) && var_8d35cfa2);
	}
}

