#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\challenges_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_genesis_util;
#include scripts\zm\zm_genesis_vo;

#namespace namespace_bc3b809c;

/*
	Name: __init__sytem__
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x5E0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__sytem__()
{
	system::register("zm_genesis_radios", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x628
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function __init__()
{
	callback::on_disconnect(&on_player_disconnect);
}

/*
	Name: __main__
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x658
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function __main__()
{
	/#
		level thread function_9ef4291();
	#/
	level waittill("start_zombie_round_logic");
	level thread function_a999a42a();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: on_player_disconnect
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function on_player_disconnect()
{
	return;
}

/*
	Name: function_a999a42a
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x6B0
	Size: 0x3B0
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function function_a999a42a()
{
	level.var_66b7ed7e = [];
	level.var_22e09be4 = [];
	level.var_22e09be4["divine_comedy"] = Array("vox_abcd_excerpt_divine_0");
	level.var_22e09be4["theatre"] = Array("vox_abcd_excerpt_tempest_0");
	level.var_22e09be4["asylum"] = Array("vox_sfx_radio_stem_verruckt_0");
	level.var_22e09be4["mob"] = Array("vox_sfx_radio_stem_mob_log_1_0", "vox_sfx_radio_stem_mob_log_2_0", "vox_sfx_radio_stem_mob_log_3_0");
	level.var_22e09be4["trenches"] = Array("vox_sfx_radio_stem_origins_log_0");
	level.var_22e09be4["romeros_assistant"] = Array("vox_sall_shangri_log_1_0", "vox_sall_shangri_log_2_0", "vox_sall_shangri_log_3_0", "vox_sfx_radio_stem_shangri_log_4_0");
	level.var_22e09be4["island"] = Array("vox_sfx_radio_stem_shinonuma_log_0");
	level.var_22e09be4["mcnamara"] = Array("vox_nama_namara_log_0");
	a_s_radios = struct::get_array("s_radio", "targetname");
	level.a_s_radios = Array::sort_by_script_int(a_s_radios, 1);
	var_64dfb3ba = GetEntArray("clip_radio", "targetname");
	var_a399b51e = Array::sort_by_script_int(var_64dfb3ba, 1);
	var_ff34523e = Array(5, 8, 10, 11, 12, 13);
	for(i = 0; i < level.a_s_radios.size; i++)
	{
		level.a_s_radios[i].clip = ArrayGetClosest(level.a_s_radios[i].origin, var_64dfb3ba);
		s_unitrigger = level.a_s_radios[i] zm_unitrigger::create_unitrigger(&"", 64, &function_2c776a2a);
		s_unitrigger.require_look_at = 1;
		s_unitrigger.b_on = 1;
		level.a_s_radios[i] thread function_795f4e6();
		var_32be5a3 = i + 1;
		if(IsInArray(var_ff34523e, var_32be5a3))
		{
			level.a_s_radios[i] thread function_35f4f25f();
		}
	}
}

/*
	Name: function_2c776a2a
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0xA68
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 148
*/
function function_2c776a2a(e_player)
{
	if(isdefined(self.stub.b_on) && self.stub.b_on)
	{
		/#
			self setHintString("Dev Block strings are not supported");
		#/
		return 1;
	}
	/#
		self setHintString("Dev Block strings are not supported");
	#/
	return 0;
}

/*
	Name: function_795f4e6
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0xAF0
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 173
*/
function function_795f4e6()
{
	self endon("hash_e37d497d");
	while(1)
	{
		self waittill("trigger_activated", e_user);
		if(isPlayer(e_user) && !level flag::get("abcd_speaking") && !level flag::get("sophia_speaking") && !level flag::get("shadowman_speaking") && !self function_94b3b616())
		{
			self thread function_66d50897("trigger");
			return;
		}
	}
}

/*
	Name: function_35f4f25f
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0xBE0
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 197
*/
function function_35f4f25f()
{
	self endon("hash_e37d497d");
	self endon("hash_27f23694");
	self.clip setcandamage(1);
	var_b1c8a081 = 0;
	while(!var_b1c8a081)
	{
		self.clip waittill("damage", n_amount, e_attacker, v_org, v_dir, str_mod);
		if(isPlayer(e_attacker) && !level flag::get("abcd_speaking") && !level flag::get("sophia_speaking") && !level flag::get("shadowman_speaking") && !self function_94b3b616())
		{
			var_b1c8a081 = 1;
			self thread function_66d50897("damage");
		}
		else
		{
			self.clip.health = 100000;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_66d50897
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0xD60
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 230
*/
function function_66d50897(str_method)
{
	if(self.s_unitrigger.b_on)
	{
		self notify("hash_e37d497d");
		self.clip setcandamage(0);
		self.s_unitrigger.b_on = 0;
		zm_unitrigger::unregister_unitrigger(self);
		str_set = self.script_noteworthy;
		if(level.var_22e09be4[str_set].size)
		{
			str_vo = level.var_22e09be4[str_set][0];
			if(isdefined(str_vo))
			{
				if(str_method == "damage")
				{
					var_c46d7830 = self.clip.origin;
				}
				else
				{
					var_c46d7830 = self.origin;
				}
				Array::add(level.var_66b7ed7e, self, 0);
				ArrayRemoveIndex(level.var_22e09be4[str_set], 0);
				var_5cd02106 = soundgetplaybacktime(str_vo);
				if(var_5cd02106 > 0)
				{
					var_269117b2 = var_5cd02106 / 1000;
					playsoundatposition(str_vo, var_c46d7830);
					thread namespace_cc012897::Send(str_vo, "all", var_5cd02106);
					wait(var_269117b2);
				}
				ArrayRemoveValue(level.var_66b7ed7e, self);
			}
		}
	}
}

/*
	Name: function_94b3b616
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 278
*/
function function_94b3b616(n_range)
{
	if(!isdefined(n_range))
	{
		n_range = 800;
	}
	if(level.var_66b7ed7e.size == 0)
	{
		return 0;
	}
	var_f39e4895 = ArrayGetClosest(self.origin, level.var_66b7ed7e);
	if(isdefined(var_f39e4895))
	{
		n_dist = Distance(self.origin, var_f39e4895.origin);
		return n_dist <= n_range;
	}
	return 0;
}

/*
	Name: function_9ef4291
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0xFF8
	Size: 0x5C0
	Parameters: 0
	Flags: None
	Line Number: 307
*/
function function_9ef4291()
{
	/#
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 3, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 4, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 4, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 5, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 5, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 6, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 6, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 7, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 7, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 8, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 8, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 9, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 9, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 10, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 10, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 11, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 11, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 12, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 12, &function_dda18b8e);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 13, &function_418d5e87);
		level thread namespace_cb655c88::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 13, &function_dda18b8e);
	#/
}

/*
	Name: function_dda18b8e
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x15C0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 349
*/
function function_dda18b8e(n_val)
{
	/#
		level.a_s_radios[n_val - 1] thread function_66d50897();
	#/
}

/*
	Name: function_418d5e87
	Namespace: namespace_bc3b809c
	Checksum: 0x424F4353
	Offset: 0x1600
	Size: 0x11C
	Parameters: 1
	Flags: None
	Line Number: 366
*/
function function_418d5e87(n_val)
{
	/#
		var_dea993d = "Dev Block strings are not supported" + n_val;
		s_dest = struct::get(var_dea993d);
		if(isdefined(s_dest))
		{
			player = level.activePlayers[0];
			var_5d8a4d6d = util::spawn_model("Dev Block strings are not supported", player.origin, player.angles);
			player LinkTo(var_5d8a4d6d);
			var_5d8a4d6d.origin = s_dest.origin;
			wait(0.5);
			player Unlink();
			var_5d8a4d6d delete();
		}
	#/
}

