#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_bb;
#include scripts\zm\_zm;
#include scripts\zm\_zm_ai_dogs;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_hackables_doors;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zm_moon;
#include scripts\zm\zm_moon_amb;
#include scripts\zm\zm_moon_gravity;
#include scripts\zm\zm_moon_utility;
#include scripts\zm\zm_moon_wasteland;

#namespace zm_moon_utility;

/*
	Name: init_zombie_airlocks
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 44
*/
function init_zombie_airlocks()
{
	airlock_buys = GetEntArray("zombie_airlock_buy", "targetname");
	for(i = 0; i < airlock_buys.size; i++)
	{
		airlock_buys[i] thread airlock_buy_init();
	}
	level thread namespace_65fac977::hack_doors("zombie_airlock_hackable", &moon_door_opened);
	airlock_hacks = GetEntArray("zombie_airlock_hackable", "targetname");
	for(i = 0; i < airlock_hacks.size; i++)
	{
		airlock_hacks[i] thread airlock_hack_init();
	}
	airlock_doors = GetEntArray("zombie_door_airlock", "script_noteworthy");
	for(i = 0; i < airlock_doors.size; i++)
	{
		airlock_doors[i] thread airlock_init();
	}
	level thread init_door_sounds();
	level thread zombie_moon_receiving_hatch_init();
	level thread moon_glass_breach_init();
}

/*
	Name: init_door_sounds
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0xA88
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function init_door_sounds()
{
	zm_utility::add_sound("lab_door", "zmb_lab_door_slide");
	zm_utility::add_sound("electric_metal_big", "zmb_heavy_door_open");
	zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
	return;
	ERROR: Bad function call
}

/*
	Name: airlock_hack_init
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0xAF8
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function airlock_hack_init()
{
	self.type = undefined;
	if(isdefined(self.script_flag) && !isdefined(level.flag[self.script_flag]))
	{
		if(isdefined(self.script_flag))
		{
			tokens = StrTok(self.script_flag, ",");
			for(i = 0; i < tokens.size; i++)
			{
				level flag::init(self.script_flag);
			}
		}
	}
	self.trigs = [];
	targets = GetEntArray(self.target, "targetname");
	for(i = 0; i < targets.size; i++)
	{
		if(!isdefined(self.trigs))
		{
			self.trigs = [];
		}
		else if(!IsArray(self.trigs))
		{
			self.trigs = Array(self.trigs);
		}
		self.trigs[self.trigs.size] = targets[i];
		if(isdefined(targets[i].classname) && targets[i].classname == "trigger_multiple")
		{
			targets[i] TriggerEnable(0);
		}
	}
	self setcursorhint("HINT_NOICON");
	self.script_noteworthy = "default";
	self setHintString(&"ZOMBIE_EQUIP_HACKER");
}

/*
	Name: airlock_buy_init
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0xD30
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 143
*/
function airlock_buy_init()
{
	self.type = undefined;
	if(isdefined(self.script_flag) && !isdefined(level.flag[self.script_flag]))
	{
		if(isdefined(self.script_flag))
		{
			tokens = StrTok(self.script_flag, ",");
			for(i = 0; i < tokens.size; i++)
			{
				level flag::init(self.script_flag);
			}
		}
	}
	self.trigs = [];
	targets = GetEntArray(self.target, "targetname");
	for(i = 0; i < targets.size; i++)
	{
		if(!isdefined(self.trigs))
		{
			self.trigs = [];
		}
		else if(!IsArray(self.trigs))
		{
			self.trigs = Array(self.trigs);
		}
		self.trigs[self.trigs.size] = targets[i];
		if(isdefined(targets[i].classname) && targets[i].classname == "trigger_multiple")
		{
			targets[i] TriggerEnable(0);
		}
	}
	self setcursorhint("HINT_NOICON");
	if(isdefined(self.script_noteworthy) && (self.script_noteworthy == "electric_door" || self.script_noteworthy == "electric_buyable_door"))
	{
		self setHintString(&"ZOMBIE_NEED_POWER");
	}
	else
	{
		self.script_noteworthy = "default";
	}
	self thread airlock_buy_think();
}

/*
	Name: airlock_buy_think
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0xFB0
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 197
*/
function airlock_buy_think()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: moon_door_opened
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1108
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 217
*/
function moon_door_opened()
{
	self notify("door_opened");
	if(isdefined(self.script_flag))
	{
		tokens = StrTok(self.script_flag, ",");
		for(i = 0; i < tokens.size; i++)
		{
			level flag::set(tokens[i]);
		}
	}
	for(i = 0; i < self.trigs.size; i++)
	{
		self.trigs[i] TriggerEnable(1);
		self.trigs[i] thread change_door_models();
	}
	zm_utility::play_sound_at_pos("purchase", self.origin);
	all_trigs = GetEntArray(self.target, "target");
	for(i = 0; i < all_trigs.size; i++)
	{
		all_trigs[i] TriggerEnable(0);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: change_door_models
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1298
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 253
*/
function change_door_models()
{
	doors = GetEntArray(self.target, "targetname");
	for(i = 0; i < doors.size; i++)
	{
		if(isdefined(doors[i].model) && doors[i].model == "p7_zm_moo_door_airlock_heavy_lt_locked")
		{
			doors[i] SetModel("p7_zm_moo_door_airlock_heavy_lt");
		}
		else if(isdefined(doors[i].model) && doors[i].model == "p7_zm_moo_door_airlock_heavy_rt_locked")
		{
			doors[i] SetModel("p7_zm_moo_door_airlock_heavy_rt");
		}
		else if(isdefined(doors[i].model) && doors[i].model == "p7_zm_moo_door_airlock_heavy_single_locked")
		{
			doors[i] SetModel("p7_zm_moo_door_airlock_heavy_single");
		}
		doors[i] thread airlock_connect_paths();
	}
	return;
	ERROR: Bad function call
}

/*
	Name: airlock_connect_paths
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1438
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 286
*/
function airlock_connect_paths()
{
	if(self.classname == "script_brushmodel")
	{
		self notsolid();
		self connectpaths();
		if(!isdefined(self._door_open) || self._door_open == 0)
		{
			self solid();
		}
	}
}

/*
	Name: airlock_buy
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x14B8
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 309
*/
function airlock_buy()
{
	self waittill("trigger", who, force);
	if(GetDvarInt("zombie_unlock_all") > 0 || (isdefined(force) && force))
	{
		return 1;
	}
	if(!who useButtonPressed())
	{
		return 0;
	}
	if(who zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(who.IS_DRINKING > 0)
	{
		return 0;
	}
	cost = 0;
	upgraded = 0;
	if(zombie_utility::is_player_valid(who))
	{
		cost = self.zombie_cost;
		if(who zm_pers_upgrades_functions::is_pers_double_points_active())
		{
			cost = who zm_pers_upgrades_functions::pers_upgrade_double_points_cost(cost);
			upgraded = 1;
		}
		if(who zm_score::can_player_purchase(cost))
		{
			who zm_score::minus_to_player_score(cost);
			scoreevents::processScoreEvent("open_door", who);
			self.purchaser = who;
		}
		else
		{
			zm_utility::play_sound_at_pos("no_purchase", self.origin);
			who zm_audio::create_and_play_dialog("general", "outofmoney");
			return 0;
		}
	}
	return 1;
	ERROR: Bad function call
}

/*
	Name: airlock_init
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x16C8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 365
*/
function airlock_init()
{
	self.type = undefined;
	self._door_open = 0;
	targets = GetEntArray(self.target, "targetname");
	self.doors = [];
	for(i = 0; i < targets.size; i++)
	{
		targets[i] zm_blockers::door_classify(self);
		targets[i].startpos = targets[i].origin;
	}
	self thread airlock_think();
}

/*
	Name: airlock_think
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x17B0
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 389
*/
function airlock_think()
{
	while(1)
	{
		self waittill("trigger", who);
		if(isdefined(self.doors[0].startpos) && self.doors[0].startpos != self.doors[0].origin)
		{
			continue;
		}
		for(i = 0; i < self.doors.size; i++)
		{
			self.doors[i] thread airlock_activate(0.25, 1);
		}
		self._door_open = 1;
		while(self moon_airlock_occupied() || (isdefined(self.doors[0].door_moving) && self.doors[0].door_moving == 1))
		{
			wait(0.1);
		}
		self thread door_clean_up_corpses();
		for(i = 0; i < self.doors.size; i++)
		{
			self.doors[i] thread airlock_activate(0.25, 0);
		}
		self._door_open = 0;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: airlock_activate
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1970
	Size: 0x248
	Parameters: 2
	Flags: None
	Line Number: 428
*/
function airlock_activate(time, open)
{
	if(!isdefined(time))
	{
		time = 1;
	}
	if(!isdefined(open))
	{
		open = 1;
	}
	if(isdefined(self.door_moving))
	{
		return;
	}
	self.door_moving = 1;
	self notsolid();
	if(self.classname == "script_brushmodel")
	{
		if(open)
		{
			self connectpaths();
		}
	}
	if(isdefined(self.script_sound))
	{
		if(open)
		{
			self playsound("zmb_airlock_open");
		}
		else
		{
			self playsound("zmb_airlock_close");
		}
	}
	scale = 1;
	if(!open)
	{
		scale = -1;
	}
	switch(self.script_string)
	{
		case "slide_apart":
		{
			if(isdefined(self.script_vector))
			{
				vector = VectorScale(self.script_vector, scale);
				if(open)
				{
					if(isdefined(self.startpos))
					{
						self moveto(self.startpos + vector, time);
					}
					else
					{
						self moveto(self.origin + vector, time);
					}
					self._door_open = 1;
				}
				else if(isdefined(self.startpos))
				{
					self moveto(self.startpos, time);
				}
				else
				{
					self moveto(self.origin - vector, time);
				}
				self._door_open = 0;
				self thread zm_blockers::door_solid_thread();
				break;
			}
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: moon_airlock_occupied
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1BC0
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 514
*/
function moon_airlock_occupied()
{
	is_occupied = 0;
	zombies = GetAIArray();
	for(i = 0; i < zombies.size; i++)
	{
		if(zombies[i] istouching(self))
		{
			is_occupied++;
		}
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] istouching(self))
		{
			is_occupied++;
		}
	}
	if(is_occupied > 0)
	{
		if(isdefined(self.doors[0].startpos) && self.doors[0].startpos == self.doors[0].origin)
		{
			for(i = 0; i < self.doors.size; i++)
			{
				self.doors[i] thread airlock_activate(0.25, 1);
			}
			self._door_open = 1;
		}
		return 1;
	}
	return 0;
}

/*
	Name: door_clean_up_corpses
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1D70
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 558
*/
function door_clean_up_corpses()
{
	corpses = GetCorpseArray();
	if(isdefined(corpses))
	{
		for(i = 0; i < corpses.size; i++)
		{
			if(corpses[i] istouching(self))
			{
				corpses[i] thread door_remove_corpses();
			}
		}
	}
}

/*
	Name: door_remove_corpses
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1E10
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 583
*/
function door_remove_corpses()
{
	if(isdefined(level._effect["dog_gib"]))
	{
		playFX(level._effect["dog_gib"], self.origin);
	}
	self delete();
}

/*
	Name: zapper_light_green
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1E78
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 602
*/
function zapper_light_green(light_name, key_name)
{
	var_e9947991 = GetEntArray(light_name, key_name);
	foreach(light in var_e9947991)
	{
		str_light = "zap_teleport_light_0" + light.script_int;
		exploder::exploder(str_light);
	}
}

/*
	Name: zapper_light_red
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x1F68
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 622
*/
function zapper_light_red(light_name, key_name)
{
	var_e9947991 = GetEntArray(light_name, key_name);
	foreach(light in var_e9947991)
	{
		str_light = "zap_teleport_light_0" + light.script_int;
		exploder::stop_exploder(str_light);
	}
}

/*
	Name: moon_intermission
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2058
	Size: 0x6D0
	Parameters: 0
	Flags: None
	Line Number: 642
*/
function moon_intermission()
{
	self closeInGameMenu();
	level endon("stop_intermission");
	self endon("disconnect");
	self endon("death");
	self notify("_zombie_game_over");
	self.score = self.score_total;
	self.sessionstate = "intermission";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psOffsetTime = 0;
	self.friendlydamage = undefined;
	points = struct::get_array("intermission", "targetname");
	for(i = 0; i < points.size; i++)
	{
		if(level flag::get("enter_nml"))
		{
			if(points[i].script_noteworthy == "moon")
			{
				ArrayRemoveValue(points, points[i]);
				continue;
			}
		}
		if(points[i].script_noteworthy == "earth")
		{
			ArrayRemoveValue(points, points[i]);
		}
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_intermission", "classname");
		if(points.size < 1)
		{
			/#
				println("Dev Block strings are not supported");
				return;
			#/
		}
	}
	self.game_over_bg = newClientHudElem(self);
	self.game_over_bg.horzAlign = "fullscreen";
	self.game_over_bg.vertAlign = "fullscreen";
	self.game_over_bg SetShader("black", 640, 480);
	self.game_over_bg.alpha = 1;
	org = undefined;
	while(1)
	{
		points = Array::randomize(points);
		for(i = 0; i < points.size; i++)
		{
			point = points[i];
			if(!isdefined(org))
			{
				self spawn(point.origin, point.angles);
			}
			if(isdefined(points[i].target))
			{
				if(!isdefined(org))
				{
					org = spawn("script_model", self.origin + VectorScale((0, 0, -1), 60));
					org SetModel("tag_origin");
				}
				org.origin = points[i].origin;
				org.angles = points[i].angles;
				for(j = 0; j < GetPlayers().size; j++)
				{
					player = GetPlayers()[j];
					player CameraSetPosition(org);
					player CameraSetLookAt();
					player CameraActivate(1);
				}
				speed = 20;
				if(isdefined(points[i].speed))
				{
					speed = points[i].speed;
				}
				target_point = struct::get(points[i].target, "targetname");
				dist = Distance(points[i].origin, target_point.origin);
				time = dist / speed;
				q_time = time * 0.25;
				if(q_time > 1)
				{
					q_time = 1;
				}
				self.game_over_bg fadeOverTime(q_time);
				self.game_over_bg.alpha = 0;
				org moveto(target_point.origin, time, q_time, q_time);
				org RotateTo(target_point.angles, time, q_time, q_time);
				wait(time - q_time);
				self.game_over_bg fadeOverTime(q_time);
				self.game_over_bg.alpha = 1;
				wait(q_time);
				continue;
			}
			self.game_over_bg fadeOverTime(1);
			self.game_over_bg.alpha = 0;
			wait(5);
			self.game_over_bg thread zm::fade_up_over_time(1);
		}
	}
}

/*
	Name: hacker_location_random_init
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2730
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 756
*/
function hacker_location_random_init()
{
	hacker_tool_array = [];
	hacker_pos = undefined;
	level.hacker_tool_positions = [];
	hacker = GetEntArray("zombie_equipment_upgrade", "targetname");
	for(i = 0; i < hacker.size; i++)
	{
		if(isdefined(hacker[i].zombie_equipment_upgrade) && hacker[i].zombie_equipment_upgrade == "equip_hacker")
		{
			if(!isdefined(hacker_tool_array))
			{
				hacker_tool_array = [];
			}
			else if(!IsArray(hacker_tool_array))
			{
				hacker_tool_array = Array(hacker_tool_array);
			}
			hacker_tool_array[hacker_tool_array.size] = hacker[i];
			struct = spawnstruct();
			struct.trigger_org = hacker[i].origin;
			struct.model_org = GetEnt(hacker[i].target, "targetname").origin;
			struct.model_ang = GetEnt(hacker[i].target, "targetname").angles;
			level.hacker_tool_positions[level.hacker_tool_positions.size] = struct;
		}
	}
	if(hacker_tool_array.size > 1)
	{
		hacker_pos = hacker_tool_array[RandomInt(hacker_tool_array.size)];
		ArrayRemoveValue(hacker_tool_array, hacker_pos);
		Array::thread_all(hacker_tool_array, &hacker_position_cleanup);
	}
}

/*
	Name: hacker_position_cleanup
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x29A8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 800
*/
function hacker_position_cleanup()
{
	model = GetEnt(self.target, "targetname");
	if(isdefined(model))
	{
		model delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: moon_glass_breach_init
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2A28
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 823
*/
function moon_glass_breach_init()
{
	callback::on_connect(&check_for_grenade_throw);
	callback::on_connect(&function_ab784395);
	level.glass = GetEntArray("moon_breach_glass", "targetname");
	Array::thread_all(level.glass, &glass_breach_think);
	level.var_4fd08591 = [];
	level.var_4fd08591["bridge_zone"] = 1;
	level.var_4fd08591["generator_exit_east_zone"] = 1;
	level.var_4fd08591["enter_forest_east_zone"] = 1;
}

/*
	Name: glass_gets_destroyed
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2B18
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 845
*/
function glass_gets_destroyed()
{
	if(isdefined(self.fxpos_array))
	{
		for(i = 0; i < self.fxpos_array.size; i++)
		{
			if(!isdefined(self.fxpos_array[i].var_3ce053e5))
			{
				playFX(level._effect["glass_impact"], self.fxpos_array[i].origin, AnglesToForward(self.fxpos_array[i].angles));
				self.fxpos_array[i].var_3ce053e5 = 1;
			}
		}
	}
	else if(isdefined(self.script_noteworthy))
	{
		if(isdefined(level.var_4fd08591[self.script_noteworthy]) && level.var_4fd08591[self.script_noteworthy])
		{
			function_f1daf14e(self.script_noteworthy);
			level.var_4fd08591[self.script_noteworthy] = 0;
		}
		level thread send_client_notify_for_breach(self.script_noteworthy);
		_zones = GetEntArray(self.script_noteworthy, "targetname");
		if(isdefined(_zones))
		{
			for(i = 0; i < _zones.size; i++)
			{
				_zones[i].script_string = "lowgravity";
			}
			level thread zm_moon_gravity::zone_breached(self.script_noteworthy);
		}
	}
	util::wait_network_frame();
	if(isdefined(self.model) && self.damage_state == 0)
	{
		self SetModel(self.model + "_dmg");
		self.damage_state = 1;
		return;
	}
	self delete();
	return;
}

/*
	Name: wait_for_grenade_explode
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2D80
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 897
*/
function wait_for_grenade_explode(grenade)
{
	level endon("grenade_end_" + grenade GetEntityNumber());
	level thread function_78b7f012(grenade);
	grenade waittill("explode", origin);
	grenade thread check_for_grenade_damage_on_window(origin);
}

/*
	Name: function_78b7f012
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2E10
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 915
*/
function function_78b7f012(grenade)
{
	grenade endon("explode");
	ent_num = grenade GetEntityNumber();
	grenade waittill("death");
	wait(0.05);
	level notify("grenade_end_" + ent_num);
}

/*
	Name: wait_for_projectile_impact
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2E80
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 934
*/
function wait_for_projectile_impact(grenade)
{
	self endon("disconnect");
	grenade endon("explode");
	self waittill("projectile_impact", weapon_name, position);
	self thread check_for_grenade_damage_on_window(position);
	return;
}

/*
	Name: check_for_grenade_damage_on_window
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x2EF0
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 953
*/
function check_for_grenade_damage_on_window(grenade_origin)
{
	radiusSqToCheck = 44096;
	var_95d2a5a2 = ArraySort(level.glass, grenade_origin, 1, level.glass.size, 300);
	for(i = 0; i < var_95d2a5a2.size; i++)
	{
		if(var_95d2a5a2[i].damage_state == 0)
		{
			glass_destroyed = 0;
			for(j = 0; j < var_95d2a5a2[i].fxpos_array.size; j++)
			{
				glass_origin = var_95d2a5a2[i].fxpos_array[j].origin;
				if(DistanceSquared(glass_origin, grenade_origin) < radiusSqToCheck)
				{
					glass_destroyed = 1;
					break;
				}
			}
			if(glass_destroyed)
			{
				var_95d2a5a2[i].damage_state = 1;
				var_95d2a5a2[i] thread glass_gets_destroyed();
			}
		}
	}
}

/*
	Name: check_for_grenade_throw
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x3080
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 990
*/
function check_for_grenade_throw()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(weapon == level.zombie_lethal_grenade_player_init)
		{
			level thread wait_for_grenade_explode(grenade);
		}
	}
}

/*
	Name: function_ab784395
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x30E8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1013
*/
function function_ab784395()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("projectile_impact", weapon, position);
		if(isdefined(weapon) && isdefined(position))
		{
			if(!IsSubStr(weapon.name, "ray_gun"))
			{
				level check_for_grenade_damage_on_window(position);
			}
		}
		wait(0.05);
	}
}

/*
	Name: glass_breach_think
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x3180
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1040
*/
function glass_breach_think()
{
	self.fxpos_array = [];
	if(isdefined(self.target))
	{
		self.fxpos_array = struct::get_array(self.target, "targetname");
	}
	self.health = 99999;
	self.damage_state = 0;
}

/*
	Name: send_client_notify_for_breach
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x31E8
	Size: 0x218
	Parameters: 1
	Flags: None
	Line Number: 1061
*/
function send_client_notify_for_breach(zone)
{
	switch(zone)
	{
		case "bridge_zone":
		{
			if(!(isdefined(level.audio_zones_breached["1"]) && level.audio_zones_breached["1"]))
			{
				level clientfield::increment("Az1");
				level.audio_zones_breached["1"] = 1;
				if(level flag::get("power_on"))
				{
					level thread zm_moon_amb::play_mooncomp_vox("vox_mcomp_breach_start");
					break;
				}
			}
		}
		case "generator_exit_east_zone":
		{
			if(!(isdefined(level.audio_zones_breached["4a"]) && level.audio_zones_breached["4a"]))
			{
				level clientfield::increment("Az4a");
				level.audio_zones_breached["4a"] = 1;
				if(level flag::get("power_on"))
				{
					level thread zm_moon_amb::play_mooncomp_vox("vox_mcomp_breach_labs");
					break;
				}
			}
		}
		case "enter_forest_east_zone":
		{
			if(!(isdefined(level.audio_zones_breached["4b"]) && level.audio_zones_breached["4b"]))
			{
				level clientfield::increment("Az4b");
				level.audio_zones_breached["4b"] = 1;
				if(level flag::get("power_on"))
				{
					level thread zm_moon_amb::play_mooncomp_vox("vox_mcomp_breach_labs");
					break;
				}
			}
		}
	}
}

/*
	Name: function_f1daf14e
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x3408
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1117
*/
function function_f1daf14e(str_area)
{
	var_af1a2667 = undefined;
	switch(str_area)
	{
		case "bridge_zone":
		{
			var_af1a2667 = "fxexp_300";
			break;
		}
		case "generator_exit_east_zone":
		{
			var_af1a2667 = "fxexp_320";
			break;
		}
		case "enter_forest_east_zone":
		{
			var_af1a2667 = "fxexp_340";
			break;
		}
	}
	if(isdefined(var_af1a2667))
	{
		exploder::exploder(var_af1a2667);
	}
}

/*
	Name: zombie_moon_receiving_hatch_init
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x34A8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 1154
*/
function zombie_moon_receiving_hatch_init()
{
	hatches = GetEntArray("recieving_hatch", "targetname");
	Array::thread_all(hatches, &zombie_moon_hatch);
	level thread function_8ceda02();
	level flag::wait_till("power_on");
	wait(1);
	ArrayRemoveValue(level._limited_equipment, GetWeapon("equip_hacker"));
	doors = GetEntArray("receiving_bay_doors", "targetname");
	for(i = 0; i < doors.size; i++)
	{
		script_vector = function_b162da30(i);
		doors[i] playsound("evt_loading_door_start");
		doors[i] PlayLoopSound("evt_loading_door_loop", 0.5);
		doors[i] moveto(doors[i].origin + script_vector, 3);
		doors[i] thread function_e7d84b6();
	}
	return;
	~script_vector;
}

/*
	Name: zombie_moon_hatch
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x3698
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 1185
*/
function zombie_moon_hatch()
{
	scale = 1;
	level flag::wait_till("power_on");
	self playsound("evt_loading_door_start");
	if(isdefined(self.script_vector))
	{
		vector = VectorScale(self.script_vector, scale);
		self moveto(self.origin + vector, 1);
		if(isdefined(self.script_noteworthy) && self.script_noteworthy == "hatch_clip")
		{
			self thread zm_blockers::disconnect_paths_when_done();
		}
		else
		{
			self notsolid();
			self connectpaths();
		}
		wait(1);
		self playsound("evt_loading_door_end");
	}
}

/*
	Name: function_b162da30
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x37C8
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1218
*/
function function_b162da30(i)
{
	switch(i)
	{
		case 0:
		{
			return VectorScale((0, 0, 1), 72);
			break;
		}
		case 1:
		{
			return VectorScale((0, 0, 1), 72);
			break;
		}
		case 2:
		{
			return VectorScale((0, 0, -1), 80);
			break;
		}
		case 3:
		{
			return VectorScale((0, 0, -1), 56);
			break;
		}
	}
	return;
}

/*
	Name: function_e7d84b6
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x3860
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1256
*/
function function_e7d84b6()
{
	wait(2.6);
	self StopLoopSound(0.5);
	self playsound("evt_loading_door_end");
}

/*
	Name: function_8ceda02
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x38B8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 1273
*/
function function_8ceda02()
{
	var_851890ac = GetNodeArray("hatch_node", "targetname");
	foreach(node in var_851890ac)
	{
		UnlinkTraversal(node);
	}
	level flag::wait_till("power_on");
	wait(1);
	foreach(node in var_851890ac)
	{
		LinkTraversal(node);
	}
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: sky_transition_fog_settings
	Namespace: zm_moon_utility
	Checksum: 0x424F4353
	Offset: 0x3A18
	Size: 0xDE
	Parameters: 0
	Flags: None
	Line Number: 1301
*/
function sky_transition_fog_settings()
{
	players = GetPlayers();
	if(level flag::get("enter_nml"))
	{
		for(i = 0; i < players.size; i++)
		{
			players[i] clientfield::set_to_player("player_sky_transition", 1);
		}
	}
	else
	{
		for(i = 0; i < players.size; i++)
		{
			players[i] clientfield::set_to_player("player_sky_transition", 0);
		}
	}
}

