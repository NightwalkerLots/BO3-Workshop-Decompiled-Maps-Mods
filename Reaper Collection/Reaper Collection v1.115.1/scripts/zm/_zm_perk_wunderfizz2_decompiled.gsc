#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_2696077a;

/*
	Name: __init__sytem__
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 36
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_wunderfizz2", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x9C8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 51
*/
function __init__()
{
	level thread function_c2967418();
	return;
}

/*
	Name: function_c2967418
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x9F0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 67
*/
function function_c2967418()
{
	level.var_28a6a3b8 = 2000;
	level.var_5875fdec = 10;
	var_100683c7 = struct::get_array("madgaz_wunderfizz", "script_noteworthy");
	if(isdefined(var_100683c7) && var_100683c7.size > 0)
	{
		for(i = 0; i < var_100683c7.size; i++)
		{
			var_100683c7[i] function_36a40704();
		}
	}
}

/*
	Name: function_36a40704
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0xAA0
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function function_36a40704()
{
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 30), 0, 40, 80);
	trigger.script_noteworthy = "madgaz_wunderfizz_trigger";
	trigger.active = 0;
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString(&"ZOMBIE_NEED_POWER");
	machine = spawn("script_model", self.origin);
	machine.angles = self.angles;
	machine SetModel("madgaz_wunderfizz");
	machine.target = self.target;
	self.collision = spawn("script_model", self.origin, 1);
	self.collision.angles = self.angles;
	self.collision SetModel("zm_collision_perks1");
	self.collision.script_noteworthy = "clip";
	self.collision disconnectpaths();
	trigger.machine = machine;
	trigger thread function_9c110491();
	return;
}

/*
	Name: function_9c110491
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x540
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_9c110491()
{
	self endon("delete");
	wait(0.05);
	level flag::wait_till("power_on");
	self.machine SetModel("madgaz_wunderfizz_on");
	self setHintString("Press & hold ^3&&1^7 to buy Wunderfizz 2.0 [Cost: " + level.var_28a6a3b8 + "]");
	light_fx = spawn("script_model", self.machine.origin);
	light_fx SetModel("tag_origin");
	light_fx.angles = self.machine.angles - (0, 0, 0);
	PlayFXOnTag("madgaz/wunderfizz_2/fx_perk_madgaz_wunderfizz_light", light_fx, "tag_origin");
	PlayFXOnTag("zombie/fx_perk_mule_kick_zmb", light_fx, "tag_origin");
	while(1)
	{
		perk = undefined;
		self waittill("trigger", player);
		if(!player zm_score::can_player_purchase(level.var_28a6a3b8))
		{
			self playsound("evt_perk_deny");
			player zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		PERKS = player function_f24febdc();
		if(!player zm_utility::can_player_purchase_perk() || !isdefined(PERKS) || PERKS.size < 1)
		{
			self playsound("evt_perk_deny");
			player zm_audio::create_and_play_dialog("general", "sigh");
			continue;
		}
		sound = "evt_bottle_dispense";
		playsoundatposition(sound, self.origin);
		player zm_score::minus_to_player_score(level.var_28a6a3b8);
		self setHintString("");
		struct = struct::get(self.machine.target, "targetname");
		fx_obj = spawn("script_model", struct.origin);
		fx_obj SetModel("tag_origin");
		fx_obj.angles = struct.angles - VectorScale((0, 1, 0), 90);
		PlayFXOnTag("madgaz/wunderfizz_2/fx_perk_madgaz_wunderfizz_in_use", fx_obj, "tag_origin");
		perk = self function_c0d3aa68(player);
		self setHintString("Press & hold ^3&&1^7 to take " + function_19155db3(perk.perk));
		self thread function_eac9b5fd();
		self thread function_960646d5(player, perk.perk);
		self util::waittill_either("fizz_timeout", "fizz_taken");
		self setHintString("");
		playFX("madgaz/wunderfizz_2/fx_perk_madgaz_wunderfizz_finish", struct.origin);
		perk notify("hash_c472c420");
		perk delete();
		fx_obj delete();
		wait(2);
		self setHintString("Press & hold ^3&&1^7 to buy Wunderfizz 2.0 [Cost: " + level.var_28a6a3b8 + "]");
	}
}

/*
	Name: function_eac9b5fd
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 189
*/
function function_eac9b5fd()
{
	self endon("hash_854e00c6");
	self endon("hash_a3af02c2");
	wait(15);
	self notify("hash_854e00c6");
}

/*
	Name: function_960646d5
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x1270
	Size: 0x1A0
	Parameters: 2
	Flags: None
	Line Number: 207
*/
function function_960646d5(player, perk)
{
	self endon("hash_854e00c6");
	while(1)
	{
		self waittill("trigger", var_a413d670);
		if(player != var_a413d670)
		{
			continue;
			break;
		}
	}
	player thread zm_perks::vending_trigger_post_think(player, perk);
	self notify("hash_a3af02c2");
	player waittill("burp");
	wait(0.05);
	if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission))
	{
		return;
	}
	chance = RandomInt(100);
	if(chance < level.var_5875fdec)
	{
		PERKS = player function_f24febdc();
		if(!isdefined(PERKS) || PERKS < 1)
		{
			return;
		}
		perk_index = RandomInt(PERKS.size);
		player zm_perks::give_perk(PERKS[perk_index], 0);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_c0d3aa68
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x1418
	Size: 0x298
	Parameters: 1
	Flags: None
	Line Number: 252
*/
function function_c0d3aa68(player)
{
	struct = struct::get(self.machine.target, "targetname");
	model = spawn("script_model", struct.origin);
	model SetModel("tag_origin");
	model.angles = struct.angles;
	model thread perk_bottle_motion();
	model thread function_624c88c7();
	model PlayLoopSound("zmb_rand_perk_vortex_loop");
	options = player function_f24febdc();
	previous = RandomInt(options.size);
	for(i = 0; i < 40; i++)
	{
		current = RandomInt(options.size);
		if(current == previous && options.size > 1)
		{
			i--;
			continue;
		}
		if(i < 20)
		{
			wait(0.05);
		}
		else if(i < 30)
		{
			wait(0.1);
		}
		else if(i < 35)
		{
			wait(0.2);
		}
		else if(i < 38)
		{
			wait(0.3);
		}
		previous = current;
		model.perk = options[current];
		model SetModel(function_1c8adcb0(level._custom_perks[options[current]].perk_bottle_weapon));
	}
	model notify("done_cycling");
	return model;
}

/*
	Name: perk_bottle_motion
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x16B8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 305
*/
function perk_bottle_motion()
{
	angles = self.angles;
	self thread function_1670e86b();
	self waittill("done_cycling");
	self.angles = angles;
	self thread function_b53e228f();
}

/*
	Name: function_1670e86b
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x1720
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 324
*/
function function_1670e86b()
{
	self endon("done_cycling");
	while(1)
	{
		self RotateTo((0, 0, 0), 0.25);
		wait(0.25);
		self RotateTo(VectorScale((0, 1, 0), 90), 0.25);
		wait(0.25);
		self RotateTo(VectorScale((0, 1, 0), 180), 0.25);
		wait(0.25);
		self RotateTo(VectorScale((0, 1, 0), 270), 0.25);
		wait(0.25);
	}
}

/*
	Name: function_b53e228f
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x17F8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 350
*/
function function_b53e228f()
{
	self endon("hash_c472c420");
	angle = self.angles;
	while(1)
	{
		self RotateTo(angle - VectorScale((0, 1, 0), 50), 1, 0.25, 0.25);
		wait(1);
		self RotateTo(angle + VectorScale((0, 1, 0), 50), 1, 0.25, 0.25);
		wait(1);
	}
}

/*
	Name: function_f24febdc
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x18B8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 373
*/
function function_f24febdc()
{
	PERKS = getArrayKeys(level._custom_perks);
	if(!isdefined(PERKS) || PERKS.size < 1)
	{
		return undefined;
	}
	Array = [];
	for(i = 0; i < PERKS.size; i++)
	{
		if(namespace_851dc78f::function_20dc5a15(PERKS[i]) && !self namespace_851dc78f::function_5f9a13b3(PERKS[i]) || (!namespace_851dc78f::function_20dc5a15(PERKS[i]) && self hasPerk(PERKS[i])))
		{
			Array[Array.size] = PERKS[i];
		}
	}
	if(!isdefined(Array) || Array.size < 1)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: function_624c88c7
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x1A00
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 405
*/
function function_624c88c7(origin)
{
	self endon("done_cycling");
	while(1)
	{
		playsoundatposition("zmb_rand_perk_spark", origin);
		wait(RandomFloat(1));
	}
}

/*
	Name: function_19155db3
	Namespace: namespace_2696077a
	Checksum: 0x424F4353
	Offset: 0x1A60
	Size: 0x29A
	Parameters: 1
	Flags: None
	Line Number: 425
*/
function function_19155db3(perk)
{
	switch(perk)
	{
		case "specialty_quickrevive":
		{
			if(level flag::exists("solo_game") && level flag::get("solo_game"))
			{
				return "Revive";
			}
			else
			{
				return "Quick Revive";
			}
		}
		case "specialty_doubletap2":
		{
			return "Doube Tap 2.0";
		}
		case "specialty_armorvest":
		{
			return "Juggernog";
		}
		case "specialty_fastreload":
		{
			return "Speed Cola";
		}
		case "specialty_deadshot":
		{
			return "Deadshot Daquiri";
		}
		case "specialty_phdflopper":
		{
			return "UNDEFINED";
		}
		case "specialty_staminup":
		{
			return "Stamin-Up";
		}
		case "specialty_additionalprimaryweapon":
		{
			return "Mule Kick";
		}
		case "specialty_tombstone":
		{
			return "UNDEFINED";
		}
		case "specialty_whoswho":
		{
			return "UNDEFINED";
		}
		case "specialty_electriccherry":
		{
			return "UNDEFINED";
		}
		case "specialty_vultureaid":
		{
			return "UNDEFINED";
		}
		case "specialty_widowswine":
		{
			return "UNDEFINED";
		}
		case "specialty_extraammo":
		{
			return "UNDEFINED";
		}
		case "specialty_detectexplosive":
		{
			return "UNDEFINED";
		}
		case "specialty_bulletdamage":
		{
			return "UNDEFINED";
		}
		case "specialty_fireproof":
		{
			return "UNDEFINED";
		}
		case "specialty_flakjacket":
		{
			return "Madgaz Moonshine";
		}
		case "specialty_stunprotection":
		{
			return "Tuffbrew";
		}
		case "specialty_flashprotection":
		{
			return "Crusader's Ale";
		}
		case "specialty_proximityprotection":
		{
			return "Bull Ice Blast";
		}
		case "specialty_armorpiercing":
		{
			return "UNDEFINED";
		}
		case "specialty_bulletflinch":
		{
			return "UNDEFINED";
		}
		case "specialty_quieter":
		{
			return "UNDEFINED";
		}
		case "specialty_loudenemies":
		{
			return "UNDEFINED";
		}
		case "specialty_scavenger":
		{
			return "UNDEFINED";
		}
		case "specialty_jetquiet":
		{
			return "UNDEFINED";
		}
		case "specialty_fastweaponswitch":
		{
			return "UNDEFINED";
		}
		case "specialty_sprintfire":
		{
			return "UNDEFINED";
		}
		case "specialty_immunecounteruav":
		{
			return "Banana Colada";
		}
		case "specialty_nottargetedbyaitank":
		{
			return "UNDEFINED";
		}
		case "specialty_showenemyequipment":
		{
			return "UNDEFINED";
		}
		case "specialty_gpsjammer":
		{
			return "UNDEFINED";
		}
		case "specialty_nottargetedbyairsupport":
		{
			return "UNDEFINED";
		}
		default
		{
			return "UNKNOWN SPECIALTY";
		}
	}
}

