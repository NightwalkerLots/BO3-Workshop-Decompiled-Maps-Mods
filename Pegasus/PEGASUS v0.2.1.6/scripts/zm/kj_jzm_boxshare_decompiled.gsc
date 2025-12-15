#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\kj_jzm_callouts;

#namespace namespace_80a8617d;

/*
	Name: __init__sytem__
	Namespace: namespace_80a8617d
	Checksum: 0x4355D87
	Offset: 0x490
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__sytem__()
{
	system::register("kj_jzm_boxshare", &__init__, &__main__, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__
	Namespace: namespace_80a8617d
	Checksum: 0x9ACF73B8
	Offset: 0x4D8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __init__()
{
}

/*
	Name: __main__
	Namespace: namespace_80a8617d
	Checksum: 0x9ACF73B8
	Offset: 0x4E8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function __main__()
{
}

/*
	Name: function_8e722e7a
	Namespace: namespace_80a8617d
	Checksum: 0x30D94F9
	Offset: 0x4F8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 85
*/
function function_8e722e7a()
{
	level endon("game_ended");
	boxes = struct::get_array("treasure_chest_use", "targetname");
	for(i = 0; i < boxes.size; i++)
	{
		boxes[i] thread function_66e8c339();
	}
	wait(0.25);
}

/*
	Name: function_66e8c339
	Namespace: namespace_80a8617d
	Checksum: 0x666AEE51
	Offset: 0x588
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_66e8c339()
{
	level endon("game_ended");
	self.zbarrier.var_f6f33e5a = 0;
	while(isdefined(self.zbarrier))
	{
		self.zbarrier waittill("randomization_done");
		if(isdefined(self.zbarrier.chest_moving) && self.zbarrier.chest_moving)
		{
			if(isdefined(self.zbarrier.var_2e43e432))
			{
				self.zbarrier.var_2e43e432 delete();
			}
			if(isdefined(self.zbarrier.var_6aa72590))
			{
				self.zbarrier.var_6aa72590 delete();
			}
		}
		if(isdefined(self.zbarrier.weapon) && isdefined(self.zbarrier.chest_moving) && !self.zbarrier.chest_moving)
		{
			self.zbarrier.var_c20b921a = self.zbarrier.weapon.name;
			self.zbarrier.var_9a785bf0 = MakeLocalizedString(self.zbarrier.weapon.displayName);
			self thread function_77bed218();
		}
	}
}

/*
	Name: function_77bed218
	Namespace: namespace_80a8617d
	Checksum: 0x586ECCD
	Offset: 0x720
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 143
*/
function function_77bed218()
{
	level endon("game_ended");
	self.zbarrier endon("weapon_grabbed");
	self.zbarrier notify("hash_f95a1062");
	self.zbarrier endon("hash_f95a1062");
	if(isdefined(self.chest_user))
	{
		player = self.chest_user;
		if(isdefined(self.timedOut) && isdefined(self.zbarrier.chest_moving))
		{
			while(!self.timedOut && !self.zbarrier.chest_moving)
			{
				if(self.chest_user meleeButtonPressed() && Distance(self.chest_user.origin, self.origin) < 50)
				{
					self.zbarrier.var_f6f33e5a = 1;
					if(isdefined(self.unitrigger_stub))
					{
						thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
					}
					self function_ace05ed0();
					self function_e2088010();
					wait(0.1);
					self function_16671771();
					player.var_a6c2dc79 = player.var_1ad2f4ac + "^7: I shared a ^2" + self.zbarrier.var_9a785bf0;
					thread namespace_9aaa7736::function_d9064d69(player.var_a6c2dc79);
					wait(0.2);
					self notify("kill_chest_think");
					self thread function_5a5c02e7(player);
					break;
				}
				wait(0.05);
			}
		}
	}
}

/*
	Name: function_e2088010
	Namespace: namespace_80a8617d
	Checksum: 0x7E29800C
	Offset: 0x938
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 190
*/
function function_e2088010()
{
	if(!isdefined(self.zbarrier.var_2e43e432))
	{
		self.zbarrier.var_2e43e432 = spawn("trigger_radius_use", self.zbarrier.origin + VectorScale((0, 0, 1), 32), 0, 32, 32);
		self.zbarrier.var_2e43e432 setcursorhint("HINT_NOICON");
		self.zbarrier.var_2e43e432 setHintString("");
		self.zbarrier.var_2e43e432 SetTeamForTrigger("allies");
	}
	if(isdefined(self.zbarrier.var_9a785bf0))
	{
		self.zbarrier.var_2e43e432 setHintString("Hold^3 [{+activate}] ^7For: ^2" + self.zbarrier.var_9a785bf0 + "\n ^3Knife ^7To Cancel");
		self.zbarrier.var_2e43e432 TriggerEnable(1);
	}
	self function_5db01e52();
	self thread function_353c5a7c();
}

/*
	Name: function_5db01e52
	Namespace: namespace_80a8617d
	Checksum: 0x22C5F4D
	Offset: 0xAD8
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 218
*/
function function_5db01e52()
{
	level endon("game_ended");
	box = self;
	if(isdefined(self.zbarrier.var_f6f33e5a) && self.zbarrier.var_f6f33e5a)
	{
		foreach(player in GetPlayers())
		{
			player thread function_90af96e9(box);
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_90af96e9
	Namespace: namespace_80a8617d
	Checksum: 0x97825680
	Offset: 0xBC8
	Size: 0x1C8
	Parameters: 1
	Flags: None
	Line Number: 243
*/
function function_90af96e9(box)
{
	level endon("game_ended");
	self notify("hash_520e39f5");
	self endon("hash_520e39f5");
	box.zbarrier endon("hash_e6ab24bf");
	wait(1);
	if(isdefined(box.zbarrier) && isdefined(box.zbarrier.var_f6f33e5a))
	{
		while(box.zbarrier.var_f6f33e5a)
		{
			if(self meleeButtonPressed() && Distance(self.origin, box.origin) < 50)
			{
				box.zbarrier.var_f6f33e5a = 0;
				box function_641386dd();
				if(isdefined(box.zbarrier.var_6aa72590))
				{
					box.zbarrier.var_6aa72590 SetModel("tag_origin");
				}
				if(isdefined(box.zbarrier.var_2e43e432))
				{
					box.zbarrier.var_2e43e432 TriggerEnable(0);
				}
				wait(0.2);
				box.zbarrier notify("hash_e6ab24bf");
				break;
			}
			wait(0.05);
		}
	}
}

/*
	Name: function_641386dd
	Namespace: namespace_80a8617d
	Checksum: 0x9523A00A
	Offset: 0xD98
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 285
*/
function function_641386dd()
{
	if(isdefined(self._box_opened_by_fire_sale) && self._box_opened_by_fire_sale)
	{
		if(isdefined(self.zbarrier.var_6aa72590))
		{
			self.zbarrier.var_6aa72590 delete();
		}
		if(isdefined(self.zbarrier.var_2e43e432))
		{
			self.zbarrier.var_2e43e432 delete();
		}
	}
}

/*
	Name: function_353c5a7c
	Namespace: namespace_80a8617d
	Checksum: 0xDA58144E
	Offset: 0xE30
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 310
*/
function function_353c5a7c()
{
	level endon("game_ended");
	self.zbarrier endon("hash_e6ab24bf");
	if(isdefined(self.zbarrier.var_2e43e432))
	{
		self.zbarrier.var_2e43e432 waittill("trigger", player);
		self.zbarrier.var_f6f33e5a = 0;
		wait(0.05);
		self function_641386dd();
		if(isdefined(self.zbarrier.var_6aa72590))
		{
			self.zbarrier.var_6aa72590 SetModel("tag_origin");
		}
		if(isdefined(self.zbarrier.var_c20b921a))
		{
			player zm_weapons::weapon_give(GetWeapon(self.zbarrier.var_c20b921a), undefined, undefined, 1);
		}
		if(isdefined(self.zbarrier.var_2e43e432))
		{
			self.zbarrier.var_2e43e432 TriggerEnable(0);
		}
		self.zbarrier notify("hash_e6ab24bf");
	}
}

/*
	Name: function_ace05ed0
	Namespace: namespace_80a8617d
	Checksum: 0xAB67DA6E
	Offset: 0xFA0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 346
*/
function function_ace05ed0()
{
	if(!isdefined(self.zbarrier.var_6aa72590) && isdefined(self.zbarrier))
	{
		self.zbarrier.var_6aa72590 = spawn("script_model", self.zbarrier.origin + VectorScale((0, 0, 1), 40));
		self.zbarrier.var_6aa72590.angles = self.zbarrier.angles;
		self.zbarrier.var_6aa72590 SetModel("tag_origin");
	}
	if(isdefined(self.zbarrier) && isdefined(self.zbarrier.var_6aa72590) && isdefined(self.zbarrier.weapon))
	{
		var_8f466ccc = function_1c8adcb0(GetWeapon(self.zbarrier.weapon.name));
		self.zbarrier.var_6aa72590 SetModel(var_8f466ccc);
	}
}

/*
	Name: function_16671771
	Namespace: namespace_80a8617d
	Checksum: 0x163D6065
	Offset: 0x1110
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_16671771()
{
	if(isdefined(self.zbarrier.weapon_model))
	{
		self.zbarrier.weapon_model delete();
	}
	if(isdefined(self.zbarrier.weapon_model_dw))
	{
		self.zbarrier.weapon_model_dw delete();
	}
}

/*
	Name: function_5a5c02e7
	Namespace: namespace_80a8617d
	Checksum: 0x21DCF6E7
	Offset: 0x1190
	Size: 0x214
	Parameters: 1
	Flags: None
	Line Number: 393
*/
function function_5a5c02e7(grabber)
{
	level endon("game_ended");
	self.zbarrier waittill("hash_e6ab24bf");
	self notify("trigger", grabber);
	self.weapon_out = undefined;
	self.box_rerespun = undefined;
	self notify("user_grabbed_weapon");
	self.timedOut = 1;
	self.grab_weapon_hint = 0;
	self.zbarrier notify("weapon_grabbed");
	if(!(isdefined(self._box_opened_by_fire_sale) && self._box_opened_by_fire_sale))
	{
		level.chest_accessed = level.chest_accessed + 1;
	}
	if(isdefined(self.chest_lid))
	{
		self.chest_lid thread zm_magicbox::treasure_chest_lid_close(self.timedOut);
	}
	if(isdefined(self.zbarrier))
	{
		self.zbarrier zm_magicbox::set_magic_box_zbarrier_state("close");
		zm_utility::play_sound_at_pos("close_chest", self.origin);
		self.zbarrier waittill("closed");
		wait(1);
	}
	else
	{
		wait(3);
	}
	if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"] && self [[level._zombiemode_check_firesale_loc_valid_func]]() || self == level.chests[level.chest_index])
	{
		thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
	}
	self._box_open = 0;
	self._box_opened_by_fire_sale = 0;
	self.unbearable_respin = undefined;
	self.chest_user = undefined;
	self notify("chest_accessed");
	self thread zm_magicbox::treasure_chest_think();
}

