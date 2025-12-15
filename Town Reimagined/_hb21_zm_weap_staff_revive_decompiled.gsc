#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_bacf4821;

/*
	Name: __init__sytem__
	Namespace: namespace_bacf4821
	Checksum: 0x693EF350
	Offset: 0x470
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 42
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_revive", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_bacf4821
	Checksum: 0x275609AA
	Offset: 0x4B0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 57
*/
function __init__()
{
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: namespace_bacf4821
	Checksum: 0x834A10DB
	Offset: 0x4E0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 72
*/
function on_player_spawned()
{
	self thread function_56ef2a16();
}

/*
	Name: function_56ef2a16
	Namespace: namespace_bacf4821
	Checksum: 0xD4D4C623
	Offset: 0x508
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_56ef2a16()
{
	self notify("watch_staff_revive_fired");
	self endon("disconnect");
	self endon("watch_staff_revive_fired");
	while(1)
	{
		self waittill("hash_8118687e", e_projectile, str_weapon, var_16f4cf62);
		e_projectile thread staff_revive_impact(self);
	}
}

/*
	Name: staff_revive_impact
	Namespace: namespace_bacf4821
	Checksum: 0xD9260FC8
	Offset: 0x590
	Size: 0x214
	Parameters: 1
	Flags: None
	Line Number: 109
*/
function staff_revive_impact(player)
{
	player endon("disconnect");
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	v_explode_point = self.origin;
	playFX("harry/staff/revive/fx_staff_revive_impact", v_explode_point);
	self namespace_951345fe::function_880d6c62();
	e_closest_player = undefined;
	n_closest_dist_sq = 1024;
	a_e_players = GetPlayers();
	_a70 = a_e_players;
	for(_k70 = getFirstArrayKey(_a70); isdefined(_k70); _k70 = getFirstArrayKey(_a70))
	{
		e_player = _a70[_k70];
		if(e_player == player || !e_player laststand::player_is_in_laststand())
		{
			continue;
		}
		n_dist_sq = DistanceSquared(v_explode_point, e_player.origin);
		if(n_dist_sq < n_closest_dist_sq)
		{
			e_closest_player = e_player;
		}
	}
	if(isdefined(e_closest_player))
	{
		e_closest_player notify("remote_revive", player, getNextArrayKey(_a70, _k70));
		e_closest_player playsoundtoplayer("wpn_revivestaff_revive_plr", e_player);
		player notify("revived_player_with_upgraded_staff");
	}
}

