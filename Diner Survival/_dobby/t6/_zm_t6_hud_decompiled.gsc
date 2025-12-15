#include scripts\_dobby\_db_zonewriter;
#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\gameobjects_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_efd7b5f5;

/*
	Name: __init__sytem__
	Namespace: namespace_efd7b5f5
	Checksum: 0x2E188AE9
	Offset: 0x4F0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_t6_hud", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_efd7b5f5
	Checksum: 0x9CB68546
	Offset: 0x538
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	clientfield::register("clientuimodel", "db.MuleKick", 1, 1, "int");
	clientfield::register("clientuimodel", "db.InstakillUpgrade", 1, 3, "int");
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	for(i = 0; i < 8; i++)
	{
		clientfield::register("world", "player_reviving" + i, 1, 1, "int");
	}
	level._powerup_grab_check = &powerup_grab_check;
	level thread revive_hud_think();
	return;
}

/*
	Name: powerup_grab_check
	Namespace: namespace_efd7b5f5
	Checksum: 0x79C0EA1
	Offset: 0x670
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 71
*/
function powerup_grab_check(who)
{
	if(self.powerup_name === "free_perk")
	{
		level.perk_purchase_limit++;
	}
	if(self.powerup_name === "nuke")
	{
		LUINotifyEvent(&"zombie_notification", 1, self.hint);
	}
	else if(self.powerup_name === "carpenter")
	{
		LUINotifyEvent(&"zombie_notification", 1, &"ZOMBIE_POWERUP_CARPENTER");
	}
	else if(self.powerup_name === "full_ammo")
	{
		LUINotifyEvent(&"powerup_notification", 1, 5);
	}
	return 1;
}

/*
	Name: function_5e62962c
	Namespace: namespace_efd7b5f5
	Checksum: 0x83D47009
	Offset: 0x758
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 102
*/
function function_5e62962c(num, var_79329cf2)
{
	if(!isdefined(var_79329cf2))
	{
		var_79329cf2 = 0;
	}
	util::wait_network_frame();
	level flag::wait_till("begin_spawning");
	for(i = 0; i < num; i++)
	{
		level thread function_b57a7269(var_79329cf2);
		wait(2);
	}
}

/*
	Name: function_b57a7269
	Namespace: namespace_efd7b5f5
	Checksum: 0xAB2F4487
	Offset: 0x808
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 127
*/
function function_b57a7269(var_79329cf2)
{
	bot = AddTestClient();
	wait(3);
	bot [[level.spawnPlayer]]();
	bot SetOrigin(bot GetOrigin() + (RandomInt(30), randomIntRange(-30, 1), RandomFloat(40)));
	if(var_79329cf2)
	{
		bot EnableInvulnerability();
		return;
	}
}

/*
	Name: revive_hud_think
	Namespace: namespace_efd7b5f5
	Checksum: 0xD35B4B01
	Offset: 0x8F0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function revive_hud_think()
{
	self endon("disconnect");
	for(;;)
	{
		wait(0.1);
		if(!laststand::player_any_player_in_laststand())
		{
			continue;
		}
		players = GetPlayers();
		playerToRevive = undefined;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand() || !isdefined(players[i].reviveTrigger.createtime))
			{
				continue;
			}
			if(!isdefined(playerToRevive) || playerToRevive.reviveTrigger.createtime > players[i].reviveTrigger.createtime)
			{
				playerToRevive = players[i];
			}
		}
		if(isdefined(playerToRevive))
		{
			for(i = 0; i < players.size; i++)
			{
				if(players[i] laststand::player_is_in_laststand())
				{
					continue;
				}
				players[i] thread fadeReviveMessageOver(playerToRevive, 3);
			}
			playerToRevive.reviveTrigger.createtime = undefined;
			wait(3.5);
		}
	}
}

/*
	Name: fadeReviveMessageOver
	Namespace: namespace_efd7b5f5
	Checksum: 0x9E3247C7
	Offset: 0xAB8
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 199
*/
function fadeReviveMessageOver(playerToRevive, time)
{
	revive_hud_show();
	self.revive_hud setText(&"GAME_PLAYER_NEEDS_TO_BE_REVIVED", playerToRevive);
	self.revive_hud fadeOverTime(time);
	self.revive_hud.alpha = 0;
}

/*
	Name: revive_hud_show
	Namespace: namespace_efd7b5f5
	Checksum: 0x4C1BF593
	Offset: 0xB40
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 217
*/
function revive_hud_show()
{
	/#
		Assert(isdefined(self));
	#/
	/#
		Assert(isdefined(self.revive_hud));
	#/
	self.revive_hud.alpha = 1;
}

/*
	Name: revive_hud_show_n_fade
	Namespace: namespace_efd7b5f5
	Checksum: 0xCF26AA27
	Offset: 0xB98
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 238
*/
function revive_hud_show_n_fade(time)
{
	revive_hud_show();
	self.revive_hud fadeOverTime(time);
	self.revive_hud.alpha = 0;
}

/*
	Name: revive_hud_create
	Namespace: namespace_efd7b5f5
	Checksum: 0xD75DCBDF
	Offset: 0xBF0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 255
*/
function revive_hud_create()
{
	self.revive_hud = newClientHudElem(self);
	self.revive_hud.alignX = "center";
	self.revive_hud.alignY = "middle";
	self.revive_hud.horzAlign = "center";
	self.revive_hud.vertAlign = "bottom";
	self.revive_hud.y = -80;
	self.revive_hud.foreground = 1;
	self.revive_hud.font = "default";
	self.revive_hud.fontscale = 1.5;
	self.revive_hud.alpha = 0;
	self.revive_hud.color = (1, 1, 1);
	self.revive_hud setText("");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_connect
	Namespace: namespace_efd7b5f5
	Checksum: 0xAD635388
	Offset: 0xD20
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 283
*/
function on_player_connect()
{
	self thread function_1d6dde97();
	self revive_hud_create();
}

/*
	Name: on_player_spawned
	Namespace: namespace_efd7b5f5
	Checksum: 0x58485EF7
	Offset: 0xD60
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 299
*/
function on_player_spawned()
{
	self thread function_28217684();
}

/*
	Name: function_ea6a044f
	Namespace: namespace_efd7b5f5
	Checksum: 0xC8376ACB
	Offset: 0xD88
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 314
*/
function function_ea6a044f()
{
	self util::waittill_any("bled_out", "player_revived", "fake_death", "player_suicide");
	objective_delete(self.var_c8d16028);
	self thread function_1d6dde97();
}

/*
	Name: function_1d6dde97
	Namespace: namespace_efd7b5f5
	Checksum: 0x30825248
	Offset: 0xE00
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 331
*/
function function_1d6dde97()
{
	self endon("disconnect");
	self endon("bled_out");
	self endon("player_revived");
	self.var_cae7062d = 0;
	self waittill("player_downed");
	for(;;)
	{
		self thread function_ea6a044f();
		while(!self.var_cae7062d)
		{
			self.var_c8d16028 = gameobjects::get_next_obj_id();
			objective_add(self.var_c8d16028, "active", self.origin, istring("t6waypoint_revive" + self.playerNum));
			self.var_cae7062d = 1;
			Objective_OnEntity(self.var_c8d16028, self);
			if(self.reviveTrigger.beingRevived == 1)
			{
				level clientfield::set("player_reviving" + self.playerNum, 1);
				continue;
			}
			level clientfield::set("player_reviving" + self.playerNum, 0);
			Objective_SetVisibleToAll(self.var_c8d16028);
			Objective_SetInvisibleToPlayer(self.var_c8d16028, self);
			wait(0.05);
		}
	}
	return;
}

/*
	Name: function_28217684
	Namespace: namespace_efd7b5f5
	Checksum: 0x140AD10D
	Offset: 0xFA8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_28217684()
{
	self endon("bled_out");
	self endon("disconnect");
	while(isdefined(self))
	{
		if(zm_utility::is_player_valid(self) && isdefined(self getweaponslistprimaries()[2]))
		{
			current_weapon = self GetCurrentWeapon();
			if(current_weapon === self getweaponslistprimaries()[2] && !current_weapon === level.zombie_powerup_weapon["minigun"])
			{
				if(!self clientfield::get_player_uimodel("db.MuleKick") === 1)
				{
					self clientfield::set_player_uimodel("db.MuleKick", 1);
				}
			}
			else if(!self clientfield::get_player_uimodel("db.MuleKick") === 0)
			{
				self clientfield::set_player_uimodel("db.MuleKick", 0);
			}
		}
		else if(!self clientfield::get_player_uimodel("db.MuleKick") === 0)
		{
			self clientfield::set_player_uimodel("db.MuleKick", 0);
		}
		self waittill("weapon_change_complete");
	}
}

/*
	Name: __main__
	Namespace: namespace_efd7b5f5
	Checksum: 0x2EEE5F88
	Offset: 0x1148
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 410
*/
function __main__()
{
	level thread function_bd47cefd();
}

/*
	Name: function_bd47cefd
	Namespace: namespace_efd7b5f5
	Checksum: 0x4781A7C1
	Offset: 0x1170
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 425
*/
function function_bd47cefd()
{
	level.AAT["zm_aat_blast_furnace"].damage_feedback_icon = "hud_t6_aat_blastfurnace_hitmarker";
	level.AAT["zm_aat_dead_wire"].damage_feedback_icon = "hud_t6_aat_deadwire_hitmarker";
	level.AAT["zm_aat_fire_works"].damage_feedback_icon = "hud_t6_aat_fireworks_hitmarker";
	level.AAT["zm_aat_thunder_wall"].damage_feedback_icon = "hud_t6_aat_thunderwall_hitmarker";
	level.AAT["zm_aat_turned"].damage_feedback_icon = "hud_t6_aat_turned_hitmarker";
}

