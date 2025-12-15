#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_utility;

#namespace Katana;

/*
	Name: __init__sytem__
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x318
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 24
*/
function autoexec __init__sytem__()
{
	system::register("zm_weap_melee_katana", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 39
*/
function __init__()
{
	if(GetDvarString("aae_lite") == "")
	{
		function_9b385ca5();
		level.var_b3e9e243 = Throttle;
		Initialize(level.var_b3e9e243, 6);
		callback::on_spawned(&function_b66367a1);
		zm::register_zombie_damage_override_callback(&function_d81ceab7);
	}
}

/*
	Name: function_d81ceab7
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0xC0
	Parameters: 13
	Flags: None
	Line Number: 61
*/
function function_d81ceab7(death, inflictor, player, damage, flags, mod, weapon, vPoint, vDir, HIT_LOCATION, psOffsetTime, boneIndex, surfaceType)
{
	if(isdefined(death) && death && weapon.name == "elmg_katana_upgraded")
	{
		player.score = player.score - 30;
	}
}

/*
	Name: function_b66367a1
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x4D0
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 79
*/
function function_b66367a1()
{
	self notify("hash_b66367a1");
	self endon("hash_b66367a1");
	self endon("bled_out");
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self thread function_225c152f();
	self thread function_9ebdd722();
	self.var_25530515 = 1;
	while(isdefined(self))
	{
		self waittill("weapon_melee_juke", weapon);
		if(weapon.name == "elmg_katana_upgraded")
		{
			self disableOffhandWeapons();
			self playsoundtoallbutplayer("wpn_melee_katana_power_npc", self);
			self zm_utility::function_ea3a8353();
			self.var_553ee0da = 0;
			self function_d4bca4fa();
			self EnableOffhandWeapons();
			self zm_utility::function_adb1601b();
			if(isdefined(self.var_553ee0da) && self.var_553ee0da >= 15)
			{
				self.var_25530515 = 1;
			}
			if(isdefined(self.var_32385571) && self.var_32385571)
			{
				self giveMaxAmmo(weapon);
			}
			self.var_553ee0da = 0;
		}
	}
}

/*
	Name: function_9ebdd722
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x6A8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 125
*/
function function_9ebdd722()
{
	self notify("hash_87ae78b8");
	self endon("hash_87ae78b8");
	while(isdefined(self))
	{
		if(self AttackButtonPressed() || self meleeButtonPressed() || self IsMeleeing() || self AdsButtonPressed() && self GetCurrentWeapon().name == "elmg_katana_upgraded")
		{
			self setnormalhealth(1);
			while(self AttackButtonPressed() || self meleeButtonPressed() || self IsMeleeing() || self AdsButtonPressed())
			{
				wait(0.05);
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_d4bca4fa
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x7F8
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 153
*/
function function_d4bca4fa()
{
	self notify("hash_2edfda9c");
	self endon("hash_2edfda9c");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self endon("bled_out");
	self endon("weapon_melee");
	self endon("weapon_melee_power");
	self endon("weapon_melee_charge");
	start_time = GetTime();
	while(isdefined(self) && start_time + 1000 > GetTime())
	{
		FORWARD = AnglesToForward(self getPlayerAngles());
		velocity = self getvelocity();
		predicted_pos = self.origin + velocity * 0.1;
		self thread function_de054f3c(predicted_pos, 150);
		wait(0.1);
	}
}

/*
	Name: function_225c152f
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x940
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_225c152f()
{
	self notify("hash_815a31dc");
	self endon("hash_815a31dc");
	while(isdefined(self))
	{
		if(isdefined(self.var_25530515) && self.var_25530515 != 0)
		{
			if(self GetCurrentWeapon().name == "elmg_katana_upgraded")
			{
				if(self GamepadUsedLast())
				{
					if(self SprintButtonPressed() && self ReloadButtonPressed())
					{
						self.var_25530515 = self.var_25530515 - 1;
						self ignoreme();
					}
				}
				else if(self ReloadButtonPressed())
				{
					self.var_25530515 = self.var_25530515 - 1;
					self ignoreme();
				}
			}
		}
		util::wait_network_frame();
	}
}

/*
	Name: ignoreme
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 224
*/
function ignoreme()
{
	self zm_utility::increment_ignoreme();
	self giveMaxAmmo(GetWeapon("elmg_katana_upgraded"));
	self.var_32385571 = 1;
	self playsound("zmb_bgb_plainsight_start");
	self PlayLoopSound("zmb_bgb_plainsight_loop", 1);
	visionset_mgr::activate("visionset", "zm_bgb_in_plain_sight", self, 0.5, 9, 0.5);
	visionset_mgr::activate("overlay", "zm_bgb_in_plain_sight", self);
	ret = self util::waittill_any_timeout(9.5, "player_down", "end_game", "disconnect");
	self StopLoopSound(1);
	self playsound("zmb_bgb_plainsight_end");
	if("timeout" != ret)
	{
		visionset_mgr::deactivate("visionset", "zm_bgb_in_plain_sight", self);
	}
	else
	{
		wait(0.5);
	}
	visionset_mgr::deactivate("overlay", "zm_bgb_in_plain_sight", self);
	self.var_32385571 = 0;
	self zm_utility::decrement_ignoreme();
	return;
}

/*
	Name: function_de054f3c
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0xC70
	Size: 0x6F0
	Parameters: 2
	Flags: None
	Line Number: 260
*/
function function_de054f3c(predicted_pos, radius)
{
	self endon("hash_a965f3c1");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	self endon("bled_out");
	self endon("weapon_melee");
	self endon("weapon_melee_power");
	self endon("weapon_melee_charge");
	player = self;
	allEnemyAlivePlayers = GetAITeamArray(level.zombie_team);
	allEnemyAlivePlayers = ArrayCombine(GetVehicleTeamArray(level.zombie_team), allEnemyAlivePlayers, 0, 0);
	a_enemies_in_range = Array::get_all_closest(predicted_pos, allEnemyAlivePlayers, undefined, undefined, radius);
	if(!isdefined(a_enemies_in_range) || a_enemies_in_range.size <= 0)
	{
		return;
	}
	foreach(enemy in a_enemies_in_range)
	{
		if(!isdefined(enemy))
		{
			continue;
		}
		range_sq = DistanceSquared(enemy.origin, predicted_pos);
		radius_sq = radius * radius;
		if(range_sq > radius_sq)
		{
			continue;
		}
		WaitInQueue(level.var_b3e9e243);
		if(isdefined(enemy) && isalive(enemy))
		{
			if(zm::get_round_number() >= 40)
			{
				enemy DoDamage(30000, predicted_pos, player, player, "helmat", "MOD_MELEE", 0, GetWeapon("elmg_katana_upgraded"));
				if(enemy.health <= 0 && !isalive(enemy))
				{
					if(!isVehicle(enemy))
					{
						enemy notsolid();
						enemy PushPlayer(0);
						n_random_x = RandomFloatRange(-3, 3);
						n_random_y = RandomFloatRange(-3, 3);
						enemy StartRagdoll(1);
						enemy LaunchRagdoll(100 * VectorNormalize(player.origin - player.origin + (n_random_x, n_random_y, 100)), "torso_lower");
					}
					player playlocalsound("fly_melee_lunge_player_katana");
					player playsoundtoallbutplayer("fly_melee_lunge_katana", player);
					if(isdefined(player.var_32385571) && player.var_32385571 == 0)
					{
						player.var_553ee0da++;
						continue;
					}
				}
			}
			if(!isVehicle(enemy))
			{
				enemy PushPlayer(0);
				enemy notsolid();
			}
			enemy DoDamage(enemy.health + 666, predicted_pos, player, player, "helmat", "MOD_MELEE", 0, GetWeapon("elmg_katana_upgraded"));
			if(isalive(enemy) && enemy getvelocity() != 0 && !isVehicle(enemy))
			{
				enemy kill();
			}
			if(enemy.health <= 0)
			{
				if(!isVehicle(enemy))
				{
					n_random_x = RandomFloatRange(-3, 3);
					n_random_y = RandomFloatRange(-3, 3);
					enemy StartRagdoll(1);
					enemy LaunchRagdoll(100 * VectorNormalize(player.origin - player.origin + (n_random_x, n_random_y, 100)), "torso_lower");
				}
				player playlocalsound("fly_melee_lunge_player_katana");
				player playsoundtoallbutplayer("fly_melee_lunge_katana", player);
				if(isdefined(player.var_32385571) && player.var_32385571 == 0)
				{
					player.var_553ee0da++;
				}
			}
		}
	}
	util::wait_network_frame();
	return;
	ERROR: Bad function call
}

/*
	Name: gib_zombies_head
	Namespace: Katana
	Checksum: 0x424F4353
	Offset: 0x1368
	Size: 0x84
	Parameters: 1
	Flags: None
	Line Number: 359
*/
function gib_zombies_head(player)
{
	player endon("disconnect");
	self endon("death");
	self zombie_utility::zombie_head_gib(self);
	GibServerUtils::GibRightLeg(self);
	if(!GibServerUtils::IsGibbed(self, 16))
	{
		GibServerUtils::GibLeftArm(self);
	}
}

