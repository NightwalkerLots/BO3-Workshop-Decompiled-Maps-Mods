#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_filter;

#namespace _zm_pack_a_punch;

/*
	Name: __init__sytem__
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_pack_a_punch", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x288
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	level._effect["pap_working_fx"] = "dlc1/castle/fx_packapunch_castle";
	clientfield::register("zbarrier", "pap_working_FX", 5000, 1, "int", &pap_working_FX_handler, 0, 0);
}

/*
	Name: pap_working_FX_handler
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x2F8
	Size: 0xD8
	Parameters: 7
	Flags: None
	Line Number: 55
*/
function pap_working_FX_handler(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		pap_play_fx(localClientNum, 0, "base_jnt");
	}
	else if(isdefined(self.n_pap_fx))
	{
		stopfx(localClientNum, self.n_pap_fx);
		self.n_pap_fx = undefined;
	}
	wait(1);
	if(isdefined(self.mdl_fx))
	{
		self.mdl_fx delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: pap_play_fx
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3D8
	Size: 0x14C
	Parameters: 3
	Flags: Private
	Line Number: 85
*/
function private pap_play_fx(localClientNum, n_piece_index, str_tag)
{
	mdl_piece = self ZBarrierGetPiece(n_piece_index);
	if(isdefined(self.mdl_fx))
	{
		self.mdl_fx delete();
	}
	if(isdefined(self.n_pap_fx))
	{
		deletefx(localClientNum, self.n_pap_fx);
		self.n_pap_fx = undefined;
	}
	self.mdl_fx = util::spawn_model(localClientNum, "tag_origin", mdl_piece GetTagOrigin(str_tag), mdl_piece GetTagAngles(str_tag));
	self.mdl_fx LinkTo(mdl_piece, str_tag);
	self.n_pap_fx = PlayFXOnTag(localClientNum, level._effect["pap_working_fx"], self.mdl_fx, "tag_origin");
}

