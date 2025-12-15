#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_story_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_castle_ee;
#include scripts\zm\zm_castle_teleporter;
#include scripts\zm\zm_castle_util;

#namespace namespace_dd184fb9;

/*
	Name: function_9b385ca5
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0xFC0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function function_9b385ca5()
{
}

/*
	Name: function_5fba2032
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0xFD0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function function_5fba2032()
{
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4217f0a1
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0xFE0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_4217f0a1()
{
	self.var_16cc14d0 setcandamage(1);
	while(1)
	{
		self.var_16cc14d0.health = 1000000;
		self.var_16cc14d0 waittill("damage", damage, attacker);
		if(!self.var_41660b94)
		{
			continue;
		}
		self.var_a802d3d9 = 0;
		wait(3);
		self.var_a802d3d9 = 1;
	}
}

/*
	Name: function_1a856336
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0x1088
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function function_1a856336()
{
	self.var_2eb50ca2 setcandamage(1);
	while(1)
	{
		self.var_2eb50ca2.health = 1000000;
		self.var_2eb50ca2 waittill("damage", damage, attacker);
		if(!self.var_41660b94)
		{
			continue;
		}
		self.var_11a8191e = 0;
		wait(3);
		self.var_11a8191e = 1;
	}
}

/*
	Name: function_1401a672
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0x1130
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 128
*/
function function_1401a672(var_fc7b760)
{
	self.var_41660b94 = var_fc7b760;
}

/*
	Name: function_755ccf7d
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0x1150
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 143
*/
function function_755ccf7d()
{
	var_8b79520 = Array("zone_great_hall", "zone_great_hall_upper", "zone_great_hall_upper_left", "zone_armory", "zone_undercroft_chapel", "zone_courtyard", "zone_courtyard_edge");
	foreach(var_348ee409 in var_8b79520)
	{
		if(zm_zonemgr::any_player_in_zone(var_348ee409))
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_290563e9
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0x1240
	Size: 0x390
	Parameters: 0
	Flags: None
	Line Number: 166
*/
function function_290563e9()
{
	while(1)
	{
		if(!function_755ccf7d())
		{
			wait(0.5);
			continue;
		}
		if(level flag::get("ee_disco_inferno") == 1)
		{
			self.var_5ae81506 = 4;
		}
		else
		{
			self.var_5ae81506 = 1;
		}
		self.var_c86771bb RotateYaw(self.var_b548cd69 * self.var_f35c15fb * self.var_5ae81506, 0.5);
		self.var_d6478e9 RotateYaw(self.var_b548cd69 * self.var_9abb59c4 * self.var_90e84049 * self.var_5ae81506, 0.5);
		if(self.var_11a8191e)
		{
			self.var_d502c153 RotateYaw(self.var_b548cd69 * self.var_9abb59c4 * self.var_5ae81506, 0.5);
			self.var_2eb50ca2 RotateYaw(self.var_b548cd69 * self.var_9abb59c4 * self.var_5ae81506, 0.5);
		}
		if(self.var_a802d3d9)
		{
			self.var_16cc14d0 RotateYaw(self.var_b548cd69 * self.var_f35c15fb * self.var_95126c9c * self.var_5ae81506, 0.5);
		}
		if(!self.var_11a8191e && !self.var_a802d3d9)
		{
			var_d536dea5 = self.var_d502c153.angles;
			var_74c90acc = self.var_16cc14d0.angles;
			var_5375e06e = Abs(Int(var_d536dea5[1] + 142) % 360);
			var_7b4ccc8b = Int(Abs(var_74c90acc[1])) % 360;
			if(var_74c90acc[1] < 0)
			{
				var_15a04435 = 360 - var_7b4ccc8b;
			}
			else
			{
				var_15a04435 = var_7b4ccc8b;
			}
			var_a0dd62e5 = Abs(var_5375e06e - var_15a04435);
			if(var_a0dd62e5 > 180)
			{
				var_a0dd62e5 = 360 - var_a0dd62e5;
			}
			/#
				IPrintLnBold("Dev Block strings are not supported" + var_5375e06e + "Dev Block strings are not supported" + var_15a04435 + "Dev Block strings are not supported" + var_a0dd62e5);
			#/
			if(var_a0dd62e5 <= 45)
			{
				level flag::set("ee_disco_inferno");
				self.var_11a8191e = 1;
				self.var_a802d3d9 = 1;
			}
		}
		wait(0.5);
	}
}

/*
	Name: start
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0x15D8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function start()
{
	self thread function_290563e9();
	self thread function_1a856336();
	self thread function_4217f0a1();
	return;
	continue;
}

/*
	Name: init
	Namespace: namespace_dd184fb9
	Checksum: 0x424F4353
	Offset: 0x1630
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 256
*/
function init()
{
	self.var_41660b94 = 1;
	self.var_11a8191e = 1;
	self.var_a802d3d9 = 1;
	self.var_c86771bb = GetEnt("ee_disco_earth", "targetname");
	self.var_d502c153 = GetEnt("ee_disco_arm_moon", "targetname");
	self.var_16cc14d0 = GetEnt("ee_disco_arm_rocket", "targetname");
	self.var_2eb50ca2 = GetEnt("ee_disco_moon", "targetname");
	self.var_d6478e9 = GetEnt("ee_disco_moon_rocket", "targetname");
	self.var_2eb50ca2 LinkTo(self.var_d502c153, "tag_moon");
	self.var_d6478e9 LinkTo(self.var_d502c153, "tag_moon");
	self.var_b548cd69 = 5;
	self.var_f35c15fb = 1;
	self.var_95126c9c = -3;
	self.var_9abb59c4 = 2;
	self.var_90e84049 = 3;
}

#namespace namespace_61c0be00;

/*
	Name: function_dd184fb9
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x17B8
	Size: 0x1D8
	Parameters: 0
	Flags: 6
	Line Number: 287
*/
function private autoexec function_dd184fb9()
{
	classes.var_dd184fb9[0] = spawnstruct();
	classes.var_dd184fb9[0].__vtable[-1017222485] = &namespace_dd184fb9::init;
	classes.var_dd184fb9[0].__vtable[55554463] = &namespace_dd184fb9::start;
	classes.var_dd184fb9[0].__vtable[1024876421] = &namespace_dd184fb9::function_290563e9;
	classes.var_dd184fb9[0].__vtable[1099779246] = &namespace_dd184fb9::function_755ccf7d;
	classes.var_dd184fb9[0].__vtable[296274164] = &namespace_dd184fb9::function_1401a672;
	classes.var_dd184fb9[0].__vtable[636925905] = &namespace_dd184fb9::function_1a856336;
	classes.var_dd184fb9[0].__vtable[-1874406626] = &namespace_dd184fb9::function_4217f0a1;
	classes.var_dd184fb9[0].__vtable[1606033458] = &namespace_dd184fb9::function_5fba2032;
	classes.var_dd184fb9[0].__vtable[-1690805083] = &namespace_dd184fb9::function_9b385ca5;
}

#namespace namespace_e581926f;

/*
	Name: function_9b385ca5
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1998
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 313
*/
function function_9b385ca5()
{
}

/*
	Name: function_5fba2032
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x19A8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 327
*/
function function_5fba2032()
{
}

/*
	Name: function_4db73fa1
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x19B8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 341
*/
function function_4db73fa1()
{
	self.var_f3797cc9 = !self.var_f3797cc9;
	/#
		if(self.var_f3797cc9)
		{
			IPrintLnBold("Dev Block strings are not supported");
		}
		else
		{
			IPrintLnBold("Dev Block strings are not supported");
		}
	#/
}

/*
	Name: function_aa7c5ce2
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1A20
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 366
*/
function function_aa7c5ce2()
{
	self.var_f3c3ca5a = !self.var_f3c3ca5a;
}

/*
	Name: function_9b5dc008
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1A40
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 381
*/
function function_9b5dc008(b_on)
{
	if(self.var_2ed6212f)
	{
		return;
	}
	self.var_f3c3ca5a = b_on;
}

/*
	Name: activation_switch
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1A70
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 400
*/
function activation_switch()
{
	self.var_8b97288d namespace_744abc1c::create_unitrigger();
	while(1)
	{
		self.var_8b97288d waittill("trigger_activated");
		self function_aa7c5ce2();
		self.var_8b97288d playsound("evt_lever");
		if(self.var_f3c3ca5a)
		{
			self notify("hash_da8088ad");
			self.var_23036e82 = 0;
		}
		self.var_8b97288d RotatePitch(60, 0.333);
		wait(0.333);
		self.var_8b97288d RotatePitch(-60, 0.2);
		wait(0.2);
	}
}

/*
	Name: function_1f5408aa
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1B68
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 430
*/
function function_1f5408aa()
{
	if(self.var_a117a15d == 9 && self.var_246b41b3 == 35)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_da8088ad
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1BA0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 449
*/
function function_da8088ad()
{
	self notify("hash_da8088ad");
	self endon("hash_da8088ad");
	self.var_23036e82 = 1;
	while(1)
	{
		var_6443dac9 = RandomFloatRange(5, 15);
		wait(var_6443dac9);
		level clientfield::increment("clocktower_flash");
		if(function_1f5408aa())
		{
			namespace_61c0be00::function_779bfe1e();
			self.var_1ed02f45 playsound("evt_clock_comp");
			advance_hands();
		}
	}
}

/*
	Name: advance_hands
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1C80
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 478
*/
function advance_hands()
{
	self.var_246b41b3++;
	if(self.var_246b41b3 == 60)
	{
		self.var_246b41b3 = 0;
		self.var_a117a15d++;
	}
	if(self.var_a117a15d == 12)
	{
		self.var_a117a15d = 0;
	}
	self.var_5c546253 RotatePitch(-6, 0.05);
	self.var_5c546253 playsound("evt_min_hand");
	if(self.var_246b41b3 % 12 == 0)
	{
		self.var_1ed02f45 RotatePitch(-6, 0.05);
		self.var_1ed02f45 playsound("evt_hour_hand");
	}
	if(self.var_f3797cc9 && function_1f5408aa())
	{
		self function_9b5dc008(0);
	}
}

/*
	Name: function_ec1f5e9
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1DB0
	Size: 0x200
	Parameters: 3
	Flags: None
	Line Number: 513
*/
function function_ec1f5e9(n_hours, var_a00b65f, var_1133e63b)
{
	if(!isdefined(var_1133e63b))
	{
		var_1133e63b = 20;
	}
	var_3e7e6c38 = self.var_f3c3ca5a;
	self function_9b5dc008(0);
	self.var_2ed6212f = 1;
	var_16c3da4f = var_a00b65f - self.var_246b41b3;
	if(var_16c3da4f < 0)
	{
		var_16c3da4f = 60 + var_16c3da4f;
	}
	var_2dc617a1 = n_hours - self.var_a117a15d;
	if(var_2dc617a1 < 0)
	{
		var_2dc617a1 = 12 + var_2dc617a1;
	}
	/#
		iprintln("Dev Block strings are not supported" + var_2dc617a1 + "Dev Block strings are not supported" + var_16c3da4f);
	#/
	self.var_5c546253 RotatePitch(-6 * var_16c3da4f, 0.05 * var_16c3da4f * 1 / var_1133e63b);
	self.var_1ed02f45 RotatePitch(-30 * var_2dc617a1, 0.05 * var_2dc617a1 * 1 / var_1133e63b);
	self.var_246b41b3 = var_a00b65f;
	self.var_a117a15d = n_hours;
	/#
		iprintln("Dev Block strings are not supported" + self.var_a117a15d + "Dev Block strings are not supported" + self.var_246b41b3);
	#/
	self.var_2ed6212f = 0;
	self function_9b5dc008(var_3e7e6c38);
	return;
}

/*
	Name: start
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x1FB8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 557
*/
function start()
{
	self thread activation_switch();
	while(1)
	{
		if(self.var_f3c3ca5a)
		{
			advance_hands();
		}
		if(!self.var_f3c3ca5a)
		{
			if(!self.var_23036e82)
			{
				self thread function_da8088ad();
			}
		}
		wait(0.4);
	}
}

/*
	Name: init
	Namespace: namespace_e581926f
	Checksum: 0x424F4353
	Offset: 0x2038
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 587
*/
function init()
{
	self.var_5c546253 = GetEnt("ee_clocktower_minute_hand", "targetname");
	self.var_1ed02f45 = GetEnt("ee_clocktower_hour_hand", "targetname");
	self.var_8b97288d = GetEnt("ee_clocktower_activation_switch", "targetname");
	self.var_f3c3ca5a = 0;
	self.var_246b41b3 = 0;
	self.var_a117a15d = 0;
	self.var_23036e82 = 0;
	self.var_f3797cc9 = 0;
	self.var_2ed6212f = 0;
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

#namespace namespace_61c0be00;

/*
	Name: function_e581926f
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2108
	Size: 0x268
	Parameters: 0
	Flags: 6
	Line Number: 615
*/
function private autoexec function_e581926f()
{
	classes.var_e581926f[0] = spawnstruct();
	classes.var_e581926f[0].__vtable[-1017222485] = &namespace_e581926f::init;
	classes.var_e581926f[0].__vtable[55554463] = &namespace_e581926f::start;
	classes.var_e581926f[0].__vtable[1442227604] = &namespace_e581926f::function_ec1f5e9;
	classes.var_e581926f[0].__vtable[416248377] = &namespace_e581926f::advance_hands;
	classes.var_e581926f[0].__vtable[-629110611] = &namespace_e581926f::function_da8088ad;
	classes.var_e581926f[0].__vtable[-1701800508] = &namespace_e581926f::function_1f5408aa;
	classes.var_e581926f[0].__vtable[-665800749] = &namespace_e581926f::activation_switch;
	classes.var_e581926f[0].__vtable[-1688354808] = &namespace_e581926f::function_9b5dc008;
	classes.var_e581926f[0].__vtable[1059079049] = &namespace_e581926f::function_aa7c5ce2;
	classes.var_e581926f[0].__vtable[1889440624] = &namespace_e581926f::function_4db73fa1;
	classes.var_e581926f[0].__vtable[1606033458] = &namespace_e581926f::function_5fba2032;
	classes.var_e581926f[0].__vtable[-1690805083] = &namespace_e581926f::function_9b385ca5;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: __init__sytem__
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2378
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 644
*/
function autoexec __init__sytem__()
{
	system::register("zm_zod_ee_side", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x23B8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 659
*/
function __init__()
{
	level._effect["def_explode"] = "explosions/fx_exp_grenade_default";
	level._effect["mechz_rocket_punch"] = "dlc1/castle/fx_mech_jump_booster_loop";
	clientfield::register("world", "clocktower_flash", 5000, 1, "counter");
	clientfield::register("world", "sndUEB", 5000, 1, "int");
	clientfield::register("actor", "plunger_exploding_ai", 5000, 1, "int");
	clientfield::register("toplayer", "plunger_charged_strike", 5000, 1, "counter");
	zm::register_player_damage_callback(&function_b98927d4);
	zm::register_actor_damage_callback(&function_f10f1879);
	return;
}

/*
	Name: main
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2500
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 682
*/
function main()
{
	callback::on_spawned(&function_7a56bf90);
	level.gravity_trap_spike_watcher = &gravity_trap_spike_watcher;
	level thread function_e437a08f();
	init_flags();
	level flag::wait_till("start_zombie_round_logic");
	level thread function_452b0b5a();
	function_70b74a2d();
	function_b8645c20();
	function_fd2e0e37();
	function_769b2ff();
	function_7998107();
	function_9e325d85();
	level.riotshield_melee_juke_callback = &function_c6930415;
	level thread function_b0de0617();
	/#
		if(GetDvarInt("Dev Block strings are not supported") > 0)
		{
			level thread function_d6026710();
		}
	#/
}

/*
	Name: function_b0de0617
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2670
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 716
*/
function function_b0de0617()
{
	level waittill("hash_1b9d7e45", player);
	eye = player GetEye();
	util::setClientSysState("aae_soulcounter", "&AAE_TIP_ROCKETSHIELD_UPGRADED_TITLE&AAE_TIP_ROCKETSHIELD_UPGRADED_CONTENT&" + eye[0] + "&" + eye[1] + "&" + eye[2]);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_flags
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2710
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 735
*/
function init_flags()
{
	level flag::init("play_vocals");
	level flag::init("ee_power_clocktower");
	level flag::init("ee_claw_hat");
	level flag::init("ee_disco_inferno");
	level flag::init("ee_power_wallrun_teleport");
	level flag::init("ee_music_box_turning");
	level flag::init("plunger_teleport_on");
}

/*
	Name: function_452b0b5a
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2800
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 756
*/
function function_452b0b5a()
{
	function_9b385ca5();
	level.var_818b7815 = var_dd184fb9;
	init();
	level thread function_e3163325();
	function_9b385ca5();
	level.var_9f94326b = var_e581926f;
	init();
	function_ec1f5e9(level.var_9f94326b, 1);
	level flag::wait_till("ee_power_clocktower");
	start();
}

/*
	Name: function_70b74a2d
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x28C8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 780
*/
function function_70b74a2d()
{
	level thread function_5c600852();
	level thread function_553b8e23();
	level thread spare_change();
	level thread function_7c237ecb();
	level thread function_52c08eab();
	level thread function_4eb3851();
	level thread function_c691b60();
	level thread function_9f9e6cf();
	level thread function_18a803c3();
}

/*
	Name: function_77bd86b1
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x29B0
	Size: 0x190
	Parameters: 1
	Flags: None
	Line Number: 803
*/
function function_77bd86b1(timer)
{
	level notify("hash_77bd86b1");
	var_77bd86b1 = NewHudElem();
	var_77bd86b1.alignX = "center";
	var_77bd86b1.alignY = "top";
	var_77bd86b1.horzAlign = "center";
	var_77bd86b1.vertAlign = "top";
	var_77bd86b1.x = 0;
	var_77bd86b1.y = 20;
	var_77bd86b1.fontscale = 1.5;
	var_77bd86b1.font = "small";
	var_77bd86b1.alpha = 1;
	var_77bd86b1.color = (1, 1, 1);
	var_77bd86b1.hidewheninmenu = 1;
	var_77bd86b1.foreground = 1;
	var_77bd86b1.label = &"AAEP_CASTLE_EE_TIMER";
	var_77bd86b1 setText(" " + function_cec50efa(timer));
	var_77bd86b1 thread function_edb44a97(timer);
}

/*
	Name: function_cec50efa
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2B48
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 834
*/
function function_cec50efa(seconds)
{
	hours = 0;
	minutes = 0;
	if(seconds > 59)
	{
		minutes = Int(seconds / 60);
		seconds = Int(seconds * 1000) % 60000;
		seconds = seconds * 0.001;
		if(minutes > 59)
		{
			hours = Int(minutes / 60);
			minutes = Int(minutes * 1000) % 60000;
			minutes = minutes * 0.001;
		}
	}
	if(hours < 10)
	{
		hours = "0" + hours;
	}
	if(minutes < 10)
	{
		minutes = "0" + minutes;
	}
	seconds = Int(seconds);
	if(seconds < 10)
	{
		seconds = "0" + seconds;
	}
	combined = "" + minutes + ":" + seconds;
	return combined;
}

/*
	Name: function_edb44a97
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2D00
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 877
*/
function function_edb44a97(timer)
{
	level endon("hash_77bd86b1");
	self thread function_9318ec61();
	while(timer)
	{
		wait(1);
		timer--;
		self setText(" " + function_cec50efa(timer));
	}
}

/*
	Name: function_9318ec61
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2D80
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 899
*/
function function_9318ec61()
{
	level util::waittill_any_return("stop_time_travel", "choose_time_travel_target", "reset_time_travel_target", "de_time_travel_timer");
	self destroy();
}

/*
	Name: function_9f9e6cf
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2DE0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 915
*/
function function_9f9e6cf()
{
	level endon("hash_1091d34a");
	level flag::wait_till("ee_start_done");
	a_targets = GetEntArray("activate_teleporter_object", "targetname");
	while(!level flag::get("stop_time_travel"))
	{
		wait(0.05);
		if(!level flag::get("time_travel_teleporter_ready"))
		{
			thread function_77bd86b1(120);
		}
		level util::waittill_any("choose_time_travel_target", "start_of_round");
	}
}

/*
	Name: function_18a803c3
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x2EC8
	Size: 0x3F8
	Parameters: 0
	Flags: None
	Line Number: 941
*/
function function_18a803c3()
{
	level endon("hash_1091d34a");
	level flag::wait_till("ee_start_done");
	var_2aadfc72 = undefined;
	origin = (0, 0, 0);
	var_fd2318f1 = [];
	var_fd2318f1["pf9420_auto1"] = (-856, 3990, 1015);
	var_fd2318f1["pf9420_auto2"] = (-1748, 1979, 914);
	var_fd2318f1["pf9420_auto3"] = (190, 2832, 951);
	var_fd2318f1["pf9420_auto4"] = (-472, 3219, 805);
	var_fd2318f1["pf9420_auto5"] = (-41, 343, 201);
	var_fd2318f1["pf9420_auto7"] = (1825, 1570, 548);
	var_fd2318f1["pf9420_auto8"] = (619, 3385, 740);
	var_fd2318f1["pf9420_auto9"] = (1057, 1286, 275);
	while(!level flag::get("stop_time_travel"))
	{
		if(isdefined(level.var_a0ef3c5e) && isdefined(var_fd2318f1[level.var_a0ef3c5e.target]))
		{
			origin = var_fd2318f1[level.var_a0ef3c5e.target];
			if(isdefined(var_2aadfc72))
			{
				var_2aadfc72.origin = origin;
			}
			else
			{
				var_2aadfc72 = spawn("script_model", origin);
				var_2aadfc72 rotate((40, 60, 80));
				var_2aadfc72 SetModel("p7_zm_ctl_summoning_key_small");
				PlayFXOnTag(level._effect["summoning_key_source"], var_2aadfc72, "tag_origin", 1);
				PlayFXOnTag(level._effect["summoning_key_glow"], var_2aadfc72, "tag_origin", 1);
				PlayFXOnTag(level._effect["summoning_key_done"], var_2aadfc72, "tag_origin", 1);
			}
			a_flags = Array("choose_time_travel_target", "reset_time_travel_target");
			level flag::wait_till_any(a_flags);
			if(isdefined(var_2aadfc72))
			{
				var_2aadfc72 delete();
				var_2aadfc72 = undefined;
			}
		}
		else if(isdefined(var_2aadfc72))
		{
			var_2aadfc72 delete();
			var_2aadfc72 = undefined;
		}
		while(isdefined(level.var_a0ef3c5e) && isdefined(var_fd2318f1[level.var_a0ef3c5e.target]) && origin == var_fd2318f1[level.var_a0ef3c5e.target])
		{
			wait(0.05);
		}
		wait(0.05);
	}
	if(isdefined(var_2aadfc72))
	{
		var_2aadfc72 delete();
	}
}

/*
	Name: function_e3163325
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x32C8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1009
*/
function function_e3163325()
{
	level flag::wait_till("power_on");
	start();
}

/*
	Name: function_c691b60
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3308
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1025
*/
function function_c691b60()
{
	for(i = 0; i < 5; i++)
	{
		a_s_reels = struct::get_array("ee_groph_reels_" + i, "targetname");
		foreach(var_7b352087 in a_s_reels)
		{
			var_df5776d8 = util::spawn_model(var_7b352087.model, var_7b352087.origin, var_7b352087.angles);
			var_7b352087.var_df5776d8 = var_df5776d8;
			var_7b352087.var_df5776d8 thread function_2db2bf79();
		}
		if(i == 0)
		{
			level thread function_374ac18c(a_s_reels, i);
			continue;
		}
		level thread function_6bf381de(a_s_reels, i);
	}
}

/*
	Name: function_6bf381de
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x34A0
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 1055
*/
function function_6bf381de(a_s_reels, var_bee8e45)
{
	while(1)
	{
		a_s_reels[0] namespace_744abc1c::create_unitrigger();
		a_s_reels[0] waittill("trigger_activated");
		function_972992c4(a_s_reels, 1);
		a_s_reels[0].var_df5776d8 function_ffa9011b(var_bee8e45);
		function_972992c4(a_s_reels, 0);
	}
}

/*
	Name: function_374ac18c
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3550
	Size: 0x180
	Parameters: 2
	Flags: None
	Line Number: 1077
*/
function function_374ac18c(a_s_reels, var_bee8e45)
{
	a_s_reels[0].var_df5776d8 setcandamage(1);
	while(1)
	{
		a_s_reels[0].var_df5776d8.health = 1000000;
		a_s_reels[0].var_df5776d8 waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(!isdefined(attacker) || !isPlayer(attacker))
		{
			continue;
		}
		function_972992c4(a_s_reels, 1);
		a_s_reels[0].var_df5776d8 function_ffa9011b(var_bee8e45);
		function_972992c4(a_s_reels, 0);
	}
}

/*
	Name: function_ffa9011b
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x36D8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1104
*/
function function_ffa9011b(var_bee8e45)
{
	sound = "vox_grop_groph_radio_stem_" + var_bee8e45 + 1;
	thread namespace_cc012897::Send(sound);
	self playsoundwithnotify(sound, "sounddone");
	self waittill("sounddone");
}

/*
	Name: function_972992c4
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3750
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 1122
*/
function function_972992c4(a_s_reels, b_on)
{
	foreach(var_7b352087 in a_s_reels)
	{
		if(isdefined(var_7b352087.var_df5776d8))
		{
			var_7b352087.var_df5776d8.var_a02b0d5a = b_on;
		}
	}
}

/*
	Name: function_2db2bf79
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3810
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1143
*/
function function_2db2bf79()
{
	while(1)
	{
		if(isdefined(self.var_a02b0d5a) && self.var_a02b0d5a)
		{
			self RotateRoll(-30, 0.2);
		}
		wait(0.2);
	}
}

/*
	Name: function_e437a08f
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3868
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1165
*/
function function_e437a08f()
{
	var_2c4303b6 = struct::get("ee_music_box");
	level.var_6d5fd229 = util::spawn_model("p7_fxanim_zm_castle_music_box_mod", var_2c4303b6.origin, var_2c4303b6.angles);
	level.var_6d5fd229 useanimtree(-1);
}

/*
	Name: function_4eb3851
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x38F8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 1182
*/
function function_4eb3851()
{
	level thread function_4e9df779();
	while(1)
	{
		level.var_6d5fd229 namespace_744abc1c::create_unitrigger();
		level.var_6d5fd229 waittill("trigger_activated");
		level flag::set("ee_music_box_turning");
		zm_unitrigger::unregister_unitrigger(level.var_6d5fd229.s_unitrigger);
		level.var_6d5fd229 playsound("mus_samantha_musicbox");
		wait(36);
		level flag::clear("ee_music_box_turning");
		level waittill("hash_22c84c8b");
	}
}

/*
	Name: function_4e9df779
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x39E0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1208
*/
function function_4e9df779()
{
	while(1)
	{
		level.var_6d5fd229 animation::first_frame("p7_fxanim_zm_castle_music_box_anim");
		level flag::wait_till("ee_music_box_turning");
		while(level flag::get("ee_music_box_turning"))
		{
			level.var_6d5fd229 animation::Play("p7_fxanim_zm_castle_music_box_anim");
		}
		level notify("hash_22c84c8b");
	}
}

/*
	Name: function_7998107
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3A90
	Size: 0x218
	Parameters: 0
	Flags: None
	Line Number: 1232
*/
function function_7998107()
{
	level.var_37c0c840 = [];
	for(i = 0; i < 3; i++)
	{
		var_d5409ac0 = struct::get("ee_flying_skull_" + i);
		level.var_37c0c840[i] = util::spawn_model("rune_prison_death_skull", var_d5409ac0.origin, var_d5409ac0.angles);
		level.var_37c0c840[i] flag::init("skull_revealed");
		level.var_37c0c840[i] setcandamage(1);
		level.var_37c0c840[i] thread function_e26b6053();
		level.var_37c0c840[i] thread function_27da29cb();
		level.var_37c0c840[i] SetInvisibleToAll();
	}
	players = level.activePlayers;
	foreach(player in players)
	{
		player thread function_5c351802();
	}
	callback::on_spawned(&function_5c351802);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5c351802
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3CB0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1265
*/
function function_5c351802()
{
	for(i = 0; i < 3; i++)
	{
		self thread function_2f183e13(i);
	}
}

/*
	Name: function_2f183e13
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3D00
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1283
*/
function function_2f183e13(n_index)
{
	level.var_37c0c840[n_index] endon("hash_7a2f636b");
	if(!isdefined(level.var_37c0c840[n_index]))
	{
		return;
	}
	if(level.var_37c0c840[n_index] flag::get("skull_revealed"))
	{
		return;
	}
	while(1)
	{
		self waittill("hash_95b677dc");
		if(self bgb::is_active("zm_bgb_in_plain_sight"))
		{
			level.var_37c0c840[n_index] setvisibletoplayer(self);
			self waittill("hash_1565b2f5");
			level.var_37c0c840[n_index] setinvisibletoplayer(self);
		}
	}
}

/*
	Name: function_e26b6053
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3E00
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 1316
*/
function function_e26b6053()
{
	var_7b63bfc8 = 0;
	while(!var_7b63bfc8)
	{
		self.health = 1000000;
		self waittill("damage", damage, attacker, dir, loc, type, model, tag, part, weapon, flags);
		if(isdefined(attacker) && isPlayer(attacker) && attacker bgb::is_active("zm_bgb_in_plain_sight"))
		{
			if(function_ab61ab31(weapon))
			{
				var_7b63bfc8 = 1;
			}
		}
	}
	function_44ea752c();
	self flag::set("skull_revealed");
	playFX(level._effect["def_explode"], self.origin);
	self delete();
}

/*
	Name: function_ab61ab31
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3FA0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1347
*/
function function_ab61ab31(weapon)
{
	return IsSubStr(weapon.name, "elemental_bow");
}

/*
	Name: function_44ea752c
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x3FE0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1362
*/
function function_44ea752c()
{
	if(!isdefined(level.var_a0554b26))
	{
		level.var_a0554b26 = 0;
	}
	function_dbc1fb93(level.var_a0554b26);
	level.var_a0554b26++;
	playsoundatposition("zmb_ee_skpower_" + level.var_a0554b26, (0, 0, 0));
	if(level.var_a0554b26 == 3)
	{
		level.var_9bf9e084 = 1;
	}
}

/*
	Name: function_dbc1fb93
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4068
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 1387
*/
function function_dbc1fb93(var_d237c2be)
{
	if(!isdefined(level.var_478986c0))
	{
		level.var_478986c0 = [];
	}
	var_fff40961 = struct::get("ee_skull_pile_" + var_d237c2be);
	level.var_478986c0[var_d237c2be] = util::spawn_model("rune_prison_death_skull", var_fff40961.origin, var_fff40961.angles);
	if(var_d237c2be == 2)
	{
		level.var_478986c0[var_d237c2be] thread function_67a47b1c();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_67a47b1c
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4138
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1413
*/
function function_67a47b1c()
{
	self namespace_744abc1c::create_unitrigger();
	self waittill("trigger_activated");
	if(level.var_9bf9e084 == 0)
	{
		return;
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	level.var_9bf9e084 = 0;
	playsoundatposition("zmb_ee_skpower_deactivate", (0, 0, 0));
	for(i = 0; i < 3; i++)
	{
		if(isdefined(level.var_478986c0[i]))
		{
			playFX(level._effect["def_explode"], level.var_478986c0[i].origin);
			level.var_478986c0[i] delete();
		}
		wait(0.5);
	}
	level thread function_3c992a71();
}

/*
	Name: function_3c992a71
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4278
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1446
*/
function function_3c992a71()
{
	level.var_a0554b26 = 0;
	level.var_478986c0 = [];
	level thread function_7998107();
}

/*
	Name: function_27da29cb
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x42B8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1463
*/
function function_27da29cb()
{
	self endon("hash_7a2f636b");
	var_43af6ca7 = self.origin[2];
	while(1)
	{
		n_current_time = GetTime();
		n_offset = sin(n_current_time * 0.1) * 16;
		v_origin = self.origin;
		self.origin = (v_origin[0], v_origin[1], var_43af6ca7 + n_offset);
		wait(0.05);
	}
}

/*
	Name: function_769b2ff
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4380
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 1487
*/
function function_769b2ff()
{
	level.var_23825200 = [];
	for(i = 0; i < 3; i++)
	{
		s_mechz_claw = struct::get("ee_claw_" + i + "_start");
		level.var_23825200[i] = util::spawn_model("c_t6_zom_mech_claw", s_mechz_claw.origin, s_mechz_claw.angles);
		level.var_23825200[i] flag::init("mechz_claw_revealed");
		level.var_23825200[i] setcandamage(1);
		level.var_23825200[i] thread function_e249cd7(i);
	}
}

/*
	Name: function_5d2ff09a
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x44B0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1510
*/
function function_5d2ff09a()
{
	for(i = 0; i < 3; i++)
	{
		function_c02b51fb(i);
	}
}

/*
	Name: function_c02b51fb
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4500
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 1528
*/
function function_c02b51fb(n_index)
{
	level.var_23825200[n_index] endon("hash_8a2ede71");
	if(level.var_23825200[n_index] flag::get("mechz_claw_revealed"))
	{
		return;
	}
	while(1)
	{
		self waittill("hash_95b677dc");
		if(self bgb::is_active("zm_bgb_in_plain_sight"))
		{
			level.var_23825200[n_index] setvisibletoplayer(self);
			self waittill("hash_1565b2f5");
			level.var_23825200[n_index] setinvisibletoplayer(self);
		}
	}
}

/*
	Name: function_e249cd7
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x45E8
	Size: 0x330
	Parameters: 1
	Flags: None
	Line Number: 1557
*/
function function_e249cd7(n_index)
{
	var_8b9b7897 = 0;
	while(!var_8b9b7897)
	{
		self.health = 1000000;
		var_354439b5 = self function_64e6de56();
		if(!var_354439b5)
		{
			continue;
		}
		var_8b9b7897 = 1;
		self playsound("zmb_ee_mechz_imp");
		self setcandamage(0);
	}
	self flag::set("mechz_claw_revealed");
	self setvisibletoall();
	var_7ddcf23 = struct::get("ee_claw_" + n_index + "_fell");
	self moveto(var_7ddcf23.origin, 0.333);
	self thread function_4767e6ca();
	wait(0.333);
	self setcandamage(1);
	var_f9f3d790 = 0;
	while(!var_f9f3d790)
	{
		self.health = 1000000;
		var_354439b5 = self function_64e6de56();
		if(!var_354439b5)
		{
			continue;
		}
		var_f9f3d790 = 1;
		self playsound("zmb_ee_mechz_activate");
		self PlayLoopSound("zmb_ee_mechz_fire_lp", 0.1);
	}
	var_197d929 = struct::get("ee_claw_" + n_index + "_shot");
	self thread function_d23efff2();
	PlayFXOnTag(level._effect["mechz_rocket_punch"], self, "fx_rocket");
	self moveto(var_197d929.origin, 1);
	wait(1);
	self playsound("zmb_ee_mechz_explode");
	playFX(level._effect["def_explode"], self.origin);
	self notify("hash_d23efff2");
	self delete();
}

/*
	Name: function_4767e6ca
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4920
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1613
*/
function function_4767e6ca()
{
	self waittill("movedone");
	self playsound("zmb_ee_mechz_fallimp");
}

/*
	Name: function_64e6de56
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4958
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 1629
*/
function function_64e6de56()
{
	self waittill("damage", damage, attacker, direction_vec, point, type, tagName, modelName, partName, weapon, inflictor);
	if(type === "MOD_GRENADE" || type === "MOD_GRENADE_SPLASH" || type === "MOD_EXPLOSIVE" || type === "MOD_EXPLOSIVE_SPLASH")
	{
		return 0;
	}
	if(function_ab61ab31(weapon))
	{
		var_64deb4b = spawn("script_origin", point);
		if(!var_64deb4b istouching(self))
		{
			var_64deb4b delete();
			return 0;
		}
		var_64deb4b delete();
	}
	if(!isdefined(attacker) || !isPlayer(attacker))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_d23efff2
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4AE8
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 1663
*/
function function_d23efff2()
{
	self endon("hash_d23efff2");
	while(1)
	{
		a_enemies = function_846256f4("axis");
		foreach(e_enemy in a_enemies)
		{
			dist2 = DistanceSquared(self.origin, e_enemy.origin);
			if(dist2 < 16384)
			{
				if(isdefined(e_enemy) && isalive(e_enemy))
				{
					if(isdefined(e_enemy.archetype) && e_enemy.archetype == "mechz")
					{
						e_enemy DoDamage(self.health * 777, e_enemy.origin);
						if(!isdefined(level.var_708b5a49))
						{
							level.var_708b5a49 = 1;
						}
						else
						{
							level.var_708b5a49++;
						}
						if(level.var_708b5a49 == 3)
						{
							function_90b13c3d();
							continue;
						}
					}
					if(isdefined(e_enemy.archetype) && e_enemy.archetype == "zombie")
					{
						e_enemy thread zombie_death::do_gib();
					}
				}
			}
		}
		wait(0.2);
	}
}

/*
	Name: function_d249c76c
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4CF0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 1714
*/
function function_d249c76c()
{
	self Attach("c_t6_zom_mech_claw_hat", "j_head");
}

/*
	Name: function_90b13c3d
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4D28
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1729
*/
function function_90b13c3d()
{
	players = level.activePlayers;
	foreach(player in players)
	{
		player function_d249c76c();
	}
	level flag::set("ee_claw_hat");
	callback::on_spawned(&function_d249c76c);
}

/*
	Name: function_b8645c20
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4E08
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1750
*/
function function_b8645c20()
{
	level.var_91b525ed = 0;
	function_79e1bd74(0);
}

/*
	Name: function_79e1bd74
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4E38
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 1766
*/
function function_79e1bd74(n_level)
{
	a_str_models = Array("p7_zm_ctl_newspaper_01_parade", "p7_zm_ctl_newspaper_01_attacks", "p7_zm_ctl_newspaper_01_outbreak");
	STR_MODEL = a_str_models[n_level];
	if(!isdefined(level.var_31e6a027))
	{
		s_newspaper = struct::get("ee_newspaper");
		level.var_31e6a027 = util::spawn_model(STR_MODEL, s_newspaper.origin, s_newspaper.angles);
	}
	else
	{
		level.var_31e6a027 SetModel(STR_MODEL);
	}
}

/*
	Name: function_fd2e0e37
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4F20
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1791
*/
function function_fd2e0e37()
{
	level.var_f4166c4f = 0;
	s_loc = struct::get("ee_plunger_pickup");
	level.var_163864b7 = util::spawn_model("wpn_t7_zmb_dlc1_plunger_world", s_loc.origin, s_loc.angles);
	level thread function_4811d22b();
	function_56e07512(s_loc);
}

/*
	Name: function_4811d22b
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x4FD0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1810
*/
function function_4811d22b()
{
	level endon("hash_4811d22b");
	level.var_163864b7 SetInvisibleToAll();
	while(1)
	{
		level flag::wait_till("plunger_teleport_on");
		level.var_163864b7 setvisibletoall();
		level flag::wait_till_clear("plunger_teleport_on");
		level.var_163864b7 SetInvisibleToAll();
	}
}

/*
	Name: function_b98927d4
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5078
	Size: 0x130
	Parameters: 10
	Flags: None
	Line Number: 1833
*/
function function_b98927d4(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(level flag::get("ee_claw_hat") && eAttacker.archetype == "mechz")
	{
		switch(sMeansOfDeath)
		{
			case "MOD_MELEE":
			{
				iDamage = iDamage * 0.5;
				break;
			}
			case "MOD_BURNED":
			{
				iDamage = iDamage * 0.5;
				break;
			}
			case "MOD_PROJECTILE_SPLASH":
			{
				iDamage = iDamage * 0.5;
				break;
			}
		}
		iDamage = Int(iDamage);
		return iDamage;
	}
	return -1;
}

/*
	Name: function_52c08eab
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x51B0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 1871
*/
function function_52c08eab()
{
	while(1)
	{
		level flag::wait_till("ee_disco_inferno");
		function_1401a672(level.var_818b7815);
		level.var_818b7815.var_c86771bb playsound("mus_ee_disco");
		level thread LUI::screen_flash(0.15, 0.1, 0.5, 1, "white");
		wait(0.15);
		exploder::exploder("disco_lgt");
		wait(52);
		exploder::exploder_stop("disco_lgt");
		level flag::clear("ee_disco_inferno");
		function_1401a672(level.var_818b7815);
	}
}

/*
	Name: function_7c237ecb
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x52D8
	Size: 0x2F0
	Parameters: 1
	Flags: None
	Line Number: 1898
*/
function function_7c237ecb(var_f00386ff)
{
	if(!isdefined(var_f00386ff))
	{
		var_f00386ff = 0;
	}
	var_c27c9236 = struct::get("ee_plant_present");
	var_15cfdc94 = util::spawn_model("p7_zm_ctl_plant_decor_sprout", var_c27c9236.origin, var_c27c9236.angles);
	var_15cfdc94 namespace_744abc1c::create_unitrigger();
	var_15cfdc94 waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_15cfdc94.s_unitrigger);
	var_15cfdc94 Hide();
	var_1f6712bd = struct::get("ee_plant_past");
	var_4bb0e877 = util::spawn_model("p7_zm_ctl_plant_decor_sprout", var_1f6712bd.origin, var_1f6712bd.angles);
	var_4bb0e877 Hide();
	var_1f6712bd namespace_744abc1c::create_unitrigger();
	var_1f6712bd waittill("trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_1f6712bd.s_unitrigger);
	var_4bb0e877 show();
	var_f6cbed0f = struct::get("ee_plant_gobblegum");
	var_15cfdc94 SetModel("p7_zm_ctl_plant_decor_grown");
	var_15cfdc94 show();
	var_acadbb15 = util::spawn_model("p7_zm_zod_bubblegum_machine_gumball_white", var_f6cbed0f.origin, var_f6cbed0f.angles);
	var_15cfdc94 namespace_744abc1c::create_unitrigger();
	var_15cfdc94 waittill("trigger_activated", player);
	zm_unitrigger::unregister_unitrigger(var_15cfdc94.s_unitrigger);
	var_acadbb15 delete();
	player.var_b287be = bgb::function_d51db887();
	player thread bgb::bgb_gumball_anim(player.var_b287be, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: gravity_trap_spike_watcher
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x55D0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1941
*/
function gravity_trap_spike_watcher(var_eea11f9d)
{
	if(isdefined(level.var_714fae39) && level.var_714fae39 && level flag::get("ee_power_clocktower") == 0)
	{
		var_3d98ac09 = GetEnt("clocktower_power_trig", "targetname");
		if(var_eea11f9d istouching(var_3d98ac09))
		{
			level flag::set("ee_power_clocktower");
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9e325d85
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5688
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 1965
*/
function function_9e325d85()
{
	for(i = 0; i < 4; i++)
	{
		var_634fac89 = GetEnt("ee_undercroft_wallrun_" + i, "targetname");
		var_634fac89 thread function_81d41eb8(i);
	}
	var_3294f1d9 = GetEnt("ee_undercroft_wallrun_reset", "targetname");
	var_3294f1d9 thread function_8d508e48();
}

/*
	Name: function_779bfe1e
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5750
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1986
*/
function function_779bfe1e()
{
	exploder::exploder("fxexp_600");
	level flag::set("ee_power_wallrun_teleport");
	level clientfield::set("sndUEB", 1);
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_421bb7db
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x57B8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2006
*/
function function_421bb7db()
{
	exploder::stop_exploder("fxexp_600");
	level flag::clear("ee_power_wallrun_teleport");
	level clientfield::set("sndUEB", 0);
}

/*
	Name: function_81d41eb8
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5820
	Size: 0x170
	Parameters: 1
	Flags: None
	Line Number: 2023
*/
function function_81d41eb8(var_7f701981)
{
	while(1)
	{
		self waittill("trigger", player);
		if(level flag::get("ee_power_wallrun_teleport") == 0)
		{
			continue;
		}
		if(isdefined(player.var_48391945) && var_7f701981 != player.var_48391945)
		{
			var_32ceceb2 = function_6ad38393(player, var_7f701981);
			if(isdefined(player.var_6670513f) && player.var_6670513f == var_32ceceb2)
			{
				player.var_130b9781++;
			}
			else if(!isdefined(player.var_6670513f))
			{
				player.var_130b9781 = 1;
			}
			player.var_6670513f = var_32ceceb2;
		}
		if(player.var_130b9781 === 8)
		{
			function_27b3a99c(player);
		}
		player.var_48391945 = var_7f701981;
	}
}

/*
	Name: function_8d508e48
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5998
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2063
*/
function function_8d508e48()
{
	while(1)
	{
		self waittill("trigger", player);
		player.var_130b9781 = 0;
		player.var_48391945 = undefined;
	}
	return;
}

/*
	Name: function_6ad38393
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x59E8
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 2084
*/
function function_6ad38393(player, var_7f701981)
{
	if(player.var_48391945 > var_7f701981 || (player.var_48391945 == 0 && var_7f701981 == 3))
	{
		return 1;
	}
	if(player.var_48391945 < var_7f701981 || (var_7f701981 == 0 && player.var_48391945 == 3))
	{
		return 0;
	}
}

/*
	Name: function_27b3a99c
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5A88
	Size: 0x228
	Parameters: 1
	Flags: None
	Line Number: 2106
*/
function function_27b3a99c(player)
{
	level.var_f4166c4f++;
	level flag::set("plunger_teleport_on");
	zm_zonemgr::enable_zone("zone_past_laboratory");
	visionset_mgr::activate("overlay", "zm_factory_teleport", player, level.n_teleport_delay, level.n_teleport_delay);
	s_dest = struct::get("ee_teleport_to_plunger_" + player.characterindex, "targetname");
	function_aaacffb2(player, s_dest);
	wait(0.05);
	player clientfield::set_to_player("ee_quest_back_in_time_postfx", 1);
	var_f9d5e23a = player hasweapon(GetWeapon("knife_plunger"));
	wait(10);
	s_return = struct::get("ee_teleport_return_from_plunger_" + player.characterindex, "targetname");
	player clientfield::set_to_player("ee_quest_back_in_time_postfx", 0);
	visionset_mgr::activate("overlay", "zm_factory_teleport", player, level.n_teleport_delay, level.n_teleport_delay);
	function_aaacffb2(player, s_return);
	level.var_f4166c4f--;
	if(level.var_f4166c4f == 0)
	{
		level flag::clear("plunger_teleport_on");
	}
	function_421bb7db();
}

/*
	Name: function_aaacffb2
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x5CB8
	Size: 0x4D0
	Parameters: 2
	Flags: None
	Line Number: 2140
*/
function function_aaacffb2(player, s_dest)
{
	var_daad3c3c = VectorScale((0, 0, 1), 49);
	var_6b55b1c4 = VectorScale((0, 0, 1), 20);
	var_3abe10e2 = (0, 0, 0);
	var_d3263bfe = GetEnt("teleport_room_" + player.characterindex, "targetname");
	player zm_utility::create_streamer_hint(s_dest.origin, s_dest.angles, 0.25);
	if(isdefined(var_d3263bfe))
	{
		visionset_mgr::deactivate("overlay", "zm_trap_electric", player);
		visionset_mgr::activate("overlay", "zm_factory_teleport", player);
		player disableOffhandWeapons();
		player DisableWeapons();
		if(player GetStance() == "prone")
		{
			desired_origin = var_d3263bfe.origin + var_daad3c3c;
		}
		else if(player GetStance() == "crouch")
		{
			desired_origin = var_d3263bfe.origin + var_6b55b1c4;
		}
		else
		{
			desired_origin = var_d3263bfe.origin + var_3abe10e2;
		}
		player.var_39386de = spawn("script_origin", player.origin);
		player.var_39386de.angles = player.angles;
		player LinkTo(player.var_39386de);
		player.var_39386de.origin = desired_origin;
		player FreezeControls(1);
		util::wait_network_frame();
		if(isdefined(player))
		{
			util::setClientSysState("levelNotify", "black_box_start", player);
			player.var_39386de.angles = var_d3263bfe.angles;
		}
	}
	wait(2);
	s_dest thread namespace_fa1b0620::teleport_nuke(undefined, 300);
	for(i = 0; i < level.activePlayers.size; i++)
	{
		util::setClientSysState("levelNotify", "black_box_end", level.activePlayers[i]);
	}
	util::wait_network_frame();
	if(!isdefined(player))
	{
		return;
	}
	player Unlink();
	if(isdefined(player.var_39386de))
	{
		player.var_39386de delete();
		player.var_39386de = undefined;
	}
	visionset_mgr::deactivate("overlay", "zm_factory_teleport", player);
	player enableWeapons();
	player EnableOffhandWeapons();
	player SetOrigin(s_dest.origin);
	player SetPlayerAngles(s_dest.angles);
	player FreezeControls(0);
	player thread namespace_fa1b0620::teleport_aftereffects();
	player zm_utility::clear_streamer_hint();
}

/*
	Name: function_56e07512
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6190
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 2214
*/
function function_56e07512(s_loc)
{
	s_loc.unitrigger_stub = spawnstruct();
	s_loc.unitrigger_stub.origin = s_loc.origin;
	s_loc.unitrigger_stub.angles = s_loc.angles;
	s_loc.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	s_loc.unitrigger_stub.cursor_hint = "HINT_NOICON";
	s_loc.unitrigger_stub.script_width = 128;
	s_loc.unitrigger_stub.script_height = 128;
	s_loc.unitrigger_stub.script_length = 128;
	s_loc.unitrigger_stub.require_look_at = 1;
	s_loc.unitrigger_stub.prompt_and_visibility_func = &function_dbab79d5;
	zm_unitrigger::register_static_unitrigger(s_loc.unitrigger_stub, &function_6527501a);
}

/*
	Name: function_dbab79d5
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6300
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 2239
*/
function function_dbab79d5(player)
{
	b_is_invis = 0;
	var_f9d5e23a = player hasweapon(GetWeapon("knife_plunger"));
	if(var_f9d5e23a)
	{
		b_is_invis = 1;
	}
	if(level.var_f4166c4f == 0)
	{
		b_is_invis = 1;
	}
	self setinvisibletoplayer(player, b_is_invis);
	return !b_is_invis;
}

/*
	Name: function_6527501a
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x63B0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 2265
*/
function function_6527501a()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player.IS_DRINKING > 0)
		{
			continue;
		}
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		var_f9d5e23a = player hasweapon(GetWeapon("knife_plunger"));
		if(var_f9d5e23a)
		{
			continue;
		}
		if(level.var_f4166c4f == 0)
		{
			continue;
		}
		level thread function_b7365949(self.stub, player);
		break;
	}
}

/*
	Name: function_b7365949
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x64B0
	Size: 0x160
	Parameters: 2
	Flags: None
	Line Number: 2306
*/
function function_b7365949(trig_stub, player)
{
	level notify("hash_4811d22b");
	level.var_163864b7 delete();
	function_421bb7db();
	zm_spawner::register_zombie_death_event_callback(&function_8d95ec46);
	players = level.activePlayers;
	foreach(player in level.activePlayers)
	{
		if(isdefined(player) && isalive(player))
		{
			player thread award_plunger();
		}
	}
	callback::on_spawned(&award_plunger);
	trig_stub zm_unitrigger::run_visibility_function_for_all_triggers();
}

/*
	Name: award_plunger
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6618
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 2334
*/
function award_plunger()
{
	self.widows_wine_knife_override = &function_9ce92341;
	self zm_melee_weapon::award_melee_weapon("knife_plunger");
	self thread function_9daec9e3();
	self thread plunger_lost();
}

/*
	Name: function_9ce92341
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6690
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2352
*/
function function_9ce92341()
{
}

/*
	Name: plunger_lost
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x66A0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2366
*/
function plunger_lost()
{
	self endon("disconnect");
	self endon("death");
	self waittill("bled_out");
	self.widows_wine_knife_override = undefined;
}

/*
	Name: function_9daec9e3
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x66E0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2384
*/
function function_9daec9e3()
{
	self endon("disconnect");
	self endon("death");
	w_plunger = GetWeapon("knife_plunger");
	while(1)
	{
		self waittill("weapon_melee", weapon);
		if(weapon == w_plunger && isdefined(self.var_ea5424ae) && self.var_ea5424ae > 0)
		{
			self clientfield::increment_to_player("plunger_charged_strike");
		}
	}
}

/*
	Name: charge_plunger
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6790
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2409
*/
function charge_plunger(attacker)
{
	if(!isdefined(attacker.var_ea5424ae))
	{
		attacker.var_ea5424ae = 0;
	}
	attacker.var_ea5424ae++;
	/#
		iprintln("Dev Block strings are not supported" + attacker.var_ea5424ae);
	#/
	wait(60);
	attacker.var_ea5424ae--;
	/#
		iprintln("Dev Block strings are not supported" + attacker.var_ea5424ae);
	#/
}

/*
	Name: function_8d95ec46
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6848
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 2436
*/
function function_8d95ec46(e_attacker)
{
	w_plunger = GetWeapon("knife_plunger");
	if(w_plunger == self.damageWeapon)
	{
		self zombie_utility::zombie_head_gib();
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_f10f1879
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x68B0
	Size: 0x170
	Parameters: 12
	Flags: None
	Line Number: 2459
*/
function function_f10f1879(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	w_plunger = GetWeapon("knife_plunger");
	if(weapon == w_plunger && isdefined(attacker) && isPlayer(attacker) && isdefined(attacker.var_ea5424ae) && attacker.var_ea5424ae > 0)
	{
		damage = 777 * self.health;
		if(isdefined(self))
		{
			self thread function_beeeab78();
		}
		level.var_91b525ed++;
		if(level.var_91b525ed >= 16)
		{
			function_79e1bd74(2);
		}
		else if(level.var_91b525ed >= 4)
		{
			function_79e1bd74(1);
		}
		return damage;
	}
	return -1;
}

/*
	Name: function_beeeab78
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6A28
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 2493
*/
function function_beeeab78()
{
	self clientfield::set("plunger_exploding_ai", 1);
	self zombie_utility::zombie_eye_glow_stop();
	wait(0.15);
	self ghost();
	self util::delay(0.15, undefined, &zm_utility::self_delete);
}

/*
	Name: function_5c600852
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6AB8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2512
*/
function function_5c600852()
{
	level.var_89ad28cd = 0;
	var_d959ac05 = GetEntArray("hs_gramophone", "targetname");
	Array::thread_all(var_d959ac05, &function_db46cccd);
	while(1)
	{
		level waittill("hash_9c9fb305");
		if(level.var_89ad28cd == var_d959ac05.size)
		{
			break;
		}
	}
	level thread zm_audio::sndmusicsystem_playstate("requiem");
	return;
}

/*
	Name: function_db46cccd
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6B70
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 2539
*/
function function_db46cccd()
{
	self namespace_744abc1c::create_unitrigger();
	self PlayLoopSound("zmb_ee_gramophone_lp", 1);
	/#
		self thread namespace_744abc1c::function_8faf1d24(VectorScale((0, 0, 1), 255), "Dev Block strings are not supported");
	#/
	while(!(isdefined(self.b_activated) && self.b_activated))
	{
		self waittill("trigger_activated");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
		}
		if(!(isdefined(self.b_activated) && self.b_activated))
		{
			self.b_activated = 1;
			level.var_89ad28cd++;
			level notify("hash_9c9fb305");
			self StopLoopSound(0.2);
		}
		self playsound("zmb_ee_gramophone_activate");
	}
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	return;
}

/*
	Name: function_553b8e23
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6CE0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 2576
*/
function function_553b8e23()
{
	level.var_51d5c50c = 0;
	var_c911c0a2 = struct::get_array("hs_bear", "targetname");
	Array::thread_all(var_c911c0a2, &function_4b02c768);
	while(1)
	{
		level waittill("hash_c3f82290");
		if(level.var_51d5c50c == var_c911c0a2.size)
		{
			break;
		}
	}
	level thread zm_audio::sndmusicsystem_playstate("dead_again");
	level thread audio::unlockfrontendmusic("mus_dead_again_intro");
}

/*
	Name: function_4b02c768
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6DB8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 2603
*/
function function_4b02c768()
{
	e_origin = spawn("script_origin", self.origin);
	e_origin namespace_744abc1c::create_unitrigger();
	e_origin PlayLoopSound("zmb_ee_bear_lp", 1);
	/#
		e_origin thread namespace_744abc1c::function_8faf1d24(VectorScale((0, 0, 1), 255), "Dev Block strings are not supported");
	#/
	while(!(isdefined(e_origin.b_activated) && e_origin.b_activated))
	{
		e_origin waittill("trigger_activated");
		if(isdefined(level.musicsystem.currentplaytype) && level.musicsystem.currentplaytype >= 4 || (isdefined(level.musicsystemoverride) && level.musicsystemoverride))
		{
			continue;
		}
		if(!(isdefined(e_origin.b_activated) && e_origin.b_activated))
		{
			e_origin.b_activated = 1;
			level.var_51d5c50c++;
			level notify("hash_c3f82290");
			e_origin StopLoopSound(0.2);
		}
		e_origin playsound("zmb_ee_bear_activate");
	}
	zm_unitrigger::unregister_unitrigger(e_origin.s_unitrigger);
}

/*
	Name: spare_change
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x6F80
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2640
*/
function spare_change()
{
	a_triggers = GetEntArray("audio_bump_trigger", "targetname");
	foreach(t_audio_bump in a_triggers)
	{
		if(t_audio_bump.script_sound === "zmb_perks_bump_bottle")
		{
			t_audio_bump thread check_for_change();
		}
	}
}

/*
	Name: check_for_change
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7060
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 2662
*/
function check_for_change()
{
	while(1)
	{
		self waittill("trigger", e_player);
		if(e_player GetStance() == "prone")
		{
			e_player zm_score::add_to_player_score(100);
			zm_utility::play_sound_at_pos("purchase", e_player.origin);
			break;
		}
		wait(0.15);
	}
}

/*
	Name: function_d6026710
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7108
	Size: 0x3C0
	Parameters: 0
	Flags: None
	Line Number: 2687
*/
function function_d6026710()
{
	/#
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_3d627178);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_f0dc1bf3);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 0, &function_3388f3a3);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_3388f3a3);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 2, &function_3388f3a3);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_239f31ac);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_8f84cfff);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_e6679107);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_71626c1a);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_c8b68402);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_14004ce0);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_5b000c75);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_4e8ebeb2);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_d40e8eab);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_ce8b131c);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_71bd024b);
		level thread namespace_744abc1c::setup_devgui_func("Dev Block strings are not supported", "Dev Block strings are not supported", 1, &function_ad9da95f);
	#/
}

/*
	Name: function_f0dc1bf3
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x74D0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2720
*/
function function_f0dc1bf3(n_val)
{
	/#
		level flag::set("Dev Block strings are not supported");
	#/
}

/*
	Name: function_3d627178
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7508
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2737
*/
function function_3d627178(n_val)
{
	/#
		function_90b13c3d();
	#/
}

/*
	Name: function_ce8b131c
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7538
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 2754
*/
function function_ce8b131c(n_val)
{
	/#
		zm_spawner::register_zombie_death_event_callback(&function_8d95ec46);
		players = level.activePlayers;
		foreach(player in players)
		{
			player thread award_plunger();
		}
	#/
}

/*
	Name: function_3388f3a3
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7610
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2776
*/
function function_3388f3a3(n_val)
{
	/#
		function_79e1bd74(n_val);
	#/
}

/*
	Name: function_14004ce0
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7640
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2793
*/
function function_14004ce0(n_val)
{
	/#
		function_779bfe1e();
	#/
}

/*
	Name: function_5b000c75
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7670
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2810
*/
function function_5b000c75(n_val)
{
	/#
		function_421bb7db();
	#/
}

/*
	Name: function_ad9da95f
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x76A0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2827
*/
function function_ad9da95f(n_val)
{
	/#
		zm_zonemgr::enable_zone("Dev Block strings are not supported");
	#/
}

/*
	Name: function_4e8ebeb2
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x76D8
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2844
*/
function function_4e8ebeb2(n_val)
{
	/#
		players = level.activePlayers;
		foreach(player in players)
		{
			level thread function_27b3a99c(player);
		}
	#/
}

/*
	Name: function_d40e8eab
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7790
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2865
*/
function function_d40e8eab(n_val)
{
	/#
		players = level.activePlayers;
		foreach(player in players)
		{
			level thread charge_plunger(player);
		}
	#/
}

/*
	Name: function_71bd024b
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7848
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2886
*/
function function_71bd024b(n_val)
{
	/#
		level thread function_7c237ecb(1);
	#/
}

/*
	Name: function_239f31ac
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7880
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2903
*/
function function_239f31ac(n_val)
{
	/#
		level flag::set("Dev Block strings are not supported");
		return;
	#/
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8f84cfff
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x78B8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2922
*/
function function_8f84cfff(n_val)
{
	/#
		function_aa7c5ce2();
	#/
}

/*
	Name: function_e6679107
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x78E8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 2939
*/
function function_e6679107(n_val)
{
	/#
		function_4db73fa1();
	#/
}

/*
	Name: function_71626c1a
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7918
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2956
*/
function function_71626c1a(n_val)
{
	/#
		function_ec1f5e9(level.var_9f94326b, 1);
	#/
}

/*
	Name: function_c8b68402
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7950
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 2973
*/
function function_c8b68402(n_val)
{
	/#
		function_ec1f5e9(level.var_9f94326b, 9);
	#/
}

/*
	Name: function_c6930415
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7988
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 2990
*/
function function_c6930415(a_enemies)
{
	foreach(e_enemy in a_enemies)
	{
		if(!(isdefined(e_enemy.bowling_pin) && e_enemy.bowling_pin))
		{
			e_enemy.bowling_pin = 1;
			self.var_c2faf069 = self.var_c2faf069 + 1;
		}
	}
	return;
}

/*
	Name: function_7a56bf90
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7A58
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 3013
*/
function function_7a56bf90()
{
	self endon("bled_out");
	self endon("death");
	self endon("disconnect");
	self.var_c2faf069 = 0;
	self.var_e20230e3 = 0;
	for(;;)
	{
		self waittill("shield_juke_done");
		if(isdefined(self.hasRiotShield) && self.hasRiotShield)
		{
			if(self hasweapon(GetWeapon("castle_riotshield_upgraded")))
			{
				return;
			}
			if(self.var_c2faf069 >= 10)
			{
				self playsoundtoplayer("zmb_zod_ee_bowling_strike", self);
				self.var_e20230e3++;
			}
			else
			{
				self.var_e20230e3 = 0;
			}
			if(self.var_e20230e3 == 12)
			{
				self playsoundtoplayer("zmb_zod_ee_bowling_cheer", self);
				self zm_equipment::buy("castle_riotshield_upgraded");
				util::setClientSysState("aae_soulcounter", "&AAE_TIP_ROCKETSHIELD_UPGRADED_TITLE");
				self.b_has_upgraded_shield = 1;
				self.var_e20230e3 = 0;
				function_4f478a47();
				return;
			}
			self.var_c2faf069 = 0;
		}
	}
}

/*
	Name: function_4f478a47
	Namespace: namespace_61c0be00
	Checksum: 0x424F4353
	Offset: 0x7BE0
	Size: 0x82
	Parameters: 0
	Flags: None
	Line Number: 3063
*/
function function_4f478a47()
{
	if(isdefined(level.a_uts_craftables))
	{
		for(i = 0; i < level.a_uts_craftables.size; i++)
		{
			if(level.a_uts_craftables[i].equipname == "craft_shield_zm")
			{
				level.a_uts_craftables[i].weaponName = level.weaponRiotshieldUpgraded;
			}
		}
	}
}

