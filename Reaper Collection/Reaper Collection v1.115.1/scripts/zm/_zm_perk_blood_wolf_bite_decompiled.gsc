#include scripts\codescripts\struct;
#include scripts\shared\ai\behavior_zombie_dog;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_hero_weapon;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_e6205b53;

/*
	Name: __init__sytem__
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x928
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 51
*/
function autoexec __init__sytem__()
{
	system::register("blood_wolf_bite", &__init__, undefined, undefined);
	return;
	waittillframeend;
}

/*
	Name: __init__
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x968
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 68
*/
function __init__()
{
	function_1a92256e();
	return;
}

/*
	Name: function_1a92256e
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x988
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function function_1a92256e()
{
	zm_perks::register_perk_basic_info("specialty_bloodwolf", "bloodwolf", 3000, &"ZM_REAP_MOD_PERK_BLOOD_WOLF", GetWeapon("zombie_perk_bottle_blood_wolf_bite"));
	zm_perks::register_perk_precache_func("specialty_bloodwolf", &function_8bd87e3d);
	zm_perks::register_perk_clientfields("specialty_bloodwolf", &function_19157aff, &function_99c1452c);
	zm_perks::register_perk_machine("specialty_bloodwolf", &function_edb3a90b);
	zm_perks::register_perk_threads("specialty_bloodwolf", &function_dc5cf16f, &function_b4722825);
	zm_perks::register_perk_host_migration_params("specialty_bloodwolf", "Blood Wolf Bite", "revive_light");
	level thread namespace_851dc78f::function_c3c32972("specialty_bloodwolf", &"ZM_REAP_MOD_PERK_BLOOD_WOLF_DB", 2000, "Blood Wolf Bite", "bloodwolf");
	if(!isdefined(level.var_f3abde82))
	{
		level.var_f3abde82 = [];
	}
	level.var_f3abde82["specialty_bloodwolf"] = 1;
	zm_spawner::register_zombie_damage_callback(&function_9bdcc826);
	zm_spawner::register_zombie_death_event_callback(&function_107f1f65);
	zm::register_actor_damage_callback(&function_8c6909fd);
	function_a56cd40b("powerup_bloodwolf_ammo", &function_ea1898cc);
	function_a56cd40b("powerup_bloodwolf_fullpower", &function_513d2165);
	function_a56cd40b("powerup_bloodwolf_points", &function_171b63bf);
	level.var_fdbc4c77 = GetWeapon("zombie_bloodwolf_pat");
	return;
	ERROR: Bad function call
}

/*
	Name: function_8bd87e3d
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xC20
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function function_8bd87e3d()
{
	level.machine_assets["specialty_bloodwolf"] = spawnstruct();
	level.machine_assets["specialty_bloodwolf"].weapon = GetWeapon("zombie_perk_bottle_blood_wolf_bite");
	level.machine_assets["specialty_bloodwolf"].off_model = "cz_zombie_vending_blood_wolf_bite_off";
	level.machine_assets["specialty_bloodwolf"].on_model = "cz_zombie_vending_blood_wolf_bite";
	level._effect["dog_gib"] = "zombie/fx_dog_explosion_zmb";
	level._effect["lightning_dog_spawn"] = "zombie/fx_dog_lightning_buildup_zmb";
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_19157aff
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 141
*/
function function_19157aff()
{
	clientfield::register("actor", "LUNA", 1, 1, "int");
}

/*
	Name: function_99c1452c
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xD40
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 156
*/
function function_99c1452c(state)
{
	self thread namespace_4b6e359c::function_75aa16e4("specialty_bloodwolf", "bloodwolf", "SetIconActive", state);
}

/*
	Name: function_edb3a90b
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xD88
	Size: 0xC0
	Parameters: 4
	Flags: None
	Line Number: 171
*/
function function_edb3a90b(use_trigger, perk_machine, bump_trigger, collision)
{
	use_trigger.script_sound = "";
	use_trigger.script_string = "specialty_bloodwolf";
	use_trigger.script_label = "";
	use_trigger.target = "Blood Wolf Bite";
	perk_machine.script_string = "specialty_bloodwolf";
	perk_machine.targetname = "Blood Wolf Bite";
	if(isdefined(bump_trigger))
	{
		bump_trigger.script_string = "specialty_bloodwolf";
	}
}

/*
	Name: function_dc5cf16f
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xE50
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 195
*/
function function_dc5cf16f()
{
	if(!isdefined(self.disabled_perks))
	{
		self.disabled_perks = [];
	}
	self.disabled_perks["specialty_bloodwolf"] = 1;
	if(!isdefined(self.var_b5c2c258))
	{
		self.var_b5c2c258 = [];
	}
	if(!isdefined(self.var_d6aef449))
	{
		self.var_d6aef449 = [];
	}
	self.var_b5c2c258["specialty_bloodwolf"] = 1;
	self thread function_85293bb();
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieDogTargetService", &zombieDogTargetService);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4722825
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xF10
	Size: 0x58
	Parameters: 3
	Flags: None
	Line Number: 227
*/
function function_b4722825(b_pause, str_perk, str_result)
{
	self.disabled_perks["specialty_bloodwolf"] = 0;
	self.var_b5c2c258["specialty_bloodwolf"] = undefined;
	self.var_d6aef449["specialty_bloodwolf"] = undefined;
}

/*
	Name: function_85293bb
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0xF70
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 244
*/
function function_85293bb()
{
	self.var_8e9930e3 = 0;
	while(self namespace_851dc78f::function_5f9a13b3("specialty_bloodwolf"))
	{
		if(!isdefined(self.var_d690c0fa))
		{
			if(self.var_8e9930e3 > 2000)
			{
				self thread function_b14ce15f();
				self thread namespace_4b6e359c::function_75aa16e4("specialty_bloodwolf", "bloodwolf", "MeterBlue", 0);
			}
			else if(self.var_8e9930e3 > 0)
			{
				self.var_8e9930e3 = self.var_8e9930e3 - 100;
				if(self.var_8e9930e3 < 0)
				{
					self.var_8e9930e3 = 0;
				}
				self thread namespace_4b6e359c::function_75aa16e4("specialty_bloodwolf", "bloodwolf", "MeterBlue", Int(self.var_8e9930e3 / 2000 * 100));
			}
		}
		wait(0.5);
	}
	self.var_8e9930e3 = undefined;
}

/*
	Name: function_b14ce15f
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x10B8
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 281
*/
function function_b14ce15f()
{
	self endon("disconnect");
	self.var_d690c0fa = 1;
	charge = 45;
	var_344719ba = charge;
	var_c3496f7 = SpawnActor("spawner_zm_luna", self.origin, (0, 0, 0));
	if(!isdefined(var_c3496f7))
	{
		return;
	}
	playsoundatposition("bloodwolf_whistle", self.origin);
	var_c3496f7 thread function_ba2d0cac(self);
	wait(2);
	while(charge > 0 && isdefined(var_c3496f7))
	{
		if(charge < 100)
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_bloodwolf", "bloodwolf", "Meter", Int(charge / var_344719ba * 100));
		}
		charge--;
		wait(1);
	}
	var_c3496f7.allowdeath = 1;
	if(isdefined(var_c3496f7))
	{
		if(isdefined(var_c3496f7.var_ac864f21))
		{
			var_c3496f7.var_ac864f21 delete();
		}
		var_c3496f7 Hide();
		playFX(level._effect["dog_gib"], var_c3496f7.origin);
		playsoundatposition("zmb_hellhound_explode", var_c3496f7.origin);
		var_c3496f7 DoDamage(var_c3496f7.health, var_c3496f7.origin);
		var_c3496f7 delete();
	}
	var_ba6f5066 = 300;
	if(self namespace_851dc78f::function_b690a849("specialty_bloodwolf"))
	{
		var_ba6f5066 = Int(var_ba6f5066 * 0.7);
	}
	for(charge = 0; charge < var_ba6f5066; charge++)
	{
		if(self namespace_851dc78f::function_5f9a13b3("specialty_bloodwolf"))
		{
			self thread namespace_4b6e359c::function_75aa16e4("specialty_bloodwolf", "bloodwolf", "Meter", Int(charge / var_ba6f5066 * 100));
		}
		wait(1);
	}
	self.var_d690c0fa = undefined;
	self.var_8e9930e3 = 0;
}

/*
	Name: function_ba2d0cac
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1400
	Size: 0x4A0
	Parameters: 1
	Flags: None
	Line Number: 344
*/
function function_ba2d0cac(owner)
{
	self endon("death");
	self StopAnimScripted();
	self ForceTeleport((self.origin[0], self.origin[1], self.origin[2] + 40));
	self Hide();
	self.allowdeath = 0;
	self.allowPain = 0;
	self.no_gib = 1;
	self.disableArrivals = 1;
	self.disableExits = 1;
	self.var_71ae5594 = 1;
	playFX(level._effect["lightning_dog_spawn"], owner.origin);
	playsoundatposition("zmb_hellhound_prespawn", owner.origin);
	wait(1.5);
	self.script_string = "riser";
	self notify("no_rise");
	self thread zm_spawner::zombie_complete_emerging_into_playable_area();
	self thread zm_spawner::zombie_setup_attack_properties();
	self thread clientfield::set("LUNA", 1);
	self SetModel("blood_wolf_luna");
	playsoundatposition("zmb_hellhound_bolt", owner.origin);
	self show();
	self.in_the_ground = undefined;
	self.goalRadius = 32;
	self.var_fc848fa3 = owner;
	self.meleeDamage = 400000;
	self.hasSeenFavoriteEnemy = 1;
	self ForceTeleport(owner.origin);
	self.team = "allies";
	self.zombie_move_speed = "sprint";
	self.ignoreall = 0;
	var_7b3c248b = self.origin;
	self thread function_8398816c(owner);
	self thread function_a0df2e78();
	while(isdefined(self))
	{
		dist = Distance(owner.origin, self.origin);
		if(dist > 3000)
		{
			self ForceTeleport(owner.origin);
		}
		else if(dist > 200 && !isdefined(self.favoriteenemy))
		{
			self SetGoal(owner.origin);
		}
		else if(dist < 200 && !isdefined(self.favoriteenemy))
		{
			self SetGoal(self.origin);
		}
		else if(isdefined(self.favoriteenemy))
		{
			self SetGoal(self.favoriteenemy.origin);
			self.hasSeenFavoriteEnemy = 1;
		}
		if(isdefined(level.var_fdbc4c77))
		{
			if(var_7b3c248b == self.origin && !isdefined(self.var_ac864f21))
			{
				self thread function_4f47e004();
			}
			else if(var_7b3c248b != self.origin && isdefined(self.var_ac864f21))
			{
				self.var_ac864f21 delete();
				self.var_ac864f21 = undefined;
			}
			var_7b3c248b = self.origin;
		}
		wait(0.1);
	}
}

/*
	Name: function_8398816c
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x18A8
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 426
*/
function function_8398816c(player)
{
	self endon("death");
	player waittill("disconnect");
	self Hide();
	playFX(level._effect["dog_gib"], self.origin);
	playsoundatposition("zmb_hellhound_explode", self.origin);
	self DoDamage(self.health, self.origin);
	self delete();
}

/*
	Name: function_1275e2ff
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1980
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 447
*/
function function_1275e2ff()
{
	if(isdefined(self.beastmode) && self.beastmode || self GetCurrentWeapon().name == "zombie_beast_grapple_dwr")
	{
		return 0;
	}
	if(!self zm_magicbox::can_buy_weapon() || self zm_utility::has_powerup_weapon())
	{
		return 0;
	}
	if(self bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		if(!isdefined(self.var_bc4459b1) || GetTime() >= self.var_bc4459b1 + 1)
		{
			self.var_bc4459b1 = GetTime();
			return 0;
		}
	}
	if(self IsSwitchingWeapons())
	{
		return 0;
	}
	if(isdefined(self.var_97c73248))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_4f47e004
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1A80
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 486
*/
function function_4f47e004()
{
	trig = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 20), 0, 80, 130);
	trig setHintString("Hold ^3[{+activate}]^7 to Pat");
	trig setcursorhint("HINT_NOICON");
	trig TriggerIgnoreTeam();
	trig UseTriggerRequireLookAt();
	trig thread function_78f1cda0();
	self.var_ac864f21 = trig;
	while(isdefined(trig))
	{
		trig waittill("trigger", player);
		if(!isdefined(player.var_836e7538) && player function_1275e2ff())
		{
			player thread function_cf5f47db();
		}
	}
}

/*
	Name: function_78f1cda0
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1BD0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 515
*/
function function_78f1cda0()
{
	self endon("death");
	dist_squared = 16384;
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(DistanceSquared(player.origin, self.origin) < dist_squared)
			{
				if(player zm_perks::vending_trigger_can_player_use(player) && !player zm_utility::in_revive_trigger() && !zm_equipment::is_equipment_that_blocks_purchase(player GetCurrentWeapon()) && !player zm_equipment::hacker_active())
				{
					self setinvisibletoplayer(player, 0);
					continue;
				}
				self setinvisibletoplayer(player, 1);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_cf5f47db
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1D58
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 549
*/
function function_cf5f47db()
{
	self.var_836e7538 = 1;
	gun = self perk_give_bottle_begin();
	self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "perk_abort_drinking", "disconnect");
	self perk_give_bottle_end(gun);
	self.var_836e7538 = undefined;
}

/*
	Name: perk_give_bottle_begin
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1DF8
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 568
*/
function perk_give_bottle_begin()
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	original_weapon = self GetCurrentWeapon();
	weapon = level.var_fdbc4c77;
	self GiveWeapon(weapon);
	self SwitchToWeapon(weapon);
	return original_weapon;
}

/*
	Name: perk_give_bottle_end
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x1EA0
	Size: 0x220
	Parameters: 1
	Flags: None
	Line Number: 589
*/
function perk_give_bottle_end(original_weapon)
{
	self endon("perk_abort_drinking");
	/#
		fallback_initiated::Assert(!original_weapon.isPerkBottle);
	#/
	/#
		fallback_initiated::Assert(original_weapon != level.weaponReviveTool);
	#/
	self zm_utility::enable_player_move_states();
	weapon = level.var_fdbc4c77;
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self TakeWeapon(weapon);
	if(self zm_utility::is_multiple_drinking())
	{
		self zm_utility::decrement_is_drinking();
		return;
	}
	else if(original_weapon != level.weaponNone && !zm_utility::is_placeable_mine(original_weapon) && !zm_equipment::is_equipment_that_blocks_purchase(original_weapon))
	{
		self zm_weapons::switch_back_primary_weapon(original_weapon);
		if(zm_utility::is_melee_weapon(original_weapon))
		{
			self zm_utility::decrement_is_drinking();
			return;
		}
	}
	else
	{
		self zm_weapons::switch_back_primary_weapon();
	}
	self waittill("weapon_change_complete");
	if(!self laststand::player_is_in_laststand() && (!(isdefined(self.intermission) && self.intermission)))
	{
		self zm_utility::decrement_is_drinking();
	}
}

/*
	Name: function_a0df2e78
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x20C8
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 641
*/
function function_a0df2e78()
{
	self endon("death");
	while(isdefined(self))
	{
		if(isdefined(self.favoriteenemy))
		{
			if(!isalive(self.favoriteenemy) || !isdefined(self.favoriteenemy.archetype) || self.favoriteenemy.archetype == "orda" || Distance(self.favoriteenemy.origin, self.origin) > 960.0001 || self.favoriteenemy.ai_state != "zombie_think" || (isdefined(self.favoriteenemy.in_the_ground) && self.favoriteenemy.in_the_ground) || (!(isdefined(self.favoriteenemy.completed_emerging_into_playable_area) && self.favoriteenemy.completed_emerging_into_playable_area)))
			{
				self.favoriteenemy = undefined;
			}
		}
		if(!isdefined(self.favoriteenemy))
		{
			a_ai = GetAIArray();
			var_aca0d7c7 = ArraySortClosest(a_ai, self.origin, a_ai.size, 0, 800);
			var_1cbb457f = zombie_utility::get_round_enemy_array();
			foreach(ai in var_aca0d7c7)
			{
				if(IsActor(ai) && (!(var_1cbb457f.size == 1 && var_1cbb457f[0] == ai)) && ai.archetype === "zombie" && ai.ai_state == "zombie_think" && (!(isdefined(ai.in_the_ground) && ai.in_the_ground)) && (isdefined(ai.completed_emerging_into_playable_area) && ai.completed_emerging_into_playable_area))
				{
					self.favoriteenemy = ai;
					break;
				}
			}
		}
		wait(0.5);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9bdcc826
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x23C0
	Size: 0xF8
	Parameters: 13
	Flags: None
	Line Number: 683
*/
function function_9bdcc826(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(isdefined(e_player) && isPlayer(e_player) && e_player namespace_851dc78f::function_5f9a13b3("specialty_bloodwolf"))
	{
		if(isdefined(e_player.var_8e9930e3) && !isdefined(self.var_d690c0fa))
		{
			e_player.var_8e9930e3 = e_player.var_8e9930e3 + n_amount;
		}
	}
	return 0;
}

/*
	Name: function_8c6909fd
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x24C0
	Size: 0xD0
	Parameters: 12
	Flags: None
	Line Number: 705
*/
function function_8c6909fd(inflictor, attacker, damage, flags, meansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(attacker) && isdefined(attacker.var_71ae5594) && (!isdefined(self.archetype) || self.archetype != "orda"))
	{
		if(isdefined(attacker.var_fc848fa3))
		{
			return self.health + 666;
		}
	}
	return -1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_107f1f65
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2598
	Size: 0x2D8
	Parameters: 1
	Flags: None
	Line Number: 728
*/
function function_107f1f65(e_player)
{
	if(isdefined(e_player) && isdefined(e_player.var_71ae5594))
	{
		if(isdefined(e_player.var_fc848fa3))
		{
			player = e_player.var_fc848fa3;
			if(player namespace_851dc78f::function_b690a849("specialty_bloodwolf") && RandomInt(100) < 40)
			{
				self thread function_27795401(player);
			}
			if(!isdefined(player.var_eb4affa7))
			{
				player thread function_24d2b0dd();
				player.var_eb4affa7 = 1;
				zombies = util::get_array_of_closest(self.origin, GetAISpeciesArray("axis", "all"), undefined, undefined, 100);
				for(i = 0; i < zombies.size; i++)
				{
					var_1cbb457f = zombie_utility::get_round_enemy_array();
					if(!(var_1cbb457f.size == 1 && var_1cbb457f[0] == zombies[i]) && zombie_utility::get_round_enemy_array().size > 1)
					{
						if(zombies[i].archetype != "orda")
						{
							zombies[i] DoDamage(zombies[i].health + 666, e_player.origin, e_player, e_player, 0, "MOD_FALLING");
						}
					}
				}
			}
			player.kills++;
			player zm_stats::increment_client_stat("kills");
			player zm_stats::increment_player_stat("kills");
			player zm_score::add_to_player_score(100 * level.zombie_vars[self.team]["zombie_point_scalar"], 1, "BLOOD WOLF KILL", 1);
		}
	}
}

/*
	Name: function_24d2b0dd
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2878
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 774
*/
function function_24d2b0dd()
{
	wait(0.2);
	self.var_eb4affa7 = undefined;
}

/*
	Name: function_27795401
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2898
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 790
*/
function function_27795401(player)
{
	var_c7ff2d35 = level.var_ed16f98a[RandomInt(level.var_ed16f98a.size)];
	powerup = spawn("script_model", self.origin + VectorScale((0, 0, 1), 40));
	powerup SetModel(var_c7ff2d35.var_162e1c19);
	powerup.targetname = "bloodwolf_powerup";
	powerup.only_affects_grabber = 1;
	powerup.any_team = 0;
	powerup.zombie_grabbable = 0;
	powerup thread zm_powerups::powerup_timeout();
	powerup thread zm_powerups::powerup_wobble();
	powerup thread powerup_grab(player, var_c7ff2d35);
}

/*
	Name: function_a56cd40b
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x29E0
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 814
*/
function function_a56cd40b(var_162e1c19, func)
{
	if(!isdefined(level.var_ed16f98a))
	{
		level.var_ed16f98a = [];
	}
	struct = spawnstruct();
	struct.var_162e1c19 = var_162e1c19;
	struct.func = func;
	level.var_ed16f98a[level.var_ed16f98a.size] = struct;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: powerup_grab
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2A70
	Size: 0x1E8
	Parameters: 2
	Flags: None
	Line Number: 838
*/
function powerup_grab(player, var_c7ff2d35)
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	range_squared = 4096;
	grabber = player;
	while(isdefined(self) && isdefined(player) && isdefined(grabber))
	{
		wait(0.1);
		if(!isdefined(player))
		{
			continue;
		}
		if(DistanceSquared(grabber.origin, self.origin) < range_squared)
		{
			if(isdefined(level._powerup_grab_check))
			{
				if(!self [[level._powerup_grab_check]](player))
				{
					continue;
				}
			}
			playFX(level._effect["powerup_grabbed_solo"], self.origin);
			if(isdefined(self.grabbed_level_notify))
			{
				level notify(self.grabbed_level_notify);
			}
			self.claimed = 1;
			self.power_up_grab_player = player;
			wait(0.1);
			playsoundatposition("zmb_powerup_grabbed", self.origin);
			self StopLoopSound();
			self Hide();
			player thread [[var_c7ff2d35.func]]();
			self thread zm_powerups::powerup_delete_delayed();
			self notify("powerup_grabbed");
		}
	}
	if(isdefined(self))
	{
		self notify("powerup_timedout");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ea1898cc
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2C60
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 894
*/
function function_ea1898cc()
{
	gun = self GetCurrentWeapon();
	ammo = gun.clipSize - RandomInt(gun.clipSize / 2);
	if(isdefined(level.var_daebd49c))
	{
		self [[level.var_daebd49c]](gun, ammo);
	}
	else
	{
		self SetWeaponAmmoStock(gun, self GetWeaponAmmoStock(gun) + ammo);
	}
}

/*
	Name: function_513d2165
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2D30
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 918
*/
function function_513d2165()
{
	powerup = spawn("script_model", (0, 0, 0));
	powerup SetModel("tag_origin");
	powerup.heroweapon_kill_power = 10;
	if(isdefined(self.var_5ae72ec4) && !isdefined(self.var_f28812d1))
	{
		self.var_a0ae3fc5 = self.var_a0ae3fc5 + 10;
	}
	wait(0.1);
	powerup delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_171b63bf
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2DE8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 943
*/
function function_171b63bf()
{
	points = 50 * RandomInt(5) + 50;
	if(level.intermission)
	{
		return;
	}
	n_points_to_add_to_currency = bgb::add_to_player_score_override(points, "");
	self.score = self.score + n_points_to_add_to_currency;
	self.pers["score"] = self.score;
	self IncrementPlayerStat("scoreEarned", n_points_to_add_to_currency);
	level notify("earned_points", self, points);
	self.score_total = self.score_total + points;
	level.score_total = level.score_total + points;
}

/*
	Name: zombieDogTargetService
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x2EE0
	Size: 0x3A8
	Parameters: 1
	Flags: None
	Line Number: 969
*/
function zombieDogTargetService(behaviorTreeEntity)
{
	if(isdefined(level.intermission) && level.intermission)
	{
		behaviorTreeEntity clearPath();
		return;
	}
	if(isdefined(behaviorTreeEntity.var_71ae5594))
	{
		return;
	}
	if(behaviorTreeEntity.ignoreall || behaviorTreeEntity.pacifist || (isdefined(behaviorTreeEntity.favoriteenemy) && !is_target_valid(behaviorTreeEntity, behaviorTreeEntity.favoriteenemy)))
	{
		if(isdefined(behaviorTreeEntity.favoriteenemy) && isdefined(behaviorTreeEntity.favoriteenemy.hunted_by) && behaviorTreeEntity.favoriteenemy.hunted_by > 0)
		{
			behaviorTreeEntity.favoriteenemy.hunted_by--;
		}
		behaviorTreeEntity.favoriteenemy = undefined;
		behaviorTreeEntity.hasSeenFavoriteEnemy = 0;
		if(!behaviorTreeEntity.ignoreall)
		{
			behaviorTreeEntity SetGoal(behaviorTreeEntity.origin);
			return;
		}
	}
	if(isdefined(behaviorTreeEntity.ignoreme) && behaviorTreeEntity.ignoreme)
	{
		return;
	}
	if(!SessionModeIsZombiesGame() || (behaviorTreeEntity.team == "allies" && !is_target_valid(behaviorTreeEntity, behaviorTreeEntity.favoriteenemy)))
	{
		behaviorTreeEntity.favoriteenemy = get_favorite_enemy(behaviorTreeEntity);
	}
	if(!(isdefined(behaviorTreeEntity.hasSeenFavoriteEnemy) && behaviorTreeEntity.hasSeenFavoriteEnemy))
	{
		if(isdefined(behaviorTreeEntity.favoriteenemy) && behaviorTreeEntity ZombieDogBehavior::need_to_run())
		{
			behaviorTreeEntity.hasSeenFavoriteEnemy = 1;
		}
	}
	if(isdefined(behaviorTreeEntity.favoriteenemy))
	{
		if(isdefined(level.enemy_location_override_func))
		{
			goalpos = [[level.enemy_location_override_func]](behaviorTreeEntity, behaviorTreeEntity.favoriteenemy);
			if(isdefined(goalpos))
			{
				behaviorTreeEntity SetGoal(goalpos);
				return;
			}
		}
		locomotion_target = ZombieDogBehavior::get_locomotion_target(behaviorTreeEntity);
		if(isdefined(locomotion_target))
		{
			repathDist = 16;
			if(!isdefined(behaviorTreeEntity.lastTargetPosition) || DistanceSquared(behaviorTreeEntity.lastTargetPosition, locomotion_target) > repathDist * repathDist || !behaviorTreeEntity HasPath())
			{
				behaviorTreeEntity UsePosition(locomotion_target);
				behaviorTreeEntity.lastTargetPosition = locomotion_target;
			}
		}
	}
}

/*
	Name: is_target_valid
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x3290
	Size: 0x1F0
	Parameters: 2
	Flags: Private
	Line Number: 1043
*/
function private is_target_valid(dog, target)
{
	if(!isdefined(target))
	{
		return 0;
	}
	if(!isalive(target))
	{
		return 0;
	}
	if(!dog.team == "allies")
	{
		if(!isPlayer(target) && SessionModeIsZombiesGame())
		{
			return 0;
		}
		if(isdefined(target.is_zombie) && target.is_zombie == 1)
		{
			return 0;
		}
	}
	if(isPlayer(target) && target.sessionstate == "spectator")
	{
		return 0;
	}
	if(isPlayer(target) && target.sessionstate == "intermission")
	{
		return 0;
	}
	if(isdefined(self.intermission) && self.intermission)
	{
		return 0;
	}
	if(isdefined(target.ignoreme) && target.ignoreme)
	{
		return 0;
	}
	if(target IsNoTarget())
	{
		return 0;
	}
	if(dog.team == target.team)
	{
		return 0;
	}
	if(isPlayer(target) && isdefined(level.is_player_valid_override))
	{
		return [[level.is_player_valid_override]](target);
	}
	return 1;
}

/*
	Name: get_favorite_enemy
	Namespace: namespace_e6205b53
	Checksum: 0x424F4353
	Offset: 0x3488
	Size: 0x268
	Parameters: 1
	Flags: Private
	Line Number: 1105
*/
function private get_favorite_enemy(dog)
{
	dog_targets = [];
	if(SessionModeIsZombiesGame())
	{
		if(self.team == "allies")
		{
			dog_targets = GetAITeamArray(level.zombie_team);
		}
		else
		{
			dog_targets = GetPlayers();
		}
	}
	else
	{
		dog_targets = ArrayCombine(GetPlayers(), GetAIArray(), 0, 0);
	}
	least_hunted = dog_targets[0];
	closest_target_dist_squared = undefined;
	for(i = 0; i < dog_targets.size; i++)
	{
		if(!isdefined(dog_targets[i].hunted_by))
		{
			dog_targets[i].hunted_by = 0;
		}
		if(!is_target_valid(dog, dog_targets[i]))
		{
			continue;
		}
		if(!is_target_valid(dog, least_hunted))
		{
			least_hunted = dog_targets[i];
		}
		dist_squared = DistanceSquared(dog.origin, dog_targets[i].origin);
		if(dog_targets[i].hunted_by <= least_hunted.hunted_by && (!isdefined(closest_target_dist_squared) || dist_squared < closest_target_dist_squared))
		{
			least_hunted = dog_targets[i];
			closest_target_dist_squared = dist_squared;
		}
	}
	if(!is_target_valid(dog, least_hunted))
	{
		return undefined;
	}
	least_hunted.hunted_by = least_hunted.hunted_by + 1;
	return least_hunted;
}

