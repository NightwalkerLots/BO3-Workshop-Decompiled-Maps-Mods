#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_placeable_mine;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\zmsavedata;

#namespace namespace_e227a608;

/*
	Name: __init__sytem__
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0xD00
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 30
*/
function autoexec __init__sytem__()
{
	system::register("_zm_emote_menu", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0xD40
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 45
*/
function __init__()
{
	callback::on_spawned(&function_32657d8);
}

/*
	Name: function_6ed43ebb
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x880
	Parameters: 0
	Flags: None
	Line Number: 60
*/
function function_6ed43ebb()
{
	function_d80544cf("Yogging", %emote_boast_yogging);
	function_d80544cf("Laugh", %emote_boast_laugh);
	function_d80544cf("Gun_Show", %emote_boast_gun_show);
	function_d80544cf("Dip_Low", %emote_boast_dip_low);
	function_d80544cf("Clucked_Up", %emote_boast_clucked_up);
	function_d80544cf("Zombie_Eat_Brain", %emote_boast_zombie_eats_brain);
	function_d80544cf("so_fresh", %emote_boast_so_fresh);
	function_d80544cf("poplock", %emote_boast_poplock);
	function_d80544cf("Bow", %emote_goodgame_bow);
	function_d80544cf("Bunny_Hop", %emote_goodgame_bunny_hop);
	function_d80544cf("Jump_For_Joy", %emote_goodgame_jump_for_joy);
	function_d80544cf("Nun_Chokes", %emote_goodgame_nunchokes);
	function_d80544cf("Your_So_Meme", %emote_goodgame_your_so_meme);
	function_d80544cf("but_that_flip_though", %emote_goodgame_but_that_flip_though);
	function_d80544cf("clapping", %emote_goodgame_clapping);
	function_d80544cf("high_five_for_one", %emote_goodgame_high_five_for_one);
	function_d80544cf("Grave_Digger", %emote_threat_grave_digger);
	function_d80544cf("Heart_Attack", %emote_threat_heart_attack);
	function_d80544cf("King_Of_The_Castle", %emote_threat_king_of_the_castle);
	function_d80544cf("Motivational", %emote_threat_motivational);
	function_d80544cf("Shadow_Boxing", %emote_threat_shadow_boxing);
	function_d80544cf("Throat_Slot", %emote_threat_throat_slit);
	function_d80544cf("sweep_this", %emote_threat_sweep_this);
	function_d80544cf("meanstreak", %emote_threat_meanstreak);
	function_d80544cf("Dance_Shoes", %emote_dance_shoes, 1, &function_c106358e);
	function_d80544cf("War_Mooshine", %emote_war_mooshine, 1, &function_12f3b6f7);
	function_d80544cf("Firebreakin", %emote_firebreakin, 1, &function_9c653031);
	function_d80544cf("Wild_Style", %emote_wild_style, 1, &function_9c653031);
	function_d80544cf("Barn_Burner", %emote_barn_burner, 1, &function_ea5fdb45);
	function_d80544cf("jamn_on_the_one", %emote_bo4_jamn_on_the_one, 1, &function_9c653031);
	function_d80544cf("Winner_Winner", %emote_bo4_winner_winner, 1, &function_95836267);
	function_d80544cf("i_can_fly", %emote_bo4_i_can_fly, 1);
	function_d80544cf("poppin_grapes", %emote_bo4_poppin_grapes);
	function_d80544cf("Sammy_Bear", %emote_bo4_sammy_bear, 0, &function_845746c9);
	function_d80544cf("pony_up", %emote_bo4_pony_up, 1, &function_66886cab);
	function_d80544cf("kiss_the_chef", %emote_bo4_kiss_the_chef, 1, &function_e6fb76ee);
	function_d80544cf("lord_of_death", %emote_bo4_lord_of_death, 1, &function_6c55adb3);
	function_d80544cf("speed_demon", %emote_bo4_speed_demon, 1, &function_2c8d2c1a);
	function_d80544cf("shooting_blanks", %emote_shooting_blanks, 0, &function_984f3f94);
	function_d80544cf("icu", %emote_bo4_icu, 0, &function_231f9fe6);
	function_d80544cf("cod_fishing", %emote_bo4_cod_fishing, 1, &function_2184a182);
	function_d80544cf("hop_to_it", %emote_bo4_hop_to_it, 0, &function_3cadc2f6);
	function_d80544cf("snow_joy", %emote_bo4_snow_joy, 0, &function_94fd9c13);
	function_d80544cf("barney", %emote_bo4_barney, 1, &function_2904a154);
	function_d80544cf("summer_delight", %emote_bo4_summer_delight, 0, &function_a495d064);
	function_d80544cf("cardboard_camo", %emote_bo4_cardboard_camo, 1, &function_8c646df8);
}

/*
	Name: function_32657d8
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x15F8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 120
*/
function function_32657d8()
{
	self thread function_d65b3f36();
	return;
}

/*
	Name: function_d65b3f36
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1620
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 136
*/
function function_d65b3f36()
{
	self endon("disconnect");
	self notify("hash_67188db");
	self endon("hash_67188db");
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("emotes_enable") == 0)
	{
		return;
	}
	if(!isdefined(level.var_d65b3f36))
	{
		function_6ed43ebb();
	}
	self.var_94359cb5 = 0;
	self util::setClientSysState("setHudHintstring", "ReapModEmote|1");
	while(1)
	{
		if(self ActionSlotFourButtonPressed() && (!(isdefined(self.var_2369630e) && self.var_2369630e)))
		{
			while(self ActionSlotFourButtonPressed())
			{
				wait(0.05);
			}
			if(!self.var_94359cb5)
			{
				if(isdefined(self.var_4a0eea77))
				{
					self CloseMenu(self.var_4a0eea77);
					self.var_4a0eea77 = undefined;
				}
				self.var_94359cb5 = 1;
				self thread function_230c4e3();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_230c4e3
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x17B8
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 186
*/
function function_230c4e3()
{
	self endon("disconnect");
	self endon("hash_a9c582b6");
	if(isdefined(self.var_4a0eea77))
	{
		self CloseMenu(self.var_4a0eea77);
	}
	self.var_4a0eea77 = "Emote_Menu";
	self openMenu(self.var_4a0eea77);
	while(isdefined(self.var_4a0eea77))
	{
		self waittill("menuresponse", str_menu, var_4f5189a8);
		if(str_menu == "Emote_Menu")
		{
			if(var_4f5189a8 == "Menu_Quit" || var_4f5189a8 == "blacktransparent")
			{
				if(isdefined(self.var_4a0eea77))
				{
					self CloseMenu(self.var_4a0eea77);
					self.var_4a0eea77 = undefined;
				}
				self.var_94359cb5 = 0;
			}
			else if(var_4f5189a8 != "")
			{
				self thread function_c6969b3f(function_a2a247a(var_4f5189a8));
			}
			self.var_94359cb5 = 0;
			if(isdefined(self.var_4a0eea77))
			{
				self CloseMenu(self.var_4a0eea77);
				self.var_4a0eea77 = undefined;
			}
		}
	}
	return;
	waittillframeend;
}

/*
	Name: function_d80544cf
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1958
	Size: 0xE0
	Parameters: 4
	Flags: None
	Line Number: 236
*/
function function_d80544cf(name, anim_name, looping, func)
{
	if(!isdefined(level.var_d65b3f36))
	{
		level.var_d65b3f36 = [];
	}
	if(!isdefined(looping))
	{
		looping = 0;
	}
	var_a7f182ef = spawnstruct();
	var_a7f182ef.name = name;
	var_a7f182ef.looping = looping;
	var_a7f182ef.anim_name = anim_name;
	if(isdefined(func))
	{
		var_a7f182ef.func = func;
	}
	level.var_d65b3f36[level.var_d65b3f36.size] = var_a7f182ef;
}

/*
	Name: function_a2a247a
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1A40
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 267
*/
function function_a2a247a(name)
{
	for(i = 0; i < level.var_d65b3f36.size; i++)
	{
		if(level.var_d65b3f36[i].name == name)
		{
			return level.var_d65b3f36[i].anim_name;
		}
	}
	return 0;
}

/*
	Name: function_c6969b3f
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1AC0
	Size: 0x418
	Parameters: 1
	Flags: None
	Line Number: 289
*/
function function_c6969b3f(var_a7f182ef)
{
	self endon("disconnect");
	if(!isdefined(var_a7f182ef) || (isdefined(var_a7f182ef) && var_a7f182ef == 0))
	{
		return;
	}
	self.var_2369630e = 1;
	self notify("hash_1c1d7a08");
	self SetClientThirdPerson(1);
	model = spawn("script_model", self.origin);
	model.angles = self.angles;
	self SetPlayerAngles(self.angles + VectorScale((0, 1, 0), 180));
	model.IsActor = 0;
	model SetModel(self GetCharacterBodyModel());
	Headmodel = self GetCharacterHeadModel();
	if(isdefined(Headmodel))
	{
		model Attach(Headmodel);
	}
	helmetModel = self GetCharacterHelmetModel();
	if(isdefined(helmetModel))
	{
		model Attach(helmetModel);
	}
	model useanimtree(-1);
	self thread function_8d70b609(self.origin);
	self Hide();
	if(isdefined(function_26e7336f(var_a7f182ef)))
	{
		self thread [[function_26e7336f(var_a7f182ef)]](model);
	}
	if(!function_39d606d6(var_a7f182ef))
	{
		self thread function_1c9495cd(var_a7f182ef);
	}
	model AnimScripted("optionalNotify", model.origin, model.angles, var_a7f182ef);
	self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "emote_end", "disconnect");
	self show();
	if(isdefined(model.var_9bd6687a))
	{
		for(i = 0; i < model.var_9bd6687a.size; i++)
		{
			model.var_9bd6687a[i] delete();
		}
	}
	self SetPlayerAngles(model.angles);
	model delete();
	self SetClientThirdPerson(0);
	self.var_2369630e = undefined;
	if(isdefined(self.var_230c4e3))
	{
		self.var_230c4e3 = [];
	}
	self function_17893c41();
	self AllowMelee(1);
	return;
}

/*
	Name: function_39d606d6
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1EE0
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 358
*/
function function_39d606d6(var_a7f182ef)
{
	for(i = 0; i < level.var_d65b3f36.size; i++)
	{
		if(level.var_d65b3f36[i].anim_name == var_a7f182ef)
		{
			return level.var_d65b3f36[i].looping;
		}
	}
	return 0;
}

/*
	Name: function_26e7336f
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1F60
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 380
*/
function function_26e7336f(var_a7f182ef)
{
	for(i = 0; i < level.var_d65b3f36.size; i++)
	{
		if(level.var_d65b3f36[i].anim_name == var_a7f182ef)
		{
			return level.var_d65b3f36[i].func;
		}
	}
	return undefined;
}

/*
	Name: function_1c9495cd
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x1FE0
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 402
*/
function function_1c9495cd(var_a7f182ef)
{
	self endon("hash_f4ea4ea1");
	time = getanimlength(var_a7f182ef);
	wait(time);
	self notify("hash_f4ea4ea1");
}

/*
	Name: function_8d70b609
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2038
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 420
*/
function function_8d70b609(or)
{
	self endon("hash_f4ea4ea1");
	while(1)
	{
		if(DistanceSquared(or, self.origin) > 1)
		{
			self notify("hash_f4ea4ea1");
		}
		wait(0.1);
	}
}

/*
	Name: music_loop
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x20A0
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 443
*/
function music_loop(model, var_c799ffdb)
{
	var_83a88036 = spawn("script_origin", model.origin + VectorScale((0, 0, 1), 40));
	var_83a88036 PlayLoopSound(var_c799ffdb);
	self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "emote_end", "disconnect");
	var_83a88036 delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c106358e
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 463
*/
function function_c106358e(model)
{
	self thread music_loop(model, "emote_mus_dance_shoes");
}

/*
	Name: function_12f3b6f7
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x21B8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 478
*/
function function_12f3b6f7(model)
{
	self thread music_loop(model, "emote_mus_115");
	return;
}

/*
	Name: function_ea5fdb45
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x21F0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 494
*/
function function_ea5fdb45(model)
{
	self thread music_loop(model, "emote_mus_buried");
}

/*
	Name: function_9c653031
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2228
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 509
*/
function function_9c653031(model)
{
	self thread music_loop(model, "emote_mus_buried");
}

/*
	Name: function_95836267
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2260
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 524
*/
function function_95836267(model)
{
	self thread music_loop(model, "emote_winner_winner");
}

/*
	Name: function_845746c9
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2298
	Size: 0x100
	Parameters: 1
	Flags: None
	Line Number: 539
*/
function function_845746c9(model)
{
	model.var_9bd6687a = [];
	var_b50b402a = "tag_weapon_right";
	bear = spawn("script_model", model GetTagOrigin(var_b50b402a));
	bear SetModel("p7_zm_teddybear");
	bear.angles = model GetTagAngles(var_b50b402a);
	bear LinkTo(model, var_b50b402a, (0, 0, 0), (0, 0, 0));
	model.var_9bd6687a[model.var_9bd6687a.size] = bear;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_66886cab
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x23A0
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 562
*/
function function_66886cab(model)
{
	model.var_9bd6687a = [];
	orig = model.origin;
	orig = orig + VectorScale(AnglesToForward((0, model.angles[1] + 90, 0)), 2);
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_pony_up");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_pony_up);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e6fb76ee
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2510
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 587
*/
function function_e6fb76ee(model)
{
	self thread music_loop(model, "emote_kiss_the_cook");
	model.var_9bd6687a = [];
	orig = model.origin;
	orig = orig + VectorScale(AnglesToForward((0, model.angles[1] + 90, 0)), 2.5);
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_kiss_the_chef");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_kiss_the_chef);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
	return;
	continue;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6c55adb3
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x26A0
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 614
*/
function function_6c55adb3(model)
{
	model.var_9bd6687a = [];
	orig = model.origin + VectorScale(AnglesToForward((0, model.angles[1], 0)), -8.5) - VectorScale((0, 0, 1), 3);
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_lord_of_death");
	var_b4a19269.angles = model.angles;
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
}

/*
	Name: function_2c8d2c1a
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x27B0
	Size: 0x110
	Parameters: 1
	Flags: None
	Line Number: 634
*/
function function_2c8d2c1a(model)
{
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", model.origin);
	var_b4a19269 SetModel("emote_model_speed_demon");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_speed_demon);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
}

/*
	Name: function_984f3f94
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x28C8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 655
*/
function function_984f3f94(model)
{
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", model GetTagOrigin("tag_weapon_right"));
	var_b4a19269 SetModel("emote_model_shooting_blanks");
	var_b4a19269.angles = model GetTagAngles("tag_weapon_right");
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_shooting_blanks);
	var_b4a19269 LinkTo(model, "tag_weapon_right", VectorScale((0, 0, 1), 7.111), (0, 0, 0));
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
}

/*
	Name: function_231f9fe6
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2A30
	Size: 0x200
	Parameters: 1
	Flags: None
	Line Number: 677
*/
function function_231f9fe6(model)
{
	model PlayLoopSound("emote_icu");
	model.var_9bd6687a = [];
	var_6ef4b7ea = "tag_weapon_left";
	var_cad355c3 = "tag_weapon_right";
	var_c41f8ebf = spawn("script_model", model GetTagOrigin(var_6ef4b7ea));
	var_c41f8ebf SetModel("emote_model_icu_bush");
	var_c41f8ebf.angles = model GetTagAngles(var_6ef4b7ea);
	var_c41f8ebf LinkTo(model, var_6ef4b7ea, (0, 0, 0), (0, 0, 0));
	binoc = spawn("script_model", model GetTagOrigin(var_cad355c3));
	binoc SetModel("emote_model_icu_binoc");
	binoc.angles = model GetTagAngles(var_cad355c3);
	binoc LinkTo(model, var_cad355c3, (0, 0, 0), (0, 0, 0));
	model.var_9bd6687a[model.var_9bd6687a.size] = var_c41f8ebf;
	model.var_9bd6687a[model.var_9bd6687a.size] = binoc;
}

/*
	Name: function_2184a182
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2C38
	Size: 0x300
	Parameters: 1
	Flags: None
	Line Number: 705
*/
function function_2184a182(model)
{
	self thread music_loop(model, "emote_cod_fishing");
	model.var_9bd6687a = [];
	var_442b82c5 = "tag_weapon_right";
	rod = spawn("script_model", model GetTagOrigin(var_442b82c5));
	rod SetModel("emote_model_cod_fishing");
	rod.angles = model GetTagAngles(var_442b82c5);
	rod.mover = spawn("script_model", rod GetTagOrigin("tag_handle_grab_animate"));
	rod.mover SetModel("tag_origin");
	rod.mover.angles = model GetTagAngles(var_442b82c5);
	rod EnableLinkTo();
	rod LinkTo(rod.mover, "tag_origin");
	orig = model GetTagOrigin(var_442b82c5);
	orig = orig + VectorScale(AnglesToForward((0, model.angles[1] + 90, 0)), -3.8);
	rod.mover.origin = orig;
	rod.mover LinkTo(model, var_442b82c5, (0, 0, 0), (0, 0, 0));
	rod useanimtree(-1);
	rod AnimScripted("optionalNotify", rod.origin, rod.angles, %model_emote_cod_fishing);
	model.var_9bd6687a[model.var_9bd6687a.size] = rod.mover;
	model.var_9bd6687a[model.var_9bd6687a.size] = rod;
	return;
}

/*
	Name: function_3cadc2f6
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x2F40
	Size: 0x120
	Parameters: 1
	Flags: None
	Line Number: 739
*/
function function_3cadc2f6(model)
{
	orig = model.origin;
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_pogo_stick");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_hop_to_it);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
}

/*
	Name: function_94fd9c13
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x3068
	Size: 0x140
	Parameters: 1
	Flags: None
	Line Number: 761
*/
function function_94fd9c13(model)
{
	orig = model.origin;
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_snow_joy");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_snow_joy);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
	self thread music_loop(model, "emote_christmas_loop");
}

/*
	Name: function_2904a154
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x31B0
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 784
*/
function function_2904a154(model)
{
	orig = model.origin;
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_surfboard");
	var_b4a19269.angles = model.angles - (90, 0, 180);
	wait(0.05);
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_barney);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
	self thread music_loop(model, "emote_mus_surfer");
}

/*
	Name: function_a495d064
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x3310
	Size: 0x188
	Parameters: 1
	Flags: None
	Line Number: 808
*/
function function_a495d064(model)
{
	orig = model.origin + VectorScale(AnglesToForward((0, model.angles[1], 0)), -4) - VectorScale((0, 0, 1), 3);
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_summer_delight");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_summer_delight);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
	self thread music_loop(model, "emote_summer_delight");
}

/*
	Name: function_8c646df8
	Namespace: namespace_e227a608
	Checksum: 0x424F4353
	Offset: 0x34A0
	Size: 0x11A
	Parameters: 1
	Flags: None
	Line Number: 831
*/
function function_8c646df8(model)
{
	orig = model.origin;
	model.var_9bd6687a = [];
	var_b4a19269 = spawn("script_model", orig);
	var_b4a19269 SetModel("emote_model_cardboard_camo");
	var_b4a19269.angles = model.angles;
	var_b4a19269 useanimtree(-1);
	var_b4a19269 AnimScripted("optionalNotify", var_b4a19269.origin, var_b4a19269.angles, %model_emote_cardboard_camo);
	model.var_9bd6687a[model.var_9bd6687a.size] = var_b4a19269;
}

