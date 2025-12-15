#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\vk_script\_zm_vk_general;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;

#namespace namespace_b4fe880e;

/*
	Name: init
	Namespace: namespace_b4fe880e
	Checksum: 0x3EA5B3D2
	Offset: 0xCA0
	Size: 0x5D0
	Parameters: 0
	Flags: AutoExec
	Line Number: 37
*/
function autoexec init()
{
	callback::on_connect(&function_7c884208);
	level waittill("hash_f938585a");
	modvar("vk_devprint_stats", "0");
	SetDvar("vk_devprint_stats", 0);
	level thread function_fa11eb88();
	wait(0.05);
	zm_spawner::register_zombie_damage_callback(&function_edd30d32);
	zm_spawner::register_zombie_death_event_callback(&function_cd5261f1);
	level.var_483657e1[0] = "iw8_iso";
	level.var_483657e1[1] = "iw8_fennec";
	level.var_483657e1[2] = "t9_smg_standard";
	level.var_483657e1[3] = "t9_smg_capacity";
	level.var_483657e1[4] = "t9_smg_heavy";
	level.var_483657e1[5] = "t9_smg_burst";
	level.var_483657e1[6] = "t9_smg_fastfire";
	level.var_483657e1[7] = "t9_smg_accurate";
	level.var_483657e1[8] = "t9_smg_spray";
	level.var_f6b775a7[0] = "t9_ar_slowhandling";
	level.var_f6b775a7[1] = "iw8_asval";
	level.var_f6b775a7[2] = "iw8_oden";
	level.var_f6b775a7[3] = "t9_ar_fasthandling";
	level.var_f6b775a7[4] = "iw8_m13";
	level.var_f6b775a7[5] = "iw8_kilo141";
	level.var_f6b775a7[6] = "iw8_grau556";
	level.var_f6b775a7[7] = "t9_ar_damage";
	level.var_f6b775a7[8] = "t9_ar_fastfire";
	level.var_f6b775a7[9] = "t9_ar_accurate";
	level.var_f6b775a7[10] = "t9_ar_standard";
	level.var_f6b775a7[11] = "t9_ar_mobility";
	level.var_5385279c[0] = "t9_tr_powerburst";
	level.var_5385279c[1] = "t9_tr_longburst";
	level.var_5385279c[2] = "t9_tr_precisionsemi";
	level.var_5385279c[3] = "t9_tr_fastburst";
	level.var_5385279c[4] = "iw8_mk2carbine";
	level.var_5385279c[5] = "iw8_sig550";
	level.var_5385279c[6] = "iw8_vks";
	level.var_117675fd[0] = "t9_sniper_powersemi";
	level.var_117675fd[1] = "t9_sniper_quickscope";
	level.var_117675fd[2] = "t9_sniper_standard";
	level.var_117675fd[3] = "t9_sniper_cannon";
	level.var_117675fd[4] = "t9_sniper_accurate";
	level.var_117675fd[5] = "iw8_ax50";
	level.var_117675fd[6] = "iw8_hdr";
	level.var_4cd34586[0] = "iw8_holger26";
	level.var_4cd34586[1] = "t9_lmg_light";
	level.var_4cd34586[2] = "t9_lmg_accurate";
	level.var_4cd34586[3] = "t9_lmg_slowfire";
	level.var_f3426b60[0] = "iw8_725";
	level.var_f3426b60[1] = "t9_shotgun_semiauto";
	level.var_f3426b60[2] = "t9_shotgun_pump";
	level.var_f3426b60[3] = "t9_shotgun_fullauto";
	level.var_b6105691[0] = "iw8_50gs";
	level.var_b6105691[1] = "t9_pistol_burst";
	level.var_b6105691[2] = "t9_pistol_revolver";
	level.var_b6105691[3] = "t9_pistol_semiauto";
	level.var_b6105691[4] = "iw8_357";
	level.var_34fc60ed[0] = "t9_launcher_freefire";
	level.var_1dba4fd[0] = "knife";
	level.var_1dba4fd[1] = "knife_widows_wine";
	level.var_46f530ac[0] = "t9_zm_raygun";
	level.var_46f530ac[1] = "thundergun";
	level.var_46f530ac[2] = "t9_streak_bow";
	level.var_46f530ac[3] = "t9_streak_death_machine";
}

/*
	Name: function_fa11eb88
	Namespace: namespace_b4fe880e
	Checksum: 0x4FEF69AB
	Offset: 0x1278
	Size: 0x728
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function function_fa11eb88()
{
	modvar("vk_give_random_class", "");
	SetDvar("vk_give_random_class", "");
	while(1)
	{
		if(GetDvarString("vk_give_random_class") != "")
		{
			string = GetDvarString("vk_give_random_class");
			player = GetPlayers();
			switch(string)
			{
				case "smg":
				{
					gun = function_ecf5e06f(level.var_483657e1, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5SMG");
					break;
				}
				case "ar":
				{
					gun = function_ecf5e06f(level.var_f6b775a7, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Assault Rifle");
					break;
				}
				case "tr":
				{
					gun = function_ecf5e06f(level.var_5385279c, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Tactical Rifle");
					break;
				}
				case "sniper":
				{
					gun = function_ecf5e06f(level.var_117675fd, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Sniper Rifle");
					break;
				}
				case "lmg":
				{
					gun = function_ecf5e06f(level.var_4cd34586, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Light Machine Gun");
					break;
				}
				case "shotgun":
				{
					gun = function_ecf5e06f(level.var_f3426b60, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Shotgun");
					break;
				}
				case "pistol":
				{
					gun = function_ecf5e06f(level.var_b6105691, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Pistol");
					break;
				}
				case "launcher":
				{
					gun = function_ecf5e06f(level.var_34fc60ed, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Launcher");
					break;
				}
				case "special":
				{
					gun = function_ecf5e06f(level.var_46f530ac, player[0]);
					player[0] zm_weapons::weapon_give(GetWeapon(gun), 0, 0, 1, 1);
					function_e543685a("Given weapon ^3" + GetWeapon(gun).name + "^7 of class ^5Special / Wonder Weapon");
					break;
				}
			}
			SetDvar("vk_give_random_class", "");
		}
		wait(0.1);
	}
}

/*
	Name: function_ecf5e06f
	Namespace: namespace_b4fe880e
	Checksum: 0xDC11BEB2
	Offset: 0x19A8
	Size: 0x120
	Parameters: 2
	Flags: None
	Line Number: 206
*/
function function_ecf5e06f(var_713dcc9d, player)
{
	var_a70be596 = var_713dcc9d;
	var_e9d99ef3 = player getweaponslistprimaries();
	foreach(var_c6fa593f in var_e9d99ef3)
	{
		ArrayRemoveValue(var_a70be596, var_c6fa593f.name);
	}
	var_95628218 = Array::randomize(var_a70be596);
	gun = var_95628218[0];
	return gun;
}

/*
	Name: function_7c884208
	Namespace: namespace_b4fe880e
	Checksum: 0xBF7B0365
	Offset: 0x1AD0
	Size: 0x6F8
	Parameters: 0
	Flags: None
	Line Number: 229
*/
function function_7c884208()
{
	self.var_d00176e7 = 0;
	self.var_a806d497 = 0;
	self.var_ed76716d = 0;
	self.var_4448a672 = 0;
	self.var_85dfa7b4 = 0;
	self.var_f551ba95 = 0;
	self.var_81a07ac4 = 0;
	self.var_814caf1c = 0;
	self.var_ea61ec54 = 0;
	self.var_4319d21b = 0;
	self.var_8d6e2764 = 0;
	self.var_d5c90bdb = 0;
	self.var_6885db1c = 0;
	self thread function_2113a89c("smg");
	self.var_6fbed849 = 0;
	self.var_3462f8b1 = 0;
	self.var_9924f0cb = 0;
	self.var_711a6974 = 0;
	self.var_1101523a = 0;
	self.var_1412e3a7 = 0;
	self.var_1f0dff26 = 0;
	self.var_72791682 = 0;
	self.var_fd31e42 = 0;
	self.var_16a3cc59 = 0;
	self.var_37d81b82 = 0;
	self.var_bdbdfe59 = 0;
	self.var_bfaa335e = 0;
	self thread function_2113a89c("ar");
	self.var_44a66b04 = 0;
	self.var_c8df4036 = 0;
	self.var_cf8ed6fc = 0;
	self.var_7ff4fc8d = 0;
	self.var_14d73559 = 0;
	self.var_f6a4e618 = 0;
	self.var_b70b3b99 = 0;
	self.var_1a17eb4f = 0;
	self.var_d1b0f91 = 0;
	self.var_8bd3cb2 = 0;
	self.var_d470db7 = 0;
	self.var_7960782a = 0;
	self.var_c1257eb1 = 0;
	self thread function_2113a89c("tr");
	self.var_d4022d83 = 0;
	self.var_1e72bb8b = 0;
	self.var_a5d91f81 = 0;
	self.var_b74b82ee = 0;
	self.var_7109f0a0 = 0;
	self.var_11d39271 = 0;
	self.var_2734f560 = 0;
	self.var_e3a5a248 = 0;
	self.var_f0fc7d08 = 0;
	self.var_5d7ec9ef = 0;
	self.var_4456b50 = 0;
	self.var_a22eda17 = 0;
	self.var_3fd6dab0 = 0;
	self thread function_2113a89c("sr");
	self.var_c5468642 = 0;
	self.var_b8d761f4 = 0;
	self.var_4ad0bc9e = 0;
	self.var_877ee6c3 = 0;
	self.var_9f2db19b = 0;
	self.var_78306dce = 0;
	self.var_942f1d37 = 0;
	self.var_9cbd25c9 = 0;
	self.var_29b75c2b = 0;
	self.var_fffc111c = 0;
	self.var_fe7e2da1 = 0;
	self.var_7a556cc = 0;
	self.var_f36d04ff = 0;
	self thread function_2113a89c("lmg");
	self.var_fdbda598 = 0;
	self.var_8a95a372 = 0;
	self.var_18dc8dd8 = 0;
	self.var_74f9a1e1 = 0;
	self.var_b7b0715d = 0;
	self.var_20f8999c = 0;
	self.var_ea19e7d = 0;
	self.var_8f02f623 = 0;
	self.var_a36d6d1d = 0;
	self.var_dcafa57e = 0;
	self.var_d379385b = 0;
	self.var_e277dd9e = 0;
	self.var_3dc733cd = 0;
	self thread function_2113a89c("sg");
	self.var_66a60e57 = 0;
	self.var_a786cec7 = 0;
	self.var_26a2c71d = 0;
	self.var_721d122 = 0;
	self.var_db853f04 = 0;
	self.var_3adc625 = 0;
	self.var_dec053b4 = 0;
	self.var_926fe68c = 0;
	self.var_fe117224 = 0;
	self.var_163a962b = 0;
	self.var_f74aef54 = 0;
	self.var_3b08252b = 0;
	self.var_d8aeb00c = 0;
	self thread function_2113a89c("ps");
	self.var_ef954473 = 0;
	self.var_7d1322bb = 0;
	self.var_edbdc05e = 0;
	self.var_b5c53e30 = 0;
	self.var_e536af81 = 0;
	self.var_9579cf10 = 0;
	self.var_41365b78 = 0;
	self.var_dfc891d8 = 0;
	self.var_d1f2317f = 0;
	self.var_24feac80 = 0;
	self.var_38f5baa7 = 0;
	self.var_6b5bb5e0 = 0;
	self thread function_2113a89c("lc");
	self.var_b92b3203 = 0;
	self.var_17a750b = 0;
	self.var_aec0976e = 0;
	self.var_7e593620 = 0;
	self.var_fd28fbf1 = 0;
	self.var_128a5ee0 = 0;
	self.var_db1ab6c8 = 0;
	self.var_cefa6a88 = 0;
	self.var_25214b6f = 0;
	self thread function_2113a89c("ml");
	self.var_995a1fd4 = 0;
	self.var_4cc510c6 = 0;
	self.var_90b38f9d = 0;
	self.var_2c845909 = 0;
	self.var_585243c8 = 0;
	self.var_e82daea9 = 0;
	self.var_575be41f = 0;
	self.var_9109f401 = 0;
	self.var_f8724b62 = 0;
	self.var_ca1b6907 = 0;
	self.var_bc02071a = 0;
	self.var_c10d7201 = 0;
	self thread function_2113a89c("ww");
	return;
	.var_0 = undefined;
}

/*
	Name: function_edd30d32
	Namespace: namespace_b4fe880e
	Checksum: 0x56A5D636
	Offset: 0x21D0
	Size: 0x938
	Parameters: 13
	Flags: None
	Line Number: 379
*/
function function_edd30d32(mod, HIT_LOCATION, hit_origin, player, amount, weapon, direction_vec, tagName, modelName, partName, dFlags, inflictor, chargeLevel)
{
	foreach(var_c6fa593f in level.var_483657e1)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_d00176e7 = player.var_d00176e7 + amount;
			function_e543685a("^1(Stats)^7 SMG Damage ^3" + player.var_d00176e7, 0);
		}
	}
	foreach(var_c6fa593f in level.var_f6b775a7)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_6fbed849 = player.var_6fbed849 + amount;
			function_e543685a("^1(Stats)^7 Assualt Rifle Damage ^3" + player.var_6fbed849, 0);
		}
	}
	foreach(var_c6fa593f in level.var_5385279c)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_44a66b04 = player.var_44a66b04 + amount;
			function_e543685a("^1(Stats)^7 Tactical Rifle Damage ^3" + player.var_44a66b04, 0);
		}
	}
	foreach(var_c6fa593f in level.var_117675fd)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_d4022d83 = player.var_d4022d83 + amount;
			function_e543685a("^1(Stats)^7 Sniper Rifle Damage ^3" + player.var_d4022d83, 0);
		}
	}
	foreach(var_c6fa593f in level.var_4cd34586)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_c5468642 = player.var_c5468642 + amount;
			function_e543685a("^1(Stats)^7 LMG Damage ^3" + player.var_c5468642, 0);
		}
	}
	foreach(var_c6fa593f in level.var_f3426b60)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_fdbda598 = player.var_fdbda598 + amount;
			function_e543685a("^1(Stats)^7 LMG Damage ^3" + player.var_fdbda598, 0);
		}
	}
	foreach(var_c6fa593f in level.var_b6105691)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_66a60e57 = player.var_66a60e57 + amount;
			function_e543685a("^1(Stats)^7 Pistol Damage ^3" + player.var_66a60e57, 0);
		}
	}
	foreach(var_c6fa593f in level.var_34fc60ed)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_ef954473 = player.var_ef954473 + amount;
			function_e543685a("^1(Stats)^7 Launcher Damage ^3" + player.var_ef954473, 0);
		}
	}
	foreach(var_c6fa593f in level.var_1dba4fd)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_b92b3203 = player.var_b92b3203 + amount;
			function_e543685a("^1(Stats)^7 Melee Damage ^3" + player.var_b92b3203, 0);
		}
	}
	foreach(var_c6fa593f in level.var_46f530ac)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_995a1fd4 = player.var_995a1fd4 + amount;
			function_e543685a("^1(Stats)^7 Special Damage ^3" + player.var_995a1fd4, 0);
		}
	}
	team = player.team;
	if(level.zombie_vars[team]["zombie_insta_kill"] == 1)
	{
		thread function_cd5261f1(player);
	}
	return 0;
}

/*
	Name: function_cd5261f1
	Namespace: namespace_b4fe880e
	Checksum: 0xB876F05C
	Offset: 0x2B10
	Size: 0x1618
	Parameters: 1
	Flags: None
	Line Number: 479
*/
function function_cd5261f1(player)
{
	weapon = self.damageWeapon;
	mod = self.damageMod;
	damage = self.damageTaken;
	foreach(var_c6fa593f in level.var_483657e1)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_d00176e7 = player.var_d00176e7 + damage;
			function_e543685a("^1(Stats)^7 SMG Damage ^3" + player.var_d00176e7, 0);
			player.var_a806d497++;
			function_e543685a("^1(Stats)^7 SMG Kills ^3" + player.var_a806d497);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_ed76716d++;
				function_e543685a("^1(Stats)^7 SMG Headshot Kill ^3" + player.var_ed76716d);
			}
			if(player GetStance() == "stand")
			{
				player.var_4448a672++;
				function_e543685a("^1(Stats)^7 SMG Standing Kill ^3" + player.var_4448a672);
			}
			if(player GetStance() == "crouch")
			{
				player.var_85dfa7b4++;
				function_e543685a("^1(Stats)^7 SMG Crouching Kill ^3" + player.var_85dfa7b4);
			}
			if(player GetStance() == "prone")
			{
				player.var_f551ba95++;
				function_e543685a("^1(Stats)^7 SMG Proning Kill ^3" + player.var_f551ba95);
			}
			if(player IsSliding())
			{
				player.var_81a07ac4++;
				function_e543685a("^1(Stats)^7 SMG Sliding Kill ^3" + player.var_81a07ac4);
			}
			if(!player IsOnGround())
			{
				player.var_814caf1c++;
				function_e543685a("^1(Stats)^7 SMG Airborne Kill ^3" + player.var_814caf1c);
			}
		}
	}
	foreach(var_c6fa593f in level.var_f6b775a7)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_6fbed849 = player.var_6fbed849 + damage;
			function_e543685a("^1(Stats)^7 Assualt Rifle Damage ^3" + player.var_6fbed849, 0);
			player.var_3462f8b1++;
			function_e543685a("^1(Stats)^7 Assault Rifle Kills ^3" + player.var_3462f8b1);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_9924f0cb++;
				function_e543685a("^1(Stats)^7 Assault Rifle Headshot Kill ^3" + player.var_9924f0cb);
			}
			if(player GetStance() == "stand")
			{
				player.var_711a6974++;
				function_e543685a("^1(Stats)^7 AR Standing Kill ^3" + player.var_711a6974);
			}
			if(player GetStance() == "crouch")
			{
				player.var_1101523a++;
				function_e543685a("^1(Stats)^7 AR Crouching Kill ^3" + player.var_1101523a);
			}
			if(player GetStance() == "prone")
			{
				player.var_1412e3a7++;
				function_e543685a("^1(Stats)^7 AR Proning Kill ^3" + player.var_1412e3a7);
			}
			if(player IsSliding())
			{
				player.var_1f0dff26++;
				function_e543685a("^1(Stats)^7 AR Sliding Kill ^3" + player.var_1f0dff26);
			}
			if(!player IsOnGround())
			{
				player.var_72791682++;
				function_e543685a("^1(Stats)^7 AR Airborne Kill ^3" + player.var_72791682);
			}
		}
	}
	foreach(var_c6fa593f in level.var_5385279c)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_44a66b04 = player.var_44a66b04 + damage;
			function_e543685a("^1(Stats)^7 Tactical Rifle Damage ^3" + player.var_44a66b04, 0);
			player.var_c8df4036++;
			function_e543685a("^1(Stats)^7 Tactical Rifle Kills ^3" + player.var_c8df4036);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_cf8ed6fc++;
				function_e543685a("^1(Stats)^7 Tactical Rifle Headshot Kill ^3" + player.var_cf8ed6fc);
			}
			if(player GetStance() == "stand")
			{
				player.var_7ff4fc8d++;
				function_e543685a("^1(Stats)^7 AR Standing Kill ^3" + player.var_7ff4fc8d);
			}
			if(player GetStance() == "crouch")
			{
				player.var_14d73559++;
				function_e543685a("^1(Stats)^7 AR Crouching Kill ^3" + player.var_14d73559);
			}
			if(player GetStance() == "prone")
			{
				player.var_f6a4e618++;
				function_e543685a("^1(Stats)^7 AR Proning Kill ^3" + player.var_f6a4e618);
			}
			if(player IsSliding())
			{
				player.var_b70b3b99++;
				function_e543685a("^1(Stats)^7 AR Sliding Kill ^3" + player.var_b70b3b99);
			}
			if(!player IsOnGround())
			{
				player.var_1a17eb4f++;
				function_e543685a("^1(Stats)^7 AR Airborne Kill ^3" + player.var_1a17eb4f);
			}
		}
	}
	foreach(var_c6fa593f in level.var_117675fd)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_d4022d83 = player.var_d4022d83 + damage;
			function_e543685a("^1(Stats)^7 Sniper Rifle Damage ^3" + player.var_d4022d83, 0);
			player.var_1e72bb8b++;
			function_e543685a("^1(Stats)^7 Sniper Rifle Kills ^3" + player.var_1e72bb8b);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_a5d91f81++;
				function_e543685a("^1(Stats)^7 Sniper Rifle Headshot Kill ^3" + player.var_a5d91f81);
			}
			if(player GetStance() == "stand")
			{
				player.var_b74b82ee++;
				function_e543685a("^1(Stats)^7 AR Standing Kill ^3" + player.var_b74b82ee);
			}
			if(player GetStance() == "crouch")
			{
				player.var_7109f0a0++;
				function_e543685a("^1(Stats)^7 AR Crouching Kill ^3" + player.var_7109f0a0);
			}
			if(player GetStance() == "prone")
			{
				player.var_11d39271++;
				function_e543685a("^1(Stats)^7 AR Proning Kill ^3" + player.var_11d39271);
			}
			if(player IsSliding())
			{
				player.var_2734f560++;
				function_e543685a("^1(Stats)^7 AR Sliding Kill ^3" + player.var_2734f560);
			}
			if(!player IsOnGround())
			{
				player.var_e3a5a248++;
				function_e543685a("^1(Stats)^7 AR Airborne Kill ^3" + player.var_e3a5a248);
			}
		}
	}
	foreach(var_c6fa593f in level.var_4cd34586)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_c5468642 = player.var_c5468642 + damage;
			function_e543685a("^1(Stats)^7 LMG Damage ^3" + player.var_c5468642, 0);
			player.var_b8d761f4++;
			function_e543685a("^1(Stats)^7 Sniper Rifle Kills ^3" + player.var_b8d761f4);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_4ad0bc9e++;
				function_e543685a("^1(Stats)^7 Sniper Rifle Headshot Kill ^3" + player.var_4ad0bc9e);
			}
			if(player GetStance() == "stand")
			{
				player.var_877ee6c3++;
				function_e543685a("^1(Stats)^7 AR Standing Kill ^3" + player.var_877ee6c3);
			}
			if(player GetStance() == "crouch")
			{
				player.var_9f2db19b++;
				function_e543685a("^1(Stats)^7 AR Crouching Kill ^3" + player.var_9f2db19b);
			}
			if(player GetStance() == "prone")
			{
				player.var_78306dce++;
				function_e543685a("^1(Stats)^7 AR Proning Kill ^3" + player.var_78306dce);
			}
			if(player IsSliding())
			{
				player.var_942f1d37++;
				function_e543685a("^1(Stats)^7 AR Sliding Kill ^3" + player.var_942f1d37);
			}
			if(!player IsOnGround())
			{
				player.var_9cbd25c9++;
				function_e543685a("^1(Stats)^7 AR Airborne Kill ^3" + player.var_9cbd25c9);
			}
		}
	}
	foreach(var_c6fa593f in level.var_f3426b60)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_fdbda598 = player.var_fdbda598 + damage;
			function_e543685a("^1(Stats)^7 LMG Damage ^3" + player.var_fdbda598, 0);
			player.var_8a95a372++;
			function_e543685a("^1(Stats)^7 Shotgun Kills ^3" + player.var_8a95a372);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_18dc8dd8++;
				function_e543685a("^1(Stats)^7 Shotgun Headshot Kill ^3" + player.var_18dc8dd8);
			}
		}
	}
	foreach(var_c6fa593f in level.var_b6105691)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_66a60e57 = player.var_66a60e57 + damage;
			function_e543685a("^1(Stats)^7 Pistol Damage ^3" + player.var_66a60e57, 0);
			player.var_a786cec7++;
			function_e543685a("^1(Stats)^7 Pistol Kills ^3" + player.var_a786cec7);
			if(zm_utility::is_headshot(weapon, self.damagelocation, mod))
			{
				player.var_26a2c71d++;
				function_e543685a("^1(Stats)^7 Pistol Headshot Kill ^3" + player.var_26a2c71d);
			}
		}
	}
	foreach(var_c6fa593f in level.var_34fc60ed)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_ef954473 = player.var_ef954473 + damage;
			function_e543685a("^1(Stats)^7 Launcher Damage ^3" + player.var_ef954473, 0);
			player.var_7d1322bb++;
			function_e543685a("^1(Stats)^7 Launcher Kills ^3" + player.var_7d1322bb);
		}
	}
	foreach(var_c6fa593f in level.var_1dba4fd)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_b92b3203 = player.var_b92b3203 + damage;
			function_e543685a("^1(Stats)^7 Melee Damage ^3" + player.var_b92b3203, 0);
			player.var_17a750b++;
			function_e543685a("^1(Stats)^7 Melee Kills ^3" + player.var_17a750b);
		}
	}
	foreach(var_c6fa593f in level.var_46f530ac)
	{
		if(weapon == GetWeapon(var_c6fa593f))
		{
			player.var_995a1fd4 = player.var_995a1fd4 + damage;
			function_e543685a("^1(Stats)^7 Special Damage ^3" + player.var_995a1fd4, 0);
			player.var_4cc510c6++;
			function_e543685a("^1(Stats)^7 Special Kills ^3" + player.var_4cc510c6);
		}
	}
	return 0;
}

/*
	Name: function_2113a89c
	Namespace: namespace_b4fe880e
	Checksum: 0xC3BF5135
	Offset: 0x4130
	Size: 0x9E0
	Parameters: 1
	Flags: None
	Line Number: 757
*/
function function_2113a89c(var_f963a54a)
{
	self endon("disconnect");
	if(var_f963a54a == "smg")
	{
		while(1)
		{
			combo = self.var_a806d497 + 3;
			ultra = self.var_a806d497 + 9;
			waiter = self.var_a806d497 + 1;
			while(waiter < self.var_a806d497)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_a806d497)
			{
				self.var_ea61ec54++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_ea61ec54);
			}
			if(ultra < self.var_a806d497)
			{
				self.var_4319d21b++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_4319d21b);
			}
		}
	}
	else if(var_f963a54a == "ar")
	{
		while(1)
		{
			combo = self.var_3462f8b1 + 3;
			ultra = self.var_3462f8b1 + 9;
			waiter = self.var_3462f8b1 + 1;
			while(waiter < self.var_3462f8b1)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_3462f8b1)
			{
				self.var_fd31e42++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_fd31e42);
			}
			if(ultra < self.var_3462f8b1)
			{
				self.var_16a3cc59++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_16a3cc59);
			}
		}
	}
	else if(var_f963a54a == "tr")
	{
		while(1)
		{
			combo = self.var_c8df4036 + 3;
			ultra = self.var_c8df4036 + 9;
			waiter = self.var_c8df4036 + 1;
			while(waiter < self.var_c8df4036)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_c8df4036)
			{
				self.var_d1b0f91++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_d1b0f91);
			}
			if(ultra < self.var_c8df4036)
			{
				self.var_8bd3cb2++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_8bd3cb2);
			}
		}
	}
	else if(var_f963a54a == "sr")
	{
		while(1)
		{
			combo = self.var_1e72bb8b + 3;
			ultra = self.var_1e72bb8b + 9;
			waiter = self.var_1e72bb8b + 1;
			while(waiter < self.var_1e72bb8b)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_1e72bb8b)
			{
				self.var_f0fc7d08++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_f0fc7d08);
			}
			if(ultra < self.var_1e72bb8b)
			{
				self.var_5d7ec9ef++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_5d7ec9ef);
			}
		}
	}
	else if(var_f963a54a == "lmg")
	{
		while(1)
		{
			combo = self.var_b8d761f4 + 3;
			ultra = self.var_b8d761f4 + 9;
			waiter = self.var_b8d761f4 + 1;
			while(waiter < self.var_b8d761f4)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_b8d761f4)
			{
				self.var_29b75c2b++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_29b75c2b);
			}
			if(ultra < self.var_b8d761f4)
			{
				self.var_fffc111c++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_fffc111c);
			}
		}
	}
	else if(var_f963a54a == "sg")
	{
		while(1)
		{
			combo = self.var_8a95a372 + 3;
			ultra = self.var_8a95a372 + 9;
			waiter = self.var_8a95a372 + 1;
			while(waiter < self.var_8a95a372)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_8a95a372)
			{
				self.var_a36d6d1d++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_a36d6d1d);
			}
			if(ultra < self.var_8a95a372)
			{
				self.var_dcafa57e++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_dcafa57e);
			}
		}
	}
	else if(var_f963a54a == "ps")
	{
		while(1)
		{
			combo = self.var_a786cec7 + 3;
			ultra = self.var_a786cec7 + 9;
			waiter = self.var_a786cec7 + 1;
			while(waiter < self.var_a786cec7)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_a786cec7)
			{
				self.var_fe117224++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_fe117224);
			}
			if(ultra < self.var_a786cec7)
			{
				self.var_163a962b++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_163a962b);
			}
		}
	}
	else if(var_f963a54a == "lc")
	{
		while(1)
		{
			combo = self.var_7d1322bb + 3;
			ultra = self.var_7d1322bb + 9;
			waiter = self.var_7d1322bb + 1;
			while(waiter < self.var_7d1322bb)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_7d1322bb)
			{
				self.var_dfc891d8++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_dfc891d8);
			}
			if(ultra < self.var_7d1322bb)
			{
				self.var_d1f2317f++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_d1f2317f);
			}
		}
	}
	else if(var_f963a54a == "ml")
	{
		while(1)
		{
			combo = self.var_17a750b + 3;
			ultra = self.var_17a750b + 9;
			waiter = self.var_17a750b + 1;
			while(waiter < self.var_17a750b)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_17a750b)
			{
				self.var_cefa6a88++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_cefa6a88);
			}
			if(ultra < self.var_17a750b)
			{
				self.var_25214b6f++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_25214b6f);
			}
		}
	}
	else if(var_f963a54a == "ww")
	{
		while(1)
		{
			combo = self.var_4cc510c6 + 3;
			ultra = self.var_4cc510c6 + 9;
			waiter = self.var_4cc510c6 + 1;
			while(waiter < self.var_4cc510c6)
			{
				wait(0.05);
			}
			wait(1.25);
			if(combo < self.var_4cc510c6)
			{
				self.var_9109f401++;
				function_e543685a("^1(Stats)^5 Combo^7 Kills ^3" + self.var_9109f401);
			}
			if(ultra < self.var_4cc510c6)
			{
				self.var_f8724b62++;
				function_e543685a("^1(Stats)^5 Ultra Combo^7 Kills ^3" + self.var_f8724b62);
			}
		}
	}
}

/*
	Name: function_e543685a
	Namespace: namespace_b4fe880e
	Checksum: 0xD8966189
	Offset: 0x4B18
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 1012
*/
function function_e543685a(VAL, center)
{
	if(!isdefined(center))
	{
		center = 1;
	}
	if(GetDvarInt("vk_devprint_stats") != 0)
	{
		if(center)
		{
			IPrintLnBold(VAL);
			continue;
		}
		iprintln(VAL);
		continue;
	}
}

