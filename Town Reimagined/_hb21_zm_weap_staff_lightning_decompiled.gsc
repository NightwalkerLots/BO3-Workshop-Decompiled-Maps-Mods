#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_hb21_zm_weap_one_inch_punch;
#include scripts\zm\_hb21_zm_weap_staff_utility;
#include scripts\zm\_load;
#include scripts\zm\_util;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_net;
#include scripts\zm\_zm_perk_electric_cherry;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_39f88dbc;

/*
	Name: __init__sytem__
	Namespace: namespace_39f88dbc
	Checksum: 0xC5E12D52
	Offset: 0x7D8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 43
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_weap_staff_lightning", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_39f88dbc
	Checksum: 0xEFFDFD75
	Offset: 0x818
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 58
*/
function __init__()
{
	callback::on_spawned(&on_player_spawned);
	zm_utility::register_melee_weapon_for_level("t7_staff_bolt_melee");
	zm_spawner::register_zombie_damage_callback(&staff_lightning_zombie_damage_response);
	zm_spawner::register_zombie_death_event_callback(&staff_lightning_death_event);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_spawned
	Namespace: namespace_39f88dbc
	Checksum: 0x301B2A4C
	Offset: 0x8A0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function on_player_spawned()
{
	self thread watch_staff_lightning_fired();
}

/*
	Name: watch_staff_lightning_fired
	Namespace: namespace_39f88dbc
	Checksum: 0x2C452DBB
	Offset: 0x8C8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function watch_staff_lightning_fired()
{
	self notify("hash_2dd88834");
	self endon("disconnect");
	self endon("hash_2dd88834");
	while(1)
	{
		self waittill("hash_52c12488", e_projectile, str_weapon, var_16f4cf62);
		if(str_weapon.name == "t7_staff_bolt_upgraded" && var_16f4cf62 > 1)
		{
			fire_angles = VectorToAngles(self GetWeaponForwardDir());
			fire_origin = self GetWeaponMuzzlePoint();
			e_projectile thread staff_lightning_position_source(self, str_weapon, var_16f4cf62);
		}
	}
}

/*
	Name: staff_lightning_zombie_damage_response
	Namespace: namespace_39f88dbc
	Checksum: 0xD0381A72
	Offset: 0x9D8
	Size: 0xB8
	Parameters: 13
	Flags: None
	Line Number: 120
*/
function staff_lightning_zombie_damage_response(str_mod, str_hit_location, v_hit_origin, e_player, n_amount, w_weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	if(self is_staff_lightning_damage())
	{
		self thread function_7ed6978f(str_mod, w_weapon, e_player, n_amount);
		return 1;
	}
	return 0;
}

/*
	Name: function_7ed6978f
	Namespace: namespace_39f88dbc
	Checksum: 0x57A83F73
	Offset: 0xA98
	Size: 0x150
	Parameters: 4
	Flags: None
	Line Number: 140
*/
function function_7ed6978f(mod, damageWeapon, player, amount)
{
	player endon("disconnect");
	if(!isalive(self))
	{
		return;
	}
	if(mod != "MOD_RIFLE_BULLET")
	{
		self function_9333e36e(player, damageWeapon, player.var_900bd247);
		self DoDamage(function_61422074(damageWeapon.name, player.var_900bd247), self.origin, player, player, 0, "MOD_RIFLE_BULLET", -1, damageWeapon);
	}
	self playsound("wpn_lightningstaff_shock");
	if(!(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40()))
	{
		self thread function_fca0063e(player);
	}
}

/*
	Name: staff_lightning_death_event
	Namespace: namespace_39f88dbc
	Checksum: 0x2BE2B6D7
	Offset: 0xBF0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 169
*/
function staff_lightning_death_event(attacker)
{
	if(is_staff_lightning_damage())
	{
		if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
		{
			return 0;
		}
		self thread staff_lightning_kill_zombie(attacker);
		return 1;
	}
	return 0;
}

/*
	Name: staff_lightning_kill_zombie
	Namespace: namespace_39f88dbc
	Checksum: 0xEFC6B05D
	Offset: 0xC70
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 193
*/
function staff_lightning_kill_zombie(attacker)
{
	if(self.damageMod != "MOD_RIFLE_BULLET")
	{
		self thread function_9333e36e(attacker, self.damageWeapon, attacker.var_900bd247);
	}
	self.marked_for_death = 1;
	self.staff_hit = 1;
	self thread zombie_utility::zombie_eye_glow_stop();
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		anims = RandomInt(2);
		if(anims == 0)
		{
			anim_to_play = "ai_zombie_dlc4_tesla_crawl_death_a";
		}
		else if(anims == 1)
		{
			anim_to_play = "ai_zombie_dlc4_tesla_crawl_death_b";
			continue;
		}
	}
	anims = RandomInt(5);
	if(anims == 0)
	{
		anim_to_play = "ai_zm_dlc5_zombie_tesla_death_a";
	}
	else if(anims == 1)
	{
		anim_to_play = "ai_zm_dlc5_zombie_tesla_death_b";
	}
	else if(anims == 2)
	{
		anim_to_play = "ai_zm_dlc5_zombie_tesla_death_c";
	}
	else if(anims == 3)
	{
		anim_to_play = "ai_zm_dlc5_zombie_tesla_death_d";
		continue;
	}
	anim_to_play = "ai_zm_dlc5_zombie_tesla_death_e";
	self playsound("wpn_lightningstaff_shock");
	tag = "j_spineupper";
	self function_a100d767(1);
	self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
	wait(getanimlength(anim_to_play));
	if(!isdefined(self))
	{
		return;
	}
	self StartRagdoll();
	self function_a100d767(0);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_9333e36e
	Namespace: namespace_39f88dbc
	Checksum: 0x5D6FE3F8
	Offset: 0xEE8
	Size: 0x198
	Parameters: 3
	Flags: None
	Line Number: 260
*/
function function_9333e36e(e_player, w_weapon, var_16f4cf62)
{
	origin = self GetTagOrigin("j_spineupper");
	n_range = 200;
	a_enemies = GetAISpeciesArray("axis", "all");
	a_enemies = util::get_array_of_closest(origin, a_enemies, undefined, undefined, n_range);
	if(isdefined(a_enemies))
	{
		for(i = 0; i < 5; i++)
		{
			if(!isdefined(a_enemies[i]))
			{
				break;
			}
			if(a_enemies[i] == self)
			{
				continue;
			}
			a_enemies[i] thread function_a5d98ae7(origin);
			a_enemies[i] DoDamage(function_61422074(w_weapon.name, var_16f4cf62), a_enemies[i].origin, e_player, e_player, 0, "MOD_RIFLE_BULLET", -1, w_weapon);
		}
		return;
	}
}

/*
	Name: staff_lightning_position_source
	Namespace: namespace_39f88dbc
	Checksum: 0x48E62525
	Offset: 0x1088
	Size: 0x418
	Parameters: 3
	Flags: None
	Line Number: 295
*/
function staff_lightning_position_source(player, str_weapon, var_16f4cf62)
{
	self util::waittill_any("grenade_bounce", "stationary", "death", "explode");
	if(!isdefined(self))
	{
		return;
	}
	v_pos = self.origin;
	ent = spawn("script_origin", v_pos);
	ent SetModel("tag_origin");
	playsoundatposition("wpn_lightningstaff_impact", ent.origin);
	ent PlayLoopSound("wpn_lightningstaff_ball", 1);
	PlayFXOnTag("harry/staff/bolt/fx_staff_bolt_aoe", ent, "tag_origin");
	self namespace_951345fe::function_880d6c62();
	ent thread namespace_951345fe::function_e300dd3();
	ent.n_range = function_18dbb3ea(var_16f4cf62);
	n_lifetime_sec = 9;
	for(i = 0; i < n_lifetime_sec; i++)
	{
		for(c = 0; c < 10; c++)
		{
			a_enemies = GetAISpeciesArray("axis", "all");
			a_enemies = util::get_array_of_closest(v_pos, a_enemies, undefined, undefined, ent.n_range);
			if(isdefined(a_enemies))
			{
				_a200 = a_enemies;
				for(_k200 = getFirstArrayKey(_a200); isdefined(_k200); _k200 = getFirstArrayKey(_a200))
				{
					ai_zombie = _a200[_k200];
					b_trace_pass = BulletTracePassed(ent.origin, ai_zombie GetTagOrigin("j_spine4"), 0, ai_zombie);
					if(isdefined(ai_zombie) && staff_lightning_is_target_valid(ai_zombie))
					{
						ai_zombie thread function_a5d98ae7(v_pos);
						ai_zombie DoDamage(function_1493834(var_16f4cf62), ai_zombie.origin, player, player, 0, "MOD_RIFLE_BULLET", -1, str_weapon);
					}
				}
			}
			wait(0.1);
		}
	}
	playsoundatposition("wpn_lightningstaff_impact", ent.origin);
	playFX("harry/staff/bolt/fx_staff_bolt_impact", ent.origin);
	ent notify("stop_killing", getNextArrayKey(_a200, _k200));
	ent delete();
}

/*
	Name: function_18dbb3ea
	Namespace: namespace_39f88dbc
	Checksum: 0xECC09828
	Offset: 0x14A8
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 351
*/
function function_18dbb3ea(n_charge)
{
	switch(n_charge)
	{
		case 1:
		{
			n_range = 200;
			break;
		}
		case 2:
		{
			n_range = 150;
			break;
		}
		case 3:
		default
		{
			n_range = 250;
			break;
		}
	}
	return n_range;
}

/*
	Name: function_1493834
	Namespace: namespace_39f88dbc
	Checksum: 0x729E2AA9
	Offset: 0x1528
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 385
*/
function function_1493834(n_charge)
{
	if(!isdefined(n_charge))
	{
		return 2500;
	}
	switch(n_charge)
	{
		case 3:
		{
			return 3500;
		}
		default
		{
			return 2500;
		}
	}
}

/*
	Name: staff_lightning_is_target_valid
	Namespace: namespace_39f88dbc
	Checksum: 0x6CB096E1
	Offset: 0x1580
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 414
*/
function staff_lightning_is_target_valid(ai_zombie)
{
	if(!isdefined(ai_zombie))
	{
		return 0;
	}
	if(isdefined(ai_zombie.is_being_zapped) && ai_zombie.is_being_zapped)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_a5d98ae7
	Namespace: namespace_39f88dbc
	Checksum: 0x70D9E6BB
	Offset: 0x15D0
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 437
*/
function function_a5d98ae7(var_26108645)
{
	e_ball_fx = spawn("script_model", var_26108645);
	e_ball_fx SetModel("tag_origin");
	PlayFXOnTag("harry/staff/bolt/fx_staff_bolt_zombie_zap", e_ball_fx, "tag_origin");
	e_ball_fx moveto(self GetTagOrigin("j_spineupper"), 0.25);
	wait(0.25);
	e_ball_fx delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fca0063e
	Namespace: namespace_39f88dbc
	Checksum: 0xAFBEC368
	Offset: 0x16B0
	Size: 0x260
	Parameters: 1
	Flags: None
	Line Number: 459
*/
function function_fca0063e(player)
{
	self endon("death");
	if(isdefined(self namespace_951345fe::function_8b325b40()) && self namespace_951345fe::function_8b325b40())
	{
		return;
	}
	if(isdefined(self.is_electrocuted) && self.is_electrocuted)
	{
		return;
	}
	if(!isdefined(self.ai_state) || self.ai_state != "zombie_think")
	{
		return;
	}
	if(isdefined(self.staff_hit) && self.staff_hit)
	{
		return;
	}
	self.ignoreall = 1;
	self.staff_hit = 1;
	self.is_electrocuted = 1;
	tag = "j_spineupper";
	self function_a100d767(1);
	if(!(isdefined(self.missingLegs) && self.missingLegs))
	{
		if(!(isdefined(self.missingLegs) && self.missingLegs))
		{
			anims = RandomInt(5);
			if(anims == 0)
			{
				anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_a";
			}
			else if(anims == 1)
			{
				anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_b";
			}
			else if(anims == 2)
			{
				anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_c";
			}
			else if(anims == 3)
			{
				anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_d";
				continue;
			}
			anim_to_play = "ai_zm_dlc5_zombie_afterlife_stun_e";
			self AnimScripted(anim_to_play, self.origin, self.angles, anim_to_play);
			wait(getanimlength(anim_to_play));
		}
	}
	if(!isdefined(self))
	{
		return;
	}
	self function_a100d767(0);
	self.ignoreall = 0;
	self.staff_hit = 0;
	self.is_electrocuted = undefined;
	return;
}

/*
	Name: function_a100d767
	Namespace: namespace_39f88dbc
	Checksum: 0xBDE4FD6C
	Offset: 0x1918
	Size: 0x138
	Parameters: 1
	Flags: None
	Line Number: 531
*/
function function_a100d767(Play)
{
	self endon("death");
	self playsound("zmb_elec_jib_zombie");
	if(isdefined(self.var_a1afc46f) && self.var_a1afc46f == Play)
	{
		return;
	}
	self.var_a1afc46f = Play;
	if(!(isdefined(self.head_gibbed) && self.head_gibbed))
	{
		if(isVehicle(self))
		{
			self clientfield::set("tesla_shock_eyes_fx_veh", Play);
			continue;
		}
		self clientfield::set("tesla_shock_eyes_fx", Play);
	}
	else if(isVehicle(self))
	{
		self clientfield::set("tesla_death_fx_veh", Play);
		continue;
	}
	self clientfield::set("tesla_death_fx", Play);
}

/*
	Name: function_61422074
	Namespace: namespace_39f88dbc
	Checksum: 0x141C80E3
	Offset: 0x1A58
	Size: 0xA0
	Parameters: 2
	Flags: None
	Line Number: 567
*/
function function_61422074(damageWeapon, var_16f4cf62)
{
	switch(damageWeapon)
	{
		case "t7_staff_bolt":
		{
			return 2050;
		}
		case "t7_staff_bolt_upgraded":
		{
			if(isdefined(var_16f4cf62) && var_16f4cf62 == 3)
			{
				return 20000;
			}
			else if(isdefined(var_16f4cf62) && var_16f4cf62 == 2)
			{
				return 11500;
				continue;
			}
			return 3300;
		}
		case "t7_one_inch_punch_upgraded":
		{
			return 11275;
		}
		default
		{
			return 0;
		}
	}
}

/*
	Name: is_staff_lightning_damage
	Namespace: namespace_39f88dbc
	Checksum: 0x16CC79B6
	Offset: 0x1B00
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 609
*/
function is_staff_lightning_damage()
{
	if(isdefined(self.damageWeapon) && isdefined(self.damageWeapon.name) && (self.damageWeapon.name == "t7_staff_bolt" || self.damageWeapon.name == "t7_staff_bolt_upgraded" || (self.damageWeapon.name == "t7_one_inch_punch_upgraded" && self.attacker namespace_7529ddc1::function_924e32bf() == "lightning")))
	{
		return 1;
	}
	return 0;
}

