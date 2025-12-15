#include scripts\codescripts\struct;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\postfx_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\weapons\_weaponobjects;

#namespace namespace_3df25fcf;

/*
	Name: __init__sytem__
	Namespace: namespace_3df25fcf
	Checksum: 0xA545DBB6
	Offset: 0x3F0
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("electroball_grenade", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_3df25fcf
	Checksum: 0x37A08E45
	Offset: 0x430
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	clientfield::register("toplayer", "tazered", 1, 1, "int", undefined, 0, 0);
	clientfield::register("allplayers", "electroball_shock", 1, 1, "int", &function_febce73f, 0, 0);
	clientfield::register("actor", "electroball_make_sparky", 1, 1, "int", &function_817524f8, 0, 0);
	clientfield::register("missile", "electroball_stop_trail", 1, 1, "int", &function_7b6d34dc, 0, 0);
	clientfield::register("missile", "electroball_play_landed_fx", 1, 1, "int", &function_96325d01, 0, 0);
	level._effect["fx_wpn_115_blob"] = "dlc1/castle/fx_wpn_115_blob";
	level._effect["fx_wpn_115_bul_trail"] = "dlc1/castle/fx_wpn_115_bul_trail";
	level._effect["fx_wpn_115_canister"] = "dlc1/castle/fx_wpn_115_canister";
	level._effect["electroball_grenade_player_shock"] = "weapon/fx_prox_grenade_impact_player_spwner";
	level._effect["electroball_grenade_sparky_conversion"] = "weapon/fx_prox_grenade_exp";
	callback::add_weapon_type("electroball_grenade", &proximity_spawned);
	level thread watchForProximityExplosion();
}

/*
	Name: proximity_spawned
	Namespace: namespace_3df25fcf
	Checksum: 0x82568EF
	Offset: 0x660
	Size: 0xB8
	Parameters: 1
	Flags: None
	Line Number: 62
*/
function proximity_spawned(localClientNum)
{
	self util::waittill_dobj(localClientNum);
	if(self isGrenadeDud())
	{
		return;
	}
	self.var_d193c5c9 = PlayFXOnTag(localClientNum, level._effect["fx_wpn_115_bul_trail"], self, "j_grenade_front");
	self.var_12e05963 = PlayFXOnTag(localClientNum, level._effect["fx_wpn_115_canister"], self, "j_grenade_back");
	return;
}

/*
	Name: watchForProximityExplosion
	Namespace: namespace_3df25fcf
	Checksum: 0xF6AE9728
	Offset: 0x720
	Size: 0x198
	Parameters: 0
	Flags: None
	Line Number: 84
*/
function watchForProximityExplosion()
{
	if(GetActiveLocalClients() > 1)
	{
		return;
	}
	weapon_proximity = GetWeapon("electroball_grenade");
	while(1)
	{
		level waittill("explode", localClientNum, position, mod, weapon, owner_cent);
		if(weapon.rootweapon != weapon_proximity)
		{
			continue;
		}
		localPlayer = GetLocalPlayer(localClientNum);
		if(!localPlayer util::is_player_view_linked_to_entity(localClientNum))
		{
			explosionRadius = weapon.explosionRadius;
			if(DistanceSquared(localPlayer.origin, position) < explosionRadius * explosionRadius)
			{
				if(isdefined(owner_cent))
				{
					if(owner_cent == localPlayer || !owner_cent util::friend_not_foe(localClientNum, 1))
					{
						localPlayer thread postfx::playPostfxBundle("pstfx_shock_charge");
					}
				}
			}
		}
	}
}

/*
	Name: function_817524f8
	Namespace: namespace_3df25fcf
	Checksum: 0x94DA98EE
	Offset: 0x8C0
	Size: 0x158
	Parameters: 7
	Flags: None
	Line Number: 126
*/
function function_817524f8(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	ai_zombie = self;
	if(isdefined(level.a_electroball_grenades))
	{
		electroball = ArrayGetClosest(ai_zombie.origin, level.a_electroball_grenades);
	}
	a_sparky_tags = Array("j_spine4", "j_spineupper", "j_spine1");
	tag = Array::random(a_sparky_tags);
	if(isdefined(electroball))
	{
		var_f445fe01 = BeamLaunch(localClientNum, electroball, "tag_origin", ai_zombie, tag, "electric_arc_beam_electroball");
		wait(1);
		if(isdefined(var_f445fe01))
		{
			BeamKill(localClientNum, var_f445fe01);
		}
	}
}

/*
	Name: function_febce73f
	Namespace: namespace_3df25fcf
	Checksum: 0xEE537B10
	Offset: 0xA20
	Size: 0x78
	Parameters: 7
	Flags: None
	Line Number: 156
*/
function function_febce73f(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	FX = PlayFXOnTag(localClientNum, level._effect["electroball_grenade_player_shock"], self, "J_SpineUpper");
}

/*
	Name: function_7b6d34dc
	Namespace: namespace_3df25fcf
	Checksum: 0xC66F28EA
	Offset: 0xAA0
	Size: 0x128
	Parameters: 7
	Flags: None
	Line Number: 171
*/
function function_7b6d34dc(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(!isdefined(level.a_electroball_grenades))
	{
		level.a_electroball_grenades = [];
	}
	Array::add(level.a_electroball_grenades, self);
	self thread function_f8f313c9();
	if(isdefined(self.var_d193c5c9))
	{
		stopfx(localClientNum, self.var_d193c5c9);
	}
	if(isdefined(self.var_de931bda))
	{
		stopfx(localClientNum, self.var_de931bda);
	}
	if(isdefined(self.var_3f9cb15a))
	{
		stopfx(localClientNum, self.var_3f9cb15a);
	}
	if(isdefined(self.var_12e05963))
	{
		stopfx(localClientNum, self.var_12e05963);
	}
}

/*
	Name: function_f8f313c9
	Namespace: namespace_3df25fcf
	Checksum: 0x45E26A58
	Offset: 0xBD0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 207
*/
function function_f8f313c9()
{
	self waittill("entityshutdown");
	level.a_electroball_grenades = Array::remove_undefined(level.a_electroball_grenades);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_96325d01
	Namespace: namespace_3df25fcf
	Checksum: 0x786D404
	Offset: 0xC10
	Size: 0xB8
	Parameters: 7
	Flags: None
	Line Number: 225
*/
function function_96325d01(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	self.var_d4427971 = PlayFXOnTag(localClientNum, level._effect["fx_wpn_115_blob"], self, "tag_origin");
	dynEnt = CreateDynEntAndLaunch(localClientNum, "p7_zm_ctl_115_grenade_broken", self.origin, self.angles, self.origin, (0, 0, 0));
}

