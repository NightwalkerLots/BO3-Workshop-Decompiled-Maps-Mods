#include scripts\codescripts\struct;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\zm_island_main_ee_quest;
#include scripts\zm\zm_island_spider_ee_quest;

#namespace namespace_48e6dffb;

/*
	Name: init
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x7C8
	Size: 0x540
	Parameters: 0
	Flags: None
	Line Number: 29
*/
function init()
{
	clientfield::register("clientuimodel", "zmInventory.widget_bucket_parts", 9000, 1, "int");
	clientfield::register("toplayer", "bucket_held", 9000, GetMinBitCountForNum(2), "int");
	clientfield::register("toplayer", "bucket_bucket_type", 9000, GetMinBitCountForNum(2), "int");
	clientfield::register("toplayer", "bucket_bucket_water_type", 9000, GetMinBitCountForNum(3), "int");
	clientfield::register("toplayer", "bucket_bucket_water_level", 9000, GetMinBitCountForNum(3), "int");
	clientfield::register("clientuimodel", "zmInventory.widget_skull_parts", 9000, 1, "int");
	clientfield::register("toplayer", "skull_skull_state", 9000, GetMinBitCountForNum(3), "int");
	clientfield::register("toplayer", "skull_skull_type", 9000, GetMinBitCountForNum(3), "int");
	clientfield::register("clientuimodel", "zmInventory.widget_gasmask_parts", 9000, 1, "int");
	clientfield::register("toplayer", "gaskmask_part_visor", 9000, 1, "int");
	clientfield::register("toplayer", "gaskmask_part_strap", 9000, 1, "int");
	clientfield::register("toplayer", "gaskmask_part_filter", 9000, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.gaskmask_gasmask_active", 9000, 1, "int");
	clientfield::register("toplayer", "gaskmask_gasmask_progress", 9000, GetMinBitCountForNum(10), "int");
	clientfield::register("clientuimodel", "zmInventory.widget_machinetools_parts", 9000, 1, "int");
	clientfield::register("toplayer", "valveone_part_lever", 9000, 1, "int");
	clientfield::register("toplayer", "valvetwo_part_lever", 9000, 1, "int");
	clientfield::register("toplayer", "valvethree_part_lever", 9000, 1, "int");
	clientfield::register("clientuimodel", "zmInventory.widget_wonderweapon_parts", 9000, 1, "int");
	clientfield::register("toplayer", "wonderweapon_part_wwi", 9000, 1, "int");
	clientfield::register("toplayer", "wonderweapon_part_wwii", 9000, 1, "int");
	clientfield::register("toplayer", "wonderweapon_part_wwiii", 9000, 1, "int");
	for(i = 0; i < GetDvarInt("com_maxclients"); i++)
	{
		clientfield::register("world", "player" + i + "wearableItem", 15000, 2, "int");
	}
	level thread function_835708af();
	level.var_cbda8818 = &function_4c051a3c;
}

/*
	Name: main
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0xD10
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function main()
{
	return;
}

/*
	Name: function_1a9a4375
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0xD20
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 86
*/
function function_1a9a4375()
{
	self endon("disconnect");
	self.var_df4182b1 = 0;
	self.var_4d1c77e5 = 0;
	while(1)
	{
		self waittill("hash_b5ecf1dd");
		self thread function_2cc6bcea();
		self playsoundtoplayer("zmb_gasmask_pickup", self);
		self thread function_8801a9c5();
		var_ba18d83c = 10;
		level clientfield::set("player" + self.entity_num + "wearableItem", 1);
		self thread zm_craftables::player_show_craftable_parts_ui(undefined, "zmInventory.gaskmask_gasmask_active", 0);
		self clientfield::set_to_player("gaskmask_gasmask_progress", var_ba18d83c);
		while(isdefined(self.var_df4182b1) && self.var_df4182b1 && var_ba18d83c > 0)
		{
			self waittill("hash_b56a74a8");
			self playsoundtoplayer("zmb_gasmask_use", self);
			if(isdefined(self.var_a69f7bc2) && self.var_a69f7bc2)
			{
				self thread function_6649823b(10);
			}
			else
			{
				var_ba18d83c = var_ba18d83c - 1;
				self thread function_6649823b(var_ba18d83c);
			}
			wait(1);
		}
		level clientfield::set("player" + self.entity_num + "wearableItem", 0);
		self notify("hash_7cbf7e55");
	}
}

/*
	Name: function_2cc6bcea
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0xF28
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 131
*/
function function_2cc6bcea()
{
	self endon("disconnect");
	mdl_body = self GetCharacterBodyModel();
	switch(mdl_body)
	{
		case "c_zom_der_nikolai_mpc_fb":
		{
			str_character = "nikolai";
			break;
		}
		case "c_zom_der_dempsey_mpc_fb":
		{
			str_character = "dempsey";
			break;
		}
		case "c_zom_der_richtofen_mpc_fb":
		{
			str_character = "richtofen";
			break;
		}
		case "c_zom_der_takeo_mpc_fb":
		{
			str_character = "takeo";
			break;
		}
	}
	if(!(isdefined(self.var_4d1c77e5) && self.var_4d1c77e5))
	{
		self Attach("c_zom_dlc2_" + str_character + "_head_gasmask");
		self.var_4d1c77e5 = 1;
	}
	self util::waittill_any("disconnect", "death", "player_lost_gasmask");
	if(isdefined(self.var_4d1c77e5) && self.var_4d1c77e5)
	{
		self Detach("c_zom_dlc2_" + str_character + "_head_gasmask");
		self.var_4d1c77e5 = 0;
	}
}

/*
	Name: function_6649823b
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x10A0
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 181
*/
function function_6649823b(var_ba18d83c)
{
	self notify("hash_cc68cc91");
	self endon("death");
	self endon("hash_cc68cc91");
	self clientfield::set_player_uimodel("zmInventory.gaskmask_gasmask_active", 1);
	self clientfield::set_to_player("gaskmask_gasmask_progress", var_ba18d83c);
	self waittill("hash_dd8e5266");
	self thread clientfield::set_player_uimodel("zmInventory.gaskmask_gasmask_active", 0);
	return;
}

/*
	Name: function_8801a9c5
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1148
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 203
*/
function function_8801a9c5()
{
	self endon("disconnect");
	self util::waittill_any("death", "player_lost_gasmask");
	self playsoundtoplayer("zmb_gasmask_break", self);
	self.var_df4182b1 = 0;
}

/*
	Name: function_835708af
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x11B0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 221
*/
function function_835708af()
{
	level flag::wait_till("initial_blackscreen_passed");
	zm_audio::zmbVoxAdd("perk", "specialty_armorvest", "der_perk_jugga", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_quickrevive", "der_perk_revive", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_fastreload", "der_perk_speed", 100, 0);
	zm_audio::zmbVoxAdd("perk", "specialty_doubletap2", "der_perk_double", 100, 0);
	for(i = 0; i < level.a_uts_craftables.size; i++)
	{
		if(level.a_uts_craftables[i].craftableStub.name == "gasmask")
		{
			level.a_uts_craftables[i].craftableStub.onFullyCrafted = &function_b6b29a16;
		}
	}
	level flag::wait_till("ww3_found");
	wait(0.05);
	level.var_2aacffb1 = &function_1454370f;
}

/*
	Name: function_1454370f
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1368
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 250
*/
function function_1454370f()
{
	if(!(isdefined(level.var_1821d194) && level.var_1821d194) && (!(isdefined(level.var_8c36ad2d) && level.var_8c36ad2d)) && self.archetype === "spider" && math::cointoss())
	{
		self.var_b4e06d32 = 1;
		self.b_ignore_cleanup = 1;
		self flag::init("spider_from_mars_identified");
		level.var_1821d194 = 1;
		level thread spider_ee_quest::function_f163b5b5();
		self thread spider_ee_quest::function_ed878303();
		self thread spider_ee_quest::function_241013f7();
		self thread function_26c024b8();
	}
}

/*
	Name: function_26c024b8
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1470
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 275
*/
function function_26c024b8()
{
	self endon("death");
	self flag::wait_till("spider_from_mars_identified");
	while(isdefined(self.a_water.size) && self.a_water.size > 1)
	{
		util::magic_bullet_shield(self);
		return;
		wait(0.05);
	}
}

/*
	Name: function_b6b29a16
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x14F0
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 297
*/
function function_b6b29a16(player)
{
	function_aa4f440c(self.origin, self.angles);
	var_6796a7a4 = GetEnt("mask_display", "targetname");
	var_6796a7a4 SetScale(1.5);
	var_6796a7a4 moveto(self.origin + AnglesToForward(self.angles) + (-5, 0, -105), 0.05);
	var_6796a7a4 RotateTo(self.angles + VectorScale((0, 1, 0), 90), 0.05);
	level.var_a57c5a85 = self.origin;
	foreach(player in level.activePlayers)
	{
		player thread function_17f3b633();
	}
	callback::on_spawned(&function_17f3b633);
	return 1;
}

/*
	Name: function_17f3b633
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1698
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 323
*/
function function_17f3b633()
{
	level endon("hash_aafaee53");
	for(;;)
	{
		self waittill("grenade_launcher_fire", grenade, weapon);
		if(!isdefined(grenade))
		{
		}
		else if(isdefined(weapon))
		{
			if(weapon === level.var_a4052592 || weapon === level.var_5c210a9a || weapon === level.var_361e9031)
			{
				grenade waittill("death");
				v_position = grenade.origin;
				if(!isdefined(v_position))
				{
				}
				else if(Distance(level.var_a57c5a85, v_position) < 25)
				{
					level.var_a69f7bc2 = 1;
					callback::remove_on_connect(&function_17f3b633);
					util::setClientSysState("aae_soulcounter", "&AAE_TIP_GASMASK_UPGRADED_TITLE");
					level notify("hash_aafaee53");
				}
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_aa4f440c
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x17D8
	Size: 0x148
	Parameters: 2
	Flags: None
	Line Number: 365
*/
function function_aa4f440c(v_origin, v_angles)
{
	width = 128;
	height = 128;
	length = 128;
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = v_origin;
	unitrigger_stub.angles = v_angles;
	unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.script_width = width;
	unitrigger_stub.script_height = height;
	unitrigger_stub.script_length = length;
	unitrigger_stub.require_look_at = 1;
	unitrigger_stub.prompt_and_visibility_func = &function_dbc8e9c0;
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &function_272fcc74);
}

/*
	Name: function_dbc8e9c0
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1928
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 393
*/
function function_dbc8e9c0(player)
{
	if(isdefined(level.var_a69f7bc2) && level.var_a69f7bc2)
	{
		if(isdefined(player.var_a69f7bc2) && player.var_a69f7bc2)
		{
			self setHintString(&"ZOMBIE_BUILD_PIECE_HAVE_ONE");
		}
		else
		{
			self setHintString(&"ZM_ISLAND_GASMASK_PICKUP");
		}
		return !player isFiring();
	}
	if(!player.var_df4182b1)
	{
		self setHintString(&"ZM_ISLAND_GASMASK_PICKUP");
	}
	else
	{
		self setHintString(&"ZOMBIE_BUILD_PIECE_HAVE_ONE");
	}
	return !player isFiring();
}

/*
	Name: function_272fcc74
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1A38
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 428
*/
function function_272fcc74()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player zm_utility::in_revive_trigger())
		{
			continue;
		}
		if(player.IS_DRINKING > 0)
		{
			continue;
		}
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		if(isdefined(level.var_a69f7bc2) && level.var_a69f7bc2)
		{
			if(!(isdefined(player.var_a69f7bc2) && player.var_a69f7bc2))
			{
				player.var_a69f7bc2 = 1;
				if(player.var_df4182b1)
				{
					player playsoundtoplayer("zmb_gasmask_pickup", player);
					player playsoundtoplayer("zmb_gasmask_use", player);
					player thread zm_craftables::player_show_craftable_parts_ui(undefined, "zmInventory.gaskmask_gasmask_active", 0);
					player clientfield::set_to_player("gaskmask_gasmask_progress", 10);
				}
			}
		}
		if(!player.var_df4182b1)
		{
			level thread function_b4c30297(self.stub, player);
			break;
		}
	}
}

/*
	Name: function_b4c30297
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1BD8
	Size: 0x38
	Parameters: 2
	Flags: None
	Line Number: 477
*/
function function_b4c30297(trig_stub, player)
{
	player.var_df4182b1 = 1;
	player notify("hash_b5ecf1dd");
}

/*
	Name: function_61f5d67c
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1C18
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 493
*/
function function_61f5d67c(str_flag)
{
	self endon("death");
	while(!flag::get(str_flag))
	{
		self waittill(str_flag);
	}
}

/*
	Name: function_4c051a3c
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1C60
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 512
*/
function function_4c051a3c()
{
	function_61f5d67c("player_has_aa_gun_ammo");
	var_16bdbe0a = struct::get("aa_gun_trigger", "targetname");
	var_16bdbe0a.script_unitrigger_type = "unitrigger_box_use";
	var_16bdbe0a.radius = 64;
	var_16bdbe0a.cursor_hint = "HINT_NOICON";
	while(!level flag::get("aa_gun_ee_complete"))
	{
		var_16bdbe0a.prompt_and_visibility_func = &function_9c02ad1;
		zm_unitrigger::register_static_unitrigger(var_16bdbe0a, &namespace_b3c23ec9::function_408069b5);
		level waittill("hash_e7ebaf47");
		zm_unitrigger::unregister_unitrigger(var_16bdbe0a);
		wait(1);
		var_16bdbe0a.prompt_and_visibility_func = &function_97bdb2f5;
		zm_unitrigger::register_static_unitrigger(var_16bdbe0a, &namespace_b3c23ec9::function_c0946f91);
		level waittill("hash_248f6385");
		zm_unitrigger::unregister_unitrigger(var_16bdbe0a);
		wait(1);
	}
}

/*
	Name: function_9c02ad1
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1DE0
	Size: 0x70
	Parameters: 1
	Flags: Private
	Line Number: 544
*/
function private function_9c02ad1(player)
{
	if(!level flag::get("player_has_aa_gun_ammo"))
	{
		self setHintString("");
		return 0;
	}
	self setHintString(&"AAE_ISLAND_LOAD_AA_GUN");
	return 1;
}

/*
	Name: function_97bdb2f5
	Namespace: namespace_48e6dffb
	Checksum: 0x424F4353
	Offset: 0x1E58
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 565
*/
function private function_97bdb2f5(player)
{
	self setHintString(&"AAE_ISLAND_FIRE_AA_GUN");
	return 1;
}

