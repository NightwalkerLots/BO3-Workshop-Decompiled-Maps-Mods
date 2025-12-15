#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;

#namespace namespace_f3eb079d;

/*
	Name: init
	Namespace: namespace_f3eb079d
	Checksum: 0xE8E99573
	Offset: 0x4F8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec init()
{
	level waittill("all_players_connected");
	thread function_c6faad09();
	thread function_67347928();
}

/*
	Name: function_c6faad09
	Namespace: namespace_f3eb079d
	Checksum: 0xAB80B432
	Offset: 0x538
	Size: 0x430
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function function_c6faad09()
{
	var_ecb5cd7 = GetEntArray("lighting_detail", "targetname");
	level thread power_electric_switch();
	level flag::wait_till("initial_blackscreen_passed");
	level util::set_lighting_state(0);
	level.var_87833bef = 0;
	wait(1);
	level flag::wait_till("power_on");
	if(!(isdefined(level.var_f569a524) && level.var_f569a524))
	{
		foreach(player in GetPlayers())
		{
			player playlocalsound("power_on_botd");
			player playlocalsound("power_on_jingle");
		}
		wait(1);
		foreach(player in GetPlayers())
		{
			player playlocalsound("power_on_juicer");
		}
		wait(1.9);
		foreach(var_1cce66a4 in var_ecb5cd7)
		{
			var_1cce66a4 delete();
		}
		level.var_87833bef = 1;
		if(isdefined(level.var_60074393) && level.var_60074393)
		{
			if(level.var_48ea0a78 == 0)
			{
				namespace_f56b53f0::function_dbe7e78b("Lighting State set to '1' (2) [Daytime]");
				level.var_571f49fd = 1;
				level util::set_lighting_state(level.var_571f49fd);
				continue;
			}
			namespace_f56b53f0::function_dbe7e78b("Lighting State unchanged [Nighttime]");
		}
		else if(!isdefined(level.var_571f49fd))
		{
			level.var_571f49fd = 1;
		}
		level util::set_lighting_state(level.var_571f49fd);
		foreach(player in GetPlayers())
		{
			player playlocalsound("snd_ro_lights_on");
			Earthquake(0.2, 0.25, player.origin, 500);
		}
	}
}

/*
	Name: power_electric_switch
	Namespace: namespace_f3eb079d
	Checksum: 0x32D91ACE
	Offset: 0x970
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 109
*/
function power_electric_switch()
{
	trigs = GetEntArray("use_power_switch_vk", "targetname");
	foreach(trig in trigs)
	{
		trig thread function_f6a9c0c6();
	}
}

/*
	Name: function_f6a9c0c6
	Namespace: namespace_f3eb079d
	Checksum: 0xD44DD9C
	Offset: 0xA30
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function function_f6a9c0c6()
{
	trig = self;
	wait(0.05);
	trig setHintString(&"ZOMBIE_ELECTRIC_SWITCH");
	trig setcursorhint("HINT_NOICON");
	trig waittill("trigger", player);
	namespace_f56b53f0::function_dbe7e78b("Power Turned On");
	wait(0.05);
	player zm_audio::create_and_play_dialog("general", "power_on");
	player playsound("zmb_switch_flip");
	player playsound("zmb_turn_on");
	player zm_score::add_to_player_score(250);
	level thread scene::Play("power_switch_vk", "targetname");
	level flag::set("power_on");
	thread function_fe3fbc87();
	wait(0.05);
	util::clientNotify("ZPO");
	wait(0.05);
	trig delete();
	wait(1);
	s_switch = struct::get("power_switch_fx", "targetname");
	FORWARD = AnglesToForward(s_switch.origin);
	playFX(level._effect["switch_sparks"], s_switch.origin, FORWARD);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fe3fbc87
	Namespace: namespace_f3eb079d
	Checksum: 0xC5BBDAC6
	Offset: 0xC78
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function function_fe3fbc87()
{
	var_dade54fb = struct::get("vk_ps_snd");
	wait(1.9);
	snd = util::spawn_model("tag_origin", var_dade54fb.origin, var_dade54fb.angles);
	snd PlayLoopSound("power_on_buzz");
}

/*
	Name: function_67347928
	Namespace: namespace_f3eb079d
	Checksum: 0xFE883265
	Offset: 0xD10
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_67347928()
{
	str_trig = spawn("trigger_radius", (0, 0, 0), 0, 16, 16);
	str_trig SetInvisibleToAll();
	function_b24346e3(str_trig, &"VK_DESC_MULEKICK", 4000);
	function_b24346e3(str_trig, &"VK_DESC_DEADSHOT", 1500);
	function_b24346e3(str_trig, &"VK_DESC_DOUBLETAP", 2000);
	function_b24346e3(str_trig, &"VK_DESC_SPEEDCOLA", 3000);
	function_b24346e3(str_trig, &"VK_DESC_JUGGERNOG", 2500);
	function_b24346e3(str_trig, &"VK_DESC_STAMINUP", 2000);
	function_b24346e3(str_trig, &"VK_DESC_QUICKREVIVE", 1500);
	function_b24346e3(str_trig, &"VK_DESC_QUICKREVIVE", 500);
	function_b24346e3(str_trig, &"VK_DESC_WIDOWSWINE", 4000);
	function_b24346e3(str_trig, &"ZOMBIE_PERK_PACKAPUNCH", 5000);
	function_b24346e3(str_trig, &"ZOMBIE_PERK_PACKAPUNCH", 1000);
	function_b24346e3(str_trig, &"ZOMBIE_PERK_PACKAPUNCH_AAT", 2500);
	function_b24346e3(str_trig, &"ZOMBIE_PERK_PACKAPUNCH_AAT", 500);
	str_trig delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b24346e3
	Namespace: namespace_f3eb079d
	Checksum: 0x1294D834
	Offset: 0xF20
	Size: 0x7C
	Parameters: 3
	Flags: None
	Line Number: 216
*/
function function_b24346e3(str_trig, string, insert)
{
	if(!isdefined(insert))
	{
		insert = undefined;
	}
	if(!isdefined(insert))
	{
		str_trig setHintString(string);
		continue;
	}
	str_trig setHintString(string, insert);
	wait(0.05);
}

