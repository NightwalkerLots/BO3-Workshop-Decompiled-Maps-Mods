#include scripts\shared\bots\_bot;
#include scripts\shared\bots\_bot_combat;
#include scripts\zm\_zm;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\bots\_bot;
#include scripts\zm\bots\_bot_combat;

#namespace namespace_fae32d79;

/*
	Name: wallbuy
	Namespace: namespace_fae32d79
	Checksum: 0x424F4353
	Offset: 0x230
	Size: 0x3F0
	Parameters: 0
	Flags: None
	Line Number: 25
*/
function wallbuy()
{
	if(!self zm_magicbox::can_buy_weapon() || GetDvarInt("tfoption_gungame"))
	{
		return 0;
	}
	currentWeapon = self GetCurrentWeapon().rootweapon;
	var_f2d35ce6 = zm_weapons::get_weapon_cost(currentWeapon);
	Wallbuys = ArraySortClosest(level._spawned_wallbuys, self.origin, undefined, undefined, 1000);
	var_f9f595f0 = [];
	foreach(wallbuy in Wallbuys)
	{
		trace = beamtrace(self GetEye(), wallbuy.origin, 0, self, 1);
		if(Distance(trace["position"], wallbuy.origin) < 4)
		{
			if(wallbuy zm::in_enabled_playable_area())
			{
				var_15dc33e9 = zm_weapons::get_weapon_cost(wallbuy.weapon);
				if(var_15dc33e9 > var_f2d35ce6)
				{
					if(self zm_score::can_player_purchase(var_15dc33e9) && !self zm_weapons::has_weapon_or_upgrade(wallbuy.weapon))
					{
						weaponName = wallbuy.weapon.name;
						if(!IsSubStr(weaponName, "knife") && !IsSubStr(weaponName, "melee"))
						{
							var_f9f595f0[var_f9f595f0.size] = wallbuy;
						}
					}
				}
			}
		}
	}
	if(var_f9f595f0.size)
	{
		var_28963a91 = ArrayGetClosest(self.origin, var_f9f595f0, 1000);
	}
	else
	{
		return 0;
	}
	if(isdefined(var_28963a91))
	{
		if(isdefined(level._unitriggers.trigger_pool[self.entity_num]) && var_28963a91.trigger_stub.origin === level._unitriggers.trigger_pool[self.entity_num].origin)
		{
			self.bot.var_660cc448 = level._unitriggers.trigger_pool[self.entity_num];
		}
		else
		{
			self.bot.var_660cc448 = var_28963a91.trigger_stub;
		}
		self bot::approach_goal_trigger(self.bot.var_660cc448);
		return 1;
	}
	return 0;
}

/*
	Name: perk
	Namespace: namespace_fae32d79
	Checksum: 0x424F4353
	Offset: 0x628
	Size: 0x2E0
	Parameters: 0
	Flags: None
	Line Number: 91
*/
function perk()
{
	vending_triggers = ArraySortClosest(level.var_4d47e29b, self.origin, undefined, undefined, 1000);
	var_2e915766 = [];
	var_f8c41683 = [];
	for(i = 0; i < vending_triggers.size; i++)
	{
		var_807754d1 = vending_triggers[i];
		perk_machine = var_807754d1.machine;
		if(isdefined(var_807754d1.power_on) && var_807754d1.power_on && !perk_machine ishidden())
		{
			if(!self hasPerk(var_807754d1.script_noteworthy))
			{
				if(self zm_score::can_player_purchase(level._custom_perks[var_807754d1.script_noteworthy].cost))
				{
					origin = perk_machine.origin + AnglesToRight(perk_machine.angles) * 30;
					origin = beamtrace(origin + VectorScale((0, 0, 1), 40), origin - VectorScale((0, 0, 1), 100), 0, self)["position"];
					if(self CanPath(self.origin, origin))
					{
						var_2e915766[var_2e915766.size] = var_807754d1;
						var_f8c41683[var_f8c41683.size] = origin;
					}
				}
			}
		}
	}
	if(var_2e915766.size)
	{
		var_f72e7b31 = ArrayGetClosest(self.origin, var_2e915766, 1000);
		var_3f5f5ac8 = ArrayGetClosest(self.origin, var_f8c41683, 1000);
	}
	else
	{
		return 0;
	}
	if(isdefined(var_f72e7b31))
	{
		self.bot.var_660cc448 = var_f72e7b31;
		self BotSetGoal(var_3f5f5ac8);
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: doors
	Namespace: namespace_fae32d79
	Checksum: 0x424F4353
	Offset: 0x910
	Size: 0x58C
	Parameters: 0
	Flags: None
	Line Number: 146
*/
function doors()
{
	zombie_doors = ArraySortClosest(level.var_4c2810e7, self.origin, undefined, undefined, 1000);
	var_8016e1ce = [];
	var_2ed13b2b = [];
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(isdefined(zombie_doors[i].script_noteworthy) && (zombie_doors[i].script_noteworthy == "electric_door" || zombie_doors[i].script_noteworthy == "electric_buyable_door" || zombie_doors[i].script_noteworthy == "local_electric_door" || zombie_doors[i].script_noteworthy == "kill_counter_door"))
		{
			continue;
		}
		if(!isdefined(zombie_doors[i].purchaser) && (!(isdefined(zombie_doors[i]._door_open) && zombie_doors[i]._door_open)))
		{
			if(isdefined(zombie_doors[i].zombie_cost) && zombie_doors[i].zombie_cost)
			{
				if(self zm_score::can_player_purchase(zombie_doors[i].zombie_cost))
				{
					var_117b0b16 = 0;
					if(isdefined(level.var_7e0a3e49) && level.var_7e0a3e49.size)
					{
						origin = ArrayGetClosest(zombie_doors[i].origin, level.var_7e0a3e49);
						if(Distance(origin, zombie_doors[i].origin) < 100)
						{
							origin = zombie_doors[i].origin + AnglesToForward(VectorToAngles(zombie_doors[i].origin - self.origin)) * bot::get_trigger_radius(zombie_doors[i]) - 0.1 * -1;
							origin = beamtrace(origin + VectorScale((0, 0, 1), 40), origin - VectorScale((0, 0, 1), 100), 0, self)["position"];
							if(self CanPath(self.origin, origin))
							{
								var_8016e1ce[var_8016e1ce.size] = zombie_doors[i];
								var_2ed13b2b[var_2ed13b2b.size] = origin;
								var_117b0b16 = 1;
							}
						}
					}
					if(isdefined(zombie_doors[i].var_6dcd55d2) && zombie_doors[i].var_6dcd55d2 && !var_117b0b16)
					{
						origin = zombie_doors[i].origin + AnglesToForward(VectorToAngles(zombie_doors[i].origin - self.origin)) * bot::get_trigger_radius(zombie_doors[i]) - 0.1 * -1;
						origin = beamtrace(origin + VectorScale((0, 0, 1), 40), origin - VectorScale((0, 0, 1), 100), 0, self)["position"];
						if(self CanPath(self.origin, origin))
						{
							var_8016e1ce[var_8016e1ce.size] = zombie_doors[i];
							var_2ed13b2b[var_2ed13b2b.size] = origin;
							var_117b0b16 = 1;
						}
					}
				}
			}
		}
	}
	if(var_8016e1ce.size)
	{
		var_c208d4bb = ArrayGetClosest(self.origin, var_8016e1ce, 1000);
		var_12c7ed9e = ArrayGetClosest(self.origin, var_2ed13b2b, 1000);
	}
	else
	{
		return 0;
	}
	if(isdefined(var_c208d4bb))
	{
		self.bot.var_660cc448 = var_c208d4bb;
		self BotSetGoal(var_12c7ed9e);
		return 1;
	}
	return 0;
}

