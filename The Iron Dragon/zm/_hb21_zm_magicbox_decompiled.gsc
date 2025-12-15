#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_magicbox_botd;
#include scripts\zm\_hb21_zm_magicbox_chaos;
#include scripts\zm\_hb21_zm_magicbox_genesis;
#include scripts\zm\_hb21_zm_magicbox_soe;
#include scripts\zm\_hb21_zm_magicbox_tomb;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;

#namespace namespace_f6cf66d3;

/*
	Name: __init__sytem__
	Namespace: namespace_f6cf66d3
	Checksum: 0xE043B03D
	Offset: 0x418
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 29
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_magicbox", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f6cf66d3
	Checksum: 0xEA37F17F
	Offset: 0x460
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function __init__()
{
	clientfield::register("zbarrier", "default_zbarrier_show_sounds", 1, 1, "counter");
	clientfield::register("zbarrier", "default_zbarrier_leave_sounds", 1, 1, "counter");
	level.custom_magicbox_float_height = 40;
	level.chest_joker_custom_movement = &function_fc1dcbe0;
	level.custom_magic_box_timer_til_despawn = &function_98a1077d;
	level.custom_magic_box_do_weapon_rise = &function_89510ff3;
	level.custom_magic_box_weapon_wait = &function_ffca2e55;
	level.custom_magic_box_fx = &function_819a2737;
	level.custom_treasure_chest_glowfx = &function_c665d3f8;
	level.magic_box_zbarrier_state_func = &function_9c7cbdca;
	level.pandora_show_func = &custom_pandora_show_func;
	level.pandora_fx_func = &function_49998a6e;
	return;
}

/*
	Name: __main__
	Namespace: namespace_f6cf66d3
	Checksum: 0x13F83A3C
	Offset: 0x5B0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function __main__()
{
	zm_audio::sndAnnouncerVoxAdd("boxmove2", "event_magicbox_0");
	zm_audio::sndAnnouncerVoxAdd("boxmove", "");
	zm_utility::add_sound("open_chest", "");
	zm_utility::add_sound("music_chest", "");
	zm_utility::add_sound("close_chest", "");
	zm_utility::add_sound("open_chest2", "zmb_lid_open");
	zm_utility::add_sound("music_chest2", "zmb_music_box");
	zm_utility::add_sound("close_chest2", "zmb_lid_close");
	level._effect["poltergeist"] = "";
	level.zmb_laugh_alias = "";
	thread function_6bffebef();
}

/*
	Name: function_6bffebef
	Namespace: namespace_f6cf66d3
	Checksum: 0x678D1F76
	Offset: 0x700
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function function_6bffebef()
{
	while(!isdefined(level.chests))
	{
		wait(0.05);
	}
	foreach(var_a758a79e in level.chests)
	{
		var_a758a79e.box_hacks = [];
		var_a758a79e.box_hacks["summon_box"] = &function_26218462;
	}
}

/*
	Name: function_26218462
	Namespace: namespace_f6cf66d3
	Checksum: 0x2014DC0B
	Offset: 0x7C8
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 119
*/
function function_26218462(b_hide)
{
	str_classname = self.zbarrier.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_7b8dbea1))
	{
		self.zbarrier clientfield::set("magicbox_open_glow", 0);
		self.zbarrier clientfield::set("magicbox_closed_glow", 0);
		self [[level.var_ef01f1df[str_classname].var_7b8dbea1]](b_hide);
		return;
	}
	if(!b_hide)
	{
		self.zbarrier clientfield::increment("default_zbarrier_show_sounds");
		continue;
	}
	self.zbarrier clientfield::increment("default_zbarrier_leave_sounds");
	level thread zm_audio::sndAnnouncerPlayVox("boxmove2");
}

/*
	Name: function_98a1077d
	Namespace: namespace_f6cf66d3
	Checksum: 0x87272A5C
	Offset: 0x908
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 148
*/
function function_98a1077d(var_f37a1d3e)
{
	str_classname = var_f37a1d3e.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_9711412c))
	{
		self [[level.var_ef01f1df[str_classname].var_9711412c]](var_f37a1d3e);
		return;
	}
	self zm_magicbox::timer_til_despawn(anglesToUp(var_f37a1d3e.angles) * level.custom_magicbox_float_height);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: custom_pandora_show_func
	Namespace: namespace_f6cf66d3
	Checksum: 0x196A9332
	Offset: 0x9C8
	Size: 0xC0
	Parameters: 3
	Flags: None
	Line Number: 171
*/
function custom_pandora_show_func(var_b1a4293e, var_491f1716, a_pieces)
{
	str_classname = self.zbarrier.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_779d45c))
	{
		self [[level.var_ef01f1df[str_classname].var_779d45c]](var_b1a4293e, var_491f1716, a_pieces);
		self thread [[level.pandora_fx_func]]();
		return;
	}
	self zm_magicbox::default_pandora_show_func();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_49998a6e
	Namespace: namespace_f6cf66d3
	Checksum: 0xAECD9F55
	Offset: 0xA90
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 195
*/
function function_49998a6e()
{
	str_classname = self.zbarrier.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_d31d4f9b))
	{
		self [[level.var_ef01f1df[str_classname].var_d31d4f9b]]();
		return;
	}
	self zm_magicbox::default_pandora_fx_func();
}

/*
	Name: function_fc1dcbe0
	Namespace: namespace_f6cf66d3
	Checksum: 0x55C3452
	Offset: 0xB20
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 216
*/
function function_fc1dcbe0()
{
	str_classname = self.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_b4a3e3f))
	{
		self [[level.var_ef01f1df[str_classname].var_b4a3e3f]]();
		return;
	}
	Array::thread_all(level.players, &function_97cf8ad3);
	v_origin = self.weapon_model.origin;
	self.weapon_model delete();
	self.weapon_model = spawn("script_model", v_origin);
	self.weapon_model SetModel(level.chest_joker_model);
	self.weapon_model.angles = self.angles + VectorScale((0, 1, 0), 180);
	wait(0.5);
	level notify("weapon_fly_away_start");
	wait(2);
	if(isdefined(self.weapon_model))
	{
		v_fly_away = self.origin + anglesToUp(self.angles) * 500;
		self.weapon_model moveto(v_fly_away, 4, 3);
	}
	if(isdefined(self.weapon_model_dw))
	{
		v_fly_away = self.origin + anglesToUp(self.angles) * 500;
		self.weapon_model_dw moveto(v_fly_away, 4, 3);
	}
	self.weapon_model waittill("movedone");
	self.weapon_model delete();
	if(isdefined(self.weapon_model_dw))
	{
		self.weapon_model_dw delete();
		self.weapon_model_dw = undefined;
	}
	self notify("box_moving");
	level notify("weapon_fly_away_end");
}

/*
	Name: function_c665d3f8
	Namespace: namespace_f6cf66d3
	Checksum: 0x9A22F4B3
	Offset: 0xDA8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 264
*/
function function_c665d3f8()
{
	str_classname = self.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_b498419b))
	{
		self [[level.var_ef01f1df[str_classname].var_b498419b]]();
		return;
	}
	self zm_magicbox::treasure_chest_glowfx();
}

/*
	Name: function_9c7cbdca
	Namespace: namespace_f6cf66d3
	Checksum: 0x5B1C774D
	Offset: 0xE30
	Size: 0x328
	Parameters: 1
	Flags: None
	Line Number: 285
*/
function function_9c7cbdca(str_state)
{
	str_classname = self.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_dc9ab291))
	{
		self [[level.var_ef01f1df[str_classname].var_dc9ab291]](str_state);
		return;
	}
	switch(str_state)
	{
		case "away":
		{
			self ShowZBarrierPiece(0);
			self.state = "away";
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(1);
			self thread zm_magicbox::magic_box_arrives();
			self.state = "arriving";
			break;
		}
		case "initial":
		{
			self ShowZBarrierPiece(1);
			self thread zm_magicbox::magic_box_initial();
			thread zm_unitrigger::register_static_unitrigger(self.owner.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
			self.state = "initial";
			break;
		}
		case "open":
		{
			self ShowZBarrierPiece(2);
			self thread zm_magicbox::magic_box_opens();
			self.state = "open";
			zm_utility::play_sound_at_pos("open_chest2", self.origin);
			zm_utility::play_sound_at_pos("music_chest2", self.origin);
			break;
		}
		case "close":
		{
			self ShowZBarrierPiece(2);
			self thread zm_magicbox::magic_box_closes();
			self.state = "close";
			zm_utility::play_sound_at_pos("close_chest2", self.origin);
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(1);
			self thread zm_magicbox::magic_box_leaves();
			self thread function_f1697fa9();
			self.state = "leaving";
			break;
		}
		default
		{
			if(isdefined(level.custom_magicbox_state_handler))
			{
				self [[level.custom_magicbox_state_handler]](str_state);
				break;
			}
		}
	}
	return;
}

/*
	Name: function_f1697fa9
	Namespace: namespace_f6cf66d3
	Checksum: 0x7E62B42D
	Offset: 0x1160
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 363
*/
function function_f1697fa9()
{
	self waittill("left");
	playFX("zombie/fx_barrier_buy_zmb", self.origin, anglesToUp(self.angles), AnglesToForward(self.angles));
}

/*
	Name: function_89510ff3
	Namespace: namespace_f6cf66d3
	Checksum: 0xF5086743
	Offset: 0x11D0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 379
*/
function function_89510ff3()
{
	str_classname = self.classname;
	if(isdefined(level.var_ef01f1df[str_classname]) && isdefined(level.var_ef01f1df[str_classname].var_9f2c039c))
	{
		self [[level.var_ef01f1df[str_classname].var_9f2c039c]]();
		return;
	}
	self zm_magicbox::magic_box_do_weapon_rise();
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_819a2737
	Namespace: namespace_f6cf66d3
	Checksum: 0x9ACF73B8
	Offset: 0x1258
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 403
*/
function function_819a2737()
{
}

/*
	Name: function_ffca2e55
	Namespace: namespace_f6cf66d3
	Checksum: 0x587A6B2E
	Offset: 0x1268
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 417
*/
function function_ffca2e55()
{
	wait(0.5);
}

/*
	Name: function_97cf8ad3
	Namespace: namespace_f6cf66d3
	Checksum: 0x6CFD92F9
	Offset: 0x1280
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 432
*/
function function_97cf8ad3()
{
	self playlocalsound("zmb_laugh_child");
}

