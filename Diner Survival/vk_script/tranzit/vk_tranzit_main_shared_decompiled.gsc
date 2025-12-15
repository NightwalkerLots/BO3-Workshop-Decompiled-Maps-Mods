#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\animation_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\compass;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\sound_shared;
#include scripts\shared\trigger_shared;
#include scripts\shared\util_shared;
#include scripts\sphynx\craftables\_zm_craft_zombie_shield;
#include scripts\vk_script\_zm_vk_general;
#include scripts\vk_script\bl_fan_suck_trap;
#include scripts\vk_script\bl_rotating_fan_blades;
#include scripts\zm\_load;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_perk_random;
#include scripts\zm\_zm_perk_vulture;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\aats\_zm_aat_aethercollapse;
#include scripts\zm\zm_giant_cleanup_mgr;

#namespace namespace_66db6bf8;

/*
	Name: init
	Namespace: namespace_66db6bf8
	Checksum: 0x5D61E732
	Offset: 0x2228
	Size: 0x148
	Parameters: 0
	Flags: AutoExec
	Line Number: 47
*/
function autoexec init()
{
	clientfield::register("scriptmover", "_cfx_vk_tra_mysterybox_handling_static", 1, 4, "int");
	clientfield::register("scriptmover", "_cfx_vk_tra_mysterybox_handling_active", 1, 4, "int");
	clientfield::register("toplayer", "set_world_fog", 1, 4, "int");
	level.custom_game_over_hud_elem = &function_4e706158;
	level.enemy_location_override_func = &enemy_location_override;
	level.no_target_override = &no_target_override;
	level.var_60074393 = 1;
	level.zombie_actor_limit = 56;
	level.zombie_ai_limit = 48;
	thread function_ffb8076();
	thread function_c8465736();
	callback::on_finalize_initialization(&on_finalize_initialization);
	return;
}

/*
	Name: function_ffb8076
	Namespace: namespace_66db6bf8
	Checksum: 0xEFB74FBE
	Offset: 0x2378
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 74
*/
function function_ffb8076()
{
	level flag::wait_till("initial_blackscreen_passed");
	thread function_34373bd5();
	thread function_b3aca960();
	thread function_162a3ee8("snd_thunder_rumble", 15, 75, 2);
	thread function_162a3ee8("snd_ro_creepy", 30, 150, 4);
	thread function_a62c7bb3();
	thread function_9bc499e2();
	thread function_1dd4c3df();
	thread function_fb362f99();
	thread function_cefe9b18();
	thread function_2f29107c();
	thread function_d5af7283();
	thread function_3e7887b1();
	thread function_96599d3f();
	thread function_1b8151fd();
}

/*
	Name: function_c8465736
	Namespace: namespace_66db6bf8
	Checksum: 0xE4FCFE6A
	Offset: 0x24B8
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 103
*/
function function_c8465736()
{
	level flag::wait_till("all_players_connected");
	level.var_6bb35fce = 950;
	level.var_c87a814f = 0;
	level.var_37f5cbb = 0;
	level.var_8406e98f = 0;
	wait(1);
	var_4ea09145 = GetEntArray("tra_mysterybox", "targetname");
	i = 0;
	foreach(box in var_4ea09145)
	{
		level.var_61a44884[i] = box;
		i++;
	}
	thread function_19463f6b();
	thread function_955d7b9b();
	wait(5);
	function_acdfe1fe("_vk_tra_wep_camo_thunderwall", 1);
}

/*
	Name: function_162a3ee8
	Namespace: namespace_66db6bf8
	Checksum: 0xA0EC36FE
	Offset: 0x2628
	Size: 0x180
	Parameters: 4
	Flags: None
	Line Number: 134
*/
function function_162a3ee8(sound, var_1511e401, var_c23a753f, var_fa146a96)
{
	if(!isdefined(sound))
	{
		sound = "";
	}
	if(!isdefined(var_1511e401))
	{
		var_1511e401 = 10;
	}
	if(!isdefined(var_c23a753f))
	{
		var_c23a753f = 50;
	}
	if(!isdefined(var_fa146a96))
	{
		var_fa146a96 = 1;
	}
	var_c424a39 = 1;
	while(1)
	{
		var_1587128d = var_fa146a96 * var_c424a39;
		var_a618a166 = randomIntRange(var_1511e401, var_c23a753f) + var_1587128d;
		wait(var_a618a166);
		foreach(player in GetPlayers())
		{
			player playlocalsound(sound);
		}
		var_c424a39++;
	}
}

/*
	Name: function_9bc499e2
	Namespace: namespace_66db6bf8
	Checksum: 0x5F0838F4
	Offset: 0x27B0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 176
*/
function function_9bc499e2()
{
	trigs = GetEntArray("vk_tra_pap", "targetname");
	foreach(trig in trigs)
	{
		trig thread function_b79218a();
	}
	return;
}

/*
	Name: function_b79218a
	Namespace: namespace_66db6bf8
	Checksum: 0x17526B69
	Offset: 0x2870
	Size: 0x900
	Parameters: 0
	Flags: None
	Line Number: 196
*/
function function_b79218a()
{
	self setHintString("");
	self setcursorhint("HINT_NOICON");
	self TriggerEnable(0);
	use_trig = GetEnt(self.target, "targetname");
	use_trig setHintString("");
	use_trig setcursorhint("HINT_NOICON");
	use_trig TriggerEnable(0);
	use_trig.var_f1d0ea49 = 0;
	use_trig.selection = "base";
	var_b2fe474a = GetEnt(use_trig.target, "targetname");
	fx_struct = struct::get(var_b2fe474a.target);
	if(self.script_noteworthy == "custom")
	{
		level waittill("");
		continue;
	}
	level flag::wait_till("power_on");
	self TriggerEnable(1);
	use_trig TriggerEnable(1);
	var_b2fe474a SetModel("p7_zm_vending_packapunch_on");
	var_b2fe474a PlayLoopSound("zmb_perks_packa_loop");
	self thread function_fc78d248(use_trig);
	while(1)
	{
		use_trig waittill("trigger", player);
		if(player.score >= 5000 && use_trig.selection == "base" && namespace_f56b53f0::function_1b5937fb(player))
		{
			player playlocalsound("zmb_cha_ching");
			use_trig.var_f1d0ea49 = 1;
			use_trig function_cb2c15eb(player, "");
			use_trig TriggerEnable(0);
			player zm_weapons::weapon_take(player GetCurrentWeapon());
			player zm_score::minus_to_player_score(5000);
			player zm_weapons::weapon_give(GetWeapon(level.var_2b893b73[use_trig.var_735d8d13]), 0, 0, 1, 1);
			var_f13d684f = util::spawn_model("tag_origin", fx_struct.origin, fx_struct.angles);
			var_1fd6734 = PlayFXOnTag("vk_fx/zm/_vk_zm_tranzit_pap_activate_standard", var_f13d684f, "tag_origin");
			Earthquake(0.05, 1, var_f13d684f.origin, 400);
			var_b2fe474a playsound("zmb_perks_packa_upgrade_fast");
			player playlocalsound("vk_tra_pap_used");
			wait(3);
			var_1fd6734 delete();
			var_f13d684f delete();
			use_trig.var_f1d0ea49 = 0;
			use_trig TriggerEnable(1);
		}
		else if(player.score >= 20000 && use_trig.selection == "upgraded" && namespace_f56b53f0::function_1b5937fb(player))
		{
			player playlocalsound("zmb_cha_ching");
			use_trig.var_f1d0ea49 = 1;
			use_trig function_cb2c15eb(player, "");
			use_trig TriggerEnable(0);
			player zm_weapons::weapon_take(player GetCurrentWeapon());
			player zm_score::minus_to_player_score(20000);
			var_6ba6138f = player zm_weapons::weapon_give(GetWeapon(level.var_23af580e[use_trig.var_735d8d13]), 0, 0, 1, 1);
			wait(0.05);
			switch(level.var_fc480cef[use_trig.var_735d8d13])
			{
				case "deadwire":
				{
					player thread AAT::acquire(var_6ba6138f, "zm_aat_dead_wire");
					break;
				}
				case "blastfurnace":
				{
					player thread AAT::acquire(var_6ba6138f, "zm_aat_blast_furnace");
					break;
				}
				case "thunderwall":
				{
					player thread AAT::acquire(var_6ba6138f, "zm_aat_thunder_wall");
					break;
				}
				case "turned":
				{
					player thread AAT::acquire(var_6ba6138f, "zm_aat_turned");
					break;
				}
				case "fireworks":
				{
					player thread AAT::acquire(var_6ba6138f, "zm_aat_fire_works");
					break;
				}
				case "aethercollapse":
				{
					player thread AAT::acquire(var_6ba6138f, "zm_aat_aethercollapse");
					namespace_f56b53f0::function_dbe7e78b("AAT::ACQUIRE = 'Aether Collapse'");
					break;
				}
			}
			var_f13d684f = util::spawn_model("tag_origin", fx_struct.origin, fx_struct.angles);
			var_1fd6734 = PlayFXOnTag("vk_fx/zm/_vk_zm_tranzit_pap_activate_standard", var_f13d684f, "tag_origin");
			Earthquake(0.15, 2, var_f13d684f.origin, 500);
			var_b2fe474a playsound("zmb_perks_packa_upgrade_fast");
			player playlocalsound("vk_tra_pap_used");
			wait(0.25);
			player playlocalsound("vk_tra_pap_mastered_wpn");
			wait(2.75);
			var_1fd6734 delete();
			var_f13d684f delete();
			use_trig.var_f1d0ea49 = 0;
			use_trig TriggerEnable(1);
		}
		else if(namespace_f56b53f0::function_1b5937fb(player))
		{
			player playlocalsound("evt_perk_deny");
		}
	}
}

/*
	Name: function_fc78d248
	Namespace: namespace_66db6bf8
	Checksum: 0xCA9FA147
	Offset: 0x3178
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 317
*/
function function_fc78d248(use_trig)
{
	while(1)
	{
		self waittill("trigger", player);
		weapon = player GetCurrentWeapon();
		if(use_trig.var_f1d0ea49 == 0 && namespace_f56b53f0::function_1b5937fb(player))
		{
			switch(function_f51e1634(weapon, use_trig))
			{
				case "base":
				{
					use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to Pack-a-Punch your weapon [Cost: 5000]");
					use_trig.selection = "base";
					break;
				}
				case "upgraded":
				{
					use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to ^5Master^7 your weapon [Cost: 20000]");
					use_trig.selection = "upgraded";
					break;
				}
				case "mastered":
				{
					use_trig function_cb2c15eb(player, "^5Weapon at maximum capability");
					use_trig.selection = "mastered";
					break;
				}
				case "null":
				{
					use_trig function_cb2c15eb(player, "");
					use_trig.selection = "null";
					break;
				}
				default
				{
					use_trig function_cb2c15eb(player, "");
					use_trig.selection = "null";
					break;
				}
			}
			continue;
		}
		use_trig function_cb2c15eb(player, "");
		use_trig.selection = "null";
		wait(0.1);
	}
}

/*
	Name: function_f51e1634
	Namespace: namespace_66db6bf8
	Checksum: 0x7D582A18
	Offset: 0x33B0
	Size: 0x250
	Parameters: 2
	Flags: None
	Line Number: 376
*/
function function_f51e1634(weapon, use_trig)
{
	i = 0;
	foreach(var_5739fd0f in level.var_23af580e)
	{
		if(weapon == GetWeapon(var_5739fd0f))
		{
			use_trig.var_735d8d13 = i;
			return "mastered";
		}
		i++;
	}
	i = 0;
	foreach(var_2128bda in level.var_2b893b73)
	{
		if(weapon == GetWeapon(var_2128bda))
		{
			use_trig.var_735d8d13 = i;
			return "upgraded";
		}
		i++;
	}
	i = 0;
	foreach(var_97af2769 in level.var_21b77150)
	{
		if(weapon == GetWeapon(var_97af2769))
		{
			use_trig.var_735d8d13 = i;
			return "base";
		}
		i++;
	}
	return "null";
}

/*
	Name: function_a62c7bb3
	Namespace: namespace_66db6bf8
	Checksum: 0xFF947FDE
	Offset: 0x3608
	Size: 0x13A0
	Parameters: 0
	Flags: None
	Line Number: 421
*/
function function_a62c7bb3()
{
	level.var_21b77150[0] = "vk_tra_smg_iw8_iso_lvl1";
	level.var_2b893b73[0] = "vk_tra_smg_iw8_iso_lvl2";
	level.var_23af580e[0] = "vk_tra_smg_iw8_iso_lvl3";
	level.var_fc480cef[0] = "deadwire";
	level.var_7df703ba[0] = "ISO";
	level.var_c9cebdf1[0] = "enabled";
	level.var_21b77150[1] = "vk_tra_smg_s4_mp40_lvl1";
	level.var_2b893b73[1] = "vk_tra_smg_s4_mp40_lvl2";
	level.var_23af580e[1] = "vk_tra_smg_s4_mp40_lvl3";
	level.var_fc480cef[1] = "blastfurnace";
	level.var_7df703ba[1] = "MP-40";
	level.var_c9cebdf1[1] = "enabled";
	level.var_21b77150[2] = "vk_tra_ar_t9_xm4_lvl1";
	level.var_2b893b73[2] = "vk_tra_ar_t9_xm4_lvl2";
	level.var_23af580e[2] = "vk_tra_ar_t9_xm4_lvl3";
	level.var_fc480cef[2] = "fireworks";
	level.var_7df703ba[2] = "Commando";
	level.var_c9cebdf1[2] = "enabled";
	level.var_21b77150[3] = "vk_tra_smg_s4_bar_lvl1";
	level.var_2b893b73[3] = "vk_tra_smg_s4_bar_lvl2";
	level.var_23af580e[3] = "vk_tra_smg_s4_bar_lvl3";
	level.var_fc480cef[3] = "deadwire";
	level.var_7df703ba[3] = "BAR";
	level.var_c9cebdf1[3] = "enabled";
	level.var_21b77150[4] = "vk_tra_smg_t9_ksp45_lvl1";
	level.var_2b893b73[4] = "vk_tra_smg_t9_ksp45_lvl2";
	level.var_23af580e[4] = "vk_tra_smg_t9_ksp45_lvl3";
	level.var_fc480cef[4] = "blastfurnace";
	level.var_7df703ba[4] = "KSP-45";
	level.var_c9cebdf1[4] = "enabled";
	level.var_21b77150[5] = "vk_tra_shg_t9_gallo_sa12_lvl1";
	level.var_2b893b73[5] = "vk_tra_shg_t9_gallo_sa12_lvl2";
	level.var_23af580e[5] = "vk_tra_shg_t9_gallo_sa12_lvl3";
	level.var_fc480cef[5] = "fireworks";
	level.var_7df703ba[5] = "SPAS-12";
	level.var_c9cebdf1[5] = "enabled";
	level.var_21b77150[6] = "vk_tra_pis_t9_1911_rdw_lvl1";
	level.var_2b893b73[6] = "vk_tra_pis_t9_1911_rdw_lvl2";
	level.var_23af580e[6] = "vk_tra_pis_t9_1911_rdw_lvl3";
	level.var_fc480cef[6] = "turned";
	level.var_7df703ba[6] = "M1911";
	level.var_c9cebdf1[6] = "disabled";
	level.var_21b77150[7] = "vk_tra_mrk_iw8_mk2carbine_lvl1";
	level.var_2b893b73[7] = "vk_tra_mrk_iw8_mk2carbine_lvl2";
	level.var_23af580e[7] = "vk_tra_mrk_iw8_mk2carbine_lvl3";
	level.var_fc480cef[7] = "blastfurnace";
	level.var_7df703ba[7] = "MK2 Carbine";
	level.var_c9cebdf1[7] = "enabled";
	level.var_21b77150[8] = "vk_tra_shg_iw8_725_lvl1";
	level.var_2b893b73[8] = "vk_tra_shg_iw8_725_lvl2";
	level.var_23af580e[8] = "vk_tra_shg_iw8_725_lvl3";
	level.var_fc480cef[8] = "blastfurnace";
	level.var_7df703ba[8] = "Olympia";
	level.var_c9cebdf1[8] = "enabled";
	level.var_21b77150[9] = "vk_tra_mrk_t9_dmr14_lvl1";
	level.var_2b893b73[9] = "vk_tra_mrk_t9_dmr14_lvl2";
	level.var_23af580e[9] = "vk_tra_mrk_t9_dmr14_lvl3";
	level.var_fc480cef[9] = "deadwire";
	level.var_7df703ba[9] = "M14";
	level.var_c9cebdf1[9] = "enabled";
	level.var_21b77150[10] = "vk_tra_smg_t9_mp5_lvl1";
	level.var_2b893b73[10] = "vk_tra_smg_t9_mp5_lvl2";
	level.var_23af580e[10] = "vk_tra_smg_t9_mp5_lvl3";
	level.var_fc480cef[10] = "thunderwall";
	level.var_7df703ba[10] = "MP5";
	level.var_c9cebdf1[10] = "enabled";
	level.var_21b77150[11] = "vk_tra_wow_t7_raygunmk2_lvl1";
	level.var_2b893b73[11] = "vk_tra_wow_t7_raygunmk2_lvl2";
	level.var_23af580e[11] = "vk_tra_wow_t7_raygunmk2_lvl3";
	level.var_fc480cef[11] = "deadwire";
	level.var_7df703ba[11] = "Ray Gun Mark II";
	level.var_c9cebdf1[11] = "rare";
	level.var_21b77150[12] = "vk_tra_smg_t9_ak74u_lvl1";
	level.var_2b893b73[12] = "vk_tra_smg_t9_ak74u_lvl2";
	level.var_23af580e[12] = "vk_tra_smg_t9_ak74u_lvl3";
	level.var_fc480cef[12] = "turned";
	level.var_7df703ba[12] = "AK74u";
	level.var_c9cebdf1[12] = "enabled";
	level.var_21b77150[13] = "vk_tra_ar_t9_m16_lvl1";
	level.var_2b893b73[13] = "vk_tra_ar_t9_m16_lvl2";
	level.var_23af580e[13] = "vk_tra_ar_t9_m16_lvl3";
	level.var_fc480cef[13] = "turned";
	level.var_7df703ba[13] = "M16";
	level.var_c9cebdf1[13] = "enabled";
	level.var_21b77150[14] = "vk_tra_lmg_t9_stoner63_lvl1";
	level.var_2b893b73[14] = "vk_tra_lmg_t9_stoner63_lvl2";
	level.var_23af580e[14] = "vk_tra_lmg_t9_stoner63_lvl3";
	level.var_fc480cef[14] = "blastfurnace";
	level.var_7df703ba[14] = "Stoner 63";
	level.var_c9cebdf1[14] = "enabled";
	level.var_21b77150[15] = "vk_tra_snp_t9_lw3_tundra_lvl1";
	level.var_2b893b73[15] = "vk_tra_snp_t9_lw3_tundra_lvl2";
	level.var_23af580e[15] = "vk_tra_snp_t9_lw3_tundra_lvl3";
	level.var_fc480cef[15] = "deadwire";
	level.var_7df703ba[15] = "L96A1";
	level.var_c9cebdf1[15] = "enabled";
	level.var_21b77150[16] = "vk_tra_smg_t9_ppsh41_drum_lvl1";
	level.var_2b893b73[16] = "vk_tra_smg_t9_ppsh41_drum_lvl2";
	level.var_23af580e[16] = "vk_tra_smg_t9_ppsh41_drum_lvl3";
	level.var_fc480cef[16] = "fireworks";
	level.var_7df703ba[16] = "PPSh-41";
	level.var_c9cebdf1[16] = "enabled";
	level.var_21b77150[17] = "vk_tra_wow_t9_raygun_lvl1";
	level.var_2b893b73[17] = "vk_tra_wow_t9_raygun_lvl2";
	level.var_23af580e[17] = "vk_tra_wow_t9_raygun_lvl3";
	level.var_fc480cef[17] = "blastfurnace";
	level.var_7df703ba[17] = "Ray Gun";
	level.var_c9cebdf1[17] = "rare";
	level.var_21b77150[18] = "vk_tra_lch_t9_rpg_lvl1";
	level.var_2b893b73[18] = "vk_tra_lch_t9_rpg_lvl2";
	level.var_23af580e[18] = "vk_tra_lch_t9_rpg_lvl3";
	level.var_fc480cef[18] = "turned";
	level.var_7df703ba[18] = "RPG";
	level.var_c9cebdf1[18] = "enabled";
	level.var_21b77150[19] = "vk_tra_shg_t9_streetsweeper_lvl1";
	level.var_2b893b73[19] = "vk_tra_shg_t9_streetsweeper_lvl2";
	level.var_23af580e[19] = "vk_tra_shg_t9_streetsweeper_lvl3";
	level.var_fc480cef[19] = "deadwire";
	level.var_7df703ba[19] = "Streetsweeper";
	level.var_c9cebdf1[19] = "enabled";
	level.var_21b77150[20] = "vk_tra_pis_t9_magnum_lvl1";
	level.var_2b893b73[20] = "vk_tra_pis_t9_magnum_lvl2";
	level.var_23af580e[20] = "vk_tra_pis_t9_magnum_lvl3";
	level.var_fc480cef[20] = "thunderwall";
	level.var_7df703ba[20] = "Python";
	level.var_c9cebdf1[20] = "enabled";
	level.var_21b77150[21] = "vk_tra_ar_iw8_oden_lvl1";
	level.var_2b893b73[21] = "vk_tra_ar_iw8_oden_lvl2";
	level.var_23af580e[21] = "vk_tra_ar_iw8_oden_lvl3";
	level.var_fc480cef[21] = "blastfurnace";
	level.var_7df703ba[21] = "Oden";
	level.var_c9cebdf1[21] = "enabled";
	level.var_21b77150[22] = "vk_tra_smg_s4_m1928_lvl1";
	level.var_2b893b73[22] = "vk_tra_smg_s4_m1928_lvl2";
	level.var_23af580e[22] = "vk_tra_smg_s4_m1928_lvl3";
	level.var_fc480cef[22] = "turned";
	level.var_7df703ba[22] = "Thompson";
	level.var_c9cebdf1[22] = "enabled";
	level.var_21b77150[23] = "vk_tra_snp_s4_kar98k_lvl1";
	level.var_2b893b73[23] = "vk_tra_snp_s4_kar98k_lvl2";
	level.var_23af580e[23] = "vk_tra_snp_s4_kar98k_lvl3";
	level.var_fc480cef[23] = "thunderwall";
	level.var_7df703ba[23] = "Kar98k";
	level.var_c9cebdf1[23] = "enabled";
	level.var_21b77150[24] = "vk_tra_mrk_s4_m1garand_lvl1";
	level.var_2b893b73[24] = "vk_tra_mrk_s4_m1garand_lvl2";
	level.var_23af580e[24] = "vk_tra_mrk_s4_m1garand_lvl3";
	level.var_fc480cef[24] = "blastfurnace";
	level.var_7df703ba[24] = "M1 Garand";
	level.var_c9cebdf1[24] = "enabled";
	level.var_21b77150[25] = "vk_tra_shg_s4_trenchgun_lvl1";
	level.var_2b893b73[25] = "vk_tra_shg_s4_trenchgun_lvl2";
	level.var_23af580e[25] = "vk_tra_shg_s4_trenchgun_lvl3";
	level.var_fc480cef[25] = "thunderwall";
	level.var_7df703ba[25] = "Trench Gun";
	level.var_c9cebdf1[25] = "enabled";
	level.var_21b77150[26] = "vk_tra_snp_s4_ptrs41_lvl1";
	level.var_2b893b73[26] = "vk_tra_snp_s4_ptrs41_lvl2";
	level.var_23af580e[26] = "vk_tra_snp_s4_ptrs41_lvl3";
	level.var_fc480cef[26] = "deadwire";
	level.var_7df703ba[26] = "PTRS-41";
	level.var_c9cebdf1[26] = "enabled";
	level.var_21b77150[27] = "vk_tra_shg_s4_dblbarrel_rdw_lvl1";
	level.var_2b893b73[27] = "vk_tra_shg_s4_dblbarrel_rdw_lvl2";
	level.var_23af580e[27] = "vk_tra_shg_s4_dblbarrel_rdw_lvl3";
	level.var_fc480cef[27] = "deadwire";
	level.var_7df703ba[27] = "Sawed-off Double Barrel";
	level.var_c9cebdf1[27] = "enabled";
	level.var_21b77150[28] = "vk_tra_ar_t9_famas_lvl1";
	level.var_2b893b73[28] = "vk_tra_ar_t9_famas_lvl2";
	level.var_23af580e[28] = "vk_tra_ar_t9_famas_lvl3";
	level.var_fc480cef[28] = "thunderwall";
	level.var_7df703ba[28] = "FAMAS";
	level.var_c9cebdf1[28] = "enabled";
	level.var_21b77150[29] = "vk_tra_ar_t9_aug_lvl1";
	level.var_2b893b73[29] = "vk_tra_ar_t9_aug_lvl2";
	level.var_23af580e[29] = "vk_tra_ar_t9_aug_lvl3";
	level.var_fc480cef[29] = "aethercollapse";
	level.var_7df703ba[29] = "AUG";
	level.var_c9cebdf1[29] = "enabled";
	level.var_21b77150[30] = "vk_tra_ar_t9_g11_lvl1";
	level.var_2b893b73[30] = "vk_tra_ar_t9_g11_lvl2";
	level.var_23af580e[30] = "vk_tra_ar_t9_g11_lvl3";
	level.var_fc480cef[30] = "aethercollapse";
	level.var_7df703ba[30] = "G11";
	level.var_c9cebdf1[30] = "enabled";
	level.var_21b77150[31] = "vk_tra_lch_t9_chinalake_lvl1";
	level.var_2b893b73[31] = "vk_tra_lch_t9_chinalake_lvl2";
	level.var_23af580e[31] = "vk_tra_lch_t9_chinalake_lvl3";
	level.var_fc480cef[31] = "aethercollapse";
	level.var_7df703ba[31] = "Thumper";
	level.var_c9cebdf1[31] = "enabled";
	level.var_21b77150[32] = "vk_tra_lmg_t9_rpd_lvl1";
	level.var_2b893b73[32] = "vk_tra_lmg_t9_rpd_lvl2";
	level.var_23af580e[32] = "vk_tra_lmg_t9_rpd_lvl3";
	level.var_fc480cef[32] = "aethercollapse";
	level.var_7df703ba[32] = "RPD";
	level.var_c9cebdf1[32] = "enabled";
	level.var_21b77150[33] = "vk_tra_ar_t9_galil_lvl1";
	level.var_2b893b73[33] = "vk_tra_ar_t9_galil_lvl2";
	level.var_23af580e[33] = "vk_tra_ar_t9_galil_lvl3";
	level.var_fc480cef[33] = "aethercollapse";
	level.var_7df703ba[33] = "Galil";
	level.var_c9cebdf1[33] = "enabled";
	level.var_21b77150[34] = "vk_tra_smg_iw8_vector_lvl1";
	level.var_2b893b73[34] = "vk_tra_smg_iw8_vector_lvl2";
	level.var_23af580e[34] = "vk_tra_smg_iw8_vector_lvl3";
	level.var_fc480cef[34] = "aethercollapse";
	level.var_7df703ba[34] = "Vector K10";
	level.var_c9cebdf1[34] = "enabled";
}

/*
	Name: function_1dd4c3df
	Namespace: namespace_66db6bf8
	Checksum: 0xA69B1918
	Offset: 0x49B0
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 645
*/
function function_1dd4c3df()
{
	trigs = GetEntArray("vk_tra_wallbuy", "targetname");
	foreach(trig in trigs)
	{
		trig thread function_7f3d4883();
	}
	structs = struct::get_array("vk_tra_wallbuy_location", "targetname");
	i = 0;
	foreach(struct in structs)
	{
		level.var_c73bb174[i] = util::spawn_model("tag_origin", struct.origin, struct.angles);
		if(1)
		{
			level.var_c73bb174[i] PlayLoopSound("");
		}
		i++;
		wait(0.05);
	}
}

/*
	Name: function_7f3d4883
	Namespace: namespace_66db6bf8
	Checksum: 0xFB4ECC50
	Offset: 0x4BA0
	Size: 0x620
	Parameters: 0
	Flags: None
	Line Number: 676
*/
function function_7f3d4883()
{
	var_76d7d97 = GetWeapon(self.zombie_weapon_upgrade + "_lvl1");
	use_trig = GetEnt(self.target, "targetname");
	use_trig.weapon_name = self.script_string;
	use_trig setHintString("");
	use_trig setcursorhint("HINT_NOICON");
	use_trig TriggerEnable(1);
	use_trig.var_f1d0ea49 = 0;
	use_trig.var_735d8d13 = 0;
	use_trig.var_20a9da7d = self.zombie_cost;
	use_trig.var_95fa268 = self.script_int;
	use_trig.var_f1474b2b = use_trig.var_95fa268 * 4;
	use_trig.var_b4394dd6 = use_trig.var_f1474b2b * 3;
	use_trig.var_5749e83 = self.zombie_weapon_upgrade + "_lvl";
	use_trig thread function_191f8338();
	self setcursorhint("HINT_NOICON");
	self setHintString("");
	foreach(player in GetPlayers())
	{
		use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to purchase " + use_trig.weapon_name + " [Cost: " + use_trig.var_20a9da7d + "]");
	}
	while(1)
	{
		self waittill("trigger", player);
		if(use_trig.var_f1d0ea49 == 0)
		{
			use_trig.has_weapon = 0;
			foreach(weapon in player getweaponslistprimaries())
			{
				if(weapon == GetWeapon(use_trig.var_5749e83 + 1))
				{
					use_trig.var_876e2ce2 = 1;
					use_trig.has_weapon = 1;
				}
				if(weapon == GetWeapon(use_trig.var_5749e83 + 2))
				{
					use_trig.var_876e2ce2 = 2;
					use_trig.has_weapon = 1;
				}
				if(weapon == GetWeapon(use_trig.var_5749e83 + 3))
				{
					use_trig.var_876e2ce2 = 3;
					use_trig.has_weapon = 1;
				}
			}
			if(use_trig.has_weapon)
			{
				if(use_trig.var_876e2ce2 == 1)
				{
					use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to purchase ammo [Cost: " + use_trig.var_95fa268 + "]");
					use_trig.var_735d8d13 = 1;
				}
				if(use_trig.var_876e2ce2 == 2)
				{
					use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to purchase ammo [Cost: " + use_trig.var_f1474b2b + "]");
					use_trig.var_735d8d13 = 2;
				}
				if(use_trig.var_876e2ce2 == 3)
				{
					use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to purchase ammo [Cost: " + use_trig.var_b4394dd6 + "]");
					use_trig.var_735d8d13 = 3;
					continue;
				}
			}
			use_trig function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to purchase " + use_trig.weapon_name + " [Cost: " + use_trig.var_20a9da7d + "]");
			use_trig.var_735d8d13 = 0;
		}
		wait(0.1);
	}
}

/*
	Name: function_191f8338
	Namespace: namespace_66db6bf8
	Checksum: 0xA6AF559F
	Offset: 0x51C8
	Size: 0x270
	Parameters: 0
	Flags: None
	Line Number: 758
*/
function function_191f8338()
{
	while(1)
	{
		self waittill("trigger", player);
		if(player.score >= self.var_95fa268 && self.var_735d8d13 == 1)
		{
			player zm_score::minus_to_player_score(self.var_95fa268);
			player thread zm_weapons::ammo_give(GetWeapon(self.var_5749e83 + 1));
		}
		else if(player.score >= self.var_f1474b2b && self.var_735d8d13 == 2)
		{
			player zm_score::minus_to_player_score(self.var_f1474b2b);
			player thread zm_weapons::ammo_give(GetWeapon(self.var_5749e83 + 2));
		}
		else if(player.score >= self.var_b4394dd6 && self.var_735d8d13 == 3)
		{
			player zm_score::minus_to_player_score(self.var_b4394dd6);
			player thread zm_weapons::ammo_give(GetWeapon(self.var_5749e83 + 3));
		}
		else if(player.score >= self.var_20a9da7d && self.var_735d8d13 == 0)
		{
			player zm_score::minus_to_player_score(self.var_20a9da7d);
			player playlocalsound("zmb_cha_ching");
			player zm_weapons::weapon_give(GetWeapon(self.var_5749e83 + 1), 0, 0, 1, 1);
			continue;
		}
		player playlocalsound("evt_perk_deny");
		wait(0.1);
	}
}

/*
	Name: function_19463f6b
	Namespace: namespace_66db6bf8
	Checksum: 0xF9FD84AF
	Offset: 0x5440
	Size: 0x4B0
	Parameters: 0
	Flags: None
	Line Number: 800
*/
function function_19463f6b()
{
	var_4ea09145 = GetEntArray("tra_mysterybox", "targetname");
	level.var_4772cc4c = var_4ea09145.size;
	foreach(var_a1d99a0a in var_4ea09145)
	{
		var_a1d99a0a.var_32e4a758 = 0;
		var_9881190b = GetEnt(var_a1d99a0a.target, "targetname");
		var_e1e75102 = struct::get(var_9881190b.target);
		if(isdefined(var_a1d99a0a.box_model))
		{
			continue;
		}
		var_a1d99a0a.box_model = util::spawn_model("p7_zm_der_magic_box_fake", var_e1e75102.origin, var_e1e75102.angles);
		var_a1d99a0a setcursorhint("HINT_NOICON");
		var_a1d99a0a setHintString("");
		var_a1d99a0a TriggerEnable(0);
		var_9881190b setcursorhint("HINT_NOICON");
		var_9881190b setHintString("");
		var_9881190b TriggerEnable(0);
	}
	foreach(var_a1d99a0a in var_4ea09145)
	{
		if(var_a1d99a0a.var_587fc990 == 1 && !level.var_8406e98f)
		{
			level.var_8406e98f = 1;
			var_a1d99a0a thread function_7b710150();
			level.var_f08cb51 = 1;
		}
	}
	if(!level.var_f08cb51)
	{
		var_5a6266b5 = Array::randomize(var_4ea09145);
		if(var_5a6266b5.size == 1)
		{
			var_5a6266b5[0] thread function_7b710150();
		}
		else if(isdefined(var_5a6266b5[0].var_1ced3f6d) && var_5a6266b5[0].var_1ced3f6d)
		{
			foreach(var_a1d99a0a in var_4ea09145)
			{
				var_a1d99a0a.var_1ced3f6d = 0;
				var_a1d99a0a.uses = 0;
			}
			var_5a6266b5[1] thread function_7b710150();
			continue;
		}
		foreach(var_a1d99a0a in var_4ea09145)
		{
			var_a1d99a0a.var_1ced3f6d = 0;
			var_a1d99a0a.uses = 0;
		}
		var_5a6266b5[0] thread function_7b710150();
	}
}

/*
	Name: function_7b710150
	Namespace: namespace_66db6bf8
	Checksum: 0x4B9FD475
	Offset: 0x58F8
	Size: 0x980
	Parameters: 0
	Flags: None
	Line Number: 866
*/
function function_7b710150()
{
	spawn_delay = randomIntRange(6, 16);
	wait(spawn_delay);
	self.var_32e4a758 = 1;
	self.uses = 0;
	self.var_8f341a46 = 1;
	self.var_1ced3f6d = 1;
	self.var_eddf9c88 = 1;
	self.var_b59d5d9d = 0;
	box_model = self.box_model;
	if(!isdefined(box_model))
	{
		wait(0.05);
		box_model = self.box_model;
	}
	var_9881190b = GetEnt(self.target, "targetname");
	self TriggerEnable(1);
	var_9881190b TriggerEnable(1);
	if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
	{
		box_model SetModel("p7_zm_shi_magic_box_vk_tra_upgraded");
		continue;
	}
	box_model SetModel("p7_zm_shi_magic_box");
	box_model thread function_4255fd13();
	switch(self.var_e3de4cd9)
	{
		case "aqua":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/aqua/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 2);
			break;
		}
		case "blue":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/blue/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 3);
			break;
		}
		case "brown":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/brown/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 4);
			break;
		}
		case "green":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/green/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 5);
			break;
		}
		case "purple":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/purple/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 6);
			break;
		}
		case "red":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/red/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 7);
			break;
		}
		case "white":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/white/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 8);
			break;
		}
		case "yellow":
		{
			var_19a55bf1 = PlayFXOnTag("vk_fx/mysterybox/yellow/spawn", box_model, "tag_origin");
			var_d572bea0 = util::spawn_model("tag_origin", box_model.origin, box_model.angles);
			var_d572bea0 clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 9);
			break;
		}
	}
	Earthquake(0.3, 2, box_model.origin, 1250);
	self thread function_60f248f9(var_d572bea0);
	self.status = "ready";
	self thread function_6e3c4bbd(var_9881190b);
	while(isdefined(self.var_8f341a46) && self.var_8f341a46)
	{
		var_9881190b waittill("trigger", player);
		team = player.team;
		if(!(isdefined(level.zombie_vars[team]["zombie_firesale"] == 1) && level.zombie_vars[team]["zombie_firesale"] == 1))
		{
			if(player.score >= level.var_6bb35fce && !self.var_b59d5d9d)
			{
				player zm_score::minus_to_player_score(level.var_6bb35fce);
				player playlocalsound("zmb_cha_ching");
				level.var_c87a814f++;
				self.uses++;
				self thread function_3d770ddc(player, box_model);
			}
			else if(player.score < level.var_6bb35fce && !self.var_b59d5d9d)
			{
				player playlocalsound("evt_perk_deny");
			}
		}
		else if(isdefined(level.zombie_vars[team]["zombie_firesale"] == 1) && level.zombie_vars[team]["zombie_firesale"] == 1)
		{
			if(player.score >= 10 && !self.var_b59d5d9d)
			{
				player zm_score::minus_to_player_score(10);
				player playlocalsound("zmb_cha_ching");
				level.var_c87a814f++;
				self.uses++;
				self thread function_3d770ddc(player, box_model);
			}
			else if(player.score < 10 && !self.var_b59d5d9d)
			{
				player playlocalsound("evt_perk_deny");
			}
		}
	}
	wait(3);
	var_19a55bf1 delete();
	wait(0.05);
	var_d572bea0 delete();
	thread function_19463f6b();
	self.status = "disabled";
	self.var_eddf9c88 = 0;
}

/*
	Name: function_60f248f9
	Namespace: namespace_66db6bf8
	Checksum: 0x619CB394
	Offset: 0x6280
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1009
*/
function function_60f248f9(var_5d855c9b)
{
	var_5d855c9b PlayLoopSound("vk_tra_mysterybox_ambient");
	self waittill("hash_c6281710");
	var_5d855c9b clientfield::set("_cfx_vk_tra_mysterybox_handling_static", 1);
	var_5d855c9b StopLoopSound(1);
	wait(1.1);
	var_5d855c9b delete();
}

/*
	Name: function_3d770ddc
	Namespace: namespace_66db6bf8
	Checksum: 0x8B982137
	Offset: 0x6320
	Size: 0x190
	Parameters: 2
	Flags: None
	Line Number: 1029
*/
function function_3d770ddc(player, box_model)
{
	var_5f2c1bc8 = randomIntRange(1, 100);
	var_a4209ee8 = 0;
	if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
	{
		var_f7a0390 = namespace_f56b53f0::clamp(10, 1, 75);
		continue;
	}
	var_f7a0390 = namespace_f56b53f0::clamp(25, 1, 75);
	if(var_f7a0390 > var_5f2c1bc8 && level.var_4772cc4c > 1 && self.uses > 5 && 1)
	{
		var_a4209ee8 = 1;
		box_model notify("hash_f7e702f2");
	}
	self.player = player;
	self.status = "spinning";
	self.var_b59d5d9d = 1;
	playsoundatposition("vk_tra_mysterybox_open", box_model.origin);
	if(!isdefined(box_model))
	{
		wait(0.05);
		box_model = self.box_model;
	}
	box_model thread function_5bb9f81d(player, self, var_a4209ee8);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5bb9f81d
	Namespace: namespace_66db6bf8
	Checksum: 0x235363D0
	Offset: 0x64B8
	Size: 0x14C8
	Parameters: 3
	Flags: None
	Line Number: 1068
*/
function function_5bb9f81d(player, trigger, var_a4209ee8)
{
	wait(0.05);
	if(!isdefined(self))
	{
		namespace_f56b53f0::function_dbe7e78b("BOX MODEL NOT DEFINED!");
	}
	self thread scene::Play("_zm_vk_tra_mysterybox_open", self);
	var_9881190b = GetEnt(trigger.target, "targetname");
	var_e1e75102 = struct::get(var_9881190b.target);
	spawn_location = struct::get(var_e1e75102.target);
	var_c24ab5fc = struct::get(spawn_location.target);
	var_796b0cfc = function_2270a6fb(player, spawn_location, 1);
	switch(trigger.var_e3de4cd9)
	{
		case "aqua":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 2);
			break;
		}
		case "blue":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 3);
			break;
		}
		case "brown":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 4);
			break;
		}
		case "green":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 5);
			break;
		}
		case "purple":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 6);
			break;
		}
		case "red":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 7);
			break;
		}
		case "white":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 8);
			break;
		}
		case "yellow":
		{
			var_e3bce793 = util::spawn_model("tag_origin", self.origin, self.angles);
			var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 9);
			break;
		}
	}
	if(player hasPerk("specialty_fastreload"))
	{
		if(isdefined(level.var_2e4b4e0e) && level.var_2e4b4e0e)
		{
			playsoundatposition("vk_tra_mysterybox_draw", self.origin);
			var_6ded944c = 5250;
			continue;
		}
		playsoundatposition("vk_tra_mysterybox_draw_fast", self.origin);
		var_6ded944c = 1750;
		start_time = GetTime() + var_6ded944c;
		var_796b0cfc moveto(var_c24ab5fc.origin, var_6ded944c / 1000, 0.5, 0.5);
	}
	else if(isdefined(level.var_2e4b4e0e) && level.var_2e4b4e0e)
	{
		playsoundatposition("vk_tra_mysterybox_draw", self.origin);
		var_6ded944c = 12000;
		continue;
	}
	playsoundatposition("vk_tra_mysterybox_draw", self.origin);
	var_6ded944c = 4000;
	start_time = GetTime() + var_6ded944c;
	var_796b0cfc moveto(var_c24ab5fc.origin, var_6ded944c / 1000, 0.5, 0.5);
	time = 0.1;
	var_c69820ad = 0;
	while(GetTime() < start_time)
	{
		wait(time);
		var_c69820ad++;
		var_796b0cfc function_2270a6fb(player, spawn_location, 0);
		if(var_c69820ad > 15 && var_c69820ad < 25)
		{
			time = 0.2;
		}
		if(var_c69820ad >= 25 && var_c69820ad < 50)
		{
			time = 0.3;
		}
		if(var_c69820ad >= 50)
		{
			time = 0.4;
		}
	}
	has_weapon = 0;
	if(isdefined(var_a4209ee8) && var_a4209ee8)
	{
		var_79768734 = var_796b0cfc.origin;
		var_5fa78c1a = var_796b0cfc.angles;
		var_796b0cfc delete();
		var_796b0cfc = util::spawn_model("p7_zm_teddybear_wet_vk", var_79768734, var_5fa78c1a);
		var_796b0cfc SetModel("p7_zm_teddybear_wet_vk");
		var_796b0cfc.angles = var_796b0cfc.angles + VectorScale((0, 1, 0), 180);
	}
	else
	{
		wait(0.05);
		index = randomIntRange(0, level.var_21b77150.size);
		var_968740e = GetWeapon(level.var_21b77150[index]);
		var_e365f9a5 = GetWeapon(level.var_2b893b73[index]);
		var_bd637f3c = GetWeapon(level.var_23af580e[index]);
		foreach(weapon in player getweaponslistprimaries())
		{
			if(weapon == var_968740e)
			{
				has_weapon = 1;
			}
			if(weapon == var_e365f9a5)
			{
				has_weapon = 1;
			}
			if(weapon == var_bd637f3c)
			{
				has_weapon = 1;
			}
		}
		if(has_weapon || level.var_c9cebdf1[index] == "disabled")
		{
			has_weapon = 0;
			continue;
		}
		if(level.var_c9cebdf1[index] == "rare")
		{
			var_ec23f156 = randomIntRange(1, 100);
			if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
			{
				if(var_ec23f156 > 90)
				{
					continue;
				}
			}
			else if(var_ec23f156 > 35)
			{
				continue;
			}
		}
		wait(0.1);
		if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
		{
			var_796b0cfc UseBuildKitWeaponModel(player, var_e365f9a5, undefined, 0);
			continue;
		}
		var_796b0cfc UseBuildKitWeaponModel(player, var_968740e, undefined, 0);
		break;
	}
	while(1)
	{
	}
	if(isdefined(var_a4209ee8) && var_a4209ee8)
	{
		level.var_f08cb51 = 0;
		var_5146841c = self.origin + VectorScale((0, 0, -1), 12);
		var_c51360c2 = self.angles;
		level thread function_dfeeb92a();
		wait(0.5);
		player zm_score::add_to_player_score(level.var_6bb35fce);
		wait(2);
		var_796b0cfc moveto(spawn_location.origin + VectorScale((0, 0, 1), 384), 6, 3, 1);
		wait(0.3);
		self thread scene::Play("_zm_vk_tra_mysterybox_leave", self);
		trigger.status = "disabled";
		trigger notify("hash_c6281710", player getweaponslistprimaries());
		var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 1);
		wait(0.05);
		var_e3bce793 delete();
		wait(3);
		playsoundatposition("vk_tra_mysterybox_spin", var_5146841c);
		wait(0.5);
		var_796b0cfc delete();
		switch(trigger.var_e3de4cd9)
		{
			case "aqua":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/aqua/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "blue":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/blue/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "brown":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/brown/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "green":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/green/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "purple":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/purple/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "red":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/red/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "white":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/white/leave", var_f98dccdf, "tag_origin");
				break;
			}
			case "yellow":
			{
				var_f98dccdf = util::spawn_model("tag_origin", var_5146841c, var_c51360c2);
				var_fd7105c4 = PlayFXOnTag("vk_fx/mysterybox/yellow/leave", var_f98dccdf, "tag_origin");
				break;
			}
		}
		wait(3.6);
		playsoundatposition("vk_tra_mysterybox_poof", var_f98dccdf.origin);
		wait(0.4);
		trigger.var_8f341a46 = 0;
		Earthquake(0.1, 1, self.origin, 1250);
		self delete();
		var_fd7105c4 delete();
		var_f98dccdf delete();
		wait(0.05);
		thread function_19463f6b();
		continue;
	}
	Earthquake(0.1, 2, var_796b0cfc.origin, 500);
	var_796b0cfc moveto(spawn_location.origin, 15);
	switch(trigger.var_e3de4cd9)
	{
		case "aqua":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/aqua/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "blue":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/blue/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "brown":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/brown/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "green":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/green/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "purple":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/purple/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "red":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/red/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "white":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/white/weapon", var_796b0cfc, "tag_origin");
			break;
		}
		case "yellow":
		{
			var_de1a1ed3 = PlayFXOnTag("vk_fx/mysterybox/yellow/weapon", var_796b0cfc, "tag_origin");
			break;
		}
	}
	playsoundatposition("vk_tra_mysterybox_weapon", var_796b0cfc.origin);
	var_9881190b = GetEnt(trigger.target, "targetname");
	var_9881190b.var_c46d6cc6 = "";
	var_9881190b.var_dc8d324c = 1;
	trigger.weapon_name = level.var_7df703ba[index];
	trigger.status = "drawn";
	var_9881190b thread function_8423c875(15);
	var_9881190b thread function_135b64a0(trigger);
	var_9881190b util::waittill_any("c_triggered", "c_timedout");
	var_9881190b.var_dc8d324c = 0;
	if(var_9881190b.var_c46d6cc6 == "c_triggered")
	{
		if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
		{
			player zm_weapons::weapon_give(var_e365f9a5, 0, 0, 1, 1);
			continue;
		}
		player zm_weapons::weapon_give(var_968740e, 0, 0, 1, 1);
	}
	playsoundatposition("vk_tra_mysterybox_equip", var_796b0cfc.origin);
	var_de1a1ed3 delete();
	wait(0.05);
	var_796b0cfc delete();
	self thread scene::Play("_zm_vk_tra_mysterybox_close", self);
	playsoundatposition("vk_tra_mysterybox_close", self.origin);
	trigger.status = "disabled";
	wait(0.25);
	var_e3bce793 clientfield::set("_cfx_vk_tra_mysterybox_handling_active", 1);
	wait(0.05);
	var_e3bce793 delete();
	wait(1.7);
	trigger.status = "ready";
	trigger.var_b59d5d9d = 0;
}

/*
	Name: function_dfeeb92a
	Namespace: namespace_66db6bf8
	Checksum: 0xF9A5E19F
	Offset: 0x7988
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 1413
*/
function function_dfeeb92a()
{
	wait(0.05);
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_tra_mysterybox_horror");
	}
	wait(2.25);
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_tra_mysterybox_disappear");
	}
	wait(1.5);
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_zm_ann_" + level.var_4011a94e + "_byebye");
	}
}

/*
	Name: function_2270a6fb
	Namespace: namespace_66db6bf8
	Checksum: 0x7FBF9246
	Offset: 0x7B78
	Size: 0x1C0
	Parameters: 3
	Flags: None
	Line Number: 1442
*/
function function_2270a6fb(player, spawn_location, first)
{
	if(!isdefined(first))
	{
		first = 1;
	}
	while(1)
	{
		var_8d44424b = level.var_21b77150;
		index = randomIntRange(0, level.var_21b77150.size);
		if(level.var_c9cebdf1[index] == "disabled")
		{
			wait(0.05);
			continue;
		}
		else if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
		{
			gun = GetWeapon(level.var_2b893b73[index]);
			continue;
		}
		gun = GetWeapon(var_8d44424b[index]);
		break;
	}
	if(first)
	{
		weapon_model = zm_utility::spawn_buildkit_weapon_model(player, gun, undefined, spawn_location.origin, spawn_location.angles);
	}
	else if(weapon_model == function_1c8adcb0(gun))
	{
		if(index == var_8d44424b.size)
		{
			index = 0;
			continue;
		}
		index++;
	}
	self UseBuildKitWeaponModel(player, gun, undefined, 0);
	return weapon_model;
}

/*
	Name: function_6e3c4bbd
	Namespace: namespace_66db6bf8
	Checksum: 0x62F49CFD
	Offset: 0x7D40
	Size: 0x230
	Parameters: 1
	Flags: None
	Line Number: 1492
*/
function function_6e3c4bbd(var_9881190b)
{
	while(isdefined(self.var_eddf9c88) && self.var_eddf9c88)
	{
		self waittill("trigger", player);
		wait(0.05);
		if(self.status == "disabled" || self.status == "spinning" || !namespace_f56b53f0::function_1b5937fb(player))
		{
			var_9881190b function_cb2c15eb(player, "");
		}
		else if(self.status == "ready" && namespace_f56b53f0::function_1b5937fb(player))
		{
			team = player.team;
			if(!(isdefined(level.zombie_vars[team]["zombie_firesale"] == 1) && level.zombie_vars[team]["zombie_firesale"] == 1))
			{
				self.cost = level.var_6bb35fce;
				continue;
			}
			self.cost = 10;
			var_9881190b function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to use the Mystery Box [Cost: " + self.cost + "]");
		}
		else if(self.status == "drawn" && self.player == player && namespace_f56b53f0::function_1b5937fb(player))
		{
			var_9881190b function_cb2c15eb(player, "Hold ^3[{+activate}]^7 to use take the " + self.weapon_name);
			continue;
		}
		var_9881190b function_cb2c15eb(player, "");
	}
}

/*
	Name: function_8423c875
	Namespace: namespace_66db6bf8
	Checksum: 0x1FBEE00C
	Offset: 0x7F78
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 1532
*/
function function_8423c875(time)
{
	runner = 0;
	duration = time * 10;
	while(runner < duration && (isdefined(self.var_dc8d324c) && self.var_dc8d324c))
	{
		wait(0.1);
		runner++;
	}
	if(isdefined(self.var_dc8d324c) && self.var_dc8d324c)
	{
		self.var_c46d6cc6 = "c_timedout";
		self notify("hash_e89a6aa8");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_135b64a0
	Namespace: namespace_66db6bf8
	Checksum: 0xB5972425
	Offset: 0x8028
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1560
*/
function function_135b64a0(parent)
{
	while(1)
	{
		self waittill("trigger", player);
		if(player == parent.player && (isdefined(self.var_dc8d324c) && self.var_dc8d324c) && namespace_f56b53f0::function_1b5937fb(player))
		{
			self.var_c46d6cc6 = "c_triggered";
			self notify("hash_f860df32");
			break;
		}
	}
}

/*
	Name: function_955d7b9b
	Namespace: namespace_66db6bf8
	Checksum: 0xD367D298
	Offset: 0x80D0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 1584
*/
function function_955d7b9b()
{
	while(level.var_c87a814f < 64)
	{
		wait(0.1);
	}
	level.var_37f5cbb = 1;
	level notify("hash_36c97163");
}

/*
	Name: function_4255fd13
	Namespace: namespace_66db6bf8
	Checksum: 0xC213C7D6
	Offset: 0x8118
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 1604
*/
function function_4255fd13()
{
	self endon("hash_f7e702f2");
	level waittill("hash_36c97163");
	if(isdefined(level.var_37f5cbb) && level.var_37f5cbb)
	{
		self SetModel("p7_zm_shi_magic_box_vk_tra_upgraded");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b3aca960
	Namespace: namespace_66db6bf8
	Checksum: 0x1695A9CF
	Offset: 0x8170
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 1626
*/
function function_b3aca960()
{
	while(1)
	{
		level.var_28820e94 = 0;
		level.var_fde2c467 = 0;
		trigs = GetEntArray("teddy_bear_mus_ee", "targetname");
		foreach(trig in trigs)
		{
			trig thread function_1bde65df();
		}
		while(level.var_28820e94 < 3)
		{
			wait(0.05);
		}
		thread function_bccc6b24();
		level waittill("hash_6f94d05c");
		namespace_f56b53f0::function_dbe7e78b("MUS EE: Song Complete");
	}
}

/*
	Name: function_1bde65df
	Namespace: namespace_66db6bf8
	Checksum: 0x65B5E18A
	Offset: 0x82A8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 1657
*/
function function_1bde65df()
{
	self setHintString("");
	self setcursorhint("HINT_NOICON");
	self TriggerEnable(1);
	bear = GetEnt(self.target, "targetname");
	bear thread sound::loop_on_entity("vk_tra_mus_ee_amb_loop");
	self waittill("trigger", player);
	self TriggerEnable(0);
	bear thread sound::stop_loop_on_entity("vk_tra_mus_ee_amb_loop");
	playsoundatposition("vk_tra_mus_ee_activate", bear.origin);
	if(!isdefined(bear))
	{
		namespace_f56b53f0::function_dbe7e78b("BEAR NOT DEFINED!!!!");
	}
	level.var_28820e94++;
	self function_ec28656e();
}

/*
	Name: function_ec28656e
	Namespace: namespace_66db6bf8
	Checksum: 0x6099039A
	Offset: 0x8410
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 1686
*/
function function_ec28656e()
{
	if(level.var_28820e94 == 1)
	{
		level.var_fde2c467 = level.var_fde2c467 + self.script_int * 100;
	}
	if(level.var_28820e94 == 2)
	{
		level.var_fde2c467 = level.var_fde2c467 + self.script_int * 10;
	}
	if(level.var_28820e94 == 3)
	{
		level.var_fde2c467 = level.var_fde2c467 + self.script_int;
	}
	namespace_f56b53f0::function_dbe7e78b("Teddybear No. :^3" + self.script_int + "^7 current order: ^3" + level.var_fde2c467);
}

/*
	Name: function_bccc6b24
	Namespace: namespace_66db6bf8
	Checksum: 0x66F2CFD9
	Offset: 0x84E0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1713
*/
function function_bccc6b24()
{
	if(level.var_fde2c467 == 321)
	{
		function_5e80462("vk_tra_mus_ee_carrion", 4, 16);
	}
	else if(level.var_fde2c467 == 312)
	{
		function_5e80462("vk_tra_mus_ee_cominghome", 3, 18);
	}
	else if(level.var_fde2c467 == 123)
	{
		function_5e80462("vk_tra_mus_ee_iamthewell", 4, 29);
	}
	else if(level.var_fde2c467 == 132)
	{
		function_5e80462("vk_tra_mus_ee_redamned", 1, 28);
	}
	else if(level.var_fde2c467 == 231)
	{
		function_5e80462("vk_tra_mus_ee_wtf", 2, 23);
	}
	else if(level.var_fde2c467 == 213)
	{
		function_5e80462("vk_tra_mus_ee_tryitout", 4, 46);
		continue;
	}
	function_5e80462("vk_tra_mus_ee_carrion", 4, 16);
	namespace_f56b53f0::function_dbe7e78b("^1ERROR ORDER");
}

/*
	Name: function_5e80462
	Namespace: namespace_66db6bf8
	Checksum: 0x17D621B
	Offset: 0x8678
	Size: 0x228
	Parameters: 3
	Flags: None
	Line Number: 1754
*/
function function_5e80462(var_12e466c7, var_1d8b203c, var_6ff8de37)
{
	if(!isdefined(var_12e466c7))
	{
		var_12e466c7 = "vk_tra_mus_ee_carrion";
	}
	if(!isdefined(var_1d8b203c))
	{
		var_1d8b203c = 4;
	}
	if(!isdefined(var_6ff8de37))
	{
		var_6ff8de37 = 16;
	}
	namespace_f56b53f0::function_dbe7e78b("^5MUS EE: Playing Song '^7" + var_12e466c7 + "^5' from Teddy Order: ^3" + level.var_fde2c467);
	var_c26fd0f5 = var_1d8b203c * 60 + var_6ff8de37 + 3;
	foreach(player in GetPlayers())
	{
		player playlocalsound(var_12e466c7);
		player playlocalsound("vk_tra_mus_ee_song_playstop");
		player zm_score::add_to_player_score(10);
	}
	wait(var_c26fd0f5);
	foreach(player in GetPlayers())
	{
		player playlocalsound("vk_tra_mus_ee_song_playstop");
	}
	level notify("hash_6f94d05c", GetPlayers(), GetPlayers());
}

/*
	Name: function_944cc3d
	Namespace: namespace_66db6bf8
	Checksum: 0x5CC73D6D
	Offset: 0x88A8
	Size: 0x128
	Parameters: 4
	Flags: None
	Line Number: 1794
*/
function function_944cc3d(var_27893a72, var_95655e55, wpn_name, var_55d874df)
{
	if(!isdefined(var_27893a72))
	{
		var_27893a72 = "";
	}
	if(!isdefined(var_95655e55))
	{
		var_95655e55 = "deadwire";
	}
	if(!isdefined(wpn_name))
	{
		wpn_name = "DefaultWeapon";
	}
	if(!isdefined(var_55d874df))
	{
		var_55d874df = 1;
	}
	index = level.var_21b77150.size;
	level.var_21b77150[index] = var_27893a72 + "_lvl1";
	level.var_2b893b73[index] = var_27893a72 + "_lvl2";
	level.var_23af580e[index] = var_27893a72 + "_lvl3";
	level.var_fc480cef[index] = var_95655e55;
	level.var_7df703ba[index] = wpn_name;
	level.var_c9cebdf1[index] = var_55d874df;
}

/*
	Name: function_2f29107c
	Namespace: namespace_66db6bf8
	Checksum: 0x77081A71
	Offset: 0x89D8
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1831
*/
function function_2f29107c()
{
	while(1)
	{
		level waittill("hash_944cc3d", var_27893a72, var_95655e55, wpn_name, var_55d874df);
		level thread function_944cc3d(var_27893a72, var_95655e55, wpn_name, var_55d874df);
	}
}

/*
	Name: function_665a38b5
	Namespace: namespace_66db6bf8
	Checksum: 0xD1D57CE9
	Offset: 0x8A50
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 1850
*/
function function_665a38b5()
{
	zm_perk_random::include_perk_in_random_rotation("specialty_quickrevive");
	zm_perk_random::include_perk_in_random_rotation("specialty_armorvest");
	zm_perk_random::include_perk_in_random_rotation("specialty_doubletap2");
	zm_perk_random::include_perk_in_random_rotation("specialty_fastreload");
	zm_perk_random::include_perk_in_random_rotation("specialty_deadshot");
	zm_perk_random::include_perk_in_random_rotation("specialty_phdflopper");
	zm_perk_random::include_perk_in_random_rotation("specialty_staminup");
	zm_perk_random::include_perk_in_random_rotation("specialty_additionalprimaryweapon");
	zm_perk_random::include_perk_in_random_rotation("specialty_electriccherry");
	zm_perk_random::include_perk_in_random_rotation("specialty_vultureaid");
	zm_perk_random::include_perk_in_random_rotation("specialty_widowswine");
	zm_perk_random::include_perk_in_random_rotation("specialty_directionalfire");
	zm_perk_random::include_perk_in_random_rotation("specialty_quieter");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fb362f99
	Namespace: namespace_66db6bf8
	Checksum: 0x262545A0
	Offset: 0x8B98
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 1879
*/
function function_fb362f99()
{
	trigs = GetEntArray("vk_barrier", "targetname");
	foreach(trig in trigs)
	{
		trig thread function_d100f653();
	}
}

/*
	Name: function_d100f653
	Namespace: namespace_66db6bf8
	Checksum: 0xFDBC43C6
	Offset: 0x8C58
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 1898
*/
function function_d100f653()
{
	self setcursorhint("HINT_NOICON");
	self setHintString("");
	wait(0.05);
	if(self.var_96fa2bf6 == 1)
	{
		self thread function_6655dbca();
	}
	else if(self.var_96fa2bf6 == 2)
	{
		self thread function_9374e56f();
	}
	else if(self.var_96fa2bf6 == 3)
	{
		self thread function_b116a2d0();
		continue;
	}
	if(self.var_c2797701 == 1)
	{
		self thread function_194900be();
	}
}

/*
	Name: function_6655dbca
	Namespace: namespace_66db6bf8
	Checksum: 0x9ACF73B8
	Offset: 0x8D60
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1932
*/
function function_6655dbca()
{
}

/*
	Name: function_9374e56f
	Namespace: namespace_66db6bf8
	Checksum: 0x199A94BA
	Offset: 0x8D70
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 1946
*/
function function_9374e56f()
{
	self.var_b547c755 = 0;
	while(1)
	{
		if(ToLower(self.var_63cab4d7) == "door")
		{
			self setHintString("^5Door ^7[" + self.var_b547c755 + "/" + self.var_6ce0c5c8 + "]\nHold ^3[{+activate}]^7 to contribute " + self.var_8e095a1d);
			continue;
		}
		self setHintString("^5Debris ^7[" + self.var_b547c755 + "/" + self.var_6ce0c5c8 + "]\nHold ^3[{+activate}]^7 to contribute " + self.var_8e095a1d);
		self waittill("trigger", player);
		if(player.score >= self.var_8e095a1d)
		{
			player playlocalsound("zmb_cha_ching");
			player zm_score::minus_to_player_score(self.var_8e095a1d);
			self.var_b547c755 = self.var_b547c755 + self.var_8e095a1d;
			if(self.var_b547c755 >= self.var_6ce0c5c8)
			{
				self thread function_8ee2bea5();
				break;
				continue;
			}
		}
		player playlocalsound("evt_perk_deny");
	}
}

/*
	Name: function_b116a2d0
	Namespace: namespace_66db6bf8
	Checksum: 0x22029A44
	Offset: 0x8F20
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1984
*/
function function_b116a2d0()
{
	if(!self.var_58899840 == 1)
	{
		self setHintString("^5Requires power");
	}
	level flag::wait_till("power_on");
	self thread function_8ee2bea5();
}

/*
	Name: function_8ee2bea5
	Namespace: namespace_66db6bf8
	Checksum: 0x3A3FCE6
	Offset: 0x8F98
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 2004
*/
function function_8ee2bea5()
{
	self setcursorhint("HINT_NOICON");
	self setHintString("");
	self TriggerEnable(0);
	if(!isdefined(self.var_9b5f88a2) || self.var_9b5f88a2 == 0)
	{
		if(isdefined(self.script_flag))
		{
			tokens = StrTok(self.script_flag, ",");
			for(i = 0; i < tokens.size; i++)
			{
				level flag::init(self.script_flag);
				level flag::set(self.script_flag);
			}
			continue;
		}
	}
	namespace_f56b53f0::function_dbe7e78b("Making Zones Adjacent: '^3" + self.var_90d15504 + "^7' & '^3" + self.var_df9609c4 + "^7' from flag: '^5" + self.script_flag + "^7'");
	level thread zm_zonemgr::make_zone_adjacent(self.var_90d15504, self.var_df9609c4, self.script_flag);
	var_7ab88689 = GetEntArray(self.target, "targetname");
	foreach(var_daf22616 in var_7ab88689)
	{
		if(var_daf22616.script_noteworthy == "clip")
		{
			var_daf22616 delete();
		}
	}
	foreach(var_daf22616 in var_7ab88689)
	{
		var_daf22616 thread function_532bafea();
		wait(randomIntRange(1, 4) * 0.05);
	}
	self delete();
}

/*
	Name: function_532bafea
	Namespace: namespace_66db6bf8
	Checksum: 0xE81AFC52
	Offset: 0x92C8
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 2050
*/
function function_532bafea()
{
	playsoundatposition("zmb_lightning_l", self.origin);
	playFX(level._effect["poltergeist"], self.origin);
	var_d3db681a = 15;
	var_b50539e5 = var_d3db681a * -1;
	var_db07b44e = var_d3db681a * 2;
	self moveto(struct::get(self.target).origin + (var_b50539e5 + RandomFloat(var_db07b44e), var_b50539e5 + RandomFloat(var_db07b44e), var_b50539e5 + RandomFloat(var_db07b44e)), 1, 0.3, 0.1);
	self RotateTo(struct::get(self.target).angles + (var_b50539e5 + RandomFloat(var_db07b44e), var_b50539e5 + RandomFloat(var_db07b44e), var_b50539e5 + RandomFloat(var_db07b44e)), 1, 0.3, 0.1);
	wait(0.95);
	self delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_194900be
	Namespace: namespace_66db6bf8
	Checksum: 0x42CED930
	Offset: 0x94B8
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 2075
*/
function function_194900be()
{
	var_7ab88689 = GetEntArray(self.target, "targetname");
	foreach(var_daf22616 in var_7ab88689)
	{
		PlayFXOnTag(self.var_6ce686e9, var_daf22616, "tag_origin");
		var_35fae982 = randomIntRange(3, 16) / 30;
		var_e665f23e = randomIntRange(3, 6);
		var_daf22616 Bobbing((0, 0, 1), var_35fae982, var_e665f23e);
		wait(0.05);
	}
}

/*
	Name: function_d5af7283
	Namespace: namespace_66db6bf8
	Checksum: 0xC7D9946
	Offset: 0x9608
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 2098
*/
function function_d5af7283()
{
	level.var_c644f5e4 = 1;
	while(level.var_c644f5e4)
	{
		level waittill("start_of_round");
		if(!(isdefined(level.first_round) && level.first_round))
		{
			thread function_236ce52e(1);
		}
		level waittill("end_of_round");
		thread function_236ce52e(0);
	}
}

/*
	Name: function_236ce52e
	Namespace: namespace_66db6bf8
	Checksum: 0xD3612EB0
	Offset: 0x9688
	Size: 0x310
	Parameters: 1
	Flags: None
	Line Number: 2123
*/
function function_236ce52e(var_6b4f2e38)
{
	if(!isdefined(var_6b4f2e38))
	{
		var_6b4f2e38 = 1;
	}
	trigs = GetEntArray("vk_tra_roundchange_volume", "targetname");
	ovr = undefined;
	foreach(player in GetPlayers())
	{
		foreach(trig in trigs)
		{
			if(player istouching(trig))
			{
				ovr = trig;
			}
		}
		if(isdefined(ovr))
		{
			if(var_6b4f2e38)
			{
				if(level.var_4011a94e == "samantha")
				{
					player function_46680aa4(ovr.var_966f0e50);
					continue;
				}
				player function_46680aa4(ovr.var_966f0e50 + "_doom");
			}
			else if(level.var_4011a94e == "samantha")
			{
				player function_46680aa4(ovr.var_5d349a63);
				continue;
			}
			player function_46680aa4(ovr.var_5d349a63 + "_doom");
			continue;
		}
		if(var_6b4f2e38)
		{
			if(level.var_4011a94e == "samantha")
			{
				player function_46680aa4("vk_tra_snd_roundchange_nowhere_mus_start");
				continue;
			}
			player function_46680aa4("vk_tra_snd_roundchange_nowhere_mus_start_doom");
			continue;
		}
		if(level.var_4011a94e == "samantha")
		{
			player function_46680aa4("vk_tra_snd_roundchange_nowhere_mus_end");
			continue;
		}
		player function_46680aa4("vk_tra_snd_roundchange_nowhere_mus_end_doom");
	}
}

/*
	Name: function_46680aa4
	Namespace: namespace_66db6bf8
	Checksum: 0x6BDC4DD5
	Offset: 0x99A0
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 2188
*/
function function_46680aa4(alias)
{
	if(!isdefined(alias))
	{
		alias = "";
	}
	if(isdefined(level.dog_intermission) && level.dog_intermission)
	{
		continue;
	}
	namespace_f56b53f0::function_dbe7e78b("^5Roundchange: ^7(^3" + alias + "^7) ^5for player: ^7'^3" + self.name + "^7'");
	self playlocalsound(alias);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cefe9b18
	Namespace: namespace_66db6bf8
	Checksum: 0x4B283D2A
	Offset: 0x9A38
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2214
*/
function function_cefe9b18()
{
	spinners = GetEntArray("vk_tra_spinner", "targetname");
	foreach(spinner in spinners)
	{
		spinner thread function_63ef2770();
	}
}

/*
	Name: function_63ef2770
	Namespace: namespace_66db6bf8
	Checksum: 0x5CE0CD29
	Offset: 0x9AF8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 2233
*/
function function_63ef2770()
{
	if(isdefined(self.var_daf8bb8c))
	{
		if(self.var_daf8bb8c == 1)
		{
			level flag::wait_till("power_on");
		}
	}
	self rotate(self.var_6ecaafb0);
}

/*
	Name: enemy_location_override
	Namespace: namespace_66db6bf8
	Checksum: 0xEAFF19DB
	Offset: 0x9B60
	Size: 0x88
	Parameters: 2
	Flags: None
	Line Number: 2255
*/
function enemy_location_override(zombie, enemy)
{
	AIProfile_BeginEntry("factory-enemy_location_override");
	if(isdefined(zombie.is_trapped) && zombie.is_trapped)
	{
		AIProfile_EndEntry();
		return zombie.origin;
	}
	AIProfile_EndEntry();
	return undefined;
}

/*
	Name: validate_and_set_no_target_position
	Namespace: namespace_66db6bf8
	Checksum: 0xBA09B941
	Offset: 0x9BF0
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 2277
*/
function validate_and_set_no_target_position(position)
{
	if(isdefined(position))
	{
		goal_point = GetClosestPointOnNavMesh(position.origin, 100);
		if(isdefined(goal_point))
		{
			self SetGoal(goal_point);
			self.has_exit_point = 1;
			return 1;
		}
	}
	return 0;
}

/*
	Name: no_target_override
	Namespace: namespace_66db6bf8
	Checksum: 0x4C6DFC1B
	Offset: 0x9C78
	Size: 0x340
	Parameters: 1
	Flags: None
	Line Number: 2302
*/
function no_target_override(zombie)
{
	if(isdefined(zombie.has_exit_point))
	{
		return;
	}
	players = level.players;
	dist_zombie = 0;
	dist_player = 0;
	dest = 0;
	if(isdefined(level.zm_loc_types["dog_location"]))
	{
		locs = Array::randomize(level.zm_loc_types["dog_location"]);
		for(i = 0; i < locs.size; i++)
		{
			found_point = 0;
			foreach(player in players)
			{
				if(player laststand::player_is_in_laststand())
				{
					continue;
				}
				away = VectorNormalize(self.origin - player.origin);
				endPos = self.origin + VectorScale(away, 600);
				dist_zombie = DistanceSquared(locs[i].origin, endPos);
				dist_player = DistanceSquared(locs[i].origin, player.origin);
				if(dist_zombie < dist_player)
				{
					dest = i;
					found_point = 1;
					continue;
				}
				found_point = 0;
			}
			if(found_point)
			{
				if(zombie validate_and_set_no_target_position(locs[i]))
				{
					return;
				}
			}
		}
	}
	escape_position = zombie giant_cleanup::get_escape_position_in_current_zone();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	escape_position = zombie giant_cleanup::get_escape_position();
	if(zombie validate_and_set_no_target_position(escape_position))
	{
		return;
	}
	zombie.has_exit_point = 1;
	zombie SetGoal(zombie.origin);
}

/*
	Name: function_3e7887b1
	Namespace: namespace_66db6bf8
	Checksum: 0xAD376D53
	Offset: 0x9FC0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2369
*/
function function_3e7887b1()
{
	thread function_7432543();
}

/*
	Name: function_7432543
	Namespace: namespace_66db6bf8
	Checksum: 0xF8B56E04
	Offset: 0x9FE0
	Size: 0x400
	Parameters: 0
	Flags: None
	Line Number: 2384
*/
function function_7432543()
{
	cost = 2500;
	trig = GetEnt("vk_tra_trap_tunnel_fan", "targetname");
	light = GetEnt(trig.target, "targetname");
	handle = GetEnt(light.target, "targetname");
	killzone = GetEnt("vk_tra_trap_tunnel_fan_killzone", "targetname");
	fans = GetEntArray("vk_tra_trap_tunnel_fan_blades", "targetname");
	trig setHintString("Requires power");
	trig setcursorhint("HINT_NOICON");
	light SetModel("p7_zm_asc_light_cage_warning_base_off");
	level flag::wait_till("power_on");
	light SetModel("p7_zm_asc_light_cage_warning_green_emissive");
	light.mdl = util::spawn_model("tag_origin", light.origin + VectorScale((0, 0, 1), 5), light.angles);
	light.FX = PlayFXOnTag("vk_fx/zm/_vk_zm_trap_light_green", light.mdl, "tag_origin");
	Earthquake(0.05, 1, light.mdl.origin, 100);
	foreach(fan in fans)
	{
		fan rotate(fan.var_6ecaafb0);
	}
	while(1)
	{
		if(trig.var_9a42e31c)
		{
			trig setHintString("Hold ^3[{+activate}]^7 to activate fan trap [Cost: 2500]");
			continue;
		}
		trig setHintString("");
		trig waittill("trigger", player);
		if(trig.var_9a42e31c)
		{
			if(player.score >= cost)
			{
				player zm_score::minus_to_player_score(cost);
				player playlocalsound("zmb_cha_ching");
				trig thread function_7ac6a631(light, handle, killzone, fans);
				continue;
			}
			player playlocalsound("evt_perk_deny");
		}
		wait(0.05);
	}
}

/*
	Name: function_7ac6a631
	Namespace: namespace_66db6bf8
	Checksum: 0x9008EB25
	Offset: 0xA3E8
	Size: 0x5D0
	Parameters: 4
	Flags: None
	Line Number: 2438
*/
function function_7ac6a631(light, handle, killzone, fans)
{
	self.var_9a42e31c = 0;
	light.mdl delete();
	light.FX delete();
	wait(0.05);
	light SetModel("p7_zm_asc_light_cage_warning_red_emissive");
	light.mdl = util::spawn_model("tag_origin", light.origin + VectorScale((0, 0, 1), 5), light.angles);
	light.FX = PlayFXOnTag("vk_fx/zm/_vk_zm_trap_light_red", light.mdl, "tag_origin");
	Earthquake(0.05, 1, light.mdl.origin, 300);
	wait(0.05);
	handle.mdl = util::spawn_model("tag_origin", handle.origin, handle.angles);
	handle.FX = PlayFXOnTag("dlc3/stalingrad/fx_elec_sparks_os", handle.mdl, "tag_origin");
	var_53150f08 = GetEnt("fan_suck_trap", "script_noteworthy");
	var_53150f08 thread namespace_6bb3d85d::function_6922ec43();
	var_816493f = struct::get_array("vk_tra_trap_tunnel_fan_blade_motor_fx", "targetname");
	foreach(var_2b56927c in var_816493f)
	{
		thread namespace_f56b53f0::oneshot("vk_fx/misc/fan_trap_activation_blade_motor_sparks", 10, var_2b56927c.origin, var_2b56927c.angles);
	}
	handle RotatePitch(180, 0.5);
	wait(45);
	var_53150f08 notify("hash_6acbb429", var_816493f);
	handle RotatePitch(-180, 0.5);
	self setHintString("Cooling down");
	var_70a240b8 = struct::get("vk_tra_trap_tunnel_fan_overheat_fx", "targetname");
	var_4edc84b3 = util::spawn_model("tag_origin", var_70a240b8.origin, var_70a240b8.angles);
	var_ae0214d0 = PlayFXOnTag("vk_fx/misc/trap_overheat_smoking", var_4edc84b3, "tag_origin");
	var_4edc84b3 thread sound::loop_on_entity("trap_overheat_loop");
	handle.mdl delete();
	handle.FX delete();
	playsoundatposition("trap_overheated", var_70a240b8.origin);
	wait(90);
	var_4edc84b3 thread sound::stop_loop_on_entity("trap_overheat_loop");
	light SetModel("p7_zm_asc_light_cage_warning_green_emissive");
	light.mdl = util::spawn_model("tag_origin", light.origin + VectorScale((0, 0, 1), 5), light.angles);
	light.FX = PlayFXOnTag("vk_fx/zm/_vk_zm_trap_light_green", light.mdl, "tag_origin");
	Earthquake(0.05, 1, light.mdl.origin, 100);
	wait(0.05);
	var_4edc84b3 delete();
	var_ae0214d0 delete();
	self.var_9a42e31c = 1;
	self setHintString("Hold ^3[{+activate}]^7 to activate fan trap [Cost: 2500]");
}

/*
	Name: function_2afd88b0
	Namespace: namespace_66db6bf8
	Checksum: 0x79C1AD3C
	Offset: 0xA9C0
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 2493
*/
function function_2afd88b0(killzone)
{
	while(1)
	{
		killzone waittill("trigger", ent);
		wait(0.05);
		if(isPlayer(ent))
		{
			continue;
			continue;
		}
	}
}

/*
	Name: on_finalize_initialization
	Namespace: namespace_66db6bf8
	Checksum: 0x1BDD287F
	Offset: 0xAA28
	Size: 0x1B8
	Parameters: 0
	Flags: None
	Line Number: 2517
*/
function on_finalize_initialization()
{
	wait(0.1);
	keys = getArrayKeys(level.AAT);
	foreach(AAT in keys)
	{
		msg = "Server: " + AAT + " index is " + level.AAT[AAT].var_4851adad;
		/#
			println(msg);
		#/
	}
	level.AAT["zm_aat_blast_furnace"].var_4851adad = 1;
	level.AAT["zm_aat_dead_wire"].var_4851adad = 2;
	level.AAT["zm_aat_fire_works"].var_4851adad = 3;
	level.AAT["zm_aat_aethercollapse"].var_4851adad = 4;
	level.AAT["zm_aat_thunder_wall"].var_4851adad = 5;
	level.AAT["zm_aat_turned"].var_4851adad = 6;
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_96599d3f
	Namespace: namespace_66db6bf8
	Checksum: 0xE4F938D4
	Offset: 0xABE8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2549
*/
function function_96599d3f()
{
	level.var_48ea0a78 = 0;
	level.var_9ba4ad4a = 0;
	level thread function_fc82907();
	level thread function_f97319b5();
	level thread function_c88aa6b8();
	level thread function_c98df50e();
}

/*
	Name: function_c88aa6b8
	Namespace: namespace_66db6bf8
	Checksum: 0x98839508
	Offset: 0xAC70
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2569
*/
function function_c88aa6b8()
{
	modvar("vk_fog", "");
	SetDvar("vk_fog", "");
	while(1)
	{
		if(GetDvarString("vk_fog") != "")
		{
			string = GetDvarString("vk_fog");
			if(string == "0")
			{
				level.var_9ba4ad4a = 0;
				continue;
			}
			level.var_9ba4ad4a = 1;
			level notify("hash_6781e446");
			SetDvar("vk_fog", "");
		}
		wait(0.1);
	}
}

/*
	Name: function_c98df50e
	Namespace: namespace_66db6bf8
	Checksum: 0x3AA5000B
	Offset: 0xAD78
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2601
*/
function function_c98df50e()
{
	modvar("vk_night", "");
	SetDvar("vk_night", "");
	while(1)
	{
		if(GetDvarString("vk_night") != "")
		{
			string = GetDvarString("vk_night");
			if(string == "0")
			{
				level.var_48ea0a78 = 0;
				continue;
			}
			level.var_48ea0a78 = 1;
			level notify("hash_6636ecec");
			SetDvar("vk_night", "");
		}
		wait(0.1);
	}
}

/*
	Name: function_fc82907
	Namespace: namespace_66db6bf8
	Checksum: 0x3121C7FD
	Offset: 0xAE80
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 2633
*/
function function_fc82907()
{
	while(1)
	{
		level waittill("hash_6781e446");
		wait(0.1);
		if(level.var_48ea0a78 == 0)
		{
			if(level.var_9ba4ad4a == 0)
			{
				Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 1);
				continue;
			}
			Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 2);
		}
		else if(level.var_9ba4ad4a == 0)
		{
			Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 4);
			continue;
		}
		Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 8);
	}
}

/*
	Name: function_f97319b5
	Namespace: namespace_66db6bf8
	Checksum: 0x2381AE7F
	Offset: 0xAFB8
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2667
*/
function function_f97319b5()
{
	while(1)
	{
		level waittill("hash_6636ecec");
		wait(0.1);
		if(level.var_48ea0a78 == 0)
		{
			level thread util::set_lighting_state(0);
			if(level.var_9ba4ad4a == 0)
			{
				Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 1);
				continue;
			}
			Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 2);
			continue;
		}
		level thread util::set_lighting_state(2);
		if(level.var_9ba4ad4a == 0)
		{
			Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 4);
			continue;
		}
		Array::run_all(level.players, &clientfield::set_to_player, "set_world_fog", 8);
	}
}

/*
	Name: function_933e1437
	Namespace: namespace_66db6bf8
	Checksum: 0xA1777BAA
	Offset: 0xB118
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2704
*/
function function_933e1437()
{
	trigs = GetEntArray("vk_tra_hatch", "targetname");
	foreach(trig in trigs)
	{
		trig thread function_7bcdcb92();
	}
}

/*
	Name: function_7bcdcb92
	Namespace: namespace_66db6bf8
	Checksum: 0xB44A375D
	Offset: 0xB1D8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2723
*/
function function_7bcdcb92()
{
	self setHintString("");
	self setcursorhint("HINT_NOICON");
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_45242197
	Namespace: namespace_66db6bf8
	Checksum: 0x19C42350
	Offset: 0xB228
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 2742
*/
function function_45242197(STR)
{
	str_base = struct::get(STR);
	var_d5fa6826 = struct::get(str_base.target);
	var_2401b764 = util::spawn_model("tag_origin", self.origin, self.angles);
	self playerLinkTo(var_2401b764);
	level thread scene::Play("mp_mantle_up_57", self);
	var_2401b764 moveto(str_base.origin, 0.35, 0.1, 0);
	wait(0.35);
	var_2401b764 moveto(var_d5fa6826.origin, 0.55, 0, 0.1);
	wait(0.6);
	self Unlink();
	wait(0.05);
	var_2401b764 delete();
	wait(1);
	self.var_175ee9e6 = 0;
}

/*
	Name: function_34373bd5
	Namespace: namespace_66db6bf8
	Checksum: 0x64F9E966
	Offset: 0xB3B8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2770
*/
function function_34373bd5()
{
	SetDvar("hatch_check_enable", 1);
	SetDvar("hatch_mantle_up", 10);
	SetDvar("hatch_mantle_fwd", 18);
}

/*
	Name: function_1b8151fd
	Namespace: namespace_66db6bf8
	Checksum: 0xEC12EB12
	Offset: 0xB428
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 2787
*/
function function_1b8151fd()
{
	var_df3df5d5 = GetEntArray("vk_tra_nighttime_mdls", "targetname");
	if(isdefined(var_df3df5d5[0]))
	{
		foreach(mdl in var_df3df5d5)
		{
			mdl thread function_fc0ffc11();
		}
	}
}

/*
	Name: function_fc0ffc11
	Namespace: namespace_66db6bf8
	Checksum: 0x4BFA7CD2
	Offset: 0xB4F8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2809
*/
function function_fc0ffc11()
{
	level waittill("hash_6636ecec");
	self SetModel(self.script_string);
}

/*
	Name: function_4e706158
	Namespace: namespace_66db6bf8
	Checksum: 0x69E4A1D7
	Offset: 0xB530
	Size: 0x2C0
	Parameters: 3
	Flags: None
	Line Number: 2825
*/
function function_4e706158(player, game_over_hud, survived_hud)
{
	level.custom_intermission = &function_2849967a;
	game_over_hud.alignX = "center";
	game_over_hud.alignY = "middle";
	game_over_hud.horzAlign = "center";
	game_over_hud.vertAlign = "middle";
	game_over_hud.y = game_over_hud.y - 130;
	game_over_hud.foreground = 1;
	game_over_hud.fontscale = 3;
	game_over_hud.alpha = 0;
	game_over_hud.color = (1, 0, 0);
	game_over_hud.hidewheninmenu = 1;
	game_over_hud setText("GAME OVER");
	game_over_hud fadeOverTime(1);
	game_over_hud.alpha = 1;
	if(player IsSplitscreen())
	{
		game_over_hud.fontscale = 2;
		game_over_hud.y = game_over_hud.y + 40;
	}
	survived_hud.alignX = "center";
	survived_hud.alignY = "middle";
	survived_hud.horzAlign = "center";
	survived_hud.vertAlign = "middle";
	survived_hud.y = survived_hud.y - 100;
	survived_hud.foreground = 1;
	survived_hud.fontscale = 2;
	survived_hud.alpha = 0;
	survived_hud.color = (1, 1, 1);
	survived_hud.hidewheninmenu = 1;
	if(player IsSplitscreen())
	{
		survived_hud.fontscale = 1.5;
		survived_hud.y = survived_hud.y + 40;
	}
}

/*
	Name: function_2849967a
	Namespace: namespace_66db6bf8
	Checksum: 0xE1E09823
	Offset: 0xB7F8
	Size: 0x328
	Parameters: 0
	Flags: None
	Line Number: 2873
*/
function function_2849967a()
{
	players = GetPlayers();
	start = struct::get("intermission", "targetname");
	end = struct::get(start.target, "targetname");
	var_e3528cf4 = struct::get(end.target, "targetname");
	if(!isdefined(var_e3528cf4))
	{
		namespace_f56b53f0::function_dbe7e78b("Error: Missing focus point struct.");
		return;
	}
	temp_ent = util::spawn_model("tag_origin", start.origin, start.angles);
	foreach(player in players)
	{
		player thread function_4b4bc5cc();
	}
	wait(1.5);
	foreach(player in players)
	{
		player StartCameraTween(0.1);
		player CameraActivate(1);
		player CameraSetPosition(temp_ent);
		player CameraSetLookAt(var_e3528cf4.origin);
	}
	speed = 60;
	if(isdefined(end.script_transition_time))
	{
		speed = end.script_transition_time;
	}
	temp_ent moveto(end.origin, speed);
	temp_ent RotateTo(end.angles, speed);
	wait(speed);
	temp_ent delete();
}

/*
	Name: function_4b4bc5cc
	Namespace: namespace_66db6bf8
	Checksum: 0x85B660B
	Offset: 0xBB28
	Size: 0x9C
	Parameters: 0
	Flags: None
	Line Number: 2918
*/
function function_4b4bc5cc()
{
	self FreezeControls(1);
	wait(0.5);
	self thread LUI::screen_flash(0.5, 1.5, 0.5, 1, "black");
	self setClientUIVisibilityFlag("hud_visible", 0);
	wait(0.5);
	self ghost();
}

