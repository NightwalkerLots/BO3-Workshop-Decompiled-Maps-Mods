#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicle_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_3e72f5ba;

/*
	Name: init
	Namespace: namespace_3e72f5ba
	Checksum: 0xE41C48C5
	Offset: 0x668
	Size: 0x150
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec init()
{
	clientfield::register("vehicle", "sewer_current_fx", 9000, 1, "int");
	clientfield::register("toplayer", "tp_water_sheeting", 9000, 1, "int");
	clientfield::register("toplayer", "wind_blur", 9000, 1, "int");
	level._effect["current_effect"] = "debris/fx_debris_underwater_current_sgen_os";
	level flag::wait_till("all_players_connected");
	Array::thread_all(struct::get_array("transport_zip_line", "targetname"), &setup_unitrigger);
	Array::thread_all(struct::get_array("transport_sewer", "targetname"), &setup_unitrigger);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: setup_unitrigger
	Namespace: namespace_3e72f5ba
	Checksum: 0x95ABC32F
	Offset: 0x7C0
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function setup_unitrigger()
{
	if(isdefined(self.script_special) && self.script_special != "")
	{
		self.thirdperson = self.script_special;
		continue;
	}
	self.thirdperson = 0;
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = self.origin;
	unitrigger_stub.angles = self.angles;
	unitrigger_stub.script_unitrigger_type = "unitrigger_radius_use";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.radius = 64;
	unitrigger_stub.require_look_at = 0;
	unitrigger_stub.e_parent = self;
	if(self.targetname == "transport_zip_line")
	{
		if(isdefined(self.zombie_cost) && self.zombie_cost != "")
		{
			self.cost = self.zombie_cost;
			continue;
		}
		self.cost = 250;
		if(isdefined(self.speed) && self.speed != "")
		{
			self.speed = self.speed;
			continue;
		}
		self.speed = 15;
		unitrigger_stub function_6fbea730();
		unitrigger_stub.prompt_and_visibility_func = &function_fab9a684;
		zm_unitrigger::register_static_unitrigger(unitrigger_stub, &function_da63405a);
	}
	else if(isdefined(self.zombie_cost) && self.zombie_cost != "")
	{
		self.cost = self.zombie_cost;
		continue;
	}
	self.cost = 500;
	if(isdefined(self.speed) && self.speed != "")
	{
		self.speed = self.speed;
		continue;
	}
	self.speed = 20;
	unitrigger_stub function_3c80e07f();
	unitrigger_stub.prompt_and_visibility_func = &function_30331e5d;
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &function_54ae0f69);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_da63405a
	Namespace: namespace_3e72f5ba
	Checksum: 0xDB73531C
	Offset: 0xA70
	Size: 0x2C8
	Parameters: 0
	Flags: None
	Line Number: 121
*/
function function_da63405a()
{
	var_97bf9a40 = ArrayGetClosest(self.origin, struct::get_array("transport_zip_line", "targetname"));
	var_97bf9a40.var_cddcaf75 = 1;
	var_97bf9a40.gate SetIgnorePauseWorld(1);
	while(1)
	{
		self waittill("trigger", e_who);
		if(var_97bf9a40 flag::get("flag_zipline_in_use"))
		{
			continue;
		}
		if(isdefined(var_97bf9a40.arrival) && var_97bf9a40.arrival flag::get("flag_zipline_in_use"))
		{
			continue;
		}
		if(isdefined(1) && 1 && !level flag::get("power_on"))
		{
			continue;
		}
		if(!e_who zm_score::can_player_purchase(var_97bf9a40.cost))
		{
			e_who zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		var_97bf9a40 flag::set("flag_zipline_in_use");
		if(isdefined(var_97bf9a40.arrival))
		{
			var_97bf9a40.arrival flag::set("flag_zipline_in_use");
		}
		if(isdefined(var_97bf9a40.gate))
		{
			var_97bf9a40 thread function_2acd238e(e_who, "p7_fxanim_zm_island_zipline_gate_open_bundle", "p7_fxanim_zm_island_zipline_gate_close_bundle");
		}
		if(isdefined(var_97bf9a40.var_cddcaf75) && var_97bf9a40.var_cddcaf75 && isdefined(var_97bf9a40.script_flag))
		{
			var_97bf9a40.var_cddcaf75 = 0;
			level flag::set(var_97bf9a40.script_flag);
		}
		e_who zm_score::minus_to_player_score(var_97bf9a40.cost);
		e_who thread vehicle_start(var_97bf9a40, 0);
	}
}

/*
	Name: function_54ae0f69
	Namespace: namespace_3e72f5ba
	Checksum: 0x314FBAE2
	Offset: 0xD40
	Size: 0x2C8
	Parameters: 0
	Flags: None
	Line Number: 175
*/
function function_54ae0f69()
{
	var_a785982d = ArrayGetClosest(self.origin, struct::get_array("transport_sewer", "targetname"));
	var_a785982d.var_cddcaf75 = 1;
	var_a785982d.gate SetIgnorePauseWorld(1);
	while(1)
	{
		self waittill("trigger", e_who);
		if(var_a785982d flag::get("flag_sewer_in_use"))
		{
			continue;
		}
		if(isdefined(var_a785982d.arrival) && var_a785982d.arrival flag::get("flag_sewer_in_use"))
		{
			continue;
		}
		if(isdefined(1) && 1 && !level flag::get("power_on"))
		{
			continue;
		}
		if(!e_who zm_score::can_player_purchase(var_a785982d.cost))
		{
			e_who zm_audio::create_and_play_dialog("general", "outofmoney");
			continue;
		}
		var_a785982d flag::set("flag_sewer_in_use");
		if(isdefined(var_a785982d.arrival))
		{
			var_a785982d.arrival flag::set("flag_sewer_in_use");
		}
		if(isdefined(var_a785982d.gate))
		{
			var_a785982d thread function_2acd238e(e_who, "p7_fxanim_zm_island_pipe_hatch_open_bundle", "p7_fxanim_zm_island_pipe_hatch_close_bundle");
		}
		if(isdefined(var_a785982d.var_cddcaf75) && var_a785982d.var_cddcaf75 && isdefined(var_a785982d.script_flag))
		{
			var_a785982d.var_cddcaf75 = 0;
			level flag::set(var_a785982d.script_flag);
		}
		e_who zm_score::minus_to_player_score(var_a785982d.cost);
		e_who thread vehicle_start(var_a785982d, 1);
	}
}

/*
	Name: function_6fbea730
	Namespace: namespace_3e72f5ba
	Checksum: 0x9B5B0D59
	Offset: 0x1010
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_6fbea730()
{
	self.e_parent.gate = GetEnt(self.e_parent.target, "targetname");
	node = GetVehicleNode(self.e_parent.target, "targetname");
	vehicle = SpawnVehicle("veh_default_zipline", node.origin, node.angles);
	vehicle SetSpeedImmediate(200);
	vehicle vehicle::get_on_path(node);
	vehicle vehicle::go_path();
	self.e_parent.arrival = ArrayGetClosest(vehicle.origin, struct::get_array("transport_zip_line", "targetname"));
	if(Distance(vehicle.origin, self.e_parent.arrival.origin) > 180)
	{
		self.e_parent.arrival = undefined;
	}
	vehicle delete();
	if(isdefined(self.e_parent.arrival))
	{
		self.e_parent.var_d02d1b66 = GetEnt(self.e_parent.arrival.target, "targetname");
	}
	self.e_parent flag::init("flag_zipline_in_use");
	if(isdefined(self.e_parent.model) && self.e_parent.model != "")
	{
		self.e_parent.var_c04e0ffb = util::spawn_model(self.e_parent.model, self.e_parent.origin, self.e_parent.angles);
		self.e_parent thread function_9456e439(self.e_parent.model, "p7_zm_isl_control_panel_cage", "flag_zipline_in_use");
	}
}

/*
	Name: function_3c80e07f
	Namespace: namespace_3e72f5ba
	Checksum: 0xF9C90F51
	Offset: 0x12F8
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 265
*/
function function_3c80e07f()
{
	self.e_parent.gate = GetEnt(self.e_parent.target, "targetname");
	node = GetVehicleNode(self.e_parent.target, "targetname");
	vehicle = SpawnVehicle("veh_default_zipline", node.origin, node.angles);
	vehicle SetSpeedImmediate(200);
	vehicle vehicle::get_on_path(node);
	vehicle vehicle::go_path();
	self.e_parent.arrival = ArrayGetClosest(vehicle.origin, struct::get_array("transport_sewer", "targetname"));
	if(Distance(vehicle.origin, self.e_parent.arrival.origin) > 280)
	{
		self.e_parent.arrival = undefined;
	}
	vehicle delete();
	if(isdefined(self.e_parent.arrival))
	{
		self.e_parent.var_d02d1b66 = GetEnt(self.e_parent.arrival.target, "targetname");
	}
	self.e_parent flag::init("flag_sewer_in_use");
	if(isdefined(self.e_parent.model) && self.e_parent.model != "")
	{
		self.e_parent.var_c04e0ffb = util::spawn_model(self.e_parent.model, self.e_parent.origin, self.e_parent.angles);
		self.e_parent thread function_9456e439(self.e_parent.model, "p7_zm_isl_control_panel_cage", "flag_sewer_in_use");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_9456e439
	Namespace: namespace_3e72f5ba
	Checksum: 0xDC48D0FD
	Offset: 0x15E0
	Size: 0x138
	Parameters: 3
	Flags: None
	Line Number: 303
*/
function function_9456e439(off_model, on_model, flag)
{
	if(isdefined(1) && 1)
	{
		level flag::wait_till("power_on");
	}
	while(1)
	{
		self.var_c04e0ffb SetModel(on_model);
		if(isdefined(self.arrival.var_c04e0ffb))
		{
			self.arrival.var_c04e0ffb SetModel(on_model);
		}
		self flag::wait_till(flag);
		self.var_c04e0ffb SetModel(off_model);
		if(isdefined(self.arrival.var_c04e0ffb))
		{
			self.arrival.var_c04e0ffb SetModel(off_model);
		}
		self flag::wait_till_clear(flag);
	}
}

/*
	Name: function_2acd238e
	Namespace: namespace_3e72f5ba
	Checksum: 0x116FC62A
	Offset: 0x1720
	Size: 0x150
	Parameters: 3
	Flags: None
	Line Number: 336
*/
function function_2acd238e(player, var_ccedc1d5, var_bd097443)
{
	self.gate thread scene::Play(var_ccedc1d5, self.gate);
	while(Distance(player.origin, self.gate.origin) < 150)
	{
		wait(0.05);
	}
	self.gate thread scene::Play(var_bd097443, self.gate);
	if(!isdefined(self.var_d02d1b66))
	{
		return;
	}
	while(Distance(player.origin, self.var_d02d1b66.origin) > 220)
	{
		wait(0.05);
	}
	self.var_d02d1b66 thread scene::Play(var_ccedc1d5, self.var_d02d1b66);
	player waittill("hash_56b71d8c");
	self.var_d02d1b66 thread scene::Play(var_bd097443, self.var_d02d1b66);
}

/*
	Name: vehicle_start
	Namespace: namespace_3e72f5ba
	Checksum: 0x3A3EA0B8
	Offset: 0x1878
	Size: 0x380
	Parameters: 2
	Flags: None
	Line Number: 367
*/
function vehicle_start(struct, variable)
{
	nd_path_start = GetVehicleNode(struct.target, "targetname");
	self.vehicle = SpawnVehicle("veh_default_zipline", (0, 0, 0), (0, 0, 0));
	self.vehicle SetIgnorePauseWorld(1);
	self HideViewModel();
	self util::magic_bullet_shield();
	self FreezeControls(1);
	self AllowSprint(0);
	self AllowJump(0);
	self DisableWeapons();
	wait(0.35);
	if(isdefined(struct.thirdperson) && struct.thirdperson)
	{
		self SetClientThirdPerson(1);
	}
	self SetPlayerAngles(nd_path_start.angles);
	self.vehicle.origin = nd_path_start.origin;
	self.vehicle.angles = nd_path_start.angles;
	if(variable)
	{
		self SetOrigin(self.vehicle.origin);
		continue;
	}
	self SetOrigin(self.vehicle GetTagOrigin("tag_zipline"));
	self.vehicle.e_parent = self;
	self.vehicle SetSpeed(struct.speed, 1000);
	self.vehicle vehicle::get_on_path(nd_path_start);
	wait(0.05);
	if(variable)
	{
		self PlayerLinkToDelta(self.vehicle, undefined, 1, 70, 70, 15, 60);
		continue;
	}
	self PlayerLinkToDelta(self.vehicle, "tag_zipline", 1, 70, 70, 15, 60);
	if(variable)
	{
		self thread animation::Play("cp_mi_sing_blackstation_water_flail");
		continue;
	}
	self thread animation::Play("pb_zipline_loop_island");
	self thread function_b96797f8(variable, struct);
}

/*
	Name: function_b96797f8
	Namespace: namespace_3e72f5ba
	Checksum: 0xD5400548
	Offset: 0x1C00
	Size: 0x478
	Parameters: 2
	Flags: None
	Line Number: 421
*/
function function_b96797f8(variable, struct)
{
	self endon("disconnect");
	self endon("hash_1f518f7b");
	if(variable)
	{
		self.vehicle thread function_3ac0b39f();
		self.vehicle PlayLoopSound("evt_sewer_transport_loop", 0.3);
		self clientfield::set_to_player("tp_water_sheeting", 1);
		continue;
	}
	self notify("hash_70ca3174");
	self clientfield::set_to_player("wind_blur", 1);
	self playsound("evt_zipline_attach");
	self.vehicle PlayLoopSound("evt_zipline_move", 0.3);
	if(!level flag::get("solo_game"))
	{
		self.no_revive_trigger = 1;
	}
	self.var_c247d40c Unlink();
	self.var_c247d40c delete();
	self ShowViewModel();
	self.vehicle vehicle::go_path();
	self.vehicle notify("hash_49b4d9d2");
	self.vehicle StopLoopSound(0.4);
	self Unlink();
	self animation::stop();
	self notify("hash_56b71d8c");
	if(variable)
	{
		if(isdefined(struct.script_int) && struct.script_int != "")
		{
			self SetVelocity(AnglesToForward(self.angles) * struct.script_int);
		}
		self zm_utility::clear_streamer_hint();
		self clientfield::set_to_player("tp_water_sheeting", 0);
		continue;
	}
	self playsound("evt_zipline_detach");
	self clientfield::set_to_player("wind_blur", 0);
	if(isdefined(struct.thirdperson) && struct.thirdperson)
	{
		self SetClientThirdPerson(0);
	}
	self util::stop_magic_bullet_shield();
	self FreezeControls(0);
	self AllowSprint(1);
	self AllowJump(1);
	self enableWeapons();
	wait(2);
	self.vehicle delete();
	self.no_revive_trigger = 0;
	if(variable)
	{
		struct flag::clear("flag_sewer_in_use");
		struct.arrival flag::clear("flag_sewer_in_use");
		continue;
	}
	struct flag::clear("flag_zipline_in_use");
	struct.arrival flag::clear("flag_zipline_in_use");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3ac0b39f
	Namespace: namespace_3e72f5ba
	Checksum: 0x73D8C7AF
	Offset: 0x2080
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 495
*/
function function_3ac0b39f()
{
	self clientfield::set("sewer_current_fx", 1);
	self waittill("hash_49b4d9d2");
	self clientfield::set("sewer_current_fx", 0);
}

/*
	Name: function_30331e5d
	Namespace: namespace_3e72f5ba
	Checksum: 0x24683474
	Offset: 0x20D8
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 512
*/
function function_30331e5d(player)
{
	if(isdefined(self.stub.e_parent.script_string) && self.stub.e_parent.script_string == "not_activate")
	{
		self setHintString("");
		return 0;
	}
	if(isdefined(1) && 1 && !level flag::get("power_on"))
	{
		self setHintString("You must turn on the power first!");
	}
	else if(self.stub.e_parent flag::get("flag_sewer_in_use"))
	{
		self setHintString("Sewer in use");
	}
	else if(isdefined(self.stub.e_parent.arrival) && self.stub.e_parent.arrival flag::get("flag_sewer_in_use"))
	{
		self setHintString("Sewer in use");
		continue;
	}
	self setHintString("Hold [{+activate}] to use the Sewer [Cost: " + self.stub.e_parent.cost + "]");
	return 1;
}

/*
	Name: function_fab9a684
	Namespace: namespace_3e72f5ba
	Checksum: 0x40490641
	Offset: 0x22A0
	Size: 0x1C0
	Parameters: 1
	Flags: None
	Line Number: 546
*/
function function_fab9a684(player)
{
	if(isdefined(self.stub.e_parent.script_string) && self.stub.e_parent.script_string == "not_activate")
	{
		self setHintString("");
		return 0;
	}
	if(isdefined(1) && 1 && !level flag::get("power_on"))
	{
		self setHintString("You must turn on the power first!");
	}
	else if(self.stub.e_parent flag::get("flag_zipline_in_use"))
	{
		self setHintString("Zipline in use");
	}
	else if(isdefined(self.stub.e_parent.arrival) && self.stub.e_parent.arrival flag::get("flag_zipline_in_use"))
	{
		self setHintString("Zipline in use");
		continue;
	}
	self setHintString("Hold [{+activate}] to use Zipline [Cost: " + self.stub.e_parent.cost + "]");
	return 1;
}

