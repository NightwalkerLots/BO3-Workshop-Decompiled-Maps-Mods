#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_perks;

#namespace zm_playerhealth;

/*
	Name: __init__sytem__
	Namespace: zm_playerhealth
	Checksum: 0xA04B4A0A
	Offset: 0x2E8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_playerhealth", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_playerhealth
	Checksum: 0x9EC875BB
	Offset: 0x328
	Size: 0x2F0
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	clientfield::register("toplayer", "sndZombieHealth", 21000, 1, "int");
	level.global_damage_func_ads = &empty_kill_func;
	level.global_damage_func = &empty_kill_func;
	level.difficultyType[0] = "easy";
	level.difficultyType[1] = "normal";
	level.difficultyType[2] = "hardened";
	level.difficultyType[3] = "veteran";
	level.difficultyString["easy"] = &"GAMESKILL_EASY";
	level.difficultyString["normal"] = &"GAMESKILL_NORMAL";
	level.difficultyString["hardened"] = &"GAMESKILL_HARDENED";
	level.difficultyString["veteran"] = &"GAMESKILL_VETERAN";
	level.gameskill = 1;
	switch(level.gameskill)
	{
		case 0:
		{
			SetDvar("currentDifficulty", "easy");
			break;
		}
		case 1:
		{
			SetDvar("currentDifficulty", "normal");
			break;
		}
		case 2:
		{
			SetDvar("currentDifficulty", "hardened");
			break;
		}
		case 3:
		{
			SetDvar("currentDifficulty", "veteran");
			break;
		}
	}
	level.player_deathInvulnerableTime = 1700;
	level.healthOverlayCutoff = 0.2;
	level.invulTime_preShield = 0.35;
	level.invulTime_onShield = 0.5;
	level.invulTime_postShield = 0.3;
	level.worthyDamageRatio = 0.1;
	callback::on_spawned(&on_player_spawned);
	if(!isdefined(level.vsmgr_prio_overlay_zm_player_health_blur))
	{
		level.vsmgr_prio_overlay_zm_player_health_blur = 22;
	}
	visionset_mgr::register_info("overlay", "zm_health_blur", 1, level.vsmgr_prio_overlay_zm_player_health_blur, 1, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: on_player_spawned
	Namespace: zm_playerhealth
	Checksum: 0xF181A32B
	Offset: 0x620
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 101
*/
function on_player_spawned()
{
	self.longRegenTime = 5000;
	self.playerHealth_RegularRegenDelay = 2400;
	self zm_perks::perk_set_max_health_if_jugg("health_reboot", 1, 0);
	self notify("noHealthOverlay");
	self thread playerHealthRegen();
}

/*
	Name: player_health_visionset
	Namespace: zm_playerhealth
	Checksum: 0xBFF0613B
	Offset: 0x688
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function player_health_visionset()
{
	visionset_mgr::deactivate("overlay", "zm_health_blur", self);
	visionset_mgr::activate("overlay", "zm_health_blur", self, 0, 1, 1);
}

/*
	Name: playerHurtcheck
	Namespace: zm_playerhealth
	Checksum: 0x63FD54F6
	Offset: 0x6E8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function playerHurtcheck()
{
	self endon("noHealthOverlay");
	self.hurtAgain = 0;
	for(;;)
	{
		self waittill("damage", amount, attacker, dir, point, mod);
		if(isdefined(attacker) && isPlayer(attacker) && attacker.team == self.team)
		{
		}
		else
		{
			self.hurtAgain = 1;
			self.damagePoint = point;
			self.damageAttacker = attacker;
		}
	}
}

/*
	Name: playerHealthRegen
	Namespace: zm_playerhealth
	Checksum: 0x58EA76BA
	Offset: 0x7C0
	Size: 0x668
	Parameters: 0
	Flags: None
	Line Number: 165
*/
function playerHealthRegen()
{
	self notify("playerHealthRegen");
	self endon("playerHealthRegen");
	self endon("death");
	self endon("disconnect");
	if(!isdefined(self.flag))
	{
		self.flag = [];
		self.flags_lock = [];
	}
	if(!isdefined(self.flag["player_has_red_flashing_overlay"]))
	{
		self flag::init("player_has_red_flashing_overlay");
		self flag::init("player_is_invulnerable");
	}
	self flag::clear("player_has_red_flashing_overlay");
	self flag::clear("player_is_invulnerable");
	self thread healthoverlay();
	oldratio = 1;
	health_add = 0;
	regenRate = 0.1;
	veryHurt = 0;
	playerJustGotRedFlashing = 0;
	invulTime = 0;
	hurtTime = 0;
	newHealth = 0;
	lastinvulratio = 1;
	self thread playerHurtcheck();
	if(!isdefined(self.veryHurt))
	{
		self.veryHurt = 0;
	}
	self.boltHit = 0;
	if(GetDvarString("scr_playerInvulTimeScale") == "")
	{
		SetDvar("scr_playerInvulTimeScale", 1);
	}
	playerInvulTimeScale = GetDvarFloat("scr_playerInvulTimeScale");
	for(;;)
	{
		wait(0.05);
		waittillframeend;
		if(self.health == self.maxhealth)
		{
			if(self flag::get("player_has_red_flashing_overlay"))
			{
				self clientfield::set_to_player("sndZombieHealth", 0);
				self flag::clear("player_has_red_flashing_overlay");
			}
			lastinvulratio = 1;
			playerJustGotRedFlashing = 0;
			veryHurt = 0;
		}
		else if(self.health <= 0)
		{
			return;
		}
		wasVeryHurt = veryHurt;
		health_ratio = self.health / self.maxhealth;
		if(health_ratio <= level.healthOverlayCutoff)
		{
			veryHurt = 1;
			if(!wasVeryHurt)
			{
				hurtTime = GetTime();
				self startfadingblur(3.6, 2);
				self clientfield::set_to_player("sndZombieHealth", 1);
				self flag::set("player_has_red_flashing_overlay");
				playerJustGotRedFlashing = 1;
			}
		}
		if(self.hurtAgain)
		{
			hurtTime = GetTime();
			self.hurtAgain = 0;
		}
		if(health_ratio >= oldratio)
		{
			if(GetTime() - hurtTime < self.playerHealth_RegularRegenDelay)
			{
			}
			else if(veryHurt)
			{
				self.veryHurt = 1;
				newHealth = health_ratio;
				if(GetTime() > hurtTime + self.longRegenTime)
				{
					newHealth = newHealth + regenRate;
				}
			}
			else
			{
				newHealth = 1;
				self.veryHurt = 0;
			}
			if(newHealth > 1)
			{
				newHealth = 1;
			}
			if(newHealth <= 0)
			{
				return;
			}
			self setnormalhealth(newHealth);
			oldratio = self.health / self.maxhealth;
		}
		else
		{
			invulWorthyHealthDrop = lastinvulratio - health_ratio > level.worthyDamageRatio;
			if(self.health <= 1)
			{
				self setnormalhealth(2 / self.maxhealth);
				invulWorthyHealthDrop = 1;
			}
			oldratio = self.health / self.maxhealth;
			level notify("hit_again");
			health_add = 0;
			hurtTime = GetTime();
			self startfadingblur(3, 0.8);
			if(!invulWorthyHealthDrop || playerInvulTimeScale <= 0)
			{
			}
			else if(self flag::get("player_is_invulnerable"))
			{
			}
			else
			{
				self flag::set("player_is_invulnerable");
				level notify("player_becoming_invulnerable");
				if(playerJustGotRedFlashing)
				{
					invulTime = level.invulTime_onShield;
					playerJustGotRedFlashing = 0;
				}
				else if(veryHurt)
				{
					invulTime = level.invulTime_postShield;
				}
				else
				{
					invulTime = level.invulTime_preShield;
				}
				invulTime = invulTime * playerInvulTimeScale;
				lastinvulratio = self.health / self.maxhealth;
				self thread playerInvul(invulTime);
			}
		}
	}
}

/*
	Name: playerInvul
	Namespace: zm_playerhealth
	Checksum: 0xA9C82429
	Offset: 0xE30
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 326
*/
function playerInvul(timer)
{
	self endon("death");
	self endon("disconnect");
	if(timer > 0)
	{
		wait(timer);
	}
	self flag::clear("player_is_invulnerable");
	return;
	ERROR: Bad function call
}

/*
	Name: healthoverlay
	Namespace: zm_playerhealth
	Checksum: 0xCA074D01
	Offset: 0xE90
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function healthoverlay()
{
	self endon("disconnect");
	self endon("noHealthOverlay");
	if(!isdefined(self._health_overlay))
	{
		self._health_overlay = newClientHudElem(self);
		self._health_overlay.x = 0;
		self._health_overlay.y = 0;
		self._health_overlay SetShader("overlay_low_health", 640, 480);
		self._health_overlay.alignX = "left";
		self._health_overlay.alignY = "top";
		self._health_overlay.horzAlign = "fullscreen";
		self._health_overlay.vertAlign = "fullscreen";
		self._health_overlay.alpha = 0;
	}
	overlay = self._health_overlay;
	self thread healthOverlay_remove(overlay);
	self thread watchHideRedFlashingOverlay(overlay);
	pulseTime = 0.8;
	while(overlay.alpha > 0)
	{
		overlay fadeOverTime(0.5);
		overlay.alpha = 0;
		self flag::wait_till("player_has_red_flashing_overlay");
		self redFlashingOverlay(overlay);
	}
}

/*
	Name: fadeFunc
	Namespace: zm_playerhealth
	Checksum: 0xE7345D9F
	Offset: 0x1078
	Size: 0x240
	Parameters: 4
	Flags: None
	Line Number: 388
*/
function fadeFunc(overlay, severity, mult, hud_scaleOnly)
{
	pulseTime = 0.8;
	scaleMin = 0.5;
	fadeInTime = pulseTime * 0.1;
	stayFullTime = pulseTime * 0.1 + severity * 0.2;
	fadeOutHalfTime = pulseTime * 0.1 + severity * 0.1;
	fadeOutFullTime = pulseTime * 0.3;
	remainingTime = pulseTime - fadeInTime - stayFullTime - fadeOutHalfTime - fadeOutFullTime;
	/#
		Assert(remainingTime >= -0.001);
	#/
	if(remainingTime < 0)
	{
		remainingTime = 0;
	}
	halfAlpha = 0.8 + severity * 0.1;
	leastAlpha = 0.5 + severity * 0.3;
	overlay fadeOverTime(fadeInTime);
	overlay.alpha = mult * 1;
	wait(fadeInTime + stayFullTime);
	overlay fadeOverTime(fadeOutHalfTime);
	overlay.alpha = mult * halfAlpha;
	wait(fadeOutHalfTime);
	overlay fadeOverTime(fadeOutFullTime);
	overlay.alpha = mult * leastAlpha;
	wait(fadeOutFullTime);
	wait(remainingTime);
}

/*
	Name: watchHideRedFlashingOverlay
	Namespace: zm_playerhealth
	Checksum: 0x9B4419CA
	Offset: 0x12C0
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 428
*/
function watchHideRedFlashingOverlay(overlay)
{
	self endon("death_or_disconnect");
	while(isdefined(overlay))
	{
		self waittill("clear_red_flashing_overlay");
		self clientfield::set_to_player("sndZombieHealth", 0);
		self flag::clear("player_has_red_flashing_overlay");
		overlay fadeOverTime(0.05);
		overlay.alpha = 0;
		self notify("hit_again");
	}
}

/*
	Name: redFlashingOverlay
	Namespace: zm_playerhealth
	Checksum: 0x632AEFDB
	Offset: 0x1378
	Size: 0x250
	Parameters: 1
	Flags: None
	Line Number: 452
*/
function redFlashingOverlay(overlay)
{
	self endon("hit_again");
	self endon("damage");
	self endon("death");
	self endon("disconnect");
	self endon("clear_red_flashing_overlay");
	self.stopFlashingBadlyTime = GetTime() + self.longRegenTime;
	if(!(isdefined(self.is_in_process_of_zombify) && self.is_in_process_of_zombify) && (!(isdefined(self.is_zombie) && self.is_zombie)))
	{
		fadeFunc(overlay, 1, 1, 0);
		while(GetTime() < self.stopFlashingBadlyTime && isalive(self) && (!(isdefined(self.is_in_process_of_zombify) && self.is_in_process_of_zombify) && (!(isdefined(self.is_zombie) && self.is_zombie))))
		{
			fadeFunc(overlay, 0.9, 1, 0);
		}
		if(!(isdefined(self.is_in_process_of_zombify) && self.is_in_process_of_zombify) && (!(isdefined(self.is_zombie) && self.is_zombie)))
		{
			if(isalive(self))
			{
				fadeFunc(overlay, 0.65, 0.8, 0);
			}
			fadeFunc(overlay, 0, 0.6, 1);
		}
	}
	overlay fadeOverTime(0.5);
	overlay.alpha = 0;
	self flag::clear("player_has_red_flashing_overlay");
	self clientfield::set_to_player("sndZombieHealth", 0);
	wait(0.5);
	self notify("hit_again");
}

/*
	Name: healthOverlay_remove
	Namespace: zm_playerhealth
	Checksum: 0x67B8A988
	Offset: 0x15D0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 494
*/
function healthOverlay_remove(overlay)
{
	self endon("disconnect");
	self util::waittill_any("noHealthOverlay", "death");
	overlay fadeOverTime(3.5);
	overlay.alpha = 0;
}

/*
	Name: empty_kill_func
	Namespace: zm_playerhealth
	Checksum: 0xDD28A95A
	Offset: 0x1648
	Size: 0x2C
	Parameters: 5
	Flags: None
	Line Number: 512
*/
function empty_kill_func(type, loc, point, attacker, amount)
{
}

