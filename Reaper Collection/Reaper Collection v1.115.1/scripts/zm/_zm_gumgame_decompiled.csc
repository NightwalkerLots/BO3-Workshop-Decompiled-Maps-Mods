#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_5b1d8f08;

/*
	Name: __init__
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x1D8
	Size: 0x20
	Parameters: 0
	Flags: AutoExec
	Line Number: 20
*/
function autoexec __init__()
{
	level thread function_e179d30b();
}

/*
	Name: __main__
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x200
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 35
*/
function __main__()
{
}

/*
	Name: function_e179d30b
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x210
	Size: 0x520
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function function_e179d30b()
{
	wait(3);
	var_a95e1085 = [];
	refs = [];
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_71832171 = 0;
		var_803e329f = checkStringValid(row[2]);
		if(var_803e329f == "bubblegum" || var_803e329f == "bubblegum_consumable")
		{
			var_71832171 = 1;
		}
		var_d277f374 = Int(row[16]);
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(isdefined(var_a0ec4ef3) && var_71832171)
		{
			var_a95e1085[var_a95e1085.size] = var_a0ec4ef3;
			refs[refs.size] = Int(row[0]);
		}
		index++;
	}
	var_f3c83828 = [];
	var_f3c83828[0] = "base";
	var_f3c83828[1] = "speckled";
	var_f3c83828[2] = "shiny";
	var_f3c83828[3] = "swirl";
	var_f3c83828[4] = "pinwheel";
	for(i = 0; i < var_a95e1085.size; i++)
	{
		if(!isdefined(level.bgb[var_a95e1085[i]]))
		{
			level.bgb[var_a95e1085[i]] = spawnstruct();
			level.bgb[var_a95e1085[i]].name = var_a95e1085[i];
			level.bgb[var_a95e1085[i]].item_index = refs[i];
			level.bgb[var_a95e1085[i]].var_c9e64d65 = checkStringValid(tableLookup("gamedata/stats/zm/zm_statstable.csv", 0, level.bgb[var_a95e1085[i]].item_index, 20));
		}
		level.bgb[var_a95e1085[i]].item_index = refs[i];
		level.bgb[var_a95e1085[i]].var_d277f374 = Int(tableLookup("gamedata/stats/zm/zm_statstable.csv", 0, level.bgb[var_a95e1085[i]].item_index, 16));
		level.bgb[var_a95e1085[i]].var_e0715b48 = 0;
		level.bgb[var_a95e1085[i]].camo_index = Int(tableLookup("gamedata/stats/zm/zm_statstable.csv", 0, level.bgb[var_a95e1085[i]].item_index, 5));
		level.bgb[var_a95e1085[i]].var_d3c80142 = "tag_gumball_" + level.bgb[var_a95e1085[i]].var_c9e64d65;
		level.bgb[var_a95e1085[i]].var_ece14434 = "tag_gumball_" + level.bgb[var_a95e1085[i]].var_c9e64d65 + "_" + var_f3c83828[level.bgb[var_a95e1085[i]].var_d277f374];
		level.var_318929eb[level.bgb[var_a95e1085[i]].item_index] = var_a95e1085[i];
	}
}

/*
	Name: checkStringValid
	Namespace: namespace_5b1d8f08
	Checksum: 0x424F4353
	Offset: 0x738
	Size: 0x24
	Parameters: 1
	Flags: None
	Line Number: 107
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

