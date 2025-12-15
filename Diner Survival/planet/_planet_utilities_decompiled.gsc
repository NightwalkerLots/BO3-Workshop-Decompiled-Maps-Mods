#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weapons;
#include scripts\zm\_zm;
#include scripts\zm\_zm_attackables;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_behavior;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_d947f615;

/*
	Name: __init__sytem__
	Namespace: namespace_d947f615
	Checksum: 0x8342A0B0
	Offset: 0x540
	Size: 0x30
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec __init__sytem__()
{
	system::register("pUtility", undefined, &function_fd569600, undefined);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fd569600
	Namespace: namespace_d947f615
	Checksum: 0x18BEFEB1
	Offset: 0x578
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function function_fd569600()
{
	wait(0.05);
	level flag::init("infinite_wave_active");
}

/*
	Name: create_unitrigger
	Namespace: namespace_d947f615
	Checksum: 0x82061924
	Offset: 0x5B0
	Size: 0xF0
	Parameters: 5
	Flags: None
	Line Number: 70
*/
function create_unitrigger(hint, range, var_d903956b, var_f7c2f4dd, lookAt)
{
	if(!isdefined(hint))
	{
		hint = "Undefined";
	}
	if(!isdefined(range))
	{
		range = 64;
	}
	if(!isdefined(var_d903956b))
	{
		var_d903956b = &function_36629099;
	}
	if(!isdefined(var_f7c2f4dd))
	{
		var_f7c2f4dd = &function_c203364b;
	}
	if(!isdefined(lookAt))
	{
		lookAt = 0;
	}
	s_trigger = self zm_unitrigger::create_unitrigger(hint, range, var_d903956b, var_f7c2f4dd);
	s_trigger.require_look_at = lookAt;
	return s_trigger;
}

/*
	Name: function_36629099
	Namespace: namespace_d947f615
	Checksum: 0x721F1F13
	Offset: 0x6A8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 107
*/
function function_36629099(player)
{
	self endon("kill_trigger");
	can_use = function_e2be2de0(player);
	self setinvisibletoplayer(player, !can_use);
	self setHintString(self.stub.hint_string);
	return can_use;
}

/*
	Name: function_c203364b
	Namespace: namespace_d947f615
	Checksum: 0x8E286F7
	Offset: 0x730
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_c203364b()
{
	self endon("kill_trigger");
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger() || player.IS_DRINKING > 0 || !zm_utility::is_player_valid(player))
		{
			continue;
		}
		self.stub.related_parent notify("trigger_activated", player);
	}
}

/*
	Name: function_e2be2de0
	Namespace: namespace_d947f615
	Checksum: 0x1A446CE4
	Offset: 0x7D8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 150
*/
function function_e2be2de0(player)
{
	if(!zm_utility::is_player_valid(player))
	{
		return 0;
	}
	if(player zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(player.IS_DRINKING > 0)
	{
		return 0;
	}
	return 1;
}

/*
	Name: do_knuckle_crack
	Namespace: namespace_d947f615
	Checksum: 0xA0593D04
	Offset: 0x848
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 177
*/
function do_knuckle_crack(delay, weapon)
{
	self endon("disconnect");
	if(isdefined(delay))
	{
		wait(delay);
	}
	if(isdefined(weapon))
	{
		if(IsArray(weapon))
		{
			weapon = weapon[RandomInt(weapon.size)];
			continue;
		}
	}
	weapon = "zombie_knuckle_crack";
	self upgrade_knuckle_crack_begin(weapon);
	self util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
	self upgrade_knuckle_crack_end(weapon);
	return;
	.var_0 = undefined;
}

/*
	Name: upgrade_knuckle_crack_begin
	Namespace: namespace_d947f615
	Checksum: 0x2410BB1
	Offset: 0x940
	Size: 0x98
	Parameters: 1
	Flags: Private
	Line Number: 210
*/
function private upgrade_knuckle_crack_begin(var_dbc0542c)
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	weapon = GetWeapon(var_dbc0542c);
	self GiveWeapon(weapon);
	self SwitchToWeapon(weapon);
}

/*
	Name: upgrade_knuckle_crack_end
	Namespace: namespace_d947f615
	Checksum: 0xBB72EF53
	Offset: 0x9E0
	Size: 0x110
	Parameters: 1
	Flags: Private
	Line Number: 229
*/
function private upgrade_knuckle_crack_end(var_dbc0542c)
{
	self zm_utility::enable_player_move_states();
	weapon = GetWeapon(var_dbc0542c);
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self zm_utility::decrement_is_drinking();
	self TakeWeapon(weapon);
	Primaries = self getweaponslistprimaries();
	if(self.IS_DRINKING > 0)
	{
		return;
		continue;
	}
	self zm_weapons::switch_back_primary_weapon();
}

/*
	Name: function_9dd39fe9
	Namespace: namespace_d947f615
	Checksum: 0x4DBE8779
	Offset: 0xAF8
	Size: 0x250
	Parameters: 5
	Flags: None
	Line Number: 259
*/
function function_9dd39fe9(n_points, var_6e62deb2, tname, var_4ae4f03b, var_52a8b1e0)
{
	if(!isdefined(var_4ae4f03b))
	{
		var_4ae4f03b = "script_model";
	}
	if(!isdefined(var_52a8b1e0))
	{
		var_52a8b1e0 = "tag_origin";
	}
	var_b4eb069f = 360 / n_points;
	var_f568bc65 = RandomFloat(var_b4eb069f);
	a_points = [];
	for(i = 0; i < n_points; i++)
	{
		var_e4c69cc2 = var_f568bc65 + var_b4eb069f * i;
		var_a1f9566b = (cos(var_e4c69cc2) * var_6e62deb2, sin(var_e4c69cc2) * var_6e62deb2, 0);
		var_d2ca4f4c = spawn(var_4ae4f03b, self.origin + var_a1f9566b);
		if(var_4ae4f03b == "script_model")
		{
			var_d2ca4f4c SetModel(var_52a8b1e0);
		}
		if(isdefined(tname))
		{
			var_d2ca4f4c.targetname = tname;
		}
		newOrigin = GetClosestPointOnNavMesh(var_d2ca4f4c.origin, 1000);
		var_d2ca4f4c.origin = newOrigin;
		var_d2ca4f4c.angles = VectorToAngles(self.origin - var_d2ca4f4c.origin);
		if(isdefined(a_points) && isdefined(var_d2ca4f4c))
		{
			a_points[a_points.size] = var_d2ca4f4c;
		}
	}
	return a_points;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_68483b4f
	Namespace: namespace_d947f615
	Checksum: 0xDD4DA7B
	Offset: 0xD50
	Size: 0x308
	Parameters: 7
	Flags: None
	Line Number: 307
*/
function function_68483b4f(FX, origin, angles, duration, type, Notetrack, destination)
{
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isdefined(duration))
	{
		duration = 1.5;
	}
	if(!isdefined(type))
	{
		type = "default";
	}
	fxModel = util::spawn_model("tag_origin", origin, angles);
	wait(0.05);
	FX = PlayFXOnTag(FX, fxModel, "tag_origin");
	switch(type)
	{
		case "moveTo":
		{
			if(!isdefined(destination))
			{
				destination = fxModel.origin + VectorScale((0, 0, 1), 128);
			}
			level thread function_5abc8efb(duration + 0.2, fxModel, FX);
			fxModel moveto(destination, duration);
			fxModel waittill("movedone");
			level thread function_5abc8efb(0, fxModel, FX);
			break;
		}
		case "deleteOnLevelNotify":
		{
			if(!isdefined(Notetrack))
			{
				IPrintLnBold("FXCleanup with no notetrack created");
			}
			level function_f9a2a1bc(fxModel, FX, Notetrack);
			level thread function_5abc8efb(duration, fxModel, FX);
			wait(duration);
			fxModel notify("hash_e4749ff7");
			level thread function_5abc8efb(0, fxModel, FX);
			break;
		}
		case "deleteOnSelfNotify":
		{
			if(!isdefined(Notetrack))
			{
				IPrintLnBold("FXCleanup with no notetrack created");
			}
			self function_2444888e(fxModel, FX, Notetrack);
			break;
		}
		case "linkTo":
		{
			fxModel LinkTo(self, destination);
			level thread function_5abc8efb(duration, fxModel, FX);
		}
		default
		{
			level thread function_5abc8efb(duration, fxModel, FX);
			break;
		}
	}
}

/*
	Name: function_2444888e
	Namespace: namespace_d947f615
	Checksum: 0x4B2A22D
	Offset: 0x1060
	Size: 0x68
	Parameters: 3
	Flags: Private
	Line Number: 383
*/
function private function_2444888e(fxModel, FX, Notetrack)
{
	self waittill(Notetrack);
	if(isdefined(fxModel))
	{
		fxModel delete();
	}
	if(isdefined(FX))
	{
		FX delete();
	}
}

/*
	Name: function_5abc8efb
	Namespace: namespace_d947f615
	Checksum: 0x8DAAF0E5
	Offset: 0x10D0
	Size: 0x88
	Parameters: 3
	Flags: Private
	Line Number: 406
*/
function private function_5abc8efb(time, fxModel, FX)
{
	if(!isdefined(time))
	{
		time = 0;
	}
	if(time > 0)
	{
		wait(time);
	}
	if(isdefined(fxModel))
	{
		fxModel delete();
	}
	if(isdefined(FX))
	{
		FX delete();
	}
}

/*
	Name: function_f9a2a1bc
	Namespace: namespace_d947f615
	Checksum: 0xD08D873B
	Offset: 0x1160
	Size: 0x78
	Parameters: 3
	Flags: Private
	Line Number: 436
*/
function private function_f9a2a1bc(fxModel, FX, Notetrack)
{
	fxModel endon("hash_e4749ff7");
	level waittill(Notetrack);
	if(isdefined(fxModel))
	{
		fxModel delete();
	}
	if(isdefined(FX))
	{
		FX delete();
		return;
	}
}

/*
	Name: function_9e5afafd
	Namespace: namespace_d947f615
	Checksum: 0x3AF39C8E
	Offset: 0x11E0
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 461
*/
function function_9e5afafd(index)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	foreach(player in GetPlayers())
	{
		if(index == zm_utility::get_player_index(player))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_866e8d3
	Namespace: namespace_d947f615
	Checksum: 0xF3F708BA
	Offset: 0x12B0
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 487
*/
function function_866e8d3(index)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	foreach(player in GetPlayers())
	{
		if(index == zm_utility::get_player_index(player))
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_81d50c51
	Namespace: namespace_d947f615
	Checksum: 0xF1B75F92
	Offset: 0x1380
	Size: 0x390
	Parameters: 7
	Flags: None
	Line Number: 513
*/
function function_81d50c51(ent, var_4f089af2, var_995281e8, var_ced106c0, var_d9a1e272, var_5efdbdb5, var_453edb67)
{
	if(!isdefined(var_ced106c0))
	{
		var_ced106c0 = "Building...";
	}
	if(!isdefined(var_d9a1e272))
	{
		var_d9a1e272 = "disable_anim";
	}
	if(!isdefined(var_5efdbdb5))
	{
		var_5efdbdb5 = 5;
	}
	if(!isdefined(ent) || !isdefined(var_4f089af2) || !isdefined(var_995281e8))
	{
		return;
	}
	var_c438fa25 = 0;
	var_37a0a38 = 0;
	var_3a946d83 = 0;
	if(!isdefined(var_453edb67))
	{
		var_453edb67 = Array(0, 0, 0);
	}
	if(isdefined(var_453edb67[0]) && IsString(var_453edb67[0]))
	{
		var_c438fa25 = 1;
	}
	if(isdefined(var_453edb67[1]) && IsString(var_453edb67[1]))
	{
		var_37a0a38 = 1;
	}
	if(isdefined(var_453edb67[2]) && IsString(var_453edb67[2]))
	{
		var_3a946d83 = 1;
	}
	if(var_c438fa25 && IsEntity(ent))
	{
		ent PlayLoopSound(var_453edb67[0]);
	}
	else if(var_c438fa25)
	{
		self PlayLoopSound(var_453edb67[0]);
	}
	res = craftable_use_hold_think_internal(self, var_5efdbdb5 * 1000, var_d9a1e272, var_ced106c0);
	if(var_c438fa25 && IsEntity(ent))
	{
		ent StopLoopSound();
	}
	else if(var_c438fa25)
	{
		self StopLoopSound();
	}
	wait(0.05);
	if(res)
	{
		ent notify(var_4f089af2);
		if(var_37a0a38 && IsEntity(ent))
		{
			ent playsound(var_453edb67[1]);
		}
		else if(var_37a0a38)
		{
			self playsound(var_453edb67[1]);
			continue;
		}
	}
	ent notify(var_995281e8);
	if(var_3a946d83 && IsEntity(ent))
	{
		ent playsound(var_453edb67[2]);
	}
	else if(var_3a946d83)
	{
		self playsound(var_453edb67[2]);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2eaa2a78
	Namespace: namespace_d947f615
	Checksum: 0x93542D0
	Offset: 0x1718
	Size: 0xD0
	Parameters: 1
	Flags: Private
	Line Number: 604
*/
function private function_2eaa2a78(var_d9a1e272)
{
	self util::show_hud(0);
	ACTION = GetWeapon(var_d9a1e272);
	self GiveWeapon(ACTION);
	self SwitchToWeapon(ACTION);
	self notify("hash_c8b0756f");
	self waittill("craftable_progress_end");
	self TakeWeapon(ACTION);
	self util::show_hud(1);
}

/*
	Name: craftable_use_hold_think_internal
	Namespace: namespace_d947f615
	Checksum: 0xDB8380E2
	Offset: 0x17F0
	Size: 0x288
	Parameters: 4
	Flags: Private
	Line Number: 626
*/
function private craftable_use_hold_think_internal(player, var_5efdbdb5, var_d9a1e272, var_ced106c0)
{
	player notify("hash_23a2c397");
	player endon("hash_23a2c397");
	if(player hasPerk("specialty_fastreload"))
	{
		var_5efdbdb5 = var_5efdbdb5 / 2;
	}
	craft_start_time = GetTime();
	craft_time = var_5efdbdb5;
	if(craft_time > 0)
	{
		player zm_utility::disable_player_move_states(1);
		player zm_utility::increment_is_drinking();
		if(var_d9a1e272 == "disable_anim")
		{
			player DisableWeapons();
			continue;
		}
		player thread function_2eaa2a78(var_d9a1e272);
		player FreezeControlsAllowLook(1);
		player thread player_progress_bar(craft_start_time, craft_time, var_ced106c0);
		while(isdefined(player) && player player_continue_crafting() && GetTime() - craft_start_time < craft_time)
		{
			wait(0.05);
		}
		player notify("craftable_progress_end");
		player FreezeControlsAllowLook(0);
		if(var_d9a1e272 == "disable_anim")
		{
			player enableWeapons();
		}
		if(isdefined(player.IS_DRINKING) && player.IS_DRINKING)
		{
			player zm_utility::decrement_is_drinking();
		}
		player zm_utility::enable_player_move_states();
	}
	if(isdefined(player) && player player_continue_crafting() && (craft_time <= 0 || GetTime() - craft_start_time >= craft_time))
	{
		return 1;
		continue;
	}
	return 0;
}

/*
	Name: player_continue_crafting
	Namespace: namespace_d947f615
	Checksum: 0x6269A9E5
	Offset: 0x1A80
	Size: 0x58
	Parameters: 0
	Flags: Private
	Line Number: 682
*/
function private player_continue_crafting()
{
	if(!self useButtonPressed() || self laststand::player_is_in_laststand() || self zm_utility::in_revive_trigger())
	{
		return 0;
	}
	return 1;
}

/*
	Name: player_progress_bar
	Namespace: namespace_d947f615
	Checksum: 0xD806EA09
	Offset: 0x1AE0
	Size: 0xE8
	Parameters: 3
	Flags: Private
	Line Number: 701
*/
function private player_progress_bar(start_time, craft_time, building_prompt)
{
	self.useBar = self hud::createPrimaryProgressBar();
	self.useBarText = self hud::createPrimaryProgressBarText();
	self.useBarText setText(building_prompt);
	if(isdefined(self) && isdefined(start_time) && isdefined(craft_time))
	{
		self player_progress_bar_update(start_time, craft_time);
	}
	self.useBarText hud::destroyElem();
	self.useBar hud::destroyElem();
}

/*
	Name: player_progress_bar_update
	Namespace: namespace_d947f615
	Checksum: 0x485374B6
	Offset: 0x1BD0
	Size: 0xD0
	Parameters: 2
	Flags: Private
	Line Number: 724
*/
function private player_progress_bar_update(start_time, craft_time)
{
	self endon("entering_last_stand");
	self endon("death");
	self endon("disconnect");
	self endon("craftable_progress_end");
	while(isdefined(self) && GetTime() - start_time < craft_time)
	{
		progress = GetTime() - start_time / craft_time;
		if(progress < 0)
		{
			progress = 0;
		}
		if(progress > 1)
		{
			progress = 1;
		}
		self.useBar hud::updateBar(progress);
		wait(0.05);
	}
}

/*
	Name: function_5155d754
	Namespace: namespace_d947f615
	Checksum: 0xAA624B6B
	Offset: 0x1CA8
	Size: 0x298
	Parameters: 3
	Flags: None
	Line Number: 756
*/
function function_5155d754(var_b93c6463, var_2d37c678, offset)
{
	if(!isdefined(var_2d37c678))
	{
		var_2d37c678 = 1;
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	if(!isdefined(level.ATTACKABLES))
	{
		level.ATTACKABLES = [];
	}
	attackable = spawnstruct();
	attackable.origin = self.origin + offset;
	attackable.targetname = "attackable" + self.origin;
	attackable.target = attackable.targetname + "_slots";
	attackable.bundle = struct::get_script_bundle("attackables", var_b93c6463);
	attackable.health = attackable.bundle.max_health;
	attackable.is_active = var_2d37c678;
	max_attackers = attackable.bundle.max_attackers;
	var_f14e87ca = attackable.bundle.attack_distance;
	var_fca64d70 = [];
	var_b4eb069f = 360 / max_attackers;
	var_f568bc65 = RandomFloat(var_b4eb069f);
	var_fca64d70 = attackable function_9dd39fe9(max_attackers, var_f14e87ca, attackable.targetname + "_slots", "script_origin");
	attackable.slot = var_fca64d70;
	if(!isdefined(level.ATTACKABLES))
	{
		level.ATTACKABLES = [];
	}
	else if(!IsArray(level.ATTACKABLES))
	{
		level.ATTACKABLES = Array(level.ATTACKABLES);
	}
	level.ATTACKABLES[level.ATTACKABLES.size] = attackable;
	return attackable;
}

/*
	Name: function_414a2243
	Namespace: namespace_d947f615
	Checksum: 0xF87DFD56
	Offset: 0x1F48
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 806
*/
function function_414a2243()
{
	if(isdefined(self.slot))
	{
		foreach(slot in self.slot)
		{
			slot delete();
		}
	}
	ArrayRemoveValue(level.ATTACKABLES, self);
	self delete();
}

/*
	Name: function_f4531179
	Namespace: namespace_d947f615
	Checksum: 0x7858BD37
	Offset: 0x2020
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 829
*/
function function_f4531179()
{
	if(!isdefined(self.bundle))
	{
		return;
	}
	self.health = self.bundle.max_health;
	self zm_attackables::activate();
}

/*
	Name: function_8b8ebdff
	Namespace: namespace_d947f615
	Checksum: 0x6880EA52
	Offset: 0x2070
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 849
*/
function function_8b8ebdff(new_health)
{
	self.health = new_health;
}

/*
	Name: function_4a96aefa
	Namespace: namespace_d947f615
	Checksum: 0x246C35CB
	Offset: 0x2090
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 864
*/
function function_4a96aefa()
{
	zm_spawner::add_custom_zombie_spawn_logic(&function_10168371);
	foreach(z in getaiarchetypearray("zombies"))
	{
		z thread function_10168371();
	}
}

/*
	Name: function_10168371
	Namespace: namespace_d947f615
	Checksum: 0x4CE3BAC1
	Offset: 0x2158
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 883
*/
function function_10168371()
{
	self notify("hash_6ccd4b26");
	self endon("hash_6ccd4b26");
	self endon("death");
	while(isdefined(self) && isalive(self))
	{
		var_b15e2d5d = self ai::get_behavior_attribute("use_attackable");
		if(!(isdefined(var_b15e2d5d) && var_b15e2d5d))
		{
			self ai::set_behavior_attribute("use_attackable", 1);
		}
		wait(0.05);
	}
}

/*
	Name: function_714a1ce8
	Namespace: namespace_d947f615
	Checksum: 0xA36CA03E
	Offset: 0x2210
	Size: 0xE8
	Parameters: 4
	Flags: None
	Line Number: 909
*/
function function_714a1ce8(var_a77e2b44, Ratio, round_number, var_86db3206)
{
	if(!isdefined(Ratio))
	{
		Ratio = 1.1;
	}
	if(!isdefined(round_number))
	{
		round_number = zm::get_round_number();
	}
	if(isdefined(var_86db3206) && zm::get_round_number() < var_86db3206)
	{
		return var_a77e2b44;
	}
	Number = var_a77e2b44 + round_number * Ratio;
	if(Number > 1073741824 || Number < 0)
	{
		return var_a77e2b44;
	}
	return Int(Number);
}

/*
	Name: function_807e8e14
	Namespace: namespace_d947f615
	Checksum: 0xE9E710C4
	Offset: 0x2300
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 941
*/
function function_807e8e14(var_fe6c83c7, var_d2e1f8f5)
{
	if(!isdefined(var_fe6c83c7))
	{
		var_fe6c83c7 = 0;
	}
	if(!isdefined(var_d2e1f8f5))
	{
		var_d2e1f8f5 = 0;
	}
	if(level flag::get("infinite_wave_active"))
	{
		return;
	}
	level endon("hash_d9576634");
	level flag::set("infinite_wave_active");
	level.var_d9783c18 = level.zombie_total;
	while(level flag::get("infinite_wave_active"))
	{
		if(isdefined(var_fe6c83c7) && var_fe6c83c7)
		{
			level thread function_f6fe9ec0();
		}
		if(isdefined(var_d2e1f8f5) && var_d2e1f8f5)
		{
			level thread function_5492ce4();
			level.var_2f7225c9 = 1;
		}
		level.zombie_total = 100;
		wait(5);
	}
}

/*
	Name: function_eca7e9e7
	Namespace: namespace_d947f615
	Checksum: 0x864AC2BB
	Offset: 0x2428
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 984
*/
function function_eca7e9e7()
{
	if(!level flag::get("infinite_wave_active"))
	{
		return;
	}
	if(isdefined(level.var_d9783c18))
	{
		level.zombie_total = level.var_d9783c18;
		level.var_d9783c18 = undefined;
	}
	level notify("hash_d9576634");
	level flag::clear("infinite_wave_active");
}

/*
	Name: function_5492ce4
	Namespace: namespace_d947f615
	Checksum: 0x57B08A1B
	Offset: 0x24A8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1009
*/
function function_5492ce4()
{
	foreach(zombie in getaiarchetypearray("zombie"))
	{
		if(!(isdefined(zombie.var_8b470230) && zombie.var_8b470230))
		{
			zombie.var_8b470230 = 1;
			zombie thread zombie_utility::set_zombie_run_cycle("sprint");
		}
	}
}

/*
	Name: function_f6fe9ec0
	Namespace: namespace_d947f615
	Checksum: 0x740D3281
	Offset: 0x2590
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1031
*/
function function_f6fe9ec0()
{
	foreach(zombie in getaiarchetypearray("zombie"))
	{
		zombie.no_damage_points = 1;
		zombie.deathpoints_already_given = 1;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5aeadb63
	Namespace: namespace_d947f615
	Checksum: 0x268540E2
	Offset: 0x2648
	Size: 0x98
	Parameters: 5
	Flags: None
	Line Number: 1052
*/
function function_5aeadb63(min, max, current, var_f19b9a2b, var_6ba41c5)
{
	if(min > max || var_f19b9a2b > var_f19b9a2b)
	{
		return;
	}
	temp = current - min / max - min;
	var_8a155c0 = temp * var_6ba41c5 - var_f19b9a2b + var_f19b9a2b;
	return var_8a155c0;
}

/*
	Name: function_ccf94cf1
	Namespace: namespace_d947f615
	Checksum: 0xD10E122
	Offset: 0x26E8
	Size: 0x238
	Parameters: 5
	Flags: None
	Line Number: 1073
*/
function function_ccf94cf1(text, killNotify, font_scale, xpos, ypos)
{
	if(!isdefined(text))
	{
		text = "UndefinedText";
	}
	if(!isdefined(killNotify))
	{
		killNotify = "killAnyHudElem";
	}
	if(!isdefined(font_scale))
	{
		font_scale = 1.25;
	}
	if(!isdefined(xpos))
	{
		xpos = 320;
	}
	if(!isdefined(ypos))
	{
		ypos = 220;
	}
	self notify("hide_equipment_hint_text");
	wait(0.05);
	self setup_client_hintelem(xpos, ypos, font_scale);
	self.hintelem setText(text);
	self.hintelem.alpha = 1;
	self.hintelem.font = "small";
	self.hintelem.hidewheninmenu = 1;
	res = self util::waittill_any_return(killNotify, "hide_equipment_hint_text", "death", "disconnect");
	if(res == killNotify && isdefined(self.hintelem))
	{
		self.hintelem fadeOverTime(0.25);
		self.hintelem.alpha = 0;
		self util::waittill_any_timeout(0.25, "hide_equipment_hint_text");
	}
	if(isdefined(self) && isdefined(self.hintelem))
	{
		self.hintelem setText("");
		self.hintelem destroy();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: setup_client_hintelem
	Namespace: namespace_d947f615
	Checksum: 0xD9F20268
	Offset: 0x2928
	Size: 0x1A0
	Parameters: 3
	Flags: None
	Line Number: 1128
*/
function setup_client_hintelem(xpos, ypos, font_scale)
{
	if(!isdefined(xpos))
	{
		xpos = 320;
	}
	if(!isdefined(ypos))
	{
		ypos = 220;
	}
	if(!isdefined(font_scale))
	{
		font_scale = 1.25;
	}
	self endon("death");
	self endon("disconnect");
	if(!isdefined(self.hintelem))
	{
		self.hintelem = newClientHudElem(self);
	}
	if(self IsSplitscreen())
	{
		if(GetDvarInt("splitscreen_playerCount") >= 3)
		{
			self.hintelem init_hint_hudelem(160, 90, "center", "middle", font_scale * 0.8, 1);
			continue;
		}
		self.hintelem init_hint_hudelem(160, 90, "center", "middle", font_scale, 1);
		continue;
	}
	self.hintelem init_hint_hudelem(xpos, ypos, "center", "bottom", font_scale, 1);
}

/*
	Name: init_hint_hudelem
	Namespace: namespace_d947f615
	Checksum: 0xDA8D148D
	Offset: 0x2AD0
	Size: 0x88
	Parameters: 6
	Flags: Private
	Line Number: 1171
*/
function private init_hint_hudelem(x, y, alignX, alignY, fontscale, alpha)
{
	self.x = x;
	self.y = y;
	self.alignX = alignX;
	self.alignY = alignY;
	self.fontscale = fontscale;
	self.alpha = alpha;
	self.sort = 20;
}

