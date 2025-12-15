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
#include scripts\shared\spawner_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_spawner;

#namespace namespace_4b6e359c;

/*
	Name: init
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x2C8
	Size: 0x70
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec init()
{
	clientfield::register("clientuimodel", "hudItems.perks.temp", 1, 1, "int");
	util::registerClientSys("setPerkOverlayStyle");
	callback::on_spawned(&function_5c8e38da);
}

/*
	Name: function_75aa16e4
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x340
	Size: 0x278
	Parameters: 4
	Flags: None
	Line Number: 45
*/
function function_75aa16e4(perk, var_fa534065, var_d1ba62b2, var_33e2f3a5)
{
	if(!isdefined(perk))
	{
		return;
	}
	self notify(perk + "" + var_fa534065 + "" + var_d1ba62b2);
	self endon(perk + "" + var_fa534065 + "" + var_d1ba62b2);
	while(isdefined(self.var_d6891cf6))
	{
		wait(0.05);
	}
	self.var_d6891cf6 = 1;
	if(!isdefined(var_d1ba62b2) || (isdefined(var_d1ba62b2) && var_d1ba62b2 != "SetIconActive"))
	{
		if(!namespace_851dc78f::function_20dc5a15(perk) && !self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && !self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			self.var_d6891cf6 = undefined;
			return;
		}
	}
	if(self.sessionstate == "spectator")
	{
		self.var_d6891cf6 = undefined;
		return;
	}
	if(!isdefined(var_fa534065) || !isdefined(var_d1ba62b2))
	{
		self.var_d6891cf6 = undefined;
		return;
	}
	if(var_d1ba62b2 == "overlayReset")
	{
		var_c899e066 = var_fa534065;
		var_c899e066 = var_c899e066 + "|" + var_d1ba62b2;
		self util::setClientSysState("setPerkOverlayStyle", var_c899e066, self);
	}
	if(!isdefined(var_33e2f3a5))
	{
		self.var_d6891cf6 = undefined;
		return;
	}
	var_c899e066 = var_fa534065;
	var_c899e066 = var_c899e066 + "|" + var_d1ba62b2;
	var_c899e066 = var_c899e066 + "|" + var_33e2f3a5;
	self util::setClientSysState("setPerkOverlayStyle", var_c899e066, self);
	self thread function_11f191b0();
	self.var_d6891cf6 = undefined;
}

/*
	Name: function_15a324c9
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x5C0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 105
*/
function function_15a324c9()
{
	self notify("hash_15a324c9");
	self endon("hash_15a324c9");
	while(1)
	{
		self function_11f191b0();
		wait(1);
	}
}

/*
	Name: function_5c8e38da
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x610
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 126
*/
function function_5c8e38da()
{
	wait(1);
	while(!isdefined(level._custom_perks))
	{
		wait(0.1);
	}
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && !self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && !self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].clientfield_set))
			{
				self [[level._custom_perks[perk].clientfield_set]](0);
			}
		}
	}
	self function_11f191b0();
}

/*
	Name: function_11f191b0
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x7A8
	Size: 0x8C
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function function_11f191b0()
{
	self notify("hash_a1bc077c");
	self endon("hash_a1bc077c");
	wait(0.05);
	wait(0.05);
	wait(0.05);
	wait(0.05);
	self clientfield::set_player_uimodel("hudItems.perks.temp", 1);
	wait(0.05);
	self clientfield::set_player_uimodel("hudItems.perks.temp", 0);
}

