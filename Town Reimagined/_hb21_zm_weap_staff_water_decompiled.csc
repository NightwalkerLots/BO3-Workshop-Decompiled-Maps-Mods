#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\duplicaterenderbundle;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_zm_weapons;

#namespace namespace_18deef8b;

/*
	Name: __init__sytem__
	Namespace: namespace_18deef8b
	Checksum: 0xDEF7BBCA
	Offset: 0x278
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 25
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_water", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_18deef8b
	Checksum: 0xD1492415
	Offset: 0x2B8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 40
*/
function __init__()
{
	clientfield::register("actor", "ai_freezeover", 12000, 1, "int", &function_16619ccd, 0, 0);
	duplicate_render::set_dr_filter_framebuffer_duplicate("freeze", 10, "freeze_on", undefined, 1, "mc/mtl_freezeover", 1);
	callback::on_localplayer_spawned(&localplayer_spawned);
}

/*
	Name: localplayer_spawned
	Namespace: namespace_18deef8b
	Checksum: 0x94883B45
	Offset: 0x368
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 57
*/
function localplayer_spawned(localClientNum)
{
}

/*
	Name: function_a787aa75
	Namespace: namespace_18deef8b
	Checksum: 0x77EB7816
	Offset: 0x380
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 71
*/
function function_a787aa75(localClientNum)
{
}

/*
	Name: function_16619ccd
	Namespace: namespace_18deef8b
	Checksum: 0xD14D53E0
	Offset: 0x398
	Size: 0x108
	Parameters: 7
	Flags: None
	Line Number: 85
*/
function function_16619ccd(n_local_client, n_old, n_new, b_new_ent, b_initial_snap, str_field, b_was_time_jump)
{
	self endon("entity_shutdown");
	self duplicate_render::set_dr_flag("freeze_on", n_new);
	self duplicate_render::update_dr_filters(n_local_client);
	frozen = 0;
	while(frozen > 1)
	{
		self MapShaderConstant(n_local_client, 0, "scriptVector0", 1);
		return;
		continue;
		frozen = frozen + 0.02;
		self MapShaderConstant(n_local_client, 0, "scriptVector0", frozen);
		wait(0.01);
	}
}

