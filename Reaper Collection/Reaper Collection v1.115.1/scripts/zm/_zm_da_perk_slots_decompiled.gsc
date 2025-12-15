#include scripts\codescripts\struct;
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
#include scripts\shared\util_shared;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\zmsavedata;

#namespace namespace_8338be6c;

/*
	Name: __init__
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x1B40
	Size: 0x20
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec __init__()
{
	util::registerClientSys("setPerkHintstring");
	return;
}

/*
	Name: function_e87bcb3c
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x1B68
	Size: 0x998
	Parameters: 0
	Flags: None
	Line Number: 55
*/
function function_e87bcb3c()
{
	function_d8886dd("specialty_vulture", "Vulture-Aid", "Drink to increase your vision", "Drink to increase treasure amounts");
	function_d8886dd("specialty_armorvest", "Jugger-nog", "drink to increase health", "drink to further increase health");
	function_d8886dd("specialty_quickrevive", "Quick Revive", "Drink to recover health and revive faster", "drink to mover faster while healing");
	function_d8886dd("specialty_fastreload", "Speed Cola", "Drink to reload faster", "drink to do more damage after reloading");
	function_d8886dd("specialty_doubletap2", "Doubletap 2.0", "Drink to increase fire rate and bullet damage", "drink to further increase bullet damage");
	function_d8886dd("specialty_staminup", "Stamin-up", "Drink to run faster", "drink to shoot while sprinting and sprint forever");
	function_d8886dd("specialty_deadshot", "Deadshot Daquiri", "Drink to improve aiming down sights", "drink to gain additional critical damage");
	function_d8886dd("specialty_additionalprimaryweapon", "Mule Kick", "Drink to carry a third weapon", "drink to retrieve lost weapon upon re-purchase");
	function_d8886dd("specialty_electriccherry", "Electric Cherry", "Drink to create static shocks when reloading", "drink to increase static shocks power");
	function_d8886dd("specialty_widowswine", "Widows Wine", "Drink to have web grenades that slow enemies", "drink to have normal zombies drop web grenades");
	function_d8886dd("specialty_bandolier", "Bandolier Bandit", "Drink to increase ammo capacity", "Drink to refill stowed weapon clips over time");
	function_d8886dd("specialty_blazephase", "Blaze Phase", "Drink to be propelled by fire when crouched", "Drink to charge perk longer");
	function_d8886dd("specialty_dyingwish", "Dying Wish", "Drink to survive a fatal blow", "Drink to fill health after activation ends");
	function_d8886dd("specialty_razor", "Ethereal Razor", "Drink to increase knife damage and spread", "Drink to greatly increase melee damage");
	function_d8886dd("specialty_slider", "PhD Slider", "Drink to explode when sliding into enemies", "Drink to slide longer");
	function_d8886dd("specialty_stronghold", "Stone Cold Stronghold", "Drink to fortify yourself when standing still", "Drink to gain more armour and keep it longer");
	function_d8886dd("specialty_timeslip", "Timeslip", "Drink to speed up the box and pack-a-punch", "Drink to speed up special weapon charge time");
	function_d8886dd("specialty_victorious", "Victorious Tortoise", "Drink to fortify shield when used", "Drink to increase shield health");
	function_d8886dd("specialty_winterwail", "Winter's Wail", "Drink to freeze zombies when attacked", "Drink to increase charges and freeze time");
	function_d8886dd("specialty_zombshell", "Zombshell", "Drink to create zombie slowing explosions", "Drink to hide from zombies in the explosion");
	function_d8886dd("specialty_bloodwolf", "Blood Wolf Bite", "Drink to gain a friendly wolf when dealing damage", "Drink to make the wolf drop bonus powerups");
	function_d8886dd("specialty_changechews", "Change Chews", "Drink to gain elemental headshots", "Drink to increase elemental headshot effectiveness");
	function_d8886dd("specialty_bloodbullets", "Blood Bullets", "Drink to regenerate bullets", "Drink to sometime regen stowed weapon ammo");
	function_d8886dd("specialty_cashback", "Cashback Cocktail", "Drink to get small refunds on purchases", "Drink to increase refund amount");
	function_d8886dd("specialty_damnade", "Dam-A-Nade", "Drink to increase explosive damage", "Drink to further increase explosive damage");
	function_d8886dd("specialty_downersdelight", "Downers Delight", "Drink to have a fighting chance when downed", "Drink to bleedout longer");
	function_d8886dd("specialty_estatic", "Estatic Elixir", "Drink to shock zombies when sprinting", "Drink to increase stun time");
	function_d8886dd("specialty_inferno", "Inciner-Brandy", "Drink to obtain random incindiary rounds", "Drink to increase incindiary effectivness");
	function_d8886dd("specialty_magnet", "Magnet Margarita", "Drink to attract nearby powerups", "Drink to attract powerups faster");
	function_d8886dd("specialty_mh_mocha", "Miracle Hands Mocha", "Drink to change powerups at will", "Drink to turn spawned max ammos to free perks");
	function_d8886dd("specialty_nitrogen", "Nitrogen Cooled", "Drink to slow nearby zombies", "Drink to increase slowing range");
	function_d8886dd("specialty_nukacola", "Nuka Cola", "Drink to detinate nukes when downed", "Drink to sometimes find extra powerups when obtaining one");
	function_d8886dd("specialty_packbox", "Pack-A-Box", "Drink to find upgraded weapons in mystery box", "Drink to increase upgrade chances");
	function_d8886dd("specialty_point", "Point Crusher", "Drink to earn more points", "Drink to sometimes double extra points");
	function_d8886dd("specialty_swarmscotch", "Swarm Scotch", "Drink to summon swarms of insects", "Drink to start a plauge of insects");
	function_d8886dd("specialty_repairman", "Repairman Rum", "Drink to repair boards instantly with explosives", "Drink to make board repairs stronger");
	function_d8886dd("specialty_nobear", "No Bear Brew", "Drink to prevent the teddy bear in the box", "Drink to move the mystery box at will");
	function_d8886dd("specialty_momentum", "Momentum Mojito", "Drink to charge up a deadly sprint", "Drink to increase momentum charges");
	function_d8886dd("specialty_da_death_perception", "Death Perception", "Drink to see enemies through walls", "drink to increase perk range and see aditional objects");
	function_d8886dd("specialty_da_tombstone", "Tombstone Soda", "Drink to have a chance to revive yourself", "drink to keep perks when reviving yourself");
	function_d8886dd("specialty_elementalpop", "Elemental Pop", "Drink to make bullets trigger random Ammo Mods", "drink to increase random Ammo Mods frequency");
	function_d8886dd("specialty_da_phd_slider", "PHD Slider", "Drink to explode when sliding into enemies", "drink to explode on falling and increase slide speed");
	function_d8886dd("specialty_directionalfire", "Vigor Rush", "Drink to make your bullets explode", "drink to increase bullet explosion damage");
	function_d8886dd("specialty_ffyl", "Fighters Fizz", "Drink to revive yourself with zombie kills", "drink to keep this perk when self reviving");
	function_d8886dd("specialty_icu", "I.C.U.", "Drink to become invincible when doing actions", "drink to increase invincibility time");
	function_d8886dd("specialty_tactiquilla", "Tactiquilla Sangria", "Drink to regain fired ammunition and killstreak rewards", "drink to increase perk chances");
	function_d8886dd("specialty_milk", "Muscle Milk", "Drink to electrify your knife", "drink to increase knife electrical arc");
	function_d8886dd("specialty_banana", "Banana Colada", "Drink to create slipery goo when sliding", "drink to increase goo damage");
	function_d8886dd("specialty_bull_ice", "Bull Ice Blast", "Drink to slam with ice", "drink to increase ice damage");
	function_d8886dd("specialty_crusade", "Crusaders Ale", "Drink to repair your shield between rounds", "drink to sometimes heal your sheild when killing zombies");
	function_d8886dd("specialty_moonshine", "Madgaz Moonshine", "Drink to explode when sliding", "drink to explode more often");
}

/*
	Name: function_d8886dd
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2508
	Size: 0xC8
	Parameters: 4
	Flags: None
	Line Number: 120
*/
function function_d8886dd(perk, name, desc, var_9bfa9c1d)
{
	if(!isdefined(level.var_bc7fb67d))
	{
		level.var_bc7fb67d = [];
	}
	var_1b8baf13 = spawnstruct();
	var_1b8baf13.perk = perk;
	var_1b8baf13.name = name;
	var_1b8baf13.desc = desc;
	if(isdefined(var_9bfa9c1d))
	{
		var_1b8baf13.var_9bfa9c1d = var_9bfa9c1d;
	}
	level.var_bc7fb67d[perk] = var_1b8baf13;
	return;
}

/*
	Name: on_player_spawned
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x25D8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 148
*/
function on_player_spawned()
{
	self thread function_419629b("PerkCost", " ");
	self thread function_419629b("PerkDesc", " ");
	self thread function_419629b("PerkName", " ");
	self thread function_419629b("LowMoney", "false");
	self thread function_419629b("IsAction", "false");
}

/*
	Name: function_9ce4076a
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x26B0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 167
*/
function function_9ce4076a()
{
	while(1)
	{
		wait(1);
		IPrintLnBold(self zm_zonemgr::get_player_zone());
	}
}

/*
	Name: function_88ec2e7a
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x26F8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function function_88ec2e7a()
{
	wait(1);
	level flag::wait_till("start_zombie_round_logic");
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	if(vending_triggers.size > 0)
	{
		for(i = 0; i < vending_triggers.size; i++)
		{
			vending_triggers[i].var_d3265b99 = 1;
			vending_triggers[i] thread function_f5cf0b1b();
		}
	}
	wait(0.1);
}

/*
	Name: function_ecc1544c
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x27C8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 212
*/
function function_ecc1544c()
{
	wait(2);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("perks_cwprice") == 1)
	{
		level thread function_88ec2e7a();
		function_e87bcb3c();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f5cf0b1b
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2840
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 235
*/
function function_f5cf0b1b()
{
	if(self.script_noteworthy == "specialty_quickrevive" && zm_perks::use_solo_revive() && (!(isdefined(level.initial_quick_revive_power_off) && level.initial_quick_revive_power_off)))
	{
		self.var_da0e741b = 1;
	}
	else if(isdefined(self.power_on))
	{
		self.var_da0e741b = self.power_on;
	}
	else
	{
		self.var_da0e741b = 0;
	}
	self thread function_2c208276();
	self thread function_205062d2();
}

/*
	Name: function_2c208276
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2900
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 263
*/
function function_2c208276()
{
	level notify(self.script_noteworthy + "_remove_hintstring_power_watch");
	level endon(self.script_noteworthy + "_remove_hintstring_power_watch");
	s_custom_perk = level._custom_perks[self.script_noteworthy];
	var_fb1cd1b2 = undefined;
	if(isdefined(s_custom_perk.alias))
	{
		var_fb1cd1b2 = self.script_noteworthy + "_power_on";
	}
	str_off = undefined;
	if(isdefined(s_custom_perk.alias))
	{
		str_off = s_custom_perk.alias + "_off";
	}
	while(isdefined(self) && isdefined(var_fb1cd1b2) && isdefined(str_off))
	{
		result = level util::waittill_any_return(var_fb1cd1b2, str_off);
		if(result == var_fb1cd1b2)
		{
			self.var_da0e741b = 1;
		}
		else if(result == str_off)
		{
			self.var_da0e741b = 0;
		}
	}
}

/*
	Name: function_906edb1
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2A50
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 302
*/
function function_906edb1(ent)
{
	while(isdefined(self) && isdefined(ent))
	{
		if(ent.origin != self.origin)
		{
			self.origin = ent.origin;
			self.var_6aa7e01e = 1;
			self.var_c970ffc2 = 1;
		}
		else if(!isdefined(ent.var_c970ffc2) && isdefined(ent.var_6aa7e01e))
		{
			ent.var_6aa7e01e = undefined;
		}
		else if(isdefined(ent.var_c970ffc2))
		{
			ent.var_c970ffc2 = undefined;
		}
		wait(0.5);
	}
}

/*
	Name: function_205062d2
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2B30
	Size: 0x390
	Parameters: 0
	Flags: None
	Line Number: 334
*/
function function_205062d2()
{
	self endon("death");
	wait(2);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("perks_cwprice") == 0 || !isdefined(self))
	{
		return;
	}
	self SetTeamForTrigger("axis");
	perk = self.script_noteworthy;
	while(isdefined(self))
	{
		player = self get_closest_player();
		if(player function_6a42cf85(self))
		{
			if(!isdefined(player.var_c49b2ca1) && player.var_c49b2ca1 != self)
			{
				player thread function_5e9555de(perk, self, self);
			}
			if(player useButtonPressed())
			{
				cost = function_47cc0b1e(player, perk);
				var_2e32b5b2 = 0;
				if(namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !player namespace_851dc78f::function_b690a849(perk) && player namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && !player namespace_851dc78f::function_b690a849(perk) && player hasPerk(perk)))
				{
					var_2e32b5b2 = 1;
				}
				if(var_2e32b5b2 && isdefined(level.var_7280bfd8) && (isdefined(level.var_7280bfd8[perk] && isdefined(level.var_7280bfd8[perk].cost))))
				{
					player.var_bc1d8ed3 = cost;
				}
				else if(!var_2e32b5b2)
				{
					level._custom_perks[perk].cost = cost;
					self.cost = cost;
				}
				if(!player zm_score::can_player_purchase(cost))
				{
					self playsound("evt_perk_deny");
					player zm_audio::create_and_play_dialog("general", "outofmoney");
				}
				else
				{
					self notify("trigger", player);
				}
				while(player useButtonPressed())
				{
					wait(0.01);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: get_closest_player
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2EC8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 400
*/
function get_closest_player()
{
	players = GetPlayers();
	player = players[0];
	if(players.size > 1)
	{
		for(i = 1; i < players.size; i++)
		{
			if(DistanceSquared(players[i].origin, self.origin) < DistanceSquared(player.origin, self.origin))
			{
				player = players[i];
			}
		}
	}
	return player;
}

/*
	Name: function_5e9555de
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x2FA8
	Size: 0xC60
	Parameters: 3
	Flags: None
	Line Number: 427
*/
function function_5e9555de(perk, trig, var_9913e7c3)
{
	self endon("disconnect");
	var_9913e7c3 endon("death");
	trig endon("death");
	if(!self function_6a42cf85(var_9913e7c3, trig))
	{
		return;
	}
	has_perk = !namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk));
	var_d33df0ee = isdefined(level.var_7280bfd8[perk]) && self namespace_851dc78f::function_b690a849(perk) && 1;
	if(!var_9913e7c3.var_da0e741b)
	{
		self.var_c49b2ca1 = var_9913e7c3;
		self thread function_419629b("PerkCost", " ");
		self thread function_419629b("PerkDesc", " ");
		self thread function_419629b("PerkName", "YOU MUST TURN ON THE POWER FIRST!");
		self thread function_419629b("LowMoney", "false");
		self thread function_419629b("IsAction", "false");
		while(isdefined(trig) && isdefined(var_9913e7c3))
		{
			var_d2232c96 = util::within_fov(self GetEye(), self getPlayerAngles(), trig.origin, cos(40));
			if(!self istouching(trig) || !var_d2232c96)
			{
				break;
			}
			if(!self function_6a42cf85(var_9913e7c3, trig) || var_9913e7c3.var_da0e741b)
			{
				break;
			}
			wait(0.01);
		}
	}
	else if(self GetStance() == "crouch" && self function_679da569() == 0 && namespace_11e193f1::function_6dd41714("perks_refund") == 1 && has_perk)
	{
		cost = Int(function_47cc0b1e(self, perk) / 2);
		self.var_c49b2ca1 = var_9913e7c3;
		self thread function_419629b("PerkCost", cost);
		self thread function_419629b("PerkDesc", "Return perk and get back half your spent points");
		self thread function_419629b("PerkName", function_2f134368(perk));
		self thread function_419629b("IsAction", "true");
		self thread function_419629b("LowMoney", "false");
		var_1cc2dc7c = 0;
		while(isdefined(trig) && isdefined(var_9913e7c3) && (self GetStance() == "crouch" && self function_679da569() == 0 && namespace_11e193f1::function_6dd41714("perks_refund") == 1) && has_perk)
		{
			var_d2232c96 = util::within_fov(self GetEye(), self getPlayerAngles(), trig.origin, cos(40));
			if(!self istouching(trig) || !var_d2232c96)
			{
				break;
			}
			if(!self function_6a42cf85(var_9913e7c3, trig))
			{
				break;
			}
			wait(0.01);
		}
	}
	else if(self.num_perks >= self zm_utility::get_player_perk_purchase_limit() && !has_perk)
	{
		cost = Int(function_47cc0b1e(self, perk) / 2);
		self.var_c49b2ca1 = var_9913e7c3;
		self thread function_419629b("PerkCost", cost);
		self thread function_419629b("PerkDesc", "Return perk and get back half your spent points");
		self thread function_419629b("PerkName", function_2f134368(perk));
		self thread function_419629b("IsAction", "true");
		self thread function_419629b("LowMoney", "NOT ENOUGH PERK SLOTS! YOU ONLY HAVE " + self zm_utility::get_player_perk_purchase_limit());
		var_1cc2dc7c = 0;
		while(isdefined(trig) && isdefined(var_9913e7c3) && (!(self GetStance() == "crouch" && self function_679da569() == 0 && namespace_11e193f1::function_6dd41714("perks_refund") == 1)) && self.num_perks >= self zm_utility::get_player_perk_purchase_limit() && !has_perk)
		{
			var_d2232c96 = util::within_fov(self GetEye(), self getPlayerAngles(), trig.origin, cos(40));
			if(!self istouching(trig) || !var_d2232c96)
			{
				break;
			}
			if(!self function_6a42cf85(var_9913e7c3, trig))
			{
				break;
			}
			wait(0.01);
		}
	}
	else if(self.num_perks < self zm_utility::get_player_perk_purchase_limit() && !has_perk || (has_perk && !var_d33df0ee))
	{
		cost = function_47cc0b1e(self, perk);
		self.var_c49b2ca1 = var_9913e7c3;
		self thread function_419629b("PerkCost", cost);
		self thread function_419629b("PerkDesc", function_b9d24caa(self, perk));
		self thread function_419629b("PerkName", function_2f134368(perk));
		self thread function_419629b("IsAction", "true");
		var_1cc2dc7c = 0;
		if(self.score < cost)
		{
			var_1cc2dc7c = 1;
			self thread function_419629b("LowMoney", "NOT ENOUGH POINTS!");
		}
		else
		{
			self thread function_419629b("LowMoney", "false");
		}
		while(isdefined(trig) && isdefined(var_9913e7c3) && (!(self GetStance() == "crouch" && self function_679da569() == 0 && namespace_11e193f1::function_6dd41714("perks_refund") == 1)) && (!has_perk || (has_perk && !var_d33df0ee)))
		{
			var_d2232c96 = util::within_fov(self GetEye(), self getPlayerAngles(), trig.origin, cos(40));
			if(!self istouching(trig) || !var_d2232c96)
			{
				break;
			}
			cost = function_47cc0b1e(self, perk);
			if(var_1cc2dc7c && self.score >= cost)
			{
				self thread function_419629b("LowMoney", "false");
				var_1cc2dc7c = 0;
			}
			if(!self function_6a42cf85(var_9913e7c3, trig))
			{
				break;
			}
			wait(0.01);
		}
	}
	else if(isdefined(self.var_c49b2ca1) && self.var_c49b2ca1 == var_9913e7c3)
	{
		self thread function_419629b("PerkCost", " ");
		self thread function_419629b("PerkDesc", " ");
		self thread function_419629b("PerkName", " ");
		self thread function_419629b("LowMoney", "false");
		self thread function_419629b("IsAction", "false");
		self.var_c49b2ca1 = undefined;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_419629b
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x3C10
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 569
*/
function function_419629b(var_8b238bdd, var_7f934261)
{
	if(self.sessionstate == "spectator")
	{
		return;
	}
	if(!isdefined(var_8b238bdd) || !isdefined(var_7f934261))
	{
		return;
	}
	var_a729f6a6 = var_8b238bdd;
	var_a729f6a6 = var_a729f6a6 + "|" + var_7f934261;
	self util::setClientSysState("setPerkHintstring", var_a729f6a6, self);
}

/*
	Name: function_47cc0b1e
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x3CB0
	Size: 0x278
	Parameters: 2
	Flags: None
	Line Number: 594
*/
function function_47cc0b1e(player, perk)
{
	cost = 0;
	if(namespace_851dc78f::function_a7c76532(perk) && !player namespace_851dc78f::function_b690a849(perk) && (isdefined(1) && 1) && (namespace_851dc78f::function_20dc5a15(perk) && player namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && player hasPerk(perk))))
	{
		cost = 1000;
		var_9d698e61 = 0;
		if(!isdefined(player.var_d6aef449))
		{
			player.var_d6aef449 = [];
		}
		var_9d698e61 = player.var_d6aef449.size;
		cost = cost + 500 * var_9d698e61;
		if(0 && cost > 0)
		{
			cost = 0;
		}
	}
	else if(namespace_851dc78f::function_20dc5a15(perk) && !player namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && !player hasPerk(perk)))
	{
		if(perk == "specialty_quickrevive" && zm_perks::use_solo_revive())
		{
			return 500;
		}
		cost = 2500;
		if(!isdefined(player.num_perks))
		{
			player.num_perks = 0;
		}
		cost = cost + 500 * player.num_perks;
		if(0 && cost > 0)
		{
			cost = 0;
		}
	}
	return cost;
}

/*
	Name: function_b9d24caa
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x3F30
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 642
*/
function function_b9d24caa(player, perk)
{
	desc = perk + "  desc not set";
	if(namespace_851dc78f::function_20dc5a15(perk) && !player namespace_851dc78f::function_5f9a13b3(perk) || (!namespace_851dc78f::function_20dc5a15(perk) && !player hasPerk(perk)))
	{
		if(isdefined(level.var_bc7fb67d) && isdefined(level.var_bc7fb67d[perk]) && isdefined(level.var_bc7fb67d[perk].desc))
		{
			desc = level.var_bc7fb67d[perk].desc;
		}
	}
	else if(namespace_851dc78f::function_a7c76532(perk) && !player namespace_851dc78f::function_b690a849(perk) && (isdefined(1) && 1))
	{
		if(isdefined(level.var_bc7fb67d) && isdefined(level.var_bc7fb67d[perk]) && isdefined(level.var_bc7fb67d[perk].var_9bfa9c1d))
		{
			desc = level.var_bc7fb67d[perk].var_9bfa9c1d;
		}
	}
	return desc;
}

/*
	Name: function_2f134368
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x40E0
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 672
*/
function function_2f134368(perk)
{
	name = perk + "  name not set";
	if(isdefined(level.var_bc7fb67d) && isdefined(level.var_bc7fb67d[perk]) && isdefined(level.var_bc7fb67d[perk].name))
	{
		name = level.var_bc7fb67d[perk].name;
	}
	return name;
}

/*
	Name: function_6a42cf85
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x4170
	Size: 0x1B0
	Parameters: 2
	Flags: None
	Line Number: 692
*/
function function_6a42cf85(trig, var_dc99dbbc)
{
	var_d2232c96 = util::within_fov(self GetEye(), self getPlayerAngles(), trig.origin, cos(40));
	if(!self istouching(trig) || !var_d2232c96)
	{
		return 0;
	}
	perk = trig.script_noteworthy;
	if(!zm_utility::is_player_valid(self))
	{
		return 0;
	}
	if(!zm_perks::vending_trigger_can_player_use(self))
	{
		return 0;
	}
	var_d2232c96 = util::within_fov(self GetEye(), self getPlayerAngles(), trig.origin, cos(40));
	if(!var_d2232c96)
	{
		return 0;
	}
	if(isdefined(trig.machine) && trig.machine ishidden())
	{
		return 0;
	}
	if(isdefined(trig.var_6aa7e01e))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_42dc6a57
	Namespace: namespace_8338be6c
	Checksum: 0x424F4353
	Offset: 0x4328
	Size: 0x15E
	Parameters: 1
	Flags: None
	Line Number: 734
*/
function function_42dc6a57(perk)
{
	if(namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && self namespace_851dc78f::function_b690a849(perk))
	{
		return 1;
	}
	if(namespace_851dc78f::function_20dc5a15(perk) && !namespace_851dc78f::function_a7c76532(perk) && self namespace_851dc78f::function_5f9a13b3(perk))
	{
		return 1;
	}
	if(!namespace_851dc78f::function_20dc5a15(perk) && !namespace_851dc78f::function_a7c76532(perk) && self hasPerk(perk))
	{
		return 1;
	}
	if(!namespace_851dc78f::function_20dc5a15(perk) && namespace_851dc78f::function_a7c76532(perk) && self namespace_851dc78f::function_b690a849(perk))
	{
		return 1;
	}
	return 0;
}

