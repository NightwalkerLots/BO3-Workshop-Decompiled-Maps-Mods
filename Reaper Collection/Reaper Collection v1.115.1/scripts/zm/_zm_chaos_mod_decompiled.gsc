#include scripts\codescripts\struct;
#include scripts\shared\aat_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\demo_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_daily_challenges;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_melee_weapon;
#include scripts\zm\_zm_pack_a_punch_util;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_pers_upgrades_functions;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_powerup_nuke;
#include scripts\zm\_zm_powerup_utility;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_reap_common;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\zmsavedata;

#namespace namespace_ac3f3f96;

/*
	Name: __init__sytem__
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x3500
	Size: 0x40
	Parameters: 0
	Flags: AutoExec
	Line Number: 50
*/
function autoexec __init__sytem__()
{
	system::register("zm_chaos_mod", &__init__, &__main__, undefined);
}

/*
	Name: __init__
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x3548
	Size: 0x4180
	Parameters: 0
	Flags: None
	Line Number: 65
*/
function __init__()
{
	visionset_mgr::register_info("visionset", "chaos_mod_noire", 21000, 100, 31, 0, &visionset_mgr::ramp_in_out_thread, 0);
	visionset_mgr::register_info("visionset", "chaos_mod_infrared", 21000, 100, 31, 0, &visionset_mgr::ramp_in_out_thread, 0);
	level.var_e8c32e9b = 0;
	level.var_38691b95 = 30;
	level.var_19b99e49 = 1;
	level.var_4c448eaf = 0;
	level.var_af6a5fe7 = 1;
	level.var_f35c0c45 = 1;
	level.var_bf1408b6 = 0;
	level.var_2ae5808e = 0;
	level thread function_e103d400();
	level.var_6b394783 = 0;
	level.var_fb54f598 = 0;
	level.var_72d4ff22 = 0;
	level.using_zombie_powerups = 1;
	level._effect["powerup_on_red"] = "zombie/fx_powerup_on_red_zmb";
	level._effect["powerup_grabbed_red"] = "zombie/fx_powerup_grab_red_zmb";
	zm_powerups::register_powerup("anti_full_ammo", &function_965e3ca3);
	zm_powerups::add_zombie_powerup("anti_full_ammo", "p7_zm_power_up_max_ammo", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_bonus_points_player", &function_99fbb1fb);
	zm_powerups::add_zombie_powerup("anti_bonus_points_player", "zombie_z_money_icon", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_free_perk", &function_47d5a769);
	zm_powerups::add_zombie_powerup("anti_free_perk", "zombie_pickup_perk_bottle", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_carpentr", &function_da34b2a4);
	zm_powerups::add_zombie_powerup("anti_carpentr", "p7_zm_power_up_carpenter", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_double_points", &function_a9d32f);
	zm_powerups::add_zombie_powerup("anti_double_points", "p7_zm_power_up_double_points", &"ZOMBIE_POWERUP_DOUBLE_POINTS", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_insta_kill", &function_92b6be0);
	zm_powerups::add_zombie_powerup("anti_insta_kill", "p7_zm_power_up_insta_kill", &"ZOMBIE_POWERUP_INSTA_KILL", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_fire_sale", &function_d81452aa);
	zm_powerups::add_zombie_powerup("anti_fire_sale", "p7_zm_power_up_firesale", &"ZOMBIE_POWERUP_MAX_AMMO", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_nuke", &function_1ea2743);
	zm_powerups::add_zombie_powerup("anti_nuke", "p7_zm_power_up_nuke", &"ZOMBIE_POWERUP_NUKE", &zm_powerups::func_should_never_drop, 0, 0, 1);
	zm_powerups::register_powerup("anti_minigun", &function_e3544c3d);
	zm_powerups::add_zombie_powerup("anti_minigun", "zombie_pickup_minigun", &"ZOMBIE_POWERUP_MINIGUN", &zm_powerups::func_should_never_drop, 0, 0, 1);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	Array::thread_all(vending_triggers, &function_697a6946);
	zm_spawner::register_zombie_death_event_callback(&function_99b5dfa9);
	register_player_friendly_fire_callback(&function_2f8570b3);
	if(!isdefined(level.perk_damage_override))
	{
		level.perk_damage_override = [];
	}
	Array::add(level.perk_damage_override, &function_bf875ccd, 0);
	Array::add(level.perk_damage_override, &function_e0b4cbfb, 0);
	function_c32f781a("HIDDEN EFFECTS (META)", undefined, undefined, 120, undefined);
	function_c32f781a("DOUBLE CHAOS TIMER (META)", undefined, undefined, 60, undefined);
	function_c32f781a("DOUBLE EFFECT TIME (META)", undefined, undefined, 60, undefined);
	function_c32f781a("DOUBLE CHAOS (META)", undefined, undefined, 60, undefined);
	function_c32f781a("PAUSE CHAOS TIMER (META)", &function_31f9e290, &function_51eab995, 60, undefined);
	function_c32f781a("NEGATIVE EFFECTS ONLY (META)", undefined, undefined, 120, undefined);
	function_c32f781a("POSITIVE EFFECTS ONLY (META)", undefined, undefined, 120, undefined);
	function_5297f8da("LITERALLY NOTHING", "neutral", undefined, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM GUMBALL", "neutral", &function_28b7ec17, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM TELEPORT", "neutral", &function_4842c3d2, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("HEADSHOTS ONLY", "harmful", &function_b22a52c8, &function_ef2299e, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("AIMING DISABLED", "harmful", &function_9160370b, &function_815cf0ce, 40, undefined, undefined, undefined, undefined);
	function_5297f8da("KILL ALL ZOMBIES IN SIGHT", "neutral", &function_2a8862aa, undefined, undefined, undefined, undefined, undefined, "all zombies in your line of sight are killed");
	function_5297f8da("CRAWLERS!", "neutral", &function_1d027931, undefined, undefined, undefined, undefined, undefined, "all zombies become crawlers");
	function_5297f8da("BUDGET CUTS", "harmful", &function_d619438b, undefined, undefined, undefined, undefined, undefined, "halves your current points");
	function_5297f8da("DOUBLE POINTS", "helpful", &function_fe2438fd, undefined, undefined, undefined, undefined, undefined, "doubles your current points");
	function_5297f8da("TAKE RANDOM PERK", "harmful", &function_47d5a769, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("GIVE RANDOM PERK", "helpful", &give_random_perk, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("FREE PAP", "helpful", &function_af80261, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("UNPAP GUN", "harmful", &function_9b9372e8, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("MARTYRDOM", "harmful", &spawn_grenade, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("EXPLOSIVE ZOMBIES", "harmful", &function_d3284989, &function_69703690, 20, undefined, undefined, undefined, "zombies explode when killed");
	function_5297f8da("WHERES THAT ZOMBIE?", "neutral", &function_2f4bdab4, &function_6b2eeec5, 60, undefined, undefined, undefined, "zombie sounds are played around the player");
	function_5297f8da("UNLIMITED POWER!", "helpful", &function_a9107cba, &function_66a4e74d, 30, undefined, undefined, undefined, "every zombie drops a powerup");
	function_5297f8da("I'M FEELING LUCKY!", "helpful", &function_3d54115b, undefined, undefined, undefined, undefined, undefined, "spawns a random powerup");
	function_5297f8da("DISABLE POWERUP SPAWNS", "harmful", &function_8c94e755, &function_71a3a928, 120, undefined, undefined, undefined, undefined);
	function_5297f8da("I THOUGHT YOU HAD THE ZOMBIE?", "harmful", &end_round, undefined, undefined, undefined, undefined, undefined, "ends the round");
	function_5297f8da("GIVEN THE OTHER TEAM ANOTHER CHANCE", "neutral", &restart_round, undefined, undefined, undefined, undefined, undefined, "restarted the round");
	function_5297f8da("LOST ITS FLAVOUR", "harmful", &function_bcc27502, undefined, undefined, undefined, undefined, undefined, "removes your gobblegum");
	function_5297f8da("REMOVE CURRENT CLIP", "harmful", &function_965e3ca3, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM AAT", "neutral", &function_c97affa9, undefined, undefined, undefined, undefined, undefined, "gives a random re-pap ability if your gun is supported");
	function_5297f8da("RESET AAT", "harmful", &function_373d6b95, undefined, undefined, undefined, undefined, undefined, "removes your re-pap ability if you had one");
	function_5297f8da("LSD", "neutral", &function_df7c274, &function_7bc33a91, 30, undefined, undefined, undefined, "colourful!");
	function_5297f8da("FAKE CRASH", "neutral", &function_b327dcda, undefined, undefined, 3, undefined, undefined, undefined);
	function_5297f8da("FREEZE TIME", "neutral", &function_fdcdfd54, &function_11c2a14f, 20, undefined, undefined, undefined, undefined);
	function_5297f8da("GIVE RANDOM WEAPON", "neutral", &function_b6ae2093, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("WHO DIDN'T PAY THE ELECTRIC BILL?", "harmful", &function_321f175c, undefined, 60, undefined, undefined, undefined, "turns off power and any object using it");
	function_5297f8da("WHO'S SHOOTING?", "neutral", &function_74d0b926, &function_ab9a046d, 60, undefined, undefined, undefined, "random gun sounds around the player");
	function_5297f8da("ZOMBIES LOSE RANDOM LIMBS", "neutral", &function_7fa6fc03, &function_bd634a9a, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("FAKE SAMANTHA GLITCH", "neutral", &function_5577d80e, undefined, undefined, 3, undefined, undefined, undefined);
	function_5297f8da("ORIGINS MUD", "harmful", &function_1baa8613, &function_492ce314, 30, undefined, undefined, undefined, "disable sprinting");
	function_5297f8da("BO2 SLIDE", "harmful", &function_43576716, &function_11fafce7, 30, undefined, undefined, undefined, "disable sliding");
	function_5297f8da("MY [{+weapnext_inventory}] KEY IS BROKEN", "harmful", &function_14f67823, &function_6454bdce, 30, undefined, undefined, undefined, "disable weapon swapping");
	function_5297f8da("OLD FASHIONED", "neutral", &function_8545ec55, &function_8053b0f0, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("HARDCORE", "harmful", &no_hud, &function_d609c513, 60, undefined, undefined, undefined, "removes the hud");
	function_5297f8da("EXTRA CRISPY", "neutral", &function_60c0d294, &function_42d75eef, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("GOD MODE", "helpful", &function_fcebbc3c, &function_35e7bb0f, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("TURN AROUND", "harmful", &function_43d063d4, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("NEED A LITTLE REVIVE?", "neutral", &function_bb8c3452, &function_324c60e9, 60, undefined, undefined, undefined, "check the quick revive machine");
	function_5297f8da("I FOUND JUGG!", "neutral", &function_75d2b14a, undefined, undefined, undefined, undefined, undefined, "jugg teleported to a random player");
	function_5297f8da("EWW, COOTIES", "helpful", &function_5683dce, &function_39a69067, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("I'M BROKE", "neutral", &function_2dfcbc83, &function_45dc9b66, 60, undefined, undefined, undefined, "no money dialog");
	function_5297f8da("CAN WE GET A PERK JINGLE?", "neutral", &function_8f342e41, undefined, undefined, undefined, undefined, undefined, "plays a random perk jingle");
	function_5297f8da("THIS DOORS ON ME", "neutral", &function_314448ac, undefined, undefined, undefined, undefined, undefined, "opened a random door");
	function_5297f8da("I DIDNT GET A TURN", "neutral", &function_480b8056, undefined, undefined, undefined, undefined, undefined, "moves the mystery box");
	function_5297f8da("WHAT IS THIS? BLACK OPS 4???", "neutral", &function_45f68f74, undefined, undefined, 3, undefined, undefined, undefined);
	function_5297f8da("ZOMBIES WALK", "helpful", &function_3a0b8e56, &function_da409917, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("CAFFINATED", "neutral", &function_d6fb57b6, &function_3f5de903, 30, undefined, undefined, undefined, "double movement speed");
	function_5297f8da("BOTTOMLESS CLIP", "helpful", &function_fca58d56, &stop_infinite_ammo, 30, undefined, undefined, undefined, "infinite ammo");
	function_5297f8da("UNLIMITED PERK SLOTS", "helpful", &function_3f0afd6f, &function_355267de, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("NO PERK SLOTS", "harmful", &function_ee6f3255, &function_a843af4e, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("OUT OF BODY EXPERIENCE", "harmful", &thirdperson, &function_cbac219c, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("POWERUPS FLEE PLAYERS", "harmful", &function_d84f9af7, &function_3d232c4e, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("DISORDERLY COMBAT", "neutral", &function_c75d24e3, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("SPAWN RED MAX AMMO", "harmful", &function_dae4bf1e, undefined, undefined, undefined, undefined, undefined, "zombie powerup, removes current clip");
	function_5297f8da("SPAWN RED BONUS POINTS", "harmful", &function_1ab23e70, undefined, undefined, undefined, undefined, undefined, "zombie powerup, takes random points");
	function_5297f8da("SPAWN RED PERK POWERUP", "harmful", &function_5e4bac69, undefined, undefined, undefined, undefined, undefined, "zombie powerup, takes a random perk");
	function_5297f8da("SPAWN RED CARPENTER", "harmful", &function_a2216843, undefined, undefined, undefined, undefined, undefined, "zombie powerup, destroys all barriers");
	function_5297f8da("I NEED GLASSES", "harmful", &function_806afd9a, &function_f74da493, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOMIZED PERK LOCATIONS", "neutral", &function_3d7c6349, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("TONE DEATH", "neutral", &function_e836287a, &function_8fba27d7, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("UPGRADED WALLBUYS", "helpful", &function_ee1a46cd, &function_dabdebdc, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("UPGRADED MYSTERY BOX", "helpful", &function_689e8469, &function_d68bdeba, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("TIMESHARE PERKS", "helpful", &function_a6539f1a, &function_33ae0601, 60, undefined, undefined, undefined, "random perk you keep til effects over");
	function_5297f8da("EXTRA ZOMBIES", "neutral", &function_1df9a5a5, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("YOU'VE GOTTA BE KITTING ME", "helpful", &function_d23b63ab, undefined, undefined, undefined, undefined, undefined, "random weapon kit attachments (if supported)");
	function_5297f8da("NEWTONIAN NEGATION", "neutral", &function_48ccfb4, &function_6ab25d6f, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("I LIKE THIS ONE MORE", "harmful", &function_e6abb664, undefined, undefined, undefined, undefined, undefined, "swaps to your other weapon");
	function_5297f8da("CYBERPUNK 2077", "neutral", &function_a374cec9, &function_e0335d04, 30, undefined, undefined, undefined, "t-posed zombies");
	function_5297f8da("RANDOMIZE DOOR PRICES", "neutral", &function_cca49011, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOMIZED WALLBUYS", "neutral", &function_2b9a66a7, &function_63f30232, 30, undefined, undefined, undefined, "wallbuys give random box weapons");
	function_5297f8da("SOUNDS LIKE SOMEONES BREAKING IN!", "harmful", &function_da34b2a4, undefined, undefined, undefined, undefined, undefined, "destroys all window barriers");
	function_5297f8da("POWERUPS LAST FOREVER", "helpful", &function_3aad4065, &function_9a22e068, 60, undefined, undefined, undefined, "base timed powerup effects last forever");
	function_5297f8da("BONFIRE SALE", "helpful", &function_657cfcd0, &function_da0ccb4d, 30, undefined, undefined, undefined, "pap is 20 percent normal price");
	function_5297f8da("MAKEOVER!", "neutral", &function_fd993613, undefined, undefined, undefined, undefined, undefined, "random camo (if supported)");
	function_5297f8da("SUGAR TAX", "harmful", &function_401cd31f, &function_7d0d3290, 60, undefined, undefined, undefined, "perks cost double");
	function_5297f8da("IT'S A TRAP!", "neutral", &function_da8f0f73, undefined, undefined, undefined, undefined, undefined, "activates all electric traps");
	function_5297f8da("FOG ROLLING IN", "neutral", &function_7c9cb050, &function_bdea9a37, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("FULL AMMO", "helpful", &max_ammo, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RAYGUN EVERY TIME", "neutral", &function_ef0ba2c5, &function_6f8e3f74, 30, undefined, undefined, undefined, "box only has raygun weapons");
	function_5297f8da("FULL POWER", "helpful", &function_11271f75, undefined, undefined, undefined, undefined, undefined, "fills specilist weapon power");
	function_5297f8da("EMPTY SPECIALIST POWER", "harmful", &function_4796289f, undefined, undefined, undefined, undefined, undefined, "emptys specilist weapon power");
	function_5297f8da("FAKE NUKE", "neutral", &function_86373f12, undefined, undefined, 5, undefined, undefined, undefined);
	function_5297f8da("FAKE GAME OVER", "neutral", &function_23dc0be8, undefined, undefined, 3, undefined, undefined, undefined);
	function_5297f8da("ADD A PERK SLOT", "helpful", &function_174135d4, undefined, undefined, undefined, undefined, undefined, "permament extra perk slot");
	function_5297f8da("TAKE A PERK SLOT", "harmful", &function_df419982, undefined, undefined, undefined, undefined, undefined, "permament removal of a perk slot");
	function_5297f8da("SPAWN EVERY POWERUP", "neutral", &function_b51f143f, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("POWER MAGNET", "helpful", &function_216669ac, &function_4492eb6d, 60, undefined, undefined, undefined, "powerups move to players");
	function_5297f8da("WHAT'S THE POINT?", "harmful", &function_2ee7476e, &function_f3173f05, 30, undefined, undefined, undefined, "cant earn points");
	function_5297f8da("ANTI POINT GRIND", "harmful", &function_8ed6e32f, &function_675d427c, 30, undefined, undefined, undefined, "points earned are instead negitive");
	function_5297f8da("RETURN INVESTMENT", "helpful", &function_8c9552bc, &function_6b28a53b, 60, undefined, undefined, undefined, "spent points are returned");
	function_5297f8da("SPENDING TAX", "harmful", &function_6acf0ddf, &function_4e8c4974, 60, undefined, undefined, undefined, "spent points will double");
	function_5297f8da("PURCHASES BECOME PROFIT", "helpful", &function_8e21df9e, &function_4bf7c1db, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("TRIPLE POINTS", "helpful", &function_2c6d10c1, &function_e83c62b2, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("WALL HACKS", "helpful", &function_1f18ba9f, &function_ef6a884, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM ZOMBIE SPEED", "harmful", &random_speed, &function_bca21f21, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("WEEPING ANGELS", "helpful", &function_deeb696f, &function_cfb9cfe2, 60, undefined, undefined, undefined, "zombies only move when not looked at");
	function_5297f8da("REVERSE WEEPING ANGELS", "neutral", &function_7e68c88e, &function_775bd2eb, 60, undefined, undefined, undefined, "zombies dont move when you cant see them");
	function_5297f8da("80'S ACTION HERO", "helpful", &function_b2863267, &function_d28a87a2, 60, undefined, undefined, undefined, "ammo pulled from stock");
	function_5297f8da("DANGER CLOSE", "helpful", &danger_close, &function_d8a1cf40, 90, undefined, undefined, undefined, "immune to explosives");
	function_5297f8da("WHAT'S IN THE BOX?", "harmful", &function_35ef3719, &function_f7d8bb44, 90, undefined, undefined, undefined, "box weapons are invisible");
	function_5297f8da("DISORIENTATED", "harmful", &function_d3204f6, &function_dad7a3d7, 45, undefined, undefined, undefined, "teleported constantly");
	function_5297f8da("INFINITE ZOMBIES", "harmful", &function_7dde0d0d, &function_899bb6a6, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("THE DOOR IS JAMMED!", "harmful", &function_876e2ded, &function_716011ce, 90, undefined, undefined, undefined, "doors cannot be purchased (debris still avaliable)");
	function_5297f8da("EVERY EASTER EGG BE LIKE:", "neutral", &function_eeeb7151, &function_7d11f864, 60, undefined, undefined, undefined, "human soul box");
	function_5297f8da("RANDOM AMMO", "harmful", &function_5adf9045, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM PLAYER SPEED", "harmful", &function_b319c2d0, &function_31430b83, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("QUACKNAROK", "neutral", &function_3d673c43, &function_87afd8ba, 120, undefined, undefined, undefined, undefined);
	function_5297f8da("POINTS FROM DAMAGE", "helpful", &function_66126fc0, &function_bca0596f, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("YOU GOT A PENTHOUSE?", "neutral", &function_a513f02e, undefined, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("WHO'S CALLING?", "neutral", &function_715017b, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("UHHH... WASN'T ME", "neutral", &function_e4ee60e9, &function_5ff42f00, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("RAGDOLL", "neutral", &death_ragdoll, &function_8a5a04ee, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("SUGAR RUSH", "helpful", &function_8d25cff6, &function_c8050b3b, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("GIVE RANDOM PAPED WEAPON", "neutral", &function_e2e7679, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("REPLACE ALL WEAPONS", "neutral", &function_6382180b, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("REPLACE ALL WEAPONS 2.0", "neutral", &function_96bdf36e, undefined, undefined, undefined, undefined, undefined, "replaces all weapons with paped guns");
	function_5297f8da("RANDOM WHIMSICAL GUM", "neutral", &function_292e3617, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM CLASSIC GUM", "neutral", &function_f210330e, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM MEGA GUM", "helpful", &function_12a19e46, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM RARE MEGA GUM", "helpful", &function_66a7ffd0, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM ULTRA RARE MEGA GUM", "helpful", &function_2bec33d0, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("0.25x GAME SPEED", "neutral", &function_cc6f6cb8, &function_e6cc72e1, 15, undefined, undefined, undefined, undefined);
	function_5297f8da("0.5x SPEED", "neutral", &function_118d14ab, &function_e49edba4, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("1.5x GAME SPEED", "neutral", &function_361104c0, &function_ba47fadb, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("2x GAME SPEED", "neutral", &function_3eb14f37, &function_46402da, 45, undefined, undefined, undefined, undefined);
	function_5297f8da("THE RUMBLING", "neutral", &function_39376943, &function_9c3aef2c, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("RANDOM ZOMBIE BECOMES INVINCIBLE", "harmful", &function_9a3c6b1a, &function_b1c04c6b, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("UN-PRIVATE LOBBY", "neutral", &function_3c3c6579, &function_77ae90ca, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("LARGER MAGS", "helpful", &function_5cd8988b, &function_4783a94a, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("SMALLER MAGS", "harmful", &function_90fff68f, &function_4783a94a, 90, undefined, undefined, undefined, undefined);
	function_5297f8da("SUPER SLIDE", "neutral", &function_76b4d478, &function_2fb8e0db, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("INVISIBLE GUNS", "harmful", &function_e3530071, &function_eeed2726, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("OUT OF GOBBLEGUM", "harmful", &function_1d8971d9, undefined, undefined, undefined, undefined, undefined, "gobblegum machine is maxed out");
	function_5297f8da("UNLIMITED GOBBLEGUM MACHINE", "helpful", &function_8cbc76d8, &function_ede9336f, 90, undefined, undefined, undefined, "gobblegum machine has unlimited uses");
	function_5297f8da("HOLE IN YOUR WALLET", "harmful", &function_78232fb5, &function_9f36a774, 60, undefined, undefined, undefined, "1 percent of points is lost every few seconds");
	function_5297f8da("TO THE MOOOOON!", "helpful", &function_2b26e49, &function_ecb02eb6, 60, undefined, undefined, undefined, "gain some points every few seconds");
	function_5297f8da("RIDE THE STOCK MARKET", "neutral", &function_50049952, &function_c0cc3f8d, 60, undefined, undefined, undefined, "every few seconds, gain or lose points");
	function_5297f8da("PLAYERS ACTIVATE A RANDOM TRIGGER", "neutral", &function_e41f7ff1, undefined, undefined, undefined, undefined, undefined, "a random interactable trigger is used per player");
	function_5297f8da("FAKE PERKAHOLIC", "neutral", &function_cebcd063, undefined, undefined, 4, undefined, undefined, undefined);
	function_5297f8da("SLIGHT AIM ASSIST", "helpful", &aimbot, &function_89411d46, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("RECOIL", "harmful", &recoil, &function_85ecb61a, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("REMOVE GRENADES", "harmful", &no_grenades, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("REFILL GRENADES", "helpful", &function_2a7c54c1, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("TURTLED UP", "helpful", &function_417cf277, undefined, undefined, undefined, undefined, undefined, "repaired shield or given a new one");
	function_5297f8da("LET YOUR GUARD DOWN", "harmful", &function_8b29d95f, undefined, undefined, undefined, undefined, undefined, "removed shield if one was owned");
	function_5297f8da("ON YOUR LEFT", "harmful", &function_963c03c6, &function_e480c881, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("NEGATIVE ENERGY", "harmful", &function_49c88df4, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("SPAWN RED DOUBLE POINTS", "harmful", &function_eb824ee3, undefined, undefined, undefined, undefined, undefined, "zombie powerup, can not gain points while active");
	function_5297f8da("SPAWN RED INSTA KILL", "harmful", &function_30b7e16d, undefined, undefined, undefined, undefined, undefined, "zombie powerup, can not kill zombies qhile active");
	function_5297f8da("SPAWN RED FIRE SALE", "harmful", &function_fc21ecf9, undefined, undefined, undefined, undefined, undefined, "zombie powerup, can not use mystery box while active");
	function_5297f8da("SPAWN RED NUKE", "harmful", &function_fe3b0aaa, undefined, undefined, undefined, undefined, undefined, "zombie powerup, respawns all killed zombies for the round");
	function_5297f8da("SPAWN RED DEATH MACHINE", "harmful", &function_f38d932, undefined, undefined, undefined, undefined, undefined, "zombie powerup, replaces current weapon and stops weapon swaping while active");
	function_5297f8da("ARTIST'S RENDITION", "harmful", &function_ed8f9890, undefined, undefined, undefined, undefined, undefined, "randomize wallbuy locations");
	function_5297f8da("RANDOM WALLBUY PRICES", "harmful", &function_f6a56e82, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("HAVE YOU SEEN MY CAT?", "neutral", &function_b56e4c5a, &function_f2f931a1, 30, undefined, undefined, undefined, "well now you have :D");
	function_5297f8da("POSITIVE ENERGY", "helpful", &function_66cb1c54, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("MYSTERY SOLVED", "harmful", &function_ae0e21cf, &function_6d717a28, 90, undefined, undefined, undefined, "disable mystery box");
	function_5297f8da("ANTI AIM BOT", "harmful", &function_b10009e2, &function_5ddc9f65, 30, undefined, undefined, undefined, undefined);
	function_5297f8da("WHAT ARE THOSE?", "harmful", &look_down, undefined, undefined, undefined, undefined, undefined, undefined);
	function_5297f8da("INVISIBLE PERK MACHINES", "harmful", &function_8ae107f0, &function_601b8983, 60, undefined, undefined, undefined, undefined);
	function_5297f8da("SHOOTING BLANKS", "harmful", &function_d76f9aa6, &function_9c621cbf, 100, undefined, undefined, "uses", "bullets deal no damage, fire bullets to remove effect");
	function_5297f8da("DRUNKEN PURCHASE", "neutral", &function_5d8a3546, &function_cb8588a1, 2, undefined, undefined, "uses", "purchased perks become random, buy perks to remove effect");
	function_5297f8da("POWERUPS BECOME NEGATIVE", "harmful", &function_4a36f95, &function_b6bbdc50, 2, undefined, undefined, "uses", "powerups become negative versions if avaliable, grab powerups to remove effect");
	function_5297f8da("BLOOD DEBT", "harmful", &function_b23e8643, &function_6cb4e480, 1, undefined, undefined, "rounds", "lose points when taking damage, lasts until round ends");
	function_5297f8da("NEW GAME +", "harmful", &function_766fb58b, undefined, undefined, undefined, undefined, undefined, "set round to 1");
	function_5297f8da("HIGH ROUND SPEEDRUNNER", "harmful", &function_b5ce0ba6, undefined, undefined, undefined, undefined, undefined, "set round to random round");
	function_5297f8da("DRINK MIXER", "harmful", &function_f30aedc5, undefined, undefined, undefined, undefined, undefined, "swaps each perk for a random one");
	function_5297f8da("GOING SOBER", "harmful", &function_2e6c266f, undefined, undefined, undefined, undefined, undefined, "loose all perks");
	function_39eca019("zm_zod", "THE BEAST OF TIMES", "helpful", &function_f9248726, &function_ff88f7c1, 90, undefined, undefined, undefined, "unlimited beast mode lives");
	function_39eca019("zm_zod", "THE BEAST IS RELEASED", "harmful", &function_c7a07f2d, undefined, undefined, undefined, undefined, undefined, "removes your beast lives");
	function_39eca019("zm_zod", "REKINDLE THE FLAME", "helpful", &function_159446ce, undefined, undefined, undefined, undefined, undefined, "beast mode kiosks are all reactivated");
	function_39eca019("zm_zod", "SNUFF OUT THE FLAME", "harmful", &function_fcc6bba5, undefined, undefined, undefined, undefined, undefined, "beast mode kiosks are all de-activated for the round");
	function_39eca019("zm_zod", "KLAUS?", "neutral", &function_b83c9141, undefined, undefined, undefined, undefined, undefined, "activates the civil protector");
	function_39eca019("zm_factory", "ACTIVATE TELEPORTER", "neutral", &function_a026e916, undefined, undefined, undefined, undefined, undefined, undefined);
	function_39eca019("zm_castle", "TAKE THE PLUNGE", "neutral", &function_602d3342, undefined, undefined, undefined, undefined, undefined, undefined);
	function_39eca019("zm_castle", "BLAST OFF!", "neutral", &function_884ba8ec, undefined, undefined, undefined, undefined, undefined, "set off the rocket test if able to");
	function_39eca019("zm_castle", "BALL ROOM BLAST", "neutral", &disco_inferno, undefined, undefined, undefined, undefined, undefined, "disco in the grand hall");
	function_39eca019("zm_island", "SOMETHING SEEDY", "helpful", &function_366207d1, &function_5480383e, 60, undefined, undefined, undefined, "unlimited seeds");
	function_39eca019("zm_island", "RANDOM WATER", "neutral", &function_d43085f8, undefined, undefined, undefined, undefined, undefined, "bucket is filled with random water");
	function_39eca019("zm_island", "NO SEEDS", "harmful", &function_d141481b, undefined, undefined, undefined, undefined, undefined, undefined);
	function_39eca019("zm_island", "GET OUT OF MY SWAMP", "harmful", &function_f2d4d971, undefined, undefined, undefined, undefined, undefined, "spawns multiple thrashers");
	function_39eca019("zm_island", "ARACHNOPHILIA", "harmful", &function_a641e0ed, undefined, undefined, undefined, undefined, undefined, "spawns multiple spiders per player");
	function_39eca019("zm_island", "GARDEN WARFARE", "neutral", &function_a0cd20cb, undefined, undefined, undefined, undefined, undefined, "plants a seed at all avaliable planters");
	function_39eca019("zm_island", "HOLE IN THE BUCKET", "harmful", &function_ed749fad, undefined, undefined, undefined, undefined, undefined, "emptys all buckets");
	function_39eca019("zm_stalingrad", "MANGLED PATROL", "harmful", &function_9c3bbe3c, undefined, undefined, undefined, undefined, undefined, "spawns manglers");
	function_39eca019("zm_stalingrad", "WHAT'S A GROPH MODULE?", "neutral", &function_bba2a762, undefined, undefined, undefined, undefined, undefined, "spawns a Groph Pod");
	function_39eca019("zm_stalingrad", "FLIGHT OF THE...", "harmful", &function_1d99726c, undefined, undefined, undefined, undefined, undefined, "spawns valkyrie drones");
	function_39eca019("zm_stalingrad", "DRAGON FIRE AND FLAMES", "harmful", &function_cebf0421, &function_bb5b21a2, 60, undefined, undefined, undefined, "all zombies become fire zombies");
	function_39eca019("zm_genesis", "MAD HATTER", "helpful", &function_2d773f5f, undefined, undefined, undefined, undefined, undefined, "gives a random hat or mask");
	function_39eca019("zm_theater", "ACTIVATE TELEPORTER", "harmful", &function_e56feaaf, undefined, undefined, undefined, undefined, undefined, undefined);
	function_39eca019("zm_temple", "360 MIC GUY", "harmful", &function_4dcf66c3, undefined, undefined, undefined, undefined, undefined, "spawns a sonic zombie");
	function_39eca019("zm_temple", "WATER MAN", "harmful", &function_9a7c7f6e, undefined, undefined, undefined, undefined, undefined, "spawns a napalm zombie");
	function_39eca019("zm_moon", "ANTI ANTI GRAVITY", "neutral", &function_559e5357, &function_ff99bb12, 60, undefined, undefined, undefined, "swaps low and normal gravity");
	function_39eca019("zm_moon", "MINER INCONVENIENCE", "harmful", &function_5a3a09af, undefined, undefined, undefined, undefined, undefined, "activates a digger");
	function_39eca019("zm_moon", "DEAD SPACE 2", "harmful", &function_bde64b1e, undefined, undefined, undefined, undefined, undefined, "spawns astronaut zombie");
	function_39eca019("zm_moon", "QUANTUM CHAOS", "neutral", &function_83bc964d, undefined, undefined, undefined, undefined, undefined, "activates a random QED effect on each player");
	function_39eca019("zm_tomb", "SPAWN DIG SPOTS", "helpful", &function_3d9bcd5, undefined, undefined, undefined, undefined, undefined, undefined);
	function_39eca019("zm_tomb", "DUG TOO DEEP", "harmful", &function_8d66a75f, undefined, undefined, undefined, undefined, undefined, "removes and respawns all shovels");
	function_39eca019("zm_tomb", "MASTER EXCAVATOR", "neutral", &function_441e906a, undefined, undefined, undefined, undefined, undefined, "activate all dig spots triggers");
	function_39eca019("zm_tomb", "TANKED", "neutral", &function_a82bee74, undefined, undefined, undefined, undefined, undefined, "activate the tank if able to");
	function_39eca019("zm_tomb", "CRUSADE", "harmful", &function_55c01e37, undefined, undefined, undefined, undefined, undefined, "spawns a templar crusade");
	function_39eca019("zm_tomb", "AMAZON DRONE DELIVERY", "neutral", &function_f6ce070, undefined, undefined, undefined, undefined, undefined, "spawns a maxis drone");
}

/*
	Name: function_a06dcf2d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x76D0
	Size: 0x390
	Parameters: 0
	Flags: None
	Line Number: 337
*/
function function_a06dcf2d()
{
	wait(0.1);
	level flag::wait_till("initial_blackscreen_passed");
	if(GetPlayers().size > 1)
	{
		function_5297f8da("COMMUNISM", "neutral", &function_c727ae27, &function_7bc413fc, 60, undefined, undefined, undefined, "when a player obtains a gun, perk or gum, everyone gets it");
		function_5297f8da("SOCIALISM", "neutral", &function_75f6cce9, undefined, undefined, undefined, undefined, undefined, "points are evenly distributed among players");
		function_5297f8da("CAPITALISM", "harmful", &function_d7474e31, undefined, undefined, undefined, undefined, undefined, "player with the most points get all points from other players");
		function_5297f8da("ALL FOR ONE", "harmful", &function_b830f207, undefined, undefined, undefined, undefined, undefined, "a random player gets everyones points");
		function_5297f8da("INVISIBILITY CLOAK", "neutral", &function_12f5266e, &function_58c0da73, 60, undefined, undefined, undefined, "players are invisible to each other");
		function_5297f8da("CHANGE PLACES!", "neutral", &function_a43ee2fe, undefined, undefined, undefined, undefined, undefined, "players will randomly swap locations");
		function_5297f8da("FRIENDLY FIRE", "harmful", &friendly_fire, &function_460cc964, 30, undefined, undefined, undefined, undefined);
		function_5297f8da("BULLETS REVIVE PLAYERS", "helpful", &function_8d10c739, &function_c9ee6d8c, 120, undefined, undefined, undefined, undefined);
	}
	function_66a8387c(&function_899017bb, "METAL GEAR FALLING", "harmful", &function_b76c881, undefined, undefined, undefined, undefined, undefined, "spawn a panzer soldat");
	function_66a8387c(&function_b0ffd23c, "TRIPPLE HEADER", "harmful", &function_8bcb72e9, undefined, undefined, undefined, undefined, undefined, "spawn a margwa");
	function_66a8387c(&function_48106456, "QUAD SQUAD", "harmful", &function_ad782ffb, undefined, undefined, undefined, undefined, undefined, "spawn quad zombies");
	if(isdefined(level.var_2ca1c0d4))
	{
		level [[level.var_2ca1c0d4]]();
	}
}

/*
	Name: function_6d7afc72
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x7A68
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 371
*/
function function_6d7afc72()
{
	level waittill("end_game");
	if(level.var_e8c32e9b == 1)
	{
		var_b4e8522c = namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 30, 1, (1, 1, 1), "ONLY " + level.var_e8c32e9b + " EFFECT WAS TRIGGERED", 2);
	}
	else
	{
		var_b4e8522c = namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 30, 1, (1, 1, 1), level.var_e8c32e9b + " TOTAL EFFECTS WERE TRIGGERED", 2);
	}
}

/*
	Name: register_player_friendly_fire_callback
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x7B58
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 394
*/
function register_player_friendly_fire_callback(callback)
{
	if(!isdefined(level.player_friendly_fire_callbacks))
	{
		level.player_friendly_fire_callbacks = [];
	}
	level.player_friendly_fire_callbacks[level.player_friendly_fire_callbacks.size] = callback;
}

/*
	Name: __main__
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x7BA0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 413
*/
function __main__()
{
	level thread function_886a333c();
	level thread function_a06dcf2d();
}

/*
	Name: function_e103d400
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x7BE0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 429
*/
function function_e103d400()
{
	while(1)
	{
		level waittill("start_of_round");
		level.var_2ae5808e = 0;
		level waittill("end_of_round");
		level.var_2ae5808e = 1;
	}
}

/*
	Name: function_886a333c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x7C28
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 450
*/
function function_886a333c()
{
	level flag::wait_till("reap_collection_loaded");
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_enabled") == 0)
	{
		return;
	}
	level.var_38691b95 = namespace_11e193f1::function_6dd41714("gamemode_chaos_timer");
	if(level.var_38691b95 < 5)
	{
		level.var_38691b95 = 5;
	}
	if(level.var_38691b95 > 60)
	{
		level.var_38691b95 = 60;
	}
	level.var_19b99e49 = 0;
	level.var_af6a5fe7 = 0;
	level.var_f35c0c45 = 0;
	level.var_bf1408b6 = 0;
	level.var_5246bdd = 0;
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_meta") == 1)
	{
		level.var_19b99e49 = 1;
	}
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_tele") == 1)
	{
		level.var_af6a5fe7 = 1;
	}
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_perk_tele") == 1)
	{
		level.var_f35c0c45 = 1;
	}
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_exper") == 1)
	{
		level.var_bf1408b6 = 1;
	}
	if(namespace_11e193f1::function_6dd41714("gamemode_chaos_nogun") == 1)
	{
		level.var_5246bdd = 1;
	}
	level thread function_6d7afc72();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].var_79118c76 = namespace_11e193f1::function_6dd41714("gamemode_chaos_position");
		players[i].var_4c448eaf = namespace_11e193f1::function_6dd41714("gamemode_chaos_assist");
	}
	level notify("hash_6bacc34b");
	if(isdefined(level.var_ed12d468))
	{
		level [[level.var_ed12d468]]();
	}
	if(!isdefined(level.var_e4297151))
	{
		level.var_e4297151 = [];
	}
	if(!level.var_bf1408b6)
	{
		level.var_e4297151["NEW GAME +"] = 1;
		level.var_e4297151["HIGH ROUND SPEEDRUNNER"] = 1;
		level.var_e4297151["DRINK MIXER"] = 1;
		level.var_e4297151["GOING SOBER"] = 1;
	}
	if(!level.var_af6a5fe7)
	{
		level.var_e4297151["RANDOM TELEPORT"] = 1;
		level.var_e4297151["DISORIENTATED"] = 1;
		level.var_e4297151["CHANGE PLACES!"] = 1;
	}
	if(!level.var_f35c0c45)
	{
		level.var_e4297151["RANDOMIZED PERK LOCATIONS"] = 1;
		level.var_e4297151["I FOUND JUGG!"] = 1;
	}
	if(level.var_5246bdd)
	{
		level.var_e4297151["GIVE RANDOM WEAPON"] = 1;
		level.var_e4297151["GIVE RANDOM PAPED WEAPON"] = 1;
		level.var_e4297151["REPLACE ALL WEAPONS"] = 1;
		level.var_e4297151["REPLACE ALL WEAPONS 2.0"] = 1;
	}
	level thread function_d3a2f7b();
}

/*
	Name: function_c32f781a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x8070
	Size: 0xE0
	Parameters: 5
	Flags: None
	Line Number: 545
*/
function function_c32f781a(name, func, var_e4126370, var_1e50cdba, var_24814e80)
{
	if(!isdefined(level.var_5dc446f5))
	{
		level.var_5dc446f5 = [];
	}
	effect = spawnstruct();
	effect.name = name;
	effect.func = func;
	effect.var_e4126370 = var_e4126370;
	effect.var_1e50cdba = var_1e50cdba;
	effect.var_24814e80 = var_24814e80;
	level.var_5dc446f5[level.var_5dc446f5.size] = effect;
}

/*
	Name: function_39eca019
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x8158
	Size: 0xB8
	Parameters: 10
	Flags: None
	Line Number: 570
*/
function function_39eca019(MapName, name, effect_type, func, var_e4126370, var_1e50cdba, var_24814e80, var_3aaeaede, var_3cd68155, var_1174cec5)
{
	if(!isdefined(effect_type))
	{
		effect_type = "neutral";
	}
	if(level.script == MapName)
	{
		function_5297f8da(name, effect_type, func, var_e4126370, var_1e50cdba, var_24814e80, var_3aaeaede, var_3cd68155, var_1174cec5);
		return;
	}
	waittillframeend;
}

/*
	Name: function_66a8387c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x8218
	Size: 0xB0
	Parameters: 10
	Flags: None
	Line Number: 594
*/
function function_66a8387c(var_1dc7c785, name, effect_type, func, var_e4126370, var_1e50cdba, var_24814e80, var_3aaeaede, var_3cd68155, var_1174cec5)
{
	if(!isdefined(effect_type))
	{
		effect_type = "neutral";
	}
	if([[var_1dc7c785]]())
	{
		function_5297f8da(name, effect_type, func, var_e4126370, var_1e50cdba, var_24814e80, var_1174cec5);
		return;
	}
}

/*
	Name: function_5297f8da
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x82D0
	Size: 0x1B0
	Parameters: 9
	Flags: None
	Line Number: 617
*/
function function_5297f8da(name, effect_type, func, var_e4126370, var_1e50cdba, var_24814e80, var_3aaeaede, var_3cd68155, var_1174cec5)
{
	if(!isdefined(effect_type))
	{
		effect_type = "neutral";
	}
	if(!isdefined(level.var_d384dc75))
	{
		level.var_d384dc75 = [];
	}
	effect = spawnstruct();
	if(isdefined(name))
	{
		effect.name = name;
	}
	if(isdefined(effect_type))
	{
		effect.effect_type = effect_type;
	}
	if(isdefined(func))
	{
		effect.func = func;
	}
	if(isdefined(var_e4126370))
	{
		effect.var_e4126370 = var_e4126370;
	}
	if(isdefined(var_1e50cdba))
	{
		effect.var_1e50cdba = var_1e50cdba;
	}
	if(isdefined(var_24814e80))
	{
		effect.var_24814e80 = var_24814e80;
	}
	if(isdefined(var_3aaeaede))
	{
		effect.var_3aaeaede = var_3aaeaede;
	}
	if(isdefined(var_3cd68155))
	{
		effect.var_3cd68155 = var_3cd68155;
	}
	if(isdefined(var_1174cec5))
	{
		effect.var_1174cec5 = var_1174cec5;
	}
	level.var_d384dc75[level.var_d384dc75.size] = effect;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d3a2f7b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x8488
	Size: 0xAE8
	Parameters: 0
	Flags: None
	Line Number: 679
*/
function function_d3a2f7b()
{
	if(level.var_19b99e49)
	{
		level thread function_ee2d0eb9();
	}
	level thread function_27062fac();
	level thread function_70e8b127();
	IPrintLnBold(level.var_d384dc75.size + " chaos effects loaded");
	while(1)
	{
		max_time = level.var_38691b95;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(!isdefined(players[i].var_79118c76))
			{
				players[i].var_79118c76 = 0;
			}
			if(!isdefined(players[i].var_ef747fcf))
			{
				if(players[i].var_79118c76 == 0)
				{
					players[i].var_ef747fcf = players[i] namespace_851dc78f::function_122a9928("right", "top", "right", "top", -10, 15, 1, (1, 1, 1), "", 1.2);
				}
				else if(players[i].var_79118c76 == 1)
				{
					players[i].var_ef747fcf = players[i] namespace_851dc78f::function_122a9928("left", "top", "left", "top", 10, 15, 1, (1, 1, 1), "", 1.2);
				}
				else if(players[i].var_79118c76 == 2)
				{
					players[i].var_ef747fcf = players[i] namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 15, 1, (1, 1, 1), "", 1.2);
				}
				if(isdefined(players[i].var_ef747fcf))
				{
					players[i].var_ef747fcf thread function_4e55b0ce();
				}
			}
			if(!isdefined(players[i].var_d2e3f57c))
			{
				if(players[i].var_79118c76 == 0)
				{
					players[i].var_d2e3f57c = players[i] namespace_851dc78f::function_7d15591a("left", "top", "right", "top", -300, 0, 1, "white", 5, 12, VectorScale((0, 0, 1), 0.8), -1);
				}
				else if(players[i].var_79118c76 == 1)
				{
					players[i].var_d2e3f57c = players[i] namespace_851dc78f::function_7d15591a("left", "top", "left", "top", 0, 0, 1, "white", 5, 12, VectorScale((0, 0, 1), 0.8), -1);
				}
				else if(players[i].var_79118c76 == 2)
				{
					players[i].var_d2e3f57c = players[i] namespace_851dc78f::function_7d15591a("center", "top", "center", "top", 0, 0, 1, "white", 5, 12, VectorScale((0, 0, 1), 0.8), -1);
				}
			}
			if(!isdefined(players[i].var_1adc0bba))
			{
				if(players[i].var_79118c76 == 0)
				{
					players[i].var_1adc0bba = players[i] namespace_851dc78f::function_7d15591a("left", "top", "right", "top", -300, 0, 1, "white", 300, 12, (0, 0, 0), -2);
					continue;
				}
				if(players[i].var_79118c76 == 1)
				{
					players[i].var_1adc0bba = players[i] namespace_851dc78f::function_7d15591a("left", "top", "left", "top", 0, 0, 1, "white", 300, 12, (0, 0, 0), -2);
					continue;
				}
				if(players[i].var_79118c76 == 2)
				{
					players[i].var_1adc0bba = players[i] namespace_851dc78f::function_7d15591a("center", "top", "center", "top", 0, 0, 1, "white", 300, 12, (0, 0, 0), -2);
				}
			}
		}
		time = max_time;
		while(time > 0)
		{
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(isdefined(players[i].var_d2e3f57c))
				{
					players[i].var_d2e3f57c SetShader("white", Int(300 - time / max_time * 300), 12);
				}
			}
			while(isdefined(level.var_4f89c429))
			{
				wait(0.1);
			}
			if(isdefined(level.var_e4297151["DOUBLE CHAOS TIMER (META)"]))
			{
				time = time - 0.1;
			}
			time = time - 0.1;
			wait(0.1);
		}
		var_ad941009 = 1;
		if(isdefined(level.var_e4297151["DOUBLE CHAOS (META)"]))
		{
			var_ad941009 = 2;
		}
		while(var_ad941009 > 0)
		{
			effects = Array::randomize(level.var_d384dc75);
			for(i = 0; i < effects.size; i++)
			{
				can_use = 1;
				EFF = effects[i];
				if(isdefined(level.var_e4297151[EFF.name]))
				{
					can_use = 0;
				}
				if(isdefined(level.var_e4297151["NEGATIVE EFFECTS ONLY (META)"]) && EFF.effect_type != "harmful")
				{
					can_use = 0;
				}
				if(isdefined(level.var_e4297151["POSITIVE EFFECTS ONLY (META)"]) && EFF.effect_type != "helpful")
				{
					can_use = 0;
				}
				if(level.var_6b394783 > 0 && EFF.var_3cd68155 == "uses")
				{
					can_use = 0;
				}
				if(level.var_fb54f598 > 0 && EFF.var_3cd68155 == "rounds")
				{
					can_use = 0;
				}
				if(level.var_72d4ff22 >= 4 && isdefined(EFF.var_1e50cdba) && EFF.var_1e50cdba > 0)
				{
					can_use = 0;
				}
				if(can_use)
				{
					level thread function_54c31dad(EFF, max_time);
					var_ad941009 = var_ad941009 - 1;
					break;
				}
			}
			util::wait_network_frame();
		}
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i].var_d2e3f57c))
			{
				players[i].var_d2e3f57c destroy();
				players[i].var_d2e3f57c = undefined;
			}
			if(isdefined(players[i].var_1adc0bba))
			{
				players[i].var_1adc0bba destroy();
				players[i].var_1adc0bba = undefined;
			}
		}
	}
}

/*
	Name: function_ee2d0eb9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x8F78
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 844
*/
function function_ee2d0eb9()
{
	while(1)
	{
		time_to_wait = RandomInt(level.var_38691b95 * 2) + 5 * RandomInt(level.var_38691b95 * 2) + 5;
		while(time_to_wait > 0)
		{
			time_to_wait = time_to_wait - 0.1;
			wait(0.1);
		}
		can_use = 1;
		effects = Array::randomize(level.var_5dc446f5);
		for(i = 0; i < effects.size; i++)
		{
			can_use = 1;
			EFF = effects[i];
			if(isdefined(level.var_e4297151[EFF.name]))
			{
				can_use = 0;
			}
			if(isdefined(level.var_e4297151["NEGATIVE EFFECTS ONLY (META)"]) && EFF.name == "POSITIVE EFFECTS ONLY (META)")
			{
				can_use = 0;
			}
			if(isdefined(level.var_e4297151["POSITIVE EFFECTS ONLY (META)"]) && EFF.name == "NEGATIVE EFFECTS ONLY (META)")
			{
				can_use = 0;
			}
			if(can_use)
			{
				level thread function_54c31dad(EFF, level.var_38691b95, 1);
				break;
			}
		}
		util::wait_network_frame();
	}
}

/*
	Name: function_54c31dad
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x9170
	Size: 0x220
	Parameters: 3
	Flags: None
	Line Number: 892
*/
function function_54c31dad(var_1d4cdbfa, max_time, var_29e554f3)
{
	if(!isdefined(var_29e554f3))
	{
		var_29e554f3 = 0;
	}
	if(isdefined(var_1d4cdbfa.func))
	{
		level thread [[var_1d4cdbfa.func]]();
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_ca5e7ad4(var_1d4cdbfa, max_time, var_29e554f3);
	}
	if(isdefined(var_1d4cdbfa.var_1e50cdba))
	{
		level.var_72d4ff22++;
		time = var_1d4cdbfa.var_1e50cdba;
		while(time > 0)
		{
			if(isdefined(var_1d4cdbfa.var_3cd68155) && var_1d4cdbfa.var_3cd68155 == "uses")
			{
				time = level.var_6b394783;
			}
			if(isdefined(var_1d4cdbfa.var_3cd68155) && var_1d4cdbfa.var_3cd68155 == "rounds")
			{
				level waittill("between_round_over");
				time = time - 1;
				level.var_fb54f598 = time;
			}
			else
			{
				time = time - 0.1;
				if(isdefined(level.var_e4297151["DOUBLE EFFECT TIME (META)"]))
				{
					wait(0.1);
				}
			}
			wait(0.1);
		}
		level.var_72d4ff22--;
	}
	if(isdefined(var_1d4cdbfa.var_e4126370))
	{
		level thread [[var_1d4cdbfa.var_e4126370]]();
	}
}

/*
	Name: function_ca5e7ad4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x9398
	Size: 0x6B8
	Parameters: 3
	Flags: None
	Line Number: 951
*/
function function_ca5e7ad4(var_1d4cdbfa, max_time, var_29e554f3)
{
	if(isdefined(self.var_2b920116))
	{
		while(isdefined(self.var_2b920116))
		{
			wait(0.05);
		}
	}
	self.var_2b920116 = 1;
	var_b92c3813 = undefined;
	if(isdefined(var_1d4cdbfa.var_24814e80))
	{
		wait(var_1d4cdbfa.var_24814e80);
	}
	level.var_e8c32e9b++;
	text = undefined;
	bar = undefined;
	var_22e35fe = undefined;
	if(!isdefined(level.var_e4297151))
	{
		level.var_e4297151 = [];
	}
	level.var_e4297151[var_1d4cdbfa.name] = 1;
	if(self.var_4c448eaf == 1 && isdefined(var_1d4cdbfa.var_1174cec5))
	{
		self.var_ef747fcf setText(var_1d4cdbfa.var_1174cec5);
	}
	else
	{
		self.var_ef747fcf setText("");
	}
	if(self.var_79118c76 == 0)
	{
		text = self namespace_851dc78f::function_122a9928("right", "top", "right", "top", -10, 40, 1, (1, 1, 1), var_1d4cdbfa.name, 1.2);
		text.var_12b2b82 = text.y;
	}
	else if(self.var_79118c76 == 1)
	{
		text = self namespace_851dc78f::function_122a9928("left", "top", "left", "top", 10, 40, 1, (1, 1, 1), var_1d4cdbfa.name, 1.2);
		text.var_12b2b82 = text.y;
	}
	else if(self.var_79118c76 == 2)
	{
		text = self namespace_851dc78f::function_122a9928("center", "top", "center", "top", 0, 20, 1, (1, 1, 1), var_1d4cdbfa.name, 1.2);
		text.var_12b2b82 = text.y;
	}
	text.var_1d4cdbfa = var_1d4cdbfa.name;
	if(isdefined(var_1d4cdbfa.var_1e50cdba))
	{
		if(self.var_79118c76 == 0)
		{
			bar = self namespace_851dc78f::function_7d15591a("left", "top", "right", "top", -110, 40, 1, "white", 100, 11, (0, 0, 1), -1);
			text.bar = bar;
			text.var_22e35fe = var_22e35fe;
		}
		else if(self.var_79118c76 == 1)
		{
			bar = self namespace_851dc78f::function_7d15591a("left", "top", "left", "top", 10, 40, 1, "white", 100, 11, (0, 0, 1), -1);
			text.bar = bar;
			text.var_22e35fe = var_22e35fe;
		}
		if(self.var_79118c76 == 2)
		{
			bar = self namespace_851dc78f::function_7d15591a("center", "top", "center", "top", 0, 20, 1, "white", 100, 11, (0, 0, 1), -1);
			text.bar = bar;
			text.var_22e35fe = var_22e35fe;
		}
	}
	if(!var_29e554f3)
	{
		text thread function_4e55b0ce();
		if(isdefined(bar))
		{
			bar thread function_4e55b0ce();
		}
		if(isdefined(var_22e35fe))
		{
			var_22e35fe thread function_4e55b0ce();
		}
	}
	if(isdefined(var_1d4cdbfa.var_3cd68155) && isdefined(var_1d4cdbfa.var_1e50cdba))
	{
		if(var_1d4cdbfa.var_3cd68155 == "uses")
		{
			bar.color = (1, 0.5, 0);
			level.var_6b394783 = var_1d4cdbfa.var_1e50cdba;
		}
		if(var_1d4cdbfa.var_3cd68155 == "rounds")
		{
			bar.color = VectorScale((0, 1, 0), 0.7);
			level.var_fb54f598 = var_1d4cdbfa.var_1e50cdba;
		}
	}
	if(isdefined(bar))
	{
		self thread function_3d0fdeae(var_1d4cdbfa.var_1e50cdba, bar, var_22e35fe, text, var_1d4cdbfa.var_3cd68155);
	}
	if(!isdefined(self.var_b5ab77f2))
	{
		self.var_b5ab77f2 = [];
	}
	Array::add(self.var_b5ab77f2, text);
	self function_5f983fb2();
	self.var_2b920116 = undefined;
}

/*
	Name: function_5f983fb2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x9A58
	Size: 0x318
	Parameters: 0
	Flags: None
	Line Number: 1068
*/
function function_5f983fb2()
{
	limit = 4;
	wait(0.05);
	for(i = 0; i < self.var_b5ab77f2.size; i++)
	{
		if(!isdefined(self.var_b5ab77f2[i].bar))
		{
			if(i < limit && self.var_b5ab77f2.size > limit)
			{
				var_63ca6ac = self.var_b5ab77f2[i];
				level.var_e4297151[self.var_b5ab77f2[i].var_1d4cdbfa] = undefined;
				ArrayRemoveValue(self.var_b5ab77f2, self.var_b5ab77f2[i]);
				if(isdefined(var_63ca6ac))
				{
					var_63ca6ac destroy();
				}
			}
		}
	}
	wait(0.05);
	for(i = 0; i < self.var_b5ab77f2.size; i++)
	{
		var_63ca6ac = self.var_b5ab77f2[i];
		var_63ca6ac MoveOverTime(0.2);
		var_63ca6ac.y = var_63ca6ac.var_12b2b82 + 22 * self.var_b5ab77f2.size - i;
		if(isdefined(var_63ca6ac.bar))
		{
			var_63ca6ac.bar.y = var_63ca6ac.var_12b2b82 + 22 * self.var_b5ab77f2.size - i - 1;
			var_63ca6ac.bar MoveOverTime(0.2);
			var_63ca6ac.bar.y = var_63ca6ac.var_12b2b82 + 22 * self.var_b5ab77f2.size - i;
		}
		if(isdefined(var_63ca6ac.var_22e35fe))
		{
			var_63ca6ac.var_22e35fe.y = var_63ca6ac.var_12b2b82 + 22 * self.var_b5ab77f2.size - i - 1;
			var_63ca6ac.var_22e35fe MoveOverTime(0.2);
			var_63ca6ac.var_22e35fe.y = var_63ca6ac.var_12b2b82 + 22 * self.var_b5ab77f2.size - i;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3d0fdeae
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x9D78
	Size: 0x1C0
	Parameters: 5
	Flags: None
	Line Number: 1121
*/
function function_3d0fdeae(time, bar, var_22e35fe, text, var_3cd68155)
{
	max_time = time;
	while(time > 0)
	{
		if(isdefined(var_3cd68155) && var_3cd68155 == "uses")
		{
			time = level.var_6b394783;
		}
		if(isdefined(var_3cd68155) && var_3cd68155 == "rounds")
		{
			level waittill("between_round_over");
			time = time - 1;
		}
		else
		{
			time = time - 0.1;
			if(isdefined(level.var_e4297151["DOUBLE EFFECT TIME (META)"]))
			{
				wait(0.1);
			}
		}
		wait(0.1);
		if(isdefined(bar))
		{
			bar SetShader("white", Int(time / max_time * 100), 11);
		}
	}
	if(isdefined(bar))
	{
		bar destroy();
		bar = undefined;
	}
	if(isdefined(var_22e35fe))
	{
		var_22e35fe destroy();
		var_22e35fe = undefined;
	}
	text.bar = undefined;
	text.var_22e35fe = undefined;
	self thread function_5f983fb2();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4bf4ac40
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x9F40
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1176
*/
function function_4bf4ac40()
{
	valid = [];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]))
		{
			valid[valid.size] = players[i];
		}
	}
	return valid[RandomInt(valid.size)];
}

/*
	Name: function_4e55b0ce
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x9FF8
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1200
*/
function function_4e55b0ce()
{
	while(isdefined(self))
	{
		if(isdefined(level.var_e4297151["HIDDEN EFFECTS (META)"]) || isdefined(self.var_bee64db3))
		{
			self.alpha = 0;
		}
		else
		{
			self.alpha = 1;
		}
		wait(0.2);
	}
}

/*
	Name: function_db145f0b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA058
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1226
*/
function function_db145f0b(func)
{
	if(!isdefined(level.var_27062fac))
	{
		level.var_27062fac = [];
	}
	level.var_27062fac[level.var_27062fac.size] = func;
}

/*
	Name: function_1fb9469c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA0A0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1245
*/
function function_1fb9469c(func)
{
	if(!isdefined(level.var_27062fac))
	{
		level.var_27062fac = [];
	}
	ArrayRemoveValue(level.var_27062fac, func);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_27062fac
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA0F0
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1266
*/
function function_27062fac()
{
	while(1)
	{
		level waittill("earned_points", player, points);
		if(isdefined(level.var_27062fac))
		{
			for(i = 0; i < level.var_27062fac.size; i++)
			{
				points = [[level.var_27062fac[i]]](points);
			}
		}
		else if(isdefined(level.var_27062fac) && level.var_27062fac.size > 0)
		{
			player.score = player.score + points;
			if(player.score < 0)
			{
				player.score = 0;
			}
			player.pers["score"] = player.score;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_341018ec
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA210
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1302
*/
function function_341018ec(func)
{
	if(!isdefined(level.var_70e8b127))
	{
		level.var_70e8b127 = [];
	}
	level.var_70e8b127[level.var_70e8b127.size] = func;
}

/*
	Name: function_568a36b7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA258
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 1321
*/
function function_568a36b7(func)
{
	if(!isdefined(level.var_70e8b127))
	{
		level.var_70e8b127 = [];
	}
	ArrayRemoveValue(level.var_70e8b127, func);
}

/*
	Name: function_70e8b127
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA2A8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 1340
*/
function function_70e8b127()
{
	while(1)
	{
		level waittill("spent_points", player, points);
		if(isdefined(level.var_70e8b127))
		{
			for(i = 0; i < level.var_70e8b127.size; i++)
			{
				points = [[level.var_70e8b127[i]]](points);
			}
		}
		else if(isdefined(level.var_70e8b127) && level.var_70e8b127.size > 0)
		{
			player.score = player.score + points;
			if(player.score < 0)
			{
				player.score = 0;
			}
			player.pers["score"] = player.score;
		}
	}
}

/*
	Name: function_899017bb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA3C8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 1374
*/
function function_899017bb()
{
	if(level.script == "zm_tomb" || level.script == "zm_genesis" || level.script == "zm_castle")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_b0ffd23c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA418
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 1393
*/
function function_b0ffd23c()
{
	if(level.script == "zm_zod" || level.script == "zm_genesis")
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_48106456
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA458
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1412
*/
function function_48106456()
{
	if(isdefined(level.quad_spawners) && level.quad_spawners.size > 0 || GetEntArray("quad_zombie_spawner", "script_noteworthy").size > 0)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_fe07ead9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA4B8
	Size: 0x358
	Parameters: 2
	Flags: None
	Line Number: 1431
*/
function function_fe07ead9(icon, time)
{
	level notify(icon + "_icon_added");
	level endon(icon + "_icon_added");
	level thread function_348b9c08();
	if(!isdefined(level.var_5c4fd78b))
	{
		level.var_5c4fd78b = [];
	}
	var_d8cb7b79 = undefined;
	if(!isdefined(level.var_5c4fd78b[icon]))
	{
		level.var_5c4fd78b[icon] = namespace_851dc78f::function_7d15591a("center", "bottom", "center", "bottom", 0, -32, 1, icon, 32, 32, (1, 1, 1), -1);
		var_d8cb7b79 = level.var_5c4fd78b[icon];
	}
	else
	{
		var_d8cb7b79 = level.var_5c4fd78b[icon];
	}
	level notify("hash_348b9c08");
	var_d8cb7b79.alpha = 1;
	var_d8cb7b79.in_use = 1;
	wait(time - 15);
	level notify("hash_348b9c08");
	timer = 15;
	while(timer > 0)
	{
		if(timer < 5)
		{
			wait(0.1);
			var_d8cb7b79 fadeOverTime(0.1);
			var_d8cb7b79.alpha = 0;
			wait(0.1);
			timer = timer - 0.2;
		}
		else if(timer < 10)
		{
			wait(0.2);
			var_d8cb7b79 fadeOverTime(0.2);
			var_d8cb7b79.alpha = 0;
			wait(0.18);
			timer = timer - 0.38;
		}
		var_d8cb7b79 fadeOverTime(0.2);
		var_d8cb7b79.alpha = 1;
		wait(0.05);
		timer = timer - 0.05;
		while(isdefined(level.var_e4297151["POWERUPS LAST FOREVER"]))
		{
			wait(0.1);
		}
	}
	level.var_5c4fd78b = Array::remove_index(level.var_5c4fd78b, icon);
	level.var_5c4fd78b = Array::remove_undefined(level.var_5c4fd78b, 1);
	var_d8cb7b79 fadeOverTime(0.2);
	var_d8cb7b79.alpha = 0;
	var_d8cb7b79.in_use = 0;
	level.var_5c4fd78b[icon] = undefined;
	level notify("hash_348b9c08");
}

/*
	Name: function_348b9c08
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xA818
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 1502
*/
function function_348b9c08()
{
	level notify("hash_fcb52323");
	level endon("hash_fcb52323");
	while(1)
	{
		level waittill("hash_348b9c08");
		keys = getArrayKeys(level.var_5c4fd78b);
		level.var_5c4fd78b = Array::remove_undefined(level.var_5c4fd78b, 1);
		if(keys.size > 0 && level.var_5c4fd78b.size > 0)
		{
			var_15e53be7 = 0;
			Used = 0;
			for(i = 0; i < level.var_5c4fd78b.size; i++)
			{
				if(isdefined(level.var_5c4fd78b[keys[i]]) && level.var_5c4fd78b[keys[i]].in_use)
				{
					var_15e53be7++;
				}
			}
			for(i = 0; i < level.var_5c4fd78b.size; i++)
			{
				if(isdefined(level.var_5c4fd78b[keys[i]]) && level.var_5c4fd78b[keys[i]].in_use)
				{
					level.var_5c4fd78b[keys[i]] MoveOverTime(0.25);
					level.var_5c4fd78b[keys[i]].x = -17 * var_15e53be7 + Used * 34 + 17;
					Used++;
				}
			}
		}
		wait(0.01);
	}
}

/*
	Name: function_28b7ec17
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAA20
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 1546
*/
function function_28b7ec17()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(undefined, 1);
	}
}

/*
	Name: function_292e3617
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAA98
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1565
*/
function function_292e3617()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(undefined, 1, "whimsical");
	}
}

/*
	Name: function_f210330e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAB18
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1584
*/
function function_f210330e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(undefined, 1, "classic");
	}
}

/*
	Name: function_12a19e46
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAB98
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1603
*/
function function_12a19e46()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(undefined, 1, "mega");
	}
}

/*
	Name: function_66a7ffd0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAC18
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1622
*/
function function_66a7ffd0()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(undefined, 1, "rare");
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2bec33d0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAC98
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 1643
*/
function function_2bec33d0()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(undefined, 1, "ultra");
	}
}

/*
	Name: function_b4705b81
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAD18
	Size: 0x1F8
	Parameters: 1
	Flags: None
	Line Number: 1662
*/
function function_b4705b81(var_33636f4a)
{
	index = 1;
	for(row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index); isdefined(row); row = TableLookupRow("gamedata/stats/zm/zm_statstable.csv", index))
	{
		var_a0ec4ef3 = checkStringValid(row[4]);
		if(var_a0ec4ef3 == var_33636f4a)
		{
			break;
		}
		index++;
		if(index == 101)
		{
			index++;
		}
	}
	struct = spawnstruct();
	struct.name = var_a0ec4ef3;
	struct.UI = checkStringValid(row[3]);
	struct.camoIndex = Int(row[5]);
	struct.hud = checkStringValid(row[6]);
	struct.description = checkStringValid(row[7]);
	struct.var_d277f374 = Int(row[16]);
	struct.activation = checkStringValid(row[20]);
	return struct;
}

/*
	Name: checkStringValid
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAF18
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 1699
*/
function checkStringValid(STR)
{
	if(STR != "")
	{
		return STR;
	}
	return undefined;
}

/*
	Name: function_4842c3d2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAF48
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1718
*/
function function_4842c3d2()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] [[level.bgb["zm_bgb_anywhere_but_here"].validation_func]]())
		{
			players[i] [[level.bgb["zm_bgb_anywhere_but_here"].var_6fa3d682]]();
		}
	}
}

/*
	Name: function_b22a52c8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xAFF8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1740
*/
function function_b22a52c8()
{
	level.headshots_only = 1;
}

/*
	Name: function_ef2299e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB010
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1755
*/
function function_ef2299e()
{
	level.headshots_only = 0;
}

/*
	Name: function_9160370b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB028
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 1770
*/
function function_9160370b()
{
	level endon("hash_815cf0ce");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] AllowAds(0);
		}
		wait(1);
	}
}

/*
	Name: function_815cf0ce
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB0B8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1794
*/
function function_815cf0ce()
{
	level notify("hash_815cf0ce");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] AllowAds(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2a8862aa
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB140
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 1816
*/
function function_2a8862aa()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] [[level.bgb["zm_bgb_mind_blown"].validation_func]]())
		{
			players[i] [[level.bgb["zm_bgb_mind_blown"].var_6fa3d682]]();
		}
	}
}

/*
	Name: function_1d027931
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB1F0
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1838
*/
function function_1d027931()
{
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && isdefined(a_ai[i].gibdef))
		{
			a_ai[i] zombie_utility::makeZombieCrawler();
		}
	}
}

/*
	Name: function_d619438b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB2C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 1860
*/
function function_d619438b()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::minus_to_player_score(Int(players[i].score / 2));
	}
}

/*
	Name: function_fe2438fd
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB360
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 1879
*/
function function_fe2438fd()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::add_to_player_score(players[i].score);
	}
}

/*
	Name: give_random_perk
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB3E8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1898
*/
function give_random_perk()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_perks::give_random_perk();
	}
}

/*
	Name: function_47d5a769
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB458
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1917
*/
function function_47d5a769()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_perks::lose_random_perk();
	}
}

/*
	Name: function_af80261
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB4C8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1936
*/
function function_af80261()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::function_8d654c9c();
	}
}

/*
	Name: function_9b9372e8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB538
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1955
*/
function function_9b9372e8()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_404b3bcb();
	}
}

/*
	Name: function_404b3bcb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB5A8
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 1974
*/
function function_404b3bcb()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = undefined;
	current_weapon = self GetCurrentWeapon();
	current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
	if(zm_weapons::is_weapon_upgraded(current_weapon))
	{
		rootweapon = zm_weapons::get_base_weapon(current_weapon);
		if(isdefined(rootweapon))
		{
			weapon_limit = zm_utility::get_player_weapon_limit(self);
			Primaries = self getweaponslistprimaries();
			if(isdefined(Primaries) && Primaries.size >= weapon_limit)
			{
				upgrade_weapon = self zm_weapons::weapon_give(rootweapon);
			}
			else
			{
				self TakeWeapon(current_weapon);
				upgrade_weapon = self zm_weapons::give_build_kit_weapon(rootweapon);
				self GiveStartAmmo(rootweapon);
			}
			self notify("weapon_give", upgrade_weapon);
		}
		wait(0.1);
	}
	self.var_97c73248 = undefined;
}

/*
	Name: spawn_grenade
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB770
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2018
*/
function spawn_grenade()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		w_grenade = GetWeapon("frag_grenade");
		players[i] MagicGrenadeType(w_grenade, players[i].origin, VectorScale((0, 0, 1), 300), 3);
	}
}

/*
	Name: function_d3284989
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB830
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 2038
*/
function function_d3284989()
{
	level endon("hash_69703690");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_d3284989))
			{
				a_ai[i].var_d3284989 = 1;
				a_ai[i] thread function_a7cfe140();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_a7cfe140
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB950
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2066
*/
function function_a7cfe140()
{
	level endon("hash_69703690");
	self waittill("death");
	if(isdefined(self.attacker) && isPlayer(self.attacker))
	{
		self.attacker MagicGrenadeType(GetWeapon("frag_grenade"), self.origin, VectorScale((0, 0, 1), 300), 0.3);
	}
}

/*
	Name: function_69703690
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xB9E8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2086
*/
function function_69703690()
{
	level notify("hash_69703690");
}

/*
	Name: function_2f4bdab4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBA08
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2101
*/
function function_2f4bdab4()
{
	level endon("hash_6b2eeec5");
	while(1)
	{
		players = GetPlayers();
		alias = "zmb_vocals_zombie_behind";
		for(i = 0; i < players.size; i++)
		{
			players[i] playsound(alias);
			wait(RandomInt(2));
		}
	}
}

/*
	Name: function_6b2eeec5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBAC8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2126
*/
function function_6b2eeec5()
{
	level notify("hash_6b2eeec5");
}

/*
	Name: function_a9107cba
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBAE8
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 2141
*/
function function_a9107cba()
{
	level endon("hash_66a4e74d");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_a9107cba))
			{
				a_ai[i].var_a9107cba = 1;
				a_ai[i] thread function_9bf70167();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_9bf70167
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBC08
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2169
*/
function function_9bf70167()
{
	level endon("hash_66a4e74d");
	self waittill("death");
	if(!(isdefined(level.no_powerups) && level.no_powerups))
	{
		powerup = zm_powerups::specific_powerup_drop(zm_powerups::get_regular_random_powerup_name(), self.origin);
	}
}

/*
	Name: function_66a4e74d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBC78
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 2189
*/
function function_66a4e74d()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_3d54115b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBC98
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2209
*/
function function_3d54115b()
{
	players = GetPlayers();
	if(!(isdefined(level.no_powerups) && level.no_powerups))
	{
		for(i = 0; i < players.size; i++)
		{
			if(players[i] [[level.bgb["zm_bgb_im_feelin_lucky"].validation_func]]())
			{
				players[i] [[level.bgb["zm_bgb_im_feelin_lucky"].var_6fa3d682]]();
			}
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8c94e755
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBD60
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2236
*/
function function_8c94e755()
{
	level.no_powerups = 1;
}

/*
	Name: function_71a3a928
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBD78
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 2251
*/
function function_71a3a928()
{
	level.no_powerups = 0;
}

/*
	Name: end_round
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBD90
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2266
*/
function end_round()
{
	players = GetPlayers();
	if(players[0] [[level.bgb["zm_bgb_round_robbin"].validation_func]]())
	{
		players[0] [[level.bgb["zm_bgb_round_robbin"].var_6fa3d682]]();
		for(i = 0; i < players.size; i++)
		{
			if(zm_utility::is_player_valid(players[i]))
			{
				players[i] zm_score::minus_to_player_score(zm_score::get_points_multiplier(players[i]) * 1600);
			}
		}
	}
}

/*
	Name: restart_round
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBE98
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 2292
*/
function restart_round()
{
	if(level.var_2ae5808e == 0)
	{
		zm_utility::zombie_goto_round(level.round_number);
		return;
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_bcc27502
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBED0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2313
*/
function function_bcc27502()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		while(!players[i] namespace_851dc78f::function_1275e2ff() && isdefined(players[i]))
		{
			wait(0.1);
		}
		players[i] bgb::take();
	}
}

/*
	Name: function_965e3ca3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xBF80
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2336
*/
function function_965e3ca3()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(!players[i] namespace_851dc78f::function_1275e2ff() && isdefined(players[i]))
		{
			players[i] SetWeaponAmmoClip(players[i] GetCurrentWeapon(), 0);
		}
	}
}

/*
	Name: function_c97affa9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC040
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2358
*/
function function_c97affa9()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] [[level.bgb["zm_bgb_bullet_boost"].validation_func]]())
		{
			players[i] [[level.bgb["zm_bgb_bullet_boost"].var_6fa3d682]]();
		}
	}
}

/*
	Name: function_373d6b95
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC0F0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 2380
*/
function function_373d6b95()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		current_weapon = players[i] GetCurrentWeapon();
		current_weapon = players[i] zm_weapons::switch_from_alt_weapon(current_weapon);
		b_weapon_supports_aat = zm_weapons::weapon_supports_aat(current_weapon);
		if(b_weapon_supports_aat)
		{
			currentAAT = players[i] AAT::getAATOnWeapon(current_weapon);
			if(isdefined(currentAAT))
			{
				players[i] thread AAT::remove(current_weapon);
			}
		}
	}
}

/*
	Name: function_df7c274
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC218
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 2409
*/
function function_df7c274()
{
	level endon("hash_7bc33a91");
	times = 0;
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] [[level.bgb["zm_bgb_eye_candy"].validation_func]]())
			{
				players[i] [[level.bgb["zm_bgb_eye_candy"].var_6fa3d682]]();
			}
		}
		wait(7);
	}
}

/*
	Name: function_7bc33a91
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC2F8
	Size: 0x1C8
	Parameters: 0
	Flags: None
	Line Number: 2437
*/
function function_7bc33a91()
{
	level notify("hash_7bc33a91");
	wait(1);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread clientfield::set_to_player("eye_candy_render", 0);
		visionset_mgr::deactivate("visionset", "zm_bgb_eye_candy_vs_1", players[i]);
		visionset_mgr::deactivate("overlay", "zm_bgb_eye_candy_vs_1", players[i]);
		visionset_mgr::deactivate("visionset", "zm_bgb_eye_candy_vs_2", players[i]);
		visionset_mgr::deactivate("overlay", "zm_bgb_eye_candy_vs_2", players[i]);
		visionset_mgr::deactivate("visionset", "zm_bgb_eye_candy_vs_3", players[i]);
		visionset_mgr::deactivate("overlay", "zm_bgb_eye_candy_vs_3", players[i]);
		visionset_mgr::deactivate("visionset", "zm_bgb_eye_candy_vs_4", players[i]);
		visionset_mgr::deactivate("overlay", "zm_bgb_eye_candy_vs_4", players[i]);
	}
}

/*
	Name: function_b327dcda
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC4C8
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 2466
*/
function function_b327dcda()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] playsoundtoplayer("windows_crash", players[i]);
		players[i] FreezeControls(1);
		players[i] setClientUIVisibilityFlag("hud_visible", 0);
		players[i] util::show_hud(0);
	}
	LUI::screen_flash(0, 3, 0, 1, "black");
	level.bzm_worldPaused = 1;
	level flag::set("world_is_paused");
	SetPauseWorld(1);
	wait(3);
	level.bzm_worldPaused = 0;
	SetPauseWorld(0);
	level flag::clear("world_is_paused");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] FreezeControls(0);
		players[i] setClientUIVisibilityFlag("hud_visible", 1);
		players[i] util::show_hud(1);
	}
}

/*
	Name: function_fdcdfd54
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC6F8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2503
*/
function function_fdcdfd54()
{
	level.bzm_worldPaused = 1;
	level flag::set("world_is_paused");
	SetPauseWorld(1);
}

/*
	Name: function_11c2a14f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC748
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 2520
*/
function function_11c2a14f()
{
	level.bzm_worldPaused = 0;
	SetPauseWorld(0);
	level flag::clear("world_is_paused");
}

/*
	Name: function_b6ae2093
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC798
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 2537
*/
function function_b6ae2093()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_4b1a1737();
	}
}

/*
	Name: function_e2e7679
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC808
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 2556
*/
function function_e2e7679()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_4b1a1737(1);
	}
}

/*
	Name: function_4b1a1737
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xC880
	Size: 0x1F0
	Parameters: 1
	Flags: None
	Line Number: 2575
*/
function function_4b1a1737(var_6c95c0b7)
{
	if(!isdefined(var_6c95c0b7))
	{
		var_6c95c0b7 = 0;
	}
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	weap = undefined;
	while(weap == undefined)
	{
		weap = zm_magicbox::treasure_chest_ChooseWeightedRandomWeapon(self);
		if(weap == level.weaponNone || zm_utility::is_lethal_grenade(weap) || zm_utility::is_tactical_grenade(weap) || zm_equipment::is_equipment(weap) || zm_utility::is_placeable_mine(weap) || weap.isRiotShield || weap.isHeroWeapon || weap.isgadget || weap.isFlourishWeapon)
		{
			weap = undefined;
		}
		wait(0.01);
	}
	if(var_6c95c0b7 == 1 && self zm_weapons::can_upgrade_weapon(weap))
	{
		weap = zm_weapons::get_upgrade_weapon(weap);
	}
	weap = self zm_weapons::weapon_give(weap);
	self SwitchToWeaponImmediate(weap);
	wait(0.1);
	self.var_97c73248 = undefined;
	wait(0.1);
}

/*
	Name: function_321f175c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCA78
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 2618
*/
function function_321f175c()
{
	level.dont_unset_perk_when_machine_paused = 1;
	if(level flag::exists("power_on") && level flag::get("power_on"))
	{
		var_a99e61c = [];
		PERKS = Array::randomize(level.var_1bfd5a74);
		for(i = 0; i < PERKS.size; i++)
		{
			perk_machine = PERKS[i];
			trigger = PERKS[i].var_807754d1;
			if(isdefined(trigger.power_on) && trigger.power_on)
			{
				var_a99e61c[var_a99e61c.size] = trigger;
			}
		}
		level zm_power::turn_power_off_and_close_doors();
		wait(60);
		level zm_power::turn_power_on_and_open_doors();
		for(i = 0; i < var_a99e61c.size; i++)
		{
			if(!isdefined(var_a99e61c[i]))
			{
				continue;
			}
			trigger = var_a99e61c[i];
			perk = var_a99e61c[i].script_noteworthy;
			perk_machine = trigger.machine;
			var_a99e61c[i].power_on = 1;
			if(isdefined(level.var_1741956d[perk]) && level.var_1741956d[perk] || var_a99e61c[i].power_on)
			{
				perk_machine SetModel(level.machine_assets[perk].off_model);
				wait(0.1);
				perk_machine SetModel(level.machine_assets[perk].on_model);
				trigger thread zm_perks::vending_trigger_think(1);
				trigger zm_perks::set_power_on(1);
			}
		}
	}
}

/*
	Name: function_2ee7476e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCD28
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2669
*/
function function_2ee7476e()
{
	function_db145f0b(&function_c1f0a46f);
}

/*
	Name: function_f3173f05
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCD58
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2684
*/
function function_f3173f05()
{
	function_1fb9469c(&function_c1f0a46f);
	return;
}

/*
	Name: function_c1f0a46f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCD88
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 2700
*/
function function_c1f0a46f(points)
{
	return points - points * 2;
	waittillframeend;
}

/*
	Name: function_eb824ee3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCDB0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2716
*/
function function_eb824ee3()
{
	level thread function_2a1db7c3("anti_double_points");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a9d32f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCDE0
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 2733
*/
function function_a9d32f(player)
{
	level thread function_883b1b08(self, GetPlayers()[0]);
}

/*
	Name: function_883b1b08
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCE28
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 2748
*/
function function_883b1b08(drop_item, player)
{
	level notify("hash_459204d8");
	level endon("hash_459204d8");
	if(!isdefined(level.var_883b1b08))
	{
		function_db145f0b(&function_c1f0a46f);
	}
	level.var_883b1b08 = 1;
	n_wait = 30;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		n_wait = n_wait + 30;
	}
	level thread function_fe07ead9("specialty_red_doublepoints_zombies", n_wait);
	while(n_wait > 0)
	{
		wait(0.1);
		n_wait = n_wait - 0.1;
		while(isdefined(level.var_e4297151["POWERUPS LAST FOREVER"]))
		{
			wait(0.1);
		}
	}
	level.var_883b1b08 = undefined;
	function_1fb9469c(&function_c1f0a46f);
}

/*
	Name: function_30b7e16d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCF70
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2786
*/
function function_30b7e16d()
{
	level thread function_2a1db7c3("anti_insta_kill");
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: function_92b6be0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCFA0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2804
*/
function function_92b6be0()
{
	level thread function_7336b285(self, GetPlayers()[0]);
}

/*
	Name: function_7336b285
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xCFE0
	Size: 0x128
	Parameters: 2
	Flags: None
	Line Number: 2819
*/
function function_7336b285(drop_item, player)
{
	level notify("hash_9b915fcc");
	level endon("hash_9b915fcc");
	if(!isdefined(level.var_7336b285))
	{
		level thread function_df19b4b4();
	}
	level.var_7336b285 = 1;
	n_wait = 30;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		n_wait = n_wait + 30;
	}
	level thread function_fe07ead9("specialty_red_instakill_zombies", n_wait);
	while(n_wait > 0)
	{
		wait(0.1);
		n_wait = n_wait - 0.1;
		while(isdefined(level.var_e4297151["POWERUPS LAST FOREVER"]))
		{
			wait(0.1);
		}
	}
	level.var_7336b285 = undefined;
	level notify("hash_5cfd7b96");
}

/*
	Name: function_df19b4b4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD110
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 2857
*/
function function_df19b4b4()
{
	level endon("hash_5cfd7b96");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && !isdefined(a_ai[i].var_df19b4b4) && (!(isdefined(a_ai[i].magic_bullet_shield) && a_ai[i].magic_bullet_shield)))
			{
				a_ai[i].var_df19b4b4 = 1;
				a_ai[i].magic_bullet_shield = 1;
				a_ai[i].allowdeath = 0;
				a_ai[i] thread function_5f54ee5a();
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_5f54ee5a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD270
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 2887
*/
function function_5f54ee5a()
{
	self endon("death");
	level waittill("hash_5cfd7b96");
	self.var_df19b4b4 = undefined;
	self.magic_bullet_shield = undefined;
	self.allowdeath = 1;
}

/*
	Name: function_2e92cbf2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD2B8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 2906
*/
function function_2e92cbf2(func)
{
	if(!isdefined(level.zombie_damage_callbacks))
	{
		level.zombie_damage_callbacks = [];
	}
	ArrayRemoveValue(level.zombie_damage_callbacks, func);
	return;
}

/*
	Name: function_fc21ecf9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD308
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2926
*/
function function_fc21ecf9()
{
	level thread function_2a1db7c3("anti_fire_sale");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d81452aa
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD338
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2943
*/
function function_d81452aa()
{
	level thread function_767a8a57(self, GetPlayers()[0]);
}

/*
	Name: function_767a8a57
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD378
	Size: 0xF8
	Parameters: 2
	Flags: None
	Line Number: 2958
*/
function function_767a8a57(drop_item, player)
{
	level notify("hash_e58c350c");
	level endon("hash_e58c350c");
	n_wait = 30;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		n_wait = n_wait + 30;
	}
	level thread function_fe07ead9("specialty_red_firesale_zombies", n_wait);
	level.var_4cfe011a = 1;
	while(n_wait > 0)
	{
		wait(0.1);
		n_wait = n_wait - 0.1;
		while(isdefined(level.var_e4297151["POWERUPS LAST FOREVER"]))
		{
			wait(0.1);
		}
	}
	level.var_4cfe011a = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fe3b0aaa
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD478
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 2993
*/
function function_fe3b0aaa()
{
	level thread function_2a1db7c3("anti_nuke");
}

/*
	Name: function_1ea2743
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD4A8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3008
*/
function function_1ea2743()
{
	level thread function_918de054(self, GetPlayers()[0]);
	return;
	.var_0 = undefined;
}

/*
	Name: function_918de054
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD4E8
	Size: 0xF0
	Parameters: 2
	Flags: None
	Line Number: 3025
*/
function function_918de054(drop_item, player)
{
	player thread zm_powerups::powerup_vo("nuke");
	playFX("zombie/fx_powerup_nuke_zmb", drop_item.origin);
	player playsound("evt_nuke_flash");
	player LUI::screen_flash(0.2, 0.5, 1, 0.8, "white");
	level.zombie_total = level.zombie_total + zm::get_zombie_count_for_round(level.round_number, level.players.size);
}

/*
	Name: function_f38d932
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD5E0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3044
*/
function function_f38d932()
{
	level thread function_2a1db7c3("anti_minigun");
}

/*
	Name: function_e3544c3d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD610
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3059
*/
function function_e3544c3d()
{
	level thread function_f6dcaae(self, GetPlayers()[0]);
}

/*
	Name: function_f6dcaae
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD650
	Size: 0x140
	Parameters: 2
	Flags: None
	Line Number: 3074
*/
function function_f6dcaae(drop_item, player)
{
	level notify("hash_7e78c72c");
	level endon("hash_7e78c72c");
	level thread function_b6ae2093();
	if(!isdefined(level.var_f6dcaae))
	{
		level thread function_14f67823();
	}
	level.var_f6dcaae = 1;
	n_wait = 30;
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		n_wait = n_wait + 30;
	}
	level thread function_fe07ead9("specialty_red_minigun_zombies", n_wait);
	while(n_wait > 0)
	{
		wait(0.1);
		n_wait = n_wait - 0.1;
		while(isdefined(level.var_e4297151["POWERUPS LAST FOREVER"]))
		{
			wait(0.1);
		}
	}
	level thread function_6454bdce();
	level.var_f6dcaae = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_74d0b926
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD798
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 3115
*/
function function_74d0b926()
{
	level endon("hash_ab9a046d");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i]))
			{
				orig = players[i].origin + VectorScale(AnglesToForward((0, players[i] getPlayerAngles()[1] + RandomInt(360), 0)), 60) + VectorScale((0, 0, 1), 10);
				weap = function_f56a5552("smg");
				MagicBullet(weap, orig, orig - VectorScale((0, 0, 1), 100));
			}
			wait(RandomFloat(1));
		}
	}
}

/*
	Name: function_ab9a046d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD910
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 3144
*/
function function_ab9a046d()
{
	level notify("hash_ab9a046d");
}

/*
	Name: function_f56a5552
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xD930
	Size: 0x2D0
	Parameters: 2
	Flags: None
	Line Number: 3159
*/
function function_f56a5552(weap_class, player)
{
	guns = [];
	keys = Array::randomize(getArrayKeys(level.zombie_weapons));
	for(i = 0; i < keys.size; i++)
	{
		if(isdefined(weap_class))
		{
			if(keys[i].weapClass == weap_class && !zm_weapons::is_weapon_upgraded(keys[i]))
			{
				if(weap_class == "rifle")
				{
					if(!keys[i].isSniperWeapon)
					{
						guns[guns.size] = keys[i];
					}
				}
				else
				{
					guns[guns.size] = keys[i];
				}
			}
		}
		if(isdefined(player))
		{
			can = 1;
			pap_triggers = zm_pap_util::get_triggers();
			if(!zm_weapons::get_is_in_box(keys[i]))
			{
				can = 0;
			}
			if(player zm_weapons::has_weapon_or_upgrade(keys[i]))
			{
				can = 0;
			}
			if(!zm_weapons::limited_weapon_below_quota(keys[i], player, pap_triggers))
			{
				can = 0;
			}
			if(isdefined(level.special_weapon_magicbox_check))
			{
				Used = player [[level.special_weapon_magicbox_check]](keys[i]);
				if(Used)
				{
					can = 0;
				}
			}
			if(can)
			{
				guns[guns.size] = keys[i];
			}
		}
		if(!isdefined(weap_class) && !isdefined(player))
		{
			can = 1;
			if(!zm_weapons::get_is_in_box(keys[i]))
			{
				can = 0;
			}
			if(can)
			{
				guns[guns.size] = keys[i];
			}
		}
	}
	return guns[RandomInt(guns.size)];
}

/*
	Name: function_7fa6fc03
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xDC08
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 3237
*/
function function_7fa6fc03()
{
	level endon("hash_bd634a9a");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_7fa6fc03))
			{
				a_ai[i].var_7fa6fc03 = 1;
				a_ai[i] zombie_utility::gib_random_parts();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_bd634a9a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xDD28
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 3265
*/
function function_bd634a9a()
{
	level notify("hash_bd634a9a");
}

/*
	Name: function_5577d80e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xDD48
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 3280
*/
function function_5577d80e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_13e6397e();
	}
}

/*
	Name: function_13e6397e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xDDB8
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 3299
*/
function function_13e6397e()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	primary_weapons_to_take = self getweaponslistprimaries();
	score_decrement = zm_utility::round_up_to_ten(Int(self.score / primary_weapons_to_take.size + 1));
	self playlocalsound(level.zmb_laugh_alias);
	swap_weapon = self GetCurrentWeapon();
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
		{
			if(primaryWeapons[i] != self GetCurrentWeapon())
			{
				swap_weapon = primaryWeapons[i];
			}
		}
	}
	self SwitchToWeapon(swap_weapon);
	self zm_score::player_reduce_points("take_specified", score_decrement);
	wait(3);
	self zm_score::add_to_player_score(score_decrement);
	wait(0.1);
	self.var_97c73248 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: friendly_fire
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xDFD0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 3342
*/
function friendly_fire()
{
	level.friendlyfire = 1;
	level.var_39b05d9c = 1;
}

/*
	Name: function_460cc964
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xDFF8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 3358
*/
function function_460cc964()
{
	level.var_39b05d9c = undefined;
}

/*
	Name: function_8d10c739
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE010
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 3373
*/
function function_8d10c739()
{
	level.friendlyfire = 1;
	level.var_1a57a954 = 1;
}

/*
	Name: function_c9ee6d8c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE038
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 3389
*/
function function_c9ee6d8c()
{
	level.var_1a57a954 = undefined;
}

/*
	Name: function_2f8570b3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE050
	Size: 0x100
	Parameters: 11
	Flags: None
	Line Number: 3404
*/
function function_2f8570b3(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime, boneIndex)
{
	if(!isdefined(eAttacker))
	{
		return;
	}
	if(self == eAttacker)
	{
		return;
	}
	if(isPlayer(eAttacker))
	{
		if(self laststand::player_is_in_laststand() && isdefined(level.var_1a57a954))
		{
			self notify("remote_revive", eAttacker);
		}
		if(isdefined(level.var_39b05d9c))
		{
			self DoDamage(10, eAttacker.origin, eAttacker);
		}
	}
}

/*
	Name: function_1baa8613
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE158
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3437
*/
function function_1baa8613()
{
	level endon("hash_492ce314");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] AllowSprint(0);
		}
		wait(1);
	}
}

/*
	Name: function_492ce314
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE1E8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3461
*/
function function_492ce314()
{
	level notify("hash_492ce314");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] AllowSprint(1);
	}
}

/*
	Name: function_43576716
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE270
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3481
*/
function function_43576716()
{
	level endon("hash_11fafce7");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] allowslide(0);
		}
		wait(1);
	}
}

/*
	Name: function_11fafce7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE300
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3505
*/
function function_11fafce7()
{
	level notify("hash_11fafce7");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] allowslide(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_14f67823
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE388
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3527
*/
function function_14f67823()
{
	level endon("hash_6454bdce");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] DisableWeaponCycling();
		}
		wait(1);
	}
}

/*
	Name: function_6454bdce
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE418
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3551
*/
function function_6454bdce()
{
	level notify("hash_6454bdce");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] EnableWeaponCycling();
	}
}

/*
	Name: infrared
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE498
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 3571
*/
function infrared()
{
	level endon("hash_100afb97");
	while(1)
	{
		visionset_mgr::activate("visionset", "chaos_mod_infrared", undefined, 0, 3, 0);
		wait(1);
	}
}

/*
	Name: function_100afb97
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE4F0
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 3591
*/
function function_100afb97()
{
	level notify("hash_100afb97");
	wait(0.2);
	visionset_mgr::deactivate("visionset", "chaos_mod_infrared", undefined);
	return;
	ERROR: Bad function call
}

/*
	Name: function_8545ec55
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE538
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 3610
*/
function function_8545ec55()
{
	level endon("hash_8053b0f0");
	visionset_mgr::activate("visionset", "chaos_mod_noire", undefined, 0, 30, 0);
}

/*
	Name: function_8053b0f0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE580
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 3626
*/
function function_8053b0f0()
{
	level notify("hash_8053b0f0");
	wait(0.2);
	visionset_mgr::deactivate("visionset", "chaos_mod_noire", undefined);
}

/*
	Name: no_hud
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE5C8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3643
*/
function no_hud()
{
	level endon("hash_d609c513");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] util::show_hud(0);
		}
		wait(1);
	}
}

/*
	Name: function_d609c513
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE658
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3667
*/
function function_d609c513()
{
	level notify("hash_d609c513");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] util::show_hud(1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_60c0d294
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE6E0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3689
*/
function function_60c0d294()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] clientfield::set_to_player("blaze_phase_burning_screen", 1);
		players[i] PlayLoopSound("chr_burn_loop_overlay");
	}
}

/*
	Name: function_42d75eef
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE788
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 3709
*/
function function_42d75eef()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] StopLoopSound(1);
		players[i] clientfield::set_to_player("blaze_phase_burning_screen", 0);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_43d063d4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE828
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3731
*/
function function_43d063d4()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		angles = players[i] getPlayerAngles();
		players[i] SetPlayerAngles(angles + VectorScale((0, 1, 0), 180));
	}
}

/*
	Name: function_fcebbc3c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE8D8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 3751
*/
function function_fcebbc3c()
{
	level endon("hash_35e7bb0f");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] EnableInvulnerability();
		}
		wait(1);
	}
}

/*
	Name: function_35e7bb0f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE968
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3775
*/
function function_35e7bb0f()
{
	level notify("hash_35e7bb0f");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] DisableInvulnerability();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8e3197c0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xE9E8
	Size: 0x3F0
	Parameters: 2
	Flags: None
	Line Number: 3797
*/
function function_8e3197c0(weapon, count)
{
	weapon = weapon.rootweapon;
	attachments = weapon.supportedAttachments;
	attachments = Array::randomize(attachments);
	Attach = [];
	var_3b61809f = [];
	var_f72e2041 = [];
	for(i = 0; i < attachments.size; i++)
	{
		if(IsSubStr(attachments[i], "holo") || IsSubStr(attachments[i], "acog") || IsSubStr(attachments[i], "reflex") || IsSubStr(attachments[i], "ir") || IsSubStr(attachments[i], "reddot"))
		{
			var_3b61809f[var_3b61809f.size] = attachments[i];
		}
		if(IsSubStr(attachments[i], "rf") || IsSubStr(attachments[i], "extbarrel") || IsSubStr(attachments[i], "steadyaim") || IsSubStr(attachments[i], "grip") || IsSubStr(attachments[i], "fastreload") || IsSubStr(attachments[i], "quickdraw") || IsSubStr(attachments[i], "stalker"))
		{
			var_f72e2041[var_f72e2041.size] = attachments[i];
		}
	}
	for(i = 0; i < var_f72e2041.size; i++)
	{
		Attach[Attach.size] = var_f72e2041[i];
	}
	if(Attach.size < 1)
	{
		return;
	}
	if(Attach.size < count)
	{
		count = Attach.size;
	}
	if(RandomInt(100) > 80)
	{
		level.zombie_weapons[weapon].force_attachments[0] = var_3b61809f[RandomInt(var_3b61809f.size)];
	}
	Attach = Array::randomize(Attach);
	for(i = 1; i < count + 1; i++)
	{
		level.zombie_weapons[weapon].force_attachments[i] = Attach[i];
	}
}

/*
	Name: function_d23b63ab
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xEDE0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 3849
*/
function function_d23b63ab()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] function_24b2ba2f();
	}
}

/*
	Name: function_24b2ba2f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xEE50
	Size: 0x340
	Parameters: 0
	Flags: None
	Line Number: 3868
*/
function function_24b2ba2f()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	swap_weapon = self GetCurrentWeapon();
	swap_weapon = swap_weapon.rootweapon;
	var_9b6c3861 = self GetCurrentWeapon();
	weapon = self GetCurrentWeapon();
	weapon = zm_weapons::get_nonalternate_weapon(weapon);
	newWeapon = GetWeapon(weapon);
	level.zombie_weapons[weapon].force_attachments = [];
	if(isdefined(weapon.supportedAttachments) && weapon.supportedAttachments.size > 0)
	{
		function_8e3197c0(weapon, 5);
		newWeapon = zm_weapons::get_weapon_with_attachments(weapon);
		self TakeWeapon(var_9b6c3861);
		primaryWeapons = self getweaponslistprimaries();
		if(isdefined(primaryWeapons) && primaryWeapons.size > 0)
		{
			self SwitchToWeaponImmediate(primaryWeapons[0]);
		}
		wait(0.1);
		upgrade_weapon = self zm_weapons::give_build_kit_weapon(newWeapon);
		self GiveStartAmmo(newWeapon);
		self SwitchToWeaponImmediate(newWeapon);
	}
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(primaryWeapons[i].rootweapon == swap_weapon)
		{
			self SetWeaponAmmoStock(primaryWeapons[i], primaryWeapons[i].maxAmmo);
			self SetWeaponAmmoClip(primaryWeapons[i], primaryWeapons[i].clipSize);
			self SwitchToWeaponImmediate(primaryWeapons[i]);
		}
	}
	wait(0.1);
	self.var_97c73248 = undefined;
}

/*
	Name: function_bb8c3452
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF198
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3922
*/
function function_bb8c3452()
{
	machine = GetEntArray("vending_revive", "targetname");
	for(i = 0; i < machine.size; i++)
	{
		machine[i] SetScale(0.3);
	}
}

/*
	Name: function_324c60e9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF220
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 3941
*/
function function_324c60e9()
{
	machine = GetEntArray("vending_revive", "targetname");
	for(i = 0; i < machine.size; i++)
	{
		machine[i] SetScale(1);
	}
}

/*
	Name: function_75d2b14a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF2A8
	Size: 0x4B8
	Parameters: 0
	Flags: None
	Line Number: 3960
*/
function function_75d2b14a()
{
	player = GetPlayers()[RandomInt(GetPlayers().size)];
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(vending_triggers[i].script_noteworthy == "specialty_armorvest")
		{
			clip = vending_triggers[i].clip;
			machine = vending_triggers[i].machine;
			bump_trigger = vending_triggers[i].bump_trigger;
			machine.origin = player.origin;
			clip.origin = player.origin;
			bump_trigger.origin = player.origin + VectorScale((0, 0, 1), 20);
			machine.angles = (0, player getPlayerAngles()[1], 0);
			machine RotateTo((0, player getPlayerAngles()[1], 0), 0.2);
			clip.angles = (0, player getPlayerAngles()[1], 0);
			bump_trigger.angles = (0, player getPlayerAngles()[1], 0);
			vending_triggers[i].origin = player.origin + VectorScale((0, 0, 1), 60);
		}
	}
	wait(0.5);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(vending_triggers[i].script_noteworthy == "specialty_armorvest")
		{
			clip = vending_triggers[i].clip;
			machine = vending_triggers[i].machine;
			bump_trigger = vending_triggers[i].bump_trigger;
			machine.origin = player.origin;
			clip.origin = player.origin;
			bump_trigger.origin = player.origin + VectorScale((0, 0, 1), 20);
			machine.angles = (0, player getPlayerAngles()[1], 0);
			machine RotateTo((0, player getPlayerAngles()[1], 0), 0.2);
			clip.angles = (0, player getPlayerAngles()[1], 0);
			bump_trigger.angles = (0, player getPlayerAngles()[1], 0);
			vending_triggers[i].origin = player.origin + VectorScale((0, 0, 1), 60);
		}
	}
}

/*
	Name: function_5683dce
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF768
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 4012
*/
function function_5683dce()
{
	level endon("hash_39a69067");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_utility::increment_ignoreme();
		players[i].bgb_in_plain_sight_active = 1;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_39a69067
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF800
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 4035
*/
function function_39a69067()
{
	level notify("hash_39a69067");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_utility::decrement_ignoreme();
		players[i].bgb_in_plain_sight_active = undefined;
	}
}

/*
	Name: function_2dfcbc83
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF890
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 4056
*/
function function_2dfcbc83()
{
	level endon("hash_45dc9b66");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i]))
			{
				players[i] zm_audio::create_and_play_dialog("general", "outofmoney");
			}
			wait(1);
		}
	}
}

/*
	Name: function_45dc9b66
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF940
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4083
*/
function function_45dc9b66()
{
	level notify("hash_45dc9b66");
	return;
	~;
}

/*
	Name: function_8f342e41
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xF960
	Size: 0x188
	Parameters: 0
	Flags: None
	Line Number: 4100
*/
function function_8f342e41()
{
	var_13d7c655 = [];
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i].script_sound))
		{
			var_13d7c655[var_13d7c655.size] = vending_triggers[i].script_sound;
		}
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		sound = var_13d7c655[RandomInt(var_13d7c655.size)];
		players[i] playsoundwithnotify(sound, "sndDone");
		players[i] playsoundwithnotify(sound, "sndDone");
		players[i] playsoundwithnotify(sound, "sndDone");
	}
}

/*
	Name: function_314448ac
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xFAF0
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 4131
*/
function function_314448ac()
{
	zombie_doors = GetEntArray("zombie_door", "targetname");
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	zombie_debris = ArrayCombine(zombie_debris, zombie_doors, 0, 1);
	var_c2244aff = [];
	if(isdefined(zombie_debris) && zombie_debris.size > 0)
	{
		for(i = 0; i < zombie_debris.size; i++)
		{
			if(isdefined(zombie_debris[i].purchaser) || (isdefined(zombie_debris[i]._door_open) && zombie_debris[i]._door_open))
			{
				continue;
			}
			if(!isdefined(zombie_debris[i].script_noteworthy) || zombie_debris[i].script_noteworthy != "electric_door" || zombie_debris[i].script_noteworthy != "electric_buyable_door" || isdefined(zombie_debris[i].has_been_opened))
			{
				var_c2244aff[var_c2244aff.size] = zombie_debris[i];
			}
		}
	}
	player = GetPlayers()[0];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]))
		{
			player = players[i];
		}
	}
	if(isdefined(var_c2244aff) && var_c2244aff.size > 0)
	{
		SetDvar("zombie_unlock_all", 1);
		wait(0.1);
		door = var_c2244aff[RandomInt(var_c2244aff.size)];
		door notify("trigger", player, 1);
		door.has_been_opened = 1;
		wait(0.1);
		SetDvar("zombie_unlock_all", 0);
	}
}

/*
	Name: function_480b8056
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xFDF0
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 4182
*/
function function_480b8056()
{
	while(isdefined(level.chests[level.chest_index].chest_user) || level.zombie_vars["zombie_powerup_fire_sale_on"] == 1)
	{
		wait(0.1);
	}
	player = GetPlayers()[0];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]) && players[i].score >= 950)
		{
			player = players[i];
		}
	}
	if(player.score < 950)
	{
		player zm_score::add_to_player_score(Int(950 - player.score));
	}
	if(isdefined(level.chests) && level.chests.size > 1 && isdefined(player))
	{
		level._zombiemode_chest_joker_chance_override_func = &function_1199440e;
		level flag::set("moving_chest_now");
		level.chests[level.chest_index] notify("trigger", player);
		level flag::wait_till_clear("moving_chest_now");
		level._zombiemode_chest_joker_chance_override_func = undefined;
	}
}

/*
	Name: function_1199440e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0xFFF8
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 4221
*/
function function_1199440e()
{
	return 100;
}

/*
	Name: function_45f68f74
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10008
	Size: 0x2D0
	Parameters: 0
	Flags: None
	Line Number: 4236
*/
function function_45f68f74()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] FreezeControls(1);
	}
	level.bzm_worldPaused = 1;
	level flag::set("world_is_paused");
	SetPauseWorld(1);
	wait(0.3);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setClientUIVisibilityFlag("hud_visible", 0);
		players[i] util::show_hud(0);
	}
	bar = self namespace_851dc78f::function_7d15591a("left", "top", "fullscreen", "fullscreen", 0, 0, 0, "chaos_mod_ps_bluescreen", 640, 480, (1, 1, 1), 5);
	bar fadeOverTime(0.2);
	bar.alpha = 1;
	wait(2.7);
	level.bzm_worldPaused = 0;
	SetPauseWorld(0);
	level flag::clear("world_is_paused");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] FreezeControls(0);
		players[i] setClientUIVisibilityFlag("hud_visible", 1);
		players[i] util::show_hud(1);
	}
	if(isdefined(bar))
	{
		bar destroy();
		bar = undefined;
	}
}

/*
	Name: function_3a0b8e56
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x102E0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 4284
*/
function function_3a0b8e56()
{
	function_1dc5810(1);
	spawner::add_global_spawn_function("axis", &function_42d1b9a);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_da409917
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10330
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 4302
*/
function function_da409917()
{
	function_1dc5810(0);
	spawner::remove_global_spawn_function("axis", &function_42d1b9a);
}

/*
	Name: function_1dc5810
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10380
	Size: 0x168
	Parameters: 1
	Flags: None
	Line Number: 4318
*/
function function_1dc5810(var_42d1b9a)
{
	if(!isdefined(var_42d1b9a))
	{
		var_42d1b9a = 1;
	}
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		var_3812f8bd = 0;
		if(isdefined(level.var_9e59cb5b))
		{
			var_3812f8bd = [[level.var_9e59cb5b]](a_ai[i]);
		}
		else if(isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && a_ai[i].team === level.zombie_team)
		{
			var_3812f8bd = 1;
		}
		if(var_3812f8bd)
		{
			if(var_42d1b9a)
			{
				a_ai[i] zombie_utility::set_zombie_run_cycle_override_value("walk");
				continue;
			}
			a_ai[i] zombie_utility::set_zombie_run_cycle_restore_from_override();
		}
	}
	return;
}

/*
	Name: function_42d1b9a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x104F0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 4359
*/
function function_42d1b9a()
{
	var_3812f8bd = 0;
	if(isdefined(level.var_9e59cb5b))
	{
		var_3812f8bd = [[level.var_9e59cb5b]](self);
	}
	else if(isalive(self) && self.archetype === "zombie" && self.team === level.zombie_team)
	{
		var_3812f8bd = 1;
	}
	if(var_3812f8bd)
	{
		self zombie_utility::set_zombie_run_cycle_override_value("walk");
	}
}

/*
	Name: function_d6fb57b6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x105A0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 4386
*/
function function_d6fb57b6()
{
	level endon("hash_3f5de903");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] setMoveSpeedScale(2);
		}
		wait(1);
	}
}

/*
	Name: function_3f5de903
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10638
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 4410
*/
function function_3f5de903()
{
	level notify("hash_3f5de903");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setMoveSpeedScale(1);
	}
}

/*
	Name: function_fca58d56
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x106C0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4430
*/
function function_fca58d56()
{
	SetDvar("player_sustainAmmo", 1);
}

/*
	Name: stop_infinite_ammo
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x106F0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 4445
*/
function stop_infinite_ammo()
{
	SetDvar("player_sustainAmmo", 0);
}

/*
	Name: function_3f0afd6f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10718
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4460
*/
function function_3f0afd6f()
{
	level.perk_purchase_limit = level.perk_purchase_limit + 500;
}

/*
	Name: function_355267de
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10738
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4475
*/
function function_355267de()
{
	level.perk_purchase_limit = level.perk_purchase_limit - 500;
}

/*
	Name: function_ee6f3255
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10758
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4490
*/
function function_ee6f3255()
{
	level.perk_purchase_limit = level.perk_purchase_limit - 500;
}

/*
	Name: function_a843af4e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10778
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 4505
*/
function function_a843af4e()
{
	level.perk_purchase_limit = level.perk_purchase_limit + 500;
}

/*
	Name: function_5d173e8e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10798
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 4520
*/
function function_5d173e8e()
{
	level endon("hash_d0b66f8b");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_5d173e8e))
			{
				a_ai[i].var_5d173e8e = 1;
				a_ai[i].model SetScale(0.3);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_d0b66f8b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x108C8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 4548
*/
function function_d0b66f8b()
{
	level notify("hash_d0b66f8b");
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && isdefined(a_ai[i].var_5d173e8e))
		{
			a_ai[i].model SetScale(1);
		}
	}
}

/*
	Name: thirdperson
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x109C0
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 4571
*/
function thirdperson()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetClientThirdPerson(1);
	}
}

/*
	Name: function_cbac219c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10A38
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 4590
*/
function function_cbac219c()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetClientThirdPerson(0);
	}
	return;
}

/*
	Name: function_d84f9af7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10AA8
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 4610
*/
function function_d84f9af7()
{
	namespace_3b75c34a::function_4e972a8e(&function_2fa437c7, 1);
}

/*
	Name: function_3d232c4e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10AE0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 4625
*/
function function_3d232c4e()
{
	namespace_3b75c34a::function_20b8a0e9(&function_2fa437c7);
	level notify("hash_3d232c4e");
}

/*
	Name: function_2fa437c7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10B20
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 4641
*/
function function_2fa437c7()
{
	level endon("hash_3d232c4e");
	while(isdefined(self))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(self) && DistanceSquared(players[i].origin, self.origin + VectorScale((0, 0, 1), 32)) < 10000)
			{
				difference = self.origin - players[i].origin;
				fodder = 0.6;
				if(isdefined(self) && DistanceSquared(players[i].origin, self.origin + VectorScale((0, 0, 1), 32)) < 10000)
				{
					fodder = 5;
				}
				if(isdefined(self) && DistanceSquared(players[i].origin, self.origin + VectorScale((0, 0, 1), 32)) < 2500)
				{
					fodder = 10;
				}
				if(isdefined(self) && DistanceSquared(players[i].origin, self.origin + VectorScale((0, 0, 1), 32)) < 900)
				{
					fodder = 15;
				}
				move_spot = (self.origin[0] + difference[0] * fodder, self.origin[1] + difference[1] * fodder, self.origin[2]);
				self moveto(move_spot, 0.1);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_b09008a0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10DA8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 4683
*/
function function_b09008a0(time)
{
	wait(time);
	self delete();
	return;
	waittillframeend;
}

/*
	Name: function_c75d24e3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10DD8
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 4701
*/
function function_c75d24e3()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread namespace_851dc78f::givegobblegum(function_b4705b81("zm_bgb_disorderly_combat"), 0);
	}
	wait(2);
	for(i = 0; i < players.size; i++)
	{
		players[i] IPrintLnBold("PRESS ^3[{+actionslot 1}]^7 TO CANCEL DISORDERLY COMBAT");
	}
	return;
}

/*
	Name: function_dae4bf1e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10EB0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4726
*/
function function_dae4bf1e()
{
	level thread function_2a1db7c3("anti_full_ammo");
}

/*
	Name: function_1ab23e70
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10EE0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4741
*/
function function_1ab23e70()
{
	level thread function_2a1db7c3("anti_bonus_points_player");
}

/*
	Name: function_5e4bac69
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10F10
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 4756
*/
function function_5e4bac69()
{
	level thread function_2a1db7c3("anti_free_perk");
	return;
}

/*
	Name: function_2a1db7c3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x10F40
	Size: 0x158
	Parameters: 1
	Flags: None
	Line Number: 4772
*/
function function_2a1db7c3(var_6c3b5312)
{
	player = undefined;
	while(!isdefined(player))
	{
		players = GetPlayers();
		players = Array::randomize(players);
		for(i = 0; i < players.size; i++)
		{
			if(zm_utility::is_player_valid(players[i]))
			{
				player = players[i];
			}
		}
		wait(0.1);
	}
	if(isdefined(player))
	{
		orig = player.origin + VectorScale(AnglesToForward((0, player getPlayerAngles()[1], 0)), 60) + VectorScale((0, 0, 1), 5);
		powerup = zm_powerups::specific_powerup_drop(var_6c3b5312, orig);
	}
}

/*
	Name: function_99fbb1fb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x110A0
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 4805
*/
function function_99fbb1fb()
{
	points = randomIntRange(1, 25) * 100;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]))
		{
			if(0 > players[i].score - points)
			{
				players[i] zm_score::minus_to_player_score(players[i].score);
				continue;
			}
			players[i] zm_score::minus_to_player_score(points);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a43ee2fe
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x111B8
	Size: 0x1E0
	Parameters: 0
	Flags: None
	Line Number: 4835
*/
function function_a43ee2fe()
{
	origs = [];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		var_c7329054 = spawn("script_model", players[i].origin);
		var_c7329054 SetModel("tag_origin");
		var_c7329054.angles = players[i] getPlayerAngles();
		origs[origs.size] = var_c7329054;
	}
	wait(0.1);
	origs = Array::randomize(origs);
	for(i = 0; i < players.size; i++)
	{
		players[i] SetOrigin(origs[i].origin);
		players[i] SetPlayerAngles(origs[i].angles);
	}
	wait(1);
	for(i = 0; i < origs.size; i++)
	{
		origs[i] delete();
	}
	return;
}

/*
	Name: function_806afd9a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x113A0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 4871
*/
function function_806afd9a()
{
	level endon("hash_f74da493");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] setblur(5, 0.1);
		}
		wait(1);
	}
}

/*
	Name: function_f74da493
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11440
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 4895
*/
function function_f74da493()
{
	level notify("hash_f74da493");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setblur(0, 0.1);
	}
}

/*
	Name: function_3d7c6349
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x114C8
	Size: 0x558
	Parameters: 0
	Flags: None
	Line Number: 4915
*/
function function_3d7c6349()
{
	locs = [];
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!isdefined(vending_triggers[i].var_51baeddc))
		{
			fxOrg = spawn("script_model", vending_triggers[i].machine.origin);
			fxOrg SetModel("tag_origin");
			fxOrg.angles = vending_triggers[i].machine.angles;
			locs[locs.size] = fxOrg;
		}
	}
	locs = Array::randomize(locs);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!isdefined(vending_triggers[i].var_51baeddc))
		{
			clip = vending_triggers[i].clip;
			machine = vending_triggers[i].machine;
			bump_trigger = vending_triggers[i].bump_trigger;
			machine.origin = locs[i].origin;
			clip.origin = locs[i].origin;
			bump_trigger.origin = locs[i].origin + VectorScale((0, 0, 1), 20);
			machine.angles = locs[i].angles;
			machine RotateTo(locs[i].angles, 0.2);
			clip.angles = locs[i].angles;
			bump_trigger.angles = locs[i].angles;
			vending_triggers[i].origin = locs[i].origin + VectorScale((0, 0, 1), 60);
			machine.angles = locs[i].angles;
		}
	}
	wait(1);
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(!isdefined(vending_triggers[i].var_51baeddc))
		{
			clip = vending_triggers[i].clip;
			machine = vending_triggers[i].machine;
			bump_trigger = vending_triggers[i].bump_trigger;
			machine.origin = locs[i].origin;
			clip.origin = locs[i].origin;
			bump_trigger.origin = locs[i].origin + VectorScale((0, 0, 1), 20);
			machine.angles = locs[i].angles;
			machine RotateTo(locs[i].angles, 0.2);
			clip.angles = locs[i].angles;
			bump_trigger.angles = locs[i].angles;
			vending_triggers[i].origin = locs[i].origin + VectorScale((0, 0, 1), 60);
			machine.angles = locs[i].angles;
		}
	}
}

/*
	Name: function_2b9a66a7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11A28
	Size: 0x280
	Parameters: 0
	Flags: None
	Line Number: 4981
*/
function function_2b9a66a7()
{
	level endon("hash_63f30232");
	while(1)
	{
		level waittill("weapon_bought", player, weapon);
		wait(0.05);
		if(player hasweapon(weapon))
		{
			player TakeWeapon(weapon);
			keys = Array::randomize(getArrayKeys(level.zombie_weapons));
			for(i = 0; i < keys.size; i++)
			{
				if(isdefined(keys[i].isgrenadeweapon) && keys[i].isgrenadeweapon)
				{
					continue;
				}
				if(isdefined(keys[i].isMeleeWeapon) && keys[i].isMeleeWeapon)
				{
					continue;
				}
				if(zm_weapons::get_is_in_box(keys[i]))
				{
					guns[guns.size] = keys[i];
				}
			}
			guns = Array::randomize(guns);
			gun = guns[0];
			weapon_limit = zm_utility::get_player_weapon_limit(player);
			Primaries = player getweaponslistprimaries();
			if(isdefined(Primaries) && Primaries.size >= weapon_limit)
			{
				gun = player zm_weapons::weapon_give(gun);
			}
			else
			{
				gun = player zm_weapons::give_build_kit_weapon(gun);
				player GiveStartAmmo(gun);
			}
			player SwitchToWeapon(gun);
		}
	}
}

/*
	Name: function_63f30232
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11CB0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5035
*/
function function_63f30232()
{
	level notify("hash_63f30232");
}

/*
	Name: function_e836287a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11CD0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 5050
*/
function function_e836287a()
{
	level endon("hash_8fba27d7");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].bgb_tone_death))
			{
				a_ai[i].bgb_tone_death = 1;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_8fba27d7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11DD0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 5077
*/
function function_8fba27d7()
{
	level notify("hash_8fba27d7");
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && isdefined(a_ai[i].bgb_tone_death))
		{
			a_ai[i].bgb_tone_death = undefined;
		}
	}
}

/*
	Name: function_ee1a46cd
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11EB0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 5100
*/
function function_ee1a46cd()
{
	level.wallbuy_should_upgrade_weapon_override = 1;
}

/*
	Name: function_dabdebdc
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11EC8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 5115
*/
function function_dabdebdc()
{
	level.wallbuy_should_upgrade_weapon_override = undefined;
	return;
	ERROR: Bad function call
}

/*
	Name: function_689e8469
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11EE0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 5132
*/
function function_689e8469()
{
	level.var_a4cae63d = 1;
}

/*
	Name: function_d68bdeba
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11EF8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 5147
*/
function function_d68bdeba()
{
	level.var_a4cae63d = undefined;
}

/*
	Name: function_a6539f1a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11F10
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 5162
*/
function function_a6539f1a()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_45263fde();
	}
	return;
}

/*
	Name: function_45263fde
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11F80
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 5182
*/
function function_45263fde()
{
	self endon("disconnect");
	perk = self zm_perks::give_random_perk();
	level waittill("hash_33ae0601");
	self notify(perk + "_stop");
}

/*
	Name: function_33ae0601
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11FD8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5200
*/
function function_33ae0601()
{
	level notify("hash_33ae0601");
}

/*
	Name: function_1df9a5a5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x11FF8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 5215
*/
function function_1df9a5a5()
{
	level.zombie_total = level.zombie_total + level.zombie_ai_limit;
}

/*
	Name: function_48ccfb4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12020
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5230
*/
function function_48ccfb4()
{
	SetDvar("phys_gravity_dir", (0, 0, -1));
}

/*
	Name: function_6ab25d6f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12050
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5245
*/
function function_6ab25d6f()
{
	SetDvar("phys_gravity_dir", (0, 0, 1));
}

/*
	Name: function_12f5266e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12080
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 5260
*/
function function_12f5266e()
{
	level endon("hash_3f5de903");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] Hide();
		}
		wait(1);
	}
}

/*
	Name: function_58c0da73
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12110
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 5284
*/
function function_58c0da73()
{
	level notify("hash_3f5de903");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] show();
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_e6abb664
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12190
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 5306
*/
function function_e6abb664()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_f69f09c8();
	}
}

/*
	Name: function_f69f09c8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12200
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 5325
*/
function function_f69f09c8()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	gun = self GetCurrentWeapon();
	primaryWeapons = self getweaponslistprimaries();
	for(a = 0; a < primaryWeapons.size; a++)
	{
		if(primaryWeapons[a] != gun)
		{
			self SwitchToWeapon(primaryWeapons[a]);
		}
	}
	wait(0.1);
	self.var_97c73248 = undefined;
}

/*
	Name: function_a374cec9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12300
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 5356
*/
function function_a374cec9()
{
	level endon("hash_e0335d04");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_a374cec9))
			{
				a_ai[i].var_a374cec9 = 1;
				a_ai[i] thread function_6bb22de4();
			}
		}
		wait(0.1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_6bb22de4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12420
	Size: 0x380
	Parameters: 0
	Flags: None
	Line Number: 5386
*/
function function_6bb22de4()
{
	self thread function_18320ed5();
	self Hide();
	level endon("hash_e0335d04");
	var_a8b0a967 = spawn("script_model", self.origin);
	var_a8b0a967.angles = self.angles;
	var_a8b0a967 SetModel(self.model);
	var_a8b0a967.mover = spawn("script_model", self.origin);
	var_a8b0a967.mover SetModel("tag_origin");
	var_a8b0a967 EnableLinkTo();
	var_a8b0a967 LinkTo(var_a8b0a967.mover, "tag_origin");
	var_a8b0a967.mover EnableLinkTo();
	var_a8b0a967 LinkTo(self, "tag_origin");
	var_a8b0a967.attaches = [];
	SIZE = self getattachsize();
	for(i = 0; i < SIZE.size; i++)
	{
		tag_name = self getAttachTagName(i);
		model_name = self getAttachModelName(i);
		var_a8b0a967 Attach(model_name, tag_name, 1);
	}
	if(isdefined(self GetCharacterHeadModel()))
	{
		var_a8b0a967 Attach(self GetCharacterHeadModel(), "", 1);
	}
	if(isdefined(self.Headmodel))
	{
		var_a8b0a967 Attach(self.Headmodel, "", 1);
	}
	if(isdefined(self.hatModel))
	{
		var_a8b0a967 Attach(self.hatModel, "", 1);
	}
	self.var_a1c878e3 = var_a8b0a967;
	self util::waittill_any("death", "stop_t_pose_zombies");
	if(isdefined(var_a8b0a967.mover))
	{
		var_a8b0a967.mover delete();
	}
	if(isdefined(var_a8b0a967))
	{
		var_a8b0a967 delete();
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_18320ed5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x127A8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 5444
*/
function function_18320ed5()
{
	self endon("death");
	self endon("hash_e0335d04");
	while(1)
	{
		wait(1);
		self Hide();
	}
}

/*
	Name: function_e0335d04
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x127F0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 5465
*/
function function_e0335d04()
{
	level notify("hash_e0335d04");
	a_ai = GetAIArray();
	for(i = 0; i < a_ai.size; i++)
	{
		if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
		{
			a_ai[i] notify("hash_e0335d04");
			a_ai[i].var_a374cec9 = undefined;
			a_ai[i] show();
			if(isdefined(a_ai[i].var_a1c878e3.mover))
			{
				a_ai[i].var_a1c878e3.mover delete();
			}
			if(isdefined(a_ai[i].var_a1c878e3))
			{
				a_ai[i].var_a1c878e3 delete();
			}
		}
	}
}

/*
	Name: function_cca49011
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12978
	Size: 0x468
	Parameters: 0
	Flags: None
	Line Number: 5498
*/
function function_cca49011()
{
	zombie_doors = GetEntArray("zombie_door", "targetname");
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	var_b6010451 = [];
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(!isdefined(zombie_debris[i].script_noteworthy) || zombie_debris[i].script_noteworthy != "electric_door" || zombie_debris[i].script_noteworthy != "electric_buyable_door" || (!isdefined(zombie_debris[i].has_been_opened) || (isdefined(zombie_debris[i].has_been_opened) && !zombie_debris[i].has_been_opened)))
		{
			var_b6010451[var_b6010451.size] = zombie_debris[i];
		}
	}
	var_c2244aff = [];
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(!isdefined(zombie_doors[i].script_noteworthy) || zombie_doors[i].script_noteworthy != "electric_door" || zombie_doors[i].script_noteworthy != "electric_buyable_door" || (!isdefined(zombie_doors[i].has_been_opened) || (isdefined(zombie_doors[i].has_been_opened) && !zombie_doors[i].has_been_opened)))
		{
			var_c2244aff[var_c2244aff.size] = zombie_doors[i];
		}
	}
	if(isdefined(var_c2244aff) && var_c2244aff.size > 0)
	{
		for(i = 0; i < var_c2244aff.size; i++)
		{
			if(!isdefined(var_c2244aff[i].var_67d6f4a7) && isdefined(var_c2244aff[i].zombie_cost))
			{
				var_c2244aff[i].var_67d6f4a7 = var_c2244aff[i].zombie_cost;
			}
			price = var_c2244aff[i] function_f91f5d90();
			var_c2244aff[i].zombie_cost = price;
			var_c2244aff[i] zm_utility::set_hint_string(var_c2244aff[i], "default_buy_door", price);
		}
	}
	else if(isdefined(var_b6010451) && var_b6010451.size > 0)
	{
		for(i = 0; i < var_b6010451.size; i++)
		{
			if(!isdefined(var_b6010451[i].var_67d6f4a7) && isdefined(var_b6010451[i].zombie_cost))
			{
				var_b6010451[i].var_67d6f4a7 = var_b6010451[i].zombie_cost;
			}
			price = var_b6010451[i] function_f91f5d90();
			var_b6010451[i].zombie_cost = price;
			var_b6010451[i] zm_utility::set_hint_string(var_b6010451[i], "default_buy_debris", price);
		}
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f91f5d90
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12DE8
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 5558
*/
function function_f91f5d90()
{
	price = self.zombie_cost;
	if(isdefined(self.var_67d6f4a7))
	{
		price = self.var_67d6f4a7;
	}
	min = Int(price * 0.25);
	max = Int(price * 2.5);
	var_75a31c6b = randomIntRange(min, max);
	var_fcca47c7 = 10;
	while(var_fcca47c7 < var_75a31c6b)
	{
		var_fcca47c7 = var_fcca47c7 + 250;
		if(var_fcca47c7 < var_75a31c6b)
		{
			var_fcca47c7 = var_fcca47c7 + 250;
		}
		util::wait_network_frame();
	}
	return var_fcca47c7 - 10;
}

/*
	Name: function_da34b2a4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x12F20
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 5591
*/
function function_da34b2a4()
{
	foreach(barrier in level.exterior_goals)
	{
		if(isdefined(barrier.zbarrier))
		{
			for(x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++)
			{
				barrier.zbarrier SetZBarrierPieceState(x, "opening");
			}
		}
		else if(isdefined(barrier.clip))
		{
			barrier.clip TriggerEnable(0);
			barrier.clip connectpaths();
		}
	}
}

/*
	Name: function_a2216843
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13078
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5620
*/
function function_a2216843()
{
	level thread function_2a1db7c3("anti_carpentr");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_3aad4065
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x130A8
	Size: 0x2A8
	Parameters: 0
	Flags: None
	Line Number: 5637
*/
function function_3aad4065()
{
	level endon("hash_9a22e068");
	var_1450bf2 = 0;
	var_d68f7b65 = 0;
	while(1)
	{
		player = GetPlayers()[0];
		team = player.team;
		if(level.zombie_vars[team]["zombie_insta_kill"] > 0 && var_1450bf2 == 0)
		{
			player [[level._custom_powerups["insta_kill"].grab_powerup]](player);
			var_1450bf2 = 15;
		}
		if(level.zombie_vars[team]["zombie_point_scalar"] > 1 && var_d68f7b65 == 0)
		{
			player [[level._custom_powerups["double_points"].grab_powerup]](player);
			var_d68f7b65 = 15;
		}
		if(level.zombie_vars["zombie_powerup_fire_sale_time"] > 0 && level.zombie_vars["zombie_powerup_fire_sale_time"] < 15)
		{
			player [[level._custom_powerups["fire_sale"].grab_powerup]]();
		}
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].zombie_vars["zombie_powerup_minigun_time"] > 0 && players[i].zombie_vars["zombie_powerup_minigun_time"] < 15)
			{
				players[i] [[level._custom_powerups["minigun"].grab_powerup]](players[i]);
			}
		}
		wait(0.5);
		if(var_1450bf2 > 0)
		{
			var_1450bf2 = var_1450bf2 - 0.5;
		}
		if(var_d68f7b65 > 0)
		{
			var_d68f7b65 = var_d68f7b65 - 0.5;
		}
	}
}

/*
	Name: function_9a22e068
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13358
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5690
*/
function function_9a22e068()
{
	level notify("hash_9a22e068");
}

/*
	Name: function_75f6cce9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13378
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 5705
*/
function function_75f6cce9()
{
	var_e12bdfbb = 10;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		var_e12bdfbb = var_e12bdfbb + players[i].score;
	}
	var_e12bdfbb = var_e12bdfbb - 10;
	var_2ac06564 = Int(var_e12bdfbb / GetPlayers().size);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::minus_to_player_score(players[i].score);
		players[i] zm_score::add_to_player_score(var_2ac06564);
	}
}

/*
	Name: function_8ed6e32f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x134D8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5733
*/
function function_8ed6e32f()
{
	function_db145f0b(&function_7f2249e2);
}

/*
	Name: function_675d427c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13508
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 5748
*/
function function_675d427c()
{
	function_1fb9469c(&function_7f2249e2);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_7f2249e2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13538
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 5765
*/
function function_7f2249e2(points)
{
	return points - points * 3;
}

/*
	Name: function_657cfcd0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13560
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 5780
*/
function function_657cfcd0()
{
	level endon("bonfire_sale_off");
	while(1)
	{
		level notify("powerup_bonfire_sale");
		wait(1);
	}
}

/*
	Name: function_da0ccb4d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13598
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 5800
*/
function function_da0ccb4d()
{
	level notify("bonfire_sale_off");
}

/*
	Name: function_fd993613
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x135B8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 5815
*/
function function_fd993613()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] function_c75d735f();
	}
	return;
}

/*
	Name: function_c75d735f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13628
	Size: 0x290
	Parameters: 0
	Flags: None
	Line Number: 5835
*/
function function_c75d735f()
{
	self endon("disconnect");
	while(!self namespace_851dc78f::function_1275e2ff())
	{
		wait(0.1);
	}
	self.var_97c73248 = 1;
	camo = randomIntRange(1, 126);
	weapon = self GetCurrentWeapon();
	weapon = zm_weapons::get_nonalternate_weapon(weapon);
	swap_weapon = weapon.rootweapon;
	self TakeWeapon(weapon);
	primaryWeapons = self getweaponslistprimaries();
	if(isdefined(primaryWeapons) && primaryWeapons.size > 0)
	{
		self SwitchToWeaponImmediate(primaryWeapons[0]);
	}
	wait(0.1);
	upgrade_weapon = self function_1c80616(weapon, camo);
	self GiveStartAmmo(weapon);
	self SwitchToWeaponImmediate(weapon);
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(primaryWeapons[i].rootweapon == swap_weapon)
		{
			self SetWeaponAmmoStock(primaryWeapons[i], primaryWeapons[i].maxAmmo);
			self SetWeaponAmmoClip(primaryWeapons[i], primaryWeapons[i].clipSize);
			self SwitchToWeaponImmediate(primaryWeapons[i]);
		}
	}
	wait(0.1);
	self.var_97c73248 = undefined;
}

/*
	Name: function_1c80616
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x138C0
	Size: 0x230
	Parameters: 2
	Flags: None
	Line Number: 5881
*/
function function_1c80616(weapon, camo)
{
	upgraded = 0;
	base_weapon = weapon;
	if(zm_weapons::is_weapon_upgraded(weapon))
	{
		upgraded = 1;
		base_weapon = zm_weapons::get_base_weapon(weapon);
	}
	if(zm_weapons::is_weapon_included(base_weapon))
	{
		force_attachments = zm_weapons::get_force_attachments(base_weapon.rootweapon);
	}
	if(isdefined(force_attachments) && force_attachments.size)
	{
		if(upgraded)
		{
			packed_attachments = [];
			packed_attachments[packed_attachments.size] = "extclip";
			packed_attachments[packed_attachments.size] = "fmj";
			force_attachments = ArrayCombine(force_attachments, packed_attachments, 0, 0);
		}
		weapon = GetWeapon(weapon.rootweapon.name, force_attachments);
		if(!isdefined(camo))
		{
			camo = 0;
		}
		weapon_options = self CalcWeaponOptions(camo, 0, 0);
		acvi = 0;
	}
	else
	{
		weapon = self getbuildkitweapon(weapon, upgraded);
		weapon_options = self getbuildkitweaponoptions(weapon, camo);
		acvi = self GetBuildKitAttachmentCosmeticVariantIndexes(weapon, upgraded);
	}
	self GiveWeapon(weapon, weapon_options, acvi);
	return weapon;
}

/*
	Name: function_401cd31f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13AF8
	Size: 0x228
	Parameters: 0
	Flags: None
	Line Number: 5931
*/
function function_401cd31f()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		var_37dbc5df = 10;
		perk = vending_triggers[i].script_noteworthy;
		if(IsFunctionPtr(level._custom_perks[perk].cost))
		{
			var_37dbc5df = [[level._custom_perks[perk].cost]]();
			level._custom_perks[perk].var_f445b4d2 = var_37dbc5df;
			var_37dbc5df = Int(var_37dbc5df * 2);
		}
		else
		{
			level._custom_perks[perk].var_f445b4d2 = level._custom_perks[perk].cost;
			var_37dbc5df = level._custom_perks[perk].cost * 2;
		}
		vending_triggers[i].cost = var_37dbc5df;
		if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].hint_string) && function_4fb326ba(perk))
		{
			vending_triggers[i] setHintString(level._custom_perks[perk].hint_string, var_37dbc5df);
		}
		vending_triggers[i] thread zm_perks::reset_vending_hint_string();
	}
}

/*
	Name: function_7d0d3290
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13D28
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 5968
*/
function function_7d0d3290()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		var_37dbc5df = 10;
		perk = vending_triggers[i].script_noteworthy;
		if(isdefined(level._custom_perks[perk].var_f445b4d2))
		{
			var_37dbc5df = Int(level._custom_perks[perk].var_f445b4d2);
		}
		else if(IsFunctionPtr(level._custom_perks[perk].cost))
		{
			var_37dbc5df = [[level._custom_perks[perk].cost]]();
			var_37dbc5df = var_37dbc5df / 2;
		}
		else
		{
			var_37dbc5df = Int(level._custom_perks[perk].cost / 2);
		}
		level._custom_perks[perk].cost = var_37dbc5df;
		vending_triggers[i].cost = var_37dbc5df;
		if(isdefined(level._custom_perks[perk]) && isdefined(level._custom_perks[perk].hint_string) && function_4fb326ba(perk))
		{
			vending_triggers[i] setHintString(level._custom_perks[perk].hint_string, var_37dbc5df);
		}
		vending_triggers[i] thread zm_perks::reset_vending_hint_string();
	}
}

/*
	Name: function_4fb326ba
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13F78
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 6008
*/
function function_4fb326ba(perk)
{
	if(isdefined(level.var_8d715f4b) && isdefined(level.var_8d715f4b[perk]))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_697a6946
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x13FB8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 6027
*/
function function_697a6946()
{
	while(1)
	{
		perk = self.script_noteworthy;
		var_fb1cd1b2 = perk + "_on";
		level waittill(var_fb1cd1b2);
		if(!isdefined(level.var_8d715f4b))
		{
			level.var_8d715f4b = [];
		}
		level.var_8d715f4b[perk] = 1;
		str_off = perk + "_off";
		level waittill(str_off);
		level.var_8d715f4b[perk] = undefined;
	}
}

/*
	Name: function_c727ae27
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14068
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 6055
*/
function function_c727ae27()
{
	level.var_97c29bb4 = 0;
	level endon("hash_7bc413fc");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_ab46df55();
		players[i] thread function_9ad9da59();
		players[i] thread function_8e159edf();
	}
}

/*
	Name: function_ab46df55
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14130
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 6078
*/
function function_ab46df55()
{
	self endon("disconnect");
	level endon("hash_7bc413fc");
	while(1)
	{
		self waittill("perk_bought", perk);
		if(!level.var_97c29bb4)
		{
			level.var_97c29bb4 = 1;
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(players[i] != self && players[i] namespace_851dc78f::function_1275e2ff())
				{
					players[i] thread zm_perks::give_perk(perk);
				}
			}
			wait(0.1);
			level.var_97c29bb4 = 0;
		}
	}
}

/*
	Name: function_9ad9da59
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14238
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 6112
*/
function function_9ad9da59()
{
	self endon("disconnect");
	level endon("hash_7bc413fc");
	while(1)
	{
		self waittill("weapon_give", weapon);
		if(!level.var_97c29bb4)
		{
			level.var_97c29bb4 = 1;
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(players[i] != self && players[i] namespace_851dc78f::function_1275e2ff())
				{
					weap = players[i] zm_weapons::weapon_give(weapon);
					players[i] SwitchToWeapon(weap);
				}
			}
			wait(0.1);
			level.var_97c29bb4 = 0;
		}
	}
}

/*
	Name: function_8e159edf
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14370
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 6147
*/
function function_8e159edf()
{
	self endon("disconnect");
	level endon("hash_7bc413fc");
	self.var_2dcec731 = self.bgb;
	while(1)
	{
		if(self.bgb != self.var_2dcec731 && self.bgb != "none" && !level.var_97c29bb4)
		{
			level.var_97c29bb4 = 1;
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				if(players[i] != self && players[i] namespace_851dc78f::function_1275e2ff())
				{
					players[i] namespace_851dc78f::givegobblegum(function_b4705b81(self.bgb), 0);
					players[i].var_2dcec731 = self.bgb;
					self.var_2dcec731 = self.bgb;
				}
			}
			wait(2);
			level.var_97c29bb4 = 0;
		}
		wait(0.5);
	}
}

/*
	Name: function_7bc413fc
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x144E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 6184
*/
function function_7bc413fc()
{
	level notify("hash_7bc413fc");
}

/*
	Name: function_da8f0f73
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14500
	Size: 0x360
	Parameters: 0
	Flags: None
	Line Number: 6199
*/
function function_da8f0f73()
{
	player = GetPlayers()[0];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]))
		{
			player = players[i];
		}
	}
	traps = GetEntArray("zombie_trap", "targetname");
	traps = ArrayCombine(traps, struct::get_array("zombie_trap", "targetname"), 1, 0);
	traps = ArrayCombine(traps, GetEntArray("trap_finger", "targetname"), 1, 0);
	traps = ArrayCombine(traps, GetEntArray("trap_bunker", "targetname"), 1, 0);
	if(isdefined(traps) && traps.size > 0)
	{
		for(i = 0; i < traps.size; i++)
		{
			active = 0;
			if(isdefined(traps[i].script_string) && "disable_wait_for_power" == traps[i].script_string)
			{
				active = 1;
			}
			else if(isdefined(traps[i].script_int) && flag::get("power_on" + traps[i].script_int))
			{
				active = 1;
			}
			else if(level flag::get("power_on"))
			{
				active = 1;
			}
			if(active)
			{
				if(isdefined(traps[i].zombie_cost))
				{
					player zm_score::add_to_player_score(traps[i].zombie_cost);
				}
				for(a = 0; a < traps[i]._trap_use_trigs.size; a++)
				{
					traps[i]._trap_use_trigs[a] notify("trigger", player);
				}
			}
			wait(0.1);
		}
	}
}

/*
	Name: function_7c9cb050
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14868
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 6257
*/
function function_7c9cb050()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_e60938a7();
	}
}

/*
	Name: function_e60938a7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x148D8
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 6276
*/
function function_e60938a7()
{
	self.var_3aac52a1 = spawn("script_model", self.origin + VectorScale((0, 0, 1), 30));
	self.var_3aac52a1 SetModel("tag_origin");
	var_a01f1ddb = self.var_3aac52a1;
	self.var_3aac52a1 namespace_851dc78f::function_4621bbdd("scriptmover", "chaos_mod_fog", 1);
	while(isdefined(self.var_3aac52a1) && isdefined(self))
	{
		self.var_3aac52a1 moveto(self.origin + VectorScale((0, 0, 1), 30), 0.2);
		wait(0.1);
	}
	if(isdefined(var_a01f1ddb))
	{
		var_a01f1ddb delete();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bdea9a37
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14A00
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 6305
*/
function function_bdea9a37()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].var_3aac52a1))
		{
			players[i].var_3aac52a1 namespace_851dc78f::function_4621bbdd("scriptmover", "chaos_mod_fog", 0);
			players[i].var_3aac52a1 delete();
		}
	}
}

/*
	Name: function_8c9552bc
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14AC8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6328
*/
function function_8c9552bc()
{
	function_341018ec(&function_330b1d7d);
}

/*
	Name: function_6b28a53b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14AF8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6343
*/
function function_6b28a53b()
{
	function_568a36b7(&function_330b1d7d);
}

/*
	Name: function_330b1d7d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14B28
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 6358
*/
function function_330b1d7d(points)
{
	return points;
}

/*
	Name: function_6acf0ddf
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14B40
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6373
*/
function function_6acf0ddf()
{
	function_341018ec(&function_e8340a0a);
}

/*
	Name: function_4e8c4974
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14B70
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6388
*/
function function_4e8c4974()
{
	function_568a36b7(&function_e8340a0a);
}

/*
	Name: function_e8340a0a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14BA0
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 6403
*/
function function_e8340a0a(points)
{
	return points - points * 2;
	ERROR: Bad function call
}

/*
	Name: max_ammo
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14BC8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 6419
*/
function max_ammo()
{
	players = GetPlayers();
	players[RandomInt(players.size)].hint = level.zombie_powerups["full_ammo"].hint;
	players[RandomInt(players.size)] [[level._custom_powerups["full_ammo"].grab_powerup]](players[RandomInt(players.size)]);
}

/*
	Name: function_8e21df9e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14C90
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6436
*/
function function_8e21df9e()
{
	function_341018ec(&function_2600db55);
}

/*
	Name: function_4bf7c1db
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14CC0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6451
*/
function function_4bf7c1db()
{
	function_568a36b7(&function_2600db55);
}

/*
	Name: function_2600db55
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14CF0
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 6466
*/
function function_2600db55(points)
{
	return points * 2;
}

/*
	Name: function_ef0ba2c5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14D10
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6481
*/
function function_ef0ba2c5()
{
	function_68b7934d(&function_55e36dd5);
}

/*
	Name: function_55e36dd5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14D40
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 6496
*/
function function_55e36dd5()
{
	keys = Array::randomize(getArrayKeys(level.zombie_weapons));
	pap_triggers = zm_pap_util::get_triggers();
	var_ec0a59d7 = [];
	for(i = 0; i < keys.size; i++)
	{
		if(IsSubStr(keys[i].name, "ray"))
		{
			var_ec0a59d7[var_ec0a59d7.size] = keys[i];
		}
	}
	if(var_ec0a59d7.size < 1)
	{
		return keys;
	}
	return var_ec0a59d7;
}

/*
	Name: function_6f8e3f74
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14E40
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6525
*/
function function_6f8e3f74()
{
	function_f3e3a3fa(&function_55e36dd5);
}

/*
	Name: function_68b7934d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14E70
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 6540
*/
function function_68b7934d(func)
{
	if(!isdefined(level.var_cf90eb70))
	{
		level.var_cf90eb70 = [];
	}
	level.var_cf90eb70[level.var_cf90eb70.size] = func;
}

/*
	Name: function_f3e3a3fa
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14EB8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 6559
*/
function function_f3e3a3fa(func)
{
	if(!isdefined(level.var_cf90eb70))
	{
		level.var_cf90eb70 = [];
	}
	ArrayRemoveValue(level.var_cf90eb70, func);
	return;
	~level.var_cf90eb70;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fd838130
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14F08
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 6581
*/
function function_fd838130()
{
	if(self zm_utility::get_player_hero_weapon() == level.weaponNone)
	{
		return 0;
	}
	if(!isdefined(self.hero_power))
	{
		self.hero_power = 0;
	}
	if(self.hero_power >= 100)
	{
		return 0;
	}
	if(self GadgetPowerGet(0) == 100)
	{
		return 0;
	}
	if(isdefined(self.disable_hero_power_charging) && self.disable_hero_power_charging)
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_11271f75
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x14FA8
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 6616
*/
function function_11271f75()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] function_fd838130())
		{
			hero_weapon = players[i] zm_utility::get_player_hero_weapon();
			players[i].hero_power = 100;
			players[i] [[level._hero_weapons[hero_weapon].power_full_fn]](hero_weapon);
			players[i] GadgetPowerSet(0, players[i].hero_power);
			players[i] clientfield::set_player_uimodel("zmhud.swordEnergy", players[i].hero_power / 100);
			players[i] SetWeaponAmmoClip(hero_weapon, hero_weapon.clipSize);
		}
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_b2d1200e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15128
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 6645
*/
function function_b2d1200e()
{
	can = 1;
	if(self zm_utility::get_player_hero_weapon() == level.weaponNone)
	{
		can = 0;
	}
	if(!isdefined(self.hero_power))
	{
		self.hero_power = 0;
	}
	if(isdefined(self.disable_hero_power_charging) && self.disable_hero_power_charging)
	{
		can = 0;
	}
	return can;
}

/*
	Name: function_4796289f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x151B0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 6673
*/
function function_4796289f()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] function_b2d1200e())
		{
			hero_weapon = players[i] zm_utility::get_player_hero_weapon();
			players[i].hero_power = 0;
			players[i] [[level._hero_weapons[hero_weapon].power_empty_fn]](hero_weapon);
			players[i] GadgetPowerSet(0, players[i].hero_power);
			players[i] clientfield::set_player_uimodel("zmhud.swordEnergy", players[i].hero_power / 100);
			players[i] SetWeaponAmmoClip(hero_weapon, 0);
		}
	}
}

/*
	Name: function_86373f12
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15320
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 6700
*/
function function_86373f12()
{
	level thread nuke_flash(GetPlayers()[0].team);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: nuke_flash
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15368
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 6717
*/
function nuke_flash(team)
{
	if(isdefined(team))
	{
		GetPlayers()[0] playsoundtoteam("evt_nuke_flash", team);
	}
	else
	{
		GetPlayers()[0] playsound("evt_nuke_flash");
	}
	LUI::screen_flash(0.2, 0.5, 1, 0.8, "white");
}

/*
	Name: function_23dc0be8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15420
	Size: 0x820
	Parameters: 0
	Flags: None
	Line Number: 6740
*/
function function_23dc0be8()
{
	game_over = [];
	survived = [];
	players = GetPlayers();
	SetMatchFlag("disableIngameMenu", 1);
	foreach(player in players)
	{
		player closeInGameMenu();
		player CloseMenu("StartMenu_Main");
	}
	for(i = 0; i < players.size; i++)
	{
		game_over[i] = newClientHudElem(players[i]);
		survived[i] = newClientHudElem(players[i]);
		game_over[i].alignX = "center";
		game_over[i].alignY = "middle";
		game_over[i].horzAlign = "center";
		game_over[i].vertAlign = "middle";
		game_over[i].y = game_over[i].y - 130;
		game_over[i].foreground = 1;
		game_over[i].fontscale = 3;
		game_over[i].alpha = 0;
		game_over[i].color = (1, 1, 1);
		game_over[i].hidewheninmenu = 1;
		game_over[i] setText(&"ZOMBIE_GAME_OVER");
		game_over[i] fadeOverTime(1);
		game_over[i].alpha = 1;
		if(players[i] IsSplitscreen())
		{
			game_over[i].fontscale = 2;
			game_over[i].y = game_over[i].y + 40;
		}
		survived[i].alignX = "center";
		survived[i].alignY = "middle";
		survived[i].horzAlign = "center";
		survived[i].vertAlign = "middle";
		survived[i].y = survived[i].y - 100;
		survived[i].foreground = 1;
		survived[i].fontscale = 2;
		survived[i].alpha = 0;
		survived[i].color = (1, 1, 1);
		survived[i].hidewheninmenu = 1;
		if(players[i] IsSplitscreen())
		{
			survived[i].fontscale = 1.5;
			survived[i].y = survived[i].y + 40;
		}
		if(level.round_number < 2)
		{
			if(level.script == "zm_moon")
			{
				if(!isdefined(level.left_nomans_land))
				{
					nomanslandtime = level.nml_best_time;
					player_survival_time = Int(nomanslandtime / 1000);
					player_survival_time_in_mins = zm::to_mins(player_survival_time);
					survived[i] setText(&"ZOMBIE_SURVIVED_NOMANS", player_survival_time_in_mins);
				}
				else if(level.left_nomans_land == 2)
				{
					survived[i] setText(&"ZOMBIE_SURVIVED_ROUND");
				}
			}
			else
			{
				survived[i] setText(&"ZOMBIE_SURVIVED_ROUND");
			}
		}
		else
		{
			survived[i] setText(&"ZOMBIE_SURVIVED_ROUNDS", level.round_number);
		}
		survived[i] fadeOverTime(1);
		survived[i].alpha = 1;
	}
	LUINotifyEvent(&"force_scoreboard", 1, 1);
	for(i = 0; i < players.size; i++)
	{
		players[i] setClientUIVisibilityFlag("weapon_hud_visible", 0);
		players[i] SetClientMiniScoreboardHide(1);
	}
	wait(2);
	for(i = 0; i < players.size; i++)
	{
		game_over[i] setText("JUST KIDDING");
	}
	wait(1);
	for(i = 0; i < players.size; i++)
	{
		survived[i] destroy();
		game_over[i] destroy();
		players[i] setClientUIVisibilityFlag("weapon_hud_visible", 1);
		players[i] SetClientMiniScoreboardHide(0);
	}
	SetMatchFlag("disableIngameMenu", 0);
	LUINotifyEvent(&"force_scoreboard", 1, 0);
	return;
	ERROR: Bad function call
}

/*
	Name: function_174135d4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15C48
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 6851
*/
function function_174135d4()
{
	level.perk_purchase_limit++;
}

/*
	Name: function_df419982
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15C60
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 6866
*/
function function_df419982()
{
	level.perk_purchase_limit++;
}

/*
	Name: function_b51f143f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15C78
	Size: 0x1E8
	Parameters: 0
	Flags: None
	Line Number: 6881
*/
function function_b51f143f()
{
	player = function_4bf4ac40();
	orig = player.origin + VectorScale(AnglesToForward((0, player getPlayerAngles()[1], 0)), 60) + VectorScale((0, 0, 1), 6);
	powerup = zm_powerups::specific_powerup_drop(level.zombie_powerup_array[0], orig);
	rotate = spawn("script_model", orig);
	for(i = 1; i < level.zombie_powerup_array.size; i++)
	{
		powerup = zm_powerups::specific_powerup_drop(level.zombie_powerup_array[i], rotate.origin + VectorScale(AnglesToForward((0, rotate.angles[1], 0)), 60) + VectorScale((0, 0, 1), 4));
		rot = 360 / level.zombie_powerup_array.size - 1;
		rotate.angles = rotate.angles + (0, rot, 0);
	}
	rotate delete();
}

/*
	Name: function_216669ac
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15E68
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6906
*/
function function_216669ac()
{
	namespace_3b75c34a::function_4e972a8e(&function_8534fd7d);
	return;
	ERROR: Bad function call
}

/*
	Name: function_4492eb6d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15E98
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 6923
*/
function function_4492eb6d()
{
	namespace_3b75c34a::function_20b8a0e9(&function_8534fd7d);
	level notify("hash_4492eb6d");
}

/*
	Name: function_8534fd7d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15ED8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 6939
*/
function function_8534fd7d()
{
	level endon("hash_4492eb6d");
	while(isdefined(self))
	{
		selected_player = function_de296a25(self.origin);
		self moveto(selected_player.origin + VectorScale((0, 0, 1), 32), Distance(self.origin, selected_player.origin) / 100);
		wait(0.1);
	}
}

/*
	Name: function_de296a25
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x15F88
	Size: 0xD8
	Parameters: 1
	Flags: None
	Line Number: 6960
*/
function function_de296a25(origin)
{
	players = GetPlayers();
	nearest = players[0];
	near_dist = 1000000;
	for(i = 0; i < players.size; i++)
	{
		var_6ca18a11 = Distance(origin, players[i]);
		if(var_6ca18a11 < near_dist)
		{
			nearest = players[i];
			near_dist = var_6ca18a11;
		}
	}
	return nearest;
}

/*
	Name: function_2c6d10c1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16068
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 6987
*/
function function_2c6d10c1()
{
	function_db145f0b(&function_5160f758);
	return;
}

/*
	Name: function_e83c62b2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16098
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 7003
*/
function function_e83c62b2()
{
	function_1fb9469c(&function_5160f758);
}

/*
	Name: function_5160f758
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x160C8
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 7018
*/
function function_5160f758(points)
{
	return points * 2;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1f18ba9f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x160E8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 7034
*/
function function_1f18ba9f()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] clientfield::set_player_uimodel("death_perception", 2);
	}
}

/*
	Name: function_ef6a884
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16168
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 7053
*/
function function_ef6a884()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] namespace_851dc78f::function_5f9a13b3("specialty_da_death_perception") && !players[i] namespace_851dc78f::function_b690a849("specialty_da_death_perception"))
		{
			players[i] clientfield::set_player_uimodel("death_perception", 1);
			continue;
		}
		if(!players[i] namespace_851dc78f::function_5f9a13b3("specialty_da_death_perception"))
		{
			players[i] clientfield::set_player_uimodel("death_perception", 0);
		}
	}
}

/*
	Name: random_speed
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16288
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 7080
*/
function random_speed()
{
	level endon("hash_bca21f21");
	while(1)
	{
		a_zombies = zombie_utility::get_round_enemy_array();
		for(i = 0; i < a_zombies.size; i++)
		{
			speed = 0.2;
			speed = speed * RandomInt(8);
			if(isdefined(a_zombies[i].completed_emerging_into_playable_area) && a_zombies[i].completed_emerging_into_playable_area)
			{
				a_zombies[i] ASMSetAnimationRate(speed);
			}
		}
		wait(1);
	}
}

/*
	Name: function_bca21f21
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16380
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 7109
*/
function function_bca21f21()
{
	level notify("hash_bca21f21");
	wait(0.1);
	a_zombies = zombie_utility::get_round_enemy_array();
	for(i = 0; i < a_zombies.size; i++)
	{
		a_zombies[i] ASMSetAnimationRate(1);
	}
}

/*
	Name: function_deeb696f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16410
	Size: 0x2E8
	Parameters: 0
	Flags: None
	Line Number: 7130
*/
function function_deeb696f()
{
	level endon("hash_ba1e4e1d");
	var_40bb1daa = 1440000;
	while(1)
	{
		allai = GetAIArray();
		foreach(ai in allai)
		{
			if(isalive(ai) && !ai IsPaused() && ai.team == level.zombie_team && !ai ishidden() && (!isdefined(ai.bgbIgnoreFearInHeadlights) && ai.bgbIgnoreFearInHeadlights))
			{
				ai SetEntityPaused(1);
			}
		}
		var_72507ad3 = [];
		var_8f426a9e = [];
		foreach(ai in allai)
		{
			if(isdefined(ai.aat_turned) && ai.aat_turned && ai IsPaused())
			{
				ai SetEntityPaused(0);
				continue;
			}
			if(isdefined(ai) && isdefined(self))
			{
				if(Distance2DSquared(ai.origin, self.origin) >= var_40bb1daa)
				{
					var_72507ad3[var_72507ad3.size] = ai;
					continue;
				}
			}
			var_8f426a9e[var_8f426a9e.size] = ai;
		}
		function_6e608823(var_72507ad3, 1);
		function_6e608823(var_8f426a9e, 0, 75);
		wait(0.05);
	}
}

/*
	Name: function_7e68c88e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16700
	Size: 0x2C8
	Parameters: 0
	Flags: None
	Line Number: 7179
*/
function function_7e68c88e()
{
	level endon("hash_57630390");
	var_40bb1daa = 1440000;
	while(1)
	{
		allai = GetAIArray();
		foreach(ai in allai)
		{
			if(isalive(ai) && ai.team == level.zombie_team && !ai ishidden() && (!isdefined(ai.bgbIgnoreFearInHeadlights) && ai.bgbIgnoreFearInHeadlights))
			{
				ai SetEntityPaused(0);
			}
		}
		var_72507ad3 = [];
		var_8f426a9e = [];
		foreach(ai in allai)
		{
			if(isdefined(ai.aat_turned) && ai.aat_turned && ai IsPaused())
			{
				ai SetEntityPaused(0);
				continue;
			}
			if(isdefined(ai) && isdefined(self))
			{
				if(Distance2DSquared(ai.origin, self.origin) >= var_40bb1daa)
				{
					var_72507ad3[var_72507ad3.size] = ai;
					continue;
				}
			}
			var_8f426a9e[var_8f426a9e.size] = ai;
		}
		function_6e608823(var_72507ad3, 1, undefined, 1);
		function_6e608823(var_8f426a9e, 0, 75, 1);
		wait(0.05);
	}
}

/*
	Name: function_6e608823
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x169D0
	Size: 0x1F0
	Parameters: 4
	Flags: None
	Line Number: 7228
*/
function function_6e608823(allai, trace, degree, reverse)
{
	if(!isdefined(degree))
	{
		degree = 45;
	}
	var_f1649153 = allai;
	players = GetPlayers();
	var_445b9352 = cos(degree);
	foreach(player in players)
	{
		var_f1649153 = player CantSeeEntities(var_f1649153, var_445b9352, trace);
	}
	foreach(ai in var_f1649153)
	{
		if(isalive(ai))
		{
			if(isdefined(reverse))
			{
				ai SetEntityPaused(1);
				continue;
			}
			ai SetEntityPaused(0);
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cfb9cfe2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16BC8
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 7267
*/
function function_cfb9cfe2()
{
	level notify("hash_ba1e4e1d");
	allai = GetAIArray();
	foreach(ai in allai)
	{
		ai SetEntityPaused(0);
	}
}

/*
	Name: function_775bd2eb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16C90
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 7287
*/
function function_775bd2eb()
{
	level notify("hash_57630390");
	allai = GetAIArray();
	foreach(ai in allai)
	{
		ai SetEntityPaused(0);
	}
}

/*
	Name: function_b2863267
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16D58
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 7307
*/
function function_b2863267()
{
	level endon("hash_d28a87a2");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] setPerk("specialty_ammodrainsfromstockfirst");
		}
		wait(1);
	}
}

/*
	Name: function_d28a87a2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16DF0
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 7331
*/
function function_d28a87a2()
{
	wait(0.1);
	level notify("hash_d28a87a2");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(!players[i] bgb::is_enabled("zm_bgb_stock_option") && !players[i] bgb::is_enabled("zm_bgb_disorderly_combat"))
		{
			players[i] unsetPerk("specialty_ammodrainsfromstockfirst");
		}
	}
}

/*
	Name: function_d7474e31
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x16ED0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 7355
*/
function function_d7474e31()
{
	var_e12bdfbb = 10;
	players = GetPlayers();
	richest = players[0];
	var_8b68368b = richest.score;
	for(i = 0; i < players.size; i++)
	{
		if(players[i].score > var_8b68368b)
		{
			var_8b68368b = players[i].score;
			richest = players[i];
		}
		var_e12bdfbb = var_e12bdfbb + players[i].score;
	}
	var_e12bdfbb = var_e12bdfbb - 10;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::minus_to_player_score(players[i].score);
	}
	richest zm_score::add_to_player_score(var_e12bdfbb);
}

/*
	Name: function_b830f207
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17068
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 7389
*/
function function_b830f207()
{
	var_e12bdfbb = 10;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		var_e12bdfbb = var_e12bdfbb + players[i].score;
	}
	var_e12bdfbb = var_e12bdfbb - 10;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] zm_score::minus_to_player_score(players[i].score);
	}
	players[RandomInt(players.size)] zm_score::add_to_player_score(var_e12bdfbb);
}

/*
	Name: danger_close
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x171A8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 7416
*/
function danger_close()
{
	level.var_11185527 = 1;
}

/*
	Name: function_d8a1cf40
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x171C0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 7431
*/
function function_d8a1cf40()
{
	level.var_11185527 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_bf875ccd
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x171D8
	Size: 0xD8
	Parameters: 10
	Flags: None
	Line Number: 7448
*/
function function_bf875ccd(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!isdefined(level.var_11185527))
	{
		return undefined;
	}
	switch(sMeansOfDeath)
	{
		case "MOD_ELECTOCUTED":
		case "MOD_EXPLOSIVE":
		case "MOD_EXPLOSIVE_SPLASH":
		case "MOD_FALLING":
		case "MOD_GRENADE":
		case "MOD_GRENADE_SPLASH":
		case "MOD_IMPACT":
		{
			iDamage = 0;
			return 0;
			break;
		}
		default
		{
		}
	}
	if(eAttacker == self)
	{
		return 0;
	}
	return undefined;
}

/*
	Name: function_35ef3719
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x172B8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 7489
*/
function function_35ef3719()
{
	level.custom_magic_box_do_weapon_rise = &function_e663632e;
}

/*
	Name: function_f7d8bb44
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x172E0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 7504
*/
function function_f7d8bb44()
{
	level.custom_magic_box_do_weapon_rise = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e663632e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x172F8
	Size: 0x248
	Parameters: 0
	Flags: None
	Line Number: 7521
*/
function function_e663632e()
{
	box = self;
	number_cycles = 40;
	model = spawn("script_model", self.origin);
	model.angles = (box.angles[0] * -1, box.angles[1] + 180, box.angles[2] * -1);
	if(isdefined(level.custom_magicbox_float_height))
	{
		v_float = anglesToUp(box.angles) * level.custom_magicbox_float_height;
	}
	else
	{
		v_float = anglesToUp(box.angles) * 40;
	}
	time = number_cycles * 0.04;
	model moveto(model.origin + v_float, time);
	model SetModel("tag_origin");
	for(i = 0; i < number_cycles; i++)
	{
		if(i < 20)
		{
			wait(0.05);
			continue;
		}
		if(i < 30)
		{
			wait(0.1);
			continue;
		}
		if(i < 35)
		{
			wait(0.2);
			continue;
		}
		if(i < 38)
		{
			wait(0.3);
		}
	}
	model delete();
	box thread function_e6041b85();
}

/*
	Name: function_e6041b85
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17548
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 7574
*/
function function_e6041b85()
{
	self.weapon_model SetModel("tag_origin");
	wait(0.1);
	self.weapon_model SetModel("tag_origin");
	wait(0.1);
	self.weapon_model SetModel("tag_origin");
}

/*
	Name: function_d3204f6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x175C8
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 7593
*/
function function_d3204f6()
{
	level endon("hash_dad7a3d7");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] [[level.bgb["zm_bgb_anywhere_but_here"].validation_func]]() && isdefined(players[i]))
			{
				players[i] [[level.bgb["zm_bgb_anywhere_but_here"].var_6fa3d682]]();
			}
		}
		if(players.size == 1)
		{
			wait(8);
		}
		if(players.size == 2)
		{
			wait(4);
		}
	}
	return;
}

/*
	Name: function_dad7a3d7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x176D0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 7628
*/
function function_dad7a3d7()
{
	level notify("hash_dad7a3d7");
}

/*
	Name: function_7dde0d0d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x176F0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 7643
*/
function function_7dde0d0d()
{
	level endon("hash_899bb6a6");
	while(1)
	{
		if(zombie_utility::get_current_zombie_count() < level.zombie_ai_limit)
		{
			if(isdefined(level.fn_custom_zombie_spawner_selection))
			{
				spawner = [[level.fn_custom_zombie_spawner_selection]]();
			}
			else if(isdefined(level.use_multiple_spawns) && level.use_multiple_spawns)
			{
				if(isdefined(level.spawner_int) && (isdefined(level.zombie_spawn[level.spawner_int].size) && level.zombie_spawn[level.spawner_int].size))
				{
					spawner = Array::random(level.zombie_spawn[level.spawner_int]);
				}
				else
				{
					spawner = Array::random(level.zombie_spawners);
				}
			}
			else
			{
				spawner = Array::random(level.zombie_spawners);
			}
			ai = zombie_utility::spawn_zombie(spawner, spawner.targetname);
		}
		wait(level.zombie_vars["zombie_spawn_delay"]);
	}
}

/*
	Name: function_899bb6a6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17860
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 7685
*/
function function_899bb6a6()
{
	level notify("hash_899bb6a6");
}

/*
	Name: function_876e2ded
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17880
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 7700
*/
function function_876e2ded()
{
	if(isdefined(level.custom_door_buy_check))
	{
		level.var_f9cc0147 = level.custom_door_buy_check;
	}
	level.custom_door_buy_check = &function_9daba401;
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	Array::thread_all(zombie_debris, &function_ae4099f);
}

/*
	Name: function_ae4099f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17910
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 7721
*/
function function_ae4099f()
{
	self moveto(self.origin + VectorScale((0, 0, 1), 100000), 0.3, 0.1, 0.1);
}

/*
	Name: function_67d0ccfc
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17968
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 7736
*/
function function_67d0ccfc()
{
	self moveto(self.origin - VectorScale((0, 0, 1), 100000), 0.3, 0.1, 0.1);
}

/*
	Name: function_9daba401
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x179C0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 7751
*/
function function_9daba401(door)
{
	return 0;
}

/*
	Name: function_716011ce
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x179D8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 7766
*/
function function_716011ce()
{
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	Array::thread_all(zombie_debris, &function_67d0ccfc);
	if(isdefined(level.var_f9cc0147))
	{
		level.custom_door_buy_check = level.var_f9cc0147;
	}
	else
	{
		level.custom_door_buy_check = undefined;
	}
}

/*
	Name: function_eeeb7151
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17A60
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 7790
*/
function function_eeeb7151()
{
	level endon("hash_7d11f864");
	while(1)
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie" && !isdefined(a_ai[i].var_d6508986))
			{
				a_ai[i].var_d6508986 = 1;
				a_ai[i] thread function_d6508986();
			}
		}
		wait(0.1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_d6508986
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17B80
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 7820
*/
function function_d6508986()
{
	level endon("hash_7d11f864");
	self waittill("death");
	if(isdefined(self.attacker) && isPlayer(self.attacker))
	{
		var_8be4db6f = spawn("script_model", self.origin + VectorScale((0, 0, 1), 30));
		var_8be4db6f SetModel("tag_origin");
		var_e5a92baa = [];
		var_e5a92baa[var_e5a92baa.size] = "zombie/fx_powerup_on_green_zmb";
		var_e5a92baa[var_e5a92baa.size] = "zombie/fx_powerup_on_red_zmb";
		FX = PlayFXOnTag(var_e5a92baa[RandomInt(var_e5a92baa.size)], var_8be4db6f, "tag_origin");
		var_8be4db6f moveto(self.attacker.origin + VectorScale((0, 0, 1), 30), 0.4);
		wait(0.4);
		var_8be4db6f delete();
	}
}

/*
	Name: function_7d11f864
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17D08
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 7848
*/
function function_7d11f864()
{
	level notify("hash_7d11f864");
}

/*
	Name: function_5adf9045
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17D28
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 7863
*/
function function_5adf9045()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] namespace_851dc78f::function_1275e2ff())
		{
			gun = players[i] GetCurrentWeapon();
			players[i] SetWeaponAmmoStock(gun, randomIntRange(0, gun.maxAmmo));
			players[i] SetWeaponAmmoClip(gun, randomIntRange(0, gun.clipSize));
		}
	}
}

/*
	Name: function_b319c2d0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17E50
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 7887
*/
function function_b319c2d0()
{
	level endon("hash_31430b83");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] setMoveSpeedScale(RandomFloatRange(0.5, 1.5));
		}
		wait(1);
	}
}

/*
	Name: function_31430b83
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17F00
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 7911
*/
function function_31430b83()
{
	level notify("hash_31430b83");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setMoveSpeedScale(1);
	}
}

/*
	Name: function_31f9e290
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17F88
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 7931
*/
function function_31f9e290()
{
	level.var_4f89c429 = 1;
}

/*
	Name: function_51eab995
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17FA0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 7946
*/
function function_51eab995()
{
	level.var_4f89c429 = undefined;
}

/*
	Name: function_766fb58b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17FB8
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 7961
*/
function function_766fb58b()
{
	while(level.var_2ae5808e != 0)
	{
		wait(0.1);
	}
	zm_utility::zombie_goto_round(1);
}

/*
	Name: function_b5ce0ba6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x17FF8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 7980
*/
function function_b5ce0ba6()
{
	maxround = level.round_number + 10 + Int(level.round_number / 2);
	if(maxround > 250)
	{
		maxround = 250;
	}
	while(level.var_2ae5808e != 0)
	{
		wait(0.1);
	}
	zm_utility::zombie_goto_round(RandomInt(maxround) + 1);
}

/*
	Name: function_f30aedc5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x180B0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 8004
*/
function function_f30aedc5()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_2e82af31();
	}
}

/*
	Name: function_2e82af31
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18120
	Size: 0x1D8
	Parameters: 0
	Flags: None
	Line Number: 8023
*/
function function_2e82af31()
{
	self endon("disconnect");
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)) || self zm_perks::has_perk_paused(perk))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		for(i = 0; i < PERKS.size; i++)
		{
			perk_str = PERKS[i] + "_stop";
			self notify(perk_str);
		}
		wait(0.5);
		for(i = 0; i < PERKS.size; i++)
		{
			perk = self zm_perks::give_random_perk();
		}
		return;
	}
}

/*
	Name: function_2e6c266f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18300
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 8066
*/
function function_2e6c266f()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_ee7ab48b();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ee7ab48b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18370
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 8087
*/
function function_ee7ab48b()
{
	self endon("disconnect");
	a_str_perks = getArrayKeys(level._custom_perks);
	PERKS = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)) || self zm_perks::has_perk_paused(perk))
		{
			PERKS[PERKS.size] = perk;
		}
	}
	if(PERKS.size > 0)
	{
		for(i = 0; i < PERKS.size; i++)
		{
			perk_str = PERKS[i] + "_stop";
			self notify(perk_str);
		}
	}
}

/*
	Name: function_3d673c43
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18508
	Size: 0x1A0
	Parameters: 0
	Flags: None
	Line Number: 8124
*/
function function_3d673c43()
{
	level.var_eec7e3db = 1;
	level endon("hash_87afd8ba");
	while(1)
	{
		var_7ba04a94 = 0;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].bgb == "zm_bgb_quacknarok")
			{
				var_7ba04a94 = 1;
			}
		}
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype == "zombie" && !isdefined(a_ai[i].var_7cb8d1bf) && !var_7ba04a94)
			{
				a_ai[i].var_7cb8d1bf = 1;
				a_ai[i] thread function_8dcce6a3();
			}
		}
		wait(0.1);
	}
	return;
	waittillframeend;
}

/*
	Name: function_87afd8ba
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x186B0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8164
*/
function function_87afd8ba()
{
	level.var_eec7e3db = undefined;
	level notify("hash_87afd8ba");
}

/*
	Name: function_8dcce6a3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x186D8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 8180
*/
function function_8dcce6a3()
{
	self Attach("p7_zm_bgb_plash_floatie_duck", "J_SpineLower", 1);
	self waittill("death");
	sound = "custom_bgb_quack_" + RandomInt(10);
	playsoundatposition(sound, self.origin);
}

/*
	Name: function_66126fc0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18760
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 8198
*/
function function_66126fc0()
{
	level.var_e5927e33 = 1;
}

/*
	Name: function_bca0596f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18778
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 8213
*/
function function_bca0596f()
{
	level.var_e5927e33 = undefined;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_e0b4cbfb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18790
	Size: 0xF0
	Parameters: 10
	Flags: None
	Line Number: 8230
*/
function function_e0b4cbfb(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, weapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(!isdefined(level.var_e5927e33))
	{
		return undefined;
	}
	self bgb::do_one_shot_use();
	zm_utility::play_sound_at_pos("purchase", self.origin);
	self zm_score::add_to_player_score(Int(iDamage * 2 * level.zombie_vars[self.team]["zombie_point_scalar"]));
	return undefined;
}

/*
	Name: function_a513f02e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18888
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 8252
*/
function function_a513f02e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] playsoundtoplayer("phone_call", players[i]);
	}
	phone = namespace_851dc78f::function_7d15591a("right", "bottom", "right", "bottom", -100, 200, 1, "chaos_mod_gta_phone", 100, 200, (1, 1, 1), -1);
	phone MoveOverTime(0.5);
	phone.y = 0;
	wait(0.5);
	wait(55);
	phone MoveOverTime(0.5);
	phone.y = 200;
	wait(0.5);
	phone destroy();
}

/*
	Name: function_715017b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x189F0
	Size: 0x1F0
	Parameters: 0
	Flags: None
	Line Number: 8280
*/
function function_715017b()
{
	audio = "phone_call_jd";
	image = "chaos_mod_gta_phone_darlek";
	length = 10;
	rand = RandomInt(2);
	if(rand == 0)
	{
		audio = "phone_call_noah";
		image = "chaos_mod_gta_phone_noah";
		length = 4;
	}
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] playsoundtoplayer(audio, players[i]);
	}
	phone = namespace_851dc78f::function_7d15591a("right", "bottom", "right", "bottom", -100, 200, 1, image, 100, 200, (1, 1, 1), -1);
	phone MoveOverTime(0.5);
	phone.y = 0;
	wait(0.5);
	wait(length - 0.5);
	phone MoveOverTime(0.5);
	phone.y = 200;
	wait(0.5);
	phone destroy();
	return;
}

/*
	Name: function_99b5dfa9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18BE8
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 8319
*/
function function_99b5dfa9(attacker)
{
	if(isdefined(self.attacker) && isPlayer(self.attacker) && isdefined(level.var_afa3f3d9))
	{
		self zombie_utility::zombie_eye_glow_stop();
		sound = "custom_bgb_flatulence_" + RandomInt(10);
		playsoundatposition(sound, self.origin);
		self StartRagdoll();
		self LaunchRagdoll(105 * VectorNormalize(self.origin - self.origin + VectorScale((0, 0, 1), 200)));
	}
	if(isdefined(self.attacker) && isPlayer(self.attacker) && isdefined(level.var_4b9725df))
	{
		self StartRagdoll();
		self LaunchRagdoll(405 * VectorNormalize(self.origin - self.origin + VectorScale((0, 0, 1), 1000)));
	}
}

/*
	Name: function_e4ee60e9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18D90
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 8346
*/
function function_e4ee60e9()
{
	level.var_afa3f3d9 = 1;
}

/*
	Name: function_5ff42f00
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18DA8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 8361
*/
function function_5ff42f00()
{
	level.var_afa3f3d9 = undefined;
}

/*
	Name: death_ragdoll
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18DC0
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 8376
*/
function death_ragdoll()
{
	level.var_4b9725df = 1;
}

/*
	Name: function_8a5a04ee
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18DD8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 8391
*/
function function_8a5a04ee()
{
	level.var_4b9725df = undefined;
}

/*
	Name: function_8d25cff6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18DF0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 8406
*/
function function_8d25cff6()
{
	level endon("hash_c8050b3b");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			var_33636f4a = namespace_851dc78f::function_9b84d8c6();
			players[i] thread namespace_851dc78f::givegobblegum(var_33636f4a, 0);
		}
		wait(RandomInt(8) + 5);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_c8050b3b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18EC0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 8433
*/
function function_c8050b3b()
{
	level notify("hash_c8050b3b");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_6382180b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18EE0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 8450
*/
function function_6382180b()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_dcf1a1c7();
	}
}

/*
	Name: function_dcf1a1c7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x18F50
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 8469
*/
function function_dcf1a1c7()
{
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
		{
			self TakeWeapon(primaryWeapons[i]);
		}
	}
	wait(0.1);
	for(i = 0; i < primaryWeapons.size; i++)
	{
		self function_4b1a1737();
	}
}

/*
	Name: function_96bdf36e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19048
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 8496
*/
function function_96bdf36e()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_3f8b542();
	}
}

/*
	Name: function_3f8b542
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x190B8
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 8515
*/
function function_3f8b542()
{
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		if(zm_weapons::is_weapon_included(primaryWeapons[i]) || zm_weapons::is_weapon_upgraded(primaryWeapons[i]))
		{
			self TakeWeapon(primaryWeapons[i]);
		}
	}
	wait(0.1);
	for(i = 0; i < primaryWeapons.size; i++)
	{
		self function_4b1a1737(1);
	}
}

/*
	Name: function_cc6f6cb8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x191B8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8542
*/
function function_cc6f6cb8()
{
	function_7b41c28f(2);
}

/*
	Name: function_e6cc72e1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x191E0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8557
*/
function function_e6cc72e1()
{
	function_44843306(2);
}

/*
	Name: function_118d14ab
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19208
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8572
*/
function function_118d14ab()
{
	function_7b41c28f(1.5);
	return;
	ERROR: Exception occured: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
}

/*
	Name: function_e49edba4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19230
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8590
*/
function function_e49edba4()
{
	function_44843306(1.5);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_361104c0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19258
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8607
*/
function function_361104c0()
{
	function_44843306(1.5);
	return;
}

/*
	Name: function_ba47fadb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19280
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8623
*/
function function_ba47fadb()
{
	function_7b41c28f(1.5);
}

/*
	Name: function_3eb14f37
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x192A8
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8638
*/
function function_3eb14f37()
{
	function_44843306(2);
}

/*
	Name: function_46402da
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x192D0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8653
*/
function function_46402da()
{
	function_7b41c28f(2);
}

/*
	Name: function_44843306
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x192F8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 8668
*/
function function_44843306(multi)
{
	if(!isdefined(level.var_230c3f48))
	{
		level.var_230c3f48 = 1;
	}
	setSlowMotion(level.var_230c3f48, level.var_230c3f48 * multi, 0.25);
	level.var_230c3f48 = level.var_230c3f48 * multi;
}

/*
	Name: function_7b41c28f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19368
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 8688
*/
function function_7b41c28f(multi)
{
	if(!isdefined(level.var_230c3f48))
	{
		level.var_230c3f48 = 1;
	}
	setSlowMotion(level.var_230c3f48, level.var_230c3f48 / multi, 0);
	level.var_230c3f48 = level.var_230c3f48 / multi;
}

/*
	Name: function_39376943
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x193D0
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 8708
*/
function function_39376943()
{
	level endon("hash_9c3aef2c");
	while(1)
	{
		Earthquake(0.25, 1.5, (0, 0, 0), 1000000);
		wait(1);
	}
}

/*
	Name: function_9c3aef2c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19428
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 8728
*/
function function_9c3aef2c()
{
	level notify("hash_9c3aef2c");
}

/*
	Name: function_9a3c6b1a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19448
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 8743
*/
function function_9a3c6b1a()
{
	level endon("hash_b1c04c6b");
	var_9a3c6b1a = undefined;
	while(!isdefined(var_9a3c6b1a))
	{
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(isdefined(a_ai[i]) && isalive(a_ai[i]) && !isdefined(var_9a3c6b1a) && (!(isdefined(a_ai[i].magic_bullet_shield) && a_ai[i].magic_bullet_shield)))
			{
				var_9a3c6b1a = a_ai[i];
				var_9a3c6b1a.magic_bullet_shield = 1;
				var_9a3c6b1a.allowdeath = 0;
				var_9a3c6b1a thread function_7ddd8c75();
			}
		}
		wait(0.1);
	}
	while(isdefined(var_9a3c6b1a))
	{
		var_9a3c6b1a.magic_bullet_shield = 1;
		var_9a3c6b1a.allowdeath = 0;
		wait(0.1);
	}
}

/*
	Name: function_7ddd8c75
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x195C0
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 8780
*/
function function_7ddd8c75()
{
	self endon("death");
	level waittill("hash_b1c04c6b");
	self.magic_bullet_shield = undefined;
	self.allowdeath = 1;
}

/*
	Name: function_b1c04c6b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19600
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 8798
*/
function function_b1c04c6b()
{
	level notify("hash_b1c04c6b");
}

/*
	Name: function_3c3c6579
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19620
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 8813
*/
function function_3c3c6579()
{
	level thread function_947679ec();
	level thread function_947679ec();
	level thread function_947679ec();
}

/*
	Name: function_947679ec
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19678
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 8830
*/
function function_947679ec()
{
	SetDvar("bot_AllowMovement", "1");
	SetDvar("bot_PressAttackBtn", "1");
	SetDvar("bot_PressMeleeBtn", "1");
	bot = undefined;
	bot = AddTestClient();
	bot.pers["isBot"] = 1;
	wait(0.5);
	bot [[level.spawnPlayer]]();
	level waittill("hash_77ae90ca");
	if(!bot IsTestClient())
	{
		return;
	}
	bot [[level.onBotRemove]]();
	bot BotDropClient();
}

/*
	Name: function_77ae90ca
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19798
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 8859
*/
function function_77ae90ca()
{
	level notify("hash_77ae90ca");
}

/*
	Name: function_5cd8988b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x197B8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 8874
*/
function function_5cd8988b()
{
	SetDvar("player_clipSizeMultiplier", 2);
}

/*
	Name: function_4783a94a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x197E8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 8889
*/
function function_4783a94a()
{
	SetDvar("player_clipSizeMultiplier", 1);
}

/*
	Name: function_90fff68f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19818
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 8904
*/
function function_90fff68f()
{
	SetDvar("player_clipSizeMultiplier", 0.5);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] namespace_851dc78f::function_1275e2ff())
		{
			players[i] thread function_581a4003();
		}
	}
}

/*
	Name: function_581a4003
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x198C8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 8927
*/
function function_581a4003()
{
	primaryWeapons = self getweaponslistprimaries();
	for(i = 0; i < primaryWeapons.size; i++)
	{
		self SetWeaponAmmoClip(primaryWeapons[i], primaryWeapons[i].clipSize / 2);
	}
}

/*
	Name: function_76b4d478
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19960
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 8946
*/
function function_76b4d478()
{
	SetDvar("slide_forceBaseSlide", 0);
	SetDvar("slide_maxTime", 300000);
}

/*
	Name: function_2fb8e0db
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x199A8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 8962
*/
function function_2fb8e0db()
{
	SetDvar("slide_maxTime", 550);
	SetDvar("playerEnergy_slideEnergyEnabled", 0);
}

/*
	Name: function_e3530071
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x199F0
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 8978
*/
function function_e3530071()
{
	SetDvar("cg_drawgun", 0);
}

/*
	Name: function_eeed2726
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19A18
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 8993
*/
function function_eeed2726()
{
	SetDvar("cg_drawgun", 1);
	return;
	continue;
}

/*
	Name: function_1d8971d9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19A48
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9010
*/
function function_1d8971d9()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].var_85da8a33 = level.var_6cb6a683;
	}
}

/*
	Name: function_8cbc76d8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19AB8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9029
*/
function function_8cbc76d8()
{
	level.var_6cb6a683 = level.var_6cb6a683 + 1000;
}

/*
	Name: function_ede9336f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19AD8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9044
*/
function function_ede9336f()
{
	level.var_6cb6a683 = level.var_6cb6a683 - 1000;
}

/*
	Name: function_78232fb5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19AF8
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 9059
*/
function function_78232fb5()
{
	level endon("hash_9f36a774");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].score > 0)
			{
				var_d4284696 = Int(players[i].score / 100);
				if(var_d4284696 < 1)
				{
					var_d4284696 = 1;
				}
				players[i] zm_score::minus_to_player_score(var_d4284696);
			}
		}
		wait(RandomInt(4) + 1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_9f36a774
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19C10
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9093
*/
function function_9f36a774()
{
	level notify("hash_9f36a774");
}

/*
	Name: function_2b26e49
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19C30
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 9108
*/
function function_2b26e49()
{
	level endon("hash_ecb02eb6");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			var_d4284696 = Int(players[i].score / 100);
			if(var_d4284696 < 1)
			{
				var_d4284696 = 1;
			}
			players[i] zm_score::add_to_player_score(var_d4284696);
		}
		wait(RandomInt(4) + 1);
	}
}

/*
	Name: function_ecb02eb6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19D30
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9137
*/
function function_ecb02eb6()
{
	level notify("hash_ecb02eb6");
}

/*
	Name: function_50049952
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19D50
	Size: 0x158
	Parameters: 0
	Flags: None
	Line Number: 9152
*/
function function_50049952()
{
	level endon("hash_c0cc3f8d");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			var_d4284696 = Int(players[i].score / 100);
			if(var_d4284696 < 1)
			{
				var_d4284696 = 1;
			}
			if(players[i].score > 0 && RandomInt(2) == 0)
			{
				players[i] zm_score::minus_to_player_score(var_d4284696);
				continue;
			}
			players[i] zm_score::add_to_player_score(var_d4284696);
		}
		wait(RandomInt(4) + 1);
	}
	return;
}

/*
	Name: function_c0cc3f8d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19EB0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9187
*/
function function_c0cc3f8d()
{
	level notify("hash_c0cc3f8d");
}

/*
	Name: function_e41f7ff1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x19ED0
	Size: 0x498
	Parameters: 0
	Flags: None
	Line Number: 9202
*/
function function_e41f7ff1()
{
	var_64b3da6a = GetEntArray("trigger_use", "classname");
	var_9d6076ae = GetEntArray("trigger_radius_use", "classname");
	var_b8481387 = zm_pap_util::get_triggers();
	combined = [];
	combined = ArrayCombine(combined, var_64b3da6a, 0, 0);
	combined = ArrayCombine(combined, var_9d6076ae, 0, 0);
	if(isdefined(level.chests) && isdefined(level.chest_index))
	{
		combined[combined.size] = level.chests[level.chest_index];
	}
	if(isdefined(var_b8481387) && var_b8481387.size > 0)
	{
		combined = ArrayCombine(combined, var_b8481387, 0, 0);
	}
	if(isdefined(level._unitriggers) && level._unitriggers.size > 0)
	{
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			stub = level._unitriggers.trigger_stubs[i];
			tn = stub.targetname;
			weap = stub.weapon;
			if(tn == "weapon_upgrade")
			{
				combined[combined.size] = stub;
			}
		}
	}
	combined = Array::randomize(combined);
	players = GetPlayers();
	p = players.size - 1;
	for(i = 0; i < combined.size; i++)
	{
		if(isdefined(self.script_noteworthy) && (self.script_noteworthy == "electric_door" || self.script_noteworthy == "electric_buyable_door" || self.script_noteworthy == "local_electric_door"))
		{
			continue;
		}
		if(isdefined(self.purchaser) || (isdefined(self._door_open) && self._door_open))
		{
			continue;
		}
		if(isdefined(combined[i].targetname))
		{
			if(combined[i].targetname == "zombie_door" || combined[i].targetname == "zombie_debris")
			{
				if(players[p] zm_score::can_player_purchase(combined[i].zombie_cost))
				{
					players[p] zm_score::minus_to_player_score(combined[i].zombie_cost);
					SetDvar("zombie_unlock_all", 1);
					wait(0.1);
					combined[i] notify("trigger", players[p], 1);
					wait(0.1);
					SetDvar("zombie_unlock_all", 0);
				}
			}
			else
			{
				combined[i] notify("trigger", players[p]);
			}
			players[p] IPrintLnBold(combined[i].targetname + " was triggered");
			p--;
			if(p < 0)
			{
				return;
			}
		}
	}
	return;
}

/*
	Name: function_366207d1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A370
	Size: 0x110
	Parameters: 0
	Flags: None
	Line Number: 9283
*/
function function_366207d1()
{
	level endon("hash_5480383e");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] clientfield::set_to_player("bucket_seed_01", 1);
			players[i] clientfield::set_to_player("bucket_seed_02", 1);
			players[i] clientfield::set_to_player("bucket_seed_03", 1);
			players[i] clientfield::set_to_player("has_island_seed", 3);
		}
		wait(1);
	}
}

/*
	Name: function_5480383e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A488
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9310
*/
function function_5480383e()
{
	level notify("hash_5480383e");
}

/*
	Name: function_d43085f8
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A4A8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 9325
*/
function function_d43085f8()
{
	var_4a0060c0 = GetEntArray("water_source", "targetname");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		var_4a0060c0[RandomInt(var_4a0060c0.size)] notify("trigger", players[i]);
	}
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_d141481b
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A560
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 9348
*/
function function_d141481b()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] clientfield::set_to_player("bucket_seed_01", 0);
		players[i] clientfield::set_to_player("bucket_seed_02", 0);
		players[i] clientfield::set_to_player("bucket_seed_03", 0);
		players[i] clientfield::set_to_player("has_island_seed", 0);
	}
}

/*
	Name: function_c7a07f2d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A650
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9370
*/
function function_c7a07f2d()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].beastlives = 0;
	}
}

/*
	Name: function_f9248726
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A6C0
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 9389
*/
function function_f9248726()
{
	level endon("hash_ff88f7c1");
	while(1)
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			players[i].beastlives = 1;
		}
		wait(1);
	}
}

/*
	Name: function_ff88f7c1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A750
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 9413
*/
function function_ff88f7c1()
{
	level notify("hash_ff88f7c1");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].beastlives = 1;
		if(GetPlayers().size == 1)
		{
			players[i].beastlives = 3;
		}
	}
}

/*
	Name: function_b7c5c6d1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A808
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 9437
*/
function function_b7c5c6d1()
{
	if(isdefined(self.altbody) && self.altbody)
	{
		return 0;
	}
	if(self.IS_DRINKING > 0 && (!(isdefined(self.var_ce25e278) && self.var_ce25e278)))
	{
		return 0;
	}
	if(self zm_utility::in_revive_trigger())
	{
		return 0;
	}
	if(self laststand::player_is_in_laststand())
	{
		return 0;
	}
	if(self IsThrowingGrenade())
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_6d5e1140
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1A8B0
	Size: 0x180
	Parameters: 0
	Flags: None
	Line Number: 9472
*/
function function_6d5e1140()
{
	players = GetPlayers();
	var_84d4e1ad = struct::get_array("beast_mode_kiosk", "targetname");
	for(i = 0; i < players.size; i++)
	{
		var_8042e4e2 = var_84d4e1ad[i];
		if(isdefined(var_8042e4e2.var_b55b4180) && var_8042e4e2.var_b55b4180)
		{
			var_8042e4e2.var_b55b4180 = 0;
		}
		if(players[i].beastlives < 1)
		{
			players[i].beastlives = 1;
		}
		wait(0.1);
		while(!players[i] function_b7c5c6d1())
		{
			wait(0.01);
		}
		if(!(isdefined(players[i].beastmode) && players[i].beastmode))
		{
			var_8042e4e2 notify("trigger", players[i]);
		}
	}
}

/*
	Name: function_feaada2a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AA38
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 9509
*/
function function_feaada2a()
{
	while(1)
	{
		level waittill("hash_9712055e", var_a67f7e);
		if(isdefined(var_a67f7e))
		{
			IPrintLnBold(var_a67f7e.targetname);
		}
	}
}

/*
	Name: function_159446ce
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AA90
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 9531
*/
function function_159446ce()
{
	for(i = 0; i < level.var_8ad0ec05.size; i++)
	{
		var_8042e4e2 = level.var_8ad0ec05[i];
		if(isdefined(var_8042e4e2.var_b55b4180) && var_8042e4e2.var_b55b4180)
		{
			var_8042e4e2.var_b55b4180 = 0;
		}
	}
}

/*
	Name: function_fcc6bba5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AB20
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9553
*/
function function_fcc6bba5()
{
	for(i = 0; i < level.var_8ad0ec05.size; i++)
	{
		var_8042e4e2 = level.var_8ad0ec05[i];
		var_8042e4e2 thread function_7237145f();
	}
}

/*
	Name: round_number
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AB90
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 9572
*/
function round_number()
{
	var_2c7e96f1 = 0;
	if(isdefined(level.round_number))
	{
		var_2c7e96f1 = level.round_number;
	}
	return var_2c7e96f1;
}

/*
	Name: function_7237145f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1ABC8
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 9592
*/
function function_7237145f()
{
	self notify("hash_7237145f");
	self endon("hash_7237145f");
	self.var_b55b4180 = 1;
	var_2c7e96f1 = round_number();
	while(round_number() - var_2c7e96f1 < 1)
	{
		level waittill("start_of_round");
	}
	self.var_b55b4180 = 0;
}

/*
	Name: function_a359e093
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AC58
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 9615
*/
function function_a359e093()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetModelLodBias(7);
	}
}

/*
	Name: function_70922ec6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1ACD0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9634
*/
function function_70922ec6()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetModelLodBias(0);
	}
}

/*
	Name: aimbot
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AD40
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9653
*/
function aimbot()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_e2227903();
	}
}

/*
	Name: function_e2227903
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1ADB0
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 9672
*/
function function_e2227903()
{
	self endon("disconnect");
	level endon("hash_89411d46");
	while(1)
	{
		if(self PlayerAds() > 0.3)
		{
			var_4fedf3c1 = undefined;
			a_ai = GetAIArray();
			for(i = 0; i < a_ai.size; i++)
			{
				if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
				{
					if(!isdefined(var_4fedf3c1) || (isdefined(var_4fedf3c1) && DistanceSquared(self.origin, a_ai[i].origin) < DistanceSquared(self.origin, var_4fedf3c1.origin)))
					{
						var_4fedf3c1 = a_ai[i];
					}
				}
			}
			if(isdefined(var_4fedf3c1))
			{
				if(isdefined(var_4fedf3c1 GetTagOrigin("j_head")))
				{
					self SetPlayerAngles(VectorToAngles(var_4fedf3c1 GetTagOrigin("j_head") - self GetTagOrigin("j_head")));
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_89411d46
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AFB8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9714
*/
function function_89411d46()
{
	level notify("hash_89411d46");
	return;
}

/*
	Name: function_b10009e2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1AFD8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9730
*/
function function_b10009e2()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_984e70f2();
	}
}

/*
	Name: function_984e70f2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B048
	Size: 0x210
	Parameters: 0
	Flags: None
	Line Number: 9749
*/
function function_984e70f2()
{
	self endon("disconnect");
	level endon("hash_5ddc9f65");
	while(1)
	{
		if(self PlayerAds() > 0.3)
		{
			var_4fedf3c1 = undefined;
			a_ai = GetAIArray();
			for(i = 0; i < a_ai.size; i++)
			{
				if(isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === "zombie")
				{
					if(!isdefined(var_4fedf3c1) || (isdefined(var_4fedf3c1) && DistanceSquared(self.origin, a_ai[i].origin) < DistanceSquared(self.origin, var_4fedf3c1.origin)))
					{
						var_4fedf3c1 = a_ai[i];
					}
				}
			}
			if(isdefined(var_4fedf3c1))
			{
				if(isdefined(var_4fedf3c1 GetTagOrigin("j_head")))
				{
					self SetPlayerAngles(VectorToAngles(var_4fedf3c1 GetTagOrigin("j_head") - self GetTagOrigin("j_head")) + VectorScale((0, 1, 0), 180));
				}
			}
		}
		wait(0.05);
	}
}

/*
	Name: function_5ddc9f65
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B260
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9791
*/
function function_5ddc9f65()
{
	level notify("hash_5ddc9f65");
	return;
}

/*
	Name: recoil
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B280
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9807
*/
function recoil()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_40e331f();
	}
}

/*
	Name: function_40e331f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B2F0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 9826
*/
function function_40e331f()
{
	self endon("disconnect");
	level endon("hash_85ecb61a");
	while(1)
	{
		self waittill("weapon_fired");
		angles = self getPlayerAngles();
		self SetPlayerAngles(angles + (RandomFloatRange(-5, 5), RandomFloatRange(-5, 5), RandomFloatRange(-5, 5)));
		wait(0.05);
	}
}

/*
	Name: function_85ecb61a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B3C0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 9849
*/
function function_85ecb61a()
{
	level notify("hash_85ecb61a");
}

/*
	Name: function_ff67c81c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B3E0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 9864
*/
function function_ff67c81c()
{
	level clientfield::set("chaos_sound_pitch", 2);
}

/*
	Name: function_906fbbf7
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B410
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 9879
*/
function function_906fbbf7()
{
	level clientfield::set("chaos_sound_pitch", 0);
}

/*
	Name: function_b8dbb1ef
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B440
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 9894
*/
function function_b8dbb1ef()
{
	level clientfield::set("chaos_sound_pitch", 1);
	return;
}

/*
	Name: function_cebcd063
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B470
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 9910
*/
function function_cebcd063()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_464f7233();
	}
}

/*
	Name: function_464f7233
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B4E0
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 9929
*/
function function_464f7233()
{
	self endon("disconnect");
	a_str_perks = getArrayKeys(level._custom_perks);
	var_1fe3dc49 = [];
	var_1248d30f = [];
	for(i = 0; i < a_str_perks.size; i++)
	{
		perk = a_str_perks[i];
		if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
		{
			continue;
		}
		if(!namespace_851dc78f::function_20dc5a15(perk) && self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && self namespace_851dc78f::function_5f9a13b3(perk)) || self zm_perks::has_perk_paused(perk))
		{
			var_1fe3dc49[var_1fe3dc49.size] = perk;
			if(isdefined(level.var_7280bfd8) && isdefined(level.var_7280bfd8[perk]) && isdefined(level.var_f3abde82) && !isdefined(level.var_f3abde82[perk]))
			{
				var_1248d30f[perk] = 1;
			}
		}
	}
	self thread namespace_851dc78f::givegobblegum(function_b4705b81("zm_bgb_perkaholic"), 0);
	wait(4);
	self function_ee7ab48b();
	wait(0.05);
	if(var_1fe3dc49.size > 0)
	{
		for(i = 0; i < var_1fe3dc49.size; i++)
		{
			self zm_perks::give_perk(var_1fe3dc49[i], 0, isdefined(var_1248d30f[var_1fe3dc49[i]]));
			if(isdefined(var_1248d30f[var_1fe3dc49[i]]))
			{
				self zm_perks::give_perk(var_1fe3dc49[i], 0, 1);
			}
		}
		return;
	}
}

/*
	Name: function_2ef22b24
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B760
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 9979
*/
function function_2ef22b24()
{
	level endon("hash_970a8337");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_ef6de950();
	}
	return;
}

/*
	Name: function_ef6de950
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B7E0
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 10000
*/
function function_ef6de950()
{
	self endon("disconnect");
	level endon("hash_970a8337");
	while(1)
	{
		self.var_4c8ed95c = self GetWeaponAmmoClip(self GetCurrentWeapon());
		self SetWeaponAmmoClip(self GetCurrentWeapon(), 0);
		wait(RandomFloatRange(0.1, 0.6));
		self SetWeaponAmmoClip(self GetCurrentWeapon(), self.var_4c8ed95c);
		wait(RandomFloatRange(0.1, 0.6));
	}
}

/*
	Name: function_970a8337
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B8D8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 10024
*/
function function_970a8337()
{
	level notify("hash_970a8337");
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetWeaponAmmoClip(players[i] GetCurrentWeapon(), players[i].var_4c8ed95c);
	}
}

/*
	Name: no_grenades
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1B988
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 10044
*/
function no_grenades()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(!players[i].is_zombie && (!(isdefined(players[i].altbody) && players[i].altbody)) && !players[i] laststand::player_is_in_laststand())
		{
			lethal_grenade = players[i] zm_utility::get_player_lethal_grenade();
			if(!players[i] hasweapon(lethal_grenade))
			{
				players[i] GiveWeapon(lethal_grenade);
			}
			players[i] SetWeaponAmmoClip(lethal_grenade, 0);
		}
	}
	return;
}

/*
	Name: function_2a7c54c1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BAD0
	Size: 0x148
	Parameters: 0
	Flags: None
	Line Number: 10072
*/
function function_2a7c54c1()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(!players[i].is_zombie && (!(isdefined(players[i].altbody) && players[i].altbody)) && !players[i] laststand::player_is_in_laststand())
		{
			lethal_grenade = players[i] zm_utility::get_player_lethal_grenade();
			if(!players[i] hasweapon(lethal_grenade))
			{
				players[i] GiveWeapon(lethal_grenade);
			}
			players[i] SetWeaponAmmoClip(lethal_grenade, 8);
		}
	}
}

/*
	Name: function_417cf277
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BC20
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 10099
*/
function function_417cf277()
{
	if(isdefined(level.craftable_shield_weapon))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			w_give = players[i] zm_weapons::weapon_give(GetWeapon(level.craftable_shield_weapon), 0, 1);
		}
	}
}

/*
	Name: function_8b29d95f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BCD0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 10121
*/
function function_8b29d95f()
{
	if(isdefined(level.craftable_shield_weapon))
	{
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] zm_weapons::has_weapon_or_upgrade(GetWeapon(level.craftable_shield_weapon)))
			{
				players[i] zm_weapons::weapon_take(GetWeapon(level.craftable_shield_weapon));
				players[i] TakeWeapon(GetWeapon(level.craftable_shield_weapon));
			}
		}
	}
}

/*
	Name: function_602d3342
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BDD0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 10147
*/
function function_602d3342()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].widows_wine_knife_override = &function_e;
		if(!players[i] hasweapon(GetWeapon("knife_plunger")))
		{
			players[i] zm_melee_weapon::award_melee_weapon("knife_plunger");
		}
	}
}

/*
	Name: function_e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BEA0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 10170
*/
function function_e()
{
}

/*
	Name: function_884ba8ec
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BEB0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10184
*/
function function_884ba8ec()
{
	level notify("rocket_blast");
}

/*
	Name: disco_inferno
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BED0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 10199
*/
function disco_inferno()
{
	level flag::set("ee_disco_inferno");
}

/*
	Name: function_b76c881
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BF00
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10214
*/
function function_b76c881()
{
	level notify("hash_d36a8645");
	return;
}

/*
	Name: function_8bcb72e9
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BF20
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10230
*/
function function_8bcb72e9()
{
	level notify("hash_8e13e4dd");
}

/*
	Name: function_2d773f5f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1BF40
	Size: 0x258
	Parameters: 0
	Flags: None
	Line Number: 10245
*/
function function_2d773f5f()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		num = RandomInt(8);
		if(num == 0)
		{
			level notify("hash_639bcfd1", players[i], "s_weasels_hat", "c_zom_dlc4_player_arlington_helmet", "j_head");
		}
		if(num == 1)
		{
			level notify("hash_639bcfd1", players[i], "s_helm_of_siegfried", "c_zom_dlc4_player_siegfried_helmet", "j_head");
		}
		if(num == 2)
		{
			level notify("hash_639bcfd1", players[i], "s_helm_of_the_king", "c_zom_dlc4_player_king_helmet", "j_head");
		}
		if(num == 3)
		{
			level notify("hash_639bcfd1", players[i], "s_dire_wolf_head", "c_zom_dlc4_player_direwolf_helmet", "j_head");
		}
		if(num == 4)
		{
			level notify("hash_639bcfd1", players[i], "s_keeper_skull_head", "c_zom_dlc4_player_keeper_helmet", "j_head");
		}
		if(num == 5)
		{
			level notify("hash_639bcfd1", players[i], "s_margwa_head", "c_zom_dlc4_player_margwa_helmet", "j_head");
		}
		if(num == 6)
		{
			level notify("hash_639bcfd1", players[i], "s_apothicon_mask", "c_zom_dlc4_player_apothican_helmet", "j_head");
		}
		if(num == 7)
		{
			level notify("hash_639bcfd1", players[i], "s_fury_head", "c_zom_dlc4_player_fury_helmet", "j_head");
		}
		wait(0.3);
	}
}

/*
	Name: function_963c03c6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C1A0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 10297
*/
function function_963c03c6()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_fb498692();
	}
	return;
}

/*
	Name: function_fb498692
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C210
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 10317
*/
function function_fb498692()
{
	self endon("disconnect");
	level endon("hash_e480c881");
	while(1)
	{
		self SetPlayerAngles(self getPlayerAngles() + VectorScale((0, 1, 0), 0.35));
		wait(0.05);
	}
}

/*
	Name: function_e480c881
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C280
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10338
*/
function function_e480c881()
{
	level notify("hash_e480c881");
}

/*
	Name: function_49c88df4
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C2A0
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 10353
*/
function function_49c88df4()
{
	player = function_4bf4ac40();
	orig = player.origin + VectorScale(AnglesToForward((0, player getPlayerAngles()[1], 0)), 60) + VectorScale((0, 0, 1), 6);
	powerups = [];
	for(i = 0; i < level.zombie_powerup_array.size; i++)
	{
		if(level.zombie_powerups[level.zombie_powerup_array[i]].zombie_grabbable == 1)
		{
			powerups[powerups.size] = i;
		}
	}
	powerup = zm_powerups::specific_powerup_drop(level.zombie_powerup_array[powerups[0]], orig);
	rotate = spawn("script_model", orig);
	for(i = 1; i < powerups.size; i++)
	{
		powerup = zm_powerups::specific_powerup_drop(level.zombie_powerup_array[powerups[i]], rotate.origin + VectorScale(AnglesToForward((0, rotate.angles[1], 0)), 60) + VectorScale((0, 0, 1), 4));
		rot = 360 / powerups.size - 1;
		rotate.angles = rotate.angles + (0, rot, 0);
	}
	rotate delete();
	return;
}

/*
	Name: function_66cb1c54
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C508
	Size: 0x260
	Parameters: 0
	Flags: None
	Line Number: 10387
*/
function function_66cb1c54()
{
	player = function_4bf4ac40();
	orig = player.origin + VectorScale(AnglesToForward((0, player getPlayerAngles()[1], 0)), 60) + VectorScale((0, 0, 1), 6);
	powerups = [];
	for(i = 0; i < level.zombie_powerup_array.size; i++)
	{
		if(level.zombie_powerups[level.zombie_powerup_array[i]].zombie_grabbable != 1)
		{
			powerups[powerups.size] = i;
		}
	}
	powerup = zm_powerups::specific_powerup_drop(level.zombie_powerup_array[powerups[0]], orig);
	rotate = spawn("script_model", orig);
	for(i = 1; i < powerups.size; i++)
	{
		powerup = zm_powerups::specific_powerup_drop(level.zombie_powerup_array[powerups[i]], rotate.origin + VectorScale(AnglesToForward((0, rotate.angles[1], 0)), 60) + VectorScale((0, 0, 1), 4));
		rot = 360 / powerups.size - 1;
		rotate.angles = rotate.angles + (0, rot, 0);
	}
	rotate delete();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_ed8f9890
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C770
	Size: 0x1A8
	Parameters: 0
	Flags: None
	Line Number: 10422
*/
function function_ed8f9890()
{
	if(isdefined(level._unitriggers))
	{
		candidates = [];
		weapons = [];
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			stub = level._unitriggers.trigger_stubs[i];
			tn = stub.targetname;
			weap = stub.weapon;
			if(tn == "weapon_upgrade" && isdefined(weap) && isdefined(level.zombie_weapons[stub.weapon]) && (!(isdefined(weap.isgrenadeweapon) && weap.isgrenadeweapon)))
			{
				candidates[candidates.size] = stub;
				weapons[weapons.size] = stub.weapon;
			}
		}
		weapons = Array::randomize(weapons);
		for(i = 0; i < candidates.size; i++)
		{
			candidates[i].weapon = weapons[i];
		}
	}
}

/*
	Name: function_f6a56e82
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1C920
	Size: 0x278
	Parameters: 0
	Flags: None
	Line Number: 10457
*/
function function_f6a56e82()
{
	if(isdefined(level._unitriggers))
	{
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			stub = level._unitriggers.trigger_stubs[i];
			tn = stub.targetname;
			weap = stub.weapon;
			if(tn == "weapon_upgrade" && isdefined(weap) && isdefined(level.zombie_weapons[weap]) && (!(isdefined(weap.isgrenadeweapon) && weap.isgrenadeweapon)))
			{
				cost = level.zombie_weapons[weap].cost / 10;
				min = Int(cost * 0.5);
				max = Int(cost * 2);
				cost = randomIntRange(min, max) * 10;
				level.zombie_weapons[weap].cost = cost;
				level.zombie_weapons[weap].ammo_cost = Int(cost / 2);
				stub.hint_string = zm_weapons::get_weapon_hint(stub.weapon);
				stub.cost = cost;
				stub.hint_parm1 = cost;
				level.weapon_cost_client_filled = 0;
				stub setHintString(stub.hint_string, cost);
			}
		}
	}
}

/*
	Name: function_b56e4c5a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CBA0
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 10494
*/
function function_b56e4c5a()
{
	icon = "chaos_mod_cat";
	rand = RandomInt(3);
	if(rand == 1)
	{
		icon = "chaos_mod_cat_two";
	}
	if(rand == 2)
	{
		icon = "chaos_mod_cat_three";
	}
	var_88e4abed = namespace_851dc78f::function_7d15591a("center", "top", "center", "top", randomIntRange(-150, 150), RandomInt(350), 1, icon, 200, 200, (1, 1, 1), -1);
	level waittill("hash_f2f931a1");
	var_88e4abed destroy();
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_f2f931a1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CCC8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10523
*/
function function_f2f931a1()
{
	level notify("hash_f2f931a1");
}

/*
	Name: function_3d9bcd5
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CCE8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 10538
*/
function function_3d9bcd5()
{
	level notify("dig_spots_respawn");
	wait(2);
	level notify("dig_spots_respawn");
	wait(2);
	level notify("dig_spots_respawn");
}

/*
	Name: function_8d66a75f
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CD30
	Size: 0x150
	Parameters: 0
	Flags: None
	Line Number: 10557
*/
function function_8d66a75f()
{
	var_f660ac46 = 0;
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(isdefined(player.dig_vars["has_shovel"]) && player.dig_vars["has_shovel"])
		{
			player.dig_vars["has_shovel"] = 0;
			player playsound("zmb_craftable_pickup");
			player.dig_vars["has_upgraded_shovel"] = 0;
			level clientfield::set("player" + player GetEntityNumber() + "hasItem", 0);
			var_f660ac46++;
		}
	}
	level notify("hash_2cb1286a", var_f660ac46);
}

/*
	Name: function_441e906a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CE88
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10586
*/
function function_441e906a()
{
	level notify("hash_823f3fc8");
	return;
	ERROR: Bad function call
}

/*
	Name: function_a82bee74
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CEA8
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 10603
*/
function function_a82bee74()
{
	player = function_4bf4ac40();
	player.score = player.score + 500;
	level.vh_tank.t_use notify("trigger", player);
	return;
}

/*
	Name: function_55c01e37
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CF18
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10621
*/
function function_55c01e37()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_b83c9141
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CF38
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10641
*/
function function_b83c9141()
{
	level notify("hash_2c59c86");
}

/*
	Name: function_e56feaaf
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1CF58
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 10656
*/
function function_e56feaaf()
{
	player = function_4bf4ac40();
	core = GetEnt("trigger_teleport_pad_0", "targetname");
	Pad = GetEnt(core.target, "targetname");
	core notify("trigger", player);
	wait(0.5);
	Pad notify("trigger", player);
	wait(0.5);
	core notify("trigger", player);
}

/*
	Name: function_a026e916
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D030
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 10678
*/
function function_a026e916()
{
	player = function_4bf4ac40();
	trigger = level.teleporter_pad_trig[RandomInt(level.teleporter_pad_trig.size)];
	trigger notify("trigger", player);
}

/*
	Name: function_559e5357
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D0A0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 10695
*/
function function_559e5357()
{
	level.var_3a9a3a1a = [];
	keys = getArrayKeys(level.zones);
	for(i = 0; i < level.zones.size; i++)
	{
		volume = level.zones[keys[i]].Volumes[0];
		level.var_3a9a3a1a[keys[i]] = volume.script_string;
		if(isdefined(volume.script_string) && volume.script_string == "gravity")
		{
			volume.script_string = "lowgravity";
			continue;
		}
		if(isdefined(volume.script_string) && volume.script_string == "lowgravity")
		{
			volume.script_string = "gravity";
		}
	}
}

/*
	Name: function_ff99bb12
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D1E8
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 10725
*/
function function_ff99bb12()
{
	keys = getArrayKeys(level.var_3a9a3a1a);
	keys = getArrayKeys(level.zones);
	for(i = 0; i < level.zones.size; i++)
	{
		volume = level.zones[keys[i]].Volumes[0];
		volume.script_string = level.var_3a9a3a1a[keys[i]];
	}
}

/*
	Name: function_5a3a09af
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D2B8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10746
*/
function function_5a3a09af()
{
	level notify("hash_958da580");
}

/*
	Name: function_bde64b1e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D2D8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10761
*/
function function_bde64b1e()
{
	level notify("hash_760a578f");
}

/*
	Name: function_83bc964d
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D2F8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 10776
*/
function function_83bc964d()
{
	level notify("hash_2af8c3ce");
}

/*
	Name: function_ae0e21cf
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D318
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 10791
*/
function function_ae0e21cf()
{
	level.var_4cfe011a = 1;
}

/*
	Name: function_6d717a28
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D330
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 10806
*/
function function_6d717a28()
{
	level.var_4cfe011a = undefined;
}

/*
	Name: function_f2d4d971
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D348
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 10821
*/
function function_f2d4d971()
{
	level notify("hash_56b3c09d");
	wait(0.3);
	level notify("hash_56b3c09d");
	wait(0.3);
	level notify("hash_56b3c09d");
}

/*
	Name: function_a641e0ed
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D398
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 10840
*/
function function_a641e0ed()
{
	Spawning = GetPlayers().size * 4;
	for(i = 0; i < Spawning; i++)
	{
		level notify("hash_8c92b825");
		wait(0.7);
	}
}

/*
	Name: function_a0cd20cb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D408
	Size: 0x130
	Parameters: 0
	Flags: None
	Line Number: 10860
*/
function function_a0cd20cb()
{
	player = function_4bf4ac40();
	var_57d36d0e = player clientfield::get_to_player("has_island_seed");
	for(i = 0; i < level.var_ac51aa3c.size; i++)
	{
		Plant = level.var_ac51aa3c[i];
		if(Plant.var_f2a52ffa.var_5530ba34 == 0)
		{
			if(!player clientfield::get_to_player("has_island_seed"))
			{
				player clientfield::set_to_player("has_island_seed", 3);
				wait(0.1);
			}
			Plant notify("hash_266cb4b5", player);
		}
		wait(0.1);
	}
	player clientfield::set_to_player("has_island_seed", var_57d36d0e);
}

/*
	Name: function_ba171191
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D540
	Size: 0x298
	Parameters: 0
	Flags: None
	Line Number: 10891
*/
function function_ba171191()
{
	player = undefined;
	valid = [];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]) && players[i] clientfield::get_to_player("bucket_held"))
		{
			valid[valid.size] = players[i];
		}
	}
	player = valid[RandomInt(valid.size)];
	if(isdefined(player))
	{
		var_23ccf829 = player clientfield::get_to_player("bucket_bucket_water_type");
		var_bf661531 = player clientfield::get_to_player("bucket_bucket_water_level");
		for(i = 0; i < level.var_ac51aa3c.size; i++)
		{
			Plant = level.var_ac51aa3c[i];
			if(Plant.var_f2a52ffa.var_5530ba34 == 1 && isdefined(player))
			{
				if(!player clientfield::get_to_player("bucket_bucket_water_level"))
				{
					player clientfield::set_to_player("bucket_bucket_water_level", 3);
					wait(0.1);
				}
				player clientfield::set_to_player("bucket_bucket_water_type", RandomInt(3) + 1);
				Plant notify("hash_266cb4b5", player);
			}
			wait(0.1);
		}
		if(isdefined(player))
		{
			player clientfield::set_to_player("bucket_bucket_water_type", var_23ccf829);
			player clientfield::set_to_player("bucket_bucket_water_level", var_bf661531);
			return;
		}
	}
	ERROR: Bad function call
}

/*
	Name: function_ed749fad
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D7E0
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 10943
*/
function function_ed749fad()
{
	valid = [];
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i]) && players[i] clientfield::get_to_player("bucket_held"))
		{
			valid[valid.size] = players[i];
		}
	}
	for(i = 0; i < valid.size; i++)
	{
		valid[i] clientfield::set_to_player("bucket_bucket_water_level", 0);
		valid[i] thread zm_craftables::player_show_craftable_parts_ui(undefined, "zmInventory.widget_bucket_parts", 0);
		valid[i].var_962ad028 = 0;
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4dcf66c3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D928
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 10974
*/
function function_4dcf66c3()
{
	spawner = Array::random(level.sonic_zombie_spawners);
	location = Array::random(level.zm_loc_types["napalm_location"]);
	ai = zombie_utility::spawn_zombie(spawner, spawner.targetname, location);
	if(isdefined(ai))
	{
		ai.spawn_point_override = location;
	}
}

/*
	Name: function_9a7c7f6e
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1D9D8
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 10995
*/
function function_9a7c7f6e()
{
	spawner = Array::random(level.napalm_zombie_spawners);
	location = Array::random(level.zm_loc_types["napalm_location"]);
	ai = zombie_utility::spawn_zombie(spawner, spawner.targetname, location);
	if(isdefined(ai))
	{
		ai.spawn_point_override = location;
	}
}

/*
	Name: function_d76f9aa6
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DA88
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 11016
*/
function function_d76f9aa6()
{
	level thread function_df19b4b4();
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_8cf10c62();
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8cf10c62
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DB10
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 11038
*/
function function_8cf10c62()
{
	self endon("disconnect");
	level endon("hash_9c621cbf");
	while(1)
	{
		self waittill("weapon_fired");
		num = 1;
		gun = self GetCurrentWeapon();
		if(gun.clipSize < 5)
		{
			num = 10;
		}
		if(gun.clipSize < 15)
		{
			num = 6;
		}
		if(gun.clipSize < 25)
		{
			num = 3;
		}
		level.var_6b394783 = level.var_6b394783 - num;
	}
}

/*
	Name: function_9c621cbf
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DBF8
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 11073
*/
function function_9c621cbf()
{
	level notify("hash_5cfd7b96");
	level notify("hash_9c621cbf");
	level.var_6b394783 = 0;
}

/*
	Name: function_5d8a3546
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DC28
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 11090
*/
function function_5d8a3546()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_3d82393a();
	}
}

/*
	Name: function_3d82393a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DC98
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 11109
*/
function function_3d82393a()
{
	self endon("disconnect");
	level endon("hash_cb8588a1");
	while(1)
	{
		self waittill("perk_bought", perk);
		while(!namespace_851dc78f::function_20dc5a15(perk) && !self hasPerk(perk) || (namespace_851dc78f::function_20dc5a15(perk) && !self namespace_851dc78f::function_5f9a13b3(perk)))
		{
			wait(0.1);
		}
		if(self zm_perks::give_random_perk())
		{
			self notify(perk + "_stop");
			level.var_6b394783 = level.var_6b394783 - 1;
		}
	}
}

/*
	Name: function_cb8588a1
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DD98
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 11138
*/
function function_cb8588a1()
{
	level notify("hash_cb8588a1");
	level.var_6b394783 = 0;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4a36f95
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DDC0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 11156
*/
function function_4a36f95()
{
	namespace_3b75c34a::function_4e972a8e(&function_52db056a, 1);
}

/*
	Name: function_b6bbdc50
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DDF8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 11171
*/
function function_b6bbdc50()
{
	namespace_3b75c34a::function_20b8a0e9(&function_52db056a);
	level notify("hash_b6bbdc50");
	level.var_6b394783 = 0;
}

/*
	Name: function_52db056a
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DE40
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 11188
*/
function function_52db056a()
{
	self endon("powerup_timedout");
	var_8d00e52d = "anti_" + self.powerup_name;
	if(isdefined(level._custom_powerups[var_8d00e52d]))
	{
		var_e7c63650 = self.powerup_name;
		self thread function_5a311370(var_e7c63650);
		self thread function_df82baa3(var_8d00e52d);
		self.powerup_name = var_8d00e52d;
		self waittill("powerup_grabbed");
		level.var_6b394783 = level.var_6b394783 - 1;
	}
}

/*
	Name: function_5a311370
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DF00
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 11213
*/
function function_5a311370(var_e7c63650)
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	level waittill("hash_b6bbdc50");
	self.powerup_name = var_e7c63650;
}

/*
	Name: function_df82baa3
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DF48
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 11231
*/
function function_df82baa3(var_8d00e52d)
{
	self endon("powerup_timedout");
	self endon("powerup_grabbed");
	level endon("hash_b6bbdc50");
	while(1)
	{
		self.powerup_name = var_8d00e52d;
		wait(0.05);
	}
}

/*
	Name: function_b23e8643
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1DFA0
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 11253
*/
function function_b23e8643()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] thread function_3744be77();
	}
}

/*
	Name: function_3744be77
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E010
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 11272
*/
function function_3744be77()
{
	self endon("disconnect");
	var_792beae7 = 0;
	level endon("hash_6cb4e480");
	while(1)
	{
		self waittill("damage", amount, attacker, direction_vec, point, type);
		amount = amount * 2;
		var_792beae7 = var_792beae7 + 1;
		self zm_score::minus_to_player_score(Int(amount * Int(var_792beae7 / 3 + 1)));
	}
}

/*
	Name: function_6cb4e480
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E100
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 11296
*/
function function_6cb4e480()
{
	level notify("hash_6cb4e480");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: look_down
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E120
	Size: 0x118
	Parameters: 0
	Flags: None
	Line Number: 11313
*/
function look_down()
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetPlayerAngles(players[i] getPlayerAngles() + VectorScale((1, 0, 0), 90));
	}
	wait(0.05);
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] SetPlayerAngles(players[i] getPlayerAngles() + VectorScale((1, 0, 0), 90));
	}
}

/*
	Name: function_8ae107f0
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E240
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 11338
*/
function function_8ae107f0()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i].machine))
		{
			vending_triggers[i].machine Hide();
		}
	}
}

/*
	Name: function_601b8983
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E2E0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 11360
*/
function function_601b8983()
{
	vending_triggers = GetEntArray("zombie_vending", "targetname");
	for(i = 0; i < vending_triggers.size; i++)
	{
		if(isdefined(vending_triggers[i].machine))
		{
			vending_triggers[i].machine show();
		}
	}
	return;
}

/*
	Name: function_9c3bbe3c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E380
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 11383
*/
function function_9c3bbe3c()
{
	level notify("hash_ff89f41d");
}

/*
	Name: function_bba2a762
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E3A0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 11398
*/
function function_bba2a762()
{
	level notify("hash_85da7ff5");
}

/*
	Name: function_1d99726c
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E3C0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 11413
*/
function function_1d99726c()
{
	level notify("hash_d71e9101");
	return;
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_cebf0421
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E3E0
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 11431
*/
function function_cebf0421()
{
	level notify("hash_d4db953e");
}

/*
	Name: function_bb5b21a2
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E400
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 11446
*/
function function_bb5b21a2()
{
	level notify("hash_7cd417f3");
}

/*
	Name: function_f6ce070
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E420
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 11461
*/
function function_f6ce070()
{
	player = function_4bf4ac40();
	if(isdefined(player))
	{
		player playsound("veh_qrdrone_takeoff");
		QR = SpawnVehicle("heli_quadrotor_zm", player.origin + VectorScale((0, 0, 1), 96), player.angles, "quadrotor_ai");
		QR thread quadrotor_death();
		QR thread follow_ent(player);
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: quadrotor_death
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E4F0
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 11485
*/
function quadrotor_death()
{
	self endon("death");
	wait(90);
	self delete();
}

/*
	Name: follow_ent
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E528
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 11502
*/
function follow_ent(e_followee)
{
	level endon("end_game");
	self endon("death");
	while(isdefined(e_followee))
	{
		if(!self.returning_home)
		{
			v_facing = e_followee getPlayerAngles();
			v_forward = AnglesToForward((0, v_facing[1], 0));
			candidate_goalpos = e_followee.origin + v_forward * 128;
			trace_goalpos = PhysicsTrace(self.origin, candidate_goalpos);
			if(trace_goalpos["position"] == candidate_goalpos)
			{
				self.current_pathto_pos = e_followee.origin + v_forward * 128;
			}
			else
			{
				self.current_pathto_pos = e_followee.origin + VectorScale((0, 0, 1), 60);
			}
			self.current_pathto_pos = self GetClosestPointOnNavVolume(self.current_pathto_pos, 100);
			if(!isdefined(self.current_pathto_pos))
			{
				self.current_pathto_pos = self.origin;
			}
		}
		wait(RandomFloatRange(1, 2));
	}
}

/*
	Name: function_ad782ffb
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E6D0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 11542
*/
function function_ad782ffb()
{
	for(i = 0; i < 4 * GetPlayers().size; i++)
	{
		spawner = Array::random(GetEntArray("quad_zombie_spawner", "script_noteworthy"));
		ai = zombie_utility::spawn_zombie(spawner, spawner.targetname);
		ai thread function_382a6c05();
		wait(0.2);
	}
}

/*
	Name: function_382a6c05
	Namespace: namespace_ac3f3f96
	Checksum: 0x424F4353
	Offset: 0x1E7A0
	Size: 0x294
	Parameters: 0
	Flags: None
	Line Number: 11563
*/
function function_382a6c05()
{
	self endon("death");
	wait(0.2);
	self notify("rise_anim_finished");
	self.in_the_ground = 0;
	self notify("risen", "find_flesh");
	self Unlink();
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self show();
	player = function_4bf4ac40();
	position = player.last_valid_position;
	if(isdefined(position))
	{
		N_RAPS_SPAWN_DIST_MIN = 450;
		N_RAPS_SPAWN_DIST_MAX = 900;
		query_result = PositionQuery_Source_Navigation(position, N_RAPS_SPAWN_DIST_MIN, N_RAPS_SPAWN_DIST_MAX, 200, 32, 16);
		if(query_result.data.size)
		{
			a_s_locs = Array::randomize(query_result.data);
			if(isdefined(a_s_locs))
			{
				foreach(s_loc in a_s_locs)
				{
					if(zm_utility::check_point_in_enabled_zone(s_loc.origin, 1, level.active_zones))
					{
						s_loc.origin = s_loc.origin + VectorScale((0, 0, 1), 16);
						self.zone_name = player zm_utility::get_current_zone(1);
						self ForceTeleport(s_loc.origin, self.angles, 1, 1);
						return;
					}
				}
			}
		}
	}
}

