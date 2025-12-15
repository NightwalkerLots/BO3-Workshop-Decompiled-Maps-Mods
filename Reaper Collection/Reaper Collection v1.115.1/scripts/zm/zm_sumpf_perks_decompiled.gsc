#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;

#namespace namespace_42de9882;

/*
	Name: randomize_vending_machines
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0x468
	Size: 0x4D8
	Parameters: 0
	Flags: None
	Line Number: 18
*/
function randomize_vending_machines()
{
	level._dont_unhide_quickervive_on_hotjoin = 1;
	vending_machines = [];
	vending_machines = function_1b58b796("zombie_vending");
	start_locations = [];
	start_locations[0] = GetEnt("random_vending_start_location_0", "script_noteworthy");
	start_locations[1] = GetEnt("random_vending_start_location_1", "script_noteworthy");
	start_locations[2] = GetEnt("random_vending_start_location_2", "script_noteworthy");
	start_locations[3] = GetEnt("random_vending_start_location_3", "script_noteworthy");
	level.start_locations = [];
	level.start_locations[level.start_locations.size] = start_locations[0].origin;
	level.start_locations[level.start_locations.size] = start_locations[1].origin;
	level.start_locations[level.start_locations.size] = start_locations[2].origin;
	level.start_locations[level.start_locations.size] = start_locations[3].origin;
	start_locations = Array::randomize(start_locations);
	start_locations[4] = GetEnt("random_vending_start_location_4", "script_noteworthy");
	level.start_locations[level.start_locations.size] = start_locations[4].origin;
	for(i = 0; i < vending_machines.size; i++)
	{
		if(vending_machines[i].script_noteworthy == "specialty_quickrevive")
		{
			t_temp = vending_machines[i];
			vending_machines[i] = vending_machines[4];
			vending_machines[4] = t_temp;
		}
	}
	for(i = 0; i < vending_machines.size; i++)
	{
		if(vending_machines[i].script_noteworthy == "specialty_quickrevive" || vending_machines[i].script_noteworthy == "specialty_armorvest" || vending_machines[i].script_noteworthy == "specialty_fastreload" || vending_machines[i].script_noteworthy == "specialty_doubletap2" || vending_machines[i].script_noteworthy == "specialty_additionalprimaryweapon")
		{
			origin = start_locations[i].origin;
			angles = start_locations[i].angles;
			machine = vending_machines[i] get_vending_machine(start_locations[i]);
			if(vending_machines[i].script_noteworthy != "specialty_quickrevive")
			{
				vending_machines[i] TriggerEnable(0);
			}
			start_locations[i].origin = origin;
			start_locations[i].angles = angles;
			machine.origin = origin;
			machine.angles = angles;
			if(machine.script_string != "revive_perk")
			{
				machine ghost();
				vending_machines[i] thread function_bede3562(machine);
			}
		}
	}
	level.sndperksacolajingleoverride = &function_25413096;
	level notify("hash_58150179");
}

/*
	Name: function_bede3562
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0x948
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 81
*/
function function_bede3562(e_machine)
{
	var_fb1cd1b2 = self.script_noteworthy + "_power_on";
	level waittill(var_fb1cd1b2);
	e_machine.b_keep_when_turned_off = 1;
	wait(10);
	e_machine zm_perks::perk_fx(undefined, 1);
	level waittill(self.script_noteworthy + "_unhide");
	str_fx_name = level._custom_perks[self.script_noteworthy].machine_light_effect;
	e_machine zm_perks::perk_fx(str_fx_name);
	e_machine.s_fxloc.angles = e_machine.angles;
}

/*
	Name: function_1b58b796
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0xA38
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 104
*/
function function_1b58b796(str_trigger)
{
	vending_machines = [];
	var_560b7d8d = GetEntArray(str_trigger, "targetname");
	for(i = 0; i < var_560b7d8d.size; i++)
	{
		if(var_560b7d8d[i].script_noteworthy == "specialty_quickrevive" || var_560b7d8d[i].script_noteworthy == "specialty_armorvest" || var_560b7d8d[i].script_noteworthy == "specialty_fastreload" || var_560b7d8d[i].script_noteworthy == "specialty_doubletap2" || var_560b7d8d[i].script_noteworthy == "specialty_additionalprimaryweapon")
		{
			if(isdefined(var_560b7d8d[i].script_noteworthy))
			{
				if(!isdefined(vending_machines))
				{
					vending_machines = [];
				}
				else if(!IsArray(vending_machines))
				{
					vending_machines = Array(vending_machines);
				}
				vending_machines[vending_machines.size] = var_560b7d8d[i];
				if(var_560b7d8d[i].script_noteworthy != "specialty_quickrevive")
				{
					var_560b7d8d[i].var_6ecf729b = 1;
					var_560b7d8d[i] thread function_17db950e();
					continue;
				}
			}
		}
		var_560b7d8d[i].var_6ecf729b = 0;
	}
	return vending_machines;
}

/*
	Name: function_17db950e
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0xC40
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 146
*/
function function_17db950e()
{
	level waittill(self.script_noteworthy + "_unhide");
	self.var_6ecf729b = 0;
}

/*
	Name: function_25413096
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0xC70
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 162
*/
function function_25413096()
{
	Perksacola = self.script_sound;
	if(!self.var_6ecf729b)
	{
		playsoundatposition("evt_electrical_surge", self.origin);
		if(!isdefined(self.jingle_is_playing))
		{
			self.jingle_is_playing = 0;
		}
		if(isdefined(Perksacola))
		{
			if(self.jingle_is_playing == 0 && level.music_override == 0)
			{
				self.jingle_is_playing = 1;
				self PlaySoundOnTag(Perksacola, "tag_origin", "sound_done");
				if(IsSubStr(Perksacola, "sting"))
				{
					wait(10);
				}
				else if(isdefined(self.longJingleWait))
				{
					wait(60);
				}
				else
				{
					wait(30);
				}
				self.jingle_is_playing = 0;
			}
		}
	}
}

/*
	Name: solo_disable_quickrevive
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0xD88
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 206
*/
function solo_disable_quickrevive()
{
	level flag::wait_till("solo_revive");
	self Unlink();
	self TriggerEnable(0);
}

/*
	Name: get_vending_machine
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0xDE8
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 223
*/
function get_vending_machine(start_location)
{
	machine = undefined;
	machine_clip = undefined;
	machine_array = GetEntArray(self.target, "targetname");
	for(i = 0; i < machine_array.size; i++)
	{
		if(isdefined(machine_array[i].script_noteworthy) && machine_array[i].script_noteworthy == "clip")
		{
			machine_clip = machine_array[i];
			continue;
		}
		machine = machine_array[i];
	}
	if(!isdefined(machine))
	{
		return;
	}
	if(isdefined(machine_clip))
	{
		machine_clip LinkTo(machine);
	}
	start_location.origin = machine.origin;
	start_location.angles = machine.angles;
	self EnableLinkTo();
	self LinkTo(start_location);
	return machine;
}

/*
	Name: activate_vending_machine
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0xF68
	Size: 0x1F8
	Parameters: 3
	Flags: None
	Line Number: 262
*/
function activate_vending_machine(machine, origin, entity)
{
	level notify("hash_ba8cfc96");
	switch(machine)
	{
		case "p7_zm_vending_jugg":
		{
			var_da5a8677 = "mus_perks_jugganog_sting";
			level notify("hash_65383c25");
			break;
		}
		case "p7_zm_vending_doubletap2":
		{
			var_da5a8677 = "mus_perks_doubletap_sting";
			level notify("hash_d87fd0e8");
			break;
		}
		case "p7_zm_vending_revive":
		{
			var_da5a8677 = "mus_perks_quickrevive_sting";
			level notify("hash_58150179");
			level._dont_unhide_quickervive_on_hotjoin = 0;
			break;
		}
		case "p7_zm_vending_sleight":
		{
			var_da5a8677 = "mus_perks_speed_sting";
			level notify("hash_b8f1b215");
			break;
		}
		case "p7_zm_vending_three_gun":
		{
			var_da5a8677 = "mus_perks_mulekick_sting";
			level notify("hash_40b72691");
			break;
		}
	}
	if(isdefined(var_da5a8677))
	{
		e_trigger = GetEnt(var_da5a8677, "script_label");
		e_trigger TriggerEnable(1);
	}
	else
	{
		vending_triggers = Array::get_all_closest(origin, GetEntArray("zombie_vending", "targetname"), undefined, undefined, 250);
		vending_triggers[0] TriggerEnable(1);
	}
	level notify("hash_8055d572");
	play_vending_vo(machine, origin);
}

/*
	Name: play_vending_vo
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0x1168
	Size: 0x1B8
	Parameters: 2
	Flags: None
	Line Number: 323
*/
function play_vending_vo(machine, origin)
{
	players = GetPlayers();
	players = Array::get_all_closest(origin, players, undefined, undefined, 512);
	player = undefined;
	for(i = 0; i < players.size; i++)
	{
		if(SightTracePassed(players[i] GetEye(), origin, 0, undefined))
		{
			player = players[i];
		}
	}
	if(!isdefined(player))
	{
		return;
	}
	switch(machine)
	{
		case "p7_zm_vending_jugg":
		{
			player thread zm_audio::create_and_play_dialog("level", "jugga");
			break;
		}
		case "p7_zm_vending_doubletap2":
		{
			player thread zm_audio::create_and_play_dialog("level", "doubletap");
			break;
		}
		case "p7_zm_vending_revive":
		{
			player thread zm_audio::create_and_play_dialog("level", "revive");
			break;
		}
		case "p7_zm_vending_sleight":
		{
			player thread zm_audio::create_and_play_dialog("level", "speed");
			break;
		}
	}
	return;
	~player;
}

/*
	Name: vending_randomization_effect
	Namespace: namespace_42de9882
	Checksum: 0x424F4353
	Offset: 0x1328
	Size: 0xA34
	Parameters: 1
	Flags: None
	Line Number: 376
*/
function vending_randomization_effect(index)
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	machines = [];
	for(j = 0; j < vending_triggers.size; j++)
	{
		machine_array = GetEntArray(vending_triggers[j].target, "targetname");
		for(i = 0; i < machine_array.size; i++)
		{
			if(isdefined(machine_array[i].script_noteworthy) && machine_array[i].script_noteworthy == "clip")
			{
				continue;
				continue;
			}
			machines[j] = machine_array[i];
		}
	}
	for(j = 0; j < machines.size; j++)
	{
		if(machines[j].origin == level.start_locations[index])
		{
			break;
		}
	}
	if(isdefined(level.first_time_opening_perk_hut))
	{
		if(level.first_time_opening_perk_hut)
		{
			if(machines[j].model != "p7_zm_vending_jugg" || machines[j].model != "p7_zm_vending_sleight")
			{
				for(i = 0; i < machines.size; i++)
				{
					if(i != j && (machines[i].model == "p7_zm_vending_jugg" || machines[i].model == "p7_zm_vending_sleight"))
					{
						break;
					}
				}
				start_locations = [];
				start_locations[0] = GetEnt("random_vending_start_location_0", "script_noteworthy");
				start_locations[1] = GetEnt("random_vending_start_location_1", "script_noteworthy");
				start_locations[2] = GetEnt("random_vending_start_location_2", "script_noteworthy");
				start_locations[3] = GetEnt("random_vending_start_location_3", "script_noteworthy");
				start_locations[4] = GetEnt("random_vending_start_location_4", "script_noteworthy");
				target_index = undefined;
				switch_index = undefined;
				for(x = 0; x < start_locations.size; x++)
				{
					if(start_locations[x].origin == level.start_locations[index])
					{
						target_index = x;
					}
					if(start_locations[x].origin == machines[i].origin)
					{
						switch_index = x;
					}
				}
				temp_origin = machines[j].origin;
				temp_angles = machines[j].angles;
				machines[j].origin = machines[i].origin;
				machines[j].angles = machines[i].angles;
				start_locations[target_index].origin = start_locations[switch_index].origin;
				start_locations[target_index].angles = start_locations[switch_index].angles;
				machines[i].origin = temp_origin;
				machines[i].angles = temp_angles;
				start_locations[switch_index].origin = temp_origin;
				start_locations[switch_index].angles = temp_angles;
				j = i;
			}
			level.first_time_opening_perk_hut = 0;
		}
	}
	playsoundatposition("zmb_rando_start", machines[j].origin);
	origin = machines[j].origin;
	if(level.vending_model_info.size > 1)
	{
		PlayFXOnTag(level._effect["zombie_perk_start"], machines[j], "tag_origin");
		playsoundatposition("zmb_rando_perk", machines[j].origin);
	}
	else
	{
		PlayFXOnTag(level._effect["zombie_perk_4th"], machines[j], "tag_origin");
		playsoundatposition("zmb_rando_perk", machines[j].origin);
	}
	true_model = machines[j].model;
	machines[j] SetModel(true_model);
	machines[j] show();
	floatHeight = 40;
	level thread zm_utility::play_sound_2d("zmb_perk_lottery");
	machines[j] moveto(origin + (0, 0, floatHeight), 5, 3, 0.5);
	tag_fx = spawn("script_model", machines[j].origin);
	tag_fx SetModel("tag_origin");
	tag_fx.angles = machines[j].angles;
	tag_fx LinkTo(machines[j]);
	PlayFXOnTag(level._effect["zombie_perk_smoke_anim"], tag_fx, "tag_origin");
	modelIndex = 0;
	machines[j] vibrate(machines[j].angles, 2, 1, 4);
	for(i = 0; i < 30; i++)
	{
		wait(0.15);
		if(level.vending_model_info.size > 1)
		{
			while(!isdefined(level.vending_model_info[modelIndex]))
			{
				modelIndex++;
				if(modelIndex == 4)
				{
					modelIndex = 0;
				}
			}
			modelName = level.vending_model_info[modelIndex];
			machines[j] SetModel(modelName);
			modelIndex++;
			if(modelIndex == 4)
			{
				modelIndex = 0;
			}
		}
	}
	modelName = true_model;
	machines[j] SetModel(modelName);
	machines[j] moveto(origin, 0.3, 0.3, 0);
	wait(0.2);
	PlayFXOnTag(level._effect["zombie_perk_end"], machines[j], "tag_origin");
	playsoundatposition("zmb_drop_perk_machine", machines[j].origin);
	wait(0.05);
	PlayFXOnTag(level._effect["zombie_perk_flash"], machines[j], "tag_origin");
	activate_vending_machine(true_model, origin, machines[j]);
}

