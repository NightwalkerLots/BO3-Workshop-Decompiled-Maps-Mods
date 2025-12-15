#include scripts\shared\callbacks_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace namespace_3bad7368;

/*
	Name: function_9faea208
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x490
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 19
*/
function function_9faea208(key, def)
{
	s = spawnstruct();
	s.key = key;
	s.def = def;
	level.var_98fe8b71[level.var_98fe8b71.size] = s;
}

/*
	Name: function_889b2934
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x508
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 37
*/
function function_889b2934(weap)
{
	function_9faea208("wkills_" + weap, 0);
	if(weap != "bowie_knife")
	{
		function_9faea208("wupgkills_" + weap, 0);
	}
	if(weap != "pistol_standard" && weap != "bowie_knife" && weap != "launcher_standard" && weap != "pistol_m1911" && weap != "launcher_multi")
	{
		function_9faea208("whead_" + weap, 0);
	}
	function_9faea208("wpap_override_" + weap, 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_86997cbe
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x600
	Size: 0x478
	Parameters: 0
	Flags: None
	Line Number: 63
*/
function function_86997cbe()
{
	level.var_98fe8b71 = [];
	if(!isdefined(level.var_881557b4))
	{
		level.var_881557b4 = [];
		level.var_18d88274 = 0;
	}
	function_9faea208("xp", 0);
	function_9faea208("lvl", 1);
	function_9faea208("pres", 0);
	function_9faea208("tok", 0);
	function_9faea208("doublexp", 0);
	[[level.var_a4f16266]]();
	weaps = [];
	weaps[weaps.size] = "sniper_powerbolt";
	weaps[weaps.size] = "sniper_fastbolt";
	weaps[weaps.size] = "sniper_fastsemi";
	weaps[weaps.size] = "smg_versatile";
	weaps[weaps.size] = "smg_standard";
	weaps[weaps.size] = "smg_longrange";
	weaps[weaps.size] = "smg_fastfire";
	weaps[weaps.size] = "smg_capacity";
	weaps[weaps.size] = "smg_burst";
	weaps[weaps.size] = "smg_mp40";
	weaps[weaps.size] = "smg_ak74u";
	weaps[weaps.size] = "smg_ppsh";
	weaps[weaps.size] = "shotgun_semiauto";
	weaps[weaps.size] = "shotgun_pump";
	weaps[weaps.size] = "shotgun_precision";
	weaps[weaps.size] = "shotgun_fullauto";
	weaps[weaps.size] = "shotgun_energy";
	weaps[weaps.size] = "pistol_standard";
	weaps[weaps.size] = "bowie_knife";
	weaps[weaps.size] = "pistol_burst";
	weaps[weaps.size] = "pistol_fullauto";
	weaps[weaps.size] = "launcher_standard";
	weaps[weaps.size] = "pistol_shotgun";
	weaps[weaps.size] = "pistol_energy";
	weaps[weaps.size] = "pistol_m1911";
	weaps[weaps.size] = "launcher_multi";
	weaps[weaps.size] = "lmg_slowfire";
	weaps[weaps.size] = "lmg_light";
	weaps[weaps.size] = "lmg_heavy";
	weaps[weaps.size] = "lmg_cqb";
	weaps[weaps.size] = "lmg_rpk";
	weaps[weaps.size] = "ar_standard";
	weaps[weaps.size] = "ar_marksman";
	weaps[weaps.size] = "ar_longburst";
	weaps[weaps.size] = "ar_garand";
	weaps[weaps.size] = "ar_damage";
	weaps[weaps.size] = "ar_cqb";
	weaps[weaps.size] = "ar_accurate";
	weaps[weaps.size] = "ar_m14";
	weaps[weaps.size] = "ar_peacekeeper";
	weaps[weaps.size] = "ar_famas";
	weaps[weaps.size] = "ar_galil";
	weaps[weaps.size] = "ar_m16";
	for(i = 0; i < weaps.size; i++)
	{
		function_889b2934(weaps[i]);
	}
}

/*
	Name: function_24b29c5a
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 137
*/
function function_24b29c5a(key, value)
{
	value = Int(value);
	if(!isdefined(level.var_881557b4[key]))
	{
		level.var_18d88274++;
	}
	level.var_881557b4[key] = value;
}

/*
	Name: function_b99a8ad1
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xAE8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 157
*/
function function_b99a8ad1()
{
	return isdefined(level.var_18d88274) && level.var_18d88274 > 0;
}

/*
	Name: function_7051c0ec
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xB10
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 172
*/
function function_7051c0ec()
{
	if(!function_b99a8ad1())
	{
		return 0;
	}
	sent = 0;
	foreach(VAL in level.var_881557b4)
	{
		self LUINotifyEvent(&"leveling_cf", 3, 1, key, Int(VAL));
		sent++;
		if(sent % 5 == 0)
		{
			wait(0.5);
		}
	}
	level.var_881557b4 = [];
	level.var_18d88274 = 0;
	return 1;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_68bfc17e
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xC30
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 204
*/
function function_68bfc17e(a, x)
{
	if(!isdefined(a))
	{
		return 0;
	}
	for(i = 0; i < a.size; i++)
	{
		if(a[i] == x)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_a8ecd90
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xCA0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 230
*/
function function_a8ecd90(K)
{
	if(!isdefined(level.var_98fe8b71))
	{
		return -1;
	}
	for(i = 0; i < level.var_98fe8b71.size; i++)
	{
		if(level.var_98fe8b71[i].key == K)
		{
			return i;
		}
	}
	return -1;
}

/*
	Name: function_3ebd63e9
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xD20
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 256
*/
function function_3ebd63e9(idx, VAL)
{
	if(idx < 0)
	{
		return;
	}
	function_24b29c5a(idx, VAL);
	return;
}

/*
	Name: function_5986d7cc
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xD68
	Size: 0x68
	Parameters: 2
	Flags: None
	Line Number: 276
*/
function function_5986d7cc(key, VAL)
{
	idx = function_a8ecd90(key);
	if(idx >= 0)
	{
		self function_3ebd63e9(idx, VAL);
		return;
	}
}

/*
	Name: function_55f052bf
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xDD8
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 296
*/
function function_55f052bf(K)
{
	for(i = 0; i < level.var_98fe8b71.size; i++)
	{
		if(level.var_98fe8b71[i].key == K)
		{
			return level.var_98fe8b71[i];
		}
	}
	return undefined;
}

/*
	Name: function_14483d92
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xE50
	Size: 0x148
	Parameters: 1
	Flags: None
	Line Number: 318
*/
function function_14483d92(s)
{
	if(!isdefined(s))
	{
		return s;
	}
	while(s.size > 0 && (s[0] == " " || s[0] == "\t" || s[0] == "\r" || s[0] == "\n"))
	{
		s = GetSubStr(s, 1);
	}
	while(s.size > 0)
	{
		last = s[s.size - 1];
		if(last == " " || last == "\t" || last == "\r" || last == "\n")
		{
			s = GetSubStr(s, 0, s.size - 1);
			break;
		}
		else
		{
		}
	}
	return s;
}

/*
	Name: function_6d77519a
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0xFA0
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 353
*/
function function_6d77519a(s, def)
{
	if(!isdefined(s))
	{
		return def;
	}
	s = function_14483d92(s);
	if(!isdefined(s) || s == "")
	{
		return def;
	}
	return Int(s);
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_83bfc44a
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1028
	Size: 0x50
	Parameters: 3
	Flags: None
	Line Number: 378
*/
function function_83bfc44a(stats, key, def)
{
	if(isdefined(stats[key]))
	{
		return Int(stats[key]);
	}
	return def;
}

/*
	Name: function_acccd996
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1080
	Size: 0x40
	Parameters: 3
	Flags: None
	Line Number: 397
*/
function function_acccd996(stats, key, value)
{
	stats[key] = Int(value);
}

/*
	Name: function_ac54cbd3
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x10C8
	Size: 0xA0
	Parameters: 4
	Flags: None
	Line Number: 412
*/
function function_ac54cbd3(stats, key, lo, Hi)
{
	if(!isdefined(stats[key]))
	{
		return;
	}
	V = Int(stats[key]);
	if(V < lo)
	{
		V = lo;
	}
	if(V > Hi)
	{
		V = Hi;
	}
	stats[key] = V;
}

/*
	Name: function_25662d7
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1170
	Size: 0x48
	Parameters: 3
	Flags: None
	Line Number: 440
*/
function function_25662d7(x, lo, Hi)
{
	if(x < lo)
	{
		return lo;
	}
	if(x > Hi)
	{
		return Hi;
	}
	return x;
}

/*
	Name: Tune
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x11C0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 463
*/
function Tune()
{
	if(!isdefined(level.var_5334adc4))
	{
		level.var_5334adc4 = spawnstruct();
		level.var_5334adc4.var_e1906126 = 100;
		level.var_5334adc4.var_f7909cf1 = 21;
		level.var_5334adc4.var_8b004135 = 800;
	}
	return level.var_5334adc4;
	continue;
}

/*
	Name: function_3835f2bb
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1238
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 486
*/
function function_3835f2bb(levelnum)
{
	levelnum = max(1, levelnum);
	Total = 0;
	base = Tune().var_8b004135;
	for(i = 1; i < levelnum; i++)
	{
		Total = Total + ceil(base * pow(i, 1.5));
	}
	return Total;
}

/*
	Name: function_13c3e29d
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1308
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 508
*/
function function_13c3e29d(var_cc1ac5e5)
{
	if(var_cc1ac5e5 >= Tune().var_e1906126)
	{
		return 0;
	}
	return ceil(Tune().var_8b004135 * pow(var_cc1ac5e5, 1.5));
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6d365278
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1390
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 528
*/
function function_6d365278()
{
	function_86997cbe();
	Tune();
	level thread function_c4b6d279();
	for(;;)
	{
		level waittill("connected", player);
		player thread function_6c06566a();
	}
}

/*
	Name: function_6c06566a
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1408
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 550
*/
function function_6c06566a()
{
	self endon("disconnect");
	if(!isdefined(level.var_98fe8b71))
	{
		function_86997cbe();
	}
	self.var_4fabb83f = spawnstruct();
	self.var_4fabb83f.stats = [];
	for(i = 0; i < level.var_98fe8b71.size; i++)
	{
		K = level.var_98fe8b71[i].key;
		d = level.var_98fe8b71[i].def;
		self.var_4fabb83f.stats[K] = d;
	}
	self.var_4fabb83f.var_3e021aec = function_13c3e29d(function_83bfc44a(self.var_4fabb83f.stats, "lvl", 1));
	self.var_296161c7 = 0;
	wait(0.5);
	level flag::wait_till("reap_collection_loaded");
	self thread function_cde7508c();
	wait(0.5);
	self LUINotifyEvent(&"leveling_cf", 1, 2);
	wait(0.1);
	self thread function_b0beec11();
	self thread function_dfa48eb5();
	zm_spawner::register_zombie_death_event_callback(&function_2d63ee1f);
	self thread function_e3663094();
}

/*
	Name: function_cde7508c
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1630
	Size: 0x2D8
	Parameters: 0
	Flags: None
	Line Number: 589
*/
function function_cde7508c()
{
	self endon("disconnect");
	if(isdefined(self.var_589e13ca) && self.var_589e13ca)
	{
		return;
	}
	while(1)
	{
		self waittill("menuresponse", menu, payload);
		if(menu != "reap_leveling_load")
		{
			continue;
		}
		parts = StrTok(payload, ",");
		if(!isdefined(parts) || parts.size <= 0)
		{
			continue;
		}
		sT = self.var_4fabb83f;
		for(i = 0; i < parts.size; i++)
		{
			KVP = StrTok(parts[i], "=");
			if(isdefined(KVP) && KVP.size >= 2)
			{
				K = function_14483d92(KVP[0]);
				V = function_14483d92(KVP[1]);
				if(isdefined(K) && K != "")
				{
					stat = function_55f052bf(K);
					if(isdefined(stat))
					{
						sT.stats[K] = V;
					}
				}
			}
		}
		sT.var_3e021aec = function_13c3e29d(function_83bfc44a(sT.stats, "lvl", 1));
		if(function_83bfc44a(sT.stats, "lvl", 1) == Tune().var_e1906126)
		{
			sT.stats["xp"] = 0;
			sT.var_3e021aec = 0;
		}
		self.var_296161c7 = 1;
		self function_766c005c();
		self.var_589e13ca = 1;
		break;
	}
}

/*
	Name: function_766c005c
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1910
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 649
*/
function function_766c005c()
{
	if(isdefined(self.var_d685f418))
	{
		if(isdefined(self.var_93482403))
		{
			return;
		}
		self.var_93482403 = 1;
		wait(2);
		self.var_93482403 = undefined;
	}
	self.var_d685f418 = 1;
	sT = self.var_4fabb83f;
	if(!isdefined(sT))
	{
		return;
	}
	var_477d359 = function_83bfc44a(sT.stats, "xp", 0);
	var_cc1ac5e5 = function_83bfc44a(sT.stats, "lvl", 1);
	var_faf79137 = function_83bfc44a(sT.stats, "pres", 0);
	self LUINotifyEvent(&"leveling_cf", 5, 0, Int(var_477d359), Int(var_cc1ac5e5), Int(var_faf79137), Int(sT.var_3e021aec));
	wait(1);
	self.var_d685f418 = undefined;
	return;
}

/*
	Name: function_b77a6e9b
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1AB8
	Size: 0x390
	Parameters: 2
	Flags: None
	Line Number: 686
*/
function function_b77a6e9b(amount, reason)
{
	if(!isdefined(self.var_296161c7) || !self.var_296161c7)
	{
		return;
	}
	if(!isdefined(self.var_4fabb83f))
	{
		return;
	}
	if(!(isdefined(level.var_908190f0) && level.var_908190f0))
	{
		if(!isdefined(level.var_7712069a))
		{
			level.var_7712069a = 1;
			IPrintLnBold("RANKING UNAVALIABLE WITH CHEAT SETTINGS");
			return;
		}
	}
	if(IsGodMode(self))
	{
		level.var_908190f0 = 0;
		return;
	}
	if(reason == "open_door" && isdefined(self.bgb) && self.bgb == "zm_bgb_shopping_free")
	{
		return;
	}
	sT = self.var_4fabb83f;
	XP = function_83bfc44a(sT.stats, "xp", 0);
	var_7d6ad40e = function_83bfc44a(sT.stats, "doublexp", 0);
	gain = Int(amount);
	if(var_7d6ad40e)
	{
		gain = gain + Int(amount);
	}
	XP = XP + gain;
	sT.stats["xp"] = XP;
	while(XP >= sT.var_3e021aec && function_83bfc44a(sT.stats, "lvl", 1) < Tune().var_e1906126)
	{
		XP = XP - sT.var_3e021aec;
		sT.stats["xp"] = XP;
		var_4aa395d9 = function_83bfc44a(sT.stats, "lvl", 1) + 1;
		sT.stats["lvl"] = var_4aa395d9;
		sT.var_3e021aec = function_13c3e29d(var_4aa395d9);
		self playsound("mpl_level_up");
	}
	if(function_83bfc44a(sT.stats, "lvl", 1) == Tune().var_e1906126)
	{
		sT.stats["xp"] = 0;
		sT.var_3e021aec = 0;
	}
	self function_766c005c();
}

/*
	Name: function_c4b6d279
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1E50
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 751
*/
function function_c4b6d279()
{
	level thread function_6c3aa976();
}

/*
	Name: function_7cc370f7
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1E78
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 766
*/
function function_7cc370f7()
{
	if(!isdefined(self.var_4fabb83f))
	{
		return;
	}
	keys = [];
	keys[keys.size] = "xp";
	keys[keys.size] = "lvl";
	for(i = 0; i < keys.size; i++)
	{
		K = keys[i];
		idx = function_a8ecd90(K);
		if(idx >= 0)
		{
			V = function_83bfc44a(self.var_4fabb83f.stats, K, 0);
			self function_3ebd63e9(idx, V);
		}
	}
}

/*
	Name: function_6c3aa976
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x1F90
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 797
*/
function function_6c3aa976()
{
	level.var_1f1a54d4 = 0;
	var_70c5ca94 = 10;
	for(;;)
	{
		type = level util::waittill_any_return("end_of_round", "end_game");
		if(type == "end_of_round")
		{
			var_70c5ca94--;
			if(var_70c5ca94 > 0)
			{
			}
			var_70c5ca94 = 5;
		}
		else
		{
			if(level.var_1f1a54d4)
			{
			}
			else
			{
				level.var_1f1a54d4 = 1;
				players = GetPlayers();
				for(i = 0; i < players.size; i++)
				{
					p = players[i];
					if(!isdefined(p) || !isdefined(p.var_4fabb83f))
					{
						continue;
					}
					p function_228d36f8();
					p function_7cc370f7();
					p thread function_7051c0ec();
					wait(0.02);
				}
				level.var_1f1a54d4 = 0;
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dfa48eb5
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2118
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 851
*/
function function_dfa48eb5()
{
	self.var_64a280e6 = [];
	for(;;)
	{
		self waittill("perk_purchased", perk);
		if(!isdefined(self.var_64a280e6[perk]))
		{
			self thread function_b77a6e9b(250, "first time perk purchase");
			self.var_64a280e6[perk] = 1;
		}
	}
}

/*
	Name: function_b0beec11
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2198
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 875
*/
function function_b0beec11()
{
	for(;;)
	{
		type = self util::waittill_any_return("boarding_window");
		if(type == "boarding_window")
		{
			self thread function_b77a6e9b(10, "board repair");
		}
	}
}

/*
	Name: function_2d63ee1f
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2208
	Size: 0x1D0
	Parameters: 1
	Flags: None
	Line Number: 897
*/
function function_2d63ee1f(attacker)
{
	if(isdefined(attacker) && isPlayer(attacker) && isdefined(self.damageWeapon) && isdefined(self.damageWeapon.name))
	{
		if(!(isdefined(level.var_908190f0) && level.var_908190f0))
		{
			if(!isdefined(level.var_7712069a))
			{
				level.var_7712069a = 1;
				IPrintLnBold("RANKING UNAVALIABLE WITH CHEAT SETTINGS");
			}
		}
		else
		{
			weap = self.damageWeapon;
			is_upgraded = 0;
			if(zm_weapons::is_weapon_upgraded(weap))
			{
				is_upgraded = 1;
			}
			weap = zm_weapons::get_base_weapon(weap);
			is_headshot = 0;
			if(isdefined(self.damagelocation) && isdefined(self.damageMod) && zm_utility::is_headshot(weap, self.damagelocation, self.damageMod))
			{
				is_headshot = 1;
			}
			if(weap.name == "pistol_m1911_lh_upgraded")
			{
				attacker function_dc6fad6b("pistol_m1911_upgraded", is_headshot, is_upgraded);
			}
			else
			{
				attacker function_dc6fad6b(weap.name, is_headshot, is_upgraded);
				return;
			}
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e3663094
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x23E0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 947
*/
function function_e3663094()
{
	self.var_15f41855 = [];
	self.var_adf70206 = [];
	self.var_20db5f5 = [];
	self.var_3b5e62e9 = [];
	self thread function_79c11806();
	while(1)
	{
		self waittill("weapon_give", weapon);
		weapon = zm_weapons::get_base_weapon(weapon);
		self function_6954042c(weapon.name);
	}
}

/*
	Name: function_79c11806
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2498
	Size: 0x1D0
	Parameters: 0
	Flags: None
	Line Number: 972
*/
function function_79c11806()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse", menu, payload);
		if(menu != "reap_leveling_load")
		{
		}
		else
		{
			parts = StrTok(payload, ",");
			if(!isdefined(parts) || parts.size <= 0)
			{
			}
			else
			{
				sT = self.var_4fabb83f;
				if(!isdefined(sT))
				{
				}
				else
				{
					for(i = 0; i < parts.size; i++)
					{
						KVP = StrTok(parts[i], "=");
						if(isdefined(KVP) && KVP.size >= 2)
						{
							K = function_14483d92(KVP[0]);
							V = function_6d77519a(function_14483d92(KVP[1]), 0);
							stat = function_55f052bf(K);
							if(isdefined(stat))
							{
								sT.stats[K] = V;
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_6954042c
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2670
	Size: 0x2E8
	Parameters: 1
	Flags: None
	Line Number: 1025
*/
function function_6954042c(weapon)
{
	if(!isdefined(self.var_4fabb83f))
	{
		return 0;
	}
	if(!isdefined(self.var_adf70206))
	{
		self.var_adf70206 = [];
	}
	if(!isdefined(self.var_20db5f5))
	{
		self.var_20db5f5 = [];
	}
	if(!isdefined(self.var_3b5e62e9))
	{
		self.var_3b5e62e9 = [];
	}
	if(isdefined(self.var_adf70206[weapon]) && self.var_adf70206[weapon])
	{
		return 0;
	}
	if(!isdefined(self.var_20db5f5[weapon]))
	{
		keys = [];
		K = "wkills_" + weapon;
		if(isdefined(function_55f052bf(K)))
		{
			keys[keys.size] = K;
		}
		K = "wupgkills_" + weapon;
		if(isdefined(function_55f052bf(K)))
		{
			keys[keys.size] = K;
		}
		K = "whead_" + weapon;
		if(isdefined(function_55f052bf(K)))
		{
			keys[keys.size] = K;
		}
		K = "wpap_override_" + weapon;
		if(isdefined(function_55f052bf(K)))
		{
			keys[keys.size] = K;
		}
		if(keys.size <= 0)
		{
			self.var_adf70206[weapon] = 1;
			return 0;
		}
		self.var_20db5f5[weapon] = keys;
	}
	if(!isdefined(self.var_3b5e62e9[weapon]) || !self.var_3b5e62e9[weapon])
	{
		keys = self.var_20db5f5[weapon];
		for(i = 0; i < keys.size; i++)
		{
			idx = function_a8ecd90(keys[i]);
			if(idx >= 0)
			{
				self LUINotifyEvent(&"leveling_cf", 2, 4, Int(idx));
				wait(0.02);
			}
		}
		self.var_3b5e62e9[weapon] = 1;
	}
	return 1;
}

/*
	Name: function_dc6fad6b
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2960
	Size: 0x240
	Parameters: 3
	Flags: None
	Line Number: 1104
*/
function function_dc6fad6b(weapon, is_headshot, is_upgraded)
{
	if(!self function_6954042c(weapon))
	{
		return;
	}
	sT = self.var_4fabb83f;
	if(!isdefined(sT))
	{
		return;
	}
	K = "wkills_" + weapon;
	if(isdefined(sT.stats[K]))
	{
		sT.stats[K] = Int(function_83bfc44a(sT.stats, K, 0) + 1);
	}
	if(is_upgraded)
	{
		K = "wupgkills_" + weapon;
		if(isdefined(sT.stats[K]))
		{
			sT.stats[K] = Int(function_83bfc44a(sT.stats, K, 0) + 1);
		}
	}
	if(is_headshot)
	{
		K = "whead_" + weapon;
		if(isdefined(sT.stats[K]))
		{
			sT.stats[K] = Int(function_83bfc44a(sT.stats, K, 0) + 1);
		}
	}
	if(!isdefined(self.var_15f41855))
	{
		self.var_15f41855 = [];
	}
	if(!function_68bfc17e(self.var_15f41855, weapon))
	{
		self.var_15f41855[self.var_15f41855.size] = weapon;
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_228d36f8
	Namespace: namespace_3bad7368
	Checksum: 0x424F4353
	Offset: 0x2BA8
	Size: 0x1BC
	Parameters: 0
	Flags: None
	Line Number: 1158
*/
function function_228d36f8()
{
	if(!isdefined(self.var_4fabb83f))
	{
		return;
	}
	if(!isdefined(self.var_15f41855))
	{
		return;
	}
	if(!isdefined(self.var_4c185828))
	{
		self.var_4c185828 = [];
	}
	for(w = 0; w < self.var_15f41855.size; w++)
	{
		weapon = self.var_15f41855[w];
		keys = self.var_20db5f5[weapon];
		if(!isdefined(keys))
		{
			continue;
		}
		for(i = 0; i < keys.size; i++)
		{
			K = keys[i];
			idx = function_a8ecd90(K);
			if(idx < 0)
			{
				continue;
			}
			V = function_83bfc44a(self.var_4fabb83f.stats, K, 0);
			if(isdefined(self.var_4c185828[K]) && self.var_4c185828[K] == V)
			{
				continue;
			}
			self function_3ebd63e9(idx, V);
			self.var_4c185828[K] = V;
		}
	}
	self.var_15f41855 = [];
}

