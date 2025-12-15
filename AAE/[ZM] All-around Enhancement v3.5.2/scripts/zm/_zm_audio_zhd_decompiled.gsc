#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\music_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_52adc03e;

/*
	Name: __init__sytem__
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xDF0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec __init__sytem__()
{
	system::register("zm_audio_zhd", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xE38
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __init__()
{
	level flag::init("snd_zhdegg_activate");
	level flag::init("snd_zhdegg_completed");
	level flag::init("snd_song_completed");
	clientfield::register("scriptmover", "snd_zhdegg", 21000, 2, "int");
	clientfield::register("scriptmover", "snd_zhdegg_arm", 21000, 1, "counter");
	level.var_252a085b = 0;
	level thread function_f9e823ac();
	level thread function_e1e44e18();
	level thread setup_personality_character_exerts();
	zm_spawner::register_zombie_damage_callback(&function_bbf812eb);
}

/*
	Name: __main__
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xF78
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function __main__()
{
	level thread function_9eb315b5();
}

/*
	Name: function_bbf812eb
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0xFA0
	Size: 0x90
	Parameters: 13
	Flags: None
	Line Number: 92
*/
function function_bbf812eb(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	self thread function_3cbc1a2e(player, HIT_LOCATION);
	return 0;
}

/*
	Name: function_3cbc1a2e
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x1038
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 108
*/
function function_3cbc1a2e(player, HIT_LOCATION)
{
	if(isdefined(player) && isdefined(HIT_LOCATION) && (HIT_LOCATION == "left_arm_lower" || HIT_LOCATION == "right_arm_lower" || HIT_LOCATION == "right_hand" || HIT_LOCATION == "left_hand"))
	{
		self notify("hash_3cbc1a2e");
		self endon("hash_3cbc1a2e");
		self endon("death");
		self endon("entityshutdown");
		player notify("hash_3cbc1a2e");
		player endon("hash_3cbc1a2e");
		player endon("death");
		player endon("disconnect");
		player endon("entityshutdown");
		util::wait_network_frame(1);
		if(isdefined(self.gibbed) && self.gibbed)
		{
			if(isalive(self))
			{
				if(isdefined(self.gib_state))
				{
					if(self.gib_state == 16 || self.gib_state == 32)
					{
						player zm_audio::create_and_play_dialog("general", "shoot_arm");
					}
				}
			}
		}
	}
}

/*
	Name: function_9eb315b5
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x11B0
	Size: 0xD08
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function function_9eb315b5()
{
	level flag::wait_till("start_zombie_round_logic");
	zm_audio::zmbVoxAdd("eggs", "achievement", "achievement", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "music_activate", "secret", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "meteors", "egg_pedastool", 100, 0);
	zm_audio::zmbVoxAdd("bgb", "eat", "bgb_eat", 100, 0);
	zm_audio::zmbVoxAdd("bgb", "buy", "bgb_buy", 100, 0);
	zm_audio::zmbVoxAdd("box_pickup", "hero_annihilator", "annihilator_get", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "hero_annihilator", "annihilator_get", 100, 0);
	zm_audio::zmbVoxAdd("kill", "annihilator", "annihilator_kill", 40, 0);
	if(level.script == "zm_tomb")
	{
		zm_audio::zmbVoxAdd("general", "pap_wait", "pap_arm", 100, 0);
		return;
	}
	zm_audio::zmbVoxAdd("general", "crawl_spawn", "spawn_crawl", 100, 1);
	zm_audio::zmbVoxAdd("general", "dog_spawn", "spawn_dog", 100, 0);
	zm_audio::zmbVoxAdd("general", "quad_spawn", "spawn_quad", 100, 0);
	zm_audio::zmbVoxAdd("general", "intro", "level_start", 100, 0);
	zm_audio::zmbVoxAdd("general", "shoot_arm", "shoot_limb", 100, 0);
	zm_audio::zmbVoxAdd("general", "box_move", "box_move", 100, 0);
	zm_audio::zmbVoxAdd("general", "revive_down", "revive_down", 100, 0);
	zm_audio::zmbVoxAdd("general", "revive_up", "revive_up", 100, 0);
	zm_audio::zmbVoxAdd("general", "crawl_hit", "crawl_hit", 100, 0);
	zm_audio::zmbVoxAdd("kill", "quad", "kill_quad", 100, 0);
	zm_audio::zmbVoxAdd("kill", "hellhound", "kill_hellhound", 100, 0);
	zm_audio::zmbVoxAdd("kill", "crawler", "kill_crawler", 100, 0);
	zm_audio::zmbVoxAdd("kill", "thundergun", "kill_thunder", 100, 0);
	zm_audio::zmbVoxAdd("kill", "monkey", "kill_monkey", 100, 0);
	zm_audio::zmbVoxAdd("kill", "tesla", "kill_tesla", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest1", "quest_step1", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest2", "quest_step2", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest3", "quest_step3", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest4", "quest_step4", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest5", "quest_step5", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest6", "quest_step6", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest7", "quest_step7", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "quest8", "quest_step8", 100, 0);
	zm_audio::zmbVoxAdd("eggs", "rod", "rod", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_staminup", "perk_stamin", 100, 0);
	if(level.script == "zm_cosmodrome")
	{
		zm_audio::zmbVoxAdd("perk", "specialty_widowswine", "perk_boomjuice", 100, 0);
		zm_audio::zmbVoxAdd("perk", "specialty_additionalprimaryweapon", "perk_tufbrew", 100, 0);
		zm_audio::zmbVoxAdd("perk", "specialty_deadshot", "moon_perk_deadshot", 100, 0);
		zm_audio::zmbVoxAdd("perk", "steal_specialty_armorvest", "perk_steal_jugga", 100, 0);
		zm_audio::zmbVoxAdd("perk", "steal_specialty_quickrevive", "perk_steal_revive", 100, 0);
		zm_audio::zmbVoxAdd("perk", "steal_specialty_fastreload", "perk_steal_speed", 100, 0);
		zm_audio::zmbVoxAdd("perk", "steal_specialty_staminup", "perk_steal_stamin", 100, 0);
		zm_audio::zmbVoxAdd("perk", "steal_specialty_widowswine", "perk_steal_prone", 100, 0);
		zm_audio::zmbVoxAdd("perk", "steal_specialty_additionalprimaryweapon", "perk_steal_prone", 100, 0);
		zm_audio::zmbVoxAdd("box_pickup", "sickle", "wpck_sickle", 100, 0);
		zm_audio::zmbVoxAdd("weapon_pickup", "sickle", "wpck_sickle", 100, 0);
	}
	else
	{
		zm_audio::zmbVoxAdd("perk", "specialty_widowswine", "perk_phdflopper", 100, 0);
		zm_audio::zmbVoxAdd("perk", "specialty_additionalprimaryweapon", "perk_arsenal", 100, 0);
	}
	if(level.script == "zm_asylum" || level.script == "zm_sumpf" || level.script == "zm_theater")
	{
		zm_audio::zmbVoxAdd("perk", "specialty_additionalprimaryweapon", "moon_perk_arsenal", 100, 0);
		zm_audio::zmbVoxAdd("perk", "specialty_staminup", "moon_perk_stamin", 100, 0);
		zm_audio::zmbVoxAdd("perk", "specialty_deadshot", "moon_perk_deadshot", 100, 0);
		zm_audio::zmbVoxAdd("perk", "specialty_widowswine", "moon_perk_phdflopper", 100, 0);
	}
	if(level.script == "zm_temple")
	{
		zm_audio::zmbVoxAdd("perk", "specialty_additionalprimaryweapon", "moon_perk_arsenal", 100, 0);
	}
	zm_audio::zmbVoxAdd("box_pickup", "favorite", "wpck_favorite", 100, 0);
	zm_audio::zmbVoxAdd("box_pickup", "favorite_upgrade", "wpck_favorite_upgrade", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "favorite", "wpck_favorite", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "favorite_upgrade", "wpck_favorite_upgrade", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "crappy", "wpck_crappy", 100, 0);
	zm_audio::zmbVoxAdd("box_pickup", "crappy", "wpck_crappy", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "microwavegun", "wpck_microwave", 100, 0);
	zm_audio::zmbVoxAdd("box_pickup", "microwavegun", "wpck_microwave", 100, 0);
	zm_audio::zmbVoxAdd("general", "pap_wait", "wpck_upgrade_wait", 100, 0);
	level._audio_custom_weapon_check = &weapon_type_check_custom;
	zm_audio::zmbVoxAdd("box_pickup", "pistol", "wpck_crappy", 100, 0);
	zm_audio::zmbVoxAdd("weapon_pickup", "pistol", "wpck_crappy", 100, 0);
	level.zombie_weapons[GetWeapon("sickle_knife")].vox = "sickle";
	level.zombie_weapons[GetWeapon("ray_gun")].vox = "raygun";
	level.zombie_weapons[GetWeapon("raygun_mark2")].vox = "raygun";
}

/*
	Name: weapon_type_check_custom
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x1EC0
	Size: 0x370
	Parameters: 2
	Flags: None
	Line Number: 246
*/
function weapon_type_check_custom(weapon, magic_box)
{
	index = self.characterindex;
	if(isdefined(self.isSamantha) && self.isSamantha)
	{
		index = 4;
	}
	switch(self.characterindex)
	{
		case 0:
		{
			if(weapon == GetWeapon("ar_m16"))
			{
				return "favorite";
			}
			if(weapon == GetWeapon("ar_m16_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 1:
		{
			if(weapon == GetWeapon("ar_marksman"))
			{
				return "favorite";
			}
			if(weapon == GetWeapon("lmg_rpk_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 2:
		{
			if(weapon == GetWeapon("smg_standard"))
			{
				return "favorite";
			}
			if(weapon == GetWeapon("sniper_fastsemi_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 3:
		{
			if(weapon == GetWeapon("smg_ak74u"))
			{
				return "favorite";
			}
			if(weapon == GetWeapon("ar_m14_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
		case 4:
		{
			if(weapon == GetWeapon("shotgun_fullauto"))
			{
				return "favorite";
			}
			if(weapon == GetWeapon("smg_versatile_upgraded"))
			{
				return "favorite_upgrade";
				break;
			}
		}
	}
	if(weapon.isDualWield && !zm_weapons::is_wonder_weapon(weapon))
	{
		return "dualwield";
	}
	if(IsSubStr(weapon.name, "upgraded"))
	{
		if(zm_weapons::is_wonder_weapon(weapon))
		{
			weapon = zm_weapons::get_base_weapon(weapon);
			if(isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].vox))
			{
				return level.zombie_weapons[weapon].vox;
			}
		}
		return "upgrade";
	}
	else if(isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].vox))
	{
		return level.zombie_weapons[weapon].vox;
	}
	return "crappy";
}

/*
	Name: function_f9e823ac
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x2238
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function function_f9e823ac()
{
	level flag::wait_till("snd_zhdegg_activate");
	level function_513f51e1();
	while(1)
	{
		if(isdefined(level.var_61f315ab))
		{
			success = [[level.var_61f315ab]]();
		}
		else
		{
			success = level function_cf1b154();
		}
		if(!(isdefined(success) && success))
		{
			level function_513f51e1(1);
			continue;
		}
		if(isdefined(level.var_8229c449))
		{
			level [[level.var_8229c449]]();
		}
		else
		{
			level function_5b2770da();
			break;
		}
	}
	level thread zm_audio::sndmusicsystem_playstate("sam");
}

/*
	Name: function_513f51e1
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x2358
	Size: 0x248
	Parameters: 1
	Flags: None
	Line Number: 391
*/
function function_513f51e1(restart)
{
	if(!isdefined(restart))
	{
		restart = 0;
	}
	var_6175d76c = struct::get("s_ballerina_start", "targetname");
	if(!isdefined(var_6175d76c))
	{
		return;
	}
	if(!(isdefined(restart) && restart))
	{
		playsoundatposition("zmb_sam_egg_success", (0, 0, 0));
		mdl_ballerina = util::spawn_model(var_6175d76c.model, var_6175d76c.origin - VectorScale((0, 0, 1), 20), var_6175d76c.angles);
		mdl_ballerina clientfield::set("snd_zhdegg", 2);
		mdl_ballerina moveto(var_6175d76c.origin, 2);
		mdl_ballerina waittill("movedone");
	}
	else
	{
		playsoundatposition("zmb_sam_egg_fail", (0, 0, 0));
		mdl_ballerina = util::spawn_model(var_6175d76c.model, var_6175d76c.origin, var_6175d76c.angles);
		mdl_ballerina clientfield::set("snd_zhdegg", 1);
	}
	var_6175d76c zm_unitrigger::create_unitrigger(undefined, 80);
	var_6175d76c waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_6175d76c.s_unitrigger);
	mdl_ballerina clientfield::set("snd_zhdegg", 0);
	util::wait_network_frame();
	mdl_ballerina delete();
}

/*
	Name: function_cf1b154
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x25A8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 434
*/
function function_cf1b154()
{
	var_d1f154fd = struct::get_array("s_ballerina_timed", "targetname");
	var_d1f154fd = Array::randomize(var_d1f154fd);
	if(isdefined(var_d1f154fd[0].script_int))
	{
		var_d1f154fd = Array::sort_by_script_int(var_d1f154fd, 1);
	}
	n_amount = var_d1f154fd.size;
	if(n_amount >= 5)
	{
		n_amount = 5;
	}
	for(i = 0; i < n_amount; i++)
	{
		success = var_d1f154fd[i] function_3cf3ba48();
		if(!(isdefined(success) && success))
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_3cf3ba48
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x26C8
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 468
*/
function function_3cf3ba48()
{
	self.mdl_ballerina = util::spawn_model(self.model, self.origin, self.angles);
	self.mdl_ballerina clientfield::set("snd_zhdegg", 1);
	self.mdl_ballerina PlayLoopSound("mus_musicbox_lp", 2);
	self.success = 0;
	self thread function_9d55fd08();
	self thread function_2fdaabf3();
	self thread function_a9a34039();
	/#
		self.mdl_ballerina thread zm_utility::print3d_ent("Dev Block strings are not supported", (0, 1, 0), 3, VectorScale((0, 0, 1), 24));
	#/
	self util::waittill_any("ballerina_destroyed", "ballerina_timeout");
	/#
		self.mdl_ballerina notify("end_print3d");
	#/
	self.mdl_ballerina clientfield::set("snd_zhdegg", 0);
	util::wait_network_frame();
	self.mdl_ballerina delete();
	return self.success;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9d55fd08
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x2870
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 501
*/
function function_9d55fd08()
{
	self.mdl_ballerina endon("death");
	self endon("hash_636d801f");
	self endon("hash_72624b2b");
	self endon("hash_874b5073");
	while(1)
	{
		self.mdl_ballerina RotateYaw(360, 4);
		wait(4);
	}
}

/*
	Name: function_2fdaabf3
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x28E0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 524
*/
function function_2fdaabf3()
{
	self endon("hash_874b5073");
	self.mdl_ballerina setcandamage(1);
	self.mdl_ballerina.health = 1000000;
	while(1)
	{
		self.mdl_ballerina waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(isdefined(level.var_252a085b) && level.var_252a085b)
		{
			continue;
		}
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		if(type == "MOD_PROJECTILE" || type == "MOD_GRENADE_SPLASH" || type == "MOD_GRENADE" || type == "MOD_EXPLOSIVE")
		{
			continue;
		}
		self.success = 1;
		self notify("hash_72624b2b");
		level.var_252a085b = 1;
		wait(0.1);
		level.var_252a085b = 0;
		break;
	}
}

/*
	Name: function_a9a34039
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x2A90
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 563
*/
function function_a9a34039()
{
	self endon("hash_72624b2b");
	if(level.players.size > 1)
	{
		wait(90 - 15 * level.players.size);
	}
	else
	{
		wait(90);
	}
	self notify("hash_874b5073");
}

/*
	Name: function_5b2770da
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x2AF0
	Size: 0x548
	Parameters: 0
	Flags: None
	Line Number: 587
*/
function function_5b2770da()
{
	playsoundatposition("zmb_sam_egg_success", (0, 0, 0));
	var_2ba18547 = struct::get("s_ballerina_end", "targetname");
	var_2ba18547.mdl_ballerina = util::spawn_model(var_2ba18547.model, var_2ba18547.origin, var_2ba18547.angles);
	var_2ba18547.mdl_ballerina clientfield::set("snd_zhdegg", 1);
	var_2ba18547.mdl_ballerina PlayLoopSound("mus_musicbox_lp", 2);
	var_2ba18547 thread function_9d55fd08();
	var_2ba18547 zm_unitrigger::create_unitrigger(undefined, 65);
	var_2ba18547 waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_2ba18547.s_unitrigger);
	var_2ba18547 notify("hash_636d801f");
	var_2ba18547.mdl_ballerina StopLoopSound(0.5);
	var_2ba18547.mdl_ballerina playsound("zmb_challenge_skel_arm_up");
	var_f6c28cea = (2, 0, -6.5);
	var_e97ebb83 = (3.5, 0, -18.5);
	var_2ba18547.mdl_hand = util::spawn_model("c_zom_dlc1_skeleton_zombie_body_s_rarm", var_2ba18547.origin, var_2ba18547.angles);
	var_2ba18547.var_2a9b65c7 = util::spawn_model("p7_skulls_bones_arm_lower", var_2ba18547.origin + var_f6c28cea, VectorScale((1, 0, 0), 180));
	var_2ba18547.var_79dc7980 = util::spawn_model("p7_skulls_bones_arm_lower", var_2ba18547.origin + var_e97ebb83, VectorScale((1, 0, 0), 180));
	var_2ba18547.mdl_ballerina MoveZ(20, 0.5);
	var_2ba18547.mdl_hand MoveZ(20, 0.5);
	var_2ba18547.var_2a9b65c7 MoveZ(20, 0.5);
	var_2ba18547.var_79dc7980 MoveZ(20, 0.5);
	wait(0.05);
	var_2ba18547.mdl_hand clientfield::increment("snd_zhdegg_arm");
	var_2ba18547.mdl_hand waittill("movedone");
	wait(1);
	var_2ba18547.mdl_ballerina PlayLoopSound("zmb_challenge_skel_arm_lp", 0.25);
	var_2ba18547.mdl_ballerina MoveZ(-40, 1.5);
	var_2ba18547.mdl_hand MoveZ(-40, 1.5);
	var_2ba18547.var_2a9b65c7 MoveZ(-40, 1.5);
	var_2ba18547.var_79dc7980 MoveZ(-40, 1.5);
	var_2ba18547.mdl_ballerina waittill("movedone");
	zm_powerups::specific_powerup_drop("full_ammo", var_2ba18547.origin);
	var_2ba18547.mdl_ballerina delete();
	var_2ba18547.mdl_hand delete();
	var_2ba18547.var_2a9b65c7 delete();
	var_2ba18547.var_79dc7980 delete();
	level flag::set("snd_zhdegg_completed");
}

/*
	Name: function_e753d4f
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x3040
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 638
*/
function function_e753d4f()
{
	level.var_2a0600f = 0;
	var_8bd44282 = struct::get_array("songstructs", "targetname");
	Array::thread_all(var_8bd44282, &function_929c4dba);
	while(1)
	{
		level waittill("hash_9b53c751");
		if(level.var_2a0600f == var_8bd44282.size)
		{
			break;
		}
	}
	if(isdefined(level.var_bcbf4333))
	{
		level.var_bcbf4333 zm_audio::create_and_play_dialog("eggs", "music_activate");
	}
	level flag::set("snd_song_completed");
	return;
}

/*
	Name: function_929c4dba
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x3138
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 669
*/
function function_929c4dba()
{
	e_origin = spawn("script_origin", self.origin);
	e_origin zm_unitrigger::create_unitrigger();
	e_origin PlayLoopSound("zmb_ee_mus_lp", 1);
	/#
		e_origin thread zm_utility::print3d_ent("Dev Block strings are not supported", (1, 1, 0), 3, VectorScale((0, 0, 1), 24));
	#/
	while(!(isdefined(e_origin.b_activated) && e_origin.b_activated))
	{
		e_origin waittill("trigger_activated", who);
		if(!function_8090042c())
		{
			continue;
		}
		who notify("hash_9b53c751");
		e_origin function_bd90259b(who);
	}
	/#
		e_origin notify("end_print3d");
	#/
	zm_unitrigger::unregister_unitrigger(e_origin.s_unitrigger);
	e_origin delete();
	return;
}

/*
	Name: function_8090042c
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x32B0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 705
*/
function function_8090042c()
{
	if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_bd90259b
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x3308
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 724
*/
function function_bd90259b(e_player)
{
	if(!(isdefined(self.b_activated) && self.b_activated))
	{
		self.b_activated = 1;
		level.var_2a0600f++;
		level.var_bcbf4333 = e_player;
		level notify("hash_9b53c751", e_player);
		self StopLoopSound(0.2);
	}
	self playsound("zmb_ee_mus_activate");
}

/*
	Name: function_e1e44e18
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x33A8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 747
*/
function function_e1e44e18()
{
	level waittill("connected", player);
	var_77754758 = struct::get("snd_monty_radio", "targetname");
	if(!isdefined(var_77754758))
	{
		return;
	}
	var_77754758 zm_unitrigger::create_unitrigger();
	var_77754758 waittill("trigger_activated");
	playsoundatposition("vox_abcd_radio", var_77754758.origin);
	thread namespace_cc012897::Send("vox_abcd_radio");
	zm_unitrigger::unregister_unitrigger(var_77754758.s_unitrigger);
	return;
}

/*
	Name: setup_personality_character_exerts
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x3490
	Size: 0x628
	Parameters: 0
	Flags: None
	Line Number: 773
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1]["hitmed"][0] = "vox_plr_0_exert_pain_0";
	level.exert_sounds[1]["hitmed"][1] = "vox_plr_0_exert_pain_1";
	level.exert_sounds[1]["hitmed"][2] = "vox_plr_0_exert_pain_2";
	level.exert_sounds[1]["hitmed"][3] = "vox_plr_0_exert_pain_3";
	level.exert_sounds[1]["hitmed"][4] = "vox_plr_0_exert_pain_4";
	level.exert_sounds[2]["hitmed"][0] = "vox_plr_1_exert_pain_0";
	level.exert_sounds[2]["hitmed"][1] = "vox_plr_1_exert_pain_1";
	level.exert_sounds[2]["hitmed"][2] = "vox_plr_1_exert_pain_2";
	level.exert_sounds[2]["hitmed"][3] = "vox_plr_1_exert_pain_3";
	level.exert_sounds[2]["hitmed"][4] = "vox_plr_1_exert_pain_4";
	level.exert_sounds[3]["hitmed"][0] = "vox_plr_2_exert_pain_0";
	level.exert_sounds[3]["hitmed"][1] = "vox_plr_2_exert_pain_1";
	level.exert_sounds[3]["hitmed"][2] = "vox_plr_2_exert_pain_2";
	level.exert_sounds[3]["hitmed"][3] = "vox_plr_2_exert_pain_3";
	level.exert_sounds[3]["hitmed"][4] = "vox_plr_2_exert_pain_4";
	level.exert_sounds[4]["hitmed"][0] = "vox_plr_3_exert_pain_0";
	level.exert_sounds[4]["hitmed"][1] = "vox_plr_3_exert_pain_1";
	level.exert_sounds[4]["hitmed"][2] = "vox_plr_3_exert_pain_2";
	level.exert_sounds[4]["hitmed"][3] = "vox_plr_3_exert_pain_3";
	level.exert_sounds[4]["hitmed"][3] = "vox_plr_3_exert_pain_4";
	level.exert_sounds[1]["hitlrg"][0] = "vox_plr_0_exert_pain_0";
	level.exert_sounds[1]["hitlrg"][1] = "vox_plr_0_exert_pain_1";
	level.exert_sounds[1]["hitlrg"][2] = "vox_plr_0_exert_pain_2";
	level.exert_sounds[1]["hitlrg"][3] = "vox_plr_0_exert_pain_3";
	level.exert_sounds[1]["hitlrg"][4] = "vox_plr_0_exert_pain_4";
	level.exert_sounds[2]["hitlrg"][0] = "vox_plr_1_exert_pain_0";
	level.exert_sounds[2]["hitlrg"][1] = "vox_plr_1_exert_pain_1";
	level.exert_sounds[2]["hitlrg"][2] = "vox_plr_1_exert_pain_2";
	level.exert_sounds[2]["hitlrg"][3] = "vox_plr_1_exert_pain_3";
	level.exert_sounds[2]["hitlrg"][4] = "vox_plr_1_exert_pain_4";
	level.exert_sounds[3]["hitlrg"][0] = "vox_plr_2_exert_pain_0";
	level.exert_sounds[3]["hitlrg"][1] = "vox_plr_2_exert_pain_1";
	level.exert_sounds[3]["hitlrg"][2] = "vox_plr_2_exert_pain_2";
	level.exert_sounds[3]["hitlrg"][3] = "vox_plr_2_exert_pain_3";
	level.exert_sounds[3]["hitlrg"][4] = "vox_plr_2_exert_pain_4";
	level.exert_sounds[4]["hitlrg"][0] = "vox_plr_3_exert_pain_0";
	level.exert_sounds[4]["hitlrg"][1] = "vox_plr_3_exert_pain_1";
	level.exert_sounds[4]["hitlrg"][2] = "vox_plr_3_exert_pain_2";
	level.exert_sounds[4]["hitlrg"][3] = "vox_plr_3_exert_pain_3";
	level.exert_sounds[4]["hitlrg"][4] = "vox_plr_3_exert_pain_4";
}

/*
	Name: set_exert_id
	Namespace: namespace_52adc03e
	Checksum: 0x424F4353
	Offset: 0x3AC0
	Size: 0x54
	Parameters: 0
	Flags: None
	Line Number: 827
*/
function set_exert_id()
{
	self endon("disconnect");
	util::wait_network_frame();
	util::wait_network_frame();
	self zm_audio::SetExertVoice(self.characterindex + 1);
}

