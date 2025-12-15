#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_lightning_chain;
#include scripts\zm\_zm_weapons;

#namespace namespace_b3844a48;

/*
	Name: __init__sytem__
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x3B0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__sytem__()
{
	system::register("rayzorback", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x3F0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function __init__()
{
	level.var_d1b744dd = GetWeapon("rayzorback_elec");
	level.var_a4b9c7e1 = GetWeapon("rayzorback_up_elec");
	level._effect["tesla_viewmodel_rail"] = "zombie/fx_tesla_rail_view_zmb";
	level._effect["tesla_viewmodel_tube"] = "zombie/fx_tesla_tube_view_zmb";
	level._effect["tesla_viewmodel_tube2"] = "zombie/fx_tesla_tube_view2_zmb";
	level._effect["tesla_viewmodel_tube3"] = "zombie/fx_tesla_tube_view3_zmb";
	level._effect["tesla_viewmodel_rail_upgraded"] = "zombie/fx_tesla_rail_view_ug_zmb";
	level._effect["tesla_viewmodel_tube_upgraded"] = "zombie/fx_tesla_tube_view_ug_zmb";
	level._effect["tesla_viewmodel_tube2_upgraded"] = "zombie/fx_tesla_tube_view2_ug_zmb";
	level._effect["tesla_viewmodel_tube3_upgraded"] = "zombie/fx_tesla_tube_view3_ug_zmb";
	level thread player_init();
	level thread tesla_notetrack_think();
	level thread function_a8ceb83c();
}

/*
	Name: function_a8ceb83c
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x560
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 61
*/
function function_a8ceb83c()
{
	zm_weapons::include_weapon("rayzorback", 1, 10000, 10000, 0);
	zm_weapons::include_upgraded_weapon("rayzorback", "rayzorback_up", 0, 10000, 4500);
}

/*
	Name: player_init
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x5C0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function player_init()
{
	util::waitforclient(0);
	level.tesla_play_fx = [];
	level.tesla_play_rail = 1;
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		level.tesla_play_fx[i] = 0;
		players[i] thread tesla_fx_rail(i);
		players[i] thread tesla_fx_tube(i);
		players[i] thread tesla_happy(i);
		players[i] thread tesla_change_watcher(i);
	}
}

/*
	Name: tesla_fx_rail
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x6D8
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 103
*/
function tesla_fx_rail(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	for(;;)
	{
		WaitRealTime(RandomFloatRange(8, 12));
		if(!level.tesla_play_fx[localClientNum])
		{
		}
		else if(!level.tesla_play_rail)
		{
		}
		else
		{
			currentWeapon = GetCurrentWeapon(localClientNum);
			if(currentWeapon != level.var_d1b744dd && currentWeapon != level.var_a4b9c7e1)
			{
			}
			else if(IsADS(localClientNum) || IsThrowingGrenade(localClientNum) || IsMeleeing(localClientNum) || IsOnTurret(localClientNum))
			{
			}
			else if(GetWeaponAmmoClip(localClientNum, currentWeapon) <= 0)
			{
			}
			else
			{
				FX = level._effect["tesla_viewmodel_rail"];
				if(currentWeapon == level.var_a4b9c7e1)
				{
					FX = level._effect["tesla_viewmodel_rail_upgraded"];
				}
				PlayViewmodelFX(localClientNum, FX, "tag_flash");
				playsound(localClientNum, "wpn_tesla_effects", (0, 0, 0));
			}
		}
	}
}

/*
	Name: tesla_fx_tube
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0x898
	Size: 0x350
	Parameters: 1
	Flags: None
	Line Number: 152
*/
function tesla_fx_tube(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	for(;;)
	{
		WaitRealTime(0.1);
		if(!level.tesla_play_fx[localClientNum])
		{
		}
		else
		{
			w_current = GetCurrentWeapon(localClientNum);
			if(w_current != level.var_d1b744dd && w_current != level.var_a4b9c7e1)
			{
			}
			else if(IsThrowingGrenade(localClientNum) || IsMeleeing(localClientNum) || IsOnTurret(localClientNum))
			{
			}
			else
			{
				n_ammo = GetWeaponAmmoClip(localClientNum, w_current);
				if(n_ammo <= 0)
				{
					self clear_tesla_tube_effect(localClientNum);
				}
				else
				{
					str_fx = level._effect["tesla_viewmodel_tube"];
					if(w_current == level.var_a4b9c7e1)
					{
						switch(n_ammo)
						{
							case 1:
							case 2:
							{
								str_fx = level._effect["tesla_viewmodel_tube3_upgraded"];
								n_tint = 2;
								break;
							}
							case 3:
							case 4:
							{
								str_fx = level._effect["tesla_viewmodel_tube2_upgraded"];
								n_tint = 1;
								break;
							}
							default
							{
								str_fx = level._effect["tesla_viewmodel_tube_upgraded"];
								n_tint = 0;
								break;
							}
						}
					}
					else
					{
						switch(n_ammo)
						{
							case 1:
							{
								str_fx = level._effect["tesla_viewmodel_tube3"];
								n_tint = 2;
								break;
							}
							case 2:
							{
								str_fx = level._effect["tesla_viewmodel_tube2"];
								n_tint = 1;
								break;
							}
							default
							{
								str_fx = level._effect["tesla_viewmodel_tube"];
								n_tint = 0;
								break;
							}
						}
					}
					if(self.str_tesla_current_tube_effect === str_fx)
					{
						continue;
					}
					else if(isdefined(self.n_tesla_tube_fx_id))
					{
						deletefx(localClientNum, self.n_tesla_tube_fx_id, 1);
					}
					self.str_tesla_current_tube_effect = str_fx;
					self.n_tesla_tube_fx_id = PlayViewmodelFX(localClientNum, str_fx, "tag_brass");
					self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 1, n_tint, 0);
				}
			}
		}
	}
}

/*
	Name: tesla_notetrack_think
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 258
*/
function tesla_notetrack_think()
{
	for(;;)
	{
		level waittill("Notetrack", localClientNum, note);
		switch(note)
		{
			case "tesla_play_fx_off":
			{
				level.tesla_play_fx[localClientNum] = 0;
				break;
			}
			case "tesla_play_fx_on":
			{
				level.tesla_play_fx[localClientNum] = 1;
				break;
			}
		}
	}
}

/*
	Name: tesla_happy
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xC78
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 289
*/
function tesla_happy(localClientNum)
{
	for(;;)
	{
		level waittill("TGH");
		currentWeapon = GetCurrentWeapon(localClientNum);
		if(currentWeapon == level.var_d1b744dd || currentWeapon == level.var_a4b9c7e1)
		{
			playsound(localClientNum, "wpn_tesla_happy", (0, 0, 0));
			level.tesla_play_rail = 0;
			WaitRealTime(2);
			level.tesla_play_rail = 1;
		}
	}
}

/*
	Name: tesla_change_watcher
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xD20
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 315
*/
function tesla_change_watcher(localClientNum)
{
	self endon("disconnect");
	while(1)
	{
		self waittill("weapon_change");
		self clear_tesla_tube_effect(localClientNum);
	}
}

/*
	Name: clear_tesla_tube_effect
	Namespace: namespace_b3844a48
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x7C
	Parameters: 1
	Flags: None
	Line Number: 335
*/
function clear_tesla_tube_effect(localClientNum)
{
	if(isdefined(self.n_tesla_tube_fx_id))
	{
		deletefx(localClientNum, self.n_tesla_tube_fx_id, 1);
		self.n_tesla_tube_fx_id = undefined;
		self.str_tesla_current_tube_effect = undefined;
		self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, 1, 3, 0);
	}
}

