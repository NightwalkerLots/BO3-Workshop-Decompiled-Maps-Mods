#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_3f9af9c2;

/*
	Name: __init__sytem__
	Namespace: namespace_3f9af9c2
	Checksum: 0x869628E1
	Offset: 0x518
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec __init__sytem__()
{
	system::register("zm_aat_aethercollapse", &__init__, undefined, "aat");
}

/*
	Name: __init__
	Namespace: namespace_3f9af9c2
	Checksum: 0x6BA294B7
	Offset: 0x558
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function __init__()
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	AAT::register("zm_aat_aethercollapse", 0.1, 0, 25, 10, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr");
	clientfield::register("actor", "zm_aat_aethercollapse" + "_zap", 1, 1, "int");
	clientfield::register("vehicle", "zm_aat_aethercollapse" + "_zap_vehicle", 1, 1, "int");
	return;
	++;
}

/*
	Name: result
	Namespace: namespace_3f9af9c2
	Checksum: 0x7F9BB864
	Offset: 0x638
	Size: 0x40
	Parameters: 4
	Flags: None
	Line Number: 66
*/
function result(death, attacker, mod, weapon)
{
	self thread function_f0205101(attacker);
}

/*
	Name: function_f0205101
	Namespace: namespace_3f9af9c2
	Checksum: 0x94BA7300
	Offset: 0x680
	Size: 0x240
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function function_f0205101(attacker)
{
	var_fe14235d = self.origin + VectorScale((0, 0, 1), 30);
	zombies = Array::get_all_closest(var_fe14235d, GetAITeamArray("axis"), undefined, undefined, 200);
	if(!isdefined(zombies))
	{
		return;
	}
	namespace_f56b53f0::function_dbe7e78b("^3[^6Aether Collapse^3] ^7Activation (Zombie Count: " + zombies.size + " )");
	attacker.var_aa46a520 = 1;
	thread function_317ddddd(var_fe14235d, attacker);
	foreach(zombie in zombies)
	{
		if(!namespace_f56b53f0::function_1e0087c4("zm_aat_aethercollapse") || isdefined(zombie.var_aa46a520) || isdefined(zombie.var_ca05bb90))
		{
			continue;
		}
		wait(0.05 * randomIntRange(1, 3));
		zombie.var_aa46a520 = 1;
		zombie.allowdeath = 0;
		zombie.allowPain = 0;
		zombie.no_gib = 1;
		zombie thread function_8612f4f1(attacker, var_fe14235d);
	}
	wait(zombies.size * 0.15 * 2);
	attacker.var_aa46a520 = 0;
}

/*
	Name: function_8612f4f1
	Namespace: namespace_3f9af9c2
	Checksum: 0x2E9F278A
	Offset: 0x8C8
	Size: 0x318
	Parameters: 2
	Flags: None
	Line Number: 119
*/
function function_8612f4f1(attacker, var_fe14235d)
{
	self SetPlayerCollision(0);
	var_45fe395d = self GetTagOrigin("j_head");
	var_c3c01489 = util::spawn_model("tag_origin", var_45fe395d, (0, 0, 0));
	trail_effect = PlayFXOnTag("vk_fx/wpn/_zm_wpn_aethercollapse_blackhole_trail", var_c3c01489, "tag_origin");
	var_c3c01489 LinkTo(self, "j_head");
	move_time = randomIntRange(100, 200) / 100;
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		self thread scene::Play("cin_zm_dlc1_zombie_crawler_talonspike_a_loop", self);
		continue;
	}
	self thread scene::Play("cin_zm_dlc1_zombie_talonspike_loop", self);
	self.var_c2fb106c = util::spawn_model("tag_origin", self.origin, self.angles);
	self LinkTo(self.var_c2fb106c, "tag_origin");
	self.var_c2fb106c moveto(var_fe14235d, move_time, 0.5, 0.2);
	wait(move_time);
	self scene::stop();
	self.allowdeath = 1;
	self.allowPain = 0;
	self DoDamage(self.health + 666, self.origin, attacker, attacker, "none", "MOD_IMPACT");
	if(isdefined(attacker) && isPlayer(attacker))
	{
		attacker zm_stats::increment_challenge_stat("VK_STATS_AAT_AETHERCOLLAPSE_KILLS");
	}
	thread function_43b21f4e(var_fe14235d, attacker);
	trail_effect delete();
	var_c3c01489 delete();
	wait(0.05);
	self.var_c2fb106c delete();
	self delete();
}

/*
	Name: function_317ddddd
	Namespace: namespace_3f9af9c2
	Checksum: 0x68C35218
	Offset: 0xBE8
	Size: 0x2D8
	Parameters: 2
	Flags: None
	Line Number: 163
*/
function function_317ddddd(var_fe14235d, attacker)
{
	var_94249ccd = 0;
	wait(0.05);
	fx_model = util::spawn_model("tag_origin", var_fe14235d, (0, 0, 0));
	var_59e6077d = PlayFXOnTag("dlc5/cosmo/fx_zmb_blackhole_exit", fx_model, "tag_origin");
	while(!isdefined(fx_model) && var_94249ccd < 5)
	{
		wait(0.05);
		fx_model = util::spawn_model("tag_origin", var_fe14235d, (0, 0, 0));
		var_59e6077d = PlayFXOnTag("dlc5/cosmo/fx_zmb_blackhole_exit", fx_model, "tag_origin");
		var_94249ccd++;
	}
	thread function_3a25438c(var_fe14235d, attacker);
	playsoundatposition("vk_tra_zm_aat_aethercollapse_activate", var_fe14235d + VectorScale((0, 0, 1), 60));
	Earthquake(0.4, 1, var_fe14235d + VectorScale((0, 0, 1), 60), 700);
	fx_model thread sound::loop_on_entity("vk_tra_zm_aat_aethercollapse_ambience_active");
	fx_model thread sound::loop_on_entity("vk_tra_zm_aat_aethercollapse_ambience_deep");
	fx_model thread sound::loop_on_entity("vk_tra_zm_aat_aethercollapse_ambience_lfe");
	while(isdefined(attacker.var_aa46a520) && attacker.var_aa46a520)
	{
		wait(0.1);
	}
	playsoundatposition("vk_tra_zm_aat_aethercollapse_deactivate", var_fe14235d + VectorScale((0, 0, 1), 60));
	fx_model thread sound::stop_loop_on_entity("vk_tra_zm_aat_aethercollapse_ambience_active");
	fx_model thread sound::stop_loop_on_entity("vk_tra_zm_aat_aethercollapse_ambience_deep");
	fx_model thread sound::stop_loop_on_entity("vk_tra_zm_aat_aethercollapse_ambience_lfe");
	var_59e6077d delete();
	fx_model delete();
	return;
}

/*
	Name: function_3a25438c
	Namespace: namespace_3f9af9c2
	Checksum: 0x4A832A2E
	Offset: 0xEC8
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 205
*/
function function_3a25438c(var_fe14235d, attacker)
{
	scale = 0.3;
	duration = 0.1;
	radius = 500;
	while(isdefined(attacker.var_aa46a520) && attacker.var_aa46a520)
	{
		wait(duration);
		Earthquake(scale, duration, var_fe14235d, radius);
	}
}

/*
	Name: function_43b21f4e
	Namespace: namespace_3f9af9c2
	Checksum: 0xC2910F7B
	Offset: 0xF70
	Size: 0x174
	Parameters: 2
	Flags: None
	Line Number: 227
*/
function function_43b21f4e(var_fe14235d, attacker)
{
	fx_origin = var_fe14235d + VectorScale((0, 0, 1), 60);
	fx_angles = (0, 0, 0);
	if(isdefined(attacker) && isPlayer(attacker))
	{
		fx_angles = AnglesToForward(attacker getPlayerAngles());
	}
	fx_model = util::spawn_model("tag_origin", fx_origin, fx_angles);
	var_59e6077d = PlayFXOnTag("vk_fx/wpn/_zm_wpn_aethercollapse_blackhole_explosion", fx_model, "tag_origin");
	playsoundatposition("vk_tra_zm_aat_aethercollapse_suck", fx_origin);
	Earthquake(0.3, 0.5, fx_origin, 500);
	wait(3);
	var_59e6077d delete();
	wait(0.05);
	fx_model delete();
}

