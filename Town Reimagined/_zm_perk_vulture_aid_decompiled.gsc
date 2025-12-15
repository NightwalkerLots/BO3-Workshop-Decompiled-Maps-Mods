#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perk_utility;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_pers_upgrades_system;
#include scripts\zm\_zm_powerup_double_points;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_d7595b00;

/*
	Name: __init__sytem__
	Namespace: namespace_d7595b00
	Checksum: 0xB6F3C4B3
	Offset: 0x8B8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_vulture_aid", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_d7595b00
	Checksum: 0x72EEF1BE
	Offset: 0x8F8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 53
*/
function __init__()
{
	if(isdefined(1) && 1)
	{
		function_278c066b();
	}
}

/*
	Name: function_278c066b
	Namespace: namespace_d7595b00
	Checksum: 0xE55DED66
	Offset: 0x930
	Size: 0x428
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_278c066b()
{
	zm_perks::register_perk_basic_info("specialty_vultureaid", "vultureaid", 3000, "Hold ^3[{+activate}]^7 for Vulture Aid [Cost: &&1]", GetWeapon("zombie_perk_bottle_vulture"));
	zm_perks::register_perk_precache_func("specialty_vultureaid", &function_e5a3775d);
	zm_perks::register_perk_clientfields("specialty_vultureaid", &function_fa00a2df, &function_728d9e0c);
	zm_perks::register_perk_machine("specialty_vultureaid", &function_40f2246a);
	zm_perks::register_perk_threads("specialty_vultureaid", &function_3d5eb518, &function_a794730a);
	zm_perks::register_perk_host_migration_params("specialty_vultureaid", "vending_vulture", "specialty_vultureaid");
	level.var_74156493 = [];
	level.var_74156493["perk"] = [];
	level.var_74156493["wallbuy"] = [];
	level.var_74156493["box"] = [];
	level.var_74156493["bgb"] = [];
	level.var_74156493["pap"] = [];
	level.var_74156493["fizz"] = [];
	level.no_target_override = &no_target_override;
	level thread function_eb811e08();
	level thread function_bdf1fe21();
	util::registerClientSys("vulture_aid_notify");
	callback::on_connect(&function_5ccfa496);
	level thread function_5f3596b();
	if(level.script == "zm_zod")
	{
		namespace_b8afaefc::function_8fd06793((1992, -3417, -400), VectorScale((0, 1, 0), 180), "specialty_vultureaid", "p6_zm_vending_vultureaid");
	}
	if(level.script == "zm_factory")
	{
		namespace_b8afaefc::function_8fd06793((-704, -1048, 200), (0, 0, 0), "specialty_vultureaid", "p6_zm_vending_vultureaid");
	}
	if(level.script == "zm_castle")
	{
		namespace_b8afaefc::function_8fd06793((833, 3772, 672), VectorScale((0, 1, 0), 270), "specialty_vultureaid", "p6_zm_vending_vultureaid");
	}
	if(level.script == "zm_island")
	{
		namespace_b8afaefc::function_8fd06793((2091, 1070, -703), VectorScale((0, 1, 0), 40), "specialty_vultureaid", "p6_zm_vending_vultureaid");
	}
	if(level.script == "zm_stalingrad")
	{
		namespace_b8afaefc::function_8fd06793((164, 1911, 336), VectorScale((0, -1, 0), 34), "specialty_vultureaid", "p6_zm_vending_vultureaid");
	}
	if(level.script == "zm_genesis")
	{
		namespace_b8afaefc::function_8fd06793((1457, 4168, 1478), VectorScale((0, 1, 0), 90), "specialty_vultureaid", "p6_zm_vending_vultureaid");
	}
}

/*
	Name: function_e5a3775d
	Namespace: namespace_d7595b00
	Checksum: 0xB48C17BC
	Offset: 0xD60
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 128
*/
function function_e5a3775d()
{
	script = ToLower(GetDvarString("mapname"));
	if(namespace_b8afaefc::function_fc92a42d() && script != "zm_factory")
	{
		level._effect["specialty_vultureaid"] = "zombie/fx_perk_juggernaut_zmb";
		continue;
	}
	level._effect["specialty_vultureaid"] = "zombie/fx_perk_juggernaut_factory_zmb";
	level.machine_assets["specialty_vultureaid"] = spawnstruct();
	level.machine_assets["specialty_vultureaid"].weapon = GetWeapon("zombie_perk_bottle_vulture");
	level.machine_assets["specialty_vultureaid"].off_model = "p6_zm_vending_vultureaid";
	level.machine_assets["specialty_vultureaid"].on_model = "p6_zm_vending_vultureaid_on";
}

/*
	Name: function_fa00a2df
	Namespace: namespace_d7595b00
	Checksum: 0x9ACF73B8
	Offset: 0xEA0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 153
*/
function function_fa00a2df()
{
}

/*
	Name: function_728d9e0c
	Namespace: namespace_d7595b00
	Checksum: 0x682CB7AA
	Offset: 0xEB0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 167
*/
function function_728d9e0c(state)
{
}

/*
	Name: function_40f2246a
	Namespace: namespace_d7595b00
	Checksum: 0x32C9828E
	Offset: 0xEC8
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 181
*/
function function_40f2246a(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "mus_perks_vulture_jingle";
	use_trigger.script_string = "vulture_perk";
	use_trigger.script_label = "mus_perks_vulture_sting";
	use_trigger.target = "vending_vulture";
	perk_machine.script_string = "vulture_perk";
	perk_machine.targetname = "vending_vulture";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "vulture_perk";
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3d5eb518
	Namespace: namespace_d7595b00
	Checksum: 0x2930961E
	Offset: 0xF90
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 207
*/
function function_3d5eb518(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_2582b006("specialty_vultureaid", "t6_specialty_vultureaid");
	self notify("specialty_vultureaid" + "_start");
	self thread function_b69a250d();
}

/*
	Name: function_a794730a
	Namespace: namespace_d7595b00
	Checksum: 0x83AA79EE
	Offset: 0x1010
	Size: 0x80
	Parameters: 3
	Flags: None
	Line Number: 224
*/
function function_a794730a(b_pause, str_perk, str_result)
{
	self namespace_b8afaefc::function_fcd6c1a("specialty_vultureaid");
	self notify("perk_lost", str_perk);
	self notify("specialty_vultureaid" + "_stop");
	self thread function_27c70902();
}

/*
	Name: function_aa749f72
	Namespace: namespace_d7595b00
	Checksum: 0x51816042
	Offset: 0x1098
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 242
*/
function function_aa749f72()
{
	var_9e191e8b = GetEntArray("vending_vulture", "targetname");
	foreach(perk_machine in var_9e191e8b)
	{
		if(isdefined(perk_machine.model) && perk_machine.model == "p6_zm_vending_vultureaid_on")
		{
			perk_machine zm_perks::perk_fx(undefined, 1);
			perk_machine thread zm_perks::perk_fx("vultureaid");
		}
	}
}

/*
	Name: function_5f3596b
	Namespace: namespace_d7595b00
	Checksum: 0x8EA696BE
	Offset: 0x11B0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 265
*/
function function_5f3596b()
{
	wait(0.05);
	level flag::wait_till("initial_blackscreen_passed");
	function_1eacb179();
	while(1)
	{
		reason = level util::waittill_any_return("update_vulture", "weapon_fly_away_start", "powerup fire sale");
		if(reason == "weapon_fly_away_start")
		{
			level thread function_15d59a00();
		}
		if(reason == "powerup fire sale")
		{
			level thread function_bfe9df40();
		}
		function_1eacb179();
	}
}

/*
	Name: function_b69a250d
	Namespace: namespace_d7595b00
	Checksum: 0x8AD6BEA6
	Offset: 0x1298
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 295
*/
function function_b69a250d()
{
	// Could not fully decompile function; skipped
}

/*
	Name: function_27c70902
	Namespace: namespace_d7595b00
	Checksum: 0x10F589E8
	Offset: 0x12D8
	Size: 0x78
	Parameters: 3
	Flags: None
	Line Number: 310
*/
function function_27c70902(b_pause, str_perk, str_result)
{
	self.var_1f9ae3bf = 0;
	self setblur(0, 1);
	self notify("hash_ce612f55");
	self notify("perk_lost", str_perk);
	function_1eacb179();
}

/*
	Name: function_286cb814
	Namespace: namespace_d7595b00
	Checksum: 0xB0EA1E5A
	Offset: 0x1358
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 329
*/
function function_286cb814(notify_string)
{
	util::setClientSysState("vulture_aid_notify", notify_string, self);
}

/*
	Name: function_5ccfa496
	Namespace: namespace_d7595b00
	Checksum: 0xF99EA61B
	Offset: 0x1390
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 344
*/
function function_5ccfa496()
{
	self thread function_1676c4d6();
}

/*
	Name: function_1676c4d6
	Namespace: namespace_d7595b00
	Checksum: 0x12BA48A
	Offset: 0x13B8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 359
*/
function function_1676c4d6()
{
	while(1)
	{
		self waittill("spawned_player");
		function_1eacb179();
	}
}

/*
	Name: function_bfe9df40
	Namespace: namespace_d7595b00
	Checksum: 0x1B3EA989
	Offset: 0x13F0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 378
*/
function function_bfe9df40()
{
	while(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])
	{
		wait(0.05);
	}
	function_1eacb179();
}

/*
	Name: function_15d59a00
	Namespace: namespace_d7595b00
	Checksum: 0x5D614AE0
	Offset: 0x1448
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 397
*/
function function_15d59a00()
{
	level flag::wait_till_clear("moving_chest_now");
	function_1eacb179();
}

/*
	Name: function_2fe87a5e
	Namespace: namespace_d7595b00
	Checksum: 0xBFC1AC6B
	Offset: 0x1488
	Size: 0x240
	Parameters: 4
	Flags: None
	Line Number: 413
*/
function function_2fe87a5e(var_24a96452, id, origin, script_noteworthy)
{
	struct = undefined;
	if(isdefined(level.var_74156493[var_24a96452][id]))
	{
		struct = level.var_74156493[var_24a96452][id];
		continue;
	}
	struct = spawnstruct();
	if(!isdefined(struct.id))
	{
		struct.id = id;
	}
	if(!isdefined(struct.origin) || (isdefined(struct.origin) && struct.origin != origin))
	{
		struct.origin = origin;
	}
	if(!isdefined(struct.script_noteworthy) || (isdefined(struct.script_noteworthy) && struct.script_noteworthy != script_noteworthy))
	{
		struct.script_noteworthy = script_noteworthy;
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		util::setClientSysState("vulture_aid_notify", "create_vulture_waypoint," + var_24a96452 + "," + struct.id + "," + struct.origin + "," + struct.script_noteworthy, players[i]);
	}
	if(!isdefined(level.var_74156493[var_24a96452][id]))
	{
		level.var_74156493[var_24a96452][id] = struct;
	}
}

/*
	Name: function_beac359e
	Namespace: namespace_d7595b00
	Checksum: 0xC86254CF
	Offset: 0x16D0
	Size: 0x240
	Parameters: 4
	Flags: None
	Line Number: 455
*/
function function_beac359e(var_24a96452, id, origin, script_noteworthy)
{
	struct = undefined;
	if(isdefined(level.var_74156493[var_24a96452][id]))
	{
		struct = level.var_74156493[var_24a96452][id];
		continue;
	}
	struct = spawnstruct();
	if(!isdefined(struct.id))
	{
		struct.id = id;
	}
	if(!isdefined(struct.origin) || (isdefined(struct.origin) && struct.origin != origin))
	{
		struct.origin = origin;
	}
	if(!isdefined(struct.script_noteworthy) || (isdefined(struct.script_noteworthy) && struct.script_noteworthy != script_noteworthy))
	{
		struct.script_noteworthy = script_noteworthy;
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		util::setClientSysState("vulture_aid_notify", "stop_vulture_waypoint," + var_24a96452 + "," + struct.id + "," + struct.origin + "," + struct.script_noteworthy, players[i]);
	}
	if(!isdefined(level.var_74156493[var_24a96452][id]))
	{
		level.var_74156493[var_24a96452][id] = struct;
	}
}

/*
	Name: function_1eacb179
	Namespace: namespace_d7595b00
	Checksum: 0x8DCBE5F
	Offset: 0x1918
	Size: 0x958
	Parameters: 0
	Flags: None
	Line Number: 497
*/
function function_1eacb179()
{
	wait(0.5);
	perk_machines = GetEntArray("zombie_vending", "targetname");
	if(isdefined(perk_machines) && perk_machines.size > 0)
	{
		for(i = 0; i < perk_machines.size; i++)
		{
			origin = "" + Int(perk_machines[i].origin[0]) + "," + Int(perk_machines[i].origin[1]) + "," + Int(perk_machines[i].origin[2]);
			if(!isdefined(perk_machines[i].var_e7243ca8))
			{
				perk_machines[i].var_e7243ca8 = level.var_74156493["perk"].size;
			}
			perk_machines[i] function_2fe87a5e("perk", perk_machines[i].var_e7243ca8, origin, perk_machines[i].script_noteworthy);
		}
	}
	weapon_spawns = struct::get_array("weapon_upgrade", "targetname");
	if(isdefined(weapon_spawns) && weapon_spawns.size > 0)
	{
		for(i = 0; i < weapon_spawns.size; i++)
		{
			origin = "" + Int(weapon_spawns[i].origin[0]) + "," + Int(weapon_spawns[i].origin[1]) + "," + Int(weapon_spawns[i].origin[2]);
			if(!isdefined(weapon_spawns[i].var_e7243ca8))
			{
				weapon_spawns[i].var_e7243ca8 = level.var_74156493["wallbuy"].size;
			}
			weapon_spawns[i] function_2fe87a5e("wallbuy", weapon_spawns[i].var_e7243ca8, origin, "rifle");
		}
	}
	var_f23998db = level.chests;
	if(isdefined(var_f23998db) && var_f23998db.size > 0)
	{
		for(i = 0; i < var_f23998db.size; i++)
		{
			origin = "" + Int(var_f23998db[i].origin[0]) + "," + Int(var_f23998db[i].origin[1]) + "," + Int(var_f23998db[i].origin[2]);
			if(!isdefined(var_f23998db[i].var_e7243ca8))
			{
				var_f23998db[i].var_e7243ca8 = level.var_74156493["box"].size;
			}
			if(isdefined(level.zombie_vars["zombie_powerup_fire_sale_on"]) && level.zombie_vars["zombie_powerup_fire_sale_on"])
			{
				var_f23998db[i] function_2fe87a5e("box", var_f23998db[i].var_e7243ca8, origin, "magic_box");
				continue;
			}
			if(isdefined(level flag::get("moving_chest_now")) && level flag::get("moving_chest_now"))
			{
				var_f23998db[i] function_beac359e("box", var_f23998db[i].var_e7243ca8, origin, "magic_box");
				continue;
			}
			if(level.chest_index == i)
			{
				var_f23998db[i] function_2fe87a5e("box", var_f23998db[i].var_e7243ca8, origin, "magic_box");
				continue;
			}
			var_f23998db[i] function_beac359e("box", var_f23998db[i].var_e7243ca8, origin, "magic_box");
		}
	}
	bgb_machines = GetEntArray("bgb_machine_use", "targetname");
	if(isdefined(bgb_machines) && bgb_machines.size > 0)
	{
		for(i = 0; i < bgb_machines.size; i++)
		{
			origin = "" + Int(bgb_machines[i].origin[0]) + "," + Int(bgb_machines[i].origin[1]) + "," + Int(bgb_machines[i].origin[2]) + 64;
			if(!isdefined(bgb_machines[i].var_e7243ca8))
			{
				bgb_machines[i].var_e7243ca8 = level.var_74156493["bgb"].size;
			}
			bgb_machines[i] function_2fe87a5e("bgb", bgb_machines[i].var_e7243ca8, origin, "gobblegum");
		}
	}
	var_9b2cb1a9 = GetEntArray("pack_a_punch", "script_noteworthy");
	if(isdefined(var_9b2cb1a9) && var_9b2cb1a9.size > 0)
	{
		for(i = 0; i < var_9b2cb1a9.size; i++)
		{
			origin = "" + Int(var_9b2cb1a9[i].origin[0]) + "," + Int(var_9b2cb1a9[i].origin[1]) + "," + Int(var_9b2cb1a9[i].origin[2]);
			if(!isdefined(var_9b2cb1a9[i].var_e7243ca8))
			{
				var_9b2cb1a9[i].var_e7243ca8 = level.var_74156493["pap"].size;
			}
			var_9b2cb1a9[i] function_2fe87a5e("pap", var_9b2cb1a9[i].var_e7243ca8, origin, "pap");
		}
	}
}

/*
	Name: function_bdf1fe21
	Namespace: namespace_d7595b00
	Checksum: 0xEBC2F8D4
	Offset: 0x2278
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 592
*/
function function_bdf1fe21()
{
	while(1)
	{
		level waittill("powerup_dropped", powerup);
		var_38e1f6cf = spawn("script_model", powerup.origin, 1, 1, 1);
		var_38e1f6cf.linked = 1;
		var_38e1f6cf.angles = powerup.angles;
		var_38e1f6cf SetModel("tag_origin");
		var_38e1f6cf EnableLinkTo();
		var_38e1f6cf LinkTo(powerup, "tag_origin");
		if(powerup.powerup_name == "minigun" || powerup.powerup_name == "ww_grenade")
		{
			PlayFXOnTag("harry/fx_perk_vulture_blue_powerups_glow", var_38e1f6cf, "tag_origin");
			continue;
		}
		PlayFXOnTag("harry/fx_perk_vulture_green_powerups_glow", var_38e1f6cf, "tag_origin");
		var_38e1f6cf thread function_40603dea(powerup);
	}
}

/*
	Name: function_40603dea
	Namespace: namespace_d7595b00
	Checksum: 0xD8424B39
	Offset: 0x2408
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 623
*/
function function_40603dea(powerup)
{
	self endon("delete");
	while(1)
	{
		if(!isdefined(powerup))
		{
			break;
		}
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] hasPerk("specialty_vultureaid"))
			{
				self setvisibletoplayer(players[i]);
				continue;
			}
			self setinvisibletoplayer(players[i]);
		}
		wait(0.05);
	}
	if(isdefined(self))
	{
		self delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_eb811e08
	Namespace: namespace_d7595b00
	Checksum: 0xA0B2E636
	Offset: 0x2518
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 662
*/
function function_eb811e08()
{
	while(1)
	{
		zombies = GetAISpeciesArray("axis", "all");
		if(isdefined(zombies) && zombies.size > 0)
		{
			for(i = 0; i < zombies.size; i++)
			{
				if(!isdefined(zombies[i].var_d23800d6) || !zombies[i].var_d23800d6)
				{
					zombies[i].var_d23800d6 = 1;
					zombies[i] function_2bd00420();
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_2bd00420
	Namespace: namespace_d7595b00
	Checksum: 0xBF1C1AAF
	Offset: 0x2618
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 692
*/
function function_2bd00420()
{
	if(RandomInt(100) > 65)
	{
		return;
	}
	var_2d24558f = function_6adcb3ce();
	if(!isdefined(var_2d24558f) || var_2d24558f.size < 4)
	{
		n_total_weight = 99;
		continue;
	}
	n_total_weight = 66;
	n_cutoff_ammo = 33;
	n_cutoff_points = 66;
	n_roll = RandomInt(n_total_weight);
	if(n_roll < n_cutoff_ammo)
	{
		self thread function_4106f04f("ammo");
	}
	else if(n_roll > n_cutoff_ammo && n_roll < n_cutoff_points)
	{
		self thread function_4106f04f("points");
		continue;
	}
	self thread function_c875e67a();
}

/*
	Name: function_f6fcba0e
	Namespace: namespace_d7595b00
	Checksum: 0xF8FB449E
	Offset: 0x2770
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 730
*/
function function_f6fcba0e(playerName)
{
	return GetEntArray(playerName + "_vulture_drop", "targetname");
}

/*
	Name: function_4106f04f
	Namespace: namespace_d7595b00
	Checksum: 0xB13711DE
	Offset: 0x27B0
	Size: 0x438
	Parameters: 1
	Flags: None
	Line Number: 745
*/
function function_4106f04f(type)
{
	self waittill("death");
	if(isdefined(self.attacker) && isPlayer(self.attacker) && self.attacker hasPerk("specialty_vultureaid"))
	{
		var_2acd7271 = function_f6fcba0e(self.attacker.playerName);
		if(isdefined(var_2acd7271) && var_2acd7271.size > 0 && var_2acd7271.size > 20)
		{
			return;
		}
		trace = playerphysicstrace(self.origin + VectorScale((0, 0, 1), 80), self.origin - VectorScale((0, 0, 1), 1000));
		self.drop_model = spawn("script_model", trace + VectorScale((0, 0, 1), 5));
		playable_area = GetEntArray("player_volume", "script_noteworthy");
		valid_drop = 0;
		for(i = 0; i < playable_area.size; i++)
		{
			if(self.drop_model istouching(playable_area[i]))
			{
				valid_drop = 1;
				break;
			}
		}
		if(!valid_drop)
		{
			self.drop_model delete();
			return;
		}
		self.drop_model.targetname = self.attacker.playerName + "_vulture_drop";
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			self.drop_model setinvisibletoplayer(players[i]);
		}
		self.drop_model setvisibletoplayer(self.attacker);
		if(isdefined(self.drop_model))
		{
			self.drop_model playsound("zmb_perks_vulture_drop");
			self.drop_model PlayLoopSound("zmb_perks_vulture_loop", 1);
			switch(type)
			{
				case "points":
				{
					self.drop_model SetModel("p6_zm_perk_vulture_points");
					self.drop_model thread function_3e21baaf(self.attacker);
					break;
				}
				case "ammo":
				{
					self.drop_model SetModel("p6_zm_perk_vulture_ammo");
					self.drop_model thread function_2b66a3e0(self.attacker);
					break;
				}
			}
			self.drop_model thread function_68ec26f5(self.attacker);
			self.drop_model thread function_431b5ae0(self.attacker);
			self.drop_model thread function_ee072a04(self.attacker);
			if(isdefined(self.drop_model))
			{
				PlayFXOnTag("harry/fx_perk_vulture_drops_glow", self.drop_model, "tag_origin");
			}
		}
	}
}

/*
	Name: function_2b66a3e0
	Namespace: namespace_d7595b00
	Checksum: 0x7F0A0006
	Offset: 0x2BF0
	Size: 0x3A8
	Parameters: 1
	Flags: None
	Line Number: 819
*/
function function_2b66a3e0(owner)
{
	self endon("delete");
	while(1)
	{
		if(Distance(owner.origin, self.origin) < 48 && isalive(owner) && !owner laststand::player_is_in_laststand())
		{
			owner playsound("zmb_perks_vulture_pickup");
			current_weapon = owner GetCurrentWeapon();
			if(isdefined(current_weapon.isClipOnly) && current_weapon.isClipOnly)
			{
				current_ammo = owner GetWeaponAmmoClip(current_weapon);
				owner giveMaxAmmo(current_weapon);
				clip_size = owner getammocount(current_weapon);
				fraction = Int(clip_size / 10);
				var_ed05c9a = current_ammo + fraction;
				if(var_ed05c9a > clip_size)
				{
					var_ed05c9a = clip_size;
				}
				owner SetWeaponAmmoClip(current_weapon, var_ed05c9a);
				continue;
			}
			current_ammo = owner GetWeaponAmmoStock(current_weapon);
			var_de2c8bfa = current_weapon.maxAmmo;
			var_8f5e1e9b = 0;
			if(current_weapon.dualWieldWeapon != level.weaponNone)
			{
				var_8f5e1e9b = current_weapon.dualWieldWeapon.maxAmmo;
			}
			var_de2c8bfa = var_de2c8bfa + var_8f5e1e9b;
			clip = current_weapon.clipSize;
			var_11761dd6 = 0;
			if(current_weapon.dualWieldWeapon != level.weaponNone)
			{
				var_11761dd6 = current_weapon.dualWieldWeapon.clipSize;
			}
			clip = Int(clip + var_11761dd6);
			var_ed934c5b = Int(clip / 10);
			if(var_ed934c5b < 1)
			{
				var_ed934c5b = 1;
			}
			var_ed05c9a = Int(current_ammo + var_ed934c5b);
			if(var_ed05c9a > var_de2c8bfa)
			{
				var_ed05c9a = var_de2c8bfa;
			}
			owner SetWeaponAmmoStock(current_weapon, var_ed05c9a);
			self notify("grabbed");
			self delete();
			break;
		}
		wait(0.05);
	}
}

/*
	Name: function_3e21baaf
	Namespace: namespace_d7595b00
	Checksum: 0x5ED0C6F
	Offset: 0x2FA0
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 886
*/
function function_3e21baaf(owner)
{
	self endon("delete");
	while(1)
	{
		if(Distance(owner.origin, self.origin) < 48 && isalive(owner) && !owner laststand::player_is_in_laststand())
		{
			owner playsound("zmb_perks_vulture_pickup");
			owner playsound("zmb_perks_vulture_money");
			score = 10;
			rand = RandomInt(2);
			if(rand == 1)
			{
				score = 20;
			}
			score = score * level.zombie_vars[owner.team]["zombie_point_scalar"];
			owner zm_score::add_to_player_score(score);
			break;
		}
		wait(0.05);
	}
	self delete();
}

/*
	Name: function_68ec26f5
	Namespace: namespace_d7595b00
	Checksum: 0x2CA9815C
	Offset: 0x3120
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 920
*/
function function_68ec26f5(player)
{
	self endon("delete");
	player endon("disconnect");
	player waittill("hash_ce612f55");
	self delete();
	return;
}

/*
	Name: function_431b5ae0
	Namespace: namespace_d7595b00
	Checksum: 0x2E9B598C
	Offset: 0x3170
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 939
*/
function function_431b5ae0(player)
{
	self endon("delete");
	wait(10);
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self Hide();
			continue;
		}
		self show();
		PlayFXOnTag("harry/fx_perk_vulture_drops_glow", self, "tag_origin");
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	self delete();
}

/*
	Name: function_ee072a04
	Namespace: namespace_d7595b00
	Checksum: 0x66B850B0
	Offset: 0x3270
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 977
*/
function function_ee072a04(player)
{
	self endon("delete");
	while(1)
	{
		player waittill("hash_d19204b9");
		break;
	}
	self delete();
}

/*
	Name: function_c875e67a
	Namespace: namespace_d7595b00
	Checksum: 0xFD2E867A
	Offset: 0x32C8
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 998
*/
function function_c875e67a()
{
	var_c6ddde0c = spawn("script_model", self GetTagOrigin("j_spine4"), 1, 1, 1);
	var_c6ddde0c.linked = 1;
	var_c6ddde0c.targetname = "vulture_mist";
	var_c6ddde0c.angles = self.angles;
	var_c6ddde0c SetModel("tag_origin");
	var_c6ddde0c EnableLinkTo();
	var_c6ddde0c LinkTo(self, "j_spine4");
	var_c6ddde0c thread function_49d0412();
	self PlayLoopSound("zmb_perks_vulture_stink_loop");
	while(1)
	{
		if(!isalive(self))
		{
			break;
		}
		PlayFXOnTag("harry/fx_perk_vulture_green_mist_v2", var_c6ddde0c, "tag_origin");
		wait(1);
	}
	var_c6ddde0c Unlink();
	if(!zm_utility::check_point_in_playable_area(self GetTagOrigin("j_spine4")))
	{
		var_c6ddde0c delete();
		return;
	}
	var_c6ddde0c.linked = 0;
	for(i = 0; i < 16; i++)
	{
		PlayFXOnTag("harry/fx_perk_vulture_green_mist_v2", var_c6ddde0c, "tag_origin");
		wait(1);
	}
	var_c6ddde0c StopLoopSound(1);
	var_c6ddde0c delete();
	return;
}

/*
	Name: function_49d0412
	Namespace: namespace_d7595b00
	Checksum: 0xD1344D97
	Offset: 0x3538
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1045
*/
function function_49d0412()
{
	self endon("delete");
	while(1)
	{
		players = GetPlayers();
		for(p = 0; p < players.size; p++)
		{
			if(players[p] hasPerk("specialty_vultureaid"))
			{
				self setvisibletoplayer(players[p]);
				continue;
			}
			self setinvisibletoplayer(players[p]);
		}
		wait(0.05);
	}
}

/*
	Name: function_6adcb3ce
	Namespace: namespace_d7595b00
	Checksum: 0x991D5A81
	Offset: 0x3618
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1074
*/
function function_6adcb3ce()
{
	return GetEntArray("vulture_mist", "targetname");
}

/*
	Name: function_6bf42131
	Namespace: namespace_d7595b00
	Checksum: 0x2E61694F
	Offset: 0x3648
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 1089
*/
function function_6bf42131()
{
	self endon("hash_ce612f55");
	self.var_ea2acdce = undefined;
	self.var_1f9ae3bf = 0;
	while(1)
	{
		hud = undefined;
		for(i = 0; i < self.perk_hud.size; i++)
		{
			if(self.perk_hud[i].perk == "specialty_vultureaid")
			{
				hud = self.perk_hud[i];
				break;
			}
		}
		var_ea2acdce = 0;
		var_2d24558f = function_6adcb3ce();
		if(isdefined(var_2d24558f) && var_2d24558f.size > 0)
		{
			for(i = 0; i < var_2d24558f.size; i++)
			{
				if(isdefined(var_2d24558f[i].linked) && var_2d24558f[i].linked)
				{
					continue;
				}
				if(Distance(self.origin, var_2d24558f[i].origin) < 64)
				{
					var_ea2acdce = 1;
					break;
				}
			}
		}
		else if(var_ea2acdce)
		{
			if(!isdefined(self.var_ea2acdce))
			{
				self.var_ea2acdce = 1;
				self playsoundtoplayer("zmb_perks_vulture_stink_start", self);
			}
			if(self.var_1f9ae3bf < 1)
			{
				if(isdefined(hud))
				{
					hud.var_9fb7b404.alpha = hud.var_9fb7b404.alpha + 0.02;
					hud.var_8e808124.alpha = hud.var_8e808124.alpha + 0.02;
				}
				self.var_1f9ae3bf = self.var_1f9ae3bf + 0.02;
			}
			if(self.var_1f9ae3bf >= 1)
			{
				if(isdefined(hud))
				{
					hud.var_9fb7b404.alpha = 1;
					hud.var_8e808124.alpha = 1;
				}
				self.var_1f9ae3bf = 1;
				self.ignoreme = 1;
			}
		}
		else if(isdefined(self.var_ea2acdce) && self.var_ea2acdce)
		{
			self.var_ea2acdce = undefined;
			self playsoundtoplayer("zmb_perks_vulture_stink_stop", self);
		}
		if(self.var_1f9ae3bf > 0)
		{
			hud.var_9fb7b404.alpha = hud.var_9fb7b404.alpha - 0.02;
			hud.var_8e808124.alpha = hud.var_8e808124.alpha - 0.02;
			self.var_1f9ae3bf = self.var_1f9ae3bf - 0.02;
		}
		if(self.var_1f9ae3bf <= 0)
		{
			hud.var_9fb7b404.alpha = 0;
			hud.var_8e808124.alpha = 0;
			self.var_1f9ae3bf = 0;
			self.ignoreme = 0;
		}
		wait(0.05);
	}
}

/*
	Name: validate_and_set_no_target_position
	Namespace: namespace_d7595b00
	Checksum: 0x28859C44
	Offset: 0x3A50
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1181
*/
function validate_and_set_no_target_position(position)
{
	if(isdefined(position))
	{
		goal_point = GetClosestPointOnNavMesh(position.origin, 100);
		if(isdefined(goal_point))
		{
			self SetGoal(goal_point);
			self.has_exit_point = 1;
			return 1;
		}
	}
	return 0;
}

/*
	Name: no_target_override
	Namespace: namespace_d7595b00
	Checksum: 0xC61A48B7
	Offset: 0x3AD8
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 1206
*/
function no_target_override(zombie)
{
	if(isdefined(zombie.has_exit_point))
	{
		return;
	}
	players = level.players;
	dist_zombie = 0;
	dist_player = 0;
	dest = 0;
	if(isdefined(level.zm_loc_types["dog_location"]))
	{
		locs = Array::randomize(level.zm_loc_types["dog_location"]);
		for(i = 0; i < locs.size; i++)
		{
			found_point = 0;
			foreach(player in players)
			{
				if(player laststand::player_is_in_laststand())
				{
					continue;
				}
				away = VectorNormalize(self.origin - player.origin);
				endPos = self.origin + VectorScale(away, 600);
				dist_zombie = DistanceSquared(locs[i].origin, endPos);
				dist_player = DistanceSquared(locs[i].origin, player.origin);
				if(dist_zombie < dist_player)
				{
					dest = i;
					found_point = 1;
					continue;
				}
				found_point = 0;
			}
			if(found_point)
			{
				if(zombie validate_and_set_no_target_position(locs[i]))
				{
					return;
				}
			}
		}
	}
	escape_position = zombie get_escape_position_in_current_zone();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	escape_position = zombie get_escape_position();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	zombie.has_exit_point = 1;
	zombie SetGoal(zombie.origin);
}

/*
	Name: get_escape_position
	Namespace: namespace_d7595b00
	Checksum: 0x8DA69D92
	Offset: 0x3E20
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1273
*/
function get_escape_position()
{
	self endon("death");
	str_zone = self.zone_name;
	if(!isdefined(str_zone))
	{
		str_zone = self.zone_name;
	}
	if(isdefined(str_zone))
	{
		a_zones = get_adjacencies_to_zone(str_zone);
		a_wait_locations = get_wait_locations_in_zones(a_zones);
		s_farthest = self get_farthest_wait_location(a_wait_locations);
	}
	return s_farthest;
}

/*
	Name: get_wait_locations_in_zones
	Namespace: namespace_d7595b00
	Checksum: 0x7A0EE1F5
	Offset: 0x3EE0
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 1300
*/
function get_wait_locations_in_zones(a_zones)
{
	a_wait_locations = [];
	foreach(zone in a_zones)
	{
		a_wait_locations = function_41d88412(a_wait_locations, level.zones[zone].a_loc_types["dog_location"]);
	}
	return a_wait_locations;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_adjacencies_to_zone
	Namespace: namespace_d7595b00
	Checksum: 0x11C0225E
	Offset: 0x3FB8
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 1321
*/
function get_adjacencies_to_zone(str_zone)
{
	a_adjacencies = [];
	a_adjacencies[0] = str_zone;
	a_adjacent_zones = getArrayKeys(level.zones[str_zone].adjacent_zones);
	for(i = 0; i < a_adjacent_zones.size; i++)
	{
		if(level.zones[str_zone].adjacent_zones[a_adjacent_zones[i]].is_connected)
		{
			if(!isdefined(a_adjacencies))
			{
				a_adjacencies = [];
			}
			else if(!IsArray(a_adjacencies))
			{
				a_adjacencies = Array(a_adjacencies);
			}
		}
		a_adjacencies[a_adjacencies.size] = a_adjacent_zones[i];
	}
	return a_adjacencies;
}

/*
	Name: get_escape_position_in_current_zone
	Namespace: namespace_d7595b00
	Checksum: 0x907951AF
	Offset: 0x40E0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1354
*/
function get_escape_position_in_current_zone()
{
	self endon("death");
	str_zone = self.zone_name;
	if(!isdefined(str_zone))
	{
		str_zone = self.zone_name;
	}
	if(isdefined(str_zone))
	{
		a_wait_locations = get_wait_locations_in_zone(str_zone);
		if(isdefined(a_wait_locations))
		{
			s_farthest = self get_farthest_wait_location(a_wait_locations);
		}
	}
	return s_farthest;
}

/*
	Name: function_41d88412
	Namespace: namespace_d7595b00
	Checksum: 0x161A31D5
	Offset: 0x4188
	Size: 0xB8
	Parameters: 2
	Flags: None
	Line Number: 1383
*/
function function_41d88412(var_fc01d778, var_6e0946b3)
{
	temp_array = [];
	for(i = 0; i < var_fc01d778.size; i++)
	{
		Array::add(temp_array, var_fc01d778[i]);
	}
	for(i = 0; i < var_6e0946b3.size; i++)
	{
		Array::add(temp_array, var_6e0946b3[i]);
	}
	return temp_array;
}

/*
	Name: get_wait_locations_in_zone
	Namespace: namespace_d7595b00
	Checksum: 0xEC819C0E
	Offset: 0x4248
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 1407
*/
function get_wait_locations_in_zone(zone)
{
	if(isdefined(level.zones[zone].a_loc_types["dog_location"]))
	{
		a_wait_locations = [];
		a_wait_locations = function_41d88412(a_wait_locations, level.zones[zone].a_loc_types["dog_location"]);
		return a_wait_locations;
	}
	return undefined;
}

/*
	Name: get_farthest_wait_location
	Namespace: namespace_d7595b00
	Checksum: 0xCC1F8727
	Offset: 0x42D8
	Size: 0xD6
	Parameters: 1
	Flags: None
	Line Number: 1428
*/
function get_farthest_wait_location(a_wait_locations)
{
	if(!isdefined(a_wait_locations) || a_wait_locations.size == 0)
	{
		return undefined;
	}
	n_farthest_index = 0;
	n_distance_farthest = 0;
	for(i = 0; i < a_wait_locations.size; i++)
	{
		n_distance_sq = DistanceSquared(self.origin, a_wait_locations[i].origin);
		if(n_distance_sq > n_distance_farthest)
		{
			n_distance_farthest = n_distance_sq;
			n_farthest_index = i;
		}
	}
	return a_wait_locations[n_farthest_index];
}

