#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_devgui;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_riotshield;
#include scripts\zm\_zm_weap_thundergun;
#include scripts\zm\_zm_weapons;

#namespace namespace_4cfd21fd;

/*
	Name: __init__sytem__
	Namespace: namespace_4cfd21fd
	Checksum: 0x8DC31769
	Offset: 0x670
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_dragonshield", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4cfd21fd
	Checksum: 0x46104E14
	Offset: 0x6B8
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function __init__()
{
	script = ToLower(GetDvarString("mapname"));
	if(script == "zm_stalingrad" || script == "zm_genesis")
	{
		return;
	}
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	zm_equipment::register("dragon_shield", &"ZOMBIE_DRAGON_SHIELD_PICKUP", &"ZOMBIE_DRAGON_SHIELD_HINT", undefined, "riotshield");
	zm_equipment::register("dragon_shield_upgraded", &"DRAGON_SHIELD_UPGRADE_PICKUP", &"ZOMBIE_DRAGON_SHIELD_HINT", undefined, "riotshield");
	triggers = struct::get_array("harrybo21_dragon_shield_upgrade_trigger", "script_noteworthy");
	if(!isdefined(triggers) || triggers.size < 1)
	{
		return;
	}
	for(i = 0; i < triggers.size; i++)
	{
		triggers[i] thread upgrade_trigger();
	}
}

/*
	Name: __main__
	Namespace: namespace_4cfd21fd
	Checksum: 0xEFCDC2F2
	Offset: 0x850
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function __main__()
{
	zm_equipment::register_for_level("dragon_shield");
	zm_equipment::Include("dragon_shield");
	zm_equipment::set_ammo_driven("dragon_shield", GetWeapon("dragon_shield").startammo, 1);
	zm_equipment::register_for_level("dragon_shield_upgraded");
	zm_equipment::Include("dragon_shield_upgraded");
	zm_equipment::set_ammo_driven("dragon_shield_upgraded", GetWeapon("dragon_shield_upgraded").startammo, 1);
}

/*
	Name: on_player_connect
	Namespace: namespace_4cfd21fd
	Checksum: 0x51AB5AEE
	Offset: 0x940
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 104
*/
function on_player_connect()
{
	self thread watchFirstUse();
}

/*
	Name: watchFirstUse
	Namespace: namespace_4cfd21fd
	Checksum: 0xA34F07CD
	Offset: 0x968
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 119
*/
function watchFirstUse()
{
	self endon("disconnect");
	while(isdefined(self))
	{
		self waittill("weapon_change", newWeapon);
		if(newWeapon.name == "dragon_shield" || newWeapon.name == "dragon_shield_upgraded")
		{
			break;
		}
	}
	self.var_430b1caa = 1;
	zm_equipment::show_hint_text(&"ZOMBIE_DRAGON_SHIELD_HINT", 5);
}

/*
	Name: on_player_spawned
	Namespace: namespace_4cfd21fd
	Checksum: 0xA0D2F2F0
	Offset: 0xA10
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 144
*/
function on_player_spawned()
{
	self thread function_ed0f50be();
	self thread function_7335abdb();
	self thread function_ded81aa8();
	self thread player_watch_max_ammo();
	self thread function_f67694b4();
}

/*
	Name: function_ed0f50be
	Namespace: namespace_4cfd21fd
	Checksum: 0x5487D2AF
	Offset: 0xA98
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 163
*/
function function_ed0f50be()
{
	self notify("player_watch_shield_juke");
	self endon("player_watch_shield_juke");
	for(;;)
	{
		self waittill("weapon_melee_power", w_weapon);
		if(w_weapon.name != "dragon_shield" && w_weapon.name != "dragon_shield_upgraded" || !self IsOnGround())
		{
			continue;
		}
		self playsoundtoplayer("wpn_t7_firestaff_fire_plr", self);
		v_player_angles = VectorToAngles(self GetWeaponForwardDir());
		v_shot_start = self GetWeaponMuzzlePoint();
		v_shot_end = v_shot_start + AnglesToForward(v_player_angles) * 1000;
		if(w_weapon.name == "dragon_shield")
		{
			e_proj = MagicBullet(GetWeapon("dragon_shield_projectile"), v_shot_start, v_shot_end, self);
		}
		else if(w_weapon.name == "dragon_shield_upgraded")
		{
			e_proj = MagicBullet(GetWeapon("dragon_shield_upgraded_projectile"), v_shot_start, v_shot_end, self);
		}
	}
}

/*
	Name: function_ded81aa8
	Namespace: namespace_4cfd21fd
	Checksum: 0x49F5BB2
	Offset: 0xC90
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 199
*/
function function_ded81aa8()
{
	self notify("hash_ded81aa8");
	self endon("hash_ded81aa8");
	for(;;)
	{
		self waittill("equipment_ammo_changed", equipment);
		if(IsString(equipment))
		{
			equipment = GetWeapon(equipment);
		}
		if(equipment == GetWeapon("dragon_shield") || equipment == GetWeapon("dragon_shield_upgraded"))
		{
			self thread check_weapon_ammo(equipment);
		}
	}
}

/*
	Name: player_watch_max_ammo
	Namespace: namespace_4cfd21fd
	Checksum: 0x81E51EB4
	Offset: 0xD60
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 227
*/
function player_watch_max_ammo()
{
	self notify("player_watch_max_ammo");
	self endon("player_watch_max_ammo");
	for(;;)
	{
		self waittill("zmb_max_ammo");
		wait(0.05);
		if(isdefined(self.hasRiotShield) && self.hasRiotShield)
		{
			self thread check_weapon_ammo(self.weaponRiotshield);
		}
	}
}

/*
	Name: check_weapon_ammo
	Namespace: namespace_4cfd21fd
	Checksum: 0xE2913ABF
	Offset: 0xDD0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 252
*/
function check_weapon_ammo(weapon)
{
	wait(0.05);
	if(isdefined(self))
	{
		ammo = self GetWeaponAmmoClip(weapon);
		self clientfield::set("rs_ammo", ammo);
	}
}

/*
	Name: function_f67694b4
	Namespace: namespace_4cfd21fd
	Checksum: 0xEE281159
	Offset: 0xE40
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 272
*/
function function_f67694b4()
{
	self notify("hash_f67694b4");
	self endon("hash_f67694b4");
	str_wpn_name = "dragon_shield";
	str_notify = str_wpn_name + "_pickup_from_table";
	for(;;)
	{
		self waittill(str_notify);
		if(isdefined(self.var_8d531211) && self.var_8d531211)
		{
			self zm_equipment::buy("dragon_shield_upgraded");
		}
	}
}

/*
	Name: function_7335abdb
	Namespace: namespace_4cfd21fd
	Checksum: 0xB88D5C46
	Offset: 0xED8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 298
*/
function function_7335abdb()
{
	self endon("death");
	for(;;)
	{
		self waittill("missile_fire", e_projectile, str_weapon);
		if(str_weapon.name != "dragon_shield_projectile" && str_weapon.name != "dragon_shield_upgraded_projectile")
		{
			continue;
		}
		e_projectile thread function_def57e2d(self, str_weapon);
	}
}

/*
	Name: function_def57e2d
	Namespace: namespace_4cfd21fd
	Checksum: 0xFC6589E8
	Offset: 0xF70
	Size: 0x230
	Parameters: 2
	Flags: None
	Line Number: 322
*/
function function_def57e2d(player, weapon)
{
	self waittill("death");
	origin = self.origin;
	if(weapon.name == "dragon_shield_upgraded_projectile")
	{
		radius = 150;
		damage = 2500;
	}
	else if(weapon.name == "dragon_shield_projectile")
	{
		radius = 100;
		damage = 1500;
	}
	ai = GetAISpeciesArray("axis", "all");
	ai = util::get_array_of_closest(origin, ai, undefined, undefined, radius);
	for(i = 0; i < ai.size; i++)
	{
		if(weapon.name == "dragon_shield_upgraded_projectile")
		{
			ai[i] thread function_16f731c8("harry/dragon_shield/fx_dragon_shield_upgraded_zombie");
			continue;
		}
		ai[i] thread function_16f731c8("harry/dragon_shield/fx_dragon_shield_zombie");
		if(ai[i].health <= damage)
		{
			ai[i] thread function_3a867375(origin, self);
			continue;
		}
		self DoDamage(damage, self.origin, player, player, 0, "MOD_RIFLE_BULLET", -1, weapon);
	}
	self delete();
}

/*
	Name: function_3a867375
	Namespace: namespace_4cfd21fd
	Checksum: 0x24D9E3C7
	Offset: 0x11A8
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 366
*/
function function_3a867375(origin, player, weapon)
{
	wait(RandomFloatRange(0, 0.15));
	angle = VectorToAngles(origin - self.origin);
	angle = AnglesToForward(angle - VectorScale((0, 1, 0), 180)) + anglesToUp(angle);
	self StartRagdoll();
	fling_vec = VectorScale(angle, 100);
	self LaunchRagdoll(fling_vec);
	self DoDamage(self.maxhealth + 666, self.origin, player, player, 0, "MOD_RIFLE_BULLET", -1, weapon);
}

/*
	Name: grenade_waittill_still_or_bounce
	Namespace: namespace_4cfd21fd
	Checksum: 0x6C567BB5
	Offset: 0x12E0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 387
*/
function grenade_waittill_still_or_bounce()
{
	prev_origin = self.origin;
	while(1)
	{
		wait(0.05);
		if(prev_origin == self.origin)
		{
			break;
		}
		prev_origin = self.origin;
	}
	return prev_origin;
}

/*
	Name: function_998f25bf
	Namespace: namespace_4cfd21fd
	Checksum: 0xC9F15677
	Offset: 0x1338
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 412
*/
function function_998f25bf()
{
	self endon("delete");
	wait(12);
	if(isdefined(self) && isalive(self))
	{
		self.is_on_fire = 0;
		self notify("stop_flame_damage");
		return;
	}
	continue;
}

/*
	Name: function_16f731c8
	Namespace: namespace_4cfd21fd
	Checksum: 0xF60B45E9
	Offset: 0x1390
	Size: 0x298
	Parameters: 1
	Flags: None
	Line Number: 435
*/
function function_16f731c8(FX)
{
	self endon("delete");
	if(isdefined(self.is_on_fire) && self.is_on_fire)
	{
		return;
	}
	self.is_on_fire = 1;
	self thread function_998f25bf();
	fire_tag = "j_spinelower";
	if(!isdefined(self GetTagOrigin(fire_tag)))
	{
		fire_tag = "tag_origin";
	}
	if(!isdefined(self.isdog) || !self.isdog)
	{
		PlayFXOnTag(FX, self, fire_tag);
	}
	if(self.archetype !== "parasite" && self.archetype !== "raps")
	{
		for(i = 0; i < 15; i++)
		{
			tagArray = [];
			tagArray[0] = "j_elbow_le";
			tagArray[1] = "j_elbow_ri";
			tagArray[2] = "j_knee_ri";
			tagArray[3] = "j_knee_le";
			tagArray = Array::randomize(tagArray);
			PlayFXOnTag(FX, self, tagArray[0]);
			tagArray[0] = "j_wrist_ri";
			tagArray[1] = "j_wrist_le";
			if(!(isdefined(self.missingLegs) && self.missingLegs))
			{
				tagArray[2] = "j_ankle_ri";
				tagArray[3] = "j_ankle_le";
			}
			tagArray = Array::randomize(tagArray);
			PlayFXOnTag(FX, self, tagArray[0]);
			PlayFXOnTag(FX, self, tagArray[1]);
			wait(RandomFloatRange(0.05, 0.15));
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: upgrade_trigger
	Namespace: namespace_4cfd21fd
	Checksum: 0x57D6B6B4
	Offset: 0x1630
	Size: 0x380
	Parameters: 0
	Flags: None
	Line Number: 491
*/
function upgrade_trigger()
{
	trigger = spawn("trigger_radius_use", self.origin + VectorScale((0, 0, 1), 48), 0, 40, 80);
	trigger.script_noteworthy = "harrybo21_dragon_shield_upgrade_trigger";
	trigger TriggerIgnoreTeam();
	trigger setvisibletoall();
	trigger SetTeamForTrigger("none");
	trigger UseTriggerRequireLookAt();
	trigger setcursorhint("HINT_NOICON");
	trigger setHintString("Press & hold ^3&&1^7 to upgrade Dragon Shield");
	while(1)
	{
		trigger waittill("trigger", player);
		if(player laststand::player_is_in_laststand() || (isdefined(player.intermission) && player.intermission) || !player hasweapon(GetWeapon("dragon_shield")))
		{
			continue;
		}
		trigger setHintString("");
		player zm_weapons::weapon_take(GetWeapon("dragon_shield"));
		model = spawn("script_model", trigger.origin);
		model SetModel("wpn_t7_zmb_dlc3_dragon_shield_dmg0_world");
		model.angles = self.angles;
		wait(1);
		model moveto(model.origin - VectorScale((0, 0, 1), 100), 3);
		wait(5);
		model moveto(model.origin + VectorScale((0, 0, 1), 100), 3);
		wait(5);
		player playlocalsound("zmb_dragon_shield_upgrade");
		player notify("hash_74f6720b");
		player.b_has_upgraded_shield = 1;
		player zm_weapons::weapon_give(GetWeapon("dragon_shield_upgraded"), 0, 0, 1, 1);
		player.var_8d531211 = 1;
		trigger setHintString(&"DRAGON_SHIELD_UPGRADE");
		model delete();
	}
}

