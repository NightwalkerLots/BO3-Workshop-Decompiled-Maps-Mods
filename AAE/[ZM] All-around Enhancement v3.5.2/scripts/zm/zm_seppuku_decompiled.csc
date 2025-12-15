#include scripts\_kj\kj_symbo_digsites;
#include scripts\codescripts\struct;
#include scripts\shared\ai\archetype_apothicon_fury;
#include scripts\shared\ai\archetype_thrasher;
#include scripts\shared\ai\margwa;
#include scripts\shared\ai\mechz;
#include scripts\shared\ai\raz;
#include scripts\shared\ai_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\filter_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\util_shared;
#include scripts\shared\vehicles\_sentinel_drone;
#include scripts\shared\visionset_mgr_shared;
#include scripts\sphynx\craftables\_zm_craft_brazen_bull_shield;
#include scripts\zm\_ambient_room;
#include scripts\zm\_dragon_whelp;
#include scripts\zm\_hb21_zm_powerups;
#include scripts\zm\_load;
#include scripts\zm\_zm_ai_avogadro;
#include scripts\zm\_zm_ai_fury;
#include scripts\zm\_zm_ai_mechz;
#include scripts\zm\_zm_ai_quad;
#include scripts\zm\_zm_ai_raps;
#include scripts\zm\_zm_ai_raz;
#include scripts\zm\_zm_ai_sentinel_drone;
#include scripts\zm\_zm_ai_wasp;
#include scripts\zm\_zm_elemental_zombies;
#include scripts\zm\_zm_pack_a_punch;
#include scripts\zm\_zm_perk_additionalprimaryweapon;
#include scripts\zm\_zm_perk_doubletap2;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_perk_juggernaut;
#include scripts\zm\_zm_perk_quick_revive;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_sleight_of_hand;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perk_widows_wine;
#include scripts\zm\_zm_powerup_carpenter;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_powerup_free_perk;
#include scripts\zm\_zm_powerup_full_ammo;
#include scripts\zm\_zm_powerup_insta_kill;
#include scripts\zm\_zm_powerup_island_seed;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_trap_electric;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;
#include scripts\zm\apoth_god;
#include scripts\zm\dragon_custom;
#include scripts\zm\dragon_powerup;
#include scripts\zm\symbo_zns_transports;
#include scripts\zm\zm_castle_ee_bossfight;
#include scripts\zm\zm_genesis_apothicon_fury;
#include scripts\zm\zm_island_planting;
#include scripts\zm\zm_usermap;

#namespace namespace_b138122a;

/*
	Name: main
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x2A0
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function main()
{
	clientfield::register("toplayer", "raindrop", 1, 1, "int", &function_4725f733, 0, 0);
	clientfield::register("clientuimodel", "zmHud.activeWeapon", 1, 2, "int", undefined, 0, 1);
	clientfield::register("clientuimodel", "zmHud.perkLimit", 1, 4, "int", undefined, 0, 1);
	RegisterClientField("world", "zomHealth", 1, 7, "int", &setSharedInventoryUIModels, 0);
	RegisterClientField("world", "voteRestart", 1, 2, "int", &setSharedInventoryUIModels, 0);
	RegisterClientField("world", "voteExit", 1, 2, "int", &setSharedInventoryUIModels, 0);
	for(i = 0; i < 4; i++)
	{
		clientfield::register("world", "zmHud.playerDead." + i, 1, 2, "int", &function_f5c4c0ee, 0, 1);
	}
	LuiLoad("ui.uieditor.menus.hud.t7hud_zm_seppukulirif");
	callback::on_localclient_connect(&ONCONNECT);
	zm_usermap::main();
	include_weapons();
	util::waitforclient(0);
	wait(1);
	level._effect["rise_burst"] = "Symbo/lava_spawn";
	level._effect["rise_dust"] = "Symbo/blank";
}

/*
	Name: brutus_spawn
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xCB8
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 105
*/
function private brutus_spawn(localClientNum)
{
	level._footstepCBFuncs[self.archetype] = &function_30475ebc;
}

/*
	Name: include_weapons
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xCF0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function include_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

/*
	Name: function_4725f733
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xD20
	Size: 0x80
	Parameters: 7
	Flags: None
	Line Number: 135
*/
function function_4725f733(localClientNum, var_3bf16bb3, n_new, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(n_new)
	{
		self thread do_rain(localClientNum);
	}
	else
	{
		self thread function_7b9e4ca(localClientNum);
	}
}

/*
	Name: function_707634fd
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xDA8
	Size: 0x70
	Parameters: 7
	Flags: None
	Line Number: 157
*/
function function_707634fd(localClientNum, var_3bf16bb3, n_new, b_new_ent, b_initial_snap, str_field_name, b_was_time_jump)
{
	if(n_new)
	{
		playFX(localClientNum, "zombie/fx_blood_torso_explo_lg_os_zmb", self.origin);
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_38e18ca8
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xE20
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 177
*/
function function_38e18ca8(localClientNum, n_opacity)
{
	if(!isdefined(n_opacity))
	{
		n_opacity = 0.6;
	}
	self notify("hash_89cf96a6");
	self endon("hash_89cf96a6");
	self endon("entityshutdown");
	self endon("death");
	self endon("hash_1577c4d7");
	while(isdefined(self))
	{
		playFX(localClientNum, "Symbo/rain_zeroy", self.origin);
		wait(0.2);
	}
}

/*
	Name: do_rain
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0xEC8
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 205
*/
function do_rain(localClientNum, n_opacity)
{
	if(!isdefined(n_opacity))
	{
		n_opacity = 0.6;
	}
	self notify("raining");
	self endon("entityshutdown");
	self endon("death");
	self endon("raining");
	self endon("hash_fb377a7e");
	filter::init_filter_sgen_sprite_rain(self);
	if(!isdefined(self.rainOpacity))
	{
		self.rainOpacity = n_opacity;
	}
	if(self.rainOpacity == 0)
	{
		filter::set_filter_sprite_rain_seed_offset(self, 0, n_opacity);
	}
	filter::enable_filter_sgen_sprite_rain(self, 0);
	for(;;)
	{
		self.rainOpacity = self.rainOpacity + 0.01;
		if(self.rainOpacity > 1)
		{
			self.rainOpacity = n_opacity;
		}
		function_ced36df6(localClientNum);
		filter::set_filter_sprite_rain_opacity(self, 0, self.rainOpacity);
		filter::set_filter_sprite_rain_elapsed(self, 0, self getClientTime());
		wait(0.016);
	}
}

/*
	Name: function_7b9e4ca
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1040
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 250
*/
function function_7b9e4ca(localClientNum)
{
	self notify("hash_fb377a7e");
	self endon("entityshutdown");
	self endon("death");
	self endon("raining");
	self endon("hash_fb377a7e");
	self.rainOpacity = 0;
	filter::set_filter_sprite_rain_opacity(self, 0, self.rainOpacity);
	filter::disable_filter_sprite_rain(self, 0);
}

/*
	Name: function_ced36df6
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x10D8
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 272
*/
function function_ced36df6(localClientNum)
{
	self endon("entityshutdown");
	self endon("death");
	self endon("raining");
	self endon("hash_fb377a7e");
	if(function_79ffe8d4(localClientNum) != level.vsmgr_default_info_name)
	{
		filter::disable_filter_sprite_rain(self, 0);
		while(function_79ffe8d4(localClientNum) != level.vsmgr_default_info_name)
		{
			wait(0.1);
		}
		wait(1);
		filter::init_filter_sgen_sprite_rain(self);
		filter::enable_filter_sgen_sprite_rain(self, 0);
	}
}

/*
	Name: function_79ffe8d4
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x11B8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 301
*/
function function_79ffe8d4(localClientNum)
{
	state = visionset_mgr::get_state(localClientNum, "overlay");
	curr_info = visionset_mgr::get_info("overlay", state.curr_slot);
	return curr_info.name;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7603b61d
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 319
*/
function function_7603b61d(localClientNum)
{
	self endon("disconnect");
	self endon("entityshutdown");
	self endon("death");
	while(1)
	{
		playFX(localClientNum, "Symbo/rain_player", self.origin);
		wait(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: ONCONNECT
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x12A8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 343
*/
function ONCONNECT(localClientNum)
{
	thread function_887652da(localClientNum);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_887652da
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 360
*/
function function_887652da(localClientNum)
{
	for(;;)
	{
		wait(0.01);
		health = renderhealthoverlayhealth(localClientNum);
		SetUIModelValue(CreateUIModel(GetUIModelForController(localClientNum), "zmHud.health"), health);
	}
}

/*
	Name: function_f5c4c0ee
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1360
	Size: 0xE8
	Parameters: 7
	Flags: None
	Line Number: 380
*/
function function_f5c4c0ee(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	subStr = GetSubStr(fieldName, 17);
	playerNum = Int(subStr);
	model = CreateUIModel(GetUIModelForController(localClientNum), "zmHud." + playerNum + ".playerDead");
	SetUIModelValue(model, newVal);
}

/*
	Name: function_30475ebc
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1450
	Size: 0x200
	Parameters: 5
	Flags: None
	Line Number: 398
*/
function function_30475ebc(localClientNum, pos, surface, Notetrack, bone)
{
	e_player = GetLocalPlayer(localClientNum);
	n_dist = DistanceSquared(pos, e_player.origin);
	n_mechz_dist = 250000;
	if(n_mechz_dist > 0)
	{
		n_scale = n_mechz_dist - n_dist / n_mechz_dist;
		return;
	}
	else
	{
	}
	if(n_scale > 1 || n_scale < 0)
	{
		return;
	}
	if(n_scale <= 0.01)
	{
		return;
	}
	earthquake_scale = n_scale * 0.1;
	if(earthquake_scale > 0.01)
	{
		e_player Earthquake(earthquake_scale, 0.1, pos, n_dist);
	}
	if(n_scale <= 1 && n_scale > 0.8)
	{
		e_player PlayRumbleOnEntity(localClientNum, "shotgun_fire");
	}
	else if(n_scale <= 0.8 && n_scale > 0.4)
	{
		e_player PlayRumbleOnEntity(localClientNum, "damage_heavy");
	}
	else
	{
		e_player PlayRumbleOnEntity(localClientNum, "reload_small");
	}
}

/*
	Name: setSharedInventoryUIModels
	Namespace: namespace_b138122a
	Checksum: 0x424F4353
	Offset: 0x1658
	Size: 0x7C
	Parameters: 7
	Flags: None
	Line Number: 448
*/
function setSharedInventoryUIModels(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	SetUIModelValue(CreateUIModel(GetUIModelForController(localClientNum), fieldName), newVal);
}

