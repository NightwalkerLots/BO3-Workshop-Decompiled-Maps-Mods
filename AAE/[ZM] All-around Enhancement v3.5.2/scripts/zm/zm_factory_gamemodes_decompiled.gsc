#include scripts\shared\array_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_perk_deadshot;
#include scripts\zm\_zm_perk_staminup;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_zcmachine;

#namespace namespace_99629df2;

/*
	Name: init
	Namespace: namespace_99629df2
	Checksum: 0x424F4353
	Offset: 0x348
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 25
*/
function init()
{
}

/*
	Name: load
	Namespace: namespace_99629df2
	Checksum: 0x424F4353
	Offset: 0x358
	Size: 0x18
	Parameters: 0
	Flags: AutoExec
	Line Number: 39
*/
function autoexec load()
{
	thread function_cca51c84();
	return;
	ERROR: Bad function call
}

/*
	Name: function_cca51c84
	Namespace: namespace_99629df2
	Checksum: 0x424F4353
	Offset: 0x378
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 56
*/
function function_cca51c84()
{
	level flag::wait_till("start_zombie_round_logic");
	if(!isdefined(level._custom_perks["specialty_staminup"]))
	{
		perk = "specialty_staminup";
		vending = "vending_marathon";
		perk_init = &zm_perk_staminup::enable_staminup_perk_for_level;
	}
	if(!isdefined(level._custom_perks["specialty_deadshot"]))
	{
		perk = "specialty_deadshot";
		vending = "vending_deadshot";
		perk_init = &zm_perk_deadshot::enable_deadshot_perk_for_level;
	}
	level flag::wait_till("start_zombie_round_logic");
	[[perk_init]]();
	function_8fd06793((1325.67, 372.213, 65.125), VectorScale((0, 1, 0), 180), perk, vending);
}

/*
	Name: function_8fd06793
	Namespace: namespace_99629df2
	Checksum: 0x424F4353
	Offset: 0x4B0
	Size: 0x430
	Parameters: 4
	Flags: None
	Line Number: 86
*/
function function_8fd06793(origin, angles, perk, radiant_machine_name)
{
	t_use = spawn("trigger_radius_use", origin + VectorScale((0, 0, 1), 60), 0, 40, 80);
	t_use.targetname = "zombie_vending";
	t_use.target = radiant_machine_name;
	t_use.script_noteworthy = perk;
	t_use.power_on = 1;
	t_use TriggerIgnoreTeam();
	perk_machine = spawn("script_model", origin);
	perk_machine.targetname = radiant_machine_name;
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	perk_machine.angles = angles;
	bump_trigger = spawn("trigger_radius", origin + VectorScale((0, 0, 1), 20), 0, 40, 80);
	bump_trigger.script_activated = 1;
	bump_trigger.script_sound = "zmb_perks_bump_bottle";
	bump_trigger.targetname = "audio_bump_trigger";
	collision = spawn("script_model", origin, 1);
	collision.angles = angles;
	collision SetModel("zm_collision_perks1");
	collision.script_noteworthy = "clip";
	collision disconnectpaths();
	t_use.clip = collision;
	t_use.machine = perk_machine;
	t_use.bump = bump_trigger;
	[[level._custom_perks[perk].perk_machine_set_kvps]](t_use, perk_machine, bump_trigger, collision);
	t_use thread namespace_543ce08f::function_60d67731(bump_trigger);
	t_use thread namespace_543ce08f::function_26dac2c3(bump_trigger);
	t_use thread namespace_543ce08f::function_3ed2f66e(bump_trigger);
	bump_trigger thread zm_perks::check_for_change();
	bump_trigger thread zm_perks::thread_bump_trigger();
	perk_machine SetModel(level.machine_assets[perk].on_model);
	t_use thread vending_trigger_think();
	level waittill("power_on");
	level notify(perk + "_power_on");
	perk_machine vibrate(VectorScale((0, -1, 0), 100), 0.3, 0.4, 3);
	perk_machine playsound("zmb_perks_power_on");
	perk_machine thread zm_perks::perk_fx(level._custom_perks[perk].machine_light_effect);
	perk_machine thread zm_perks::play_loop_on_machine();
}

/*
	Name: vending_trigger_think
	Namespace: namespace_99629df2
	Checksum: 0x424F4353
	Offset: 0x8E8
	Size: 0x590
	Parameters: 0
	Flags: None
	Line Number: 139
*/
function vending_trigger_think()
{
	self endon("death");
	perk = self.script_noteworthy;
	self setcursorhint("HINT_NOICON");
	self setHintString(&"ZOMBIE_NEED_POWER");
	self UseTriggerRequireLookAt();
	level waittill("power_on");
	cost = level.zombie_vars["zombie_perk_cost"];
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].cost))
	{
		if(IsInt(level._custom_perks[perk].cost))
		{
			cost = level._custom_perks[perk].cost;
		}
		else
		{
			cost = [[level._custom_perks[perk].cost]]();
		}
	}
	self.cost = cost;
	if(!isdefined(level._perkmachinenetworkchoke))
	{
		level._perkmachinenetworkchoke = 0;
	}
	else
	{
		level._perkmachinenetworkchoke++;
	}
	for(i = 0; i < level._perkmachinenetworkchoke; i++)
	{
		util::wait_network_frame();
	}
	self thread zm_audio::sndPerksJingles_Timer();
	self thread zm_perks::check_player_has_perk(perk);
	if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].hint_string))
	{
		self setHintString(level._custom_perks[perk].hint_string, cost);
	}
	for(;;)
	{
		self waittill("trigger", player);
		index = zm_utility::get_player_index(player);
		if(!zm_perks::vending_trigger_can_player_use(player))
		{
			wait(0.1);
		}
		else if(player hasPerk(perk))
		{
			cheat = 0;
			if(cheat != 1)
			{
				self playsound("evt_perk_deny");
				player zm_audio::create_and_play_dialog("general", "sigh");
			}
		}
		else
		{
			if(!isdefined(self.var_a0b6ced3))
			{
				valid = self [[level.custom_perk_validation]](player);
				if(!valid)
				{
				}
			}
			else
			{
				current_cost = self.cost;
				if(player zm_pers_upgrades_functions::is_pers_double_points_active())
				{
					current_cost = player zm_pers_upgrades_functions::pers_upgrade_double_points_cost(current_cost);
				}
				if(!player zm_score::can_player_purchase(current_cost))
				{
					self playsound("evt_perk_deny");
					player zm_audio::create_and_play_dialog("general", "outofmoney");
				}
				else if(!player zm_utility::can_player_purchase_perk())
				{
					self playsound("evt_perk_deny");
					player zm_audio::create_and_play_dialog("general", "sigh");
				}
				else
				{
					sound = "evt_bottle_dispense";
					playsoundatposition(sound, self.origin);
					player zm_score::minus_to_player_score(current_cost);
					perkHash = -1;
					if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].hash_id))
					{
						perkHash = level._custom_perks[perk].hash_id;
					}
					player.perk_purchased = perk;
					player notify("perk_purchased", perk);
					self thread zm_audio::sndPerksJingles_Player(1);
					self thread zm_perks::vending_trigger_post_think(player, perk);
				}
			}
			else
			{
			}
			else
			{
			}
		}
		else if(isdefined(level.custom_perk_validation))
		{
		}
	}
}

