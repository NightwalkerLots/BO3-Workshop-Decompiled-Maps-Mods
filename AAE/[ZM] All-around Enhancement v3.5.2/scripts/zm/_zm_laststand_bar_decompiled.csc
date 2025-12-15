#include scripts\shared\clientfield_shared;

#namespace namespace_dbf10a20;

/*
	Name: init
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x108
	Size: 0xA0
	Parameters: 0
	Flags: AutoExec
	Line Number: 14
*/
function autoexec init()
{
	for(i = 0; i < GetDvarInt("com_maxclients"); i++)
	{
		clientfield::register("world", "bleedout_bar" + i, 1, GetMinBitCountForNum(45), "int", &update_bleedout_timer, 0, 0);
	}
}

/*
	Name: update_bleedout_timer
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x1B0
	Size: 0x148
	Parameters: 7
	Flags: None
	Line Number: 32
*/
function update_bleedout_timer(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	playerNum = Int(GetSubStr(fieldName, 12));
	level notify("update_bleedout_timer" + playerNum);
	level endon("update_bleedout_timer" + playerNum);
	model = GetUIModel(GetUIModelForController(localClientNum), "WorldSpaceIndicators.bleedOutModel" + playerNum + ".bleedOutPercent");
	if(isdefined(model))
	{
		if(newVal >= 45)
		{
			SetUIModelValue(model, 1);
		}
		else
		{
			thread animation_update(model, newVal + 1, playerNum);
		}
	}
}

/*
	Name: animation_update
	Namespace: namespace_dbf10a20
	Checksum: 0x424F4353
	Offset: 0x300
	Size: 0x118
	Parameters: 3
	Flags: None
	Line Number: 61
*/
function animation_update(model, newVal, playerNum)
{
	level notify("bleedout_bar" + playerNum);
	level endon("bleedout_bar" + playerNum);
	startTime = GetRealTime();
	timeSinceLastUpdate = 0;
	oldValue = newVal - 1;
	while(timeSinceLastUpdate <= 1)
	{
		timeSinceLastUpdate = GetRealTime() - startTime / 1000;
		lerpValue = LerpFloat(newVal, oldValue, timeSinceLastUpdate) / 45;
		SetUIModelValue(model, lerpValue);
		wait(0.016);
	}
}

