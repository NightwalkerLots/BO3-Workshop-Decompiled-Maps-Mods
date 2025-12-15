#include scripts\shared\aat_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;

#namespace namespace_3f9af9c2;

/*
	Name: __init__sytem__
	Namespace: namespace_3f9af9c2
	Checksum: 0x785C46EF
	Offset: 0x188
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 16
*/
function autoexec __init__sytem__()
{
	system::register("zm_aat_aethercollapse", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_3f9af9c2
	Checksum: 0x7A78A799
	Offset: 0x1C8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function __init__()
{
	if(!(isdefined(level.aat_in_use) && level.aat_in_use))
	{
		return;
	}
	AAT::register("zm_aat_aethercollapse", "zmui_zm_aat_dead_wire", "hud_t6_aat_aethercollapse");
	clientfield::register("actor", "zm_aat_aethercollapse" + "_zap", 1, 1, "int", &function_e676e346, 0, 0);
	clientfield::register("vehicle", "zm_aat_aethercollapse" + "_zap_vehicle", 1, 1, "int", &function_f3f48257, 0, 0);
	level._effect["zm_aat_aethercollapse"] = "zombie/fx_tesla_shock_zmb";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e676e346
	Namespace: namespace_3f9af9c2
	Checksum: 0x7F9F7976
	Offset: 0x2D0
	Size: 0xB0
	Parameters: 7
	Flags: None
	Line Number: 55
*/
function function_e676e346(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self.fx_aat_dead_wire_zap = PlayFXOnTag(localClientNum, "zombie/fx_tesla_shock_zmb", self, "J_SpineUpper");
	}
	else if(isdefined(self.fx_aat_dead_wire_zap))
	{
		stopfx(localClientNum, self.fx_aat_dead_wire_zap);
		self.fx_aat_dead_wire_zap = undefined;
	}
}

/*
	Name: function_f3f48257
	Namespace: namespace_3f9af9c2
	Checksum: 0x59B7B78A
	Offset: 0x388
	Size: 0xFE
	Parameters: 7
	Flags: None
	Line Number: 78
*/
function function_f3f48257(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		tag = "tag_body";
		v_tag = self GetTagOrigin(tag);
		if(!isdefined(v_tag))
		{
			tag = "tag_origin";
		}
		self.fx_aat_dead_wire_zap = PlayFXOnTag(localClientNum, "zombie/fx_tesla_shock_zmb", self, tag);
	}
	else if(isdefined(self.fx_aat_dead_wire_zap))
	{
		stopfx(localClientNum, self.fx_aat_dead_wire_zap);
		self.fx_aat_dead_wire_zap = undefined;
	}
}

