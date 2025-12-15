#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\zmperkoverlaystyles;

#namespace namespace_851dc78f;

/*
	Name: __init__sytem__
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x540
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 31
*/
function autoexec __init__sytem__()
{
	system::register("zm_reap_common", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x588
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 46
*/
function __init__()
{
	clientfield::register("actor", "reap_clientfield_actor", 21000, 1, "int");
	clientfield::register("scriptmover", "reap_clientfield_scriptmover", 21000, 1, "int");
	clientfield::register("allplayers", "reap_clientfield_allplayers", 21000, 1, "int");
	callback::on_connect(&function_4b9c190f);
}

/*
	Name: __main__
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x648
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function __main__()
{
	util::registerClientSys("clientfield_bypass_sys");
	level.bgb["zm_bgb_head_drama"].var_205ab425 = &function_a3a32da0;
	level.bgb["zm_bgb_head_drama"].var_f6f70764 = &function_1c331923;
	level.bgb["zm_bgb_firing_on_all_cylinders"].var_205ab425 = &function_a3176c67;
	level.bgb["zm_bgb_firing_on_all_cylinders"].var_f6f70764 = &function_40972972;
	level.bgb["zm_bgb_flavor_hexed"].limit = &function_433274b5;
	level.bgb["zm_bgb_soda_fountain"].limit = &function_ee27c880;
	level thread function_5a4dc5ed();
	return;
}

/*
	Name: function_5a4dc5ed
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x778
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 87
*/
function function_5a4dc5ed()
{
	if(!isdefined(level.var_bb7977f0))
	{
		level.var_bb7977f0 = [];
	}
	while(1)
	{
		if(level.var_bb7977f0.size > 0)
		{
			for(i = 0; i < level.var_bb7977f0.size; i++)
			{
				[[level.var_bb7977f0[i]]]();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_4b9c190f
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 116
*/
function function_4b9c190f()
{
	if(!isdefined(self.var_49e79448))
	{
		self.var_49e79448 = [];
	}
	while(1)
	{
		if(self.var_49e79448.size > 0)
		{
			for(i = 0; i < self.var_49e79448.size; i++)
			{
				[[self.var_49e79448[i]]]();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_4621bbdd
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x198
	Parameters: 4
	Flags: None
	Line Number: 145
*/
function function_4621bbdd(var_bdf4e682, var_556ead4f, VAL, player)
{
	if(!isdefined(player))
	{
		player = undefined;
	}
	if(!isdefined(var_556ead4f))
	{
		return;
	}
	if(isdefined(player))
	{
		util::setClientSysState("clientfield_bypass_sys", var_bdf4e682 + "|" + var_556ead4f, player);
	}
	else
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			util::setClientSysState("clientfield_bypass_sys", var_bdf4e682 + "|" + var_556ead4f, players[i]);
		}
	}
	if(var_bdf4e682 == "actor")
	{
		self clientfield::set("reap_clientfield_actor", VAL);
	}
	if(var_bdf4e682 == "scriptmover")
	{
		self clientfield::set("reap_clientfield_scriptmover", VAL);
	}
	if(var_bdf4e682 == "allplayers")
	{
		self clientfield::set("reap_clientfield_allplayers", VAL);
		return;
	}
}

/*
	Name: function_cc14aa10
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 192
*/
function function_cc14aa10()
{
	if(!isdefined(self.var_f6a7e85c))
	{
		self.var_f6a7e85c = 0;
	}
	self.var_f6a7e85c++;
	if(self.var_f6a7e85c > 0)
	{
		self setPerk("specialty_unlimitedsprint");
	}
}

/*
	Name: function_35de86ea
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 215
*/
function function_35de86ea()
{
	if(isdefined(self.var_f6a7e85c))
	{
		self.var_f6a7e85c--;
	}
	if(self.var_f6a7e85c < 1)
	{
		self unsetPerk("specialty_unlimitedsprint");
		self.var_f6a7e85c = undefined;
	}
}

/*
	Name: function_c186fc64
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xAD8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 238
*/
function function_c186fc64()
{
	if(isdefined(self.var_f6a7e85c) && self.var_f6a7e85c > 0)
	{
		self setPerk("specialty_unlimitedsprint");
	}
	else
	{
		self unsetPerk("specialty_unlimitedsprint");
	}
}

/*
	Name: function_370b3bc
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xB40
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 260
*/
function function_370b3bc()
{
	if(!isdefined(self.var_42068718))
	{
		self.var_42068718 = 0;
	}
	self.var_42068718++;
	if(self.var_42068718 > 0)
	{
		self setPerk("specialty_sprintfire");
	}
}

/*
	Name: function_5cef184e
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xB98
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 283
*/
function function_5cef184e()
{
	if(isdefined(self.var_42068718))
	{
		self.var_42068718--;
		if(self.var_42068718 < 1)
		{
			self unsetPerk("specialty_sprintfire");
			self.var_42068718 = undefined;
		}
	}
}

/*
	Name: function_1cbcb2b0
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 306
*/
function function_1cbcb2b0()
{
	if(isdefined(self.var_42068718) && self.var_42068718 > 0)
	{
		self setPerk("specialty_sprintfire");
	}
	else
	{
		self unsetPerk("specialty_sprintfire");
		return;
	}
}

/*
	Name: function_531df54d
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xC58
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 329
*/
function function_531df54d()
{
	if(!isdefined(self.var_6c922501))
	{
		self.var_6c922501 = 0;
	}
	self.var_6c922501++;
	if(self.var_6c922501 > 0)
	{
		self setPerk("specialty_locdamagecountsasheadshot");
	}
}

/*
	Name: function_f1d27cdf
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xCB0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 352
*/
function function_f1d27cdf()
{
	if(isdefined(self.var_6c922501))
	{
		self.var_6c922501--;
		if(self.var_6c922501 < 1)
		{
			self unsetPerk("specialty_locdamagecountsasheadshot");
			self.var_6c922501 = undefined;
			return;
		}
	}
	ERROR: Bad function call
}

/*
	Name: function_33482659
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xD08
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 377
*/
function function_33482659()
{
	if(isdefined(self.var_6c922501) && self.var_6c922501 > 0)
	{
		self setPerk("specialty_locdamagecountsasheadshot");
	}
	else
	{
		self unsetPerk("specialty_locdamagecountsasheadshot");
	}
}

/*
	Name: function_42a4014f
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 399
*/
function function_42a4014f(speed_count)
{
	if(!isdefined(self.var_6289c47b))
	{
		self.var_6289c47b = 0;
	}
	self.var_6289c47b = self.var_6289c47b + speed_count;
	self setMoveSpeedScale(1 + self.var_6289c47b);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7647c83d
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xDD8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 421
*/
function function_7647c83d(speed_count)
{
	if(!isdefined(self.var_6289c47b))
	{
		self.var_6289c47b = 0;
	}
	self.var_6289c47b = self.var_6289c47b - speed_count;
	self setMoveSpeedScale(1 + self.var_6289c47b);
}

/*
	Name: function_3b53d28b
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xE40
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 441
*/
function function_3b53d28b()
{
	if(isdefined(self.var_6289c47b))
	{
		self setMoveSpeedScale(1 + self.var_6289c47b);
	}
	else
	{
		self setMoveSpeedScale(1);
	}
}

/*
	Name: function_a3a32da0
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xEA0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function function_a3a32da0()
{
	self function_531df54d();
}

/*
	Name: function_1c331923
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xEC8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 478
*/
function function_1c331923()
{
	self function_f1d27cdf();
}

/*
	Name: function_a3176c67
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xEF0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 493
*/
function function_a3176c67()
{
	self thread function_370b3bc();
}

/*
	Name: function_40972972
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xF18
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 508
*/
function function_40972972()
{
	self thread function_5cef184e();
}

/*
	Name: function_433274b5
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0xF40
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 523
*/
function function_433274b5()
{
	self endon("death");
	self endon("disconnect");
	var_64f78d71 = [];
	var_6f4c7b0f = self getbubblegumpack();
	for(i = 0; i < var_6f4c7b0f.size; i++)
	{
		var_64f78d71[var_64f78d71.size] = var_6f4c7b0f[i];
	}
	var_76019f97 = function_9b84d8c6(RandomInt(3) + 1, var_64f78d71);
	var_64f78d71[var_64f78d71.size] = var_76019f97;
	var_3fa305c = function_9b84d8c6(RandomInt(3) + 1, var_64f78d71);
	self thread function_3dffba63(var_76019f97, var_3fa305c);
}

/*
	Name: function_3dffba63
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1080
	Size: 0xE0
	Parameters: 2
	Flags: None
	Line Number: 549
*/
function function_3dffba63(var_76019f97, var_3fa305c)
{
	self endon("death");
	self endon("disconnect");
	wait(3);
	self bgb::give(var_76019f97.name);
	while(isdefined(self.bgb) && self.bgb == var_76019f97.name)
	{
		wait(0.1);
	}
	wait(3);
	if(!isdefined(self.bgb) || (isdefined(self.bgb) && self.bgb == "none"))
	{
		self bgb::give(var_3fa305c.name);
		return;
	}
	~;
}

/*
	Name: function_ee27c880
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1168
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 578
*/
function function_ee27c880()
{
	self endon("disconnect");
	self endon("hash_994d5e9e");
	self.var_76382430 = 5;
	while(self.var_76382430 > 0)
	{
		self waittill("perk_purchased", str_perk);
		self bgb::do_one_shot_use();
		a_str_perks = getArrayKeys(level._custom_perks);
		if(IsInArray(a_str_perks, str_perk))
		{
			ArrayRemoveValue(a_str_perks, str_perk);
		}
		a_str_perks = Array::randomize(a_str_perks);
		for(i = 0; i < a_str_perks.size; i++)
		{
			if(!function_20dc5a15(a_str_perks[i]) && !self hasPerk(a_str_perks[i]) || (function_20dc5a15(a_str_perks[i]) && !self function_5f9a13b3(a_str_perks[i])))
			{
				self zm_perks::give_perk(a_str_perks[i], 0);
				break;
			}
		}
		self.var_76382430--;
		self bgb::set_timer(self.var_76382430, 5);
	}
}

/*
	Name: function_8d654c9c
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1350
	Size: 0x3A8
	Parameters: 0
	Flags: None
	Line Number: 616
*/
function function_8d654c9c()
{
	self endon("disconnect");
	while(!self function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	current_weapon = self GetCurrentWeapon();
	current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
	if(self zm_weapons::can_upgrade_weapon(current_weapon))
	{
		b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
		upgrade_weapon = zm_weapons::get_upgrade_weapon(current_weapon, b_weapon_supports_aat);
		current_weapon = self getbuildkitweapon(current_weapon, 0);
		upgrade_weapon = self getbuildkitweapon(upgrade_weapon, 1);
		current_weapon_options = self getbuildkitweaponoptions(current_weapon);
		current_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(current_weapon, 0);
		pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index();
		upgrade_weapon_options = self getbuildkitweaponoptions(upgrade_weapon, pap_camo_to_use);
		upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(upgrade_weapon, 1);
		weapon_limit = zm_utility::get_player_weapon_limit(self);
		Primaries = self getweaponslistprimaries();
		if(isdefined(Primaries) && Primaries.size >= weapon_limit)
		{
			upgrade_weapon = self zm_weapons::weapon_give(upgrade_weapon);
		}
		else
		{
			self TakeWeapon(current_weapon);
			upgrade_weapon = self zm_weapons::give_build_kit_weapon(upgrade_weapon);
			self GiveStartAmmo(upgrade_weapon);
		}
		self notify("weapon_give", upgrade_weapon);
		aatID = -1;
		if(isdefined(b_weapon_supports_aat) && b_weapon_supports_aat)
		{
			self thread AAT::acquire(upgrade_weapon);
			aatObj = self AAT::getAATOnWeapon(upgrade_weapon);
			if(isdefined(aatObj))
			{
				aatID = aatObj.hash_id;
			}
		}
		else
		{
			self thread AAT::remove(upgrade_weapon);
		}
		self SwitchToWeapon(upgrade_weapon);
		self zm_weapons::play_weapon_vo(upgrade_weapon);
		wait(0.1);
	}
	self.var_97c73248 = undefined;
	return;
}

/*
	Name: givegobblegum
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1700
	Size: 0x300
	Parameters: 3
	Flags: None
	Line Number: 682
*/
function givegobblegum(var_33636f4a, play_anim, type)
{
	if(!isdefined(play_anim))
	{
		play_anim = 1;
	}
	self endon("disconnect");
	if(!isdefined(var_33636f4a))
	{
		var_33636f4a = function_9b84d8c6(type);
	}
	if(!isdefined(level.bgb[var_33636f4a.name]))
	{
		return;
	}
	while(!self function_1275e2ff())
	{
		wait(0.1);
	}
	if(play_anim)
	{
		var_a6bea1a = GetWeapon("zombie_bgb_grab");
		oldWeapon = self GetCurrentWeapon();
		var_a6bea1a = self getbuildkitweapon(var_a6bea1a, 0);
		weapon_options = self getbuildkitweaponoptions(var_a6bea1a, var_33636f4a.camoIndex);
		acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(var_a6bea1a, 0);
		self GiveWeapon(var_a6bea1a, weapon_options, acvi);
		self SwitchToWeapon(var_a6bea1a);
		self thread function_78da9ac7();
		evt = self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "perk_abort_drinking", "disconnect", "giveGobbleGumTimeout");
		self TakeWeapon(var_a6bea1a);
		self SwitchToWeapon(oldWeapon);
	}
	else
	{
		self notify("hash_fcbbef99");
	}
	while(!self function_1275e2ff())
	{
		wait(0.1);
	}
	self playsoundtoplayer("bgb_grab", self);
	self bgb::give(var_33636f4a.name);
	if(!play_anim && var_33636f4a.name == "zm_bgb_disorderly_combat")
	{
		wait(0.5);
		self notify("weapon_change_complete");
	}
}

/*
	Name: function_78da9ac7
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1A08
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 742
*/
function function_78da9ac7()
{
	self endon("fake_death");
	self endon("death");
	self endon("player_downed");
	self endon("weapon_change_complete");
	self endon("perk_abort_drinking");
	self endon("disconnect");
	wait(4);
	self notify("hash_78da9ac7");
}

/*
	Name: function_b4705b81
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1A70
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 764
*/
function function_b4705b81(var_33636f4a)
{
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(var_a0ec4ef3 == var_33636f4a)
		{
			break;
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	struct = spawnstruct();
	struct.name = var_a0ec4ef3;
	struct.UI = checkStringValid(row[3]);
	struct.camoIndex = Int(row[5]);
	struct.hud = checkStringValid(row[6]);
	struct.description = checkStringValid(row[7]);
	struct.var_d277f374 = Int(row[16]);
	struct.activation = checkStringValid(row[20]);
	return struct;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: checkStringValid
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1C70
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 803
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

/*
	Name: function_9b84d8c6
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1CA0
	Size: 0x2D0
	Parameters: 2
	Flags: None
	Line Number: 822
*/
function function_9b84d8c6(type, exception)
{
	var_a95e1085 = [];
	num = undefined;
	if(type == "classic")
	{
		num = 0;
	}
	if(type == "mega")
	{
		num = 1;
	}
	if(type == "rare")
	{
		num = 2;
	}
	if(type == "ultra")
	{
		num = 3;
	}
	if(type == "whimsical")
	{
		num = 4;
	}
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_71832171 = 0;
		var_803e329f = checkStringValid(row[2]);
		if(var_803e329f == "bubblegum" || var_803e329f == "bubblegum_consumable")
		{
			var_71832171 = 1;
		}
		var_d277f374 = Int(row[16]);
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(isdefined(exception) && exception.size > 0)
		{
			for(i = 0; i < exception.size; i++)
			{
				if(exception[i] == var_a0ec4ef3)
				{
					var_71832171 = 0;
					break;
				}
			}
		}
		else if(!isdefined(num) || (isdefined(num) && num == var_d277f374) && isdefined(var_a0ec4ef3) && var_71832171)
		{
			var_a95e1085[var_a95e1085.size] = var_a0ec4ef3;
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	return function_b4705b81(var_a95e1085[RandomInt(var_a95e1085.size)]);
}

/*
	Name: function_1275e2ff
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x1F78
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 891
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
	if(self bgb::is_enabled("zm_bgb_disorderly_combat") && (!isdefined(self.var_bc4459b1) || (isdefined(self.var_bc4459b1) && GetTime() >= self.var_bc4459b1 + 1)))
	{
		self.var_bc4459b1 = GetTime();
		return 0;
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
	Name: function_7d15591a
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2088
	Size: 0x190
	Parameters: 12
	Flags: None
	Line Number: 927
*/
function function_7d15591a(alignX, alignY, horzAlign, vertAlign, x, y, alpha, icon, var_29d8ef63, var_3d674fa, color, sort)
{
	hud = undefined;
	if(self == level)
	{
		hud = NewHudElem();
	}
	else
	{
		hud = newClientHudElem(self);
	}
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.horzAlign = horzAlign;
	hud.vertAlign = vertAlign;
	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.color = color;
	hud.sort = sort;
	hud SetShader(icon, var_29d8ef63, var_3d674fa);
	return hud;
}

/*
	Name: function_122a9928
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2220
	Size: 0x228
	Parameters: 12
	Flags: None
	Line Number: 961
*/
function function_122a9928(alignX, alignY, horzAlign, vertAlign, x, y, alpha, color, text, SIZE, sort, isCounter)
{
	if(!isdefined(sort))
	{
		sort = 1;
	}
	if(!isdefined(isCounter))
	{
		isCounter = 0;
	}
	hud = undefined;
	if(self == level)
	{
		if(isCounter)
		{
			hud = hud::createServerFontString("objective", 2);
		}
		else
		{
			hud = NewHudElem();
		}
	}
	else if(isCounter)
	{
		hud = self hud::createFontString("objective", 2);
	}
	else
	{
		hud = newClientHudElem(self);
	}
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.horzAlign = horzAlign;
	hud.vertAlign = vertAlign;
	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.color = color;
	hud.fontscale = SIZE;
	hud.sort = sort;
	if(isdefined(text))
	{
		hud setText(text);
	}
	return hud;
}

/*
	Name: function_c3c32972
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2450
	Size: 0x118
	Parameters: 7
	Flags: None
	Line Number: 1018
*/
function function_c3c32972(perk, desc, cost, name, clientfield_name, var_c2cc6d9b, var_5cac3f9)
{
	if(!isdefined(level.var_7280bfd8))
	{
		level.var_7280bfd8 = [];
	}
	if(!isdefined(level.var_7280bfd8[perk]))
	{
		var_23ae269a = spawnstruct();
		var_23ae269a.desc = desc;
		var_23ae269a.cost = cost;
		var_23ae269a.name = name;
		var_23ae269a.var_c2cc6d9b = var_c2cc6d9b;
		var_23ae269a.var_5cac3f9 = var_5cac3f9;
		var_23ae269a.clientfield_name = clientfield_name;
		level.var_7280bfd8[perk] = var_23ae269a;
	}
}

/*
	Name: function_5f9a13b3
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2570
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1047
*/
function function_5f9a13b3(perk)
{
	if(!isdefined(self.var_b5c2c258))
	{
		return 0;
	}
	if(isdefined(self.var_b5c2c258[perk]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_b690a849
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x25B0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1070
*/
function function_b690a849(perk)
{
	if(!isdefined(self.var_d6aef449))
	{
		return 0;
	}
	if(isdefined(self.var_d6aef449[perk]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_20dc5a15
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x25F0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1093
*/
function function_20dc5a15(perk)
{
	if(!isdefined(perk))
	{
		return 0;
	}
	if(isdefined(level.var_f3abde82) && isdefined(level.var_f3abde82[perk]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_a7c76532
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2640
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1116
*/
function function_a7c76532(perk)
{
	if(!isdefined(perk))
	{
		return 0;
	}
	if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: has_perk
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2690
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 1139
*/
function has_perk(perk)
{
	if(function_20dc5a15(perk) && self function_5f9a13b3(perk))
	{
		return 1;
	}
	if(!function_20dc5a15(perk) && self hasPerk(perk))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_72dfd9b
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2720
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 1162
*/
function function_72dfd9b(perk)
{
	if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_f3abde82) && isdefined(level.var_f3abde82[perk]) && self function_5f9a13b3(perk) && !self function_b690a849(perk))
	{
		return 1;
	}
	if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && (!isdefined(level.var_f3abde82) || !isdefined(level.var_f3abde82[perk])) && self hasPerk(perk) && !self function_b690a849(perk))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_9615be2a
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2830
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1185
*/
function function_9615be2a(perk)
{
	if(isdefined(level.var_f3abde82) && isdefined(level.var_f3abde82[perk]) && !self function_5f9a13b3(perk))
	{
		return 1;
	}
	if(!isdefined(level.var_f3abde82) || !isdefined(level.var_f3abde82[perk]) && !self hasPerk(perk))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_42dc6a57
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x28D0
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 1208
*/
function function_42dc6a57(perk)
{
	if(function_20dc5a15(perk) && function_a7c76532(perk) && self function_b690a849(perk))
	{
		return 1;
	}
	if(function_20dc5a15(perk) && !function_a7c76532(perk) && self function_5f9a13b3(perk))
	{
		return 1;
	}
	if(!function_20dc5a15(perk) && !function_a7c76532(perk) && self hasPerk(perk))
	{
		return 1;
	}
	if(!function_20dc5a15(perk) && function_a7c76532(perk) && self function_b690a849(perk))
	{
		return 1;
	}
	return 0;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c65ada05
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2A38
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1240
*/
function function_c65ada05(perk)
{
	perk_str = perk + "_stop";
	self notify(perk_str);
	if(zm_perks::use_solo_revive() && perk == "specialty_quickrevive")
	{
		if(function_6dd41714("cheats_uqr") == 1)
		{
			self.lives = 99;
		}
		else
		{
			self.lives--;
		}
	}
}

/*
	Name: function_6dd41714
	Namespace: namespace_851dc78f
	Checksum: 0x424F4353
	Offset: 0x2AD8
	Size: 0x4C
	Parameters: 1
	Flags: None
	Line Number: 1267
*/
function function_6dd41714(index)
{
	if(!isdefined(level.var_f6524c5e) || (isdefined(level.var_f6524c5e) && !isdefined(level.var_f6524c5e[index])))
	{
		return 0;
	}
	return level.var_f6524c5e[index];
}

