#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\audio_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\duplicaterender_mgr;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_272c5387;

/*
	Name: __init__sytem__
	Namespace: namespace_272c5387
	Checksum: 0x4F6899A5
	Offset: 0x10A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_perk_vulture", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_272c5387
	Checksum: 0xBC8E765D
	Offset: 0x10E8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	enable_vulture_perk_for_level();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: enable_vulture_perk_for_level
	Namespace: namespace_272c5387
	Checksum: 0xE09F82F8
	Offset: 0x1108
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function enable_vulture_perk_for_level()
{
	zm_perks::register_perk_clientfields("specialty_vultureaid", &function_81f7a118, &function_5161a937);
	zm_perks::register_perk_effects("specialty_vultureaid", "vulture_light");
	zm_perks::register_perk_init_thread("specialty_vultureaid", &init_vulture);
}

/*
	Name: function_81f7a118
	Namespace: namespace_272c5387
	Checksum: 0x95FCF855
	Offset: 0x1198
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 71
*/
function function_81f7a118()
{
	clientfield::register("clientuimodel", "hudItems.perks.vultureaid", 1, 1, "int", undefined, 0, 1);
	clientfield::register("scriptmover", "vulture_stink_fx", 1, 1, "int", &function_aabca9cb, 0, 0);
	clientfield::register("actor", "vulture_stink_trail_fx", 1, 1, "int", &function_c6401b98, 0, 0);
	clientfield::register("actor", "vulture_eye_glow", 1, 1, "int", &function_43041206, 0, 0);
	clientfield::register("toplayer", "vulture_perk_active", 1, 1, "int", &function_911fffa7, 0, 1);
	clientfield::register("toplayer", "sndVultureStink", 1, 1, "int", &function_c6789968, 0, 0);
	clientfield::register("toplayer", "vulture_perk_disease_meter", 1, 6, "int", undefined, 0, 1);
	clientfield::register("zbarrier", "vulture_perk_zbarrier", 1, 1, "int", &function_c8dfea2f, 0, 0);
	clientfield::register("zbarrier", "vulture_perk_wunderfizz", 1, 1, "int", &function_6e379de4, 0, 0);
	clientfield::register("scriptmover", "vulture_powerup", 1, 4, "int", &function_e283d203, 0, 0);
	clientfield::register("world", "vulture_perk_disable_solo_quick_revive_glow", 1, 1, "int", &function_36639cf9, 0, 0);
	clientfield::register("zbarrier", "vulture_perk_enable_bgb_glow", 1, 1, "int", &function_2a229617, 0, 0);
}

/*
	Name: function_5161a937
	Namespace: namespace_272c5387
	Checksum: 0x1804FA10
	Offset: 0x14E8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 97
*/
function function_5161a937()
{
	SetupClientFieldCodeCallbacks("toplayer", 1, "vulture_perk_disease_meter");
}

/*
	Name: init_vulture
	Namespace: namespace_272c5387
	Checksum: 0x143C801D
	Offset: 0x1520
	Size: 0x8B0
	Parameters: 0
	Flags: None
	Line Number: 112
*/
function init_vulture()
{
	level._effect["vulture_light"] = "zombie/fx_perk_quick_revive_zmb";
	level._effect["vulture_perk_zombie_stink"] = "zombie/vultureaid/fx_zm_vulture_perk_stink";
	level._effect["vulture_perk_zombie_stink_trail"] = "zombie/vultureaid/fx_zm_vulture_perk_stink_trail";
	level._effect["vulture_perk_bonus_drop"] = "zombie/vultureaid/fx_zombie_powerup_vulture";
	level._effect["vulture_perk_bonus_drop_grabbed"] = "zombie/vultureaid/fx_powerup_grab_vulture_zmb";
	level._effect["vulture_perk_wallbuy_static"] = "zombie/vultureaid/fx_zm_vulture_wallbuy_rifle";
	level._effect["vulture_perk_wallbuy_dynamic"] = "zombie/vultureaid/fx_zm_vulture_glow_question";
	level._effect["vulture_perk_machine_glow_juggernog"] = "zombie/vultureaid/fx_zm_vulture_glow_jugg";
	level._effect["vulture_perk_machine_glow_speed"] = "zombie/vultureaid/fx_zm_vulture_glow_speed";
	level._effect["vulture_perk_machine_glow_doubletap"] = "zombie/vultureaid/fx_zm_vulture_glow_dbltap";
	level._effect["vulture_perk_machine_glow_deadshot"] = "zombie/vultureaid/fx_zm_vulture_glow_deadshot";
	level._effect["vulture_perk_machine_glow_revive"] = "zombie/vultureaid/fx_zm_vulture_glow_revive";
	level._effect["vulture_perk_machine_glow_marathon"] = "zombie/vultureaid/fx_zm_vulture_glow_marathon";
	level._effect["vulture_perk_machine_glow_mule_kick"] = "zombie/vultureaid/fx_zm_vulture_glow_mule";
	level._effect["vulture_perk_machine_glow_pack_a_punch"] = "zombie/vultureaid/fx_zm_vulture_glow_pap";
	level._effect["vulture_perk_machine_glow_random"] = "zombie/vultureaid/fx_zm_vulture_glow_fizz";
	level._effect["vulture_perk_machine_glow_vulture"] = "zombie/vultureaid/fx_zm_vulture_glow_vulture";
	level._effect["vulture_perk_machine_glow_divetonuke"] = "zombie/vultureaid/fx_zm_vulture_glow_divetonuke";
	level._effect["vulture_perk_machine_glow_cherry"] = "zombie/vultureaid/fx_zm_vulture_glow_cherry";
	level._effect["vulture_perk_machine_glow_widow"] = "zombie/vultureaid/fx_zm_vulture_glow_widows";
	level._effect["vulture_perk_mystery_box_glow"] = "zombie/vultureaid/fx_zm_vulture_glow_mystery_box";
	level._effect["vulture_perk_powerup_drop"] = "zombie/vultureaid/fx_zm_vulture_glow_powerup";
	level._effect["vulture_perk_powerup_drop_solo"] = "zombie/vultureaid/fx_zm_vulture_glow_powerup_solo";
	level._effect["vulture_perk_powerup_drop_caution"] = "zombie/vultureaid/fx_zm_vulture_glow_powerup_caution";
	level._effect["vulture_perk_powerup_drop_zombie"] = "zombie/vultureaid/fx_zm_vulture_glow_powerup_zombie";
	level._effect["vulture_perk_zombie_eye_glow"] = "vk_fx/zm/_vk_zm_vulture_eyes";
	level._effect["vulture_perk_machine_glow_bgb"] = "zombie/vultureaid/fx_zm_vulture_glow_bgb";
	level._effect["vulture_perk_machine_glow_icu"] = "vk_fx/zm/_vk_zm_vulture_perk_icu";
	level._effect["vulture_perk_machine_glow_fighter"] = "vk_fx/zm/_vk_zm_vulture_perk_fighter";
	level._effect["vulture_perk_machine_glow_crusader"] = "vk_fx/zm/_vk_zm_vulture_perk_crusaderl";
	level._effect["vulture_perk_machine_glow_bull"] = "vk_fx/zm/_vk_zm_vulture_perk_bull";
	level._effect["vulture_perk_machine_glow_banana"] = "vk_fx/zm/_vk_zm_vulture_perk_banana";
	level._effect["vulture_perk_machine_glow_madgaz"] = "vk_fx/zm/_vk_zm_vulture_perk_madgaz";
	level._effect["vulture_perk_machine_glow_vigor"] = "vk_fx/zm/_vk_zm_vulture_perk_vigor";
	util::REGISTER_SYSTEM("vulture_drop_fx", &function_8b81515);
	util::REGISTER_SYSTEM("setPerkOverlayStyle", &function_75aa16e4);
	level.perk_vulture = spawnstruct();
	level.perk_vulture.var_97d35872 = [];
	level.perk_vulture.var_dd154843 = [];
	level.perk_vulture.var_d54c537d = [];
	level.perk_vulture.var_f3acc633 = [];
	function_b5a23c1b("zombie_eyes", &function_ca2ad97e, undefined);
	function_b5a23c1b("mystery_box", &function_9be22913, undefined);
	function_b5a23c1b("perk_random", &function_7a083d2d, undefined);
	function_b5a23c1b("pack_a_punch", &function_852ac413, undefined);
	function_b5a23c1b("wallbuys_static", &function_5b18a1a, undefined);
	function_b5a23c1b("wallbuys_dynamic", &function_fd197bfb, undefined);
	level.var_9df739a8 = &function_a0cbee03;
	function_b5a23c1b("powerups", &function_1096728c, undefined);
	function_b5a23c1b("bgb", &function_b6d754c1, undefined);
	function_fee68ae8("specialty_armorvest", "vulture_perk_machine_glow_juggernog");
	function_fee68ae8("specialty_fastreload", "vulture_perk_machine_glow_speed");
	function_fee68ae8("specialty_doubletap2", "vulture_perk_machine_glow_doubletap");
	function_fee68ae8("specialty_deadshot", "vulture_perk_machine_glow_deadshot");
	function_fee68ae8("specialty_quickrevive", "vulture_perk_machine_glow_revive");
	function_fee68ae8("specialty_staminup", "vulture_perk_machine_glow_marathon");
	function_fee68ae8("specialty_additionalprimaryweapon", "vulture_perk_machine_glow_mule_kick");
	function_fee68ae8("specialty_vultureaid", "vulture_perk_machine_glow_vulture");
	function_fee68ae8("specialty_phdflopper", "vulture_perk_machine_glow_divetonuke");
	function_fee68ae8("specialty_electriccherry", "vulture_perk_machine_glow_cherry");
	function_fee68ae8("specialty_widowswine", "vulture_perk_machine_glow_widow");
	function_fee68ae8("specialty_quieter", "vulture_perk_machine_glow_icu");
	function_fee68ae8("specialty_jetquiet", "vulture_perk_machine_glow_fighter");
	function_fee68ae8("specialty_flashprotection", "vulture_perk_machine_glow_crusader");
	function_fee68ae8("specialty_proximityprotection", "vulture_perk_machine_glow_bull");
	function_fee68ae8("specialty_immunecounteruav", "vulture_perk_machine_glow_banana");
	function_fee68ae8("specialty_flakjacket", "vulture_perk_machine_glow_madgaz");
	function_fee68ae8("specialty_directionalfire", "vulture_perk_machine_glow_vigor");
	function_b5a23c1b("perks", &function_ad8c2094, &function_61b179d1);
	perk_machines = struct::get_array("zm_perk_machine", "targetname");
	Array::thread_all(perk_machines, &function_62efe26c);
	level thread function_331c03b3();
}

/*
	Name: function_8b81515
	Namespace: namespace_272c5387
	Checksum: 0x30236346
	Offset: 0x1DD8
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 198
*/
function function_8b81515(localClientNum, state, oldState)
{
	tokens = StrTok(state, "|");
	player = GetLocalPlayer(localClientNum);
	if(tokens[0] == "1")
	{
		v_origin = (float(tokens[2]), float(tokens[3]), float(tokens[4]));
		player thread function_591ab4f0(localClientNum, tokens[1], v_origin);
		continue;
	}
	player notify("vulture_drop_fx_remove" + tokens[1], tokens[2]);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_591ab4f0
	Namespace: namespace_272c5387
	Checksum: 0xD8CD66BA
	Offset: 0x1F10
	Size: 0x158
	Parameters: 3
	Flags: None
	Line Number: 223
*/
function function_591ab4f0(localClientNum, str_identifier, v_origin)
{
	playsound(localClientNum, "zmb_vulture_drop_spawn", v_origin);
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_bonus_drop"], v_origin);
	audio::playloopat("zmb_vulture_drop_loop", v_origin);
	self waittill("vulture_drop_fx_remove" + str_identifier, var_a49e66f7);
	deletefx(localClientNum, n_fx_id, 1);
	audio::stoploopat("zmb_vulture_drop_loop", v_origin);
	if(var_a49e66f7 == "true")
	{
		playFX(localClientNum, level._effect["vulture_perk_bonus_drop_grabbed"], v_origin);
		playsound(localClientNum, "zmb_vulture_drop_pickup", v_origin);
	}
}

/*
	Name: function_77b9dba9
	Namespace: namespace_272c5387
	Checksum: 0x4A900799
	Offset: 0x2070
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 248
*/
function function_77b9dba9(callback_func)
{
	players = GetLocalPlayers();
	for(i = 0; i < players.size; i++)
	{
		self [[callback_func]](i);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c6401b98
	Namespace: namespace_272c5387
	Checksum: 0xD051559B
	Offset: 0x20E0
	Size: 0x1C0
	Parameters: 7
	Flags: None
	Line Number: 269
*/
function function_c6401b98(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	function_e3ed7cd7();
	if(newVal == 1)
	{
		if(!IsInArray(level.perk_vulture.var_97d35872, self))
		{
			self function_77b9dba9(&function_dba55668);
			if(!isdefined(level.perk_vulture.var_97d35872))
			{
				level.perk_vulture.var_97d35872 = [];
			}
			else if(!IsArray(level.perk_vulture.var_97d35872))
			{
				level.perk_vulture.var_97d35872 = Array(level.perk_vulture.var_97d35872);
			}
			level.perk_vulture.var_97d35872[level.perk_vulture.var_97d35872.size] = self;
		}
	}
	else if(IsInArray(level.perk_vulture.var_97d35872, self))
	{
		self function_77b9dba9(&function_b19cd93);
		ArrayRemoveValue(level.perk_vulture.var_97d35872, self);
	}
}

/*
	Name: function_aabca9cb
	Namespace: namespace_272c5387
	Checksum: 0xE03C59E7
	Offset: 0x22A8
	Size: 0x1B0
	Parameters: 7
	Flags: None
	Line Number: 309
*/
function function_aabca9cb(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		if(!IsInArray(level.perk_vulture.var_dd154843, self))
		{
			self function_77b9dba9(&function_735c2e72);
			if(!isdefined(level.perk_vulture.var_dd154843))
			{
				level.perk_vulture.var_dd154843 = [];
			}
			else if(!IsArray(level.perk_vulture.var_dd154843))
			{
				level.perk_vulture.var_dd154843 = Array(level.perk_vulture.var_dd154843);
			}
			level.perk_vulture.var_dd154843[level.perk_vulture.var_dd154843.size] = self;
		}
	}
	else if(IsInArray(level.perk_vulture.var_dd154843, self))
	{
		self function_77b9dba9(&function_bcd192b1);
		ArrayRemoveValue(level.perk_vulture.var_dd154843, self);
	}
}

/*
	Name: function_9016b934
	Namespace: namespace_272c5387
	Checksum: 0xD992183C
	Offset: 0x2460
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 348
*/
function function_9016b934(localClientNum)
{
	return isdefined(level.perk_vulture.var_d54c537d[localClientNum]) && level.perk_vulture.var_d54c537d[localClientNum];
}

/*
	Name: function_911fffa7
	Namespace: namespace_272c5387
	Checksum: 0x3CF380C
	Offset: 0x24A8
	Size: 0x360
	Parameters: 7
	Flags: None
	Line Number: 363
*/
function function_911fffa7(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal == 1)
	{
		if(!function_9016b934(localClientNum))
		{
			level.perk_vulture.var_d54c537d[localClientNum] = 1;
			function_e3ed7cd7();
			foreach(zombie in level.perk_vulture.var_97d35872)
			{
				zombie function_dba55668(localClientNum);
			}
			foreach(ent in level.perk_vulture.var_dd154843)
			{
				ent function_735c2e72(localClientNum);
			}
			level thread function_50278a8b(localClientNum);
		}
	}
	else if(function_9016b934(localClientNum))
	{
		level.perk_vulture.var_d54c537d[localClientNum] = 0;
		function_e3ed7cd7();
		foreach(zombie in level.perk_vulture.var_97d35872)
		{
			zombie function_b19cd93(localClientNum);
		}
		foreach(ent in level.perk_vulture.var_dd154843)
		{
			ent function_bcd192b1(localClientNum);
		}
		level thread function_b5236d86(localClientNum);
		return;
	}
	level.perk_vulture.var_0 = undefined;
}

/*
	Name: function_b5a23c1b
	Namespace: namespace_272c5387
	Checksum: 0x530B2A1D
	Offset: 0x2810
	Size: 0x90
	Parameters: 3
	Flags: None
	Line Number: 410
*/
function function_b5a23c1b(type, var_39ac7f09, var_7f29c021)
{
	struct = spawnstruct();
	struct.var_39ac7f09 = var_39ac7f09;
	struct.var_7f29c021 = var_7f29c021;
	struct.ent_list = [];
	level.perk_vulture.var_f3acc633[type] = struct;
}

/*
	Name: function_c7dc58f5
	Namespace: namespace_272c5387
	Checksum: 0x3B11DE06
	Offset: 0x28A8
	Size: 0x200
	Parameters: 2
	Flags: None
	Line Number: 429
*/
function function_c7dc58f5(type, ent)
{
	struct = level.perk_vulture.var_f3acc633[type];
	if(!IsInArray(struct.ent_list, ent))
	{
		ent.var_1429a0ec = [];
		players = GetLocalPlayers();
		for(i = 0; i < players.size; i++)
		{
			is_visible = 1;
			if(isdefined(struct.var_7f29c021))
			{
				is_visible = ent [[struct.var_7f29c021]](i);
			}
			if(is_visible && function_9016b934(i))
			{
				n_fx_id = ent [[struct.var_39ac7f09]](i);
				ent.var_1429a0ec[i] = n_fx_id;
			}
		}
		if(!isdefined(struct.ent_list))
		{
			struct.ent_list = [];
		}
		else if(!IsArray(struct.ent_list))
		{
			struct.ent_list = Array(struct.ent_list);
		}
		struct.ent_list[struct.ent_list.size] = ent;
	}
}

/*
	Name: function_a33a6050
	Namespace: namespace_272c5387
	Checksum: 0xDE0B7288
	Offset: 0x2AB0
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 471
*/
function function_a33a6050(type, ent)
{
	struct = level.perk_vulture.var_f3acc633[type];
	if(IsInArray(struct.ent_list, ent))
	{
		ArrayRemoveValue(struct.ent_list, ent);
		players = GetLocalPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(ent.var_1429a0ec[i]))
			{
				deletefx(i, ent.var_1429a0ec[i], 1);
			}
		}
		ent.var_1429a0ec = undefined;
		return;
	}
}

/*
	Name: function_50278a8b
	Namespace: namespace_272c5387
	Checksum: 0x7420918
	Offset: 0x2BE0
	Size: 0x270
	Parameters: 1
	Flags: None
	Line Number: 500
*/
function function_50278a8b(localClientNum)
{
	level endon("vulture_vision_disable_" + localClientNum);
	while(1)
	{
		keys = getArrayKeys(level.perk_vulture.var_f3acc633);
		foreach(key in keys)
		{
			struct = level.perk_vulture.var_f3acc633[key];
			foreach(ent in struct.ent_list)
			{
				is_visible = 1;
				if(isdefined(struct.var_7f29c021))
				{
					is_visible = ent [[struct.var_7f29c021]](localClientNum);
				}
				if(is_visible)
				{
					if(!isdefined(ent.var_1429a0ec[localClientNum]))
					{
						n_fx_id = ent [[struct.var_39ac7f09]](localClientNum);
						ent.var_1429a0ec[localClientNum] = n_fx_id;
						continue;
					}
				}
				if(isdefined(ent.var_1429a0ec[localClientNum]))
				{
					deletefx(localClientNum, ent.var_1429a0ec[localClientNum], 1);
					ent.var_1429a0ec[localClientNum] = undefined;
				}
			}
		}
		wait(0.016);
	}
}

/*
	Name: function_b5236d86
	Namespace: namespace_272c5387
	Checksum: 0xA7953171
	Offset: 0x2E58
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 546
*/
function function_b5236d86(localClientNum)
{
	level notify("vulture_vision_disable_" + localClientNum);
	keys = getArrayKeys(level.perk_vulture.var_f3acc633);
	foreach(key in keys)
	{
		struct = level.perk_vulture.var_f3acc633[key];
		foreach(ent in struct.ent_list)
		{
			if(isdefined(ent.var_1429a0ec[localClientNum]))
			{
				deletefx(localClientNum, ent.var_1429a0ec[localClientNum], 1);
				ent.var_1429a0ec[localClientNum] = undefined;
			}
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_dba55668
	Namespace: namespace_272c5387
	Checksum: 0xA9D119E3
	Offset: 0x3018
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 576
*/
function function_dba55668(localClientNum)
{
	if(!isdefined(self.var_4fcf250c))
	{
		self.var_4fcf250c = [];
	}
	if(function_9016b934(localClientNum) && (!(isdefined(self.var_4fcf250c[localClientNum]) && self.var_4fcf250c[localClientNum])))
	{
		self.var_4fcf250c[localClientNum] = 1;
		self thread function_2ce579d9(localClientNum);
	}
}

/*
	Name: function_2ce579d9
	Namespace: namespace_272c5387
	Checksum: 0x4BE0F7F3
	Offset: 0x30B8
	Size: 0x128
	Parameters: 1
	Flags: None
	Line Number: 599
*/
function function_2ce579d9(localClientNum)
{
	sndent = spawn(0, self.origin, "script_origin");
	sndent LinkTo(self);
	sndLoopID = sndent PlayLoopSound("zmb_vulture_stink_loop", 1);
	while(isdefined(self) && (isdefined(self.var_4fcf250c[localClientNum]) && self.var_4fcf250c[localClientNum]))
	{
		playFX(localClientNum, level._effect["vulture_perk_zombie_stink_trail"], self.origin);
		wait(0.1);
	}
	sndent StopLoopSound(sndLoopID);
	sndent delete();
}

/*
	Name: function_b19cd93
	Namespace: namespace_272c5387
	Checksum: 0x50BED6A3
	Offset: 0x31E8
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 623
*/
function function_b19cd93(localClientNum)
{
	self.var_4fcf250c[localClientNum] = 0;
}

/*
	Name: function_735c2e72
	Namespace: namespace_272c5387
	Checksum: 0xCA9FA76
	Offset: 0x3210
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 638
*/
function function_735c2e72(localClientNum)
{
	if(!isdefined(self.var_1b795085))
	{
		self.var_1b795085 = [];
	}
	if(function_9016b934(localClientNum) && (!(isdefined(self.var_1b795085[localClientNum]) && self.var_1b795085[localClientNum])))
	{
		self.var_1b795085[localClientNum] = 1;
		self thread function_dc14159d(localClientNum);
	}
}

/*
	Name: function_dc14159d
	Namespace: namespace_272c5387
	Checksum: 0x28EBFB8A
	Offset: 0x32B0
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 661
*/
function function_dc14159d(localClientNum)
{
	sndOrigin = self.origin;
	audio::playloopat("zmb_vulture_stink_loop", sndOrigin);
	while(isdefined(self) && (isdefined(self.var_1b795085[localClientNum]) && self.var_1b795085[localClientNum]))
	{
		playFX(localClientNum, level._effect["vulture_perk_zombie_stink"], self.origin);
		wait(0.125);
	}
	audio::stoploopat("zmb_vulture_stink_loop", sndOrigin);
}

/*
	Name: function_bcd192b1
	Namespace: namespace_272c5387
	Checksum: 0xCB47269A
	Offset: 0x3380
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 683
*/
function function_bcd192b1(localClientNum)
{
	self.var_1b795085[localClientNum] = 0;
}

/*
	Name: function_e3ed7cd7
	Namespace: namespace_272c5387
	Checksum: 0xA9E91EC5
	Offset: 0x33A8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 698
*/
function function_e3ed7cd7()
{
	level.perk_vulture.var_97d35872 = Array::remove_undefined(level.perk_vulture.var_97d35872);
}

/*
	Name: function_c6789968
	Namespace: namespace_272c5387
	Checksum: 0x4E76D653
	Offset: 0x33E8
	Size: 0x88
	Parameters: 7
	Flags: None
	Line Number: 713
*/
function function_c6789968(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(newVal == 1)
	{
		self thread function_eed5662f(localClientNum);
		continue;
	}
	self thread function_69196a16(localClientNum);
}

/*
	Name: function_eed5662f
	Namespace: namespace_272c5387
	Checksum: 0x7962CE3A
	Offset: 0x3478
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 733
*/
function function_eed5662f(localClientNum)
{
	if(!isdefined(self.var_486588a0))
	{
		self.var_486588a0 = spawn(0, (0, 0, 0), "script_origin");
		self.var_486588a0.sndLoopID = self.var_486588a0 PlayLoopSound("zmb_vulture_stink_player_loop", 0.5);
	}
	playsound(localClientNum, "zmb_vulture_stink_player_start", (0, 0, 0));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_69196a16
	Namespace: namespace_272c5387
	Checksum: 0x18597B19
	Offset: 0x3520
	Size: 0x88
	Parameters: 1
	Flags: None
	Line Number: 755
*/
function function_69196a16(localClientNum)
{
	playsound(localClientNum, "zmb_vulture_stink_player_stop", (0, 0, 0));
	if(isdefined(self.var_486588a0))
	{
		self.var_486588a0 StopLoopSound(self.var_486588a0.sndLoopID);
		self.var_486588a0 delete();
		self.var_486588a0 = undefined;
	}
}

/*
	Name: function_c8dfea2f
	Namespace: namespace_272c5387
	Checksum: 0x6BED2FE8
	Offset: 0x35B0
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 776
*/
function function_c8dfea2f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		function_c7dc58f5("mystery_box", self);
		continue;
	}
	function_a33a6050("mystery_box", self);
}

/*
	Name: function_6e379de4
	Namespace: namespace_272c5387
	Checksum: 0x6C2DAEB9
	Offset: 0x3650
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 800
*/
function function_6e379de4(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		function_c7dc58f5("perk_random", self);
		continue;
	}
	function_a33a6050("perk_random", self);
}

/*
	Name: function_36639cf9
	Namespace: namespace_272c5387
	Checksum: 0x8FE6C434
	Offset: 0x36F0
	Size: 0x88
	Parameters: 7
	Flags: None
	Line Number: 824
*/
function function_36639cf9(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		level.perk_vulture.var_f65f69d3 = 1;
		continue;
	}
	level.perk_vulture.var_f65f69d3 = 0;
}

/*
	Name: function_2a229617
	Namespace: namespace_272c5387
	Checksum: 0xB162B6C3
	Offset: 0x3780
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 848
*/
function function_2a229617(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		function_c7dc58f5("bgb", self);
		continue;
	}
	function_a33a6050("bgb", self);
	return;
}

/*
	Name: function_6c139f68
	Namespace: namespace_272c5387
	Checksum: 0xA4BABE6
	Offset: 0x3820
	Size: 0x98
	Parameters: 7
	Flags: None
	Line Number: 873
*/
function function_6c139f68(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		function_c7dc58f5("pack_a_punch", self);
		continue;
	}
	function_a33a6050("pack_a_punch", self);
}

/*
	Name: function_331c03b3
	Namespace: namespace_272c5387
	Checksum: 0xD5AA58B4
	Offset: 0x38C0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 897
*/
function function_331c03b3()
{
	while(!level flag::exists("weapon_wallbuys_created"))
	{
		wait(0.016);
	}
	level flag::wait_till("weapon_wallbuys_created");
	Wallbuys = struct::get_array("vk_tra_wallbuy_location", "targetname");
	Array::thread_all(Wallbuys, &function_58cc4ad8);
}

/*
	Name: function_36177977
	Namespace: namespace_272c5387
	Checksum: 0xF2B73C3B
	Offset: 0x3970
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 918
*/
function function_36177977()
{
	Array::thread_all(struct::get_array("zm_pack_a_punch_vulture", "targetname"), &function_aa026665);
}

/*
	Name: function_58cc4ad8
	Namespace: namespace_272c5387
	Checksum: 0xF96224C8
	Offset: 0x39C0
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 933
*/
function function_58cc4ad8()
{
	if(self.targetname == "buildable_wallbuy")
	{
		function_c7dc58f5("wallbuys_dynamic", self);
		self waittill("hash_282bf8ee");
		function_a33a6050("wallbuys_dynamic", self);
	}
	function_c7dc58f5("wallbuys_static", self);
}

/*
	Name: function_aa026665
	Namespace: namespace_272c5387
	Checksum: 0x2DDBE999
	Offset: 0x3A40
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 954
*/
function function_aa026665()
{
	function_c7dc58f5("pack_a_punch", self);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5b18a1a
	Namespace: namespace_272c5387
	Checksum: 0x75EF76FE
	Offset: 0x3A68
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 971
*/
function function_5b18a1a(localClientNum)
{
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_wallbuy_static"], self.origin);
	return n_fx_id;
}

/*
	Name: function_fd197bfb
	Namespace: namespace_272c5387
	Checksum: 0x7D0C8DDC
	Offset: 0x3AC0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 987
*/
function function_fd197bfb(localClientNum)
{
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_wallbuy_dynamic"], self.origin);
	return n_fx_id;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9be22913
	Namespace: namespace_272c5387
	Checksum: 0xF190AB2C
	Offset: 0x3B18
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1004
*/
function function_9be22913(localClientNum)
{
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_mystery_box_glow"], self.origin, AnglesToRight(self.angles), AnglesToForward(self.angles));
	return n_fx_id;
}

/*
	Name: function_852ac413
	Namespace: namespace_272c5387
	Checksum: 0x661C9D1B
	Offset: 0x3BA0
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1020
*/
function function_852ac413(localClientNum)
{
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_machine_glow_pack_a_punch"], self.origin, AnglesToForward(self.angles), anglesToUp(self.angles));
	return n_fx_id;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_b6d754c1
	Namespace: namespace_272c5387
	Checksum: 0xC60D8935
	Offset: 0x3C28
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1038
*/
function function_b6d754c1(localClientNum)
{
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_machine_glow_bgb"], self.origin, AnglesToForward(self.angles), anglesToUp(self.angles));
	return n_fx_id;
}

/*
	Name: function_7a083d2d
	Namespace: namespace_272c5387
	Checksum: 0x1740AC7C
	Offset: 0x3CB0
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 1054
*/
function function_7a083d2d(localClientNum)
{
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_machine_glow_random"], self.origin, AnglesToForward(self.angles), anglesToUp(self.angles));
	return n_fx_id;
}

/*
	Name: function_ad8c2094
	Namespace: namespace_272c5387
	Checksum: 0x921ABCE0
	Offset: 0x3D38
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 1070
*/
function function_ad8c2094(localClientNum)
{
	str_perk = self.script_noteworthy;
	var_fbeb8b84 = level.perk_vulture.var_ccc03230[str_perk];
	n_fx_id = playFX(localClientNum, level._effect[var_fbeb8b84], self.origin, AnglesToForward(self.angles), anglesToUp(self.angles));
	return n_fx_id;
}

/*
	Name: function_61b179d1
	Namespace: namespace_272c5387
	Checksum: 0x9AF4C5F2
	Offset: 0x3DF0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 1088
*/
function function_61b179d1(localClientNum)
{
	str_perk = self.script_noteworthy;
	e_player = GetLocalPlayer(localClientNum);
	b_play_fx = 1;
	if(str_perk != "specialty_vultureaid" && e_player hasPerk(localClientNum, str_perk))
	{
		b_play_fx = 0;
	}
	return b_play_fx;
}

/*
	Name: function_1096728c
	Namespace: namespace_272c5387
	Checksum: 0x9FAAC49A
	Offset: 0x3E90
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 1110
*/
function function_1096728c(localClientNum)
{
	if(self.var_ff2cd300 == 2)
	{
		n_fx_id = playFX(localClientNum, level._effect["vulture_perk_powerup_drop_solo"], self.origin);
		return n_fx_id;
	}
	else if(self.var_ff2cd300 == 3)
	{
		n_fx_id = playFX(localClientNum, level._effect["vulture_perk_powerup_drop_caution"], self.origin);
		return n_fx_id;
	}
	else if(self.var_ff2cd300 == 4)
	{
		n_fx_id = playFX(localClientNum, level._effect["vulture_perk_powerup_drop_zombie"], self.origin);
		return n_fx_id;
		continue;
	}
	n_fx_id = playFX(localClientNum, level._effect["vulture_perk_powerup_drop"], self.origin);
	return n_fx_id;
}

/*
	Name: function_ca2ad97e
	Namespace: namespace_272c5387
	Checksum: 0xB83CF58F
	Offset: 0x3FD8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1142
*/
function function_ca2ad97e(localClientNum)
{
	n_fx_id = PlayFXOnTag(localClientNum, level._effect["vulture_perk_zombie_eye_glow"], self, "j_eyeball_le");
	return n_fx_id;
}

/*
	Name: function_a0cbee03
	Namespace: namespace_272c5387
	Checksum: 0x189BB785
	Offset: 0x4030
	Size: 0xA0
	Parameters: 1
	Flags: None
	Line Number: 1158
*/
function function_a0cbee03(var_2f506abd)
{
	struct = spawnstruct();
	struct.var_c57d1c7f = var_2f506abd;
	struct.origin = self.origin;
	function_c7dc58f5("powerups", struct);
	while(isdefined(self))
	{
		wait(0.016);
	}
	function_a33a6050("powerups", struct);
}

/*
	Name: function_fee68ae8
	Namespace: namespace_272c5387
	Checksum: 0xDA8BA238
	Offset: 0x40D8
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 1181
*/
function function_fee68ae8(str_perk, var_e918f1c9)
{
	if(!isdefined(level.perk_vulture.var_ccc03230))
	{
		level.perk_vulture.var_ccc03230 = [];
	}
	level.perk_vulture.var_ccc03230[str_perk] = var_e918f1c9;
}

/*
	Name: function_62efe26c
	Namespace: namespace_272c5387
	Checksum: 0x5C298AAA
	Offset: 0x4138
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1200
*/
function function_62efe26c()
{
	function_c7dc58f5("perks", self);
	if(self.script_noteworthy == "specialty_quickrevive")
	{
		while(!(isdefined(level.perk_vulture.var_f65f69d3) && level.perk_vulture.var_f65f69d3))
		{
			wait(0.016);
		}
		function_a33a6050("perks", self);
	}
}

/*
	Name: function_43041206
	Namespace: namespace_272c5387
	Checksum: 0x92A1A51F
	Offset: 0x41C0
	Size: 0xA8
	Parameters: 7
	Flags: None
	Line Number: 1223
*/
function function_43041206(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		function_c7dc58f5("zombie_eyes", self);
		while(isdefined(self))
		{
			wait(0.016);
		}
		function_a33a6050("zombie_eyes", self);
	}
}

/*
	Name: function_e283d203
	Namespace: namespace_272c5387
	Checksum: 0xD49347DF
	Offset: 0x4270
	Size: 0x378
	Parameters: 7
	Flags: None
	Line Number: 1250
*/
function function_e283d203(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasDemoJump)
{
	if(localClientNum != 0)
	{
		return;
	}
	if(newVal == 1)
	{
		self.var_ff2cd300 = 1;
		function_c7dc58f5("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 1);
		while(isdefined(self))
		{
			wait(0.016);
		}
		function_a33a6050("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 0);
	}
	else if(newVal == 2)
	{
		self.var_ff2cd300 = 2;
		self duplicate_render::set_dr_flag("keyline_active", 1);
		function_c7dc58f5("powerups", self);
		while(isdefined(self))
		{
			wait(0.016);
		}
		function_a33a6050("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 0);
	}
	else if(newVal == 3)
	{
		self.var_ff2cd300 = 3;
		function_c7dc58f5("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 1);
		while(isdefined(self))
		{
			wait(0.016);
		}
		function_a33a6050("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 0);
	}
	else if(newVal == 4)
	{
		self.var_ff2cd300 = 4;
		function_c7dc58f5("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 1);
		while(isdefined(self))
		{
			wait(0.016);
		}
		function_a33a6050("powerups", self);
		self duplicate_render::set_dr_flag("keyline_active", 0);
		continue;
	}
	function_c7dc58f5("powerups", self);
	self duplicate_render::set_dr_flag("keyline_active", 1);
	while(isdefined(self))
	{
		wait(0.016);
	}
	function_a33a6050("powerups", self);
	self duplicate_render::set_dr_flag("keyline_active", 0);
}

/*
	Name: function_75aa16e4
	Namespace: namespace_272c5387
	Checksum: 0x7F1D098F
	Offset: 0x45F0
	Size: 0xFC
	Parameters: 3
	Flags: None
	Line Number: 1325
*/
function function_75aa16e4(localClientNum, newState, oldState)
{
	if(IsSpectating(localClientNum))
	{
		return;
	}
	var_21aa4d87 = StrTok(newState, "|");
	var_f8ccfd22 = StrTok(oldState, "|");
	model = CreateUIModel(GetUIModelForController(localClientNum), "hudItems.perks." + var_21aa4d87[0] + ".overlayStyle");
	SetUIModelValue(model, var_21aa4d87[1]);
}

