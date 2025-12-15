#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_utility;

#namespace namespace_3d0867a6;

/*
	Name: main
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x3C8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 23
*/
function main()
{
	callback::on_connect(&on_player_connect);
	level thread function_4dc2a1ce();
}

/*
	Name: on_player_connect
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x410
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function on_player_connect()
{
	if(!self IsTestClient() && !isdefined(level.var_a28b41e6) && !GetDvarInt("DontLoadDlls") && GetDvarString("aaeoption_ges") != "1")
	{
		self thread function_ec3dc36a();
		self thread function_13ab045();
		return;
	}
}

/*
	Name: function_13ab045
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x4B8
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 59
*/
function function_13ab045()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("perk_purchased", perk);
		if(isdefined(perk) && self useButtonPressed() && GetDvarString("aaeoption_ges") != "1" && !self IsSplitscreen())
		{
			thread function_9d4f2695(perk);
			self allowslide(0);
			self AllowSprint(0);
			self.var_2152e56a = 1;
			self function_3a79bd3c(function_85831e4e(perk));
			if(self hasPerk("specialty_fastequipmentuse"))
			{
				wait(0.95);
			}
			else
			{
				wait(1.9);
			}
			self notify("weapon_change_complete");
			wait(0.048);
			self notify("weapon_change_complete");
			self allowslide(1);
			self AllowSprint(1);
			self.var_2152e56a = undefined;
			self function_4a1cd641();
		}
	}
}

/*
	Name: function_85831e4e
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x670
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 101
*/
function function_85831e4e(perk)
{
	if(!isdefined(perk))
	{
		perk = "tag_origin";
	}
	if(!isdefined(level._custom_perks))
	{
		return "tag_origin";
	}
	if(!isdefined(level._custom_perks[perk]))
	{
		return "tag_origin";
	}
	if(!isdefined(level._custom_perks[perk].var_1b618321))
	{
		return "tag_origin";
	}
	return level._custom_perks[perk].var_1b618321.viewmodels;
}

/*
	Name: function_64b7c5f7
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x710
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 132
*/
function function_64b7c5f7()
{
	self endon("disconnect");
	wait(0.1);
	self allowslide(0);
	self AllowSprint(0);
}

/*
	Name: function_9d4f2695
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x760
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 150
*/
function function_9d4f2695(perk)
{
	if(isdefined(level._custom_perks[perk]))
	{
		level notify("TempCleanPerkWeapons" + perk);
		level endon("TempCleanPerkWeapons" + perk);
		if(isdefined(level._custom_perks[perk].var_1b618321))
		{
			level._custom_perks[perk].perk_bottle_weapon = undefined;
		}
		wait(0.08);
		if(isdefined(level._custom_perks[perk].var_1b618321))
		{
			level._custom_perks[perk].perk_bottle_weapon = level._custom_perks[perk].var_1b618321;
		}
	}
}

/*
	Name: function_ec3dc36a
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x830
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 178
*/
function function_ec3dc36a()
{
	self endon("disconnect");
	if(!self IsTestClient())
	{
		for(;;)
		{
			wait(0.048);
			level.weaponReviveTool = level.weaponNone;
			weapon = self GetCurrentWeapon();
			if(!self IsSplitscreen() && self zm_laststand::is_reviving_any() && !self laststand::player_is_in_laststand() && self useButtonPressed() && weapon.name != "t6_xl_shockhands" && weapon.name != "syrette_afterlife")
			{
				if(self hasPerk("specialty_quickrevive"))
				{
					self function_18df83fb("revive_quick", 1);
				}
				else
				{
					self function_18df83fb("revive", 1);
				}
				while(self zm_laststand::is_reviving_any() && self useButtonPressed())
				{
					wait(0.048);
				}
				self function_4a1cd641();
			}
		}
	}
}

/*
	Name: function_3a79bd3c
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 218
*/
function function_3a79bd3c(perk)
{
	if(!isdefined(level.var_a28b41e6) && !GetDvarInt("DontLoadDlls") && !GetDvarString("aaeoption_ges") && isdefined(self) && !self IsTestClient() && level flag::get("initial_blackscreen_passed"))
	{
		var_763fe738 = self GetCharacterBodyModel();
		if(var_763fe738 == "c_zom_zod_beast_mpc_fb")
		{
			return;
		}
		if(level.script == "zm_tomb" || level.script == "zm_genesis" || level.script == "zm_island" || level.script == "zm_castle" || level.script == "zm_stalingrad")
		{
			var_763fe738 = self.characterindex;
		}
		util::setClientSysState("left_ges_event", "perk," + var_763fe738 + ",1," + perk, self);
		return;
	}
}

/*
	Name: function_18df83fb
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xB70
	Size: 0x260
	Parameters: 2
	Flags: None
	Line Number: 246
*/
function function_18df83fb(event, var_8ac61c04)
{
	if(!isdefined(var_8ac61c04))
	{
		var_8ac61c04 = 0;
	}
	if(!self IsSplitscreen() && !isdefined(level.var_a28b41e6) && !GetDvarInt("DontLoadDlls") && !GetDvarString("aaeoption_ges"))
	{
		weapon = self GetCurrentWeapon();
		if(isdefined(self) && !self IsTestClient() && !self issprinting() && !self IsWallRunning() && !self IsMeleeing() && self IsOnGround() && !isdefined(self.var_2152e56a) && level flag::get("initial_blackscreen_passed") && weapon.name != "t6_xl_shockhands" && weapon.name != "syrette_afterlife" && weapon.name != "zombie_bgb_grab" && weapon.name != "zombie_bgb_use")
		{
			var_763fe738 = self GetCharacterBodyModel();
			if(var_763fe738 == "c_zom_zod_beast_mpc_fb")
			{
				return;
			}
			if(level.script == "zm_tomb")
			{
				var_763fe738 = self.characterindex;
			}
			util::setClientSysState("left_ges_event", event + "," + var_763fe738 + "," + var_8ac61c04, self);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_4a1cd641
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xDD8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 284
*/
function function_4a1cd641()
{
	if(isdefined(self) && !self IsTestClient())
	{
		util::setClientSysState("left_ges_event", "0", self);
	}
}

/*
	Name: function_4dc2a1ce
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xE30
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 302
*/
function function_4dc2a1ce()
{
	level endon("end_game");
	level flag::wait_till("initial_blackscreen_passed");
	if(level.script != "zm_zod" && level.script != "zm_island")
	{
		trig1 = GetEntArray("use_elec_switch", "targetname");
		trig2 = GetEntArray("use_power_switch", "targetname");
		trig3 = GetEntArray("use_master_switch", "targetname");
		trig1 = ArrayCombine(trig1, trig2, 0, 0);
		trig1 = ArrayCombine(trig1, trig3, 0, 0);
		Array::thread_all(trig1, &function_bb0d2660);
	}
	if(!isdefined(level.var_a28b41e6) && !GetDvarInt("DontLoadDlls") && GetDvarString("aaeoption_ges") != "1")
	{
		function_d69c41be();
		return;
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: onUse
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0xFE8
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 334
*/
function onUse(e_player)
{
	if(isdefined(self.power))
	{
		self.power notify("trigger", e_player);
		self gameobjects::destroy_object(1, 1);
		objective_delete(self.objectiveId);
		gameobjects::release_obj_id(self.objectiveId);
		self delete();
	}
}

/*
	Name: canInteractWithPlayer
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x1088
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 356
*/
function canInteractWithPlayer(e_player)
{
	var_f329927f = (Int(self.origin[0]), Int(self.origin[1]), Int(self.origin[2]));
	eye = e_player GetEye();
	result = util::within_fov(eye, e_player getPlayerAngles(), var_f329927f, cos(GetDvarInt("ip_angles")));
	range = GetDvarInt("ip_range");
	result = Distance(e_player.origin, var_f329927f) <= range || Distance(eye, var_f329927f) <= range && result;
	if(result)
	{
		if(e_player GamepadUsedLast())
		{
			self gameobjects::set_use_time(0.35);
		}
		else
		{
			self gameobjects::set_use_time(0);
		}
	}
	return result;
}

/*
	Name: function_ff3bdd4b
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x1268
	Size: 0x208
	Parameters: 1
	Flags: None
	Line Number: 387
*/
function function_ff3bdd4b(origin)
{
	t_use = spawn("trigger_radius_use", origin, 0, 60, 60);
	t_use TriggerIgnoreTeam();
	t_use setvisibletoall();
	t_use SetTeamForTrigger("none");
	t_use setcursorhint("HINT_INTERACTIVE_PROMPT");
	t_use EnableLinkTo();
	var_db7c07b5 = gameobjects::create_use_object("any", t_use, [], (0, 0, 0), &"aaethreed_power", 0, 1);
	var_db7c07b5 gameobjects::allow_use("any");
	var_db7c07b5 gameobjects::set_owner_team("allies");
	var_db7c07b5 gameobjects::set_visible_team("any");
	var_db7c07b5.onUse = &onUse;
	var_db7c07b5.useWeapon = undefined;
	var_db7c07b5.keepWeapon = 1;
	var_db7c07b5.dontLinkPlayerToTrigger = 1;
	var_db7c07b5 gameobjects::set_use_time(0.35);
	var_db7c07b5.onBeginUse = undefined;
	var_db7c07b5.onEndUse = undefined;
	var_db7c07b5.canInteractWithPlayer = &canInteractWithPlayer;
	return var_db7c07b5;
}

/*
	Name: function_d69c41be
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x1478
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 420
*/
function function_d69c41be()
{
	a_keys = getArrayKeys(level._custom_perks);
	for(i = 0; i < a_keys.size; i++)
	{
		if(isdefined(level._custom_perks[a_keys[i]].var_1b618321))
		{
			return;
		}
		if(isdefined(level._custom_perks[a_keys[i]].perk_bottle_weapon))
		{
			level._custom_perks[a_keys[i]].var_1b618321 = level._custom_perks[a_keys[i]].perk_bottle_weapon;
		}
	}
}

/*
	Name: function_bb0d2660
	Namespace: namespace_3d0867a6
	Checksum: 0x424F4353
	Offset: 0x1558
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 446
*/
function function_bb0d2660()
{
	if(!GetDvarInt("tfoption_start_power"))
	{
		if(!isdefined(self))
		{
			return;
		}
		self endon("death");
		level flag::wait_till("initial_blackscreen_passed");
		while(!self IsTriggerEnabled())
		{
			wait(0.05);
		}
		self setcursorhint("HINT_INTERACTIVE_PROMPT");
		self Hide();
		ip = function_ff3bdd4b(self.origin);
		ip.power = self;
		while(isdefined(self))
		{
			self waittill("trigger", User);
			if(isdefined(User) && isPlayer(User))
			{
				User function_18df83fb("poweron");
			}
		}
	}
}

