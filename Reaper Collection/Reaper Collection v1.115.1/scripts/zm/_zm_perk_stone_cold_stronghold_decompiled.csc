#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_7c87917e;

/*
	Name: __init__sytem__
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 18
*/
function autoexec __init__sytem__()
{
	system::register("stone_cold_stronghold", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x260
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 33
*/
function __init__()
{
	zm_perks::register_perk_clientfields("specialty_stronghold", &function_124e3889, &function_75dd2cd4);
	zm_perks::register_perk_effects("specialty_stronghold", "jugger_light");
	zm_perks::register_perk_init_thread("specialty_stronghold", &function_d820cf1a);
}

/*
	Name: function_d820cf1a
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x2F0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function function_d820cf1a()
{
	if(isdefined(level.enable_magic) && level.enable_magic)
	{
		if(isdefined(level.var_5a09b9cd) && level.var_5a09b9cd)
		{
			level.var_9438a32d["cz_zombie_vending_stronghold_on"] = "specialty_stronghold";
			level.var_9438a32d["cz_zombie_vending_stronghold"] = "specialty_stronghold";
			if(!isdefined(level._effect["vulture_waypoint_" + "specialty_stronghold"]))
			{
				level._effect["vulture_waypoint_" + "specialty_stronghold"] = "vulture_fx/vulture_waypoint_" + "specialty_stronghold";
			}
		}
		level._effect["stone_cold_ring"] = "reaps_cz_stone_cold_stronghold/stonecold";
	}
}

/*
	Name: function_124e3889
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x3D0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 77
*/
function function_124e3889()
{
	clientfield::register("toplayer", "stone_cold_ring", 1, 1, "int", &function_ae3ec5da, 0, 1);
	return;
}

/*
	Name: function_75dd2cd4
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x428
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_75dd2cd4()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_ae3ec5da
	Namespace: namespace_7c87917e
	Checksum: 0x424F4353
	Offset: 0x438
	Size: 0x13A
	Parameters: 7
	Flags: None
	Line Number: 113
*/
function function_ae3ec5da(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	player = GetLocalPlayer(localClientNum);
	if(isdefined(player.var_ae3ec5da))
	{
		stopfx(localClientNum, player.var_ae3ec5da);
	}
	if(newVal)
	{
		if(!isdefined(player.var_ae3ec5da))
		{
			player.var_ae3ec5da = PlayFXOnTag(localClientNum, level._effect["stone_cold_ring"], player, "tag_origin");
		}
	}
	else if(isdefined(player.var_ae3ec5da))
	{
		stopfx(localClientNum, player.var_ae3ec5da);
		player.var_ae3ec5da = undefined;
	}
}

