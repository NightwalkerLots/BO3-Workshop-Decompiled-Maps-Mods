#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weaponobjects;
#include scripts\zm\_bb;
#include scripts\zm\_clientdvar;
#include scripts\zm\_util;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_ballistic_knife;
#include scripts\zm\aae_left_ges;
#include scripts\zm\gametypes\_weapons;

#namespace zm_weapons;

/*
	Name: init
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xD20
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 42
*/
function init()
{
	if(!isdefined(level.pack_a_punch_camo_index))
	{
		level.pack_a_punch_camo_index = 42;
	}
	if(!isdefined(level.weapon_cost_client_filled))
	{
		level.weapon_cost_client_filled = 1;
	}
	if(!isdefined(level.obsolete_prompt_format_needed))
	{
		level.obsolete_prompt_format_needed = 0;
	}
	init_weapons();
	init_weapon_upgrade();
	level._weaponobjects_on_player_connect_override = &weaponobjects_on_player_connect_override;
	level._zombiemode_check_firesale_loc_valid_func = &default_check_firesale_loc_valid_func;
	level.MissileEntities = [];
	level thread onplayerconnect();
}

/*
	Name: onplayerconnect
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xDE8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function onplayerconnect()
{
	for(;;)
	{
		level waittill("connecting", player);
		player thread onplayerspawned();
	}
}

/*
	Name: onplayerspawned
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xE28
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function onplayerspawned()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("spawned_player");
		self thread watchForGrenadeDuds();
		self thread watchForGrenadeLauncherDuds();
		self.staticWeaponsStartTime = GetTime();
	}
}

/*
	Name: watchForGrenadeDuds
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xE98
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function watchForGrenadeDuds()
{
	self endon("spawned_player");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("grenade_fire", grenade, weapon);
		if(!zm_equipment::is_equipment(weapon) && !zm_utility::is_placeable_mine(weapon))
		{
			grenade thread checkGrenadeForDud(weapon, 1, self);
			grenade thread watchForScriptExplosion(weapon, 1, self);
		}
	}
}

/*
	Name: watchForGrenadeLauncherDuds
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xF70
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 142
*/
function watchForGrenadeLauncherDuds()
{
	self endon("spawned_player");
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self waittill("grenade_launcher_fire", grenade, weapon);
		grenade thread checkGrenadeForDud(weapon, 0, self);
		grenade thread watchForScriptExplosion(weapon, 0, self);
	}
}

/*
	Name: grenade_safe_to_throw
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1010
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 165
*/
function grenade_safe_to_throw(player, weapon)
{
	if(isdefined(level.grenade_safe_to_throw))
	{
		return self [[level.grenade_safe_to_throw]](player, weapon);
	}
	return 1;
}

/*
	Name: grenade_safe_to_bounce
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1058
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 184
*/
function grenade_safe_to_bounce(player, weapon)
{
	if(isdefined(level.grenade_safe_to_bounce))
	{
		return self [[level.grenade_safe_to_bounce]](player, weapon);
	}
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: makeGrenadeDudAndDestroy
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x10A0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 204
*/
function makeGrenadeDudAndDestroy()
{
	self endon("death");
	self notify("grenade_dud");
	self makeGrenadeDud();
	wait(3);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: checkGrenadeForDud
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x10F8
	Size: 0xF8
	Parameters: 3
	Flags: None
	Line Number: 226
*/
function checkGrenadeForDud(weapon, isThrownGrenade, player)
{
	self endon("death");
	player endon("zombify");
	if(!isdefined(self))
	{
		return;
	}
	if(!self grenade_safe_to_throw(player, weapon))
	{
		self thread makeGrenadeDudAndDestroy();
		return;
	}
	for(;;)
	{
		self util::waittill_any_ex(0.25, "grenade_bounce", "stationary", "death", player, "zombify");
		if(!self grenade_safe_to_bounce(player, weapon))
		{
			self thread makeGrenadeDudAndDestroy();
			return;
		}
	}
}

/*
	Name: wait_explode
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x11F8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function wait_explode()
{
	self endon("grenade_dud");
	self endon("done");
	self waittill("explode", position);
	level.explode_position = position;
	level.explode_position_valid = 1;
	self notify("done");
}

/*
	Name: wait_timeout
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1260
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 280
*/
function wait_timeout(time)
{
	self endon("grenade_dud");
	self endon("done");
	self endon("explode");
	wait(time);
	if(isdefined(self))
	{
		self notify("done");
		return;
	}
}

/*
	Name: wait_for_explosion
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x12B8
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 303
*/
function wait_for_explosion(time)
{
	level.explode_position = (0, 0, 0);
	level.explode_position_valid = 0;
	self thread wait_explode();
	self thread wait_timeout(time);
	self waittill("done");
	self notify("death_or_explode", level.explode_position_valid, level.explode_position);
}

/*
	Name: watchForScriptExplosion
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1340
	Size: 0xB0
	Parameters: 3
	Flags: None
	Line Number: 323
*/
function watchForScriptExplosion(weapon, isThrownGrenade, player)
{
	self endon("grenade_dud");
	if(zm_utility::is_lethal_grenade(weapon) || weapon.isLauncher)
	{
		self thread wait_for_explosion(20);
		self waittill("death_or_explode", exploded, position);
		if(exploded)
		{
			level notify("grenade_exploded", position, 256, 300, 75);
		}
	}
}

/*
	Name: get_nonalternate_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x13F8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 347
*/
function get_nonalternate_weapon(weapon)
{
	if(weapon.isAltMode)
	{
		return weapon.altweapon;
	}
	if(isdefined(weapon.inventoryType) && weapon.inventoryType == "dwlefthand" && isdefined(weapon.dualWieldWeapon) && weapon.dualWieldWeapon != level.weaponNone)
	{
		return weapon.dualWieldWeapon;
	}
	return weapon;
}

/*
	Name: function_c5c5f802
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x14A0
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 370
*/
function function_c5c5f802(weapon)
{
	if(can_upgrade_weapon(GetWeapon("octobomb")) && self hasweapon(GetWeapon("octobomb")))
	{
		if(self bgb::is_enabled("zm_bgb_shopping_free") || self.score >= 5000)
		{
			return GetWeapon("octobomb");
		}
	}
	if(can_upgrade_weapon(GetWeapon("cymbal_monkey")) && self hasweapon(GetWeapon("cymbal_monkey")))
	{
		if(self bgb::is_enabled("zm_bgb_shopping_free") || self.score >= 5000)
		{
			return GetWeapon("cymbal_monkey");
		}
	}
	return weapon;
}

/*
	Name: switch_from_alt_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1608
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 399
*/
function switch_from_alt_weapon(weapon)
{
	if(isdefined(self.var_7011e588))
	{
		return self function_c5c5f802(weapon);
	}
	if(weapon.ischargeshot)
	{
		return weapon;
	}
	alt = get_nonalternate_weapon(weapon);
	if(alt != weapon)
	{
		if(!WeaponHasAttachment(weapon, "dualoptic"))
		{
			self SwitchToWeaponImmediate(alt);
			self util::waittill_any_timeout(1, "weapon_change_complete");
		}
		return alt;
	}
	return weapon;
}

/*
	Name: give_start_weapons
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x16F0
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 432
*/
function give_start_weapons(TakeAllWeapons, alreadySpawned)
{
	self GiveWeapon(level.weaponBaseMelee);
	self zm_utility::give_start_weapon(1);
	return;
	~;
}

/*
	Name: give_fallback_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1748
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 450
*/
function give_fallback_weapon(immediate)
{
	if(!isdefined(immediate))
	{
		immediate = 0;
	}
	zm_melee_weapon::give_fallback_weapon(immediate);
}

/*
	Name: take_fallback_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1788
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 469
*/
function take_fallback_weapon()
{
	zm_melee_weapon::take_fallback_weapon();
}

/*
	Name: function_85466098
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x17A8
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 484
*/
function function_85466098()
{
	self endon("disconnect");
	self setPerk("specialty_fastweaponswitch");
	wait(1);
	self unsetPerk("specialty_fastweaponswitch");
}

/*
	Name: switch_back_primary_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1800
	Size: 0x2D8
	Parameters: 2
	Flags: None
	Line Number: 502
*/
function switch_back_primary_weapon(oldprimary, immediate)
{
	if(!isdefined(immediate))
	{
		immediate = 0;
	}
	if(isdefined(self.laststand) && self.laststand)
	{
		return;
	}
	if(!isdefined(oldprimary) || oldprimary == level.weaponNone || oldprimary.isFlourishWeapon || zm_utility::is_melee_weapon(oldprimary) || zm_utility::is_placeable_mine(oldprimary) || zm_utility::is_lethal_grenade(oldprimary) || zm_utility::is_tactical_grenade(oldprimary) || !self hasweapon(oldprimary))
	{
		oldprimary = undefined;
	}
	else if(oldprimary.isHeroWeapon || oldprimary.isgadget && (!isdefined(self.hero_power) || self.hero_power <= 0))
	{
		oldprimary = undefined;
	}
	primaryWeapons = self getweaponslistprimaries();
	if(isdefined(oldprimary) && IsInArray(primaryWeapons, oldprimary))
	{
		if(self hasPerk("specialty_fastreload"))
		{
			self function_92dca8b7(oldprimary, 0);
			self SwitchToWeaponImmediate(oldprimary);
		}
		else if(immediate)
		{
			if(!self hasPerk("specialty_fastweaponswitch"))
			{
				self thread function_85466098();
				wait(0.1);
			}
			self function_92dca8b7(oldprimary, 0);
			self SwitchToWeaponImmediate(oldprimary);
		}
		else
		{
			self SwitchToWeapon(oldprimary);
		}
	}
	else if(primaryWeapons.size > 0)
	{
		if(immediate)
		{
			self SwitchToWeaponImmediate();
		}
		else
		{
			self SwitchToWeapon();
		}
	}
	else
	{
		give_fallback_weapon(immediate);
	}
}

/*
	Name: add_retrievable_knife_init_name
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1AE0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 570
*/
function add_retrievable_knife_init_name(name)
{
	if(!isdefined(level.retrievable_knife_init_names))
	{
		level.retrievable_knife_init_names = [];
	}
	level.retrievable_knife_init_names[level.retrievable_knife_init_names.size] = name;
}

/*
	Name: watchWeaponUsageZM
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1B28
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 589
*/
function watchWeaponUsageZM()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	level endon("game_ended");
	self.var_457779be = 0;
	for(;;)
	{
		self waittill("weapon_fired", weapon);
		self.lastFireTime = GetTime();
		self.hasDoneCombat = 1;
		if(weapon == self GetCurrentWeapon() || weapon == self GetCurrentWeapon().dualWieldWeapon || weapon == self GetCurrentWeapon().altweapon && weapon.type === "bullet")
		{
			self.total_shots++;
			if(isdefined(self.var_eca90719) && self.var_457779be < self.total_shots)
			{
				self.var_457779be++;
			}
			var_1153d315 = Int(self.var_457779be / self.total_shots * 100);
			if(var_1153d315 > 100)
			{
				var_1153d315 = 100;
			}
			self.stabs = var_1153d315;
			level.globalShotsFired++;
		}
	}
}

/*
	Name: trackWeaponZM
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1CB8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 629
*/
function trackWeaponZM()
{
	self.currentWeapon = self GetCurrentWeapon();
	self.currentTime = GetTime();
	spawnid = getplayerspawnid(self);
	while(1)
	{
		event = self util::waittill_any_return("weapon_change", "death", "disconnect", "bled_out");
		newTime = GetTime();
		if(event == "weapon_change")
		{
			newWeapon = self GetCurrentWeapon();
			if(newWeapon != level.weaponNone && newWeapon != self.currentWeapon)
			{
				updateLastHeldWeaponTimingsZM(newTime);
				self.currentWeapon = newWeapon;
				self.currentTime = newTime;
			}
		}
		else if(event != "death" && event != "disconnect")
		{
			updateWeaponTimingsZM(newTime);
			return;
		}
	}
}

/*
	Name: updateLastHeldWeaponTimingsZM
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1E28
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 666
*/
function updateLastHeldWeaponTimingsZM(newTime)
{
	if(isdefined(self.currentWeapon) && isdefined(self.currentTime))
	{
		curWeapon = self.currentWeapon;
		totalTime = Int(newTime - self.currentTime / 1000);
		if(totalTime > 0)
		{
			self addweaponstat(curWeapon, "timeUsed", totalTime);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: updateWeaponTimingsZM
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1ED0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 691
*/
function updateWeaponTimingsZM(newTime)
{
	if(self util::is_bot())
	{
		return;
	}
	updateLastHeldWeaponTimingsZM(newTime);
	if(!isdefined(self.staticWeaponsStartTime))
	{
		return;
	}
	totalTime = Int(newTime - self.staticWeaponsStartTime / 1000);
	if(totalTime < 0)
	{
		return;
	}
	self.staticWeaponsStartTime = newTime;
	return;
}

/*
	Name: watchWeaponChangeZM
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x1F70
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 721
*/
function watchWeaponChangeZM()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self.lastdroppableweapon = self GetCurrentWeapon();
	self.hitsThisMag = [];
	weapon = self GetCurrentWeapon();
	while(1)
	{
		previous_weapon = self GetCurrentWeapon();
		self waittill("weapon_change", newWeapon);
		if(weapons::mayDropWeapon(newWeapon))
		{
			self.lastdroppableweapon = newWeapon;
		}
	}
}

/*
	Name: weaponobjects_on_player_connect_override_internal
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2050
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 750
*/
function weaponobjects_on_player_connect_override_internal()
{
	self weaponobjects::createBaseWatchers();
	self zm_placeable_mine::setup_watchers();
	for(i = 0; i < level.retrievable_knife_init_names.size; i++)
	{
		self createBallisticKnifeWatcher_zm(level.retrievable_knife_init_names[i]);
	}
	self weaponobjects::setupRetrievableWatcher();
	if(!isdefined(self.weaponObjectWatcherArray))
	{
		self.weaponObjectWatcherArray = [];
	}
	self.concussionEndTime = 0;
	self.hasDoneCombat = 0;
	self.lastFireTime = 0;
	self thread watchWeaponUsageZM();
	self thread weapons::watchGrenadeUsage();
	self thread weapons::watchMissileUsage();
	self thread watchWeaponChangeZM();
	self thread trackWeaponZM();
	self notify("weapon_watchers_created");
}

/*
	Name: weaponobjects_on_player_connect_override
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x21B0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 784
*/
function weaponobjects_on_player_connect_override()
{
	add_retrievable_knife_init_name("knife_ballistic");
	add_retrievable_knife_init_name("knife_ballistic_upgraded");
	callback::on_connect(&weaponobjects_on_player_connect_override_internal);
	return;
}

/*
	Name: createBallisticKnifeWatcher_zm
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2210
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 802
*/
function createBallisticKnifeWatcher_zm(weaponName)
{
	watcher = self weaponobjects::createUseWeaponObjectWatcher(weaponName, self.team);
	watcher.onSpawn = &_zm_weap_ballistic_knife::on_spawn;
	watcher.onSpawnRetrieveTriggers = &_zm_weap_ballistic_knife::on_spawn_retrieve_trigger;
	watcher.storeDifferentObject = 1;
	watcher.headicon = 0;
	return;
}

/*
	Name: default_check_firesale_loc_valid_func
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x22A8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 822
*/
function default_check_firesale_loc_valid_func()
{
	return 1;
}

/*
	Name: add_zombie_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x22B8
	Size: 0x470
	Parameters: 10
	Flags: None
	Line Number: 837
*/
function add_zombie_weapon(weapon_name, upgrade_name, hint, cost, weaponVO, weaponVOresp, ammo_cost, create_vox, is_wonder_weapon, force_attachments)
{
	weapon = GetWeapon(weapon_name);
	upgrade = undefined;
	if(isdefined(upgrade_name))
	{
		upgrade = GetWeapon(upgrade_name);
	}
	if(isdefined(level.zombie_include_weapons) && !isdefined(level.zombie_include_weapons[weapon]))
	{
		return;
	}
	struct = spawnstruct();
	if(!isdefined(level.zombie_weapons))
	{
		level.zombie_weapons = [];
	}
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	if(isdefined(upgrade_name))
	{
		level.zombie_weapons_upgraded[upgrade] = weapon;
	}
	struct.weapon = weapon;
	struct.upgrade = upgrade;
	struct.weapon_classname = "weapon_" + weapon_name + "_zm";
	if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
	{
		struct.hint = &"ZOMBIE_WEAPONCOSTONLY_CFILL";
	}
	else
	{
		struct.hint = &"ZOMBIE_WEAPONCOSTONLYFILL";
	}
	struct.cost = cost;
	struct.vox = weaponVO;
	struct.vox_response = weaponVOresp;
	struct.is_wonder_weapon = is_wonder_weapon;
	struct.force_attachments = [];
	if("" != force_attachments)
	{
		force_attachments_list = StrTok(force_attachments, " ");
		/#
			Assert(6 >= force_attachments_list.size, weapon_name + "Dev Block strings are not supported");
		#/
		foreach(attachment in force_attachments_list)
		{
			struct.force_attachments[struct.force_attachments.size] = attachment;
		}
	}
	struct.is_in_box = level.zombie_include_weapons[weapon];
	if(!isdefined(ammo_cost))
	{
		ammo_cost = zm_utility::round_up_to_ten(Int(cost * 0.5));
	}
	struct.ammo_cost = ammo_cost;
	if(weapon.isEmp || (isdefined(upgrade) && upgrade.isEmp))
	{
		level.should_watch_for_emp = 1;
	}
	level.zombie_weapons[weapon] = struct;
	if(zm_pap_util::can_swap_attachments() && isdefined(upgrade_name))
	{
		add_attachments(weapon_name, upgrade_name);
	}
	if(isdefined(create_vox))
	{
		level.vox zm_audio::zmbVoxAdd("player", "weapon_pickup", weapon, weaponVO, undefined);
	}
}

/*
	Name: add_attachments
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2730
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 920
*/
function add_attachments(weapon, upgrade)
{
	table = "gamedata/weapons/zm/pap_attach.csv";
	if(isdefined(level.weapon_attachment_table))
	{
		table = level.weapon_attachment_table;
	}
	row = TableLookupRowNum(table, 0, upgrade);
	if(row > -1)
	{
		level.zombie_weapons[weapon].default_attachment = tableLookup(table, 0, upgrade.name, 1);
		level.zombie_weapons[weapon].addon_attachments = [];
		index = 2;
		for(next_addon = tableLookup(table, 0, upgrade.name, index); isdefined(next_addon) && next_addon.size > 0; next_addon = tableLookup(table, 0, upgrade.name, index))
		{
			level.zombie_weapons[weapon].addon_attachments[level.zombie_weapons[weapon].addon_attachments.size] = next_addon;
			index++;
		}
	}
}

/*
	Name: is_weapon_included
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x28E0
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 951
*/
function is_weapon_included(weapon)
{
	if(!isdefined(level.zombie_weapons))
	{
		return 0;
	}
	weapon = get_nonalternate_weapon(weapon);
	return isdefined(level.zombie_weapons[weapon.rootweapon]);
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_weapon_or_base_included
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2940
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 973
*/
function is_weapon_or_base_included(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	return isdefined(level.zombie_weapons[weapon.rootweapon]) || isdefined(level.zombie_weapons[get_base_weapon(weapon)]);
}

/*
	Name: include_zombie_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x29B0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 989
*/
function include_zombie_weapon(weapon_name, in_box)
{
	if(!isdefined(level.zombie_include_weapons))
	{
		level.zombie_include_weapons = [];
	}
	if(!isdefined(in_box))
	{
		in_box = 1;
	}
	weapon = GetWeapon(weapon_name);
	level.zombie_include_weapons[weapon] = in_box;
	if(isdefined(level.var_409b693c))
	{
		level.var_409b693c[level.var_409b693c.size] = weapon;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: init_weapons
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2A50
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1019
*/
function init_weapons()
{
	if(isdefined(level._zombie_custom_add_weapons))
	{
		[[level._zombie_custom_add_weapons]]();
	}
}

/*
	Name: add_limited_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2A78
	Size: 0xA8
	Parameters: 2
	Flags: None
	Line Number: 1037
*/
function add_limited_weapon(weapon_name, amount)
{
	if(GetDvarInt("tfoption_limit") == 2)
	{
		amount = 1;
	}
	if(GetDvarInt("tfoption_limit") == 1)
	{
		amount = 10;
	}
	if(!isdefined(level.limited_weapons))
	{
		level.limited_weapons = [];
	}
	level.limited_weapons[GetWeapon(weapon_name)] = amount;
}

/*
	Name: limited_weapon_below_quota
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2B28
	Size: 0x3F8
	Parameters: 3
	Flags: None
	Line Number: 1064
*/
function limited_weapon_below_quota(weapon, ignore_player, pap_triggers)
{
	if(isdefined(level.limited_weapons[weapon]))
	{
		if(!isdefined(pap_triggers))
		{
			pap_triggers = zm_pap_util::get_triggers();
		}
		if(isdefined(level.no_limited_weapons) && level.no_limited_weapons)
		{
			return 0;
		}
		upgradedweapon = weapon;
		if(isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade))
		{
			upgradedweapon = level.zombie_weapons[weapon].upgrade;
		}
		players = GetPlayers();
		count = 0;
		limit = level.limited_weapons[weapon];
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(ignore_player) && ignore_player == players[i])
			{
				continue;
			}
			if(players[i] has_weapon_or_upgrade(weapon))
			{
				count++;
				if(count >= limit)
				{
					return 0;
				}
			}
		}
		for(K = 0; K < pap_triggers.size; K++)
		{
			if(isdefined(pap_triggers[K].current_weapon) && (pap_triggers[K].current_weapon == weapon || pap_triggers[K].current_weapon == upgradedweapon))
			{
				count++;
				if(count >= limit)
				{
					return 0;
				}
			}
		}
		for(chestIndex = 0; chestIndex < level.chests.size; chestIndex++)
		{
			if(isdefined(level.chests[chestIndex].zbarrier.weapon) && level.chests[chestIndex].zbarrier.weapon == weapon)
			{
				count++;
				if(count >= limit)
				{
					return 0;
				}
			}
		}
		if(isdefined(level.custom_limited_weapon_checks))
		{
			foreach(Check in level.custom_limited_weapon_checks)
			{
				count = count + [[Check]](weapon);
			}
			if(count >= limit)
			{
				return 0;
			}
		}
		if(isdefined(level.random_weapon_powerups))
		{
			for(powerupIndex = 0; powerupIndex < level.random_weapon_powerups.size; powerupIndex++)
			{
				if(isdefined(level.random_weapon_powerups[powerupIndex]) && level.random_weapon_powerups[powerupIndex].base_weapon == weapon)
				{
					count++;
					if(count >= limit)
					{
						return 0;
					}
				}
			}
		}
	}
	return 1;
	ERROR: Bad function call
}

/*
	Name: add_custom_limited_weapon_check
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2F28
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1161
*/
function add_custom_limited_weapon_check(callback)
{
	if(!isdefined(level.custom_limited_weapon_checks))
	{
		level.custom_limited_weapon_checks = [];
	}
	level.custom_limited_weapon_checks[level.custom_limited_weapon_checks.size] = callback;
}

/*
	Name: add_weapon_to_content
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2F70
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 1180
*/
function add_weapon_to_content(weapon_name, package)
{
	if(!isdefined(level.content_weapons))
	{
		level.content_weapons = [];
	}
	level.content_weapons[GetWeapon(weapon_name)] = package;
}

/*
	Name: player_can_use_content
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x2FC8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1199
*/
function player_can_use_content(weapon)
{
	if(isdefined(level.content_weapons))
	{
		if(isdefined(level.content_weapons[weapon]))
		{
			return self HasDLCAvailable(level.content_weapons[weapon]);
		}
	}
	return 1;
}

/*
	Name: init_spawnable_weapon_upgrade
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x3020
	Size: 0xD10
	Parameters: 0
	Flags: None
	Line Number: 1221
*/
function init_spawnable_weapon_upgrade()
{
	spawn_list = [];
	spawnable_weapon_spawns = struct::get_array("weapon_upgrade", "targetname");
	if(GetDvarString("mapname") == "zm_zod")
	{
		for(i = 0; i < spawnable_weapon_spawns.size; i++)
		{
			if(isdefined(spawnable_weapon_spawns[i].zombie_weapon_upgrade) && spawnable_weapon_spawns[i].zombie_weapon_upgrade == "smg_versatile" && spawnable_weapon_spawns[i].origin == (2335.29, -6720.29, 312))
			{
				spawnable_weapon_spawns[i].origin = (2629.63, -7197.64, 313.796);
			}
		}
	}
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("bowie_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("sickle_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("tazer_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("buildable_wallbuy", "targetname"), 1, 0);
	if(isdefined(level.use_autofill_wallbuy) && level.use_autofill_wallbuy)
	{
		spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, level.active_autofill_wallbuys, 1, 0);
	}
	if(!(isdefined(level.headshots_only) && level.headshots_only))
	{
		spawnable_weapon_spawns = ArrayCombine(spawnable_weapon_spawns, struct::get_array("claymore_purchase", "targetname"), 1, 0);
	}
	location = level.scr_zm_map_start_location;
	if(location == "default" || location == "" && isdefined(level.default_start_location))
	{
		location = level.default_start_location;
	}
	match_string = level.scr_zm_ui_gametype;
	if("" != location)
	{
		match_string = match_string + "_" + location;
	}
	match_string_plus_space = " " + match_string;
	for(i = 0; i < spawnable_weapon_spawns.size; i++)
	{
		spawnable_weapon = spawnable_weapon_spawns[i];
		spawnable_weapon.weapon = GetWeapon(spawnable_weapon.zombie_weapon_upgrade);
		if(isdefined(spawnable_weapon.zombie_weapon_upgrade) && spawnable_weapon.weapon.isgrenadeweapon && (isdefined(level.headshots_only) && level.headshots_only))
		{
			continue;
		}
		if(!isdefined(spawnable_weapon.script_noteworthy) || spawnable_weapon.script_noteworthy == "")
		{
			spawn_list[spawn_list.size] = spawnable_weapon;
			continue;
		}
		matches = StrTok(spawnable_weapon.script_noteworthy, ",");
		for(j = 0; j < matches.size; j++)
		{
			if(matches[j] == match_string || matches[j] == match_string_plus_space)
			{
				spawn_list[spawn_list.size] = spawnable_weapon;
			}
		}
	}
	tempModel = spawn("script_model", (0, 0, 0));
	for(i = 0; i < spawn_list.size; i++)
	{
		clientFieldName = spawn_list[i].zombie_weapon_upgrade + "_" + spawn_list[i].origin;
		numBits = 2;
		if(isdefined(level._wallbuy_override_num_bits))
		{
			numBits = level._wallbuy_override_num_bits;
		}
		clientfield::register("world", clientFieldName, 1, numBits, "int");
		target_struct = struct::get(spawn_list[i].target, "targetname");
		if(spawn_list[i].targetname == "buildable_wallbuy")
		{
			bits = 4;
			if(isdefined(level.buildable_wallbuy_weapons))
			{
				bits = GetMinBitCountForNum(level.buildable_wallbuy_weapons.size + 1);
			}
			clientfield::register("world", clientFieldName + "_idx", 1, bits, "int");
			spawn_list[i].clientFieldName = clientFieldName;
			continue;
		}
		unitrigger_stub = spawnstruct();
		unitrigger_stub.origin = spawn_list[i].origin;
		unitrigger_stub.angles = spawn_list[i].angles;
		tempModel.origin = spawn_list[i].origin;
		tempModel.angles = spawn_list[i].angles;
		mins = undefined;
		maxs = undefined;
		absmins = undefined;
		absmaxs = undefined;
		tempModel SetModel(target_struct.model);
		tempModel UseWeaponHideTags(spawn_list[i].weapon);
		mins = tempModel GetMins();
		maxs = tempModel GetMaxs();
		absmins = tempModel GetAbsMins();
		absmaxs = tempModel GetAbsMaxs();
		bounds = absmaxs - absmins;
		unitrigger_stub.script_length = bounds[0] * 0.25;
		unitrigger_stub.script_width = bounds[1];
		unitrigger_stub.script_height = bounds[2];
		unitrigger_stub.origin = unitrigger_stub.origin - AnglesToRight(unitrigger_stub.angles) * unitrigger_stub.script_length * 0.4;
		unitrigger_stub.target = spawn_list[i].target;
		unitrigger_stub.targetname = spawn_list[i].targetname;
		unitrigger_stub.cursor_hint = "HINT_NOICON";
		if(spawn_list[i].targetname == "weapon_upgrade")
		{
			unitrigger_stub.cost = get_weapon_cost(spawn_list[i].weapon);
			unitrigger_stub.hint_string = get_weapon_hint(spawn_list[i].weapon);
			if(!(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled))
			{
				unitrigger_stub.hint_parm1 = unitrigger_stub.cost;
			}
			unitrigger_stub.cursor_hint = "HINT_WEAPON";
			unitrigger_stub.cursor_hint_weapon = spawn_list[i].weapon;
		}
		unitrigger_stub.weapon = spawn_list[i].weapon;
		unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
		if(isdefined(spawn_list[i].script_string) && (isdefined(Int(spawn_list[i].script_string)) && Int(spawn_list[i].script_string)))
		{
			unitrigger_stub.require_look_toward = 0;
			unitrigger_stub.require_look_at = 0;
			unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
			unitrigger_stub.script_length = bounds[0] * 0.4;
			unitrigger_stub.script_width = bounds[1] * 2;
			unitrigger_stub.script_height = bounds[2];
		}
		else
		{
			unitrigger_stub.require_look_at = 1;
		}
		if(isdefined(spawn_list[i].require_look_from) && spawn_list[i].require_look_from)
		{
			unitrigger_stub.require_look_from = 1;
		}
		unitrigger_stub.clientFieldName = clientFieldName;
		zm_unitrigger::unitrigger_force_per_player_triggers(unitrigger_stub, 1);
		if(unitrigger_stub.weapon.isMeleeWeapon || unitrigger_stub.weapon.isgrenadeweapon)
		{
			if(unitrigger_stub.weapon.name == "tazer_knuckles" && isdefined(level.taser_trig_adjustment))
			{
				unitrigger_stub.origin = unitrigger_stub.origin + level.taser_trig_adjustment;
			}
			zm_unitrigger::register_static_unitrigger(unitrigger_stub, &weapon_spawn_think);
		}
		else
		{
			unitrigger_stub.prompt_and_visibility_func = &wall_weapon_update_prompt;
			zm_unitrigger::register_static_unitrigger(unitrigger_stub, &weapon_spawn_think);
		}
		spawn_list[i].trigger_stub = unitrigger_stub;
	}
	level._spawned_wallbuys = spawn_list;
	tempModel delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: add_dynamic_wallbuy
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x3D38
	Size: 0x740
	Parameters: 3
	Flags: None
	Line Number: 1388
*/
function add_dynamic_wallbuy(weapon, wallbuy, pristine)
{
	spawned_wallbuy = undefined;
	for(i = 0; i < level._spawned_wallbuys.size; i++)
	{
		if(level._spawned_wallbuys[i].target == wallbuy)
		{
			spawned_wallbuy = level._spawned_wallbuys[i];
			break;
		}
	}
	if(!isdefined(spawned_wallbuy))
	{
		/#
			ASSERTMSG("Dev Block strings are not supported");
			return;
		#/
	}
	if(isdefined(spawned_wallbuy.trigger_stub))
	{
		/#
			ASSERTMSG("Dev Block strings are not supported");
			return;
		#/
	}
	target_struct = struct::get(wallbuy, "targetname");
	wallModel = zm_utility::spawn_weapon_model(weapon, undefined, target_struct.origin, target_struct.angles, undefined);
	clientFieldName = spawned_wallbuy.clientFieldName;
	model = weapon.worldmodel;
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = target_struct.origin;
	unitrigger_stub.angles = target_struct.angles;
	wallModel.origin = target_struct.origin;
	wallModel.angles = target_struct.angles;
	mins = undefined;
	maxs = undefined;
	absmins = undefined;
	absmaxs = undefined;
	wallModel SetModel(model);
	wallModel UseWeaponHideTags(weapon);
	mins = wallModel GetMins();
	maxs = wallModel GetMaxs();
	absmins = wallModel GetAbsMins();
	absmaxs = wallModel GetAbsMaxs();
	bounds = absmaxs - absmins;
	unitrigger_stub.script_length = bounds[0] * 0.25;
	unitrigger_stub.script_width = bounds[1];
	unitrigger_stub.script_height = bounds[2];
	unitrigger_stub.origin = unitrigger_stub.origin - AnglesToRight(unitrigger_stub.angles) * unitrigger_stub.script_length * 0.4;
	unitrigger_stub.target = spawned_wallbuy.target;
	unitrigger_stub.targetname = "weapon_upgrade";
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.first_time_triggered = !pristine;
	if(!weapon.isMeleeWeapon)
	{
		if(pristine || zm_utility::is_placeable_mine(weapon))
		{
			unitrigger_stub.hint_string = get_weapon_hint(weapon);
		}
		else
		{
			unitrigger_stub.hint_string = get_weapon_hint_ammo();
		}
		unitrigger_stub.cost = get_weapon_cost(weapon);
		if(!(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled))
		{
			unitrigger_stub.hint_parm1 = unitrigger_stub.cost;
		}
	}
	unitrigger_stub.weapon = weapon;
	unitrigger_stub.weapon_upgrade = weapon;
	unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	unitrigger_stub.require_look_at = 1;
	unitrigger_stub.clientFieldName = clientFieldName;
	zm_unitrigger::unitrigger_force_per_player_triggers(unitrigger_stub, 1);
	if(weapon.isMeleeWeapon)
	{
		if(weapon == "tazer_knuckles" && isdefined(level.taser_trig_adjustment))
		{
			unitrigger_stub.origin = unitrigger_stub.origin + level.taser_trig_adjustment;
		}
		zm_melee_weapon::add_stub(unitrigger_stub, weapon);
		zm_unitrigger::register_static_unitrigger(unitrigger_stub, &zm_melee_weapon::melee_weapon_think);
	}
	else
	{
		unitrigger_stub.prompt_and_visibility_func = &wall_weapon_update_prompt;
		zm_unitrigger::register_static_unitrigger(unitrigger_stub, &weapon_spawn_think);
	}
	spawned_wallbuy.trigger_stub = unitrigger_stub;
	weaponIdx = undefined;
	if(isdefined(level.buildable_wallbuy_weapons))
	{
		for(i = 0; i < level.buildable_wallbuy_weapons.size; i++)
		{
			if(weapon == level.buildable_wallbuy_weapons[i])
			{
				weaponIdx = i;
				break;
			}
		}
	}
	else if(isdefined(weaponIdx))
	{
		level clientfield::set(clientFieldName + "_idx", weaponIdx + 1);
		wallModel delete();
		if(!pristine)
		{
			level clientfield::set(clientFieldName, 1);
		}
	}
	else
	{
		level clientfield::set(clientFieldName, 1);
		wallModel show();
	}
}

/*
	Name: wall_weapon_update_prompt
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x4480
	Size: 0x690
	Parameters: 1
	Flags: None
	Line Number: 1516
*/
function wall_weapon_update_prompt(player)
{
	weapon = self.stub.weapon;
	player_has_weapon = player has_weapon_or_upgrade(weapon);
	if(!player_has_weapon && (isdefined(level.weapons_using_ammo_sharing) && level.weapons_using_ammo_sharing))
	{
		shared_ammo_weapon = player get_shared_ammo_weapon(self.zombie_weapon_upgrade);
		if(isdefined(shared_ammo_weapon))
		{
			weapon = shared_ammo_weapon;
			player_has_weapon = 1;
		}
	}
	if(isdefined(level.func_override_wallbuy_prompt))
	{
		if(!self [[level.func_override_wallbuy_prompt]](player))
		{
			return 0;
		}
	}
	if(!player_has_weapon)
	{
		self.stub.cursor_hint = "HINT_WEAPON";
		cost = get_weapon_cost(weapon);
		if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
		{
			if(player bgb::is_enabled("zm_bgb_secret_shopper") && player.currentWeapon.type !== "melee")
			{
				self.stub.hint_string = &"ZOMBIE_WEAPONCOSTONLY_CFILL_BGB_SECRET_SHOPPER";
				self setHintString(self.stub.hint_string);
			}
			else
			{
				self.stub.hint_string = &"ZOMBIE_WEAPONCOSTONLY_CFILL";
				self setHintString(self.stub.hint_string);
			}
		}
		else if(player bgb::is_enabled("zm_bgb_secret_shopper") && player.currentWeapon.type !== "melee")
		{
			self.stub.hint_string = &"ZOMBIE_WEAPONCOSTONLYFILL_BGB_SECRET_SHOPPER";
			n_bgb_cost = player get_ammo_cost_for_weapon(player.currentWeapon);
			self setHintString(self.stub.hint_string, cost, n_bgb_cost);
		}
		else
		{
			self.stub.hint_string = &"ZOMBIE_WEAPONCOSTONLYFILL";
			self setHintString(self.stub.hint_string, cost);
		}
	}
	else if(player bgb::is_enabled("zm_bgb_secret_shopper") && player.currentWeapon.type !== "melee")
	{
		ammo_cost = player get_ammo_cost_for_weapon(weapon);
	}
	else if(player has_upgrade(weapon) && self.stub.hacked !== 1)
	{
		ammo_cost = get_upgraded_ammo_cost(weapon);
	}
	else
	{
		ammo_cost = get_ammo_cost(weapon);
	}
	if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
	{
		if(player bgb::is_enabled("zm_bgb_secret_shopper") && player.currentWeapon.type !== "melee")
		{
			if(isdefined(self.stub.hacked) && self.stub.hacked)
			{
				self.stub.hint_string = &"ZOMBIE_WEAPONAMMOHACKED_CFILL_BGB_SECRET_SHOPPER";
			}
			else
			{
				self.stub.hint_string = &"ZOMBIE_WEAPONAMMOONLY_CFILL_BGB_SECRET_SHOPPER";
			}
			self setHintString(self.stub.hint_string);
		}
		else if(isdefined(self.stub.hacked) && self.stub.hacked)
		{
			self.stub.hint_string = &"ZOMBIE_WEAPONAMMOHACKED_CFILL";
		}
		else
		{
			self.stub.hint_string = &"ZOMBIE_WEAPONAMMOONLY_CFILL";
		}
		self setHintString(self.stub.hint_string);
	}
	else if(player bgb::is_enabled("zm_bgb_secret_shopper") && player.currentWeapon.type !== "melee")
	{
		self.stub.hint_string = &"ZOMBIE_WEAPONAMMOONLY_BGB_SECRET_SHOPPER";
		n_bgb_cost = player get_ammo_cost_for_weapon(player.currentWeapon);
		self setHintString(self.stub.hint_string, ammo_cost, n_bgb_cost);
	}
	else
	{
		self.stub.hint_string = &"ZOMBIE_WEAPONAMMOONLY";
		self setHintString(self.stub.hint_string, ammo_cost);
	}
	self.stub.cursor_hint = "HINT_WEAPON";
	self.stub.cursor_hint_weapon = weapon;
	self setcursorhint(self.stub.cursor_hint, self.stub.cursor_hint_weapon);
	return 1;
}

/*
	Name: reset_wallbuy_internal
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x4B18
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 1628
*/
function reset_wallbuy_internal(set_hint_string)
{
	if(isdefined(self.first_time_triggered) && self.first_time_triggered)
	{
		self.first_time_triggered = 0;
		if(isdefined(self.clientFieldName))
		{
			level clientfield::set(self.clientFieldName, 0);
		}
		if(set_hint_string)
		{
			hint_string = get_weapon_hint(self.weapon);
			cost = get_weapon_cost(self.weapon);
			if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
			{
				self setHintString(hint_string);
			}
			else
			{
				self setHintString(hint_string, cost);
			}
		}
	}
}

/*
	Name: function_ceaa095a
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x4C18
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 1663
*/
function function_ceaa095a(weapon, is_hacked)
{
	if(self has_upgrade(weapon) && !is_hacked || (!self has_upgrade(weapon) && is_hacked))
	{
		return get_upgraded_ammo_cost(weapon);
	}
	return get_ammo_cost(weapon);
}

/*
	Name: reset_wallbuys
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x4CB0
	Size: 0x4D0
	Parameters: 0
	Flags: None
	Line Number: 1682
*/
function reset_wallbuys()
{
	weapon_spawns = [];
	weapon_spawns = GetEntArray("weapon_upgrade", "targetname");
	if(GetDvarString("mapname") == "zm_zod")
	{
		for(i = 0; i < weapon_spawns.size; i++)
		{
			if(isdefined(weapon_spawns[i].zombie_weapon_upgrade) && weapon_spawns[i].zombie_weapon_upgrade == "smg_versatile" && weapon_spawns[i].origin == (2335.29, -6720.29, 312))
			{
				weapon_spawns[i].origin = (2629.63, -7197.64, 313.796);
			}
		}
	}
	melee_and_grenade_spawns = [];
	melee_and_grenade_spawns = GetEntArray("bowie_upgrade", "targetname");
	melee_and_grenade_spawns = ArrayCombine(melee_and_grenade_spawns, GetEntArray("sickle_upgrade", "targetname"), 1, 0);
	melee_and_grenade_spawns = ArrayCombine(melee_and_grenade_spawns, GetEntArray("tazer_upgrade", "targetname"), 1, 0);
	if(!(isdefined(level.headshots_only) && level.headshots_only))
	{
		melee_and_grenade_spawns = ArrayCombine(melee_and_grenade_spawns, GetEntArray("claymore_purchase", "targetname"), 1, 0);
	}
	for(i = 0; i < weapon_spawns.size; i++)
	{
		weapon_spawns[i].weapon = GetWeapon(weapon_spawns[i].zombie_weapon_upgrade);
		weapon_spawns[i] reset_wallbuy_internal(1);
	}
	for(i = 0; i < melee_and_grenade_spawns.size; i++)
	{
		melee_and_grenade_spawns[i].weapon = GetWeapon(melee_and_grenade_spawns[i].zombie_weapon_upgrade);
		melee_and_grenade_spawns[i] reset_wallbuy_internal(0);
	}
	if(isdefined(level._unitriggers))
	{
		candidates = [];
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			stub = level._unitriggers.trigger_stubs[i];
			tn = stub.targetname;
			if(tn == "weapon_upgrade" || tn == "bowie_upgrade" || tn == "sickle_upgrade" || tn == "tazer_upgrade" || tn == "claymore_purchase")
			{
				stub.first_time_triggered = 0;
				if(isdefined(stub.clientFieldName))
				{
					level clientfield::set(stub.clientFieldName, 0);
				}
				if(tn == "weapon_upgrade")
				{
					stub.hint_string = get_weapon_hint(stub.weapon);
					stub.cost = get_weapon_cost(stub.weapon);
					if(!(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled))
					{
						stub.hint_parm1 = stub.cost;
					}
				}
			}
		}
	}
}

/*
	Name: init_weapon_upgrade
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5188
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 1752
*/
function init_weapon_upgrade()
{
	init_spawnable_weapon_upgrade();
	weapon_spawns = [];
	weapon_spawns = GetEntArray("weapon_upgrade", "targetname");
	for(i = 0; i < weapon_spawns.size; i++)
	{
		weapon_spawns[i].weapon = GetWeapon(weapon_spawns[i].zombie_weapon_upgrade);
		hint_string = get_weapon_hint(weapon_spawns[i].weapon);
		cost = get_weapon_cost(weapon_spawns[i].weapon);
		if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
		{
			weapon_spawns[i] setHintString(hint_string);
		}
		else
		{
			weapon_spawns[i] setHintString(hint_string, cost);
		}
		weapon_spawns[i] setcursorhint("HINT_NOICON");
		weapon_spawns[i] UseTriggerRequireLookAt();
		weapon_spawns[i] thread weapon_spawn_think();
		model = GetEnt(weapon_spawns[i].target, "targetname");
		if(isdefined(model))
		{
			model UseWeaponHideTags(weapon_spawns[i].weapon);
			model Hide();
		}
	}
}

/*
	Name: get_weapon_hint
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x53E8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1792
*/
function get_weapon_hint(weapon)
{
	/#
		Assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "Dev Block strings are not supported");
	#/
	return level.zombie_weapons[weapon].hint;
}

/*
	Name: get_weapon_cost
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5450
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1810
*/
function get_weapon_cost(weapon)
{
	/#
		Assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "Dev Block strings are not supported");
	#/
	return level.zombie_weapons[weapon].cost;
}

/*
	Name: get_ammo_cost
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x54B8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1828
*/
function get_ammo_cost(weapon)
{
	/#
		Assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "Dev Block strings are not supported");
	#/
	return level.zombie_weapons[weapon].ammo_cost;
	level.zombie_weapons[weapon].var_60707e62 = undefined;
}

/*
	Name: get_upgraded_ammo_cost
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5520
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1847
*/
function get_upgraded_ammo_cost(weapon)
{
	/#
		Assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "Dev Block strings are not supported");
	#/
	if(isdefined(level.zombie_weapons[weapon].upgraded_ammo_cost))
	{
		return level.zombie_weapons[weapon].upgraded_ammo_cost;
	}
	return 4500;
}

/*
	Name: get_ammo_cost_for_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x55A8
	Size: 0x158
	Parameters: 3
	Flags: None
	Line Number: 1869
*/
function get_ammo_cost_for_weapon(w_current, n_base_non_wallbuy_cost, n_upgraded_non_wallbuy_cost)
{
	if(!isdefined(n_base_non_wallbuy_cost))
	{
		n_base_non_wallbuy_cost = 750;
	}
	if(!isdefined(n_upgraded_non_wallbuy_cost))
	{
		n_upgraded_non_wallbuy_cost = 5000;
	}
	w_root = w_current.rootweapon;
	if(is_weapon_upgraded(w_root))
	{
		w_root = get_base_weapon(w_root);
	}
	if(self has_upgrade(w_root))
	{
		if(is_wallbuy(w_root))
		{
			n_ammo_cost = 4000;
		}
		else
		{
			n_ammo_cost = n_upgraded_non_wallbuy_cost;
		}
	}
	else if(is_wallbuy(w_root))
	{
		n_ammo_cost = get_ammo_cost(w_root);
		n_ammo_cost = zm_utility::halve_score(n_ammo_cost);
	}
	else
	{
		n_ammo_cost = n_base_non_wallbuy_cost;
	}
	return n_ammo_cost;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_is_in_box
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5708
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1918
*/
function get_is_in_box(weapon)
{
	/#
		Assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "Dev Block strings are not supported");
	#/
	if(!is_weapon_or_base_included(weapon))
	{
		return 0;
	}
	if(isdefined(level.zombie_weapons[weapon].is_in_box) && level.zombie_weapons[weapon].is_in_box == 1)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: get_force_attachments
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x57C0
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 1947
*/
function get_force_attachments(weapon)
{
	/#
		Assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "Dev Block strings are not supported");
	#/
	return level.zombie_weapons[weapon].force_attachments;
}

/*
	Name: weapon_supports_default_attachment
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5828
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1965
*/
function weapon_supports_default_attachment()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: default_attachment
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5888
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 1985
*/
function default_attachment(weapon)
{
	weapon = get_base_weapon(weapon);
	attachment = level.zombie_weapons[weapon].default_attachment;
	if(isdefined(attachment))
	{
		return attachment;
	}
	else
	{
		return "none";
	}
}

/*
	Name: weapon_supports_attachments
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x58F8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2009
*/
function weapon_supports_attachments(weapon)
{
	weapon = get_base_weapon(weapon);
	attachments = level.zombie_weapons[weapon].addon_attachments;
	return isdefined(attachments) && attachments.size > 1;
}

/*
	Name: random_attachment
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5968
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 2026
*/
function random_attachment(weapon, exclude)
{
	lo = 0;
	if(isdefined(level.zombie_weapons[weapon].addon_attachments) && level.zombie_weapons[weapon].addon_attachments.size > 0)
	{
		attachments = level.zombie_weapons[weapon].addon_attachments;
	}
	else
	{
		attachments = weapon.supportedAttachments;
		lo = 1;
	}
	minatt = lo;
	if(isdefined(exclude) && exclude != "none")
	{
		minatt = lo + 1;
	}
	if(attachments.size > minatt)
	{
		while(1)
		{
			idx = RandomInt(attachments.size - lo) + lo;
			if(!isdefined(exclude) || attachments[idx] != exclude)
			{
				return attachments[idx];
			}
		}
	}
	return "none";
}

/*
	Name: get_attachment_index
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5AD8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 2067
*/
function get_attachment_index(weapon)
{
	attachments = weapon.attachments;
	if(!attachments.size)
	{
		return -1;
	}
	weapon = get_nonalternate_weapon(weapon);
	base = weapon.rootweapon;
	if(attachments[0] == level.zombie_weapons[base].default_attachment)
	{
		return 0;
	}
	if(isdefined(level.zombie_weapons[base].addon_attachments))
	{
		for(i = 0; i < level.zombie_weapons[base].addon_attachments.size; i++)
		{
			if(level.zombie_weapons[base].addon_attachments[i] == attachments[0])
			{
				return i + 1;
			}
		}
	}
	return -1;
}

/*
	Name: weapon_supports_this_attachment
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5C08
	Size: 0x100
	Parameters: 2
	Flags: None
	Line Number: 2103
*/
function weapon_supports_this_attachment(weapon, att)
{
	weapon = get_nonalternate_weapon(weapon);
	base = weapon.rootweapon;
	if(att == level.zombie_weapons[base].default_attachment)
	{
		return 1;
	}
	if(isdefined(level.zombie_weapons[base].addon_attachments))
	{
		for(i = 0; i < level.zombie_weapons[base].addon_attachments.size; i++)
		{
			if(level.zombie_weapons[base].addon_attachments[i] == att)
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: function_b391e661
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5D10
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 2134
*/
function function_b391e661(weapon)
{
	if(isdefined(level.var_1a75b933))
	{
		var_f603e573 = getArrayKeys(level.var_1a75b933);
		for(i = 0; i < var_f603e573.size; i++)
		{
			attachment_names = getArrayKeys(level.var_1a75b933[var_f603e573[i]]);
			for(j = 0; j < attachment_names.size; j++)
			{
				if(level.var_1a75b933[var_f603e573[i]][attachment_names[j]] == weapon.rootweapon)
				{
					return var_f603e573[i];
				}
			}
		}
	}
	return weapon.rootweapon;
}

/*
	Name: get_attachment_name
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5E28
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 2164
*/
function get_attachment_name(weapon)
{
	attachments = weapon.attachments;
	if(IsInArray(attachments, "fastreload"))
	{
		ArrayRemoveValue(attachments, "fastreload");
	}
	oldatt = "none";
	if(attachments.size)
	{
		oldatt = attachments[0];
	}
	return oldatt;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_base_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5EC8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2190
*/
function get_base_weapon(upgradedweapon)
{
	upgradedweapon = get_nonalternate_weapon(upgradedweapon);
	upgradedweapon = upgradedweapon.rootweapon;
	if(isdefined(level.zombie_weapons_upgraded[upgradedweapon]))
	{
		return level.zombie_weapons_upgraded[upgradedweapon];
	}
	return upgradedweapon;
}

/*
	Name: get_upgrade_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x5F38
	Size: 0x1F8
	Parameters: 3
	Flags: None
	Line Number: 2211
*/
function get_upgrade_weapon(weapon, add_attachment, complex)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	newWeapon = rootweapon;
	baseWeapon = get_base_weapon(weapon);
	if(!is_weapon_upgraded(rootweapon))
	{
		newWeapon = level.zombie_weapons[rootweapon].upgrade;
	}
	if(isdefined(add_attachment) && add_attachment && zm_pap_util::can_swap_attachments())
	{
		oldatt = "none";
		if(weapon.attachments.size)
		{
			oldatt = weapon.attachments[0];
		}
		att = random_attachment(baseWeapon, oldatt);
		newWeapon = GetWeapon(newWeapon.name, att);
	}
	else if(isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].default_attachment))
	{
		att = level.zombie_weapons[rootweapon].default_attachment;
		newWeapon = GetWeapon(newWeapon.name, att);
	}
	return newWeapon;
}

/*
	Name: can_upgrade_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6138
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 2249
*/
function can_upgrade_weapon(weapon)
{
	if(weapon.isRiotShield || weapon == level.weaponNone || !is_weapon_included(weapon))
	{
		return 0;
	}
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	if(!(isdefined(level.b_allow_idgun_pap) && level.b_allow_idgun_pap) && isdefined(level.idgun_weapons))
	{
		if(IsInArray(level.idgun_weapons, rootweapon))
		{
			return 0;
		}
	}
	if(!is_weapon_upgraded(rootweapon))
	{
		return isdefined(level.zombie_weapons[rootweapon].upgrade);
	}
	if(zm_pap_util::can_swap_attachments() && weapon_supports_attachments(rootweapon))
	{
		return 1;
	}
	return 0;
}

/*
	Name: weapon_supports_aat
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6278
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2285
*/
function weapon_supports_aat(weapon)
{
	if(weapon == level.weaponNone || weapon == level.weaponZMFists)
	{
		return 0;
	}
	weaponToPack = get_nonalternate_weapon(weapon);
	rootweapon = weaponToPack.rootweapon;
	if(!is_weapon_upgraded(rootweapon))
	{
		return 0;
	}
	if(!AAT::is_exempt_weapon(weaponToPack))
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_weapon_upgraded
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6330
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 2315
*/
function is_weapon_upgraded(weapon)
{
	if(weapon == level.weaponNone || weapon == level.weaponZMFists)
	{
		return 0;
	}
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	if(isdefined(level.zombie_weapons_upgraded[rootweapon]))
	{
		base_weapon = get_base_weapon(rootweapon);
		if(base_weapon != rootweapon)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: get_weapon_with_attachments
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x63E8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 2344
*/
function get_weapon_with_attachments(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	if(self hasweapon(weapon.rootweapon, 1))
	{
		foreach(playerWeapon in self GetWeaponsList(0))
		{
			if(playerWeapon.rootweapon.name == weapon.rootweapon.name)
			{
				return playerWeapon;
			}
		}
	}
	return undefined;
}

/*
	Name: has_weapon_or_attachments
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x64F8
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 2370
*/
function has_weapon_or_attachments(weapon)
{
	if(self hasweapon(weapon.rootweapon, 1))
	{
		return 1;
	}
	if(zm_pap_util::can_swap_attachments())
	{
		rootweapon = weapon.rootweapon;
		weapons = self GetWeaponsList(1);
		foreach(w in weapons)
		{
			if(rootweapon == w.rootweapon)
			{
				return 1;
			}
		}
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: has_upgrade
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6620
	Size: 0xF8
	Parameters: 1
	Flags: None
	Line Number: 2402
*/
function has_upgrade(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	has_upgrade = 0;
	if(isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].upgrade))
	{
		has_upgrade = self has_weapon_or_attachments(level.zombie_weapons[rootweapon].upgrade);
	}
	if(!has_upgrade && rootweapon.isBallisticKnife)
	{
		has_weapon = self zm_melee_weapon::has_upgraded_ballistic_knife();
	}
	return has_upgrade;
}

/*
	Name: has_weapon_or_upgrade
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6720
	Size: 0x178
	Parameters: 1
	Flags: None
	Line Number: 2428
*/
function has_weapon_or_upgrade(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	upgradedweaponname = rootweapon;
	if(isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].upgrade))
	{
		upgradedweaponname = level.zombie_weapons[rootweapon].upgrade;
	}
	has_weapon = 0;
	if(isdefined(level.zombie_weapons[rootweapon]))
	{
		has_weapon = self has_weapon_or_attachments(rootweapon) || self has_upgrade(rootweapon);
	}
	if(!has_weapon && level.weaponBallisticKnife == rootweapon)
	{
		has_weapon = self zm_melee_weapon::has_any_ballistic_knife();
	}
	if(!has_weapon && zm_equipment::is_equipment(rootweapon))
	{
		has_weapon = self zm_equipment::is_active(rootweapon);
	}
	return has_weapon;
	ERROR: Bad function call
}

/*
	Name: show_equipment_hint
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x68A0
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 2464
*/
function show_equipment_hint(hint)
{
	self LUINotifyEvent(&"zombie_equipment_notification", 1, hint);
	self LUINotifyEventToSpectators(&"zombie_equipment_notification", 1, hint);
}

/*
	Name: add_shared_ammo_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6908
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 2480
*/
function add_shared_ammo_weapon(weapon, base_weapon)
{
	level.zombie_weapons[weapon].shared_ammo_weapon = base_weapon;
}

/*
	Name: get_shared_ammo_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6940
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 2495
*/
function get_shared_ammo_weapon(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	weapons = self GetWeaponsList(1);
	foreach(w in weapons)
	{
		w = w.rootweapon;
		if(!isdefined(level.zombie_weapons[w]) && isdefined(level.zombie_weapons_upgraded[w]))
		{
			w = level.zombie_weapons_upgraded[w];
		}
		if(isdefined(level.zombie_weapons[w]) && isdefined(level.zombie_weapons[w].shared_ammo_weapon) && level.zombie_weapons[w].shared_ammo_weapon == rootweapon)
		{
			return w;
		}
	}
	return undefined;
}

/*
	Name: get_player_weapon_with_same_base
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6AC8
	Size: 0x118
	Parameters: 1
	Flags: None
	Line Number: 2525
*/
function get_player_weapon_with_same_base(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = weapon.rootweapon;
	retweapon = self get_weapon_with_attachments(rootweapon);
	if(!isdefined(retweapon))
	{
		if(isdefined(level.zombie_weapons[rootweapon]))
		{
			if(isdefined(level.zombie_weapons[rootweapon].upgrade))
			{
				retweapon = self get_weapon_with_attachments(level.zombie_weapons[rootweapon].upgrade);
			}
		}
		else if(isdefined(level.zombie_weapons_upgraded[rootweapon]))
		{
			retweapon = self get_weapon_with_attachments(level.zombie_weapons_upgraded[rootweapon]);
		}
	}
	return retweapon;
}

/*
	Name: get_weapon_hint_ammo
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6BE8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2557
*/
function get_weapon_hint_ammo()
{
	if(!(isdefined(level.obsolete_prompt_format_needed) && level.obsolete_prompt_format_needed))
	{
		if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
		{
			return &"ZOMBIE_WEAPONCOSTONLY_CFILL";
		}
		else
		{
			return &"ZOMBIE_WEAPONCOSTONLYFILL";
		}
	}
	else if(isdefined(level.has_pack_a_punch) && !level.has_pack_a_punch)
	{
		return &"ZOMBIE_WEAPONCOSTAMMO";
	}
	else
	{
		return &"ZOMBIE_WEAPONCOSTAMMO_UPGRADE";
	}
}

/*
	Name: weapon_set_first_time_hint
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6C68
	Size: 0xC8
	Parameters: 2
	Flags: None
	Line Number: 2590
*/
function weapon_set_first_time_hint(cost, ammo_cost)
{
	if(!(isdefined(level.obsolete_prompt_format_needed) && level.obsolete_prompt_format_needed))
	{
		if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
		{
			self setHintString(get_weapon_hint_ammo());
		}
		else
		{
			self setHintString(get_weapon_hint_ammo(), cost, ammo_cost);
		}
	}
	else
	{
		self setHintString(get_weapon_hint_ammo(), cost, ammo_cost);
	}
}

/*
	Name: placeable_mine_can_buy_weapon_extra_check_func
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6D38
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 2619
*/
function placeable_mine_can_buy_weapon_extra_check_func(w_weapon)
{
	if(isdefined(w_weapon) && w_weapon == self zm_utility::get_player_placeable_mine())
	{
		return 0;
	}
	return 1;
}

/*
	Name: weapon_spawn_think
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x6D78
	Size: 0xD80
	Parameters: 0
	Flags: None
	Line Number: 2638
*/
function weapon_spawn_think()
{
	cost = get_weapon_cost(self.weapon);
	ammo_cost = get_ammo_cost(self.weapon);
	is_grenade = self.weapon.isgrenadeweapon;
	shared_ammo_weapon = undefined;
	if(isdefined(self.parent_player) && !is_grenade)
	{
		self.parent_player notify("zm_bgb_secret_shopper", self);
	}
	second_endon = undefined;
	if(isdefined(self.stub))
	{
		second_endon = "kill_trigger";
		self.first_time_triggered = self.stub.first_time_triggered;
	}
	onlyplayer = undefined;
	can_buy_weapon_extra_check_func = undefined;
	if(isdefined(self.stub) && (isdefined(self.stub.trigger_per_player) && self.stub.trigger_per_player))
	{
		onlyplayer = self.parent_player;
		if(zm_utility::is_placeable_mine(self.weapon))
		{
			can_buy_weapon_extra_check_func = &placeable_mine_can_buy_weapon_extra_check_func;
		}
	}
	self thread zm_magicbox::decide_hide_show_hint("stop_hint_logic", second_endon, onlyplayer, can_buy_weapon_extra_check_func);
	if(is_grenade || zm_utility::is_melee_weapon(self.weapon))
	{
		self.first_time_triggered = 0;
		hint = get_weapon_hint(self.weapon);
		if(isdefined(level.weapon_cost_client_filled) && level.weapon_cost_client_filled)
		{
			self setHintString(hint);
		}
		else
		{
			self setHintString(hint, cost);
		}
		cursor_hint = "HINT_WEAPON";
		cursor_hint_weapon = self.weapon;
		self setcursorhint(cursor_hint, cursor_hint_weapon);
	}
	else if(!isdefined(self.first_time_triggered))
	{
		self.first_time_triggered = 0;
		if(isdefined(self.stub))
		{
			self.stub.first_time_triggered = 0;
		}
	}
	for(;;)
	{
		self waittill("trigger", player);
		if(!zm_utility::is_player_valid(player))
		{
			player thread zm_utility::ignore_triggers(0.5);
		}
		else if(!player zm_magicbox::can_buy_weapon())
		{
			wait(0.1);
		}
		else if(isdefined(self.stub) && (isdefined(self.stub.require_look_from) && self.stub.require_look_from))
		{
			toplayer = player util::get_eye() - self.origin;
			FORWARD = -1 * AnglesToRight(self.angles);
			dot = VectorDot(toplayer, FORWARD);
			if(dot < 0)
			{
			}
		}
		else
		{
			wait(0.1);
			else
			{
				player_has_weapon = player has_weapon_or_upgrade(self.weapon);
				if(!player_has_weapon && (isdefined(level.weapons_using_ammo_sharing) && level.weapons_using_ammo_sharing))
				{
					shared_ammo_weapon = player get_shared_ammo_weapon(self.weapon);
					if(isdefined(shared_ammo_weapon))
					{
						player_has_weapon = 1;
					}
				}
				if(isdefined(level.pers_upgrade_nube) && level.pers_upgrade_nube)
				{
					player_has_weapon = zm_pers_upgrades_functions::pers_nube_should_we_give_raygun(player_has_weapon, player, self.weapon);
				}
				cost = get_weapon_cost(self.weapon);
				if(player zm_pers_upgrades_functions::is_pers_double_points_active())
				{
					cost = Int(cost / 2);
				}
				if(isdefined(player.check_override_wallbuy_purchase))
				{
					if(player [[player.check_override_wallbuy_purchase]](self.weapon, self))
					{
					}
				}
				else
				{
					if(player zm_score::can_player_purchase(cost))
					{
						if(self.first_time_triggered == 0)
						{
							self show_all_weapon_buys(player, cost, ammo_cost, is_grenade);
						}
						player zm_score::minus_to_player_score(cost);
						level notify("weapon_bought", player, self.weapon);
						player zm_stats::increment_challenge_stat("SURVIVALIST_BUY_WALLBUY");
						if(self.weapon.isRiotShield)
						{
							player zm_equipment::give(self.weapon);
							if(isdefined(player.player_shield_reset_health))
							{
								player [[player.player_shield_reset_health]]();
							}
						}
						else if(zm_utility::is_lethal_grenade(self.weapon))
						{
							player weapon_take(player zm_utility::get_player_lethal_grenade());
							player zm_utility::set_player_lethal_grenade(self.weapon);
						}
						weapon = self.weapon;
						if(isdefined(level.pers_upgrade_nube) && level.pers_upgrade_nube)
						{
							weapon = zm_pers_upgrades_functions::pers_nube_weapon_upgrade_check(player, weapon);
						}
						if(should_upgrade_weapon(player))
						{
							if(player can_upgrade_weapon(weapon))
							{
								weapon = get_upgrade_weapon(weapon);
								player notify("zm_bgb_wall_power_used");
							}
						}
						weapon = player weapon_give(weapon);
						if(isdefined(weapon))
						{
							player thread AAT::remove(weapon);
						}
						if(isdefined(weapon))
						{
							player zm_stats::increment_client_stat("wallbuy_weapons_purchased");
							player zm_stats::increment_player_stat("wallbuy_weapons_purchased");
							weaponIndex = undefined;
							if(isdefined(weaponIndex))
							{
								weaponIndex = MatchRecordGetWeaponIndex(weapon);
							}
							if(isdefined(weaponIndex))
							{
								player RecordMapEvent(6, GetTime(), player.origin, level.round_number, weaponIndex, cost);
							}
						}
					}
					else
					{
						zm_utility::play_sound_on_ent("no_purchase");
						player zm_audio::create_and_play_dialog("general", "outofmoney");
					}
					else
					{
						weapon = self.weapon;
						if(isdefined(shared_ammo_weapon))
						{
							weapon = shared_ammo_weapon;
						}
						if(isdefined(level.pers_upgrade_nube) && level.pers_upgrade_nube)
						{
							weapon = zm_pers_upgrades_functions::pers_nube_weapon_ammo_check(player, weapon);
						}
						if(isdefined(self.stub.hacked) && self.stub.hacked)
						{
							if(!player has_upgrade(weapon))
							{
								ammo_cost = 4500;
							}
							else
							{
								ammo_cost = get_ammo_cost(weapon);
							}
						}
						else if(player has_upgrade(weapon))
						{
							ammo_cost = 4500;
						}
						else
						{
							ammo_cost = get_ammo_cost(weapon);
						}
						if(isdefined(player.pers_upgrades_awarded["nube"]) && player.pers_upgrades_awarded["nube"])
						{
							ammo_cost = zm_pers_upgrades_functions::pers_nube_override_ammo_cost(player, self.weapon, ammo_cost);
						}
						if(player zm_pers_upgrades_functions::is_pers_double_points_active())
						{
							ammo_cost = Int(ammo_cost / 2);
						}
						if(player bgb::is_enabled("zm_bgb_secret_shopper"))
						{
							ammo_cost = player get_ammo_cost_for_weapon(weapon);
						}
						if(weapon.isRiotShield)
						{
							zm_utility::play_sound_on_ent("no_purchase");
						}
						else if(player zm_score::can_player_purchase(ammo_cost))
						{
							if(self.first_time_triggered == 0)
							{
								self show_all_weapon_buys(player, cost, ammo_cost, is_grenade);
							}
							if(player has_upgrade(weapon))
							{
								player zm_stats::increment_client_stat("upgraded_ammo_purchased");
								player zm_stats::increment_player_stat("upgraded_ammo_purchased");
							}
							else
							{
								player zm_stats::increment_client_stat("ammo_purchased");
								player zm_stats::increment_player_stat("ammo_purchased");
							}
							if(player has_upgrade(weapon))
							{
								ammo_given = player ammo_give(level.zombie_weapons[weapon].upgrade);
							}
							else
							{
								ammo_given = player ammo_give(weapon);
							}
							if(ammo_given)
							{
								player zm_score::minus_to_player_score(ammo_cost);
							}
							weaponIndex = undefined;
							if(isdefined(weapon))
							{
								weaponIndex = MatchRecordGetWeaponIndex(weapon);
							}
							if(isdefined(weaponIndex))
							{
								player RecordMapEvent(7, GetTime(), player.origin, level.round_number, weaponIndex, cost);
							}
						}
						else
						{
							zm_utility::play_sound_on_ent("no_purchase");
							if(isdefined(level.custom_generic_deny_vo_func))
							{
								player [[level.custom_generic_deny_vo_func]]();
							}
							else
							{
								player zm_audio::create_and_play_dialog("general", "outofmoney");
							}
						}
					}
					if(isdefined(self.stub) && isdefined(self.stub.prompt_and_visibility_func))
					{
						self [[self.stub.prompt_and_visibility_func]](player);
					}
				}
				else if(!player_has_weapon)
				{
				}
			}
		}
		else if(player zm_utility::has_powerup_weapon())
		{
		}
	}
}

/*
	Name: should_upgrade_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x7B00
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 2923
*/
function should_upgrade_weapon(player)
{
	if(isdefined(level.wallbuy_should_upgrade_weapon_override))
	{
		return [[level.wallbuy_should_upgrade_weapon_override]]();
	}
	if(player bgb::is_enabled("zm_bgb_wall_power"))
	{
		return 1;
	}
	return 0;
}

/*
	Name: show_all_weapon_buys
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x7B58
	Size: 0x3B0
	Parameters: 4
	Flags: None
	Line Number: 2946
*/
function show_all_weapon_buys(player, cost, ammo_cost, is_grenade)
{
	model = GetEnt(self.target, "targetname");
	is_melee = zm_utility::is_melee_weapon(self.weapon);
	if(isdefined(model))
	{
		model thread weapon_show(player);
	}
	else if(isdefined(self.clientFieldName))
	{
		level clientfield::set(self.clientFieldName, 1);
	}
	self.first_time_triggered = 1;
	if(isdefined(self.stub))
	{
		self.stub.first_time_triggered = 1;
	}
	if(!is_grenade && !is_melee)
	{
		self weapon_set_first_time_hint(cost, ammo_cost);
	}
	if(!(isdefined(level.dont_link_common_wallbuys) && level.dont_link_common_wallbuys) && isdefined(level._spawned_wallbuys))
	{
		for(i = 0; i < level._spawned_wallbuys.size; i++)
		{
			wallbuy = level._spawned_wallbuys[i];
			if(isdefined(self.stub) && isdefined(wallbuy.trigger_stub) && self.stub.clientFieldName == wallbuy.trigger_stub.clientFieldName)
			{
				continue;
			}
			if(self.weapon == wallbuy.weapon)
			{
				if(isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientFieldName))
				{
					level clientfield::set(wallbuy.trigger_stub.clientFieldName, 1);
				}
				else if(isdefined(wallbuy.target))
				{
					model = GetEnt(wallbuy.target, "targetname");
					if(isdefined(model))
					{
						model thread weapon_show(player);
					}
				}
				if(isdefined(wallbuy.trigger_stub))
				{
					wallbuy.trigger_stub.first_time_triggered = 1;
					if(isdefined(wallbuy.trigger_stub.trigger))
					{
						wallbuy.trigger_stub.trigger.first_time_triggered = 1;
						if(!is_grenade && !is_melee)
						{
							wallbuy.trigger_stub.trigger weapon_set_first_time_hint(cost, ammo_cost);
							continue;
						}
					}
				}
				if(!is_grenade && !is_melee)
				{
					wallbuy weapon_set_first_time_hint(cost, ammo_cost);
				}
			}
		}
		return;
	}
}

/*
	Name: weapon_show
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x7F10
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 3023
*/
function weapon_show(player)
{
	player_angles = VectorToAngles(player.origin - self.origin);
	player_yaw = player_angles[1];
	weapon_yaw = self.angles[1];
	if(isdefined(self.script_int))
	{
		weapon_yaw = weapon_yaw - self.script_int;
	}
	yaw_diff = AngleClamp180(player_yaw - weapon_yaw);
	if(yaw_diff > 0)
	{
		yaw = weapon_yaw - 90;
	}
	else
	{
		yaw = weapon_yaw + 90;
	}
	self.og_origin = self.origin;
	self.origin = self.origin + AnglesToForward((0, yaw, 0)) * 8;
	wait(0.05);
	self show();
	zm_utility::play_sound_at_pos("weapon_show", self.origin, self);
	time = 1;
	if(!isdefined(self._linked_ent))
	{
		self moveto(self.og_origin, time);
	}
}

/*
	Name: get_pack_a_punch_camo_index
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x80D0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 3063
*/
function get_pack_a_punch_camo_index(prev_pap_index)
{
	if(isdefined(level.pack_a_punch_camo_index_number_variants))
	{
		if(isdefined(prev_pap_index))
		{
			camo_variant = prev_pap_index + 1;
			if(camo_variant >= level.pack_a_punch_camo_index + level.pack_a_punch_camo_index_number_variants)
			{
				camo_variant = level.pack_a_punch_camo_index;
			}
			return camo_variant;
		}
		else
		{
			camo_variant = randomIntRange(0, level.pack_a_punch_camo_index_number_variants);
			return level.pack_a_punch_camo_index + camo_variant;
		}
	}
	else
	{
		return level.pack_a_punch_camo_index;
	}
}

/*
	Name: get_pack_a_punch_weapon_options
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x8188
	Size: 0x2A0
	Parameters: 1
	Flags: None
	Line Number: 3098
*/
function get_pack_a_punch_weapon_options(weapon)
{
	if(!isdefined(self.pack_a_punch_weapon_options))
	{
		self.pack_a_punch_weapon_options = [];
	}
	if(!is_weapon_upgraded(weapon))
	{
		return self CalcWeaponOptions(0, 0, 0, 0, 0);
	}
	if(isdefined(self.pack_a_punch_weapon_options[weapon]))
	{
		return self.pack_a_punch_weapon_options[weapon];
	}
	smiley_face_reticle_index = 1;
	camo_index = get_pack_a_punch_camo_index(undefined);
	lens_index = randomIntRange(0, 6);
	reticle_index = randomIntRange(0, 16);
	reticle_color_index = randomIntRange(0, 6);
	plain_reticle_index = 16;
	use_plain = RandomInt(10) < 1;
	if("saritch_upgraded" == weapon.rootweapon.name)
	{
		reticle_index = smiley_face_reticle_index;
	}
	else if(use_plain)
	{
		reticle_index = plain_reticle_index;
	}
	scary_eyes_reticle_index = 8;
	purple_reticle_color_index = 3;
	if(reticle_index == scary_eyes_reticle_index)
	{
		reticle_color_index = purple_reticle_color_index;
	}
	letter_a_reticle_index = 2;
	pink_reticle_color_index = 6;
	if(reticle_index == letter_a_reticle_index)
	{
		reticle_color_index = pink_reticle_color_index;
	}
	letter_e_reticle_index = 7;
	green_reticle_color_index = 1;
	if(reticle_index == letter_e_reticle_index)
	{
		reticle_color_index = green_reticle_color_index;
	}
	self.pack_a_punch_weapon_options[weapon] = self CalcWeaponOptions(camo_index, lens_index, reticle_index, reticle_color_index);
	return self.pack_a_punch_weapon_options[weapon];
}

/*
	Name: function_94a844a2
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x8430
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 3159
*/
function function_94a844a2()
{
	players = Array::randomize(GetPlayers());
	if(!self IsTestClient())
	{
		return self;
	}
	foreach(player in players)
	{
		if(!player IsTestClient())
		{
			return player;
		}
	}
	return self;
	ERROR: Bad function call
}

/*
	Name: give_build_kit_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x8520
	Size: 0x1108
	Parameters: 2
	Flags: None
	Line Number: 3187
*/
function give_build_kit_weapon(weapon, var_20f8f22b)
{
	if(isdefined(weapon) && isdefined(weapon.inventoryType) && weapon.inventoryType != "primary")
	{
		self namespace_3d0867a6::function_18df83fb("pickup");
	}
	if(isdefined(var_20f8f22b))
	{
		return weapon;
	}
	if(weapon.name == "hero_annihilator")
	{
		self GiveWeapon(weapon);
		self giveMaxAmmo(weapon);
		self GadgetPowerSet(0, 100);
		self SetLowReady(0);
		self function_92dca8b7(weapon, 1);
		return weapon;
	}
	if(weapon.name == "bowie_knife" && self hasPerk("specialty_widowswine"))
	{
		weapon = GetWeapon("bowie_knife_widows_wine");
	}
	var_b719b59 = GetDvarString("aaeoption_t6pap");
	if(var_b719b59 == "1")
	{
		if(weapon != level.weaponNone)
		{
			self GiveWeapon(weapon);
		}
		return weapon;
	}
	if(var_b719b59 == "2" || var_b719b59 == "4")
	{
		foreach(playerWeapon in self GetWeaponsList(1))
		{
			if(playerWeapon.rootweapon == weapon.rootweapon)
			{
				return playerWeapon;
			}
		}
		attachments = function_753291e4(weapon);
		acvi = 0;
		if(isdefined(attachments) && IsArray(attachments) && attachments.size)
		{
			weapon = GetWeapon(weapon.rootweapon.name, attachments);
			if(isdefined(weapon))
			{
				switch(attachments.size)
				{
					case 8:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss(), attachments[2], math::cointoss(), attachments[3], math::cointoss(), attachments[4], math::cointoss(), attachments[5], math::cointoss(), attachments[6], math::cointoss(), attachments[7], math::cointoss());
						break;
					}
					case 7:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss(), attachments[2], math::cointoss(), attachments[3], math::cointoss(), attachments[4], math::cointoss(), attachments[5], math::cointoss(), attachments[6], math::cointoss());
						break;
					}
					case 6:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss(), attachments[2], math::cointoss(), attachments[3], math::cointoss(), attachments[4], math::cointoss(), attachments[5], math::cointoss());
						break;
					}
					case 5:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss(), attachments[2], math::cointoss(), attachments[3], math::cointoss(), attachments[4], math::cointoss());
						break;
					}
					case 4:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss(), attachments[2], math::cointoss(), attachments[3], math::cointoss());
						break;
					}
					case 3:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss(), attachments[2], math::cointoss());
						break;
					}
					case 2:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss(), attachments[1], math::cointoss());
						break;
					}
					case 1:
					{
						acvi = GetAttachmentCosmeticVariantIndexes(weapon, attachments[0], math::cointoss());
						break;
					}
				}
			}
		}
		var_f1eb4e4b = randomIntRange(1, 139);
		weapon_options = self CalcWeaponOptions(var_f1eb4e4b, 0, 0);
		if(WeaponHasAttachment(weapon, "reflex") || WeaponHasAttachment(weapon, "acog") || WeaponHasAttachment(weapon, "dualoptic"))
		{
			weapon_options = self CalcWeaponOptions(var_f1eb4e4b, 0, RandomInt(41));
		}
		if(WeaponHasAttachment(weapon, "ir"))
		{
			weapon_options = self CalcWeaponOptions(var_f1eb4e4b, 0, RandomInt(34));
		}
		if(var_b719b59 == "4")
		{
			weapon_options = self getbuildkitweaponoptions(weapon.rootweapon);
		}
	}
	else
	{
		target_player = self function_94a844a2();
		upgraded = 0;
		camo = undefined;
		if(var_b719b59 == "3")
		{
			camo = randomIntRange(1, 139);
		}
		base_weapon = weapon;
		if(is_weapon_included(base_weapon))
		{
			force_attachments = get_force_attachments(base_weapon.rootweapon);
		}
		if(is_weapon_upgraded(weapon))
		{
			base_weapon = get_base_weapon(weapon);
			if(is_weapon_included(base_weapon))
			{
				force_attachments = get_force_attachments(base_weapon.rootweapon);
			}
			upgraded = 1;
			if(weapon.name == "elmg_katana_upgraded")
			{
				var_54beaf91 = target_player getbuildkitweaponoptions(GetWeapon("melee_katana"));
			}
			if(weapon.name == "thundergun_upgraded_og")
			{
				var_54beaf91 = target_player getbuildkitweaponoptions(GetWeapon("thundergun"));
			}
			if(weapon.name == "ray_gun_upgraded_cw")
			{
				var_54beaf91 = target_player getbuildkitweaponoptions(GetWeapon("ray_gun"));
			}
			var_f64e4328 = self CalcWeaponOptions(0, 0, 0);
			var_54beaf91 = target_player getbuildkitweaponoptions(base_weapon, camo);
			if(GetDvarString("ui_mapname")[0] != "z" && (base_weapon.rootweapon.name == "pistol_burst" || base_weapon.rootweapon.name == "pistol_burst_upgraded"))
			{
				var_220646a4 = GetWeapon(base_weapon.rootweapon.name, "extclip");
			}
			else
			{
				var_220646a4 = target_player getbuildkitweapon(base_weapon, 0);
			}
			var_45511e9b = var_54beaf91 == var_f64e4328;
			if(var_45511e9b && base_weapon == var_220646a4)
			{
				var_e9f9d43a = 1;
			}
			if(isdefined(var_e9f9d43a) || GetDvarString("tfoption_og_camo") != "1")
			{
				if(isdefined(weapon.pap_camo_to_use))
				{
					camo = weapon.pap_camo_to_use;
				}
				else
				{
					camo = get_pack_a_punch_camo_index(undefined);
				}
			}
		}
		if(isdefined(var_e9f9d43a))
		{
			if(isdefined(upgraded) && upgraded && weapon.name != "sniper_marksman" && weapon.name != "sniper_marksman")
			{
				packed_attachments = [];
				packed_attachments[packed_attachments.size] = "extclip";
				packed_attachments[packed_attachments.size] = "extbarrel";
				force_attachments = ArrayCombine(force_attachments, packed_attachments, 0, 0);
			}
			weapon = GetWeapon(weapon.rootweapon.name, force_attachments);
			if(!isdefined(camo))
			{
				camo = 0;
			}
			weapon_options = self CalcWeaponOptions(camo, 0, 0);
			acvi = 0;
		}
		else if(GetDvarString("ui_mapname")[0] != "z" && (weapon.rootweapon.name == "pistol_burst" || weapon.rootweapon.name == "pistol_burst_upgraded"))
		{
			weapon = GetWeapon(weapon.rootweapon.name, "extclip");
			acvi = GetAttachmentCosmeticVariantIndexes(weapon, "extclip", 1);
		}
		else
		{
			weapon = target_player getbuildkitweapon(weapon, 0);
			acvi = target_player GetBuildKitAttachmentCosmeticVariantIndexes(weapon, 0);
		}
		weapon_options = target_player getbuildkitweaponoptions(weapon, camo);
		if(weapon.name == "elmg_katana_upgraded")
		{
			weapon_options = target_player getbuildkitweaponoptions(GetWeapon("melee_katana"), camo);
		}
		if(weapon.name == "thundergun_upgraded_og")
		{
			weapon_options = target_player getbuildkitweaponoptions(GetWeapon("thundergun"), camo);
		}
		if(weapon.name == "ray_gun_upgraded_cw")
		{
			weapon_options = target_player getbuildkitweaponoptions(GetWeapon("ray_gun"), camo);
		}
		if(weapon.name == "bowie_knife_widows_wine")
		{
			weapon_options = target_player getbuildkitweaponoptions(GetWeapon("bowie_knife"), camo);
		}
	}
	if(weapon != level.weaponNone)
	{
		self GiveWeapon(weapon, weapon_options, acvi);
	}
	return weapon;
}

/*
	Name: function_753291e4
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x9630
	Size: 0x450
	Parameters: 1
	Flags: None
	Line Number: 3418
*/
function function_753291e4(weapon)
{
	var_67334745 = weapon.rootweapon.supportedAttachments;
	if(!isdefined(var_67334745) || var_67334745.size == 0)
	{
		return 0;
	}
	var_2cc5848f = tableLookup("gamedata/weapons/common/attachmentcanuse.csv", 0, weapon.rootweapon.name, 2);
	if(isdefined(var_2cc5848f) && var_2cc5848f)
	{
		var_1e24d234 = tableLookup("gamedata/weapons/common/attachmentcanuse.csv", 0, weapon.rootweapon.name, 1);
	}
	else
	{
		return 0;
	}
	var_e9d3f639 = StrTok(var_1e24d234, " ");
	var_f93fb98e = [];
	var_98b4272d = [];
	foreach(Attach in var_e9d3f639)
	{
		if(Attach == "swayreduc" || Attach == "acog" || Attach == "dualoptic" || Attach == "reflex" || Attach == "reddot" || Attach == "ir" || Attach == "holo")
		{
			var_f93fb98e[var_f93fb98e.size] = Attach;
			continue;
		}
		var_98b4272d[var_98b4272d.size] = Attach;
	}
	var_23de35c = [];
	if(var_f93fb98e.size != 0)
	{
		if(!IsSubStr(weapon.rootweapon.name, "sniper"))
		{
			var_f93fb98e[var_f93fb98e.size] = var_98b4272d[var_98b4272d.size - 1];
		}
		if(math::cointoss())
		{
			var_23de35c[var_23de35c.size] = Array::random(var_f93fb98e);
		}
	}
	var_98b4272d = Array::randomize(var_98b4272d);
	foreach(Attach in var_98b4272d)
	{
		if(IsSubStr(weapon.rootweapon.name, "sniper"))
		{
			if(var_23de35c.size < 5)
			{
				if(Attach == "suppressed")
				{
					if(math::cointoss())
					{
						var_23de35c[var_23de35c.size] = Attach;
					}
				}
				else
				{
					var_23de35c[var_23de35c.size] = Attach;
					continue;
				}
			}
		}
		if(var_23de35c.size < 8)
		{
			if(Attach == "suppressed")
			{
				if(math::cointoss())
				{
					var_23de35c[var_23de35c.size] = Attach;
					continue;
				}
			}
			var_23de35c[var_23de35c.size] = Attach;
		}
	}
	return var_23de35c;
}

/*
	Name: function_a2ea69e8
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x9A88
	Size: 0x130
	Parameters: 1
	Flags: None
	Line Number: 3505
*/
function function_a2ea69e8(weapon)
{
	var_67334745 = weapon.rootweapon.supportedAttachments;
	if(!isdefined(var_67334745) || var_67334745.size == 0)
	{
		return 0;
	}
	var_2cc5848f = tableLookup("gamedata/weapons/common/attachmentcanuse.csv", 0, weapon.rootweapon.name, 2);
	if(isdefined(var_2cc5848f) && var_2cc5848f)
	{
		var_1e24d234 = tableLookup("gamedata/weapons/common/attachmentcanuse.csv", 0, weapon.rootweapon.name, 1);
	}
	else
	{
		return 0;
	}
	var_e9d3f639 = StrTok(var_1e24d234, " ");
	return var_e9d3f639[RandomInt(var_e9d3f639.size)];
}

/*
	Name: weapon_give
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0x9BC0
	Size: 0x1140
	Parameters: 7
	Flags: None
	Line Number: 3535
*/
function weapon_give(weapon, is_upgrade, magic_box, nosound, b_switch_weapon, var_d277f374, var_2b0c266d)
{
	if(!isdefined(is_upgrade))
	{
		is_upgrade = 0;
	}
	if(!isdefined(magic_box))
	{
		magic_box = 0;
	}
	if(!isdefined(nosound))
	{
		nosound = 0;
	}
	if(!isdefined(b_switch_weapon))
	{
		b_switch_weapon = 1;
	}
	if(weapon == level.weaponNone)
	{
		return weapon;
	}
	primaryWeapons = self getweaponslistprimaries();
	initial_current_weapon = self GetCurrentWeapon();
	current_weapon = self switch_from_alt_weapon(initial_current_weapon);
	/#
		Assert(self player_can_use_content(weapon));
	#/
	if(!isdefined(is_upgrade))
	{
		is_upgrade = 0;
	}
	weapon_limit = zm_utility::get_player_weapon_limit(self);
	if(zm_equipment::is_equipment(weapon))
	{
		self zm_equipment::give(weapon);
	}
	if(weapon.isRiotShield)
	{
		if(isdefined(self.player_shield_reset_health))
		{
			self [[self.player_shield_reset_health]]();
		}
	}
	if(self hasweapon(weapon))
	{
		if(weapon.isBallisticKnife)
		{
			self notify("zmb_lost_knife");
		}
		self GiveStartAmmo(weapon);
		self giveMaxAmmo(weapon);
		if(!zm_utility::is_offhand_weapon(weapon))
		{
			if(self hasPerk("specialty_fastreload"))
			{
				self function_92dca8b7(weapon, 0);
				self SwitchToWeaponImmediate(weapon);
			}
			else
			{
				self SwitchToWeapon(weapon);
			}
		}
		self notify("weapon_give", weapon);
		return weapon;
	}
	var_b719b59 = GetDvarString("aaeoption_t6pap");
	if(var_b719b59 == "2" || var_b719b59 == "4")
	{
		foreach(playerWeapon in self getweaponslistprimaries())
		{
			if(weapon.rootweapon.name == playerWeapon.rootweapon.name)
			{
				self GiveStartAmmo(playerWeapon);
				self giveMaxAmmo(weapon);
				if(self hasPerk("specialty_fastreload"))
				{
					self function_92dca8b7(playerWeapon, 0);
					self SwitchToWeaponImmediate(playerWeapon);
				}
				else
				{
					self SwitchToWeapon(playerWeapon);
				}
				self notify("weapon_give", playerWeapon);
				return playerWeapon;
			}
		}
	}
	else if(weapon.name == "ray_gun" || weapon.name == "raygun_mark2")
	{
		if(self has_weapon_or_upgrade(GetWeapon("raygun_mark2")) && weapon.name == "ray_gun")
		{
			for(i = 0; i < primaryWeapons.size; i++)
			{
				if(IsSubStr(primaryWeapons[i].name, "raygun_mark2"))
				{
					self GiveStartAmmo(primaryWeapons[i]);
					break;
				}
			}
			self notify("weapon_give", weapon);
			return weapon;
		}
		else if(self has_weapon_or_upgrade(GetWeapon("ray_gun")) && weapon.name == "raygun_mark2")
		{
			for(i = 0; i < primaryWeapons.size; i++)
			{
				if(IsSubStr(primaryWeapons[i].name, "ray_gun"))
				{
					self weapon_take(primaryWeapons[i]);
					break;
				}
			}
			weapon = self give_build_kit_weapon(weapon);
			self notify("weapon_give", weapon);
			self GiveStartAmmo(weapon);
			if(self hasPerk("specialty_fastreload"))
			{
				self function_92dca8b7(weapon, 0);
				self SwitchToWeaponImmediate(weapon);
			}
			else
			{
				self function_92dca8b7(weapon, 1);
				self SwitchToWeapon(weapon);
			}
			return weapon;
		}
	}
	if(zm_utility::is_melee_weapon(weapon))
	{
		if(weapon.name == "bowie_knife" && self hasPerk("specialty_widowswine"))
		{
			weapon = GetWeapon("bowie_knife_widows_wine");
		}
		current_weapon = zm_melee_weapon::change_melee_weapon(weapon, current_weapon);
	}
	else if(zm_utility::is_hero_weapon(weapon))
	{
		old_hero = self zm_utility::get_player_hero_weapon();
		if(old_hero != level.weaponNone)
		{
			self weapon_take(old_hero);
		}
		self zm_utility::set_player_hero_weapon(weapon);
	}
	else if(zm_utility::is_lethal_grenade(weapon))
	{
		old_lethal = self zm_utility::get_player_lethal_grenade();
		if(old_lethal != level.weaponNone)
		{
			self weapon_take(old_lethal);
		}
		self zm_utility::set_player_lethal_grenade(weapon);
		if(!IsSubStr(weapon.name, "grenade"))
		{
			var_bbf41451 = weapon.displayName;
			if(!isdefined(weapon.displayName))
			{
				var_bbf41451 = weapon.name;
			}
			if(!(isdefined(nosound) && nosound))
			{
				thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦" + "â¦SUBEVENT_GOTWPâ¦ â¦" + var_bbf41451 + "â¦â¦SUBEVENT_DOTâ¦");
			}
		}
	}
	else if(zm_utility::is_tactical_grenade(weapon))
	{
		old_tactical = self zm_utility::get_player_tactical_grenade();
		if(old_tactical != level.weaponNone)
		{
			self weapon_take(old_tactical);
		}
		self zm_utility::set_player_tactical_grenade(weapon);
		var_bbf41451 = weapon.displayName;
		if(!isdefined(weapon.displayName))
		{
			var_bbf41451 = weapon.name;
		}
		if(!(isdefined(nosound) && nosound))
		{
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦" + "â¦SUBEVENT_GOTWPâ¦ â¦" + var_bbf41451 + "â¦â¦SUBEVENT_DOTâ¦");
		}
	}
	else if(zm_utility::is_placeable_mine(weapon))
	{
		old_mine = self zm_utility::get_player_placeable_mine();
		if(old_mine != level.weaponNone)
		{
			self weapon_take(old_mine);
		}
		self zm_utility::set_player_placeable_mine(weapon);
		var_bbf41451 = weapon.displayName;
		if(!isdefined(weapon.displayName))
		{
			var_bbf41451 = weapon.name;
		}
		if(!(isdefined(nosound) && nosound))
		{
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦" + "â¦SUBEVENT_GOTWPâ¦ â¦" + var_bbf41451 + "â¦â¦SUBEVENT_DOTâ¦");
		}
	}
	if(!zm_utility::is_offhand_weapon(weapon))
	{
		self take_fallback_weapon();
	}
	if(primaryWeapons.size >= weapon_limit)
	{
		if(zm_utility::is_placeable_mine(current_weapon) || zm_equipment::is_equipment(current_weapon))
		{
			current_weapon = undefined;
		}
		if(isdefined(current_weapon))
		{
			if(!zm_utility::is_offhand_weapon(weapon))
			{
				if(current_weapon.isBallisticKnife)
				{
					self notify("zmb_lost_knife");
				}
				self weapon_take(current_weapon);
				if(isdefined(initial_current_weapon) && IsSubStr(initial_current_weapon.name, "dualoptic"))
				{
					self weapon_take(initial_current_weapon);
				}
			}
		}
	}
	if(isdefined(level.zombiemode_offhand_weapon_give_override))
	{
		if(self [[level.zombiemode_offhand_weapon_give_override]](weapon))
		{
			self notify("weapon_give", weapon);
			self zm_utility::play_sound_on_ent("purchase");
			return weapon;
		}
	}
	if(weapon.isBallisticKnife)
	{
		weapon = self zm_melee_weapon::give_ballistic_knife(weapon, is_weapon_upgraded(weapon));
	}
	else if(zm_utility::is_placeable_mine(weapon))
	{
		self thread zm_placeable_mine::setup_for_player(weapon);
		self play_weapon_vo(weapon, magic_box);
		self notify("weapon_give", weapon);
		return weapon;
	}
	if(isdefined(level.zombie_weapons_callbacks) && isdefined(level.zombie_weapons_callbacks[weapon]))
	{
		self thread [[level.zombie_weapons_callbacks[weapon]]]();
		play_weapon_vo(weapon, magic_box);
		self notify("weapon_give", weapon);
		return weapon;
	}
	if(!(isdefined(nosound) && nosound))
	{
		self zm_utility::play_sound_on_ent("purchase");
		namespace_22b67853::function_f105c5b1("get_weapon", self);
		var_bbf41451 = weapon.displayName;
		if(!isdefined(weapon.displayName))
		{
			var_bbf41451 = weapon.name;
		}
		if(!(isdefined(nosound) && nosound))
		{
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, self.name, "â¦" + "â¦SUBEVENT_GOTWPâ¦ â¦" + var_bbf41451 + "â¦â¦SUBEVENT_DOTâ¦");
		}
	}
	weapon = self give_build_kit_weapon(weapon);
	self notify("weapon_give", weapon);
	self GiveStartAmmo(weapon);
	if(b_switch_weapon && !zm_utility::is_offhand_weapon(weapon))
	{
		if(!zm_utility::is_melee_weapon(weapon))
		{
			if(self hasPerk("specialty_fastreload"))
			{
				self function_92dca8b7(weapon, 0);
				self SwitchToWeaponImmediate(weapon);
			}
			else
			{
				self function_92dca8b7(weapon, 1);
				self SwitchToWeapon(weapon);
			}
		}
		else if(self hasPerk("specialty_fastreload"))
		{
			self function_92dca8b7(current_weapon, 0);
			self SwitchToWeaponImmediate(current_weapon);
		}
		else
		{
			self function_92dca8b7(current_weapon, 1);
			self SwitchToWeapon(current_weapon);
		}
	}
	if(level.script == "zm_castle")
	{
		if(weapon == level.var_be94cdb || weapon == level.var_fb620116 || weapon == level.var_16e90d5f || weapon == level.var_edf1e590 || weapon == level.var_e93874ed)
		{
			nosound = 0;
			magic_box = 0;
		}
	}
	if(!(isdefined(nosound) && nosound))
	{
		self play_weapon_vo(weapon, magic_box);
	}
	return weapon;
}

/*
	Name: weapon_take
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xAD08
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 3861
*/
function weapon_take(weapon, preserve)
{
	self notify("weapon_take", weapon);
	if(self hasweapon(weapon))
	{
		self TakeWeapon(weapon);
	}
}

/*
	Name: play_weapon_vo
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xAD68
	Size: 0x340
	Parameters: 2
	Flags: None
	Line Number: 3880
*/
function play_weapon_vo(weapon, magic_box)
{
	weapon = weapon.rootweapon;
	if(isdefined(level._audio_custom_weapon_check))
	{
		type = self [[level._audio_custom_weapon_check]](weapon, magic_box);
		if(!isdefined(type))
		{
			type = self weapon_type_check(weapon);
		}
	}
	else
	{
		type = self weapon_type_check(weapon);
	}
	if(weapon.name == "hero_annihilator")
	{
		type = "hero_annihilator";
	}
	if(!isdefined(type))
	{
		return;
	}
	if(isdefined(level.sndWeaponPickupOverride))
	{
		foreach(override in level.sndWeaponPickupOverride)
		{
			if(weapon.name === override)
			{
				self zm_audio::create_and_play_dialog("weapon_pickup", override);
				return;
			}
		}
	}
	else if(isdefined(level.var_e64e9b85))
	{
		if(is_weapon_upgraded(weapon))
		{
			if(is_wonder_weapon(weapon))
			{
				weapon = get_base_weapon(weapon);
			}
		}
		if(isdefined(level.var_e64e9b85[weapon.name]))
		{
			self zm_audio::create_and_play_dialog("weapon_pickup", level.var_e64e9b85[weapon.name]);
			return;
		}
	}
	if(isdefined(magic_box) && magic_box)
	{
		self zm_audio::create_and_play_dialog("box_pickup", type);
	}
	else if(type == "upgrade")
	{
		if(is_wonder_weapon(weapon) || weapon.isDualWield)
		{
			self zm_audio::create_and_play_dialog("weapon_pickup", type);
		}
		else
		{
			self zm_audio::create_and_play_dialog("weapon_pickup", "upgrade");
		}
	}
	else if(!self zm_audio::create_and_play_dialog("weapon_pickup", type))
	{
		self zm_audio::create_and_play_dialog("weapon_pickup", "generic");
	}
}

/*
	Name: weapon_type_check
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xB0B0
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 3960
*/
function weapon_type_check(weapon)
{
	if(weapon.name == "zombie_beast_grapple_dwr" || weapon.name == "zombie_beast_lightning_dwl" || weapon.name == "zombie_beast_lightning_dwl2" || weapon.name == "zombie_beast_lightning_dwl3")
	{
		return undefined;
	}
	if(!isdefined(self.entity_num))
	{
		return "crappy";
	}
	weapon = get_nonalternate_weapon(weapon);
	weapon = weapon.rootweapon;
	if(is_weapon_upgraded(weapon))
	{
		if(is_wonder_weapon(weapon))
		{
			weapon = get_base_weapon(weapon);
			if(isdefined(level.zombie_weapons[weapon]))
			{
				if(isdefined(level.zombie_weapons[weapon].vox))
				{
					return level.zombie_weapons[weapon].vox;
				}
				else
				{
					return weapon.name;
				}
			}
		}
		return "upgrade";
	}
	else if(isdefined(level.zombie_weapons[weapon]))
	{
		if(isdefined(level.zombie_weapons[weapon].vox))
		{
			return level.zombie_weapons[weapon].vox;
		}
		else
		{
			return weapon.name;
		}
	}
	return "crappy";
	return;
}

/*
	Name: ammo_give
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xB298
	Size: 0x3B0
	Parameters: 1
	Flags: None
	Line Number: 4016
*/
function ammo_give(weapon)
{
	give_ammo = 0;
	if(!zm_utility::is_offhand_weapon(weapon))
	{
		weapon = self get_weapon_with_attachments(weapon);
		if(isdefined(weapon))
		{
			clipSize = weapon.clipSize;
			var_6b50806 = weapon.maxAmmo;
			var_6facb7c0 = 0;
			var_cd44e080 = 0;
			dw_clipcount = 0;
			var_f6e06f18 = 0;
			if(isdefined(weapon.dualWieldWeapon))
			{
				var_6facb7c0 = weapon.dualWieldWeapon.clipSize;
				dw_clipcount = self GetWeaponAmmoClip(weapon.dualWieldWeapon);
			}
			if(isdefined(weapon.altweapon))
			{
				var_cd44e080 = weapon.altweapon.clipSize;
				var_f6e06f18 = self GetWeaponAmmoClip(weapon.altweapon);
			}
			var_fd34a620 = clipSize + var_6b50806 + var_6facb7c0 + var_cd44e080;
			clipCount = self GetWeaponAmmoClip(weapon);
			stockCount = self GetWeaponAmmoStock(weapon);
			ammo_count = clipCount + stockCount + dw_clipcount + var_f6e06f18;
			if(var_fd34a620 <= ammo_count)
			{
				give_ammo = 0;
			}
			else
			{
				give_ammo = 1;
			}
		}
	}
	else if(self has_weapon_or_upgrade(weapon))
	{
		if(self getammocount(weapon) < weapon.maxAmmo)
		{
			give_ammo = 1;
		}
	}
	if(give_ammo)
	{
		self zm_utility::play_sound_on_ent("purchase");
		self SetWeaponAmmoClip(weapon, weapon.clipSize);
		if(isdefined(weapon.dualWieldWeapon))
		{
			self SetWeaponAmmoClip(weapon.dualWieldWeapon, weapon.dualWieldWeapon.clipSize);
		}
		self giveMaxAmmo(weapon);
		alt_weap = weapon.altweapon;
		if(level.weaponNone != alt_weap)
		{
			self SetWeaponAmmoClip(alt_weap, alt_weap.clipSize);
			self giveMaxAmmo(alt_weap);
		}
		return 1;
	}
	if(!give_ammo)
	{
		return 0;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: get_default_weapondata
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xB650
	Size: 0x1D8
	Parameters: 1
	Flags: None
	Line Number: 4096
*/
function get_default_weapondata(weapon)
{
	weapondata = [];
	weapondata["weapon"] = weapon;
	dw_weapon = weapon.dualWieldWeapon;
	alt_weapon = weapon.altweapon;
	weaponNone = GetWeapon("none");
	if(isdefined(level.weaponNone))
	{
		weaponNone = level.weaponNone;
	}
	if(weapon != weaponNone)
	{
		weapondata["clip"] = weapon.clipSize;
		weapondata["stock"] = weapon.maxAmmo;
		weapondata["fuel"] = weapon.fuelLife;
		weapondata["heat"] = 0;
		weapondata["overheat"] = 0;
	}
	if(dw_weapon != weaponNone)
	{
		weapondata["lh_clip"] = dw_weapon.clipSize;
	}
	else
	{
		weapondata["lh_clip"] = 0;
	}
	if(alt_weapon != weaponNone)
	{
		weapondata["alt_clip"] = alt_weapon.clipSize;
		weapondata["alt_stock"] = alt_weapon.maxAmmo;
	}
	else
	{
		weapondata["alt_clip"] = 0;
		weapondata["alt_stock"] = 0;
	}
	return weapondata;
}

/*
	Name: get_player_weapondata
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xB830
	Size: 0x2A8
	Parameters: 2
	Flags: None
	Line Number: 4146
*/
function get_player_weapondata(player, weapon)
{
	weapondata = [];
	if(!isdefined(weapon))
	{
		weapon = player GetCurrentWeapon();
	}
	weapondata["weapon"] = weapon;
	if(weapondata["weapon"] != level.weaponNone)
	{
		weapondata["clip"] = player GetWeaponAmmoClip(weapon);
		weapondata["stock"] = player GetWeaponAmmoStock(weapon);
		weapondata["fuel"] = player GetWeaponAmmoFuel(weapon);
		weapondata["heat"] = player IsWeaponOverheating(1, weapon);
		weapondata["overheat"] = player IsWeaponOverheating(0, weapon);
	}
	else
	{
		weapondata["clip"] = 0;
		weapondata["stock"] = 0;
		weapondata["fuel"] = 0;
		weapondata["heat"] = 0;
		weapondata["overheat"] = 0;
	}
	dw_weapon = weapon.dualWieldWeapon;
	if(dw_weapon != level.weaponNone)
	{
		weapondata["lh_clip"] = player GetWeaponAmmoClip(dw_weapon);
	}
	else
	{
		weapondata["lh_clip"] = 0;
	}
	alt_weapon = weapon.altweapon;
	if(alt_weapon != level.weaponNone)
	{
		weapondata["alt_clip"] = player GetWeaponAmmoClip(alt_weapon);
		weapondata["alt_stock"] = player GetWeaponAmmoStock(alt_weapon);
	}
	else
	{
		weapondata["alt_clip"] = 0;
		weapondata["alt_stock"] = 0;
	}
	return weapondata;
}

/*
	Name: weapon_is_better
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xBAE0
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 4203
*/
function weapon_is_better(left, right)
{
	if(left != right)
	{
		left_upgraded = !isdefined(level.zombie_weapons[left]);
		right_upgraded = !isdefined(level.zombie_weapons[right]);
		if(left_upgraded && right_upgraded)
		{
			leftatt = get_attachment_index(left);
			rightatt = get_attachment_index(right);
			return leftatt > rightatt;
		}
		else if(left_upgraded)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: merge_weapons
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xBBC0
	Size: 0x488
	Parameters: 2
	Flags: None
	Line Number: 4233
*/
function merge_weapons(oldweapondata, newweapondata)
{
	weapondata = [];
	if(weapon_is_better(oldweapondata["weapon"], newweapondata["weapon"]))
	{
		weapondata["weapon"] = oldweapondata["weapon"];
	}
	else
	{
		weapondata["weapon"] = newweapondata["weapon"];
	}
	weapon = weapondata["weapon"];
	dw_weapon = weapon.dualWieldWeapon;
	alt_weapon = weapon.altweapon;
	if(weapon != level.weaponNone)
	{
		weapondata["clip"] = newweapondata["clip"] + oldweapondata["clip"];
		weapondata["clip"] = Int(min(weapondata["clip"], weapon.clipSize));
		weapondata["stock"] = newweapondata["stock"] + oldweapondata["stock"];
		weapondata["stock"] = Int(min(weapondata["stock"], weapon.maxAmmo));
		weapondata["fuel"] = newweapondata["fuel"] + oldweapondata["fuel"];
		weapondata["fuel"] = Int(min(weapondata["fuel"], weapon.fuelLife));
		weapondata["heat"] = Int(min(newweapondata["heat"], oldweapondata["heat"]));
		weapondata["overheat"] = Int(min(newweapondata["overheat"], oldweapondata["overheat"]));
	}
	if(dw_weapon != level.weaponNone)
	{
		weapondata["lh_clip"] = newweapondata["lh_clip"] + oldweapondata["lh_clip"];
		weapondata["lh_clip"] = Int(min(weapondata["lh_clip"], dw_weapon.clipSize));
	}
	if(alt_weapon != level.weaponNone)
	{
		weapondata["alt_clip"] = newweapondata["alt_clip"] + oldweapondata["alt_clip"];
		weapondata["alt_clip"] = Int(min(weapondata["alt_clip"], alt_weapon.clipSize));
		weapondata["alt_stock"] = newweapondata["alt_stock"] + oldweapondata["alt_stock"];
		weapondata["alt_stock"] = Int(min(weapondata["alt_stock"], alt_weapon.maxAmmo));
	}
	return weapondata;
}

/*
	Name: weapondata_give
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC050
	Size: 0x360
	Parameters: 4
	Flags: None
	Line Number: 4283
*/
function weapondata_give(weapondata, var_20f8f22b, var_7f612233, var_99d1b1a7)
{
	if(isdefined(var_20f8f22b) || isdefined(var_7f612233))
	{
		return;
	}
	current = self get_player_weapon_with_same_base(weapondata["weapon"]);
	if(isdefined(current) && !isdefined(var_99d1b1a7))
	{
		curweapondata = get_player_weapondata(self, current);
		self weapon_take(current);
		weapondata = merge_weapons(curweapondata, weapondata);
	}
	weapon = weapondata["weapon"];
	currentWeapon = weapon_give(weapon, undefined, undefined, 1);
	if(weapon != level.weaponNone)
	{
		self SetWeaponAmmoClip(currentWeapon, weapondata["clip"]);
		self SetWeaponAmmoStock(currentWeapon, weapondata["stock"]);
		if(isdefined(weapondata["fuel"]))
		{
			self SetWeaponAmmoFuel(currentWeapon, weapondata["fuel"]);
		}
		if(isdefined(weapondata["heat"]) && isdefined(weapondata["overheat"]))
		{
			self SetWeaponOverheating(weapondata["overheat"], weapondata["heat"], weapon);
		}
	}
	dw_weapon = currentWeapon.dualWieldWeapon;
	if(dw_weapon != level.weaponNone)
	{
		if(!self hasweapon(dw_weapon))
		{
			self GiveWeapon(dw_weapon);
		}
		self SetWeaponAmmoClip(dw_weapon, weapondata["lh_clip"]);
	}
	alt_weapon = currentWeapon.altweapon;
	if(alt_weapon != level.weaponNone && alt_weapon.altweapon == weapon)
	{
		if(!self hasweapon(alt_weapon))
		{
			self GiveWeapon(alt_weapon);
		}
		self SetWeaponAmmoClip(alt_weapon, weapondata["alt_clip"]);
		self SetWeaponAmmoStock(alt_weapon, weapondata["alt_stock"]);
	}
	return currentWeapon;
}

/*
	Name: weapondata_take
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC3B8
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 4343
*/
function weapondata_take(weapondata)
{
	weapon = weapondata["weapon"];
	if(weapon != level.weaponNone)
	{
		if(self hasweapon(weapon))
		{
			self weapon_take(weapon);
		}
	}
	dw_weapon = weapon.dualWieldWeapon;
	if(dw_weapon != level.weaponNone)
	{
		if(self hasweapon(dw_weapon))
		{
			self weapon_take(dw_weapon);
		}
	}
	for(alt_weapon = weapon.altweapon; alt_weapon != level.weaponNone; alt_weapon = weapon.altweapon)
	{
		if(self hasweapon(alt_weapon))
		{
			self weapon_take(alt_weapon);
		}
	}
}

/*
	Name: create_loadout
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC508
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 4380
*/
function create_loadout(weapons)
{
	weaponNone = GetWeapon("none");
	if(isdefined(level.weaponNone))
	{
		weaponNone = level.weaponNone;
	}
	loadout = spawnstruct();
	loadout.weapons = [];
	foreach(weapon in weapons)
	{
		if(IsString(weapon))
		{
			weapon = GetWeapon(weapon);
		}
		loadout.weapons[weapon.name] = get_default_weapondata(weapon);
		if(!isdefined(loadout.current))
		{
			loadout.current = weapon;
		}
	}
	return loadout;
}

/*
	Name: player_get_loadout
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC690
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 4414
*/
function player_get_loadout()
{
	loadout = spawnstruct();
	loadout.current = self GetCurrentWeapon();
	loadout.stowed = self GetStowedWeapon();
	loadout.weapons = [];
	foreach(weapon in self GetWeaponsList())
	{
		loadout.weapons[weapon.name] = get_player_weapondata(self, weapon);
	}
	return loadout;
}

/*
	Name: player_give_loadout
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC7B8
	Size: 0x1E8
	Parameters: 3
	Flags: None
	Line Number: 4437
*/
function player_give_loadout(loadout, replace_existing, immediate_switch)
{
	if(!isdefined(replace_existing))
	{
		replace_existing = 1;
	}
	if(!isdefined(immediate_switch))
	{
		immediate_switch = 0;
	}
	if(isdefined(replace_existing) && replace_existing)
	{
		self TakeAllWeapons();
	}
	foreach(weapondata in loadout.weapons)
	{
		self weapondata_give(weapondata);
	}
	if(!zm_utility::is_offhand_weapon(loadout.current))
	{
		if(immediate_switch)
		{
			self SwitchToWeaponImmediate(loadout.current);
		}
		else
		{
			self SwitchToWeapon(loadout.current);
		}
	}
	else if(immediate_switch)
	{
		self SwitchToWeaponImmediate();
	}
	else
	{
		self SwitchToWeapon();
	}
	if(isdefined(loadout.stowed))
	{
		self SetStowedWeapon(loadout.stowed);
	}
}

/*
	Name: player_take_loadout
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xC9A8
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 4490
*/
function player_take_loadout(loadout)
{
	foreach(weapondata in loadout.weapons)
	{
		self weapondata_take(weapondata);
	}
}

/*
	Name: register_zombie_weapon_callback
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCA50
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 4508
*/
function register_zombie_weapon_callback(weapon, func)
{
	if(!isdefined(level.zombie_weapons_callbacks))
	{
		level.zombie_weapons_callbacks = [];
	}
	if(!isdefined(level.zombie_weapons_callbacks[weapon]))
	{
		level.zombie_weapons_callbacks[weapon] = func;
	}
}

/*
	Name: set_stowed_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCAB0
	Size: 0x268
	Parameters: 1
	Flags: None
	Line Number: 4530
*/
function set_stowed_weapon(weapon)
{
	if(GetDvarString("ui_mapname") == "3236409516" || GetDvarString("ui_mapname") == "2926670826")
	{
		return;
	}
	if(!IsSubStr(weapon.viewmodels, "shield") && IsSubStr(self GetCharacterBodyModel(), "waw"))
	{
		return;
	}
	if(weapon == level.weaponNone)
	{
		self clear_stowed_weapon();
		return;
	}
	player_body = self GetCharacterBodyModel();
	var_eefcf27b = self GetCharacterHeadModel();
	player_weapon = self GetCurrentWeapon().worldmodel;
	var_129ff339 = weapon.worldmodel;
	var_2724ca06 = function_a1099351(player_body);
	var_ba12babc = function_a1099351(var_eefcf27b);
	var_699f53de = function_a1099351(player_weapon);
	var_6ab66ce = function_a1099351(var_129ff339);
	count = var_2724ca06 + var_ba12babc + var_699f53de + var_6ab66ce;
	if(count >= 200)
	{
		self clear_stowed_weapon();
		return;
	}
	self.weapon_stowed = weapon;
	if(!(isdefined(self.stowed_weapon_suppressed) && self.stowed_weapon_suppressed))
	{
		self SetStowedWeapon(self.weapon_stowed);
	}
}

/*
	Name: clear_stowed_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCD20
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4576
*/
function clear_stowed_weapon()
{
	self.weapon_stowed = undefined;
	self ClearStowedWeapon();
	return;
	ERROR: Bad function call
}

/*
	Name: suppress_stowed_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCD50
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 4594
*/
function suppress_stowed_weapon(onOff)
{
	self.stowed_weapon_suppressed = onOff;
	if(onOff || !isdefined(self.weapon_stowed))
	{
		self ClearStowedWeapon();
	}
	else
	{
		self SetStowedWeapon(self.weapon_stowed);
	}
}

/*
	Name: checkStringValid
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCDC0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 4617
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2ae4d876
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCDF0
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 4637
*/
function function_2ae4d876()
{
	switch(GetDvarString("mapname"))
	{
		case "zm_castle":
		{
			return 1;
			break;
		}
		case "zm_island":
		{
			return 1;
			break;
		}
		case "zm_stalingrad":
		{
			return 1;
			break;
		}
		case "zm_genesis":
		{
			return 1;
			break;
		}
		case "zm_theater":
		{
			return 1;
			break;
		}
		case "zm_prototype":
		{
			return 1;
			break;
		}
		case "zm_moon":
		{
			return 1;
			break;
		}
		case "zm_temple":
		{
			return 1;
			break;
		}
		case "zm_cosmodrome":
		{
			return 1;
			break;
		}
		case "zm_tomb":
		{
			return 1;
			break;
		}
	}
	return 0;
}

/*
	Name: checkIntValid
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCED8
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 4705
*/
function checkIntValid(STR)
{
	if(STR != "")
	{
		return Int(STR);
	}
	return undefined;
}

/*
	Name: load_weapon_spec_from_table
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xCF18
	Size: 0x7F0
	Parameters: 2
	Flags: None
	Line Number: 4724
*/
function load_weapon_spec_from_table(table, first_row)
{
	index = 1;
	row = TableLookupRow(table, index);
	while(isdefined(row))
	{
		weapon_name = checkStringValid(row[0]);
		if(!isdefined(weapon_name) || GetWeapon(weapon_name) == level.weaponNone)
		{
			index++;
			row = TableLookupRow(table, index);
			continue;
		}
		upgrade_name = checkStringValid(row[1]);
		hint = checkStringValid(row[2]);
		cost = Int(row[3]);
		weaponVO = checkStringValid(row[4]);
		weaponVOresp = checkStringValid(row[5]);
		ammo_cost = undefined;
		if("" != row[6])
		{
			ammo_cost = Int(row[6]);
		}
		create_vox = checkStringValid(row[7]);
		is_zcleansed = ToLower(row[8]) == "true";
		in_box = ToLower(row[9]) == "true";
		upgrade_in_box = ToLower(row[10]) == "true";
		is_limited = ToLower(row[11]) == "true";
		is_aat_exempt = ToLower(row[17]) == "true";
		limit = Int(row[12]);
		upgrade_limit = Int(row[13]);
		content_restrict = row[14];
		wallbuy_autospawn = ToLower(row[15]) == "true";
		WEAPON_CLASS = checkStringValid(row[16]);
		is_wonder_weapon = ToLower(row[18]) == "true";
		force_attachments = "";
		if(GetDvarInt("aae_lite") != 1)
		{
			if(function_2ae4d876() && weapon_name == "tesla_gun")
			{
				weapon_name = undefined;
				upgrade_name = undefined;
			}
			if(GetDvarString("tfoption_dw") == "1")
			{
				if(upgrade_name == "thundergun_upgraded")
				{
					upgrade_name = "thundergun_upgraded_og";
					if(level.weaponZMThunderGunUpgraded != GetWeapon("thundergun_upgraded_og"))
					{
						level.weaponZMThunderGunUpgraded = GetWeapon("thundergun_upgraded_og");
					}
				}
				if(upgrade_name == "ray_gun_upgraded")
				{
					upgrade_name = "ray_gun_upgraded_cw";
				}
			}
			if(weapon_name == "incendiary_grenade2" && GetDvarString("mapname") == "zm_powerstation")
			{
				in_box = 0;
			}
		}
		if(weapon_name == "melee_katana")
		{
			if(GetDvarInt("aae_lite") != 1)
			{
				cost = 10000;
			}
		}
		if(GetDvarInt("tfoption_iw4"))
		{
			if(function_92e48e37(table))
			{
				in_box = 0;
			}
		}
		zm_utility::include_weapon(weapon_name, in_box);
		if(isdefined(upgrade_name))
		{
			zm_utility::include_weapon(upgrade_name, upgrade_in_box);
		}
		add_zombie_weapon(weapon_name, upgrade_name, hint, cost, weaponVO, weaponVOresp, ammo_cost, create_vox, is_wonder_weapon, force_attachments);
		if(GetDvarInt("tfoption_limit") == 2)
		{
			is_limited = 1;
			limit = 1;
		}
		if(GetDvarInt("tfoption_limit") == 1)
		{
			is_limited = 0;
		}
		if(is_limited)
		{
			if(isdefined(limit))
			{
				add_limited_weapon(weapon_name, limit);
			}
			if(isdefined(upgrade_limit) && isdefined(upgrade_name))
			{
				add_limited_weapon(upgrade_name, upgrade_limit);
			}
		}
		weapon = GetWeapon(weapon_name);
		if(!isdefined(level.wallbuy_autofill_weapons))
		{
			level.wallbuy_autofill_weapons = [];
			level.wallbuy_autofill_weapons["all"] = [];
		}
		level.wallbuy_autofill_weapons["all"][weapon] = wallbuy_autospawn;
		if(WEAPON_CLASS != "")
		{
			if(!isdefined(level.wallbuy_autofill_weapons[WEAPON_CLASS]))
			{
				level.wallbuy_autofill_weapons[WEAPON_CLASS] = [];
			}
			level.wallbuy_autofill_weapons[WEAPON_CLASS][weapon] = weapon;
		}
		index++;
		row = TableLookupRow(table, index);
	}
}

/*
	Name: function_92e48e37
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xD710
	Size: 0xE0
	Parameters: 1
	Flags: Private
	Line Number: 4857
*/
function private function_92e48e37(table)
{
	ui_mapname = GetDvarString("ui_mapname");
	var_f3586f99 = StrStartsWith(ui_mapname, "zm_");
	if(!var_f3586f99)
	{
		prefix = "gamedata/weapons/zm/";
		if(table == prefix + "elmg_weapons.csv" || table == prefix + "mk3.csv" || table == prefix + "t7_ogweapons.csv" || table == prefix + "dg2.csv")
		{
			return 0;
		}
		return 1;
	}
	return 0;
}

/*
	Name: autofill_wallbuys_init
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xD7F8
	Size: 0x698
	Parameters: 0
	Flags: None
	Line Number: 4883
*/
function autofill_wallbuys_init()
{
	Wallbuys = struct::get_array("wallbuy_autofill", "targetname");
	if(!isdefined(Wallbuys) || Wallbuys.size == 0 || !isdefined(level.wallbuy_autofill_weapons) || level.wallbuy_autofill_weapons.size == 0)
	{
		return;
	}
	level.use_autofill_wallbuy = 1;
	level.active_autofill_wallbuys = [];
	array_keys["all"] = getArrayKeys(level.wallbuy_autofill_weapons["all"]);
	class_all = [];
	index = 0;
	foreach(wallbuy in Wallbuys)
	{
		WEAPON_CLASS = wallbuy.script_string;
		weapon = undefined;
		if(isdefined(WEAPON_CLASS) && WEAPON_CLASS != "")
		{
			if(!isdefined(array_keys[WEAPON_CLASS]) && isdefined(level.wallbuy_autofill_weapons[WEAPON_CLASS]))
			{
				array_keys[WEAPON_CLASS] = getArrayKeys(level.wallbuy_autofill_weapons[WEAPON_CLASS]);
			}
			if(isdefined(array_keys[WEAPON_CLASS]))
			{
				for(i = 0; i < array_keys[WEAPON_CLASS].size; i++)
				{
					if(level.wallbuy_autofill_weapons["all"][array_keys[WEAPON_CLASS][i]])
					{
						weapon = array_keys[WEAPON_CLASS][i];
						level.wallbuy_autofill_weapons["all"][weapon] = 0;
						break;
					}
				}
				continue;
			}
			else
			{
			}
		}
		else
		{
			class_all[class_all.size] = wallbuy;
			continue;
		}
		if(!isdefined(weapon))
		{
			continue;
		}
		wallbuy.zombie_weapon_upgrade = weapon.name;
		wallbuy.weapon = weapon;
		right = AnglesToRight(wallbuy.angles);
		wallbuy.origin = wallbuy.origin - right * 2;
		wallbuy.target = "autofill_wallbuy_" + index;
		target_struct = spawnstruct();
		target_struct.targetname = wallbuy.target;
		target_struct.angles = wallbuy.angles;
		target_struct.origin = wallbuy.origin;
		model = wallbuy.weapon.worldmodel;
		target_struct.model = model;
		target_struct struct::init();
		level.active_autofill_wallbuys[level.active_autofill_wallbuys.size] = wallbuy;
		index++;
	}
	foreach(wallbuy in class_all)
	{
		weapon = undefined;
		for(i = 0; i < array_keys["all"].size; i++)
		{
			if(level.wallbuy_autofill_weapons["all"][array_keys["all"][i]])
			{
				weapon = array_keys["all"][i];
				level.wallbuy_autofill_weapons["all"][weapon] = 0;
				break;
			}
		}
		if(!isdefined(weapon))
		{
			break;
		}
		wallbuy.zombie_weapon_upgrade = weapon.name;
		wallbuy.weapon = weapon;
		right = AnglesToRight(wallbuy.angles);
		wallbuy.origin = wallbuy.origin - right * 2;
		wallbuy.target = "autofill_wallbuy_" + index;
		target_struct = spawnstruct();
		target_struct.targetname = wallbuy.target;
		target_struct.angles = wallbuy.angles;
		target_struct.origin = wallbuy.origin;
		model = wallbuy.weapon.worldmodel;
		target_struct.model = model;
		target_struct struct::init();
		level.active_autofill_wallbuys[level.active_autofill_wallbuys.size] = wallbuy;
		index++;
	}
}

/*
	Name: is_wallbuy
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xDE98
	Size: 0xC0
	Parameters: 1
	Flags: None
	Line Number: 4989
*/
function is_wallbuy(w_to_check)
{
	w_base = get_base_weapon(w_to_check);
	foreach(s_wallbuy in level._spawned_wallbuys)
	{
		if(s_wallbuy.weapon == w_base)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: is_sniper_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xDF60
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 5012
*/
function is_sniper_weapon(w_to_check)
{
	w_base = get_base_weapon(w_to_check);
	if(isdefined(level.zombie_weapons[w_base]) && level.zombie_weapons[w_base].weaponVO === "sniper")
	{
		return 1;
	}
	return 0;
}

/*
	Name: is_wonder_weapon
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xDFD8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 5032
*/
function is_wonder_weapon(w_to_check)
{
	w_base = get_base_weapon(w_to_check);
	if(isdefined(level.zombie_weapons[w_base]) && level.zombie_weapons[w_base].is_wonder_weapon)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_90de4159
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xE048
	Size: 0x2A0
	Parameters: 2
	Flags: None
	Line Number: 5052
*/
function function_90de4159(weapon, is_wallbuy)
{
	if(!isdefined(is_wallbuy))
	{
		is_wallbuy = 0;
	}
	if(!isdefined(weapon) || !isdefined(weapon.name))
	{
		return 0;
	}
	w_root = weapon.rootweapon;
	if(is_weapon_upgraded(w_root))
	{
		w_root = get_base_weapon(w_root);
	}
	var_b3410de7 = get_ammo_cost(w_root);
	if(is_wallbuy && self has_upgrade(weapon))
	{
		weapon = get_upgrade_weapon(weapon);
	}
	var_9867ace1 = 0;
	if(is_weapon_upgraded(weapon))
	{
		var_9867ace1 = self function_21f2c5eb(weapon);
	}
	var_a7f0a318 = self function_6e424686(weapon);
	if(isdefined(self.AAT[weapon]))
	{
		var_a7f0a318++;
	}
	switch(var_9867ace1)
	{
		case 1:
		{
			var_b3410de7 = var_b3410de7 + 2500;
			break;
		}
		case 2:
		{
			var_b3410de7 = var_b3410de7 + 4000;
			break;
		}
		case 3:
		{
			var_b3410de7 = var_b3410de7 + 5500;
			break;
		}
		case 4:
		{
			var_b3410de7 = var_b3410de7 + 7500;
			break;
		}
		case 5:
		{
			var_b3410de7 = var_b3410de7 + 10000;
			break;
			break;
		}
		default
		{
		}
	}
	switch(var_a7f0a318)
	{
		case 1:
		{
			var_b3410de7 = var_b3410de7 + 3500;
			break;
		}
		case 2:
		{
			var_b3410de7 = var_b3410de7 + 6000;
			break;
		}
		case 3:
		{
			var_b3410de7 = var_b3410de7 + 9000;
			break;
			break;
		}
		default
		{
		}
	}
	return var_b3410de7;
	var_b3410de7++;
}

/*
	Name: function_6e424686
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xE2F0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 5150
*/
function function_6e424686(weapon)
{
	if(isdefined(self) && isdefined(weapon) && isdefined(self.var_6ea2cb37) && isdefined(self.var_6ea2cb37[weapon]))
	{
		return self.var_6ea2cb37[weapon];
	}
	return 0;
}

/*
	Name: function_21f2c5eb
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xE348
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 5169
*/
function function_21f2c5eb(weapon)
{
	weapon = function_ce848d11(weapon);
	if(isdefined(self.var_d5761cb2) && isdefined(self.var_d5761cb2[weapon.name]))
	{
		return self.var_d5761cb2[weapon.name];
	}
	return 0;
}

/*
	Name: function_ce848d11
	Namespace: zm_weapons
	Checksum: 0x424F4353
	Offset: 0xE3C0
	Size: 0x5C
	Parameters: 1
	Flags: None
	Line Number: 5189
*/
function function_ce848d11(weapon)
{
	weapon = get_base_weapon(weapon);
	if(weapon.isBallisticKnife)
	{
		weapon = GetWeapon("knife_ballistic");
	}
	return weapon;
}

