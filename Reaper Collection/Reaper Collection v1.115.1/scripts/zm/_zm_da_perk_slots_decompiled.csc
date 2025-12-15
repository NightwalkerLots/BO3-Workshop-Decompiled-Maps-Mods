#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;

#namespace namespace_8338be6c;

/*
	Name: __init__
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x178
	Size: 0x30
	Parameters: 0
	Flags: AutoExec
	Line Number: 19
*/
function autoexec __init__()
{
	util::REGISTER_SYSTEM("setPerkHintstring", &function_419629b);
}

/*
	Name: function_419629b
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0xE4
	Parameters: 3
	Flags: None
	Line Number: 34
*/
function function_419629b(localClientNum, newState, oldState)
{
	if(!isdefined(newState))
	{
		return;
	}
	var_21aa4d87 = StrTok(newState, "|");
	if(!isdefined(var_21aa4d87) || (isdefined(var_21aa4d87) && var_21aa4d87.size < 2))
	{
		return;
	}
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.ColdWarHintstring." + var_21aa4d87[0]);
	SetUIModelValue(model, var_21aa4d87[1]);
}

