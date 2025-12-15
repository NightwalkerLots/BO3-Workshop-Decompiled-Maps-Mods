#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_lightning_chain;
#include scripts\zm\_zm_weapons;

#namespace _zm_weap_tesla;

/*
	Name: init
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x368
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 18
*/
function init()
{
	if(isdefined(level.weaponZMTeslaGun))
	{
		return;
	}
	level.weaponZMTeslaGun = GetWeapon("tesla_gun");
	level.weaponZMTeslaGunUpgraded = GetWeapon("tesla_gun_upgraded");
	level._effect["tesla_viewmodel_rail"] = "zombie/fx_tesla_rail_view_zmb";
	level._effect["tesla_viewmodel_tube"] = "zombie/fx_tesla_tube_view_zmb";
	level._effect["tesla_viewmodel_tube2"] = "zombie/fx_tesla_tube_view2_zmb";
	level._effect["tesla_viewmodel_tube3"] = "zombie/fx_tesla_tube_view3_zmb";
	level._effect["tesla_viewmodel_rail_upgraded"] = "zombie/fx_tesla_rail_view_ug_zmb";
	level._effect["tesla_viewmodel_tube_upgraded"] = "zombie/fx_tesla_tube_view_ug_zmb";
	level._effect["tesla_viewmodel_tube2_upgraded"] = "zombie/fx_tesla_tube_view2_ug_zmb";
	level._effect["tesla_viewmodel_tube3_upgraded"] = "zombie/fx_tesla_tube_view3_ug_zmb";
	level thread function_40f2f130();
	level thread tesla_notetrack_think();
}

/*
	Name: function_40f2f130
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x4D0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function function_40f2f130()
{
	level.tesla_play_fx = [];
	level.tesla_play_rail = 1;
	callback::on_localplayer_spawned(&function_b408394a);
}

/*
	Name: function_b408394a
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x518
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 65
*/
function function_b408394a(localClientNum)
{
	if(self != GetLocalPlayer(localClientNum) || isdefined(self.var_fde3708d))
	{
		return;
	}
	self.var_fde3708d = 1;
	level.tesla_play_fx[localClientNum] = 0;
	self thread tesla_fx_rail(localClientNum);
	self thread tesla_fx_tube(localClientNum);
	self thread tesla_happy(localClientNum);
	self thread tesla_change_watcher(localClientNum);
}

/*
	Name: player_init
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x5D8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 89
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
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x6F0
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 115
*/
function tesla_fx_rail(localClientNum)
{
	self notify("hash_12e51dfc");
	self endon("hash_12e51dfc");
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
			if(currentWeapon != level.weaponZMTeslaGun && currentWeapon != level.weaponZMTeslaGunUpgraded)
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
				if(currentWeapon == level.weaponZMTeslaGunUpgraded)
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
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0x8D0
	Size: 0x388
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function tesla_fx_tube(localClientNum)
{
	self notify("hash_a33a3cb2");
	self endon("hash_a33a3cb2");
	self endon("disconnect");
	self endon("entityshutdown");
	for(;;)
	{
		WaitRealTime(0.05);
		if(!level.tesla_play_fx[localClientNum])
		{
			self clear_tesla_tube_effect(localClientNum);
		}
		else
		{
			w_current = GetCurrentWeapon(localClientNum);
			if(w_current != level.weaponZMTeslaGun && w_current != level.weaponZMTeslaGunUpgraded)
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
					if(w_current == level.weaponZMTeslaGunUpgraded)
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
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xC60
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 275
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
	return;
}

/*
	Name: tesla_happy
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xCE8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 307
*/
function tesla_happy(localClientNum)
{
	self notify("hash_fed4daa3");
	self endon("hash_fed4daa3");
	self endon("disconnect");
	self endon("entityshutdown");
	for(;;)
	{
		level waittill("TGH");
		currentWeapon = GetCurrentWeapon(localClientNum);
		if(currentWeapon == level.weaponZMTeslaGun || currentWeapon == level.weaponZMTeslaGunUpgraded)
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
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xDC8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 337
*/
function tesla_change_watcher(localClientNum)
{
	self notify("hash_3f876702");
	self endon("hash_3f876702");
	self endon("disconnect");
	self endon("entityshutdown");
	while(1)
	{
		self waittill("weapon_change");
		self clear_tesla_tube_effect(localClientNum);
	}
}

/*
	Name: clear_tesla_tube_effect
	Namespace: _zm_weap_tesla
	Checksum: 0x424F4353
	Offset: 0xE40
	Size: 0x7C
	Parameters: 1
	Flags: None
	Line Number: 360
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

