#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\util_shared;

#namespace namespace_4b6e359c;

/*
	Name: init
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x258
	Size: 0x68
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec init()
{
	clientfield::register("clientuimodel", "hudItems.perks.temp", 1, 1, "int", undefined, 0, 1);
	util::REGISTER_SYSTEM("setPerkOverlayStyle", &function_75aa16e4);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_75aa16e4
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x2C8
	Size: 0x278
	Parameters: 3
	Flags: None
	Line Number: 35
*/
function function_75aa16e4(localClientNum, newState, oldState)
{
	if(!isdefined(newState))
	{
		return;
	}
	var_21aa4d87 = StrTok(newState, "|");
	if(!isdefined(var_21aa4d87))
	{
		return;
	}
	if(!isdefined(level.var_58278879))
	{
		level.var_58278879 = [];
	}
	if(isdefined(level.var_58278879[var_21aa4d87[0]]))
	{
		thread [[level.var_58278879[var_21aa4d87[0]]]](localClientNum, var_21aa4d87[1], var_21aa4d87[2]);
		return;
	}
	overlays = [];
	overlays[overlays.size] = "overlayStyle";
	overlays[overlays.size] = "overlayStyleGreen";
	overlays[overlays.size] = "overlayStyleBlue";
	overlays[overlays.size] = "overlayStyleYellow";
	overlays[overlays.size] = "overlayStyleRed";
	overlays[overlays.size] = "overlayStyleCounter";
	overlays[overlays.size] = "Meter";
	overlays[overlays.size] = "MeterBlue";
	if(isdefined(var_21aa4d87[0]) && isdefined(var_21aa4d87[1]) && var_21aa4d87[1] == "overlayReset")
	{
		for(i = 0; i < overlays.size; i++)
		{
			function_f861e3d8(localClientNum, var_21aa4d87[0], overlays[i], 0);
			wait(0.01);
		}
		return;
	}
	if(var_21aa4d87.size < 3)
	{
		return;
	}
	if(isdefined(var_21aa4d87[0]) && isdefined(var_21aa4d87[1]) && isdefined(var_21aa4d87[2]))
	{
		function_f861e3d8(localClientNum, var_21aa4d87[0], var_21aa4d87[1], var_21aa4d87[2]);
	}
}

/*
	Name: function_f861e3d8
	Namespace: namespace_4b6e359c
	Checksum: 0x424F4353
	Offset: 0x548
	Size: 0xC24
	Parameters: 4
	Flags: None
	Line Number: 93
*/
function function_f861e3d8(localClientNum, perk, var_d6ae4487, VAL)
{
	VAL = Int(VAL);
	if(!isdefined(level.var_7c451df6))
	{
		level.var_7c451df6 = [];
	}
	if(!isdefined(level.var_7c451df6[perk]))
	{
		level.var_7c451df6[perk] = [];
	}
	if(!isdefined(level.var_7c451df6[perk][localClientNum]))
	{
		level.var_7c451df6[perk][localClientNum] = spawnstruct();
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk);
		level.var_7c451df6[perk][localClientNum].base = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk);
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].base, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyle");
		level.var_7c451df6[perk][localClientNum].var_bf28ae12 = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyle");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_bf28ae12, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleGreen");
		level.var_7c451df6[perk][localClientNum].var_16164763 = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleGreen");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_16164763, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleBlue");
		level.var_7c451df6[perk][localClientNum].var_8148a9fa = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleBlue");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_8148a9fa, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleRed");
		level.var_7c451df6[perk][localClientNum].var_924a857 = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleRed");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_924a857, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleYellow");
		level.var_7c451df6[perk][localClientNum].var_5cb730a = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleYellow");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_5cb730a, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleCounter");
		level.var_7c451df6[perk][localClientNum].var_b4014df2 = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".overlayStyleCounter");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_b4014df2, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".Meter");
		level.var_7c451df6[perk][localClientNum].meter = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".Meter");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].meter, 0);
		wait(0.01);
		CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".MeterBlue");
		level.var_7c451df6[perk][localClientNum].var_66bd4bc0 = GetUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + perk + ".MeterBlue");
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_66bd4bc0, 0);
		wait(0.01);
	}
	if(var_d6ae4487 == "SetIconActive" && isdefined(level.var_7c451df6[perk][localClientNum].base))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].base, Int(VAL));
	}
	else if(var_d6ae4487 == "overlayStyle" && isdefined(level.var_7c451df6[perk][localClientNum].var_bf28ae12))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_bf28ae12, Int(VAL));
	}
	else if(var_d6ae4487 == "overlayStyleGreen" && isdefined(level.var_7c451df6[perk][localClientNum].var_16164763))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_16164763, Int(VAL));
	}
	else if(var_d6ae4487 == "overlayStyleYellow" && isdefined(level.var_7c451df6[perk][localClientNum].var_5cb730a))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_5cb730a, Int(VAL));
	}
	else if(var_d6ae4487 == "overlayStyleBlue" && isdefined(level.var_7c451df6[perk][localClientNum].var_8148a9fa))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_8148a9fa, Int(VAL));
	}
	else if(var_d6ae4487 == "overlayStyleRed" && isdefined(level.var_7c451df6[perk][localClientNum].var_924a857))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_924a857, Int(VAL));
	}
	else if(var_d6ae4487 == "overlayStyleCounter" && isdefined(level.var_7c451df6[perk][localClientNum].var_b4014df2))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_b4014df2, Int(VAL));
	}
	else if(var_d6ae4487 == "Meter" && isdefined(level.var_7c451df6[perk][localClientNum].meter))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].meter, Int(VAL));
	}
	else if(var_d6ae4487 == "MeterBlue" && isdefined(level.var_7c451df6[perk][localClientNum].var_66bd4bc0))
	{
		SetUIModelValue(level.var_7c451df6[perk][localClientNum].var_66bd4bc0, Int(VAL));
	}
}

