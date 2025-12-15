#include scripts\codescripts\struct;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai_shared;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\fx_shared;
#include scripts\shared\math_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_util;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weap_elemental_bow;
#include scripts\zm\_zm_weapons;

#namespace namespace_efd1ef23;

/*
	Name: __init__sytem__
	Namespace: namespace_efd1ef23
	Checksum: 0x975EDD6E
	Offset: 0x5A0
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 35
*/
function autoexec __init__sytem__()
{
	system::register("_zm_weap_elemental_bow_demongate", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_efd1ef23
	Checksum: 0xFB0A096F
	Offset: 0x5E8
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 50
*/
function __init__()
{
	level.var_edf1e590 = GetWeapon("elemental_bow_demongate");
	level.var_e106fba5 = GetWeapon("elemental_bow_demongate4");
	level.var_ecd0c077 = [];
	clientfield::register("toplayer", "elemental_bow_demongate" + "_ambient_bow_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_demongate" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("missile", "elemental_bow_demongate4" + "_arrow_impact_fx", 1, 1, "int");
	clientfield::register("scriptmover", "demongate_portal_fx", 1, 1, "int");
	clientfield::register("toplayer", "demongate_portal_rumble", 1, 1, "int");
	clientfield::register("scriptmover", "demongate_wander_locomotion_anim", 1, 1, "int");
	clientfield::register("scriptmover", "demongate_attack_locomotion_anim", 1, 1, "int");
	clientfield::register("scriptmover", "demongate_chomper_fx", 1, 1, "int");
	clientfield::register("scriptmover", "demongate_chomper_bite_fx", 1, 1, "counter");
}

/*
	Name: __main__
	Namespace: namespace_efd1ef23
	Checksum: 0x88B90143
	Offset: 0x810
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 76
*/
function __main__()
{
	callback::on_connect(&function_7ce75255);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7ce75255
	Namespace: namespace_efd1ef23
	Checksum: 0xE9183B6
	Offset: 0x840
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 93
*/
function function_7ce75255()
{
	self thread zm_weap_elemental_bow::function_59d385a8("elemental_bow_demongate");
	self thread zm_weap_elemental_bow::function_1160e0e9("elemental_bow_demongate", "elemental_bow_demongate4");
	self thread zm_weap_elemental_bow::function_a991479f("elemental_bow_demongate", "elemental_bow_demongate4", &function_8bccb85b);
}

/*
	Name: function_8bccb85b
	Namespace: namespace_efd1ef23
	Checksum: 0x7CD4F9A7
	Offset: 0x8C8
	Size: 0xC0
	Parameters: 5
	Flags: None
	Line Number: 110
*/
function function_8bccb85b(weapon, position, radius, attacker, normal)
{
	if(weapon.name == "elemental_bow_demongate4")
	{
		self thread function_1847435e(weapon, position, attacker, normal);
		continue;
	}
	attacker clientfield::set("elemental_bow_demongate" + "_arrow_impact_fx", 1);
	self thread function_227ad41a(position, attacker);
}

/*
	Name: function_75a5fec3
	Namespace: namespace_efd1ef23
	Checksum: 0xE43A1803
	Offset: 0x990
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 131
*/
function function_75a5fec3(v_pos, var_7397b986)
{
	if(Abs(var_7397b986[2]) < 0.2)
	{
		v_pos = v_pos + var_7397b986 * 16;
		a_trace = bullettrace(v_pos, v_pos + VectorScale((0, 0, 1), 64), 0, undefined);
		if(a_trace["fraction"] < 1)
		{
			v_pos = a_trace["position"] - VectorScale((0, 0, 1), 64);
		}
		a_trace = bullettrace(v_pos, v_pos - VectorScale((0, 0, 1), 64), 0, undefined);
		if(a_trace["fraction"] < 1)
		{
			v_pos = a_trace["position"] + VectorScale((0, 0, 1), 64);
			continue;
		}
	}
	n_z_offset = var_7397b986[2] * 64;
	v_pos = v_pos + (0, 0, n_z_offset);
	return v_pos;
}

/*
	Name: function_1847435e
	Namespace: namespace_efd1ef23
	Checksum: 0x92565C55
	Offset: 0xB08
	Size: 0x3A8
	Parameters: 4
	Flags: None
	Line Number: 163
*/
function function_1847435e(weapon, position, attacker, normal)
{
	position = function_75a5fec3(position, normal);
	var_884470ed = VectorToAngles(normal);
	var_884470ed = var_884470ed + VectorScale((0, 1, 0), 90);
	var_884470ed = var_884470ed * (0, 1, 0);
	var_81bfdbf3 = util::spawn_model("tag_origin", position, var_884470ed);
	var_81bfdbf3 clientfield::set("demongate_portal_fx", 1);
	var_81bfdbf3.var_bdda116d = 1;
	radiusdamage(position, 96, level.zombie_health, level.zombie_health, self, "MOD_UNKNOWN", level.var_e106fba5);
	wait(0.25);
	var_81bfdbf3 thread function_f61730c3();
	if(GetDvarInt("splitscreen_playerCount") > 2)
	{
		var_53af9794 = 4 * level.zombie_health;
		continue;
	}
	var_53af9794 = 2 * level.zombie_health;
	if(level.var_ecd0c077.size > 12)
	{
		var_6606b613 = 2;
		continue;
	}
	var_6606b613 = Int(zombie_utility::get_current_zombie_count() + level.zombie_total * level.zombie_health / var_53af9794);
	if(GetDvarInt("splitscreen_playerCount") > 2)
	{
		var_6606b613 = math::clamp(var_6606b613, 4, 4);
		continue;
	}
	var_6606b613 = math::clamp(var_6606b613, 4, 6);
	n_spawn_delay = 0;
	for(i = 0; i < var_6606b613; i++)
	{
		var_4a243bdd = function_dd85b189(position, var_884470ed - VectorScale((0, 1, 0), 90));
		var_4a243bdd thread function_e3c73405(self, position);
		n_wait_time = 0.1;
		n_spawn_delay = n_spawn_delay + n_wait_time;
		wait(n_wait_time);
	}
	if(n_spawn_delay < 2)
	{
		wait(2 - n_spawn_delay);
	}
	wait(2.5);
	var_81bfdbf3 clientfield::set("demongate_portal_fx", 0);
	wait(2);
	var_81bfdbf3 notify("hash_d6e52217");
	var_81bfdbf3.var_bdda116d = 0;
	wait(1.6);
	var_81bfdbf3 delete();
}

/*
	Name: function_f61730c3
	Namespace: namespace_efd1ef23
	Checksum: 0xFD907247
	Offset: 0xEB8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 225
*/
function function_f61730c3()
{
	self endon("hash_d6e52217");
	while(1)
	{
		foreach(e_player in level.activePlayers)
		{
			if(isdefined(e_player) && (!(isdefined(e_player.var_8621b2c2) && e_player.var_8621b2c2)))
			{
				if(DistanceSquared(e_player.origin, self.origin) < 9216)
				{
					e_player thread function_2bd23428(self);
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_2bd23428
	Namespace: namespace_efd1ef23
	Checksum: 0x6D66DE47
	Offset: 0xFD0
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 254
*/
function function_2bd23428(var_81bfdbf3)
{
	self endon("disconnect");
	self endon("bled_out");
	self.var_8621b2c2 = 1;
	self clientfield::set_to_player("demongate_portal_rumble", 1);
	while(DistanceSquared(self.origin, var_81bfdbf3.origin) < 9216 && (isdefined(var_81bfdbf3.var_bdda116d) && var_81bfdbf3.var_bdda116d))
	{
		wait(0.05);
	}
	self.var_8621b2c2 = 0;
	self clientfield::set_to_player("demongate_portal_rumble", 0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_227ad41a
	Namespace: namespace_efd1ef23
	Checksum: 0xE6DB9419
	Offset: 0x10C0
	Size: 0x98
	Parameters: 2
	Flags: None
	Line Number: 280
*/
function function_227ad41a(position, attacker)
{
	v_angles = AnglesToForward(attacker.angles) * -1;
	var_4a243bdd = function_dd85b189(position, v_angles);
	wait(0.1);
	var_4a243bdd thread function_51585d77(self);
}

/*
	Name: function_dd85b189
	Namespace: namespace_efd1ef23
	Checksum: 0x93EA702D
	Offset: 0x1160
	Size: 0x2C8
	Parameters: 2
	Flags: None
	Line Number: 298
*/
function function_dd85b189(position, v_angles)
{
	var_4a243bdd = util::spawn_model("c_zom_chomper", position, v_angles);
	var_4a243bdd clientfield::set("demongate_chomper_fx", 1);
	var_4a243bdd flag::init("chomper_attacking");
	var_4a243bdd flag::init("demongate_chomper_despawning");
	if(GetDvarInt("splitscreen_playerCount") > 2)
	{
		var_53af9794 = 4 * level.zombie_health;
		continue;
	}
	var_53af9794 = 2 * level.zombie_health;
	var_4a243bdd.var_43f9ca95 = var_53af9794;
	var_4a243bdd.var_6a0b9707 = 1;
	var_4a243bdd thread function_1e8a74bc();
	var_8cc0f460 = 0;
	var_e5581fb8 = level.var_ecd0c077.size - 12;
	if(var_e5581fb8 > 0)
	{
		foreach(var_84ac0222 in level.var_ecd0c077)
		{
			if(!var_84ac0222 flag::get("chomper_attacking") && (!(isdefined(var_84ac0222.var_879ad742) && var_84ac0222.var_879ad742)))
			{
				var_84ac0222.n_timer = 3;
				var_8cc0f460++;
				if(var_8cc0f460 > var_e5581fb8)
				{
					break;
				}
			}
		}
	}
	else if(!isdefined(level.var_ecd0c077))
	{
		level.var_ecd0c077 = [];
	}
	else if(!IsArray(level.var_ecd0c077))
	{
		level.var_ecd0c077 = Array(level.var_ecd0c077);
	}
	level.var_ecd0c077[level.var_ecd0c077.size] = var_4a243bdd;
	return var_4a243bdd;
}

/*
	Name: function_8a58754e
	Namespace: namespace_efd1ef23
	Checksum: 0x9E8F7B46
	Offset: 0x1430
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 352
*/
function function_8a58754e()
{
	self flag::set("demongate_chomper_despawning");
	if(!(isdefined(self.var_35bb2047) && self.var_35bb2047))
	{
		self.var_35bb2047 = 1;
		if(!isdefined(level.var_d75011ba))
		{
			level.var_d75011ba = GetTime();
		}
		else if(level.var_d75011ba == GetTime())
		{
			wait(RandomFloatRange(0.1, 0.2));
		}
		level.var_d75011ba = GetTime();
		self moveto(self.origin + VectorScale((0, 0, 1), 96), 1.4);
		self RotatePitch(-90, 0.4);
		wait(1.4);
		self moveto(self.origin, 0.1);
		self clientfield::set("demongate_chomper_fx", 0);
		wait(3);
		self notify("hash_16664ab4");
		level.var_ecd0c077 = Array::exclude(level.var_ecd0c077, self);
		self delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_1e8a74bc
	Namespace: namespace_efd1ef23
	Checksum: 0x3539D853
	Offset: 0x15D0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 392
*/
function function_1e8a74bc()
{
	self endon("hash_72391651");
	self.n_timer = 0;
	while(self.n_timer < 3)
	{
		if(!self flag::get("chomper_attacking") && (!(isdefined(self.var_879ad742) && self.var_879ad742)))
		{
			self.n_timer = self.n_timer + 0.05;
		}
		wait(0.05);
	}
	while(self flag::get("chomper_attacking"))
	{
		wait(0.1);
	}
	self thread function_8a58754e();
	return;
}

/*
	Name: function_e3c73405
	Namespace: namespace_efd1ef23
	Checksum: 0xC9C5570F
	Offset: 0x16A8
	Size: 0x180
	Parameters: 2
	Flags: None
	Line Number: 422
*/
function function_e3c73405(e_player, var_862ba818)
{
	self.var_879ad742 = 1;
	self.origin = self.origin + (0, 0, randomIntRange(Int(-51.2), Int(51.2)));
	self.angles = (self.angles[0] + randomIntRange(-30, 30), self.angles[1] + randomIntRange(-45, 45), self.angles[2]);
	var_ac82e424 = self.origin + AnglesToForward(self.angles) * 96;
	self.angles = (0, self.angles[1], 0);
	self moveto(var_ac82e424, 0.4);
	wait(0.4);
	self.var_879ad742 = 0;
	self function_51585d77(e_player);
}

/*
	Name: function_51585d77
	Namespace: namespace_efd1ef23
	Checksum: 0x7FEA01DB
	Offset: 0x1830
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 445
*/
function function_51585d77(e_player)
{
	self function_8e354e9(e_player);
	if(isdefined(self.var_4288770f))
	{
		self function_4a3857ec(e_player);
		continue;
	}
	self thread function_b9f890e8(e_player);
}

/*
	Name: function_b9f890e8
	Namespace: namespace_efd1ef23
	Checksum: 0x9E7B1183
	Offset: 0x18A8
	Size: 0x4D0
	Parameters: 1
	Flags: None
	Line Number: 466
*/
function function_b9f890e8(e_player)
{
	self endon("hash_72391651");
	self endon("death");
	if(!isdefined(self))
	{
		return;
	}
	if(self flag::get("demongate_chomper_despawning"))
	{
		return;
	}
	self flag::clear("chomper_attacking");
	self clientfield::set("demongate_wander_locomotion_anim", 1);
	var_944febfe = RandomFloatRange(5, 15);
	var_ba526667 = RandomFloatRange(15, 45);
	var_484af72c = RandomFloatRange(15, 45);
	if(RandomInt(100) < 50)
	{
		continue;
	}
	var_944febfe = var_944febfe * -1;
	if(RandomInt(100) < 50)
	{
		continue;
	}
	var_ba526667 = var_ba526667 * -1;
	if(RandomInt(100) < 50)
	{
		continue;
	}
	var_484af72c = var_484af72c * -1;
	if(zm_utility::is_player_valid(e_player))
	{
		var_2c0ee386 = e_player.angles;
		v_target_pos = e_player GetEye();
		continue;
	}
	var_2c0ee386 = self.angles;
	v_target_pos = self.origin;
	v_pos = (var_2c0ee386[0] + var_944febfe, var_2c0ee386[1] + var_ba526667, var_2c0ee386[2] + var_484af72c);
	var_7397b986 = VectorNormalize(AnglesToForward(v_pos));
	a_trace = PhysicsTraceEx(v_target_pos, v_target_pos + var_7397b986 * 512, VectorScale((-1, -1, -1), 16), VectorScale((1, 1, 1), 16));
	var_ac82e424 = a_trace["position"] + var_7397b986 * -32;
	n_dist = Distance(self.origin, var_ac82e424);
	n_time = n_dist / 48;
	var_d1979001 = var_ac82e424 - self.origin;
	var_d1979001 = (0, var_d1979001[1], 0);
	if(!isdefined(level.var_d75011ba))
	{
		level.var_d75011ba = GetTime();
	}
	else if(level.var_d75011ba == GetTime())
	{
		wait(RandomFloatRange(0.1, 0.2));
	}
	level.var_d75011ba = GetTime();
	self moveto(var_ac82e424, n_time);
	self RotateTo(VectorToAngles(var_d1979001), n_time * 0.5);
	self thread function_dfbf651a(e_player);
	self util::waittill_any_timeout(n_time * 2, "movedone", "demongate_chomper_found_target", "demongate_chomper_despawning", "death");
	if(isdefined(self.var_4288770f))
	{
		self clientfield::set("demongate_wander_locomotion_anim", 0);
		self function_4a3857ec(e_player);
		continue;
	}
	self thread function_b9f890e8(e_player);
}

/*
	Name: function_dfbf651a
	Namespace: namespace_efd1ef23
	Checksum: 0x378BFF0B
	Offset: 0x1D80
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 546
*/
function function_dfbf651a(e_player)
{
	self endon("hash_72391651");
	self endon("hash_7b23407");
	self endon("movedone");
	self endon("death");
	while(!isdefined(self.var_4288770f))
	{
		wait(0.2);
		self thread function_8e354e9(e_player);
	}
}

/*
	Name: function_4a3857ec
	Namespace: namespace_efd1ef23
	Checksum: 0xA849557B
	Offset: 0x1DF8
	Size: 0x2C8
	Parameters: 1
	Flags: None
	Line Number: 569
*/
function function_4a3857ec(e_player)
{
	var_3230934b = self.var_4288770f.health;
	self function_cc43175f();
	if(zm_weap_elemental_bow::function_69533776(self.var_4288770f))
	{
		var_c661f4ef = randomIntRange(1, 7);
		b_is_crawler = self.var_4288770f.missingLegs;
		self.var_4288770f.var_a940fc8b = 1;
		self.var_6a0b9707 = 0;
		self.var_43f9ca95 = self.var_43f9ca95 - var_3230934b;
		self thread function_aac5a0eb(var_c661f4ef, b_is_crawler);
		self thread function_c846d79d();
		self thread function_213cb9a0(e_player);
		if(isdefined(self.var_4288770f.isdog) && self.var_4288770f.isdog || isVehicle(self.var_4288770f))
		{
			n_wait_time = 0.8;
		}
		else if(self.var_4288770f.archetype === "mechz")
		{
			n_wait_time = 2.6;
			self.var_43f9ca95 = 0;
			continue;
		}
		n_wait_time = RandomFloatRange(2, 3);
		self.var_4288770f SetPlayerCollision(0);
		self.var_4288770f util::waittill_notify_or_timeout("death", n_wait_time);
		self notify("hash_751bb68a");
		self function_9736776(var_c661f4ef, b_is_crawler);
		if(self.var_43f9ca95 < 1)
		{
			self thread function_8a58754e();
			return;
		}
	}
	else if(isdefined(self.var_4288770f))
	{
		self.var_4288770f.var_2d81239b = 0;
	}
	self flag::clear("chomper_attacking");
	self thread function_51585d77(e_player);
}

/*
	Name: function_c846d79d
	Namespace: namespace_efd1ef23
	Checksum: 0xE14B3E71
	Offset: 0x20C8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 622
*/
function function_c846d79d()
{
	self endon("death");
	self endon("hash_751bb68a");
	if(self.var_4288770f.archetype === "mechz")
	{
		while(1)
		{
			self clientfield::increment("demongate_chomper_bite_fx", 1);
			wait(1);
		}
	}
	else
	{
		self waittill("hash_48e4a902");
		self clientfield::increment("demongate_chomper_bite_fx", 1);
	}
	while(1)
	{
	}
}

/*
	Name: function_aac5a0eb
	Namespace: namespace_efd1ef23
	Checksum: 0xA636CC65
	Offset: 0x2180
	Size: 0x1A8
	Parameters: 2
	Flags: None
	Line Number: 654
*/
function function_aac5a0eb(var_c661f4ef, b_is_crawler)
{
	self.var_4288770f endon("death");
	if(isdefined(self.var_4288770f.isdog) && self.var_4288770f.isdog)
	{
		self.var_4288770f ai::set_ignoreall(1);
	}
	else if(self.var_4288770f.archetype === "mechz")
	{
		self thread function_1ce5ba54();
	}
	else if(isVehicle(self.var_4288770f))
	{
		self.var_4288770f.ignoreall = 1;
	}
	else if(isdefined(b_is_crawler) && b_is_crawler)
	{
		self.var_4288770f scene::Play("ai_zm_dlc1_zombie_demongate_chomper_attack_crawler", Array(self.var_4288770f, self));
		continue;
	}
	self.var_4288770f scene::init("ai_zm_dlc1_zombie_demongate_chomper_attack_0" + var_c661f4ef, Array(self.var_4288770f, self));
	self.var_4288770f scene::Play("ai_zm_dlc1_zombie_demongate_chomper_attack_0" + var_c661f4ef, Array(self.var_4288770f, self));
	return;
}

/*
	Name: function_1ce5ba54
	Namespace: namespace_efd1ef23
	Checksum: 0x6A3A083C
	Offset: 0x2330
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 689
*/
function function_1ce5ba54()
{
	e_mechz = self.var_4288770f;
	self endon("death");
	self endon("hash_751bb68a");
	e_mechz endon("death");
	while(1)
	{
		if(e_mechz.has_faceplate)
		{
			continue;
		}
		var_a66ba567 = 1;
		var_33cb4c34 = AnglesToForward(self.var_4288770f.angles) * var_a66ba567;
		self.origin = self.var_4288770f GetTagOrigin("j_faceplate") + var_33cb4c34;
		self.angles = VectorToAngles(var_33cb4c34 * -1);
		wait(0.05);
	}
}

/*
	Name: function_9736776
	Namespace: namespace_efd1ef23
	Checksum: 0xE29A2A8A
	Offset: 0x2448
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 719
*/
function function_9736776(var_c661f4ef, b_is_crawler)
{
	if(isdefined(self.var_4288770f) && self.var_4288770f.archetype === "mechz")
	{
		self.var_4288770f thread function_75b257c5();
		return;
	}
	if(isdefined(self.var_4288770f) && (!(isdefined(self.var_4288770f.isdog) && self.var_4288770f.isdog)))
	{
		if(isdefined(b_is_crawler) && b_is_crawler)
		{
			self.var_4288770f thread scene::stop("ai_zm_dlc1_zombie_demongate_chomper_attack_crawler");
			continue;
		}
		self.var_4288770f thread scene::stop("ai_zm_dlc1_zombie_demongate_chomper_attack_0" + var_c661f4ef);
	}
	if(isdefined(b_is_crawler) && b_is_crawler)
	{
		self thread scene::stop("ai_zm_dlc1_zombie_demongate_chomper_attack_crawler");
		continue;
	}
	self thread scene::stop("ai_zm_dlc1_zombie_demongate_chomper_attack_0" + var_c661f4ef);
	return;
}

/*
	Name: function_75b257c5
	Namespace: namespace_efd1ef23
	Checksum: 0xC2F7294B
	Offset: 0x2590
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 754
*/
function function_75b257c5()
{
	self endon("death");
	self.var_82e65a18 = 1;
	wait(16);
	self.var_82e65a18 = 0;
}

/*
	Name: function_cc43175f
	Namespace: namespace_efd1ef23
	Checksum: 0x14573DB5
	Offset: 0x25C8
	Size: 0x398
	Parameters: 0
	Flags: None
	Line Number: 772
*/
function function_cc43175f()
{
	self flag::set("chomper_attacking");
	v_eye_pos = self.var_4288770f GetEye();
	n_dist = Distance(self.origin, v_eye_pos);
	var_e5e24312 = 1;
	if(math::cointoss())
	{
		continue;
	}
	var_fd2c14f3 = -1;
	self clientfield::set("demongate_attack_locomotion_anim", 1);
	while(n_dist > 32 && isdefined(self.var_4288770f) && isalive(self.var_4288770f))
	{
		v_eye_pos = self.var_4288770f GetEye();
		n_time = n_dist / 640;
		var_f17995b7 = 1 / var_e5e24312;
		n_scale = VectorScale((0, 0, 1), 160) * var_f17995b7;
		v_offset = AnglesToRight(VectorToAngles(v_eye_pos - self.origin)) * 256;
		v_offset = v_offset * var_f17995b7;
		v_offset = v_offset * var_fd2c14f3;
		v_target_pos = v_eye_pos + v_offset + n_scale;
		var_d1979001 = v_target_pos - self.origin;
		var_d1979001 = (0, var_d1979001[1], 0);
		if(!isdefined(level.var_d75011ba))
		{
			level.var_d75011ba = GetTime();
		}
		else if(level.var_d75011ba == GetTime())
		{
			wait(RandomFloatRange(0.1, 0.2));
		}
		level.var_d75011ba = GetTime();
		self moveto(v_target_pos, n_time);
		self RotateTo(VectorToAngles(var_d1979001), n_time * 0.5);
		n_time = n_time * 0.3;
		if(n_time < 0.1)
		{
			continue;
		}
		n_time = n_time;
		wait(n_time);
		var_e5e24312++;
		n_dist = Distance(self.origin, v_eye_pos);
	}
	self clientfield::set("demongate_attack_locomotion_anim", 0);
	if(isdefined(self.var_4288770f) && isalive(self.var_4288770f))
	{
		self.origin = v_eye_pos;
		return;
	}
}

/*
	Name: function_213cb9a0
	Namespace: namespace_efd1ef23
	Checksum: 0x5DC47855
	Offset: 0x2968
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 835
*/
function function_213cb9a0(e_player)
{
	e_target = self.var_4288770f;
	e_target endon("death");
	if(e_target.archetype === "mechz")
	{
		self thread function_141c9126(e_player);
		return;
	}
	n_damage = e_target.health;
	self waittill("hash_751bb68a");
	e_target SetPlayerCollision(1);
	e_target.var_2d81239b = 0;
	e_target.var_a940fc8b = 0;
	if(zm_utility::is_player_valid(e_player))
	{
		var_1e07a4db = e_player;
		continue;
	}
	var_1e07a4db = undefined;
	e_target DoDamage(n_damage, e_target.origin, var_1e07a4db, var_1e07a4db, undefined, "MOD_UNKNOWN", 0, level.var_edf1e590);
	GibServerUtils::GibHead(e_target);
}

/*
	Name: function_141c9126
	Namespace: namespace_efd1ef23
	Checksum: 0x1D30D939
	Offset: 0x2AC8
	Size: 0x108
	Parameters: 1
	Flags: None
	Line Number: 869
*/
function function_141c9126(e_player)
{
	e_target = self.var_4288770f;
	e_target endon("death");
	var_92e49505 = level.mechz_health;
	n_damage = var_92e49505 * 0.2 / 0.2;
	if(zm_utility::is_player_valid(e_player))
	{
		var_1e07a4db = e_player;
		continue;
	}
	var_1e07a4db = undefined;
	e_target DoDamage(n_damage, e_target.origin, var_1e07a4db, var_1e07a4db, undefined, "MOD_PROJECTILE_SPLASH", 0, level.var_edf1e590);
	self waittill("hash_751bb68a");
	e_target.var_2d81239b = 0;
	e_target.var_a940fc8b = 0;
}

/*
	Name: function_8e354e9
	Namespace: namespace_efd1ef23
	Checksum: 0x1E736BC4
	Offset: 0x2BD8
	Size: 0x1B8
	Parameters: 1
	Flags: None
	Line Number: 897
*/
function function_8e354e9(e_player)
{
	if(self flag::get("demongate_chomper_despawning"))
	{
		return;
	}
	self.var_4288770f = undefined;
	var_ac82e424 = self.origin;
	var_f1fec99c = 1024;
	if(isdefined(self.var_6a0b9707) && self.var_6a0b9707)
	{
		if(zm_utility::is_player_valid(e_player))
		{
			var_ac82e424 = e_player.origin;
		}
		var_f1fec99c = 1024;
	}
	a_ai_enemies = GetAITeamArray(level.zombie_team);
	a_valid_enemies = ArraySortClosest(a_ai_enemies, var_ac82e424, a_ai_enemies.size, 0, var_f1fec99c);
	a_valid_enemies = Array::filter(a_valid_enemies, 0, &zm_weap_elemental_bow::function_69533776);
	a_valid_enemies = Array::filter(a_valid_enemies, 0, &function_81c9897e, self);
	if(a_valid_enemies.size)
	{
		e_favorite_enemy = a_valid_enemies[0];
		e_favorite_enemy.var_2d81239b = 1;
		self.var_4288770f = e_favorite_enemy;
		self notify("hash_7b23407");
	}
}

/*
	Name: function_81c9897e
	Namespace: namespace_efd1ef23
	Checksum: 0x5091249A
	Offset: 0x2D98
	Size: 0x10C
	Parameters: 2
	Flags: None
	Line Number: 937
*/
function function_81c9897e(e_favorite_enemy, var_4a243bdd)
{
	return !(isdefined(e_favorite_enemy.var_2d81239b) && e_favorite_enemy.var_2d81239b && (isdefined(e_favorite_enemy.completed_emerging_into_playable_area) && e_favorite_enemy.completed_emerging_into_playable_area || !isdefined(e_favorite_enemy.completed_emerging_into_playable_area)) && (e_favorite_enemy.archetype === "zombie" && (isdefined(e_favorite_enemy.completed_emerging_into_playable_area) && e_favorite_enemy.completed_emerging_into_playable_area)) || (e_favorite_enemy.archetype !== "zombie" && BulletTracePassed(e_favorite_enemy GetEye(), var_4a243bdd.origin, 0, var_4a243bdd)));
}

