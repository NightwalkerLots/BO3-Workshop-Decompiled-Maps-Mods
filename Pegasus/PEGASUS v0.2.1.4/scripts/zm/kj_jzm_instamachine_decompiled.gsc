#include scripts\codescripts\struct;
#include scripts\shared\_burnplayer;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_86dc1221;

/*
	Name: function_d79e5beb
	Namespace: namespace_86dc1221
	Checksum: 0xA52A3676
	Offset: 0x798
	Size: 0x580
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function function_d79e5beb()
{
	level endon("game_ended");
	self endon("disconnect");
	self DisableWeapons();
	wait(0.1);
	var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
	while(!isdefined(var_a638c0c2))
	{
		self IPrintLnBold("^1Location undefined");
		var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
		wait(0.1);
	}
	var_7c7480f8 = spawn("script_model", var_a638c0c2);
	var_c5e842b5 = VectorToAngles(self.origin - var_7c7480f8.origin);
	var_7c7480f8.angles = var_c5e842b5;
	var_7c7480f8 RotateYaw(-90, 0.05);
	var_7c7480f8 waittill("rotatedone");
	var_7c7480f8 LinkTo(self);
	var_7c7480f8 SetModel("pegasus_instant_machine");
	wait(0.05);
	trig = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 50), 0, 32, 32);
	trig setcursorhint("HINT_NOICON");
	trig setHintString("Hold ^3 [{+activate}] ^7 to confirm the machines location");
	trig SetTeamForTrigger("allies");
	trig EnableLinkTo();
	trig LinkTo(self);
	self AllowJump(0);
	for(;;)
	{
		trig waittill("trigger", player);
		var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
		wait(0.05);
		while(!isdefined(var_a638c0c2))
		{
			self IPrintLnBold("^1Location undefined");
			var_a638c0c2 = GetClosestPointOnNavMesh(self.origin + VectorScale((0, 0, 1), 60) + AnglesToForward(self getPlayerAngles()) * 110, 100, 15);
			wait(0.1);
		}
		if(isdefined(var_a638c0c2))
		{
			self playlocalsound("wpn_tesla_proj_impact");
			if(isdefined(var_7c7480f8))
			{
				var_7c7480f8 delete();
			}
			var_7c7480f8 = spawn("script_model", var_a638c0c2);
			var_c5e842b5 = VectorToAngles(self.origin - var_7c7480f8.origin);
			var_7c7480f8.angles = var_c5e842b5;
			var_7c7480f8 RotateYaw(-90, 0.05);
			var_7c7480f8 waittill("rotatedone");
			var_7c7480f8 SetModel("pegasus_instant_machine");
			trig delete();
			self enableWeapons();
			self AllowJump(1);
			thread function_fe24a830(var_7c7480f8);
		}
	}
	else
	{
	}
}

/*
	Name: function_7554ed80
	Namespace: namespace_86dc1221
	Checksum: 0x25978E35
	Offset: 0xD20
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 121
*/
function function_7554ed80(trig)
{
	if(trig.var_d0cda9be == 1)
	{
		trig setHintString("Hold ^3 [{+activate}] ^7 to PACK A PUNCH \n ^3Knife ^7to switch");
	}
	else if(trig.var_d0cda9be == 2)
	{
		trig setHintString("Hold ^3 [{+activate}] ^7 for a RANDOM PERK \n ^3Knife ^7to switch");
	}
	else if(trig.var_d0cda9be == 3)
	{
		trig setHintString("Hold ^3 [{+activate}] ^7 for a RANDOM WEAPON \n ^3Knife ^7to switch");
	}
	else if(trig.var_d0cda9be == 4)
	{
		trig setHintString("Hold ^3 [{+activate}] ^7 for a RANDOM POWERUP \n ^3Knife ^7to switch");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fe24a830
	Namespace: namespace_86dc1221
	Checksum: 0x257A278C
	Offset: 0xE18
	Size: 0x2B0
	Parameters: 1
	Flags: None
	Line Number: 153
*/
function function_fe24a830(var_7c7480f8)
{
	level endon("game_ended");
	self endon("disconnect");
	wait(0.05);
	trig = spawn("trigger_radius_use", var_7c7480f8 GetTagOrigin("tag_machine_trig"), 0, 4, 4);
	trig setcursorhint("HINT_NOICON");
	trig SetTeamForTrigger("allies");
	trig EnableLinkTo();
	trig LinkTo(var_7c7480f8 GetTagOrigin("tag_machine_trig"));
	trig.var_d0cda9be = 1;
	while(1)
	{
		trig setHintString("Hold ^3 [{+activate}] ^7 to use the INSTANT MACHINE");
		trig waittill("trigger", player);
		function_7554ed80(trig);
		wait(0.5);
		while(1)
		{
			if(player meleeButtonPressed() && Distance2D(player.origin, var_7c7480f8 GetTagOrigin("tag_machine_trig")) < 65)
			{
				trig.var_d0cda9be++;
				if(trig.var_d0cda9be >= 5)
				{
					trig.var_d0cda9be = 1;
				}
				function_7554ed80(trig);
				wait(0.55);
			}
			else if(player useButtonPressed() && Distance2D(player.origin, var_7c7480f8 GetTagOrigin("tag_machine_trig")) < 65)
			{
				player function_8bde5a10(trig, var_7c7480f8);
				break;
			}
			wait(0.05);
		}
	}
}

/*
	Name: function_8bde5a10
	Namespace: namespace_86dc1221
	Checksum: 0x52616605
	Offset: 0x10D0
	Size: 0x1F0
	Parameters: 2
	Flags: None
	Line Number: 202
*/
function function_8bde5a10(trig, var_7c7480f8)
{
	if(trig.var_d0cda9be == 1)
	{
		self function_6d89da65(trig, var_7c7480f8);
	}
	else if(trig.var_d0cda9be == 2)
	{
		if(self.score >= 3000)
		{
			self zm_score::minus_to_player_score(3000);
			function_a5166bdd(trig, var_7c7480f8);
		}
		else
		{
			self IPrintLnBold(self.var_1ad2f4ac + ": ^1Insufficient Funds");
		}
	}
	else if(trig.var_d0cda9be == 3)
	{
		if(self.score >= 1000)
		{
			self zm_score::minus_to_player_score(1000);
			self function_f5e11b21(trig, var_7c7480f8);
		}
		else
		{
			self IPrintLnBold(self.var_1ad2f4ac + ": ^1Insufficient Funds");
		}
	}
	else if(trig.var_d0cda9be == 4)
	{
		if(self.score >= 1500)
		{
			self zm_score::minus_to_player_score(1500);
			function_4cd06ff7(trig, var_7c7480f8);
		}
		else
		{
			self IPrintLnBold(self.var_1ad2f4ac + ": ^1Insufficient Funds");
			return;
		}
	}
}

/*
	Name: function_6d89da65
	Namespace: namespace_86dc1221
	Checksum: 0x24240723
	Offset: 0x12C8
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 257
*/
function function_6d89da65(trig, var_7c7480f8)
{
	current_weapon = self GetCurrentWeapon();
	self function_6b63d352(trig, var_7c7480f8, current_weapon);
}

/*
	Name: function_6b63d352
	Namespace: namespace_86dc1221
	Checksum: 0xC2CF9B22
	Offset: 0x1330
	Size: 0x3C0
	Parameters: 3
	Flags: None
	Line Number: 273
*/
function function_6b63d352(trig, var_7c7480f8, current_weapon)
{
	if(isdefined(self) && self validation(current_weapon))
	{
		if(self.score >= 5000)
		{
			self TakeWeapon(current_weapon);
			self zm_score::minus_to_player_score(5000);
			var_aabb4aee = zm_weapons::get_upgrade_weapon(current_weapon);
			wait(0.25);
			self zm_weapons::weapon_give(var_aabb4aee, undefined, undefined, 1);
			self zm_stats::increment_client_stat("use_pap");
			self zm_stats::increment_player_stat("use_pap");
		}
		else
		{
			self playlocalsound("zmb_perks_packa_deny");
		}
	}
	else if(zm_weapons::weapon_supports_aat(current_weapon))
	{
		if(self.score >= 2500)
		{
			self TakeWeapon(current_weapon);
			self zm_score::minus_to_player_score(2500);
			wait(0.25);
			self zm_weapons::weapon_give(current_weapon, undefined, undefined, 1);
			self waittill("weapon_change", weapon);
			self notify("pap_taken");
			self thread AAT::acquire(current_weapon);
			self playlocalsound("zmb_perks_packa_ready");
			self zm_stats::increment_client_stat("use_pap");
			self zm_stats::increment_player_stat("use_pap");
		}
		else
		{
			self playlocalsound("zmb_perks_packa_deny");
		}
	}
	else if(zm_weapons::is_weapon_upgraded(current_weapon))
	{
		if(self.score >= 2500)
		{
			self TakeWeapon(current_weapon);
			self zm_score::minus_to_player_score(2500);
			wait(0.25);
			self zm_weapons::weapon_give(current_weapon, undefined, undefined, 1);
			self waittill("weapon_change", weapon);
			self notify("pap_taken");
			self playlocalsound("zmb_perks_packa_ready");
			self zm_stats::increment_client_stat("use_pap");
			self zm_stats::increment_player_stat("use_pap");
		}
		else
		{
			self playlocalsound("zmb_perks_packa_deny");
		}
	}
	else
	{
		self playlocalsound("zmb_perks_packa_deny");
	}
}

/*
	Name: validation
	Namespace: namespace_86dc1221
	Checksum: 0x2B59136
	Offset: 0x16F8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 347
*/
function validation(weap)
{
	if(isdefined(self.zombie_vars["zombie_powerup_minigun_on"]) && self.zombie_vars["zombie_powerup_minigun_on"])
	{
		return 0;
	}
	if(!zm_utility::is_player_valid(self) || zm_equipment::is_equipment(weap))
	{
		return 0;
	}
	return zm_weapons::can_upgrade_weapon(weap);
}

/*
	Name: function_fdf3037f
	Namespace: namespace_86dc1221
	Checksum: 0xAB5E954D
	Offset: 0x1790
	Size: 0x220
	Parameters: 3
	Flags: None
	Line Number: 370
*/
function function_fdf3037f(trig, var_7c7480f8, var_aabb4aee)
{
	level endon("game_ended");
	var_8f466ccc = function_1c8adcb0(var_aabb4aee);
	var_94a58cd0 = spawn("script_model", var_7c7480f8 GetTagOrigin("tag_machine_start"));
	var_94a58cd0 SetModel(var_8f466ccc);
	var_94a58cd0 endon("powerup_timedout");
	var_94a58cd0.only_affects_grabber = 1;
	var_94a58cd0 PlayLoopSound("zmb_spawn_powerup_loop");
	wait(0.1);
	var_94a58cd0 thread zm_powerups::powerup_wobble();
	var_94a58cd0 thread zm_powerups::powerup_timeout();
	if(isdefined(var_aabb4aee))
	{
		weapon_string = MakeLocalizedString(var_aabb4aee.displayName);
		trig setHintString("Hold ^3 [{+activate}] ^7 to take the Item " + weapon_string);
		trig waittill("trigger", player);
		player zm_weapons::weapon_give(var_aabb4aee, undefined, undefined, 1);
		player notify("pap_taken");
		player playlocalsound("zmb_perks_packa_ready");
		var_94a58cd0 notify("powerup_grabbed");
		if(isdefined(var_94a58cd0))
		{
			wait(0.05);
			var_94a58cd0 delete();
		}
	}
}

/*
	Name: function_f5e11b21
	Namespace: namespace_86dc1221
	Checksum: 0x791F23B2
	Offset: 0x19B8
	Size: 0x2F0
	Parameters: 2
	Flags: None
	Line Number: 409
*/
function function_f5e11b21(trig, var_7c7480f8)
{
	if(isdefined(level.var_e8e1cf29))
	{
		wait(0.2);
		random_weapon = Array::random(level.var_e8e1cf29);
		wait(0.2);
		random_weapon = GetWeapon(random_weapon);
	}
	else if(!isdefined(level.var_3405ee08))
	{
		level.var_3405ee08 = getArrayKeys(level.zombie_weapons);
	}
	wait(0.2);
	random_weapon = Array::random(level.var_3405ee08);
	wait(0.2);
	if(isdefined(random_weapon))
	{
		var_8f466ccc = function_1c8adcb0(random_weapon);
		var_ce2297c7 = spawn("script_model", var_7c7480f8 GetTagOrigin("tag_machine_start"));
		var_ce2297c7 SetModel(var_8f466ccc);
		var_ce2297c7 endon("powerup_timedout");
		var_ce2297c7.only_affects_grabber = 1;
		var_ce2297c7 PlayLoopSound("zmb_spawn_powerup_loop");
		wait(0.2);
		var_ce2297c7 thread zm_powerups::powerup_wobble();
		var_ce2297c7 thread zm_powerups::powerup_timeout();
		weapon_string = MakeLocalizedString(random_weapon.displayName);
		trig setHintString("Hold ^3 [{+activate}] ^7 to take the Item " + weapon_string);
		trig waittill("trigger", player);
		if(random_weapon.name == "ray_gun" || random_weapon.name == "raygun_mark2")
		{
			playsoundatposition("mus_raygun_stinger", (0, 0, 0));
		}
		player zm_weapons::weapon_give(random_weapon, undefined, undefined, 1);
		var_ce2297c7 notify("powerup_grabbed");
		if(isdefined(var_ce2297c7))
		{
			wait(0.05);
			var_ce2297c7 delete();
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_87f54d41
	Namespace: namespace_86dc1221
	Checksum: 0xACBC3AD9
	Offset: 0x1CB0
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 466
*/
function function_87f54d41(var_7c7480f8)
{
	wait(0.05);
	foreach(powerup in level.active_powerups)
	{
		if(isdefined(powerup) && Distance2D(powerup.origin, var_7c7480f8 GetTagOrigin("tag_machine_start")) < 30)
		{
			powerup.var_4cd06ff7 = 1;
		}
	}
}

/*
	Name: function_a5166bdd
	Namespace: namespace_86dc1221
	Checksum: 0x47AD64B9
	Offset: 0x1D98
	Size: 0x1C0
	Parameters: 2
	Flags: None
	Line Number: 488
*/
function function_a5166bdd(trig, var_7c7480f8)
{
	thread zm_powerups::specific_powerup_drop("free_perk", var_7c7480f8 GetTagOrigin("tag_machine_start") + VectorScale((0, 0, -1), 30));
	thread function_87f54d41(var_7c7480f8);
	wait(1.5);
	trig setHintString("Hold ^3 [{+activate}] ^7 to take the Item ");
	trig waittill("trigger", player);
	foreach(powerup in level.active_powerups)
	{
		if(isdefined(powerup) && Distance2D(powerup.origin, var_7c7480f8 GetTagOrigin("tag_machine_start")) < 30)
		{
			powerup notify("movedone");
			powerup moveto(var_7c7480f8 GetTagOrigin("tag_machine_end"), 0.75);
			break;
		}
	}
}

/*
	Name: function_4cd06ff7
	Namespace: namespace_86dc1221
	Checksum: 0xC1B4B8F3
	Offset: 0x1F60
	Size: 0x1CE
	Parameters: 2
	Flags: None
	Line Number: 516
*/
function function_4cd06ff7(trig, var_7c7480f8)
{
	thread zm_powerups::specific_powerup_drop(Array::random(level.zombie_powerup_array), var_7c7480f8 GetTagOrigin("tag_machine_start") + VectorScale((0, 0, -1), 30));
	thread function_87f54d41(var_7c7480f8);
	wait(1.5);
	trig setHintString("Hold ^3 [{+activate}] ^7 to take the Item ");
	trig waittill("trigger", player);
	foreach(powerup in level.active_powerups)
	{
		if(isdefined(powerup) && Distance2D(powerup.origin, var_7c7480f8 GetTagOrigin("tag_machine_start")) < 30)
		{
			powerup notify("movedone");
			powerup moveto(var_7c7480f8 GetTagOrigin("tag_machine_end"), 0.75);
			break;
		}
	}
}

