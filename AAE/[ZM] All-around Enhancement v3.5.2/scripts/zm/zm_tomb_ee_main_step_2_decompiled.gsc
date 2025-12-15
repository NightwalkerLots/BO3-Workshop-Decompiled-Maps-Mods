#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_powerup_zombie_blood;
#include scripts\zm\_zm_sidequests;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\zm_tomb_chamber;
#include scripts\zm\zm_tomb_craftables;
#include scripts\zm\zm_tomb_ee_main;
#include scripts\zm\zm_tomb_utility;
#include scripts\zm\zm_tomb_vo;

#namespace zm_tomb_ee_main_step_2;

/*
	Name: init
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0x420
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function init()
{
	zm_sidequests::declare_sidequest_stage("little_girl_lost", "step_2", &init_stage, &stage_logic, &exit_stage);
}

/*
	Name: init_stage
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0x480
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function init_stage()
{
	level._cur_stage_name = "step_2";
	a_structs = struct::get_array("robot_head_staff", "targetname");
	foreach(unitrigger_stub in a_structs)
	{
		level thread create_robot_head_trigger(unitrigger_stub);
		util::wait_network_frame();
		util::wait_network_frame();
		util::wait_network_frame();
	}
}

/*
	Name: stage_logic
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0x588
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 69
*/
function stage_logic()
{
	level flag::wait_till("ee_all_staffs_placed");
	playsoundatposition("zmb_squest_robot_alarm_blast", (-14, -1, 871));
	wait(3);
	util::wait_network_frame();
	zm_sidequests::stage_completed("little_girl_lost", level._cur_stage_name);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: exit_stage
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0x618
	Size: 0x1A8
	Parameters: 1
	Flags: None
	Line Number: 90
*/
function exit_stage(success)
{
	a_structs = struct::get_array("robot_head_staff", "targetname");
	foreach(struct in a_structs)
	{
		struct thread remove_plinth();
		util::wait_network_frame();
		util::wait_network_frame();
		util::wait_network_frame();
	}
	foreach(w_staff in level.a_elemental_staffs)
	{
		e_upgraded_staff = zm_tomb_craftables::get_staff_info_from_weapon_name(w_staff.w_weapon, 0);
		e_upgraded_staff.ee_in_use = undefined;
	}
	level notify("hash_4c5352e3");
}

/*
	Name: remove_plinth
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0x7C8
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 118
*/
function remove_plinth()
{
	playFX(level._effect["teleport_1p"], self.m_plinth.origin);
	playsoundatposition("zmb_footprintbox_disappear", self.m_plinth.origin);
	wait(3);
	if(isdefined(self.m_plinth.m_staff))
	{
		self.m_plinth.m_staff Unlink();
		self.m_plinth.m_staff.origin = self.m_plinth.v_old_origin;
		self.m_plinth.m_staff.angles = self.m_plinth.v_old_angles;
		self.m_plinth.e_staff.ee_in_use = undefined;
	}
	self.m_sign delete();
	self.m_plinth delete();
	self.m_coll delete();
	zm_unitrigger::unregister_unitrigger(self);
	return;
	~self.m_plinth.m_staff.angles;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: create_robot_head_trigger
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0x940
	Size: 0x418
	Parameters: 1
	Flags: None
	Line Number: 149
*/
function create_robot_head_trigger(unitrigger_stub)
{
	playFX(level._effect["teleport_1p"], unitrigger_stub.origin);
	playsoundatposition("zmb_footprintbox_disappear", unitrigger_stub.origin);
	wait(3);
	unitrigger_stub.radius = 50;
	unitrigger_stub.height = 256;
	unitrigger_stub.script_unitrigger_type = "unitrigger_radius_use";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.require_look_at = 1;
	m_coll = spawn("script_model", unitrigger_stub.origin);
	m_coll SetModel("drone_collision");
	unitrigger_stub.m_coll = m_coll;
	util::wait_network_frame();
	m_plinth = spawn("script_model", unitrigger_stub.origin);
	m_plinth.angles = unitrigger_stub.angles;
	m_plinth SetModel("p7_zm_ori_staff_holder");
	unitrigger_stub.m_plinth = m_plinth;
	util::wait_network_frame();
	m_sign = spawn("script_model", unitrigger_stub.origin);
	m_sign SetModel("p7_zm_ori_runes");
	m_sign LinkTo(unitrigger_stub.m_plinth, "tag_origin", (0, 15, 40));
	m_sign HidePart("j_fire");
	m_sign HidePart("j_ice");
	m_sign HidePart("j_lightning");
	m_sign HidePart("j_wind");
	switch(unitrigger_stub.script_noteworthy)
	{
		case "fire":
		{
			m_sign ShowPart("j_fire");
			break;
		}
		case "water":
		{
			m_sign ShowPart("j_ice");
			break;
		}
		case "lightning":
		{
			m_sign ShowPart("j_lightning");
			break;
		}
		case "air":
		{
			m_sign ShowPart("j_wind");
			break;
		}
	}
	m_sign namespace_43a18dd5::make_zombie_blood_entity();
	unitrigger_stub.m_sign = m_sign;
	unitrigger_stub.origin = unitrigger_stub.origin + VectorScale((0, 0, 1), 30);
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &robot_head_trigger_think);
}

/*
	Name: robot_head_trigger_think
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0xD60
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 214
*/
function robot_head_trigger_think()
{
	self endon("kill_trigger");
	str_weap_staff = "staff_" + self.script_noteworthy;
	w_staff = level.a_elemental_staffs[str_weap_staff].w_weapon;
	e_upgraded_staff = zm_tomb_craftables::get_staff_info_from_weapon_name(w_staff, 0);
	while(1)
	{
		self waittill("trigger", player);
		if(player hasweapon(e_upgraded_staff.w_weapon))
		{
			player TakeWeapon(e_upgraded_staff.w_weapon);
			zm_tomb_craftables::clear_player_staff(e_upgraded_staff.w_weapon);
			level.n_ee_robot_staffs_planted++;
			if(level.n_ee_robot_staffs_planted == 4)
			{
				level flag::set("ee_all_staffs_placed");
			}
			w_staff thread place_staff(self.stub.m_plinth);
		}
	}
}

/*
	Name: place_staff
	Namespace: zm_tomb_ee_main_step_2
	Checksum: 0x424F4353
	Offset: 0xED0
	Size: 0x11C
	Parameters: 1
	Flags: None
	Line Number: 247
*/
function place_staff(m_plinth)
{
	m_staff = GetEnt("craftable_" + self.name + "_zm", "targetname");
	m_plinth.e_staff = self;
	m_plinth.m_staff = m_staff;
	m_plinth.v_old_angles = m_staff.angles;
	m_plinth.v_old_origin = m_staff.origin;
	m_staff LinkTo(m_plinth, "tag_origin", VectorScale((0, 0, 1), 14), VectorScale((0, 1, 0), 90));
	m_staff show();
	m_plinth playsound("zmb_squest_robot_place_staff");
}

