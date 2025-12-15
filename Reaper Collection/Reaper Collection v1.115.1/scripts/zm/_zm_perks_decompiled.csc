#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\filter_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_filter;

#namespace zm_perks;

/*
	Name: init
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x188
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 20
*/
function init()
{
	callback::on_start_gametype(&init_perk_machines_fx);
	init_custom_perks();
	perks_register_clientfield();
	init_perk_custom_threads();
}

/*
	Name: perks_register_clientfield
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 38
*/
function perks_register_clientfield()
{
	if(level._custom_perks.size > 0)
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].clientfield_register))
			{
				level [[level._custom_perks[a_keys[i]].clientfield_register]]();
			}
		}
	}
	level thread perk_init_code_callbacks();
}

/*
	Name: perk_init_code_callbacks
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x2D0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function perk_init_code_callbacks()
{
	wait(0.1);
	if(level._custom_perks.size > 0)
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].clientfield_code_callback))
			{
				level [[level._custom_perks[a_keys[i]].clientfield_code_callback]]();
			}
		}
	}
}

/*
	Name: init_custom_perks
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 90
*/
function init_custom_perks()
{
	if(!isdefined(level._custom_perks))
	{
		level._custom_perks = [];
		return;
	}
	ERROR: Bad function call
}

/*
	Name: register_perk_clientfields
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x3B8
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 110
*/
function register_perk_clientfields(str_perk, func_clientfield_register, func_code_callback)
{
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].clientfield_register))
	{
		level._custom_perks[str_perk].clientfield_register = func_clientfield_register;
	}
	if(!isdefined(level._custom_perks[str_perk].clientfield_code_callback))
	{
		level._custom_perks[str_perk].clientfield_code_callback = func_code_callback;
	}
}

/*
	Name: register_perk_effects
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x468
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 133
*/
function register_perk_effects(str_perk, str_light_effect)
{
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].machine_light_effect))
	{
		level._custom_perks[str_perk].machine_light_effect = str_light_effect;
	}
}

/*
	Name: register_perk_init_thread
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 152
*/
function register_perk_init_thread(str_perk, func_init_thread)
{
	_register_undefined_perk(str_perk);
	if(!isdefined(level._custom_perks[str_perk].init_thread))
	{
		level._custom_perks[str_perk].init_thread = func_init_thread;
	}
}

/*
	Name: init_perk_custom_threads
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x548
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 171
*/
function init_perk_custom_threads()
{
	if(level._custom_perks.size > 0)
	{
		a_keys = getArrayKeys(level._custom_perks);
		for(i = 0; i < a_keys.size; i++)
		{
			if(isdefined(level._custom_perks[a_keys[i]].init_thread))
			{
				level thread [[level._custom_perks[a_keys[i]].init_thread]]();
			}
		}
	}
}

/*
	Name: _register_undefined_perk
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x600
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 196
*/
function _register_undefined_perk(str_perk)
{
	if(!isdefined(level._custom_perks))
	{
		level._custom_perks = [];
	}
	if(!isdefined(level._custom_perks[str_perk]))
	{
		level._custom_perks[str_perk] = spawnstruct();
	}
}

/*
	Name: perk_meteor_fx
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0xB0
	Parameters: 7
	Flags: None
	Line Number: 218
*/
function perk_meteor_fx(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.meteor_fx = PlayFXOnTag(localClientNum, level._effect["perk_meteor"], self, "tag_origin");
	}
	else if(isdefined(self.meteor_fx))
	{
		stopfx(localClientNum, self.meteor_fx);
	}
}

/*
	Name: init_perk_machines_fx
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x720
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 240
*/
function init_perk_machines_fx(localClientNum)
{
	if(!level.enable_magic)
	{
		return;
	}
	wait(0.1);
	machines = struct::get_array("zm_perk_machine", "targetname");
	Array::thread_all(machines, &perk_start_up);
}

/*
	Name: perk_start_up
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x7A0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 261
*/
function perk_start_up()
{
	if(isdefined(self.script_int))
	{
		power_zone = self.script_int;
		Int = undefined;
		while(Int != power_zone)
		{
			level waittill("power_on", Int);
		}
	}
	else
	{
		level waittill("power_on");
	}
	timer = 0;
	duration = 0.1;
	while(1)
	{
		if(isdefined(level._custom_perks[self.script_noteworthy]) && isdefined(level._custom_perks[self.script_noteworthy].machine_light_effect))
		{
			self thread vending_machine_flicker_light(level._custom_perks[self.script_noteworthy].machine_light_effect, duration);
		}
		timer = timer + duration;
		duration = duration + 0.2;
		if(timer >= 3)
		{
			break;
		}
		WaitRealTime(duration);
	}
}

/*
	Name: vending_machine_flicker_light
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x8F0
	Size: 0x78
	Parameters: 2
	Flags: None
	Line Number: 304
*/
function vending_machine_flicker_light(fx_light, duration)
{
	players = level.localPlayers;
	for(i = 0; i < players.size; i++)
	{
		self thread play_perk_fx_on_client(i, fx_light, duration);
	}
}

/*
	Name: play_perk_fx_on_client
	Namespace: zm_perks
	Checksum: 0x424F4353
	Offset: 0x970
	Size: 0xCC
	Parameters: 3
	Flags: None
	Line Number: 323
*/
function play_perk_fx_on_client(client_num, fx_light, duration)
{
	fxObj = spawn(client_num, self.origin + VectorScale((0, 0, -1), 50), "script_model");
	fxObj SetModel("tag_origin");
	PlayFXOnTag(client_num, level._effect[fx_light], fxObj, "tag_origin");
	WaitRealTime(duration);
	fxObj delete();
}

