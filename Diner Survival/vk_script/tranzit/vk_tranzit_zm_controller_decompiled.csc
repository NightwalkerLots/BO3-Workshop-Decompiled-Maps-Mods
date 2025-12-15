#include scripts\codescripts\struct;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zm_usermap;

#namespace namespace_9b3992aa;

/*
	Name: __init__
	Namespace: namespace_9b3992aa
	Checksum: 0x1DB8725F
	Offset: 0x608
	Size: 0x60
	Parameters: 0
	Flags: AutoExec
	Line Number: 40
*/
function autoexec __init__()
{
	clientfield::register("toplayer", "custom_set_eye_color", 1, 4, "int", &function_c786b923, 0, 0);
	thread function_b8175bd9();
}

/*
	Name: function_c786b923
	Namespace: namespace_9b3992aa
	Checksum: 0xC0957043
	Offset: 0x670
	Size: 0x210
	Parameters: 7
	Flags: None
	Line Number: 56
*/
function function_c786b923(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal == 1)
	{
		level._override_eye_fx = "frost_iceforge/yellow_zombie_eyes";
		level._effect["powerup_on"] = "vk_fx/zm/_vk_zm_powerup_samantha";
		level._effect["powerup_on_solo"] = "vk_fx/zm/_vk_zm_powerup_samantha";
		level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_samantha";
	}
	else if(newVal == 2)
	{
		level._override_eye_fx = "frost_iceforge/blue_zombie_eyes";
		level._effect["powerup_on"] = "vk_fx/zm/_vk_zm_powerup_richtofen";
		level._effect["powerup_on_solo"] = "vk_fx/zm/_vk_zm_powerup_richtofen";
		level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_richtofen";
	}
	else if(newVal == 3)
	{
		level._override_eye_fx = "frost_iceforge/white_zombie_eyes";
		level._effect["powerup_on"] = "vk_fx/zm/_vk_zm_powerup_avogadro";
		level._effect["powerup_on_solo"] = "vk_fx/zm/_vk_zm_powerup_avogadro";
		level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_avogadro";
	}
	else if(newVal == 4)
	{
		level._override_eye_fx = "frost_iceforge/purple_zombie_eyes";
		level._effect["powerup_on"] = "vk_fx/zm/_vk_zm_powerup_monty";
		level._effect["powerup_on_solo"] = "vk_fx/zm/_vk_zm_powerup_monty";
		level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_monty";
	}
}

/*
	Name: function_b8175bd9
	Namespace: namespace_9b3992aa
	Checksum: 0xE13418A5
	Offset: 0x888
	Size: 0x5E
	Parameters: 0
	Flags: None
	Line Number: 98
*/
function function_b8175bd9()
{
	wait(1);
	level._effect["powerup_on"] = "vk_fx/zm/_vk_zm_powerup_samantha";
	level._effect["powerup_on_solo"] = "vk_fx/zm/_vk_zm_powerup_samantha";
	level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_samantha";
}

