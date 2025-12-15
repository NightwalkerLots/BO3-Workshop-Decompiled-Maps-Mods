#include scripts\shared\ai\archetype_locomotion_utility;
#include scripts\shared\ai\archetype_utility;
#include scripts\shared\ai\systems\animation_state_machine_mocomp;
#include scripts\shared\ai\systems\animation_state_machine_notetracks;
#include scripts\shared\ai\systems\animation_state_machine_utility;
#include scripts\shared\ai\systems\behavior_tree_utility;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\zombie;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_attackables;
#include scripts\zm\_zm_behavior_utility;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;

#namespace namespace_6a9c4199;

/*
	Name: __init__sytem__
	Namespace: namespace_6a9c4199
	Checksum: 0xB78AD76C
	Offset: 0x760
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec __init__sytem__()
{
	system::register("hb21_zm_behavior", &__init__, &__main__, undefined);
	return;
}

/*
	Name: __init__
	Namespace: namespace_6a9c4199
	Checksum: 0xA85BD82
	Offset: 0x7A8
	Size: 0x490
	Parameters: 0
	Flags: None
	Line Number: 49
*/
function __init__()
{
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("explosivekillinvalid", &function_ed2494bd);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("waskilledbyidgun", &function_61430bd2);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("hb21zombieblackholebombpullaction", &function_9c81e596, &function_668abb59, &function_b0f206f5);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("waskilledbyblackholebomb", &function_99d4dac4);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("waskilledbywaterstaff", &is_staff_water_damage);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("waskilledbylightningstaff", &is_staff_lightning_damage);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("wasstunnedbylightningstaff", &function_ddfb6c64);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombiestunlightningactionend", &function_bdb4e4dc);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieshouldwhirlwind", &function_cbdc6bd0);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("wasstunnedbyfirestaff", &function_e2ac920);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombiestunfireactionend", &function_a4bc8804);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("waskilledbyfirestaff", &is_staff_fire_damage);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("moonzombiekilledbymicrowavegun", &is_microwavegun_damage);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("moonzombiekilledbymicrowavegundw", &function_24608973);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieshouldinertidle", &function_723db423);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieshouldinertwakeup", &function_99286aa);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieshouldinertterminate", &function_21c1b81e);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieshouldslip", &function_3e0bcf14);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieslippedactionstart", &function_50344015);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieslippedactionupdate", &function_1add374);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieslippedactionterminate", &function_7b535b24);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("wasstunnedbyacid", &function_87361210);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombiestunacidactionend", &function_be1b3df9);
	blackboard::RegisterBlackBoardAttribute(self, "_zombie_side_step_type", "none", &function_810139eb);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombiesidestepservice", &function_d29c7dd0);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeScriptAPI("zombieshouldsidestep", &function_673d8090);
	BehaviorTreeNetworkUtility::RegisterBehaviorTreeAction("zombiesidestepaction", &function_c2da0209, undefined, &function_50e6f938);
	return;
}

/*
	Name: __main__
	Namespace: namespace_6a9c4199
	Checksum: 0x54BFB2DA
	Offset: 0xC40
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function __main__()
{
	level.zombie_total_set_func = &zombie_total_update;
}

/*
	Name: zombie_total_update
	Namespace: namespace_6a9c4199
	Checksum: 0x20589255
	Offset: 0xC68
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 106
*/
function zombie_total_update()
{
	level.zombiesLeftBeforeNapalmSpawn = randomIntRange(Int(level.zombie_total * 0.25), Int(level.zombie_total * 0.75));
	level.zombiesLeftBeforeSonicSpawn = randomIntRange(Int(level.zombie_total * 0.25), Int(level.zombie_total * 0.75));
	level.zombie_total_update = 1;
	level.zombies_left_before_astro_spawn = 1;
	if(level.zombie_total > 1)
	{
		level.zombies_left_before_astro_spawn = randomIntRange(Int(level.zombie_total * 0.25), Int(level.zombie_total * 0.75));
		return;
	}
}

/*
	Name: function_97120f0a
	Namespace: namespace_6a9c4199
	Checksum: 0xA65B5D5F
	Offset: 0xDC0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 129
*/
function function_97120f0a()
{
	level.AAT["zm_aat_blast_furnace"].validation_func = &function_1aba7dcf;
	level.AAT["zm_aat_dead_wire"].validation_func = &function_1aba7dcf;
	level.AAT["zm_aat_fire_works"].validation_func = &function_1aba7dcf;
	level.AAT["zm_aat_thunder_wall"].validation_func = &function_1aba7dcf;
	level.AAT["zm_aat_turned"].validation_func = &function_1aba7dcf;
}

/*
	Name: function_1aba7dcf
	Namespace: namespace_6a9c4199
	Checksum: 0xBCE7F729
	Offset: 0xE98
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function function_1aba7dcf()
{
	if(isdefined(self) && isdefined(self.animName) && (self.animName == "astro_zombie" || self.animName == "sonic_zombie" || self.animName == "napalm_zombie"))
	{
		return 0;
	}
	return 1;
	continue;
}

/*
	Name: function_99df0743
	Namespace: namespace_6a9c4199
	Checksum: 0x6D0F5612
	Offset: 0xF00
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 168
*/
function function_99df0743()
{
	self.var_16314a4f = 0;
	self.var_74466ef2 = 1;
	self.var_e5bedd24 = 1;
	self.var_82a8f3e5 = 0.7;
	self.var_5d3819da = 0.5;
	self.var_240c6275 = 0.3;
	self.var_7df60690 = 2000;
	self.var_fd1ef6aa = 64;
	self.var_e2b07e98 = 1000;
}

/*
	Name: function_14207fef
	Namespace: namespace_6a9c4199
	Checksum: 0xDA12B461
	Offset: 0xF88
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 191
*/
function function_14207fef()
{
	self.a.disablePain = 1;
	self.allowPain = 0;
	self.a.disableReact = 1;
	self.allowReact = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cd0c3f30
	Namespace: namespace_6a9c4199
	Checksum: 0x36A974E3
	Offset: 0xFD8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 211
*/
function function_cd0c3f30()
{
	self.a.disablePain = 0;
	self.allowPain = 1;
	self.a.disableReact = 0;
	self.allowReact = 1;
	return;
	~self.allowReact;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_810139eb
	Namespace: namespace_6a9c4199
	Checksum: 0x21BC06BC
	Offset: 0x1028
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 232
*/
function function_810139eb()
{
	return self.var_7bd9104;
}

/*
	Name: function_d29c7dd0
	Namespace: namespace_6a9c4199
	Checksum: 0xAFC5F7B5
	Offset: 0x1040
	Size: 0x1F0
	Parameters: 1
	Flags: None
	Line Number: 247
*/
function function_d29c7dd0(var_c25d9a24)
{
	if(!(isdefined(var_c25d9a24.var_74466ef2) && var_c25d9a24.var_74466ef2))
	{
		return;
	}
	if(!isdefined(var_c25d9a24.var_730536cd))
	{
		var_c25d9a24.var_730536cd = GetTime();
	}
	if(isdefined(var_c25d9a24.enemy))
	{
		var_c25d9a24.var_a0e321c0 = var_c25d9a24 function_bb85bda1();
		if(var_c25d9a24.var_a0e321c0 != "none")
		{
			var_c25d9a24.var_21f320ad = var_c25d9a24 function_49f68b38();
			if(var_c25d9a24.var_21f320ad == "none")
			{
				return;
			}
			str_anim_name = var_c25d9a24 AnimMappingSearch(istring("anim_" + var_c25d9a24.archetype + "_side_" + var_c25d9a24.var_a0e321c0 + "_" + var_c25d9a24.var_21f320ad));
			if(var_c25d9a24 MayMoveFromPointToPoint(var_c25d9a24.origin, zombie_utility::getAnimEndPos(str_anim_name)))
			{
				var_c25d9a24.var_7bd9104 = var_c25d9a24.var_a0e321c0 + "_" + var_c25d9a24.var_21f320ad;
				var_c25d9a24.var_44f06e7d = 1;
			}
		}
	}
}

/*
	Name: function_bb85bda1
	Namespace: namespace_6a9c4199
	Checksum: 0x33DABD55
	Offset: 0x1238
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 287
*/
function function_bb85bda1()
{
	if(self function_3a96c1b7() && isPlayer(self.enemy) && self.enemy islookingat(self))
	{
		if(isdefined(self.var_74466ef2) && self.var_74466ef2 && RandomFloat(1) < self.var_82a8f3e5)
		{
			return "step";
		}
	}
	return "none";
}

/*
	Name: function_3a96c1b7
	Namespace: namespace_6a9c4199
	Checksum: 0x35D5D442
	Offset: 0x12E0
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 309
*/
function function_3a96c1b7()
{
	if(!(isdefined(self.var_74466ef2) && self.var_74466ef2))
	{
		return 0;
	}
	if(GetTime() - self.var_730536cd < self.var_7df60690)
	{
		return 0;
	}
	self.var_730536cd = GetTime();
	if(!isdefined(self.enemy))
	{
		return 0;
	}
	if(isdefined(self.missingLegs) && self.missingLegs)
	{
		return 0;
	}
	var_21b4a636 = DistanceSquared(self.origin, self.enemy.origin);
	if(var_21b4a636 < self.var_fd1ef6aa * self.var_fd1ef6aa)
	{
		return 0;
	}
	if(var_21b4a636 > self.var_e2b07e98 * self.var_e2b07e98)
	{
		return 0;
	}
	if(!isdefined(self.pathGoalPos) || DistanceSquared(self.origin, self.pathGoalPos) < self.var_fd1ef6aa * self.var_fd1ef6aa)
	{
		return 0;
	}
	if(Abs(self getMotionAngle()) > 15)
	{
		return 0;
	}
	yaw = zombie_utility::GetYawToOrigin(self.enemy.origin);
	if(Abs(yaw) > 45)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_49f68b38
	Namespace: namespace_6a9c4199
	Checksum: 0x4515FD1A
	Offset: 0x1498
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 363
*/
function function_49f68b38()
{
	randomRoll = RandomFloat(1);
	if(randomRoll < self.var_240c6275)
	{
		return "forward";
	}
	if(self.var_16314a4f < 0)
	{
		return "right";
	}
	else if(self.var_16314a4f > 0)
	{
		return "left";
	}
	else if(randomRoll < self.var_5d3819da)
	{
		return "right";
	}
	else if(randomRoll < self.var_5d3819da * 2)
	{
		return "left";
	}
	return "none";
}

/*
	Name: function_673d8090
	Namespace: namespace_6a9c4199
	Checksum: 0x7D53E11A
	Offset: 0x1560
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 399
*/
function function_673d8090(behaviorTreeEntity)
{
	if(isdefined(behaviorTreeEntity.var_44f06e7d) && behaviorTreeEntity.var_44f06e7d)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_c2da0209
	Namespace: namespace_6a9c4199
	Checksum: 0x4769FC41
	Offset: 0x15A8
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 418
*/
function function_c2da0209(var_c25d9a24, var_3898faa2)
{
	var_c25d9a24 function_14207fef();
	AnimationStateNetworkUtility::RequestState(var_c25d9a24, var_3898faa2);
	return 5;
}

/*
	Name: function_50e6f938
	Namespace: namespace_6a9c4199
	Checksum: 0xB3E0FE65
	Offset: 0x15F8
	Size: 0x90
	Parameters: 2
	Flags: None
	Line Number: 435
*/
function function_50e6f938(var_c25d9a24, var_3898faa2)
{
	var_c25d9a24 function_cd0c3f30();
	var_c25d9a24.var_44f06e7d = undefined;
	if(var_c25d9a24.var_21f320ad == "left")
	{
		var_c25d9a24.var_16314a4f--;
		continue;
	}
	var_c25d9a24.var_16314a4f++;
	var_c25d9a24.var_730536cd = GetTime();
	return 4;
	var_c25d9a24.var_730536cd++;
}

/*
	Name: function_9c81e596
	Namespace: namespace_6a9c4199
	Checksum: 0x3539CFB6
	Offset: 0x1690
	Size: 0xE8
	Parameters: 2
	Flags: None
	Line Number: 460
*/
function function_9c81e596(var_7a40f0e0, var_2bb8c91e)
{
	if(isdefined(level.var_413e67f4))
	{
		var_7a40f0e0 thread [[level.var_413e67f4]](var_7a40f0e0, 1);
	}
	var_7a40f0e0.pullTime = GetTime();
	var_7a40f0e0.pullOrigin = var_7a40f0e0.origin;
	AnimationStateNetworkUtility::RequestState(var_7a40f0e0, var_2bb8c91e);
	function_febd539b(var_7a40f0e0);
	if(isdefined(var_7a40f0e0.damageOrigin))
	{
		var_7a40f0e0.n_zombie_custom_goal_radius = 8;
		var_7a40f0e0.v_zombie_custom_goal_pos = var_7a40f0e0.damageOrigin;
	}
	return 5;
	ERROR: Bad function call
}

/*
	Name: function_febd539b
	Namespace: namespace_6a9c4199
	Checksum: 0xF6225D6C
	Offset: 0x1780
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 489
*/
function function_febd539b(var_7a40f0e0)
{
	var_e15afcb = DistanceSquared(var_7a40f0e0.origin, var_7a40f0e0.damageOrigin);
	if(var_e15afcb < 16384)
	{
		var_7a40f0e0._black_hole_bomb_collapse_death = 1;
	}
	else if(var_e15afcb < 1048576)
	{
		blackboard::SetBlackBoardAttribute(var_7a40f0e0, "_zombie_blackholebomb_pull_state", "bhb_pull_fast");
	}
	else if(var_e15afcb < 4227136)
	{
		blackboard::SetBlackBoardAttribute(var_7a40f0e0, "_zombie_blackholebomb_pull_state", "bhb_pull_slow");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_668abb59
	Namespace: namespace_6a9c4199
	Checksum: 0xDEAD0D8F
	Offset: 0x1860
	Size: 0x238
	Parameters: 2
	Flags: None
	Line Number: 518
*/
function function_668abb59(var_7a40f0e0, var_2bb8c91e)
{
	if(!isdefined(var_7a40f0e0.interdimensional_gun_kill))
	{
		return 4;
	}
	function_febd539b(var_7a40f0e0);
	if(isdefined(var_7a40f0e0._black_hole_bomb_collapse_death) && var_7a40f0e0._black_hole_bomb_collapse_death)
	{
		var_7a40f0e0.skipAutoRagdoll = 1;
		var_7a40f0e0 DoDamage(var_7a40f0e0.health + 666, var_7a40f0e0.origin + VectorScale((0, 0, 1), 50), var_7a40f0e0.interdimensional_gun_attacker, undefined, undefined, "MOD_CRUSH", 0, var_7a40f0e0.interdimensional_gun_weapon);
		return 4;
	}
	if(isdefined(var_7a40f0e0.damageOrigin))
	{
		var_7a40f0e0.v_zombie_custom_goal_pos = var_7a40f0e0.damageOrigin;
	}
	if(GetTime() - var_7a40f0e0.pullTime > 1000)
	{
		n_dist_sq = Distance2DSquared(var_7a40f0e0.origin, var_7a40f0e0.pullOrigin);
		if(n_dist_sq < 144)
		{
			var_7a40f0e0 SetAvoidanceMask("avoid all");
			var_7a40f0e0.cant_move = 1;
			if(isdefined(var_7a40f0e0.cant_move_cb))
			{
				var_7a40f0e0 [[var_7a40f0e0.cant_move_cb]]();
				continue;
			}
		}
		var_7a40f0e0 SetAvoidanceMask("avoid none");
		var_7a40f0e0.cant_move = 0;
		var_7a40f0e0.pullTime = GetTime();
		var_7a40f0e0.pullOrigin = var_7a40f0e0.origin;
	}
	return 5;
	~var_7a40f0e0.pullOrigin;
}

/*
	Name: function_b0f206f5
	Namespace: namespace_6a9c4199
	Checksum: 0xBAC07200
	Offset: 0x1AA0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 567
*/
function function_b0f206f5(var_7a40f0e0, var_2bb8c91e)
{
	if(isdefined(level.var_413e67f4))
	{
		var_7a40f0e0 thread [[level.var_413e67f4]](var_7a40f0e0, 0);
	}
	var_7a40f0e0.v_zombie_custom_goal_pos = undefined;
	var_7a40f0e0.n_zombie_custom_goal_radius = undefined;
	var_7a40f0e0.pullTime = undefined;
	var_7a40f0e0.pullOrigin = undefined;
	return 4;
}

/*
	Name: function_ed2494bd
	Namespace: namespace_6a9c4199
	Checksum: 0x174A7B67
	Offset: 0x1B18
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 590
*/
function private function_ed2494bd(var_7a40f0e0)
{
	if(isdefined(level.var_b4113830))
	{
		return [[level.var_b4113830]](var_7a40f0e0.damageWeapon);
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_61430bd2
	Namespace: namespace_6a9c4199
	Checksum: 0x8F3AF937
	Offset: 0x1B58
	Size: 0xC0
	Parameters: 1
	Flags: Private
	Line Number: 610
*/
function private function_61430bd2(var_7a40f0e0)
{
	if(!isdefined(var_7a40f0e0.killby_interdimensional_gun_hole) && (isdefined(var_7a40f0e0.interdimensional_gun_kill) && var_7a40f0e0.interdimensional_gun_kill) && isdefined(var_7a40f0e0.interdimensional_gun_weapon) && IsWeapon(var_7a40f0e0.interdimensional_gun_weapon) && IsInArray(level.idgun_weapons, var_7a40f0e0.interdimensional_gun_weapon) && isalive(var_7a40f0e0))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_99d4dac4
	Namespace: namespace_6a9c4199
	Checksum: 0x7AF88E74
	Offset: 0x1C20
	Size: 0xA8
	Parameters: 1
	Flags: Private
	Line Number: 629
*/
function private function_99d4dac4(var_7a40f0e0)
{
	if(isdefined(var_7a40f0e0.interdimensional_gun_kill) && var_7a40f0e0.interdimensional_gun_kill && isdefined(var_7a40f0e0.interdimensional_gun_weapon) && IsWeapon(var_7a40f0e0.interdimensional_gun_weapon) && var_7a40f0e0.interdimensional_gun_weapon.name == "t7_black_hole_bomb" && isalive(var_7a40f0e0))
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_staff_water_damage
	Namespace: namespace_6a9c4199
	Checksum: 0x48CA9ECE
	Offset: 0x1CD0
	Size: 0x60
	Parameters: 1
	Flags: Private
	Line Number: 649
*/
function private is_staff_water_damage(var_7a40f0e0)
{
	if(!isdefined(level.var_7905e5e2) || var_7a40f0e0.damageMod == "MOD_MELEE")
	{
		return 0;
	}
	return [[level.var_7905e5e2]](var_7a40f0e0.damageWeapon, level.var_159360bd);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: is_staff_lightning_damage
	Namespace: namespace_6a9c4199
	Checksum: 0xAE23CEBE
	Offset: 0x1D38
	Size: 0x60
	Parameters: 1
	Flags: Private
	Line Number: 669
*/
function private is_staff_lightning_damage(var_7a40f0e0)
{
	if(!isdefined(level.var_7905e5e2) || var_7a40f0e0.damageMod == "MOD_MELEE")
	{
		return 0;
	}
	return [[level.var_7905e5e2]](var_7a40f0e0.damageWeapon, level.var_3de36a56);
}

/*
	Name: function_ddfb6c64
	Namespace: namespace_6a9c4199
	Checksum: 0x44459FD4
	Offset: 0x1DA0
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 688
*/
function private function_ddfb6c64(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_bf1943f9) && var_7a40f0e0.var_bf1943f9;
}

/*
	Name: function_bdb4e4dc
	Namespace: namespace_6a9c4199
	Checksum: 0x1818C5CF
	Offset: 0x1DD8
	Size: 0xC0
	Parameters: 1
	Flags: Private
	Line Number: 703
*/
function private function_bdb4e4dc(var_7a40f0e0)
{
	if(isdefined(var_7a40f0e0.var_bf1943f9) && var_7a40f0e0.var_bf1943f9 > 1)
	{
		var_7a40f0e0.var_bf1943f9--;
		if(isdefined(level.var_aa880468))
		{
			var_7a40f0e0 [[level.var_aa880468]](1);
		}
		return 5;
	}
	var_7a40f0e0.var_bf1943f9 = undefined;
	if(isalive(var_7a40f0e0) && isdefined(level.var_aa880468))
	{
		var_7a40f0e0 [[level.var_aa880468]](0);
	}
	return 4;
}

/*
	Name: function_cbdc6bd0
	Namespace: namespace_6a9c4199
	Checksum: 0x41281208
	Offset: 0x1EA0
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 732
*/
function private function_cbdc6bd0(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_b3fe17ae) && var_7a40f0e0.var_b3fe17ae;
}

/*
	Name: function_e2ac920
	Namespace: namespace_6a9c4199
	Checksum: 0xF65F2C6A
	Offset: 0x1ED8
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 747
*/
function private function_e2ac920(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_fbcbab61) && var_7a40f0e0.var_fbcbab61;
}

/*
	Name: function_a4bc8804
	Namespace: namespace_6a9c4199
	Checksum: 0x281CCED3
	Offset: 0x1F10
	Size: 0x20
	Parameters: 1
	Flags: Private
	Line Number: 762
*/
function private function_a4bc8804(var_7a40f0e0)
{
	var_7a40f0e0.var_fbcbab61 = undefined;
	return 4;
}

/*
	Name: is_staff_fire_damage
	Namespace: namespace_6a9c4199
	Checksum: 0x77ECFE57
	Offset: 0x1F38
	Size: 0x60
	Parameters: 1
	Flags: Private
	Line Number: 778
*/
function private is_staff_fire_damage(var_7a40f0e0)
{
	if(!isdefined(level.var_7905e5e2) || var_7a40f0e0.damageMod == "MOD_MELEE")
	{
		return 0;
	}
	return [[level.var_7905e5e2]](var_7a40f0e0.damageWeapon, level.var_22b967ec);
}

/*
	Name: is_microwavegun_damage
	Namespace: namespace_6a9c4199
	Checksum: 0xB5358BDC
	Offset: 0x1FA0
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 797
*/
function private is_microwavegun_damage(var_7a40f0e0)
{
	if(isdefined(level.var_8c3096b5))
	{
		return [[level.var_8c3096b5]](var_7a40f0e0.damageWeapon);
	}
	return 0;
}

/*
	Name: function_24608973
	Namespace: namespace_6a9c4199
	Checksum: 0x49D6134E
	Offset: 0x1FE0
	Size: 0x38
	Parameters: 1
	Flags: Private
	Line Number: 816
*/
function private function_24608973(var_7a40f0e0)
{
	if(isdefined(level.var_6342e6ad))
	{
		return [[level.var_6342e6ad]](var_7a40f0e0.damageWeapon);
	}
	return 0;
}

/*
	Name: function_723db423
	Namespace: namespace_6a9c4199
	Checksum: 0xF8B93C07
	Offset: 0x2020
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 835
*/
function private function_723db423(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_1db27ef4) && var_7a40f0e0.var_1db27ef4;
}

/*
	Name: function_99286aa
	Namespace: namespace_6a9c4199
	Checksum: 0xDC0583D5
	Offset: 0x2058
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 850
*/
function private function_99286aa(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_cccbd0f7) && var_7a40f0e0.var_cccbd0f7;
}

/*
	Name: function_21c1b81e
	Namespace: namespace_6a9c4199
	Checksum: 0x410A88BE
	Offset: 0x2090
	Size: 0x28
	Parameters: 1
	Flags: Private
	Line Number: 865
*/
function private function_21c1b81e(var_7a40f0e0)
{
	var_7a40f0e0.var_cccbd0f7 = undefined;
	var_7a40f0e0.v_zombie_custom_goal_pos = undefined;
}

/*
	Name: function_3e0bcf14
	Namespace: namespace_6a9c4199
	Checksum: 0xA149100F
	Offset: 0x20C0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 881
*/
function function_3e0bcf14(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_40384bfe) && var_7a40f0e0.var_40384bfe;
}

/*
	Name: function_50344015
	Namespace: namespace_6a9c4199
	Checksum: 0x569A3D25
	Offset: 0x20F8
	Size: 0x138
	Parameters: 2
	Flags: None
	Line Number: 896
*/
function function_50344015(var_7a40f0e0, var_2bb8c91e)
{
	var_2bb8c91e = "slipped@zombie";
	AnimationStateNetworkUtility::RequestState(var_7a40f0e0, var_2bb8c91e);
	if(!isdefined(var_7a40f0e0.var_45447037))
	{
		var_a9cafd34 = var_7a40f0e0 ASTSearch(istring(var_2bb8c91e));
		var_8f05552f = AnimationStateNetworkUtility::SearchAnimationMap(var_7a40f0e0, var_a9cafd34["animation"]);
		var_7a40f0e0.var_45447037 = GetTime() + getanimlength(var_8f05552f);
	}
	if(isdefined(var_7a40f0e0.blockingPain))
	{
		continue;
	}
	var_7a40f0e0.var_fdd8ba81 = 0;
	var_7a40f0e0.blockingPain = 1;
	return 5;
}

/*
	Name: function_1add374
	Namespace: namespace_6a9c4199
	Checksum: 0xA987541C
	Offset: 0x2238
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 925
*/
function function_1add374(var_7a40f0e0)
{
	if(isdefined(var_7a40f0e0.var_45447037) && GetTime() >= var_7a40f0e0.var_45447037)
	{
		var_7a40f0e0.var_45447037 = undefined;
		return 4;
	}
	return 5;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7b535b24
	Namespace: namespace_6a9c4199
	Checksum: 0x695E8797
	Offset: 0x2290
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 946
*/
function function_7b535b24(var_7a40f0e0)
{
	var_7a40f0e0.var_40384bfe = undefined;
	if(isdefined(var_7a40f0e0.var_fdd8ba81))
	{
		continue;
	}
	var_7a40f0e0.blockingPain = 0;
	var_7a40f0e0.var_fdd8ba81 = undefined;
	return 4;
}

/*
	Name: function_87361210
	Namespace: namespace_6a9c4199
	Checksum: 0x7479BFE6
	Offset: 0x2300
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 968
*/
function private function_87361210(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_b268c363) && var_7a40f0e0.var_b268c363;
}

/*
	Name: function_be1b3df9
	Namespace: namespace_6a9c4199
	Checksum: 0x9EED9E26
	Offset: 0x2338
	Size: 0x20
	Parameters: 1
	Flags: Private
	Line Number: 983
*/
function private function_be1b3df9(var_7a40f0e0)
{
	var_7a40f0e0.var_b268c363 = undefined;
	return 4;
}

/*
	Name: function_487ea9ff
	Namespace: namespace_6a9c4199
	Checksum: 0x8C812216
	Offset: 0x2360
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 999
*/
function private function_487ea9ff(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_f1a77dd) && var_7a40f0e0.var_f1a77dd;
}

/*
	Name: function_442ac7fd
	Namespace: namespace_6a9c4199
	Checksum: 0x4B900092
	Offset: 0x2398
	Size: 0x10
	Parameters: 1
	Flags: Private
	Line Number: 1014
*/
function private function_442ac7fd(var_7a40f0e0)
{
	return 5;
}

/*
	Name: function_ad182400
	Namespace: namespace_6a9c4199
	Checksum: 0xC8ED643B
	Offset: 0x23B0
	Size: 0x10
	Parameters: 1
	Flags: Private
	Line Number: 1029
*/
function private function_ad182400(var_7a40f0e0)
{
	return 4;
}

/*
	Name: function_4b563a3
	Namespace: namespace_6a9c4199
	Checksum: 0xFC78DB72
	Offset: 0x23C8
	Size: 0x30
	Parameters: 1
	Flags: Private
	Line Number: 1044
*/
function private function_4b563a3(var_7a40f0e0)
{
	return isdefined(var_7a40f0e0.var_6d625abb) && var_7a40f0e0.var_6d625abb;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_15d51410
	Namespace: namespace_6a9c4199
	Checksum: 0x54E0E292
	Offset: 0x2400
	Size: 0x10
	Parameters: 1
	Flags: Private
	Line Number: 1060
*/
function private function_15d51410(var_7a40f0e0)
{
	return 5;
}

/*
	Name: function_4ff1d8c7
	Namespace: namespace_6a9c4199
	Checksum: 0x9667ED13
	Offset: 0x2418
	Size: 0x10
	Parameters: 1
	Flags: Private
	Line Number: 1075
*/
function private function_4ff1d8c7(var_7a40f0e0)
{
	return 4;
}

