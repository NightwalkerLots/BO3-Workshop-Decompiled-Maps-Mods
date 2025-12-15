#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace namespace_b8afaefc;

/*
	Name: function_fc92a42d
	Namespace: namespace_b8afaefc
	Checksum: 0xAE416C03
	Offset: 0x2C0
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 19
*/
function function_fc92a42d()
{
	if(level.script == "zm_factory" || level.script == "zm_zod" || level.script == "zm_castle" || level.script == "zm_island" || level.script == "zm_stalingrad" || level.script == "zm_genesis" || level.script == "zm_prototype" || level.script == "zm_asylum" || level.script == "zm_sumpf" || level.script == "zm_theater" || level.script == "zm_cosmodrome" || level.script == "zm_temple" || level.script == "zm_moon" || level.script == "zm_tomb")
	{
		return 1;
	}
	return 0;
	ERROR: Bad function call
}

/*
	Name: function_5cc079f8
	Namespace: namespace_b8afaefc
	Checksum: 0xD952FE5C
	Offset: 0x3F0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 39
*/
function function_5cc079f8(perk)
{
	if(!isdefined(self.perk_hud) || self.perk_hud.size < 1)
	{
		return undefined;
	}
	for(i = 0; i < self.perk_hud.size; i++)
	{
		if(self.perk_hud[i].perk == perk)
		{
			return self.perk_hud[i];
		}
	}
	return undefined;
}

/*
	Name: function_3456e3a2
	Namespace: namespace_b8afaefc
	Checksum: 0xEB7EA91D
	Offset: 0x490
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 65
*/
function function_3456e3a2(perk, time)
{
	self endon("delete");
	self endon("destroy");
	hud = self function_5cc079f8(perk);
	if(!isdefined(hud) || (isdefined(hud.fading) && hud.fading))
	{
		return;
	}
	hud.time = time;
	hud.fading = 1;
	while(isdefined(hud) && hud.time > 0)
	{
		fade_time = 0.5;
		hud fadeOverTime(fade_time);
		hud.alpha = !hud.alpha;
		hud.time = hud.time - 0.5;
		wait(fade_time);
	}
	hud.alpha = 1;
	hud.fading = undefined;
}

/*
	Name: function_2582b006
	Namespace: namespace_b8afaefc
	Checksum: 0x1AC0D7E2
	Offset: 0x608
	Size: 0x498
	Parameters: 2
	Flags: None
	Line Number: 98
*/
function function_2582b006(perk, shader)
{
	if(!isdefined(self.perk_hud))
	{
		self.perk_hud = [];
	}
	if(!isdefined(shader))
	{
		shader = "t6_specialty_vultureaid";
	}
	if(perk == "specialty_vultureaid")
	{
		var_b19ebcc0 = newClientHudElem(self);
		var_b19ebcc0.foreground = 0;
		var_b19ebcc0.sort = 0.5;
		var_b19ebcc0.hidewheninmenu = 1;
		var_b19ebcc0.alignX = "left";
		var_b19ebcc0.alignY = "bottom";
		var_b19ebcc0.horzAlign = "left";
		var_b19ebcc0.vertAlign = "bottom";
		var_b19ebcc0.x = 80 + self.perk_hud.size * 25 - 5;
		var_b19ebcc0.y = var_b19ebcc0.y - 20;
		var_b19ebcc0.alpha = 0;
		var_b19ebcc0 SetShader("zm_hud_stink_ani_green", 48, 48);
		var_5cb34d80 = newClientHudElem(self);
		var_5cb34d80.foreground = 0;
		var_5cb34d80.sort = 0.5;
		var_5cb34d80.hidewheninmenu = 1;
		var_5cb34d80.alignX = "left";
		var_5cb34d80.alignY = "bottom";
		var_5cb34d80.horzAlign = "left";
		var_5cb34d80.vertAlign = "bottom";
		var_5cb34d80.x = 80 + self.perk_hud.size * 25 - 7;
		var_5cb34d80.y = var_5cb34d80.y - 20 + 12;
		var_5cb34d80.alpha = 0;
		var_5cb34d80 SetShader("specialty_vulture_zombies_glow", 48, 48);
	}
	hud = newClientHudElem(self);
	hud.perk = perk;
	hud.foreground = 0;
	hud.sort = 0.5;
	hud.hidewheninmenu = 1;
	hud.alignX = "left";
	hud.alignY = "bottom";
	hud.horzAlign = "left";
	hud.vertAlign = "bottom";
	hud.x = 80 + self.perk_hud.size * 25;
	hud.y = hud.y - 20;
	hud.alpha = 0;
	hud SetShader(shader, 48, 48);
	hud ScaleOverTime(0.5, 24, 24);
	hud fadeOverTime(0.5);
	hud.alpha = 1;
	if(isdefined(var_b19ebcc0))
	{
		hud.var_9fb7b404 = var_b19ebcc0;
	}
	if(isdefined(var_5cb34d80))
	{
		hud.var_8e808124 = var_5cb34d80;
	}
	self.perk_hud[self.perk_hud.size] = hud;
	return;
}

/*
	Name: function_fcd6c1a
	Namespace: namespace_b8afaefc
	Checksum: 0xD619A368
	Offset: 0xAA8
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 173
*/
function function_fcd6c1a(perk)
{
	new_array = [];
	for(i = 0; i < self.perk_hud.size; i++)
	{
		if(self.perk_hud[i].perk == perk)
		{
			self.perk_hud[i] thread fade_hud(0.5, 0);
			continue;
		}
		new_array[new_array.size] = self.perk_hud[i];
	}
	self.perk_hud = new_array;
	for(i = 0; i < self.perk_hud.size; i++)
	{
		self.perk_hud[i] move_hud(0.5, 10 + i * 30, self.perk_hud[i].y);
	}
}

/*
	Name: fade_hud
	Namespace: namespace_b8afaefc
	Checksum: 0x4309C5B
	Offset: 0xBE8
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 202
*/
function fade_hud(time, alpha)
{
	if(isdefined(self.var_b19ebcc0))
	{
		self.var_9fb7b404 fadeOverTime(time);
	}
	self.var_9fb7b404.alpha = alpha;
	if(isdefined(self.var_5cb34d80))
	{
		self.var_5cb34d80 fadeOverTime(time);
	}
	self.var_5cb34d80.alpha = alpha;
	self fadeOverTime(time);
	self.alpha = alpha;
	wait(time);
	if(isdefined(self.var_b19ebcc0))
	{
		self.var_9fb7b404 destroy();
	}
	if(isdefined(self.var_5cb34d80))
	{
		self.var_9fb7b404 destroy();
	}
	self destroy();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: move_hud
	Namespace: namespace_b8afaefc
	Checksum: 0xE9D2D7A6
	Offset: 0xD18
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 241
*/
function move_hud(time, x, y)
{
	self MoveOverTime(time);
	self.x = x;
	self.y = y;
	if(isdefined(self.var_9fb7b404))
	{
		self.var_9fb7b404 MoveOverTime(time);
		self.var_9fb7b404.x = x - 10;
		self.var_9fb7b404.y = y - 24;
	}
	if(isdefined(self.var_8e808124))
	{
		self.var_8e808124 MoveOverTime(time);
		self.var_8e808124.x = x - 12;
		self.var_8e808124.y = y + 12;
	}
}

/*
	Name: function_8fd06793
	Namespace: namespace_b8afaefc
	Checksum: 0xB75A1AEC
	Offset: 0xE30
	Size: 0x2C8
	Parameters: 4
	Flags: None
	Line Number: 270
*/
function function_8fd06793(origin, angles, perk, model)
{
	t_use = spawn("trigger_radius_use", origin + VectorScale((0, 0, 1), 60), 0, 40, 80);
	t_use.targetname = "zombie_vending";
	t_use.script_noteworthy = perk;
	t_use TriggerIgnoreTeam();
	if(level.script == "zm_zod" || level.script == "zm_genesis")
	{
		t_use thread function_cfe6acb0();
	}
	perk_machine = spawn("script_model", origin);
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	perk_machine.angles = angles;
	perk_machine SetModel(model);
	bump_trigger = spawn("trigger_radius", origin + VectorScale((0, 0, 1), 30), 0, 40, 80);
	bump_trigger.script_activated = 1;
	bump_trigger.script_sound = "zmb_perks_bump_bottle";
	bump_trigger.targetname = "audio_bump_trigger";
	collision = spawn("script_model", origin, 1);
	collision.angles = angles;
	collision SetModel("zm_collision_perks1");
	collision.script_noteworthy = "clip";
	collision disconnectpaths();
	t_use.clip = collision;
	t_use.machine = perk_machine;
	t_use.bump = bump_trigger;
	[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, bump_trigger, collision);
}

/*
	Name: function_cfe6acb0
	Namespace: namespace_b8afaefc
	Checksum: 0x2BA5E644
	Offset: 0x1100
	Size: 0x46
	Parameters: 0
	Flags: None
	Line Number: 312
*/
function function_cfe6acb0()
{
	wait(10);
	level notify("hash_c9b12a5a");
	level notify("tombstone_on");
	level notify("hash_8d7a012");
	level notify("hash_578ccd6f");
	level notify("electric_cherry_on");
}

