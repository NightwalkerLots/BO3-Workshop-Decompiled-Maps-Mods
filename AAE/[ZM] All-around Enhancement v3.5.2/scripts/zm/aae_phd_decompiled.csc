#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_8d90a844;

/*
	Name: __init__sytem__
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x1F8
	Size: 0x48
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	if(function_5e7a117f())
	{
		system::register("aae_perk_divetonuke", &__init__, undefined, undefined);
	}
}

/*
	Name: function_5e7a117f
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 34
*/
function function_5e7a117f()
{
	switch(GetDvarString("mapname"))
	{
		case "zm_zod":
		{
			return 1;
			break;
		}
		case "zm_factory":
		{
			return 1;
			break;
		}
		case "zm_castle":
		{
			return 1;
			break;
		}
		case "zm_island":
		{
			return 1;
			break;
		}
		case "zm_stalingrad":
		{
			return 1;
			break;
		}
		case "zm_genesis":
		{
			return 1;
			break;
		}
		case "zm_theater":
		{
			return 1;
			break;
		}
		case "zm_prototype":
		{
			return 1;
			break;
		}
		case "zm_asylum":
		{
			return 1;
			break;
		}
		case "zm_sumpf":
		{
			return 1;
			break;
		}
		case "zm_moon":
		{
			return 1;
			break;
		}
		case "zm_temple":
		{
			return 1;
			break;
		}
		case "zm_cosmodrome":
		{
			return 1;
			break;
		}
		case "zm_tomb":
		{
			return 1;
			break;
		}
		case "zm_prison":
		{
			return 1;
			break;
		}
		case "zm_k7":
		{
			return 1;
			break;
		}
	}
	return 0;
}

/*
	Name: __init__
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x3A0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 132
*/
function __init__()
{
	enable_divetonuke_perk_for_level();
}

/*
	Name: enable_divetonuke_perk_for_level
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x3C0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 147
*/
function enable_divetonuke_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_flakjacket", &function_f3f77d9b, &function_23eca8e);
	zm_perks::register_perk_effects("specialty_flakjacket", "divetonuke_light");
	zm_perks::register_perk_init_thread("specialty_flakjacket", &init_divetonuke);
}

/*
	Name: init_divetonuke
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x450
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 164
*/
function init_divetonuke()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		level._effect["divetonuke_light"] = "zombie/fx_perk_doubletap2_zmb";
	}
}

/*
	Name: function_f3f77d9b
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x490
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 182
*/
function function_f3f77d9b()
{
	clientfield::register("clientuimodel", "hudItems.perks.dive_to_nuke", 1, 2, "int", undefined, 0, 1);
	return;
}

/*
	Name: function_23eca8e
	Namespace: namespace_8d90a844
	Checksum: 0x424F4353
	Offset: 0x4D8
	Size: 0x4
	Parameters: 0
	Flags: None
	Line Number: 198
*/
function function_23eca8e()
{
}

