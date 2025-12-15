#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_sub;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\aae_left_ges;
#include scripts\zm\motherfucker;
#include scripts\zm\zmsavedata;

#namespace banks;

/*
	Name: __init__sytem__
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 28
*/
function autoexec __init__sytem__()
{
	system::register("banks", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x6E0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 43
*/
function __init__()
{
	clientfield::register("scriptmover", "bank_keyline", 21000, GetMinBitCountForNum(2), "int");
	if(namespace_11e193f1::function_66a72324(1))
	{
		function_96044404();
		function_f0b86682();
		callback::on_spawned(&function_377527ae);
	}
}

/*
	Name: function_377527ae
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x790
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 64
*/
function function_377527ae()
{
	self notify("hash_20fe5b16");
	self endon("hash_20fe5b16");
	self endon("bled_out");
	self endon("disconnect");
	self endon("death");
	if(GetDvarInt("elmg_cheats") != 1)
	{
		SetDvar("sv_cheats", 0);
	}
	if(namespace_11e193f1::function_66a72324() && !isdefined(level.var_3c40c482))
	{
		while(isdefined(self.var_1da7a07d) && isdefined(self.var_bef468a3) && self.var_bef468a3 == 1)
		{
			self thread function_72103b85();
			return;
			wait(0.048);
		}
	}
}

/*
	Name: function_72103b85
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x888
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 96
*/
function function_72103b85()
{
	self endon("disconnect");
	self endon("hash_72103b85");
	self endon("hash_20fe5b16");
	self.var_f0812692 = 0;
	self.var_ac6a9a3a = 0;
	self.var_bf9cd53c = 0;
	self.var_465bcdbe = 0;
	if(isdefined(self.var_bef468a3) && self.var_bef468a3 == 1)
	{
		self.var_f0812692 = self namespace_11e193f1::function_1a958da0(1);
		self.var_ac6a9a3a = self namespace_11e193f1::function_1a958da0(2);
		self.var_465bcdbe = self namespace_11e193f1::function_1a958da0(3);
		self.var_bf9cd53c = self namespace_11e193f1::function_1a958da0(4);
	}
	self function_9dfa2ab3();
	self function_d339e92d();
	self thread function_65eff58b();
}

/*
	Name: function_6eea578b
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x9D0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 127
*/
function function_6eea578b()
{
	if(self.var_def06a03 >= 50)
	{
		return 1000;
	}
	if(self.var_def06a03 >= 25)
	{
		return 30;
	}
	return 5;
}

/*
	Name: function_65eff58b
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0xA10
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function function_65eff58b()
{
	self endon("disconnect");
	self notify("hash_65eff58b");
	self endon("hash_65eff58b");
	var_7b3868b0 = GetEnt("elmg_bank_withdrawal", "targetname");
	while(isdefined(self))
	{
		level waittill("end_of_round");
		self.var_d139ec43 = self function_6eea578b();
		if(isdefined(self.var_465bcdbe) && self.var_465bcdbe != 0)
		{
			if(self.var_def06a03 >= 15)
			{
				var_7b3868b0 function_cb2c15eb(self, &"ELMG_WITHDRAW", 0);
			}
			else
			{
				var_7b3868b0 function_cb2c15eb(self, &"ELMG_WITHDRAW", 100);
			}
		}
	}
}

/*
	Name: function_9dfa2ab3
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0xB18
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 184
*/
function function_9dfa2ab3()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_9dfa2ab3");
	self endon("hash_9dfa2ab3");
	if(namespace_11e193f1::function_66a72324())
	{
		var_fed80dcd = GetEnt("elmgweaponlocker", "targetname");
		if(isdefined(var_fed80dcd))
		{
			if(isdefined(self.var_bef468a3))
			{
				if(self.var_bf9cd53c != 0 && self.var_bf9cd53c != 1)
				{
					weaponName = tableLookup("gamedata/tables/common/zonename.csv", 28, self.var_bf9cd53c, 29);
					weapon = GetWeapon(weaponName);
					if(isdefined(weapon.displayName))
					{
						var_bbc1cbe = MakeLocalizedString(weapon.displayName);
					}
					else
					{
						var_bbc1cbe = weapon.name;
					}
					var_fed80dcd function_cb2c15eb(self, &"ZOMBIE_WEAPON_LOCKER_GRAB_FILL", var_bbc1cbe);
				}
				if(self.var_bf9cd53c == 0 || self.var_bf9cd53c == 1)
				{
					self.var_bf9cd53c = 0;
					var_fed80dcd function_cb2c15eb(self, &"ZOMBIE_WEAPON_LOCKER_STORE");
				}
				self.var_d139ec43 = 5;
				if(self.var_def06a03 >= 25)
				{
					self.var_d139ec43 = 30;
				}
				if(self.var_def06a03 >= 50)
				{
					self.var_d139ec43 = 1000;
				}
			}
		}
	}
}

/*
	Name: function_d339e92d
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0xD30
	Size: 0x230
	Parameters: 0
	Flags: None
	Line Number: 240
*/
function function_d339e92d()
{
	self endon("disconnect");
	self endon("death");
	self notify("hash_d339e92d");
	self endon("hash_d339e92d");
	if(namespace_11e193f1::function_66a72324())
	{
		if(isdefined(self.var_bef468a3))
		{
			self.var_d139ec43 = self function_6eea578b();
			var_36dec1d7 = 1000;
			deposit = GetEnt("elmg_bank_deposit", "targetname");
			var_7b3868b0 = GetEnt("elmg_bank_withdrawal", "targetname");
			if(self.var_def06a03 >= 15)
			{
				deposit function_cb2c15eb(self, &"ELMG_DEPOSIT", 0);
				var_7b3868b0 function_cb2c15eb(self, &"ELMG_WITHDRAW", 0);
			}
			else
			{
				deposit function_cb2c15eb(self, &"ELMG_DEPOSIT", 100);
				var_7b3868b0 function_cb2c15eb(self, &"ELMG_WITHDRAW", 100);
			}
			self thread function_c3d12d0b(deposit, var_36dec1d7, var_7b3868b0);
			self thread function_fd72f211(deposit, var_36dec1d7, var_7b3868b0);
			if(self.var_465bcdbe == 0)
			{
				var_7b3868b0 function_cb2c15eb(self, &"ELMG_SHARE_OUT");
			}
			if(self.var_465bcdbe < 50000)
			{
			}
			else
			{
				deposit function_cb2c15eb(self, &"ELMG_BANK_OVERLOAD");
			}
		}
	}
}

/*
	Name: function_b63a1fa0
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0xF68
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 291
*/
function function_b63a1fa0()
{
	level endon("end_game");
	level.var_3c40c482 = 1;
	var_fed80dcd = GetEnt("elmgweaponlocker", "targetname");
	deposit = GetEnt("elmg_bank_deposit", "targetname");
	var_7b3868b0 = GetEnt("elmg_bank_withdrawal", "targetname");
	foreach(User in level.players)
	{
		User notify("hash_72103b85");
		if(isdefined(var_fed80dcd))
		{
			var_fed80dcd function_cb2c15eb(User, &"ELMG_LOCKER_BAN");
		}
		if(isdefined(deposit))
		{
			deposit function_cb2c15eb(User, &"ELMG_LOCKER_BAN");
		}
		if(isdefined(var_7b3868b0))
		{
			var_7b3868b0 function_cb2c15eb(User, &"ELMG_LOCKER_BAN");
		}
	}
	if(isdefined(var_fed80dcd))
	{
		var_fed80dcd setHintString(&"ELMG_LOCKER_BAN");
	}
	if(isdefined(deposit))
	{
		deposit setHintString(&"ELMG_LOCKER_BAN");
	}
	if(isdefined(var_7b3868b0))
	{
		var_7b3868b0 setHintString(&"ELMG_LOCKER_BAN");
	}
}

/*
	Name: function_f0b86682
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x1190
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 338
*/
function function_f0b86682()
{
	origin = function_3f326171();
	var_6210ab57 = spawn("script_model", origin);
	var_6210ab57 SetModel("p7_mp_scavenger_pack");
	var_6210ab57.targetname = "elmgweaponlocker_model";
	trig = spawn("trigger_radius_use", origin, 0, 20, 20);
	trig UseTriggerRequireLookAt();
	trig.targetname = "elmgweaponlocker";
	trig TriggerIgnoreTeam();
	trig setHintString(&"PLATFORM_LOADING");
	trig setcursorhint("HINT_NOICON");
	trig EnableLinkTo();
	trig linkToBlendToTag(var_6210ab57);
	if(!isdefined(level.var_508fe397))
	{
		var_6210ab57.origin = beamtrace(var_6210ab57.origin + VectorScale((0, 0, 1), 20), var_6210ab57.origin - VectorScale((0, 0, 1), 100), 1, var_6210ab57, 0, 0)["position"] + VectorScale((0, 0, 1), 20);
	}
	var_6210ab57 thread function_aeb60817();
	trig thread function_742c2e82(var_6210ab57);
}

/*
	Name: function_742c2e82
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x13A0
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 370
*/
function function_742c2e82(model)
{
	level endon("end_game");
	level endon("game_ended");
	for(;;)
	{
		wait(0.05);
		self waittill("trigger", User);
		self function_a85fa5c2(User, model);
	}
}

/*
	Name: function_a85fa5c2
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x1410
	Size: 0xBD8
	Parameters: 2
	Flags: None
	Line Number: 392
*/
function function_a85fa5c2(User, model)
{
	if(User laststand::player_is_in_laststand())
	{
		User playlocalsound("zmb_no_cha_ching");
		return;
	}
	if(isdefined(level.var_3c40c482) || !zm_utility::is_player_valid(User))
	{
		User playlocalsound("zmb_no_cha_ching");
		return;
	}
	weapon = User GetCurrentWeapon();
	if(User.IS_DRINKING > 0 || zm_utility::is_placeable_mine(weapon) || zm_equipment::is_equipment(weapon) || User zm_utility::is_player_revive_tool(weapon) || weapon.name == "syrette_quick" || weapon.isHeroWeapon || weapon.isgadget || !isdefined(User.var_bf9cd53c))
	{
		User playlocalsound("zmb_no_cha_ching");
		User thread function_d559fd49(self);
		return;
	}
	if(User.var_bf9cd53c == 0)
	{
		i = Int(tableLookup("gamedata/tables/common/zonename.csv", 29, weapon.rootweapon.name, 28));
		if(IsInt(i) && i != 0 && i != 1)
		{
			var_fd13471 = User getammocount(weapon);
			self function_cb2c15eb(User, &"ELMG_WEAPONLOCKER_LOADING");
			weaponclip = User GetWeaponAmmoClip(weapon);
			var_e9241219 = var_fd13471 - weaponclip;
			var_1eeaf207 = weaponclip / weapon.clipSize;
			User.var_f0812692 = var_1eeaf207 * 100;
			var_86d8eeef = var_e9241219 / weapon.maxAmmo;
			User.var_ac6a9a3a = var_86d8eeef * 100;
			if(isdefined(weapon.displayName))
			{
				var_bbc1cbe = MakeLocalizedString(weapon.displayName);
			}
			else
			{
				var_bbc1cbe = weapon.name;
			}
			User.var_bf9cd53c = i;
			User thread function_44c68943();
			User TakeWeapon(weapon);
			if(User getweaponslistprimaries().size < 1)
			{
				User GiveWeapon(GetWeapon("zombie_fists"));
				User SwitchToWeapon(GetWeapon("zombie_fists"));
			}
			if(!isdefined(model.var_4dd578d6))
			{
				model.var_4dd578d6 = 1;
				model clientfield::set("bank_keyline", 0);
			}
			User thread zm_audio::create_and_play_dialog("general", "weapon_storage");
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, User.name, "â¦SUBEVENT_STOREDâ¦ " + var_bbc1cbe + "â¦^7â¦SUBEVENT_DOTâ¦");
			User playlocalsound("locker_putin");
			self function_cb2c15eb(User, &"ZOMBIE_WEAPON_LOCKER_GRAB_FILL", var_bbc1cbe);
		}
		else
		{
			User playlocalsound("zmb_no_cha_ching");
			User thread function_d559fd49(self);
		}
	}
	else
	{
		weapons = User getweaponslistprimaries();
		self function_cb2c15eb(User, &"ELMG_WEAPONLOCKER_LOADING");
		weaponName = tableLookup("gamedata/tables/common/zonename.csv", 28, User.var_bf9cd53c, 29);
		var_debfc3 = User zm_weapons::give_build_kit_weapon(GetWeapon(weaponName));
		if(isdefined(var_debfc3.displayName))
		{
			name = MakeLocalizedString(var_debfc3.displayName);
		}
		else
		{
			name = var_debfc3.name;
		}
		if(isdefined(User.var_f0812692) && isdefined(User.var_ac6a9a3a))
		{
			var_bab8e511 = User.var_f0812692 / 100;
			var_9f329579 = User.var_ac6a9a3a / 100;
		}
		else
		{
			User.var_bab8e511 = 1;
			User.var_9f329579 = 1;
		}
		weaponclip = var_debfc3.clipSize * var_bab8e511;
		var_e9241219 = var_debfc3.maxAmmo * var_9f329579;
		if(User hasPerk("specialty_additionalprimaryweapon"))
		{
			if(weapons.size == 3)
			{
				User dropitem(weapon);
			}
		}
		else if(weapons.size == 2)
		{
			if(weapons.size == 3)
			{
				User dropitem(weapons[2]);
			}
			User dropitem(weapon);
		}
		User.var_bf9cd53c = 0;
		User thread function_44c68943();
		if(!User.var_def06a03 >= 25)
		{
			foreach(var_43ef0d60 in User getweaponslistprimaries())
			{
				if(var_43ef0d60.rootweapon.name == var_debfc3.rootweapon.name)
				{
					User SetWeaponAmmoClip(var_43ef0d60, weaponclip);
					User SetWeaponAmmoStock(var_43ef0d60, var_e9241219);
					User SwitchToWeapon(var_43ef0d60);
				}
			}
			if(!isdefined(model.var_4dd578d6))
			{
				model.var_4dd578d6 = 1;
				model clientfield::set("bank_keyline", 0);
			}
			User thread zm_audio::create_and_play_dialog("general", "wall_withdrawl");
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, User.name, "â¦SUBEVENT_GOT_MYâ¦ â¦" + name + "â¦ ^7â¦SUBEVENT_BACKâ¦â¦SUBEVENT_DOTâ¦");
			User playlocalsound("locker_take");
			self function_cb2c15eb(User, &"ZOMBIE_WEAPON_LOCKER_STORE");
		}
		else
		{
			foreach(var_43ef0d60 in User getweaponslistprimaries())
			{
				if(var_43ef0d60.rootweapon.name == var_debfc3.rootweapon.name)
				{
					User giveMaxAmmo(var_43ef0d60);
					User SwitchToWeapon(var_43ef0d60);
				}
			}
			if(!isdefined(model.var_4dd578d6))
			{
				model.var_4dd578d6 = 1;
				model clientfield::set("bank_keyline", 0);
			}
			thread namespace_d0cd8c5d::function_9e5ebece(undefined, 2, User.name, "â¦SUBEVENT_GOT_MYâ¦ â¦" + name + "â¦ ^7â¦SUBEVENT_BACKâ¦â¦SUBEVENT_DOTâ¦");
			User playlocalsound("locker_take");
			self function_cb2c15eb(User, &"ZOMBIE_WEAPON_LOCKER_STORE");
		}
	}
}

/*
	Name: function_d559fd49
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x1FF0
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 552
*/
function function_d559fd49(locker)
{
	self endon("disconnect");
	self endon("death");
	self playlocalsound("zmb_no_cha_ching");
	self notify("hash_66bc4426");
	self endon("hash_66bc4426");
	if(isdefined(self))
	{
		locker function_cb2c15eb(self, &"ZOMBIE_WEAPON_LOCKER_DENY");
	}
	wait(2);
	if(isdefined(self) && isdefined(self.var_bf9cd53c) && self.var_bf9cd53c == 0)
	{
		locker function_cb2c15eb(self, &"ZOMBIE_WEAPON_LOCKER_STORE");
	}
}

/*
	Name: function_8e48281c
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x20C0
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 580
*/
function function_8e48281c()
{
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 25);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 25);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	origin = (0, 0, 0);
	points = struct::get_array("initial_spawn", "script_noteworthy");
	if(!isdefined(points) || points.size == 0)
	{
		points = struct::get_array("initial_spawn_points", "targetname");
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_player_start", "classname");
	}
	if(isdefined(points[0]))
	{
		return points[0].origin + VectorScale((0, 0, 1), 20);
	}
	return origin;
}

/*
	Name: function_5a3ae1b5
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x2370
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 627
*/
function function_5a3ae1b5()
{
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 26);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 26);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	origin = (0, 0, 0);
	points = struct::get_array("initial_spawn", "script_noteworthy");
	if(!isdefined(points) || points.size == 0)
	{
		points = struct::get_array("initial_spawn_points", "targetname");
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_player_start", "classname");
	}
	if(isdefined(points[1]))
	{
		return points[1].origin + VectorScale((0, 0, 1), 20);
	}
	if(!isdefined(origin) && isdefined(points[0]))
	{
		return points[0].origin + (0, -10, 20);
	}
	return origin;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3f326171
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x2660
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 679
*/
function function_3f326171()
{
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, GetDvarString("ui_mapname"), 27);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	pos = tableLookup("gamedata/tables/common/box_chance.csv", 24, level.script, 27);
	if(isdefined(pos) && pos != "")
	{
		pos = StrTok(pos, "|");
		if(pos.size == 3)
		{
			return (float(pos[0]), float(pos[1]), float(pos[2]));
		}
	}
	origin = (0, 0, 0);
	points = struct::get_array("initial_spawn", "script_noteworthy");
	if(!isdefined(points) || points.size == 0)
	{
		points = struct::get_array("initial_spawn_points", "targetname");
	}
	if(!isdefined(points) || points.size == 0)
	{
		points = GetEntArray("info_player_start", "classname");
	}
	if(isdefined(points[2]))
	{
		return points[2].origin + VectorScale((0, 0, 1), 20);
	}
	if(!isdefined(origin) && isdefined(points[0]))
	{
		return points[0].origin + (10, 0, 20);
	}
	return origin;
}

/*
	Name: function_96044404
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x2950
	Size: 0x450
	Parameters: 0
	Flags: None
	Line Number: 730
*/
function function_96044404()
{
	var_61a5b596 = spawn("script_model", function_8e48281c());
	var_61a5b596 SetModel("t6_wpn_trophy_system_view");
	var_61a5b596.targetname = "elmg_bank_withdrawal_model";
	var_5bafbe2b = spawn("script_model", function_5a3ae1b5());
	var_5bafbe2b SetModel("wpn_t7_trophy_system");
	var_5bafbe2b.targetname = "elmg_bank_deposit_model";
	trig = spawn("trigger_radius_use", var_61a5b596.origin, 0, 20, 20);
	trig UseTriggerRequireLookAt();
	trig.targetname = "elmg_bank_withdrawal";
	trigger = spawn("trigger_radius_use", var_5bafbe2b.origin, 0, 20, 20);
	trigger UseTriggerRequireLookAt();
	trigger.targetname = "elmg_bank_deposit";
	trig TriggerIgnoreTeam();
	trigger TriggerIgnoreTeam();
	trig setHintString(&"PLATFORM_LOADING");
	trigger setHintString(&"PLATFORM_LOADING");
	trig setcursorhint("HINT_NOICON");
	trigger setcursorhint("HINT_NOICON");
	var_36dec1d7 = 1000;
	var_bfe6add1 = 100;
	trig EnableLinkTo();
	trigger EnableLinkTo();
	trig linkToBlendToTag(var_61a5b596);
	trigger linkToBlendToTag(var_5bafbe2b);
	if(!isdefined(level.var_508fe397))
	{
		var_61a5b596.origin = beamtrace(var_61a5b596.origin + VectorScale((0, 0, 1), 20), var_61a5b596.origin - VectorScale((0, 0, 1), 100), 1, var_61a5b596, 0, 0)["position"] + VectorScale((0, 0, 1), 20);
		var_5bafbe2b.origin = beamtrace(var_5bafbe2b.origin + VectorScale((0, 0, 1), 20), var_5bafbe2b.origin - VectorScale((0, 0, 1), 100), 1, var_5bafbe2b, 0, 0)["position"] + VectorScale((0, 0, 1), 20);
	}
	var_5bafbe2b thread function_aeb60817();
	var_61a5b596 thread function_aeb60817();
	trig thread function_c3ff71c4(var_36dec1d7, var_bfe6add1, trigger, var_61a5b596);
	trigger thread function_22199092(var_36dec1d7, var_bfe6add1, trig, var_5bafbe2b);
}

/*
	Name: function_aeb60817
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x2DA8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 777
*/
function function_aeb60817()
{
	level flag::wait_till("initial_blackscreen_passed");
	self clientfield::set("bank_keyline", 1);
}

/*
	Name: function_407182be
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x2DF8
	Size: 0x4D0
	Parameters: 5
	Flags: None
	Line Number: 793
*/
function function_407182be(var_36dec1d7, var_bfe6add1, var_58fc741, var_61a5b596, User)
{
	self endon("death");
	User endon("disconnect");
	if(!isdefined(level.var_3c40c482) && isdefined(User.var_d139ec43) && isdefined(User.var_465bcdbe))
	{
		if(User.var_d139ec43)
		{
			if(User.var_465bcdbe > 0)
			{
				if(zm_utility::is_player_valid(User))
				{
					if(!User.var_def06a03 >= 15)
					{
						if(User.var_465bcdbe == 0 || User.score < var_bfe6add1)
						{
							User thread zm_audio::create_and_play_dialog("general", "exert_sigh");
							User playlocalsound("zmb_no_cha_ching");
							return;
						}
					}
					level.var_41b62535 = 1;
					User thread zm_audio::create_and_play_dialog("general", "exert_laugh");
					User playlocalsound("bank_withdraw");
					if(!isdefined(var_61a5b596.var_4dd578d6))
					{
						var_61a5b596.var_4dd578d6 = 1;
						var_61a5b596 clientfield::set("bank_keyline", 0);
					}
					User.var_d139ec43 = User.var_d139ec43 - 1;
					if(User.var_def06a03 < 15)
					{
						var_58fc741 function_cb2c15eb(User, &"ELMG_DEPOSIT", 100);
						User.score = User.score - var_bfe6add1;
						wait(0.01);
					}
					else
					{
						var_58fc741 function_cb2c15eb(User, &"ELMG_DEPOSIT", 0);
					}
					if(User.var_def06a03 >= 50)
					{
						User.score = User.score + var_bfe6add1;
						wait(0.01);
					}
					User.score = User.score + var_36dec1d7;
					User.var_465bcdbe = User.var_465bcdbe - 1;
					User namespace_3d0867a6::function_18df83fb("pickup");
					User thread function_5596bedf(User.var_465bcdbe);
					balance = User.var_465bcdbe * var_36dec1d7;
					if(!User.var_d139ec43)
					{
						self function_cb2c15eb(User, &"ZOMBIE_BGB_MACHINE_COMEBACK");
					}
					if(User.var_465bcdbe <= 0)
					{
						self function_cb2c15eb(User, &"ELMG_SHARE_OUT");
					}
					User thread zm_audio::create_and_play_dialog("general", "bank_withdrawl");
				}
			}
			else
			{
				User thread zm_audio::create_and_play_dialog("general", "exert_sigh");
				User playlocalsound("zmb_no_cha_ching");
			}
		}
		else if(User.var_465bcdbe > 0)
		{
			self function_cb2c15eb(User, &"ZOMBIE_BGB_MACHINE_COMEBACK");
		}
		User thread zm_audio::create_and_play_dialog("general", "exert_sigh");
		User playlocalsound("zmb_no_cha_ching");
	}
}

/*
	Name: function_c3ff71c4
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x32D0
	Size: 0x80
	Parameters: 4
	Flags: None
	Line Number: 879
*/
function function_c3ff71c4(var_36dec1d7, var_bfe6add1, var_58fc741, var_61a5b596)
{
	level endon("end_game");
	level endon("game_ended");
	for(;;)
	{
		self waittill("trigger", User);
		self function_407182be(var_36dec1d7, var_bfe6add1, var_58fc741, var_61a5b596, User);
	}
}

/*
	Name: function_5596bedf
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x3358
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 900
*/
function function_5596bedf(value)
{
	self notify("hash_4dab2b53");
	self endon("hash_4dab2b53");
	wait(1);
	self namespace_11e193f1::function_9ec531f4(3, self.var_465bcdbe);
}

/*
	Name: function_2b21ec50
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x33B0
	Size: 0x480
	Parameters: 5
	Flags: None
	Line Number: 918
*/
function function_2b21ec50(var_36dec1d7, var_bfe6add1, Withdraw, var_5bafbe2b, User)
{
	if(!isdefined(level.var_3c40c482) && isdefined(User.var_d139ec43) && isdefined(User.var_465bcdbe))
	{
		if(zm_utility::is_player_valid(User) && isdefined(User.var_465bcdbe))
		{
			if(User.var_465bcdbe > 50000)
			{
				User thread zm_audio::create_and_play_dialog("general", "exert_sigh");
				User playlocalsound("zmb_no_cha_ching");
				self function_cb2c15eb(User, &"ELMG_BANK_OVERLOAD");
				return;
			}
			if(isdefined(User.var_def06a03) && User.var_def06a03 >= 15)
			{
				if(User.score < 1000)
				{
					User thread zm_audio::create_and_play_dialog("general", "exert_sigh");
					User playlocalsound("zmb_no_cha_ching");
					return;
				}
			}
			else if(User.score < 1000 + var_bfe6add1)
			{
				User thread zm_audio::create_and_play_dialog("general", "exert_sigh");
				User playlocalsound("zmb_no_cha_ching");
				return;
			}
			User playlocalsound("bank_deposit");
			if(!isdefined(var_5bafbe2b.var_4dd578d6))
			{
				var_5bafbe2b.var_4dd578d6 = 1;
				var_5bafbe2b clientfield::set("bank_keyline", 0);
			}
			if(User.var_def06a03 < 15)
			{
				if(User.var_d139ec43)
				{
					Withdraw function_cb2c15eb(User, &"ELMG_WITHDRAW", 100);
				}
				else
				{
					Withdraw function_cb2c15eb(User, &"ZOMBIE_BGB_MACHINE_COMEBACK");
				}
				User.score = User.score - var_bfe6add1;
				wait(0.05);
			}
			else if(User.var_d139ec43)
			{
				Withdraw function_cb2c15eb(User, &"ELMG_WITHDRAW", 0);
			}
			else
			{
				Withdraw function_cb2c15eb(User, &"ZOMBIE_BGB_MACHINE_COMEBACK");
			}
			User.score = User.score - var_36dec1d7;
			User.var_465bcdbe = User.var_465bcdbe + 1;
			User namespace_3d0867a6::function_18df83fb("point_out");
			User thread zm_audio::create_and_play_dialog("general", "bank_deposit");
			User thread function_5596bedf(User.var_465bcdbe);
			balance = User.var_465bcdbe * var_36dec1d7;
			if(User.var_465bcdbe >= 50000)
			{
				self function_cb2c15eb(User, &"ELMG_BANK_OVERLOAD");
			}
		}
	}
}

/*
	Name: function_22199092
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x3838
	Size: 0x80
	Parameters: 4
	Flags: None
	Line Number: 997
*/
function function_22199092(var_36dec1d7, var_bfe6add1, Withdraw, var_5bafbe2b)
{
	level endon("end_game");
	level endon("game_ended");
	for(;;)
	{
		self waittill("trigger", User);
		self function_2b21ec50(var_36dec1d7, var_bfe6add1, Withdraw, var_5bafbe2b, User);
	}
}

/*
	Name: function_44c68943
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x38C0
	Size: 0xA0
	Parameters: 3
	Flags: None
	Line Number: 1018
*/
function function_44c68943(i, a, b)
{
	self notify("hash_44c68943");
	self endon("hash_44c68943");
	wait(1);
	self namespace_11e193f1::function_9ec531f4(1, self.var_f0812692);
	self namespace_11e193f1::function_9ec531f4(2, self.var_ac6a9a3a);
	self namespace_11e193f1::function_9ec531f4(4, self.var_bf9cd53c);
}

/*
	Name: function_c3d12d0b
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x3968
	Size: 0x250
	Parameters: 3
	Flags: None
	Line Number: 1038
*/
function function_c3d12d0b(deposit, var_36dec1d7, var_7b3868b0)
{
	if(!isdefined(var_36dec1d7))
	{
		var_36dec1d7 = 1000;
	}
	level endon("end_game");
	level endon("game_ended");
	self endon("hash_34550096");
	self notify("hash_88e4ebba");
	self endon("hash_88e4ebba");
	while(isdefined(self))
	{
		wait(0.05);
		if(self istouching(deposit) && self istouching(var_7b3868b0))
		{
			if(self IsMeleeing() && isdefined(self.var_465bcdbe))
			{
				self IPrintLnBold(&"ELMG_BANK_SCORE", self.var_465bcdbe * var_36dec1d7);
			}
			while(self IsMeleeing())
			{
				wait(0.05);
			}
			continue;
		}
		if(self istouching(var_7b3868b0))
		{
			if(self IsMeleeing() && isdefined(self.var_465bcdbe))
			{
				self IPrintLnBold(&"ELMG_BANK_SCORE", self.var_465bcdbe * var_36dec1d7);
			}
			while(self IsMeleeing())
			{
				wait(0.05);
			}
		}
		else if(self istouching(deposit))
		{
			if(self IsMeleeing() && isdefined(self.var_465bcdbe))
			{
				self IPrintLnBold(&"ELMG_BANK_SCORE", self.var_465bcdbe * var_36dec1d7);
			}
			while(self IsMeleeing())
			{
				wait(0.05);
			}
		}
	}
}

/*
	Name: function_fd72f211
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x3BC0
	Size: 0x220
	Parameters: 3
	Flags: None
	Line Number: 1099
*/
function function_fd72f211(deposit, var_36dec1d7, var_7b3868b0)
{
	if(!isdefined(var_36dec1d7))
	{
		var_36dec1d7 = 1000;
	}
	level endon("end_game");
	level endon("game_ended");
	self endon("hash_34550096");
	self notify("hash_fae1f766");
	self endon("hash_fae1f766");
	while(isdefined(self))
	{
		wait(0.05);
		if(self istouching(deposit) && self istouching(var_7b3868b0))
		{
			if(self ActionSlotFourButtonPressed() && isdefined(self.var_465bcdbe))
			{
				self function_72b4d2cf(deposit);
			}
			while(self ActionSlotFourButtonPressed())
			{
				wait(0.05);
			}
			continue;
		}
		if(self istouching(var_7b3868b0))
		{
			if(self ActionSlotFourButtonPressed() && isdefined(self.var_465bcdbe))
			{
				self function_72b4d2cf(var_7b3868b0);
			}
			while(self ActionSlotFourButtonPressed())
			{
				wait(0.05);
			}
		}
		else if(self istouching(deposit))
		{
			if(self ActionSlotFourButtonPressed() && isdefined(self.var_465bcdbe))
			{
				self function_72b4d2cf(deposit);
			}
			while(self ActionSlotFourButtonPressed())
			{
				wait(0.05);
			}
		}
	}
}

/*
	Name: function_72b4d2cf
	Namespace: banks
	Checksum: 0x424F4353
	Offset: 0x3DE8
	Size: 0xF4
	Parameters: 1
	Flags: None
	Line Number: 1160
*/
function function_72b4d2cf(bank)
{
	self notify("hash_85dfd7dc");
	self endon("hash_85dfd7dc");
	if(!(isdefined(self.var_bef468a3) && self.var_bef468a3 == 1))
	{
		self.var_bef468a3 = self namespace_11e193f1::function_d7942e29(1);
	}
	if(isdefined(self.var_bef468a3) && self.var_bef468a3 == 1)
	{
		if(!isdefined(self.var_def06a03))
		{
			self.var_def06a03 = self namespace_11e193f1::function_1a958da0(5);
		}
		self IPrintLnBold(&"ELMGT_EE_COUNT", self.var_def06a03);
	}
	else
	{
		self IPrintLnBold("New Save System NOT loaded!");
	}
}

