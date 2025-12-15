#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;

#namespace namespace_d7595b00;

/*
	Name: __init__sytem__
	Namespace: namespace_d7595b00
	Checksum: 0x18EFB645
	Offset: 0x688
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_vulture_aid", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_d7595b00
	Checksum: 0x6B752148
	Offset: 0x6C8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_278c066b();
	}
}

/*
	Name: function_278c066b
	Namespace: namespace_d7595b00
	Checksum: 0x4866292B
	Offset: 0x700
	Size: 0x3C8
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function function_278c066b()
{
	zm_perks::register_perk_clientfields("specialty_vultureaid", &function_3dd9a76b, &function_bee10118);
	zm_perks::register_perk_effects("specialty_vultureaid", "specialty_vultureaid");
	zm_perks::register_perk_init_thread("specialty_vultureaid", &function_d782e0e8);
	if(!isdefined(level.var_74156493))
	{
		level.var_74156493 = [];
	}
	if(!isdefined(level.var_74156493["perk"]))
	{
		level.var_74156493["perk"] = [];
	}
	if(!isdefined(level.var_74156493["wallbuy"]))
	{
		level.var_74156493["wallbuy"] = [];
	}
	if(!isdefined(level.var_74156493["box"]))
	{
		level.var_74156493["box"] = [];
	}
	if(!isdefined(level.var_74156493["bgb"]))
	{
		level.var_74156493["bgb"] = [];
	}
	if(!isdefined(level.var_74156493["pap"]))
	{
		level.var_74156493["pap"] = [];
	}
	if(!isdefined(level.var_74156493["fizz"]))
	{
		level.var_74156493["fizz"] = [];
	}
	level.var_a4e54269["specialty_quickrevive"] = "harry/zmb_perks_vulture_aid/fxt_zmb_revive";
	level.var_a4e54269["specialty_armorvest"] = "harry/zmb_perks_vulture_aid/fxt_zmb_jugg";
	level.var_a4e54269["specialty_doubletap2"] = "harry/zmb_perks_vulture_aid/fxt_zmb_dbl_tap";
	level.var_a4e54269["specialty_fastreload"] = "harry/zmb_perks_vulture_aid/fxt_zmb_speed";
	level.var_a4e54269["specialty_deadshot"] = "harry/zmb_perks_vulture_aid/fxt_zmb_deadshot";
	level.var_a4e54269["specialty_phdflopper"] = "harry/zmb_perks_vulture_aid/fxt_zmb_flopper";
	level.var_a4e54269["specialty_staminup"] = "harry/zmb_perks_vulture_aid/fxt_zmb_stamin";
	level.var_a4e54269["specialty_additionalprimaryweapon"] = "harry/zmb_perks_vulture_aid/fxt_zmb_mule_kick";
	level.var_a4e54269["specialty_tombstone"] = "harry/zmb_perks_vulture_aid/fxt_zmb_tomb";
	level.var_a4e54269["specialty_whoswho"] = "harry/zmb_perks_vulture_aid/fxt_zmb_whoswho";
	level.var_a4e54269["specialty_electriccherry"] = "harry/zmb_perks_vulture_aid/fxt_zmb_cherry";
	level.var_a4e54269["specialty_vultureaid"] = "harry/zmb_perks_vulture_aid/fxt_zmb_vulture";
	level.var_a4e54269["specialty_widowswine"] = "harry/zmb_perks_vulture_aid/fxt_zmb_widow";
	level.var_a4e54269["rifle"] = "harry/zmb_perks_vulture_aid/fxt_zmb_rifle";
	level.var_a4e54269["magic_box"] = "harry/zmb_perks_vulture_aid/fxt_zmb_magic_box";
	level.var_a4e54269["gobblegum"] = "harry/zmb_perks_vulture_aid/fxt_zmb_gobblegum";
	level.var_a4e54269["pap"] = "harry/zmb_perks_vulture_aid/fxt_zmb_pap";
	level.var_a4e54269["fizz"] = "harry/zmb_perks_vulture_aid/fxt_zmb_wunderfizz";
	util::REGISTER_SYSTEM("vulture_aid_notify", &function_286cb814);
}

/*
	Name: function_d782e0e8
	Namespace: namespace_d7595b00
	Checksum: 0x4572DD56
	Offset: 0xAD0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 117
*/
function function_d782e0e8()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_vultureaid"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_vultureaid"] = "zombie/fx_perk_juggernaut_factory_zmb";
	return;
	ERROR: Bad function call
}

/*
	Name: function_3dd9a76b
	Namespace: namespace_d7595b00
	Checksum: 0x9ACF73B8
	Offset: 0xB78
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 140
*/
function function_3dd9a76b()
{
}

/*
	Name: function_bee10118
	Namespace: namespace_d7595b00
	Checksum: 0x9ACF73B8
	Offset: 0xB88
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 154
*/
function function_bee10118()
{
	return;
}

/*
	Name: function_286cb814
	Namespace: namespace_d7595b00
	Checksum: 0x72FEEA40
	Offset: 0xB98
	Size: 0x70
	Parameters: 3
	Flags: None
	Line Number: 169
*/
function function_286cb814(var_d60854, state, oldState)
{
	if(state != "")
	{
		players = GetLocalPlayers();
		players[var_d60854] function_bf31d480(state, var_d60854);
	}
}

/*
	Name: function_bf31d480
	Namespace: namespace_d7595b00
	Checksum: 0xCD555F29
	Offset: 0xC10
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 188
*/
function function_bf31d480(state, var_d60854)
{
	Array = function_1f12688(state);
	command = Array[0];
	type = Array[1];
	id = string_to_float(Array[2]);
	origin = (string_to_float(Array[3]), string_to_float(Array[4]), string_to_float(Array[5]));
	script_noteworthy = Array[6];
	switch(command)
	{
		case "create_vulture_waypoint":
		{
			function_2fe87a5e(var_d60854, type, id, origin, script_noteworthy);
			break;
		}
		case "stop_vulture_waypoint":
		{
			function_beac359e(var_d60854, type, id, origin, script_noteworthy);
			break;
		}
		case "change_vulture_waypoint":
		{
			function_2fe87a5e(var_d60854, type, id, origin, script_noteworthy);
			break;
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_2fe87a5e
	Namespace: namespace_d7595b00
	Checksum: 0x9E4A78F0
	Offset: 0xDC0
	Size: 0x258
	Parameters: 5
	Flags: None
	Line Number: 228
*/
function function_2fe87a5e(var_d60854, var_24a96452, id, origin, script_noteworthy)
{
	struct = undefined;
	if(isdefined(level.var_74156493[var_24a96452][id]))
	{
		struct = level.var_74156493[var_24a96452][id];
		continue;
	}
	struct = spawnstruct();
	if(!isdefined(struct.id))
	{
		struct.id = id;
	}
	if(!isdefined(struct.origin) || (isdefined(struct.origin) && struct.origin != origin))
	{
		struct.origin = origin;
	}
	if(!isdefined(struct.script_noteworthy) || (isdefined(struct.script_noteworthy) && struct.script_noteworthy != script_noteworthy))
	{
		struct.script_noteworthy = script_noteworthy;
	}
	players = GetLocalPlayers();
	if(players[var_d60854] hasPerk(var_d60854, "specialty_vultureaid"))
	{
		struct.FX = playFX(var_d60854, level.var_a4e54269[script_noteworthy], origin);
	}
	else if(isdefined(struct.FX))
	{
		stopfx(var_d60854, level.var_74156493[var_24a96452][id].FX);
	}
	if(!isdefined(level.var_74156493[var_24a96452][id]))
	{
		level.var_74156493[var_24a96452][id] = struct;
		return;
	}
	waittillframeend;
}

/*
	Name: function_beac359e
	Namespace: namespace_d7595b00
	Checksum: 0xA968033
	Offset: 0x1020
	Size: 0x1D0
	Parameters: 5
	Flags: None
	Line Number: 276
*/
function function_beac359e(var_d60854, var_24a96452, id, origin, script_noteworthy)
{
	struct = undefined;
	if(isdefined(level.var_74156493[var_24a96452][id]))
	{
		struct = level.var_74156493[var_24a96452][id];
		continue;
	}
	struct = spawnstruct();
	if(!isdefined(struct.id))
	{
		struct.id = id;
	}
	if(!isdefined(struct.origin) || (isdefined(struct.origin) && struct.origin != origin))
	{
		struct.origin = origin;
	}
	if(!isdefined(struct.script_noteworthy) || (isdefined(struct.script_noteworthy) && struct.script_noteworthy != script_noteworthy))
	{
		struct.script_noteworthy = script_noteworthy;
	}
	if(isdefined(struct.FX))
	{
		stopfx(var_d60854, level.var_74156493[var_24a96452][id].FX);
	}
	if(!isdefined(level.var_74156493[var_24a96452][id]))
	{
		level.var_74156493[var_24a96452][id] = struct;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: string_to_float
	Namespace: namespace_d7595b00
	Checksum: 0xD5ADDBA
	Offset: 0x11F8
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 319
*/
function string_to_float(string)
{
	var_93520b8a = function_1f12688(string);
	if(var_93520b8a.size == 1)
	{
		return Int(var_93520b8a[0]);
	}
	whole = Int(var_93520b8a[0]);
	decimal = 0;
	for(i = var_93520b8a[1].size - 1; i >= 0; i--)
	{
		decimal = decimal / 10 + Int(var_93520b8a[1][i]) / 10;
	}
	if(whole >= 0)
	{
		return whole + decimal;
		continue;
	}
	return whole - decimal;
}

/*
	Name: function_1f12688
	Namespace: namespace_d7595b00
	Checksum: 0x2DDD81D8
	Offset: 0x1330
	Size: 0x102
	Parameters: 1
	Flags: None
	Line Number: 350
*/
function function_1f12688(string)
{
	Array = [];
	Contents = "";
	for(i = 0; i < string.size; i++)
	{
		if(string[i] == "," || string[i] == "." || string[i] == "|")
		{
			Array[Array.size] = Contents;
			Contents = "";
			continue;
		}
		Contents = Contents + string[i];
	}
	if(Contents != "")
	{
		Array[Array.size] = Contents;
	}
	return Array;
}

