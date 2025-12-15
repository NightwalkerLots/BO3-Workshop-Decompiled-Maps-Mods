#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace _zm_pack_a_punch;

/*
	Name: __init__sytem__
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x770
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 38
*/
function __init__sytem__()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: __init__
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x7B8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __init__()
{
	zm_pap_util::init_parameters();
	clientfield::register("zbarrier", "pap_working_FX", 5000, 1, "int");
	return;
}

/*
	Name: __main__
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x808
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 75
*/
function __main__()
{
	if(!isdefined(level.pap_zbarrier_state_func))
	{
		level.pap_zbarrier_state_func = &process_pap_zbarrier_state;
	}
	spawn_init();
	vending_weapon_upgrade_trigger = zm_pap_util::get_triggers();
	if(vending_weapon_upgrade_trigger.size >= 1)
	{
		Array::thread_all(vending_weapon_upgrade_trigger, &vending_weapon_upgrade);
	}
	old_packs = GetEntArray("zombie_vending_upgrade", "targetname");
	for(i = 0; i < old_packs.size; i++)
	{
		vending_weapon_upgrade_trigger[vending_weapon_upgrade_trigger.size] = old_packs[i];
	}
	level flag::init("pack_machine_in_use");
}

/*
	Name: spawn_init
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x920
	Size: 0x488
	Parameters: 0
	Flags: Private
	Line Number: 105
*/
function private spawn_init()
{
	zbarriers = GetEntArray("zm_pack_a_punch", "targetname");
	for(i = 0; i < zbarriers.size; i++)
	{
		if(!zbarriers[i] IsZBarrier())
		{
			continue;
		}
		if(!isdefined(level.pack_a_punch.interaction_height))
		{
			level.pack_a_punch.interaction_height = 35;
		}
		if(!isdefined(level.pack_a_punch.interaction_trigger_radius))
		{
			level.pack_a_punch.interaction_trigger_radius = 40;
		}
		if(!isdefined(level.pack_a_punch.interaction_trigger_height))
		{
			level.pack_a_punch.interaction_trigger_height = 70;
		}
		use_trigger = spawn("trigger_radius_use", zbarriers[i].origin + (0, 0, level.pack_a_punch.interaction_height), 0, level.pack_a_punch.interaction_trigger_radius, level.pack_a_punch.interaction_trigger_height);
		use_trigger.script_noteworthy = "pack_a_punch";
		use_trigger TriggerIgnoreTeam();
		use_trigger thread pap_trigger_hintstring_monitor();
		use_trigger flag::init("pap_offering_gun");
		collision = spawn("script_model", zbarriers[i].origin, 1);
		collision.angles = zbarriers[i].angles;
		collision SetModel("zm_collision_perks1");
		collision.script_noteworthy = "clip";
		collision disconnectpaths();
		use_trigger.clip = collision;
		use_trigger.zbarrier = zbarriers[i];
		use_trigger.script_sound = "mus_perks_packa_jingle";
		use_trigger.script_label = "mus_perks_packa_sting";
		use_trigger.longJingleWait = 1;
		use_trigger.target = "vending_packapunch";
		use_trigger.zbarrier.targetname = "vending_packapunch";
		powered_on = get_start_state();
		use_trigger.powered = zm_power::add_powered_item(&turn_on, &turn_off, &get_range, &cost_func, 0, powered_on, use_trigger);
		if(isdefined(level.pack_a_punch.custom_power_think))
		{
			use_trigger thread [[level.pack_a_punch.custom_power_think]](powered_on);
		}
		else
		{
			use_trigger thread toggle_think(powered_on);
		}
		if(!isdefined(level.pack_a_punch.triggers))
		{
			level.pack_a_punch.triggers = [];
		}
		else if(!IsArray(level.pack_a_punch.triggers))
		{
			level.pack_a_punch.triggers = Array(level.pack_a_punch.triggers);
		}
		level.pack_a_punch.triggers[level.pack_a_punch.triggers.size] = use_trigger;
	}
}

/*
	Name: pap_trigger_hintstring_monitor
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0xDB0
	Size: 0x180
	Parameters: 0
	Flags: Private
	Line Number: 175
*/
function private pap_trigger_hintstring_monitor()
{
	level endon("Pack_A_Punch_off");
	level waittill("Pack_A_Punch_on");
	self thread pap_trigger_hintstring_monitor_reset();
	while(1)
	{
		foreach(e_player in level.players)
		{
			if(e_player istouching(self))
			{
				current_weapon = e_player GetCurrentWeapon();
				if(zm_weapons::is_weapon_upgraded(current_weapon) && !function_a999bee6(current_weapon, e_player))
				{
					self setHintString("No AATs Available!");
					continue;
				}
				self setHintString("");
				self zm_pap_util::update_hint_string(e_player);
			}
		}
		wait(0.05);
	}
}

/*
	Name: pap_trigger_hintstring_monitor_reset
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0xF38
	Size: 0x28
	Parameters: 0
	Flags: Private
	Line Number: 210
*/
function private pap_trigger_hintstring_monitor_reset()
{
	level waittill("Pack_A_Punch_off");
	self thread pap_trigger_hintstring_monitor();
}

/*
	Name: third_person_weapon_upgrade
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0xF68
	Size: 0x4E0
	Parameters: 5
	Flags: Private
	Line Number: 226
*/
function private third_person_weapon_upgrade(current_weapon, upgrade_weapon, packa_rollers, pap_machine, trigger)
{
	level endon("Pack_A_Punch_off");
	trigger endon("pap_player_disconnected");
	current_weapon = self getbuildkitweapon(current_weapon, 0);
	upgrade_weapon = self getbuildkitweapon(upgrade_weapon, 1);
	trigger.current_weapon = current_weapon;
	trigger.current_weapon_options = self getbuildkitweaponoptions(trigger.current_weapon);
	trigger.current_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(trigger.current_weapon, 0);
	trigger.upgrade_weapon = upgrade_weapon;
	upgrade_weapon.pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index(upgrade_weapon.pap_camo_to_use);
	trigger.upgrade_weapon_options = self getbuildkitweaponoptions(trigger.upgrade_weapon, upgrade_weapon.pap_camo_to_use);
	trigger.upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(trigger.upgrade_weapon, 1);
	trigger.zbarrier setWeapon(trigger.current_weapon);
	trigger.zbarrier SetWeaponOptions(trigger.current_weapon_options);
	trigger.zbarrier SetAttachmentCosmeticVariantIndexes(trigger.current_weapon_acvi);
	trigger.zbarrier set_pap_zbarrier_state("take_gun");
	rel_entity = trigger.pap_machine;
	origin_offset = (0, 0, 0);
	angles_offset = (0, 0, 0);
	origin_base = self.origin;
	angles_base = self.angles;
	if(isdefined(rel_entity))
	{
		origin_offset = (0, 0, level.pack_a_punch.interaction_height);
		angles_offset = VectorScale((0, 1, 0), 90);
		origin_base = rel_entity.origin;
		angles_base = rel_entity.angles;
	}
	else
	{
		rel_entity = self;
	}
	FORWARD = AnglesToForward(angles_base + angles_offset);
	interact_offset = origin_offset + FORWARD * -25;
	offsetdw = VectorScale((1, 1, 1), 3);
	pap_machine [[level.pack_a_punch.move_in_func]](self, trigger, origin_offset, angles_offset);
	self playsound("zmb_perks_packa_upgrade");
	wait(0.35);
	if(!self namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
	{
		wait(3);
	}
	trigger.zbarrier setWeapon(upgrade_weapon);
	trigger.zbarrier SetWeaponOptions(trigger.upgrade_weapon_options);
	trigger.zbarrier SetAttachmentCosmeticVariantIndexes(trigger.upgrade_weapon_acvi);
	trigger.zbarrier set_pap_zbarrier_state("eject_gun");
	if(isdefined(self))
	{
		self playsound("zmb_perks_packa_ready");
		return;
	}
	else
	{
	}
	rel_entity thread [[level.pack_a_punch.move_out_func]](self, trigger, origin_offset, interact_offset);
}

/*
	Name: can_pack_weapon
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x1450
	Size: 0xE8
	Parameters: 1
	Flags: Private
	Line Number: 294
*/
function private can_pack_weapon(weapon)
{
	if(weapon.isRiotShield)
	{
		return 0;
	}
	if(level flag::get("pack_machine_in_use"))
	{
		return 1;
	}
	if(!(isdefined(level.b_allow_idgun_pap) && level.b_allow_idgun_pap) && isdefined(level.idgun_weapons))
	{
		if(IsInArray(level.idgun_weapons, weapon))
		{
			return 0;
		}
	}
	weapon = self zm_weapons::get_nonalternate_weapon(weapon);
	if(!zm_weapons::is_weapon_or_base_included(weapon))
	{
		return 0;
	}
	if(!self zm_weapons::can_upgrade_weapon(weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: player_use_can_pack_now
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x1540
	Size: 0x100
	Parameters: 0
	Flags: Private
	Line Number: 333
*/
function private player_use_can_pack_now()
{
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission) || self IsThrowingGrenade())
	{
		return 0;
	}
	if(!self zm_magicbox::can_buy_weapon() || self bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		return 0;
	}
	if(self zm_equipment::hacker_active())
	{
		return 0;
	}
	current_weapon = self GetCurrentWeapon();
	if(!self can_pack_weapon(current_weapon) && !zm_weapons::weapon_supports_aat(current_weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: pack_a_punch_machine_trigger_think
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x1648
	Size: 0x148
	Parameters: 0
	Flags: Private
	Line Number: 365
*/
function private pack_a_punch_machine_trigger_think()
{
	self endon("death");
	self endon("Pack_A_Punch_off");
	self notify("pack_a_punch_trigger_think");
	self endon("pack_a_punch_trigger_think");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(self.pack_player) && self.pack_player != players[i] || !players[i] player_use_can_pack_now() || players[i] bgb::is_active("zm_bgb_ephemeral_enhancement"))
			{
				self setinvisibletoplayer(players[i], 1);
				continue;
			}
			self setinvisibletoplayer(players[i], 0);
		}
		wait(0.1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: vending_weapon_upgrade
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x1798
	Size: 0xC40
	Parameters: 0
	Flags: Private
	Line Number: 399
*/
function private vending_weapon_upgrade()
{
	level endon("Pack_A_Punch_off");
	pap_machine = GetEnt(self.target, "targetname");
	self.pap_machine = pap_machine;
	pap_machine_sound = GetEntArray("perksacola", "targetname");
	packa_rollers = spawn("script_origin", self.origin);
	packa_timer = spawn("script_origin", self.origin);
	packa_rollers LinkTo(self);
	packa_timer LinkTo(self);
	self UseTriggerRequireLookAt();
	self setHintString(&"ZOMBIE_NEED_POWER");
	self setcursorhint("HINT_NOICON");
	power_off = !self is_on();
	if(power_off)
	{
		pap_array = [];
		pap_array[0] = pap_machine;
		level waittill("Pack_A_Punch_on");
	}
	self TriggerEnable(1);
	if(isdefined(level.pack_a_punch.power_on_callback))
	{
		pap_machine thread [[level.pack_a_punch.power_on_callback]]();
	}
	self thread pack_a_punch_machine_trigger_think();
	pap_machine PlayLoopSound("zmb_perks_packa_loop");
	self thread shutOffPAPSounds(pap_machine, packa_rollers, packa_timer);
	self thread vending_weapon_upgrade_cost();
	for(;;)
	{
		self.pack_player = undefined;
		self waittill("trigger", player);
		if(isdefined(pap_machine.state) && pap_machine.state == "leaving")
		{
		}
		else
		{
			index = zm_utility::get_player_index(player);
			current_weapon = player GetCurrentWeapon();
			current_weapon = player zm_weapons::switch_from_alt_weapon(current_weapon);
			if(isdefined(level.pack_a_punch.custom_validation))
			{
				valid = self [[level.pack_a_punch.custom_validation]](player);
				if(!valid)
				{
				}
			}
			else
			{
				wait(0.1);
				else if(player IsSwitchingWeapons())
				{
					wait(0.1);
					if(player IsSwitchingWeapons())
					{
					}
				}
				else
				{
					else if(zm_weapons::is_weapon_upgraded(current_weapon) && !function_a999bee6(current_weapon, player))
					{
					}
					else
					{
						current_cost = self.cost;
						player.restore_ammo = undefined;
						player.restore_clip = undefined;
						player.restore_stock = undefined;
						player_restore_clip_size = undefined;
						player.restore_max = undefined;
						b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
						isRepack = 0;
						currentAATHashID = -1;
						if(b_weapon_supports_aat)
						{
							current_cost = self.aat_cost;
							currentAAT = player AAT::getAATOnWeapon(current_weapon);
							if(isdefined(currentAAT))
							{
								currentAATHashID = currentAAT.hash_id;
							}
							player.restore_ammo = 1;
							player.restore_clip = player GetWeaponAmmoClip(current_weapon);
							player.restore_clip_size = current_weapon.clipSize;
							player.restore_stock = player GetWeaponAmmoStock(current_weapon);
							player.restore_max = current_weapon.maxAmmo;
							isRepack = 1;
						}
						if(player zm_pers_upgrades_functions::is_pers_double_points_active())
						{
							current_cost = player zm_pers_upgrades_functions::pers_upgrade_double_points_cost(current_cost);
						}
						if(isdefined(player.var_b02c0b39) && player.var_b02c0b39 == "Packer Puncher")
						{
							current_cost = Int(current_cost * 0.8);
						}
						if(!player zm_score::can_player_purchase(current_cost))
						{
							self playsound("zmb_perks_packa_deny");
							if(isdefined(level.pack_a_punch.custom_deny_func))
							{
								player [[level.pack_a_punch.custom_deny_func]]();
							}
							else
							{
								player zm_audio::create_and_play_dialog("general", "outofmoney", 0);
							}
						}
						else
						{
							self.pack_player = player;
							level flag::set("pack_machine_in_use");
							demo::bookmark("zm_player_use_packapunch", GetTime(), player);
							player zm_stats::increment_client_stat("use_pap");
							player zm_stats::increment_player_stat("use_pap");
							weaponIdx = undefined;
							if(isdefined(current_weapon))
							{
								weaponIdx = MatchRecordGetWeaponIndex(current_weapon);
							}
							if(isdefined(weaponIdx))
							{
								if(!isRepack)
								{
									player RecordMapEvent(19, GetTime(), player.origin, level.round_number, weaponIdx, current_cost);
									player zm_stats::increment_challenge_stat("ZM_DAILY_PACK_5_WEAPONS");
									player zm_stats::increment_challenge_stat("ZM_DAILY_PACK_10_WEAPONS");
								}
								else
								{
									player RecordMapEvent(25, GetTime(), player.origin, level.round_number, weaponIdx, currentAATHashID);
									player zm_stats::increment_challenge_stat("ZM_DAILY_REPACK_WEAPONS");
								}
							}
							self thread destroy_weapon_in_blackout(player);
							player zm_score::minus_to_player_score(current_cost);
							self thread zm_audio::sndPerksJingles_Player(1);
							player zm_audio::create_and_play_dialog("general", "pap_wait");
							self TriggerEnable(0);
							if(!self namespace_851dc78f::function_5f9a13b3("specialty_timeslip"))
							{
								player thread do_knuckle_crack();
							}
							self.current_weapon = current_weapon;
							upgrade_weapon = zm_weapons::get_upgrade_weapon(current_weapon, b_weapon_supports_aat);
							player third_person_weapon_upgrade(current_weapon, upgrade_weapon, packa_rollers, pap_machine, self);
							self TriggerEnable(1);
							self setcursorhint("HINT_WEAPON", upgrade_weapon);
							self flag::set("pap_offering_gun");
							if(isdefined(player))
							{
								self SetInvisibleToAll();
								self setvisibletoplayer(player);
								self thread wait_for_player_to_take(player, current_weapon, packa_timer, b_weapon_supports_aat, isRepack);
								self thread wait_for_timeout(current_weapon, packa_timer, player, isRepack);
								self util::waittill_any("pap_timeout", "pap_taken", "pap_player_disconnected");
							}
							else
							{
								self wait_for_timeout(current_weapon, packa_timer, player, isRepack);
							}
							self.zbarrier set_pap_zbarrier_state("powered");
							self setcursorhint("HINT_NOICON");
							self.current_weapon = level.weaponNone;
							self flag::clear("pap_offering_gun");
							self thread pack_a_punch_machine_trigger_think();
							self.pack_player = undefined;
							level flag::clear("pack_machine_in_use");
						}
					}
				}
				else if(!zm_weapons::is_weapon_or_base_included(current_weapon))
				{
				}
			}
			else if(!player zm_magicbox::can_buy_weapon() || player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission) || player IsThrowingGrenade() || (!player zm_weapons::can_upgrade_weapon(current_weapon) && !zm_weapons::weapon_supports_aat(current_weapon)))
			{
			}
		}
	}
}

/*
	Name: function_a999bee6
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x23E0
	Size: 0x150
	Parameters: 2
	Flags: Private
	Line Number: 592
*/
function private function_a999bee6(gun, player)
{
	if(isdefined(level.var_bc2842b9))
	{
		currentAAT = player AAT::getAATOnWeapon(gun);
		keys = getArrayKeys(level.AAT);
		ArrayRemoveValue(keys, "none");
		if(isdefined(player.AAT[gun]))
		{
			ArrayRemoveValue(keys, player.AAT[gun]);
		}
		for(i = 0; i < level.var_bc2842b9.size; i++)
		{
			ArrayRemoveValue(keys, level.var_bc2842b9[i]);
		}
		if(!isdefined(keys) || keys.size < 1)
		{
			return 0;
		}
	}
	return 1;
	ERROR: Bad function call
}

/*
	Name: shutOffPAPSounds
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x2538
	Size: 0xB0
	Parameters: 3
	Flags: Private
	Line Number: 626
*/
function private shutOffPAPSounds(ent1, ent2, ent3)
{
	while(1)
	{
		level waittill("Pack_A_Punch_off");
		level thread turnOnPAPSounds(ent1);
		ent1 StopLoopSound(0.1);
		ent2 StopLoopSound(0.1);
		ent3 StopLoopSound(0.1);
	}
}

/*
	Name: turnOnPAPSounds
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x25F0
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 648
*/
function private turnOnPAPSounds(ent)
{
	level waittill("Pack_A_Punch_on");
	ent PlayLoopSound("zmb_perks_packa_loop");
}

/*
	Name: vending_weapon_upgrade_cost
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x2630
	Size: 0x68
	Parameters: 0
	Flags: Private
	Line Number: 664
*/
function private vending_weapon_upgrade_cost()
{
	level endon("Pack_A_Punch_off");
	while(1)
	{
		self.cost = 5000;
		self.aat_cost = 2500;
		level waittill("powerup_bonfire_sale");
		self.cost = 1000;
		self.aat_cost = 500;
		level waittill("bonfire_sale_off");
	}
}

/*
	Name: wait_for_player_to_take
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x26A0
	Size: 0x650
	Parameters: 5
	Flags: Private
	Line Number: 688
*/
function private wait_for_player_to_take(player, weapon, packa_timer, b_weapon_supports_aat, isRepack)
{
	current_weapon = self.current_weapon;
	upgrade_weapon = self.upgrade_weapon;
	/#
		fallback_initiated::Assert(isdefined(current_weapon), "Dev Block strings are not supported");
	#/
	/#
		fallback_initiated::Assert(isdefined(upgrade_weapon), "Dev Block strings are not supported");
	#/
	self endon("pap_timeout");
	level endon("Pack_A_Punch_off");
	while(isdefined(player))
	{
		packa_timer PlayLoopSound("zmb_perks_packa_ticktock");
		self waittill("trigger", trigger_player);
		if(level.pack_a_punch.grabbable_by_anyone)
		{
			player = trigger_player;
		}
		packa_timer StopLoopSound(0.05);
		if(trigger_player == player)
		{
			player zm_stats::increment_client_stat("pap_weapon_grabbed");
			player zm_stats::increment_player_stat("pap_weapon_grabbed");
			current_weapon = player GetCurrentWeapon();
			/#
				if(level.weaponNone == current_weapon)
				{
					IPrintLnBold("Dev Block strings are not supported");
				}
			#/
			if(zm_utility::is_player_valid(player) && !player.IS_DRINKING > 0 && !zm_utility::is_placeable_mine(current_weapon) && !zm_equipment::is_equipment(current_weapon) && !player zm_utility::is_player_revive_tool(current_weapon) && level.weaponNone != current_weapon && !player zm_equipment::hacker_active())
			{
				demo::bookmark("zm_player_grabbed_packapunch", GetTime(), player);
				self notify("pap_taken");
				player notify("pap_taken");
				player.pap_used = 1;
				weapon_limit = zm_utility::get_player_weapon_limit(player);
				player zm_weapons::take_fallback_weapon();
				Primaries = player getweaponslistprimaries();
				if(isdefined(Primaries) && Primaries.size >= weapon_limit)
				{
					upgrade_weapon = player zm_weapons::weapon_give(upgrade_weapon);
				}
				else
				{
					upgrade_weapon = player zm_weapons::give_build_kit_weapon(upgrade_weapon);
					player GiveStartAmmo(upgrade_weapon);
				}
				player notify("weapon_give", upgrade_weapon);
				aatID = -1;
				if(isdefined(b_weapon_supports_aat) && b_weapon_supports_aat)
				{
					player thread AAT::acquire(upgrade_weapon);
					aatObj = player AAT::getAATOnWeapon(upgrade_weapon);
					if(isdefined(aatObj))
					{
						aatID = aatObj.hash_id;
					}
				}
				else
				{
					player thread AAT::remove(upgrade_weapon);
				}
				weaponIdx = undefined;
				if(isdefined(weapon))
				{
					weaponIdx = MatchRecordGetWeaponIndex(weapon);
				}
				if(isdefined(weaponIdx))
				{
					if(!isRepack)
					{
						player RecordMapEvent(27, GetTime(), player.origin, level.round_number, weaponIdx, aatID);
					}
					else
					{
						player RecordMapEvent(28, GetTime(), player.origin, level.round_number, weaponIdx, aatID);
					}
				}
				player SwitchToWeapon(upgrade_weapon);
				if(isdefined(player.restore_ammo) && player.restore_ammo)
				{
					new_clip = player.restore_clip + upgrade_weapon.clipSize - player.restore_clip_size;
					new_stock = player.restore_stock + upgrade_weapon.maxAmmo - player.restore_max;
					player SetWeaponAmmoStock(upgrade_weapon, new_stock);
					player SetWeaponAmmoClip(upgrade_weapon, new_clip);
				}
				player.restore_ammo = undefined;
				player.restore_clip = undefined;
				player.restore_stock = undefined;
				player.restore_max = undefined;
				player.restore_clip_size = undefined;
				player zm_weapons::play_weapon_vo(upgrade_weapon);
				return;
			}
		}
		wait(0.05);
	}
}

/*
	Name: wait_for_timeout
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x2CF8
	Size: 0x208
	Parameters: 4
	Flags: Private
	Line Number: 800
*/
function private wait_for_timeout(weapon, packa_timer, player, isRepack)
{
	self endon("pap_taken");
	self endon("pap_player_disconnected");
	self thread wait_for_disconnect(player);
	wait(level.pack_a_punch.timeout);
	self notify("pap_timeout");
	packa_timer StopLoopSound(0.05);
	packa_timer playsound("zmb_perks_packa_deny");
	if(isdefined(player))
	{
		player zm_stats::increment_client_stat("pap_weapon_not_grabbed");
		player zm_stats::increment_player_stat("pap_weapon_not_grabbed");
		weaponIdx = undefined;
		if(isdefined(weapon))
		{
			weaponIdx = MatchRecordGetWeaponIndex(weapon);
		}
		if(isdefined(weaponIdx))
		{
			if(!isRepack)
			{
				player RecordMapEvent(20, GetTime(), player.origin, level.round_number, weaponIdx);
			}
			else
			{
				aatOnWeapon = player AAT::getAATOnWeapon(weapon);
				aatHash = -1;
				if(isdefined(aatOnWeapon))
				{
					aatHash = aatOnWeapon.hash_id;
				}
				player RecordMapEvent(26, GetTime(), player.origin, level.round_number, weaponIdx, aatHash);
			}
		}
	}
}

/*
	Name: wait_for_disconnect
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x2F08
	Size: 0x68
	Parameters: 1
	Flags: Private
	Line Number: 848
*/
function private wait_for_disconnect(player)
{
	self endon("pap_taken");
	self endon("pap_timeout");
	while(isdefined(player))
	{
		wait(0.1);
	}
	/#
		println("Dev Block strings are not supported");
	#/
	self notify("pap_player_disconnected");
}

/*
	Name: destroy_weapon_in_blackout
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x2F78
	Size: 0xA8
	Parameters: 1
	Flags: Private
	Line Number: 872
*/
function private destroy_weapon_in_blackout(player)
{
	self endon("pap_timeout");
	self endon("pap_taken");
	self endon("pap_player_disconnected");
	level waittill("Pack_A_Punch_off");
	self.zbarrier set_pap_zbarrier_state("take_gun");
	player playlocalsound(level.zmb_laugh_alias);
	wait(1.5);
	self.zbarrier set_pap_zbarrier_state("power_off");
}

/*
	Name: do_knuckle_crack
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3028
	Size: 0x78
	Parameters: 0
	Flags: Private
	Line Number: 894
*/
function private do_knuckle_crack()
{
	self endon("disconnect");
	self upgrade_knuckle_crack_begin();
	self util::waittill_any("fake_death", "death", "player_downed", "weapon_change_complete");
	self upgrade_knuckle_crack_end();
	return;
}

/*
	Name: upgrade_knuckle_crack_begin
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x30A8
	Size: 0x140
	Parameters: 0
	Flags: Private
	Line Number: 913
*/
function private upgrade_knuckle_crack_begin()
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	Primaries = self getweaponslistprimaries();
	original_weapon = self GetCurrentWeapon();
	weapon = GetWeapon("zombie_knuckle_crack");
	if(original_weapon != level.weaponNone && !zm_utility::is_placeable_mine(original_weapon) && !zm_equipment::is_equipment(original_weapon))
	{
		self notify("zmb_lost_knife");
		self TakeWeapon(original_weapon);
		return;
	}
	else
	{
	}
	self GiveWeapon(weapon);
	self SwitchToWeapon(weapon);
}

/*
	Name: upgrade_knuckle_crack_end
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x31F0
	Size: 0x108
	Parameters: 0
	Flags: Private
	Line Number: 943
*/
function private upgrade_knuckle_crack_end()
{
	self zm_utility::enable_player_move_states();
	weapon = GetWeapon("zombie_knuckle_crack");
	if(self laststand::player_is_in_laststand() || (isdefined(self.intermission) && self.intermission))
	{
		self TakeWeapon(weapon);
		return;
	}
	self zm_utility::decrement_is_drinking();
	self TakeWeapon(weapon);
	Primaries = self getweaponslistprimaries();
	if(self.IS_DRINKING > 0)
	{
		return;
	}
	else
	{
		self zm_weapons::switch_back_primary_weapon();
	}
}

/*
	Name: get_range
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3300
	Size: 0xF8
	Parameters: 3
	Flags: Private
	Line Number: 975
*/
function private get_range(delta, origin, radius)
{
	if(isdefined(self.target))
	{
		paporigin = self.target.origin;
		if(isdefined(self.target.trigger_off) && self.target.trigger_off)
		{
			paporigin = self.target.realorigin;
		}
		else if(isdefined(self.target.disabled) && self.target.disabled)
		{
			paporigin = paporigin + VectorScale((0, 0, 1), 10000);
		}
		if(DistanceSquared(paporigin, origin) < radius * radius)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: turn_on
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3400
	Size: 0x48
	Parameters: 2
	Flags: Private
	Line Number: 1006
*/
function private turn_on(origin, radius)
{
	/#
		println("Dev Block strings are not supported");
	#/
	level notify("Pack_A_Punch_on");
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
	ERROR: Exception occured: Stack empty.
}

/*
	Name: turn_off
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3450
	Size: 0x70
	Parameters: 2
	Flags: Private
	Line Number: 1028
*/
function private turn_off(origin, radius)
{
	/#
		println("Dev Block strings are not supported");
	#/
	level notify("Pack_A_Punch_off");
	self.target notify("death");
	self.target thread vending_weapon_upgrade();
}

/*
	Name: is_on
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x34C8
	Size: 0x28
	Parameters: 0
	Flags: Private
	Line Number: 1048
*/
function private is_on()
{
	if(isdefined(self.powered))
	{
		return self.powered.power;
	}
	return 0;
}

/*
	Name: get_start_state
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x34F8
	Size: 0x28
	Parameters: 0
	Flags: Private
	Line Number: 1067
*/
function private get_start_state()
{
	if(isdefined(level.vending_machines_powered_on_at_start) && level.vending_machines_powered_on_at_start)
	{
		return 1;
	}
	return 0;
}

/*
	Name: cost_func
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3528
	Size: 0x70
	Parameters: 0
	Flags: Private
	Line Number: 1086
*/
function private cost_func()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	if(isdefined(level._power_global) && level._power_global)
	{
		return 0;
	}
	if(isdefined(self.self_powered) && self.self_powered)
	{
		return 0;
	}
	return 1;
}

/*
	Name: toggle_think
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x35A0
	Size: 0xA8
	Parameters: 1
	Flags: Private
	Line Number: 1115
*/
function private toggle_think(powered_on)
{
	if(!powered_on)
	{
		self.zbarrier set_pap_zbarrier_state("initial");
		level waittill("Pack_A_Punch_on");
	}
	for(;;)
	{
		self.zbarrier set_pap_zbarrier_state("power_on");
		level waittill("Pack_A_Punch_off");
		self.zbarrier set_pap_zbarrier_state("power_off");
		level waittill("Pack_A_Punch_on");
	}
}

/*
	Name: pap_initial
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3650
	Size: 0x40
	Parameters: 0
	Flags: Private
	Line Number: 1141
*/
function private pap_initial()
{
	self ZBarrierPieceUseAttachWeapon(3);
	self SetZBarrierPieceState(0, "closed");
}

/*
	Name: pap_power_off
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3698
	Size: 0x28
	Parameters: 0
	Flags: Private
	Line Number: 1157
*/
function private pap_power_off()
{
	self SetZBarrierPieceState(0, "closing");
}

/*
	Name: pap_power_on
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x36C8
	Size: 0xA0
	Parameters: 0
	Flags: Private
	Line Number: 1172
*/
function private pap_power_on()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(0, "opening");
	while(self GetZBarrierPieceState(0) == "opening")
	{
		wait(0.05);
	}
	self playsound("zmb_perks_power_on");
	self thread set_pap_zbarrier_state("powered");
	return;
}

/*
	Name: pap_powered
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3770
	Size: 0xF0
	Parameters: 0
	Flags: Private
	Line Number: 1195
*/
function private pap_powered()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(4, "closed");
	if(self.classname === "zbarrier_zm_castle_packapunch" || self.classname === "zbarrier_zm_tomb_packapunch")
	{
		self clientfield::set("pap_working_FX", 0);
	}
	while(1)
	{
		wait(RandomFloatRange(180, 1800));
		self SetZBarrierPieceState(4, "opening");
		wait(RandomFloatRange(180, 1800));
		self SetZBarrierPieceState(4, "closing");
	}
}

/*
	Name: pap_take_gun
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3868
	Size: 0xB8
	Parameters: 0
	Flags: Private
	Line Number: 1222
*/
function private pap_take_gun()
{
	self SetZBarrierPieceState(1, "opening");
	self SetZBarrierPieceState(2, "opening");
	self SetZBarrierPieceState(3, "opening");
	wait(0.1);
	if(self.classname === "zbarrier_zm_castle_packapunch" || self.classname === "zbarrier_zm_tomb_packapunch")
	{
		self clientfield::set("pap_working_FX", 1);
		return;
	}
}

/*
	Name: pap_eject_gun
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3928
	Size: 0x68
	Parameters: 0
	Flags: Private
	Line Number: 1245
*/
function private pap_eject_gun()
{
	self SetZBarrierPieceState(1, "closing");
	self SetZBarrierPieceState(2, "closing");
	self SetZBarrierPieceState(3, "closing");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: pap_leaving
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3998
	Size: 0x88
	Parameters: 0
	Flags: Private
	Line Number: 1264
*/
function private pap_leaving()
{
	self SetZBarrierPieceState(5, "closing");
	do
	{
		wait(0.05);
	}
	while(!self GetZBarrierPieceState(5) == "closing");
	self SetZBarrierPieceState(5, "closed");
	self notify("leave_anim_done");
}

/*
	Name: pap_arriving
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3A28
	Size: 0xA0
	Parameters: 0
	Flags: Private
	Line Number: 1286
*/
function private pap_arriving()
{
	self endon("zbarrier_state_change");
	self SetZBarrierPieceState(0, "opening");
	while(self GetZBarrierPieceState(0) == "opening")
	{
		wait(0.05);
	}
	self playsound("zmb_perks_power_on");
	self thread set_pap_zbarrier_state("powered");
}

/*
	Name: get_pap_zbarrier_state
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3AD0
	Size: 0x10
	Parameters: 0
	Flags: Private
	Line Number: 1308
*/
function private get_pap_zbarrier_state()
{
	return self.state;
}

/*
	Name: set_pap_zbarrier_state
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3AE8
	Size: 0x80
	Parameters: 1
	Flags: Private
	Line Number: 1323
*/
function private set_pap_zbarrier_state(state)
{
	for(i = 0; i < self getnumzbarrierpieces(); i++)
	{
		self hidezbarrierpiece(i);
	}
	self notify("zbarrier_state_change");
	self [[level.pap_zbarrier_state_func]](state);
}

/*
	Name: process_pap_zbarrier_state
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3B70
	Size: 0x328
	Parameters: 1
	Flags: Private
	Line Number: 1343
*/
function private process_pap_zbarrier_state(state)
{
	switch(state)
	{
		case "initial":
		{
			self ShowZBarrierPiece(0);
			self thread pap_initial();
			self.state = "initial";
			break;
		}
		case "power_off":
		{
			self ShowZBarrierPiece(0);
			self thread pap_power_off();
			self.state = "power_off";
			break;
		}
		case "power_on":
		{
			self ShowZBarrierPiece(0);
			self thread pap_power_on();
			self.state = "power_on";
			break;
		}
		case "powered":
		{
			self ShowZBarrierPiece(4);
			self thread pap_powered();
			self.state = "powered";
			break;
		}
		case "take_gun":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self thread pap_take_gun();
			self.state = "take_gun";
			break;
		}
		case "eject_gun":
		{
			self ShowZBarrierPiece(1);
			self ShowZBarrierPiece(2);
			self ShowZBarrierPiece(3);
			self thread pap_eject_gun();
			self.state = "eject_gun";
			break;
		}
		case "leaving":
		{
			self ShowZBarrierPiece(5);
			self thread pap_leaving();
			self.state = "leaving";
			break;
		}
		case "arriving":
		{
			self ShowZBarrierPiece(0);
			self thread pap_arriving();
			self.state = "arriving";
			break;
		}
		case "hidden":
		{
			self.state = "hidden";
			break;
		}
		default
		{
			if(isdefined(level.custom_pap_state_handler))
			{
				self [[level.custom_pap_state_handler]](state);
				break;
			}
		}
	}
}

/*
	Name: set_state_initial
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3EA0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1433
*/
function set_state_initial()
{
	self set_pap_zbarrier_state("initial");
}

/*
	Name: set_state_leaving
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3ED0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1448
*/
function set_state_leaving()
{
	self set_pap_zbarrier_state("leaving");
}

/*
	Name: set_state_arriving
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3F00
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1463
*/
function set_state_arriving()
{
	self set_pap_zbarrier_state("arriving");
}

/*
	Name: set_state_power_on
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3F30
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1478
*/
function set_state_power_on()
{
	self set_pap_zbarrier_state("power_on");
}

/*
	Name: set_state_hidden
	Namespace: _zm_pack_a_punch
	Checksum: 0x424F4353
	Offset: 0x3F60
	Size: 0x24
	Parameters: 0
	Flags: None
	Line Number: 1493
*/
function set_state_hidden()
{
	self set_pap_zbarrier_state("hidden");
}

