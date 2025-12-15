#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;

#namespace zm_bgb_secret_shopper;

/*
	Name: __init__sytem__
	Namespace: zm_bgb_secret_shopper
	Checksum: 0x424F4353
	Offset: 0x1A8
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 22
*/
function autoexec __init__sytem__()
{
	system::register("zm_bgb_secret_shopper", &__init__, undefined, "bgb");
}

/*
	Name: __init__
	Namespace: zm_bgb_secret_shopper
	Checksum: 0x424F4353
	Offset: 0x1E8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 37
*/
function __init__()
{
	if(!(isdefined(level.bgb_in_use) && level.bgb_in_use))
	{
		return;
	}
	bgb::register("zm_bgb_secret_shopper", "time", 600, &enable, &disable, undefined, undefined);
}

/*
	Name: enable
	Namespace: zm_bgb_secret_shopper
	Checksum: 0x424F4353
	Offset: 0x258
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function enable()
{
	self endon("disconnect");
	self endon("death");
	self endon("bled_out");
	self endon("hash_994d5e9e");
	bgb::function_650ca64(7);
	for(;;)
	{
		self waittill("zm_bgb_secret_shopper", var_2757208f);
		var_2757208f thread function_127dc5ca(self);
	}
}

/*
	Name: disable
	Namespace: zm_bgb_secret_shopper
	Checksum: 0x424F4353
	Offset: 0x2E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 80
*/
function disable()
{
	bgb::function_eabb0903();
}

/*
	Name: function_127dc5ca
	Namespace: zm_bgb_secret_shopper
	Checksum: 0x424F4353
	Offset: 0x300
	Size: 0x180
	Parameters: 1
	Flags: None
	Line Number: 95
*/
function function_127dc5ca(player)
{
	self notify("hash_127dc5ca");
	self endon("hash_127dc5ca");
	self endon("kill_trigger");
	self endon("hash_a09e2c64");
	player endon("hash_994d5e9e");
	for(;;)
	{
		player waittill("hash_10c37787");
		if(player.var_31f417c !== self)
		{
		}
		else if(!player bgb::is_enabled("zm_bgb_secret_shopper"))
		{
		}
		else
		{
			w_current = player.currentWeapon;
			n_ammo_cost = player zm_weapons::get_ammo_cost_for_weapon(w_current);
			var_b2860cb0 = 0;
			if(player zm_score::can_player_purchase(n_ammo_cost))
			{
				var_b2860cb0 = player zm_weapons::ammo_give(w_current);
			}
			if(var_b2860cb0)
			{
				player zm_score::minus_to_player_score(n_ammo_cost);
				player bgb::do_one_shot_use(1);
			}
			else
			{
				player bgb::function_ca189700();
			}
			wait(0.05);
		}
	}
}

