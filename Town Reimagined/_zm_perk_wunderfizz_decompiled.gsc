#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
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
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;

#namespace namespace_f52ad288;

/*
	Name: __init__sytem__
	Namespace: namespace_f52ad288
	Checksum: 0x53F35BCB
	Offset: 0x770
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 34
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_wunderfizz", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_f52ad288
	Checksum: 0x7A35891E
	Offset: 0x7B0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	level thread function_64487630();
}

/*
	Name: function_64487630
	Namespace: namespace_f52ad288
	Checksum: 0x4DB408E6
	Offset: 0x7D8
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function function_64487630()
{
	level.var_88cc4315 = 8;
	level.var_bbc12e1f = 3;
	level.var_8f4a68c2 = 1500;
	var_100683c7 = struct::get_array("harrybo21_wunderfizz", "targetname");
	if(isdefined(var_100683c7) && var_100683c7.size > 0)
	{
		for(i = 0; i < var_100683c7.size; i++)
		{
			var_100683c7[i] function_455f624();
		}
	}
	wait(getanimlength("o_zm_dlc1_vending_wonderfizz_turn_off"));
	var_2ebbab02 = function_db85b606();
	var_2ebbab02[RandomInt(var_2ebbab02.size)] thread function_9d641901();
	level thread function_d87a7dcc();
}

/*
	Name: function_d87a7dcc
	Namespace: namespace_f52ad288
	Checksum: 0x48BFC7F4
	Offset: 0x918
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_d87a7dcc()
{
	wait(0.05);
	while(1)
	{
		level flag::wait_till("power_on");
		var_2ebbab02 = function_db85b606();
		for(i = 0; i < var_2ebbab02.size; i++)
		{
			var_2ebbab02[i] notify("power_on");
		}
		level flag::wait_till_clear("power_on");
		var_2ebbab02 = function_db85b606();
		for(i = 0; i < var_2ebbab02.size; i++)
		{
			var_2ebbab02[i] notify("power_off");
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_db85b606
	Namespace: namespace_f52ad288
	Checksum: 0xB4FE11EE
	Offset: 0xA20
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_db85b606()
{
	return GetEntArray("harrybo21_wunderfizz", "script_noteworthy");
}

/*
	Name: function_452e4ee1
	Namespace: namespace_f52ad288
	Checksum: 0x961639F8
	Offset: 0xA50
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_452e4ee1()
{
	var_d2899a41 = function_db85b606();
	if(!isdefined(var_d2899a41) || var_d2899a41.size < 1)
	{
		return undefined;
	}
	Array = [];
	for(i = 0; i < var_d2899a41.size; i++)
	{
		if(isdefined(var_d2899a41[i].occupied) && var_d2899a41[i].occupied)
		{
			continue;
		}
		Array[Array.size] = var_d2899a41[i];
	}
	if(!isdefined(Array) || Array.size < 1)
	{
		return undefined;
	}
	return Array;
}

/*
	Name: function_455f624
	Namespace: namespace_f52ad288
	Checksum: 0xB1081C4D
	Offset: 0xB40
	Size: 0x2C0
	Parameters: 0
	Flags: None
	Line Number: 173
*/
function function_455f624()
{
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 30), 0, 40, 80);
	trigger.script_noteworthy = "harrybo21_wunderfizz";
	trigger.occupied = 1;
	trigger.active = 0;
	trigger.Used = 0;
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("You must turn the Power on first!");
	machine = spawn("script_model", self.origin);
	machine.angles = self.angles;
	machine SetModel("p7_zm_vending_wonder");
	machine useanimtree(-1);
	machine.collision = spawn("script_model", self.origin, 1);
	machine.collision.angles = self.angles;
	machine.collision SetModel("zm_collision_perks1");
	machine.collision.script_noteworthy = "clip";
	machine.collision disconnectpaths();
	trigger.linked_model = machine;
	trigger thread function_57449bb1();
	trigger thread function_34696145();
	trigger thread function_9c110491(machine);
}

/*
	Name: function_34696145
	Namespace: namespace_f52ad288
	Checksum: 0x56058576
	Offset: 0xE08
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function function_34696145()
{
	wait(0.05);
	while(1)
	{
		self waittill("power_on");
		if(isdefined(self.occupied) && self.occupied)
		{
			self function_d567b40f();
		}
		self waittill("power_off");
		self function_fcd1fd4e();
	}
}

/*
	Name: function_9d641901
	Namespace: namespace_f52ad288
	Checksum: 0xBFC86065
	Offset: 0xE80
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 236
*/
function function_9d641901(activate)
{
	self setHintString("");
	wait(0.05);
	self.linked_model ShowPart("ball_jnt");
	self.linked_model AnimScripted("o_zm_dlc1_vending_wonderfizz_turn_on", self.linked_model.origin, self.linked_model.angles, "o_zm_dlc1_vending_wonderfizz_turn_on");
	wait(getanimlength("o_zm_dlc1_vending_wonderfizz_turn_on"));
	self.occupied = 1;
	self.Used = 0;
	self setHintString("You must turn the Power on first!");
	if(isdefined(activate) && activate)
	{
		self function_d567b40f();
	}
	self thread function_f5ef957f(self.linked_model.origin);
}

/*
	Name: function_f5ef957f
	Namespace: namespace_f52ad288
	Checksum: 0x8714375C
	Offset: 0xFC8
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 263
*/
function function_f5ef957f(origin)
{
	if(isdefined(self.fx_obj))
	{
		return;
	}
	self.fx_obj = spawn("script_model", origin);
	self.fx_obj.angles = VectorScale((-1, 0, 0), 90);
	self.fx_obj SetModel("tag_origin");
	PlayFXOnTag("zombie/fx_wonder_fizz_lightning_all", self.fx_obj, "tag_origin");
	while(isdefined(self.fx_obj))
	{
		playsoundatposition("zmb_rand_perk_impact", origin);
		playsoundatposition("zmb_rand_perk_electric_strike", origin);
		wait(5);
	}
}

/*
	Name: function_57449bb1
	Namespace: namespace_f52ad288
	Checksum: 0x4A039337
	Offset: 0x10C8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 291
*/
function function_57449bb1()
{
	if(isdefined(self.fx_obj))
	{
		self.fx_obj delete();
	}
	if(isdefined(self.active) && self.active)
	{
		self function_fcd1fd4e();
	}
	self setHintString("");
	self.linked_model AnimScripted("o_zm_dlc1_vending_wonderfizz_turn_off", self.linked_model.origin, self.linked_model.angles, "o_zm_dlc1_vending_wonderfizz_turn_off");
	wait(getanimlength("o_zm_dlc1_vending_wonderfizz_turn_off"));
	self.linked_model HidePart("ball_jnt");
	self.occupied = 0;
	self.Used = 0;
	self setHintString("Der Wunderfizz is at another location");
	return;
}

/*
	Name: function_d567b40f
	Namespace: namespace_f52ad288
	Checksum: 0x325CEECA
	Offset: 0x1200
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 321
*/
function function_d567b40f()
{
	self.linked_model SetModel("p7_zm_vending_wonder_on");
	self setHintString("");
	self.linked_model AnimScripted("o_zm_dlc1_vending_wonderfizz_ball_spin_idle", self.linked_model.origin, self.linked_model.angles, "o_zm_dlc1_vending_wonderfizz_ball_spin_idle");
	self.active = 1;
	self setHintString("Press & hold ^3&&1^7 to buy Der Wunderfizz [Cost: " + level.var_8f4a68c2 + "]");
	self.linked_model set_light_state("active");
}

/*
	Name: set_light_state
	Namespace: namespace_f52ad288
	Checksum: 0xA3D9BB76
	Offset: 0x12F0
	Size: 0x460
	Parameters: 1
	Flags: None
	Line Number: 341
*/
function set_light_state(state)
{
	if(isdefined(self.green_light))
	{
		self.green_light delete();
	}
	if(isdefined(self.var_69272b1f))
	{
		self.var_69272b1f delete();
	}
	if(isdefined(self.var_f7d1b225))
	{
		self.var_f7d1b225 delete();
	}
	if(isdefined(self.var_6d3e5a85))
	{
		self.var_6d3e5a85 delete();
	}
	if(isdefined(self.var_d06565a8))
	{
		self.var_d06565a8 delete();
	}
	self.green_light = spawn("script_model", self GetTagOrigin("fx_light_green"));
	self.green_light SetModel("tag_origin");
	self.var_69272b1f = spawn("script_model", self GetTagOrigin("fx_light_red"));
	self.var_69272b1f SetModel("tag_origin");
	self.var_f7d1b225 = spawn("script_model", self GetTagOrigin("fx_light_bottom"));
	self.var_f7d1b225 SetModel("tag_origin");
	self.var_6d3e5a85 = spawn("script_model", self GetTagOrigin("fx_spotlight_left"));
	self.var_6d3e5a85 SetModel("tag_origin");
	self.var_d06565a8 = spawn("script_model", self GetTagOrigin("fx_spotlight_right"));
	self.var_d06565a8 SetModel("tag_origin");
	if(state == "active")
	{
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_green_light", self.green_light, "tag_origin");
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_green_light", self.var_f7d1b225, "tag_origin");
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_spotlight", self.var_6d3e5a85, "tag_origin");
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_spotlight", self.var_d06565a8, "tag_origin");
	}
	else if(state == "in_use")
	{
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_red_light", self.var_69272b1f, "tag_origin");
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_green_light", self.var_f7d1b225, "tag_origin");
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_spotlight", self.var_6d3e5a85, "tag_origin");
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_spotlight", self.var_d06565a8, "tag_origin");
	}
	else if(state == "inactive")
	{
		PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_red_light", self.var_f7d1b225, "tag_origin");
	}
}

/*
	Name: function_fcd1fd4e
	Namespace: namespace_f52ad288
	Checksum: 0x153EF01
	Offset: 0x1758
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 403
*/
function function_fcd1fd4e()
{
	self setHintString("");
	self.linked_model SetModel("p7_zm_vending_wonder");
	self.linked_model StopAnimScripted();
	self.active = 0;
	self setHintString("You must turn the Power on first!");
	self.linked_model set_light_state("inactive");
}

/*
	Name: function_9c110491
	Namespace: namespace_f52ad288
	Checksum: 0xDD87F192
	Offset: 0x1808
	Size: 0x518
	Parameters: 1
	Flags: None
	Line Number: 423
*/
function function_9c110491(machine)
{
	self endon("delete");
	self.Used = 0;
	while(1)
	{
		perk = undefined;
		self waittill("trigger", player);
		if(!player zm_score::can_player_purchase(level.var_8f4a68c2))
		{
			self playsound("evt_perk_deny");
			player zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		if(!player zm_utility::can_player_purchase_perk())
		{
			self playsound("evt_perk_deny");
			player zm_audio::create_and_play_dialog("general", "sigh");
			continue;
		}
		if(!isdefined(self.active) || !self.active)
		{
			continue;
		}
		if(!isdefined(self.occupied) || !self.occupied)
		{
			continue;
		}
		sound = "evt_bottle_dispense";
		playsoundatposition(sound, self.origin);
		player zm_score::minus_to_player_score(level.var_8f4a68c2);
		self setHintString("");
		machine set_light_state("in_use");
		machine AnimScripted("o_zm_dlc1_vending_wonderfizz_ball_spin_vend", machine.origin, machine.angles, "o_zm_dlc1_vending_wonderfizz_ball_spin_vend");
		self thread function_29f64862(machine GetTagOrigin("halo_right_jnt"), machine GetTagOrigin("halo_left_jnt"), machine.angles);
		perk = self function_c0d3aa68(player);
		self notify("hash_585fe0c8");
		machine AnimScripted("o_zm_dlc1_vending_wonderfizz_ball_spin_idle", machine.origin, machine.angles, "o_zm_dlc1_vending_wonderfizz_ball_spin_idle");
		if(self function_8a726b2c())
		{
			perk SetModel("wpn_t7_zmb_perk_bottle_bear_world");
			wait(2);
			perk MoveZ(500, 4, 3);
			wait(3);
			if(isdefined(perk.var_7733aebb))
			{
				perk.var_7733aebb delete();
			}
			perk delete();
			var_42ee74a3 = function_6c222e13();
			function_d4d8fd2c(self, var_42ee74a3);
			continue;
		}
		self.Used++;
		self setHintString("Press & hold ^3&&1^7 to take Perk");
		self thread function_eac9b5fd();
		self thread function_960646d5(player, perk.perk);
		self util::waittill_either("fizz_timeout", "fizz_taken");
		self setHintString("");
		if(isdefined(perk.var_7733aebb))
		{
			perk.var_7733aebb delete();
		}
		perk delete();
		wait(2);
		machine set_light_state("active");
		self setHintString("Press & hold ^3&&1^7 to buy Der Wunderfizz [Cost: " + level.var_8f4a68c2 + "]");
	}
}

/*
	Name: function_29f64862
	Namespace: namespace_f52ad288
	Checksum: 0x3DC23195
	Offset: 0x1D28
	Size: 0x170
	Parameters: 3
	Flags: None
	Line Number: 503
*/
function function_29f64862(origin1, origin2, angles)
{
	var_55dc498e = spawn("script_model", origin1);
	var_55dc498e.angles = angles;
	var_55dc498e SetModel("tag_origin");
	var_2fd9cf25 = spawn("script_model", origin2);
	var_2fd9cf25.angles = angles + VectorScale((0, 1, 0), 180);
	var_2fd9cf25 SetModel("tag_origin");
	PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_sparks", var_55dc498e, "tag_origin");
	PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_sparks", var_2fd9cf25, "tag_origin");
	self waittill("hash_585fe0c8");
	var_55dc498e delete();
	var_2fd9cf25 delete();
}

/*
	Name: function_eac9b5fd
	Namespace: namespace_f52ad288
	Checksum: 0x3F6F572C
	Offset: 0x1EA0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 528
*/
function function_eac9b5fd()
{
	self endon("hash_854e00c6");
	self endon("hash_a3af02c2");
	wait(15);
	self notify("hash_854e00c6");
	return;
}

/*
	Name: function_960646d5
	Namespace: namespace_f52ad288
	Checksum: 0xA427D843
	Offset: 0x1ED8
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 547
*/
function function_960646d5(player, perk)
{
	self endon("hash_a3af02c2");
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
}

/*
	Name: function_d4d8fd2c
	Namespace: namespace_f52ad288
	Checksum: 0xAB07211D
	Offset: 0x1F78
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 574
*/
function function_d4d8fd2c(var_1d6fc60c, var_42ee74a3)
{
	var_1d6fc60c function_57449bb1();
	var_42ee74a3 function_9d641901(1);
}

/*
	Name: function_6c222e13
	Namespace: namespace_f52ad288
	Checksum: 0x7493FAA7
	Offset: 0x1FC8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 590
*/
function function_6c222e13()
{
	var_d2899a41 = function_452e4ee1();
	if(!isdefined(var_d2899a41) || var_d2899a41.size < 1)
	{
		return undefined;
	}
	var_d2899a41 = Array::randomize(var_d2899a41);
	return var_d2899a41[0];
}

/*
	Name: function_8a726b2c
	Namespace: namespace_f52ad288
	Checksum: 0x6F454FB7
	Offset: 0x2030
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 611
*/
function function_8a726b2c()
{
	var_d6ed86d7 = function_6c222e13();
	if(!isdefined(var_d6ed86d7))
	{
		return 0;
	}
	else if(self.Used > level.var_88cc4315)
	{
		return 1;
	}
	else if(self.Used > level.var_bbc12e1f && self.Used < level.var_88cc4315)
	{
		remainder = level.var_88cc4315 - self.Used;
		teddy = RandomInt(remainder);
		if(teddy == 0)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_624c88c7
	Namespace: namespace_f52ad288
	Checksum: 0x7C700364
	Offset: 0x2110
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 644
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
	Name: function_c0d3aa68
	Namespace: namespace_f52ad288
	Checksum: 0x8756CF9F
	Offset: 0x2170
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 664
*/
function function_c0d3aa68(player)
{
	model = spawn("script_model", self.linked_model.origin);
	model.angles = self.linked_model.angles;
	model thread perk_bottle_motion();
	model thread function_624c88c7(model.origin);
	model.var_7733aebb = spawn("script_model", model.origin);
	model.var_7733aebb SetModel("tag_origin");
	PlayFXOnTag("harry/wunderfizz/fx_wunderfizz_bottle_glow", model.var_7733aebb, "tag_origin");
	model.var_7733aebb PlayLoopSound("zmb_rand_perk_vortex_loop");
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
	Name: function_59ad45b3
	Namespace: namespace_f52ad288
	Checksum: 0xA817FF29
	Offset: 0x2460
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 718
*/
function function_59ad45b3()
{
	self endon("delete");
	while(isdefined(self))
	{
		waittime = RandomFloatRange(2.5, 5);
		yaw = RandomInt(90);
		if(yaw > 300)
		{
			yaw = 300;
		}
		if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		self RotateTo((-60 + RandomInt(120), yaw, -45 + RandomInt(90)), waittime, waittime * 0.5, waittime * 0.5);
		wait(RandomFloat(waittime - 0.1));
	}
}

/*
	Name: function_f24febdc
	Namespace: namespace_f52ad288
	Checksum: 0xA74E0112
	Offset: 0x25A8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 749
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
		if(!self hasPerk(PERKS[i]))
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
	Name: perk_bottle_motion
	Namespace: namespace_f52ad288
	Checksum: 0x359AA478
	Offset: 0x2690
	Size: 0x19C
	Parameters: 0
	Flags: None
	Line Number: 781
*/
function perk_bottle_motion()
{
	putOutTime = 3;
	putBackTime = 10;
	v_float = AnglesToForward(self.angles - VectorScale((0, 1, 0), 90)) * 10;
	self.origin = self.origin + VectorScale((0, 0, 1), 53);
	self.angles = self.angles;
	self.origin = self.origin - v_float;
	self moveto(self.origin + v_float, putOutTime, putOutTime * 0.5);
	self.angles = self.angles + VectorScale((0, 0, 1), 10);
	self RotateYaw(720, putOutTime, putOutTime * 0, 5);
	self waittill("done_cycling");
	self.angles = self.angles;
	self moveto(self.origin - v_float, putBackTime, putBackTime * 0.5);
	self RotateYaw(90, putBackTime, putBackTime * 0.5);
}

