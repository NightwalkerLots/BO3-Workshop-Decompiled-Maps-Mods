#include scripts\shared\spawner_shared;
#include scripts\shared\xmodelalias_shared;

#namespace namespace_e0ec58c4;

/*
	Name: init
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2138
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 15
*/
function init()
{
	spawner::add_global_spawn_function("axis", &function_cae106e8);
	function_5b0b47e4();
}

/*
	Name: function_cae106e8
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2180
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function function_cae106e8()
{
	self endon("death");
	if(isdefined(self) && self.archetype == "zombie" && self.team == level.zombie_team)
	{
		thread xmodelalias::apply();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_5b0b47e4
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x21E0
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 52
*/
function function_5b0b47e4()
{
	if(level.script == "zm_zod")
	{
		function_b27b76f5();
	}
	else if(level.script == "zm_factory")
	{
		function_fdc9240d();
	}
	else if(level.script == "zm_castle")
	{
		function_850fdb62();
	}
	else if(level.script == "zm_island")
	{
		function_6c97126b();
	}
	else if(level.script == "zm_stalingrad")
	{
		function_abbae36c();
	}
	else if(level.script == "zm_genesis")
	{
		function_4cc7caf0();
	}
	else if(level.script == "zm_theater")
	{
		function_2f7d6ccd();
	}
	else if(level.script == "zm_prototype")
	{
		function_7f392262();
	}
	else if(level.script == "zm_sumpf")
	{
		function_f371c153();
	}
	else if(level.script == "zm_moon")
	{
		function_b162c543();
	}
	else if(level.script == "zm_temple")
	{
		function_f6139ebb();
	}
	else if(level.script == "zm_asylum")
	{
		function_7f392262();
	}
	else if(level.script == "zm_cosmodrome")
	{
		function_39c197b();
	}
	else if(level.script == "zm_tomb")
	{
		function_11b37693();
	}
}

/*
	Name: function_7f392262
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2420
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 122
*/
function function_7f392262()
{
	xmodelalias::function_ed5a9118("c_zom_dlchd_pro_honorguard_zombie_body2", Array("c_zom_dlchd_pro_honorguard_zombie_head", "c_zom_dlchd_pro_honorguard_zombie_head2"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_pro_honorguard_zombie_body1", Array("c_zom_dlchd_pro_honorguard_zombie_head", "c_zom_dlchd_pro_honorguard_zombie_head2"));
}

/*
	Name: function_f371c153
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x24A0
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 138
*/
function function_f371c153()
{
	xmodelalias::function_ed5a9118("c_zom_dlchd_sumpf_zombies_body1", Array("c_zom_dlchd_sumpf_zombies_head1", "c_zom_dlchd_sumpf_zombies_head2", "c_zom_dlchd_sumpf_zombies_head4", "c_zom_dlchd_sumpf_zombies_head3"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_sumpf_zombies_body2", Array("c_zom_dlchd_sumpf_zombies_head1", "c_zom_dlchd_sumpf_zombies_head2", "c_zom_dlchd_sumpf_zombies_head4", "c_zom_dlchd_sumpf_zombies_head3"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_sumpf_zombies_body3", Array("c_zom_dlchd_sumpf_zombies_head1", "c_zom_dlchd_sumpf_zombies_head2", "c_zom_dlchd_sumpf_zombies_head4", "c_zom_dlchd_sumpf_zombies_head3"));
	xmodelalias::function_58b48067("c_zom_dlchd_sumpf_zombies_head1", Array("c_zom_dlchd_sumpf_zombies_hat1", "c_zom_dlchd_sumpf_zombies_hat2", "c_zom_dlchd_sumpf_zombies_hat3", "c_zom_dlchd_sumpf_zombies_hat4"));
	xmodelalias::function_58b48067("c_zom_dlchd_sumpf_zombies_head2", Array("c_zom_dlchd_sumpf_zombies_hat1", "c_zom_dlchd_sumpf_zombies_hat2", "c_zom_dlchd_sumpf_zombies_hat3", "c_zom_dlchd_sumpf_zombies_hat4"));
	xmodelalias::function_58b48067("c_zom_dlchd_sumpf_zombies_head4", Array("c_zom_dlchd_sumpf_zombies_hat1", "c_zom_dlchd_sumpf_zombies_hat2", "c_zom_dlchd_sumpf_zombies_hat3", "c_zom_dlchd_sumpf_zombies_hat4"));
	xmodelalias::function_58b48067("c_zom_dlchd_sumpf_zombies_head3", Array("c_zom_dlchd_sumpf_zombies_hat1", "c_zom_dlchd_sumpf_zombies_hat2", "c_zom_dlchd_sumpf_zombies_hat3", "c_zom_dlchd_sumpf_zombies_hat4"));
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_fdc9240d
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x26A8
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 161
*/
function function_fdc9240d()
{
	xmodelalias::function_ed5a9118("c_zom_der_zombie_body1", Array("c_zom_der_zombie_head1", "c_zom_der_zombie_head2", "c_zom_der_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_der_zombie_body2", Array("c_zom_der_zombie_head1", "c_zom_der_zombie_head2", "c_zom_der_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_der_zombie_body3", Array("c_zom_der_zombie_head1", "c_zom_der_zombie_head2", "c_zom_der_zombie_head3"));
	xmodelalias::function_58b48067("c_zom_der_zombie_head1", "c_zom_der_zombie_helmet1");
	xmodelalias::function_58b48067("c_zom_der_zombie_head2", "c_zom_der_zombie_helmet1");
	xmodelalias::function_58b48067("c_zom_der_zombie_head3", "c_zom_der_zombie_helmet1");
}

/*
	Name: function_2f7d6ccd
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x27D8
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 181
*/
function function_2f7d6ccd()
{
	xmodelalias::function_ed5a9118("c_zom_dlchd_pro_honorguard_zombie_body1", Array("c_zom_dlchd_sumpf_zombies_head1", "c_zom_dlchd_sumpf_zombies_head2", "c_zom_dlchd_sumpf_zombies_head4", "c_zom_dlchd_sumpf_zombies_head3"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_pro_honorguard_zombie_body2", Array("c_zom_dlchd_sumpf_zombies_head1", "c_zom_dlchd_sumpf_zombies_head2", "c_zom_dlchd_sumpf_zombies_head4", "c_zom_dlchd_sumpf_zombies_head3"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_kino_quad_body", "c_zom_dlchd_kino_quad_head");
}

/*
	Name: function_39c197b
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2898
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 198
*/
function function_39c197b()
{
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_cosmo_labcoat_body", Array("c_zom_dlchd_cosmo_cosmon_head", "c_zom_dlchd_cosmo_cosmon_head2", "c_zom_dlchd_cosmo_cosmon_head3", "c_zom_dlchd_cosmo_cosmon_head4", "c_zom_dlchd_cosmo_cosmon_head5"));
	xmodelalias::function_ed5a9118("c_zm_dlchd_cosmo_spetznaz_zombie_body", Array("c_zom_dlchd_cosmo_cosmon_head", "c_zom_dlchd_cosmo_cosmon_head2", "c_zom_dlchd_cosmo_cosmon_head3", "c_zom_dlchd_cosmo_cosmon_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_cosmo_cosmon_body", Array("c_zom_dlchd_cosmo_cosmon_head", "c_zom_dlchd_cosmo_cosmon_head2", "c_zom_dlchd_cosmo_cosmon_head3", "c_zom_dlchd_cosmo_cosmon_head4"));
}

/*
	Name: function_f6139ebb
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2988
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 215
*/
function function_f6139ebb()
{
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_fem_body", "c_t7_zm_dlchd_shangrila_fem_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_fem_body2", "c_t7_zm_dlchd_shangrila_fem_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_fem_mini_body", "c_t7_zm_dlchd_shangrila_fem_mini_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_fem_mini_body2", "c_t7_zm_dlchd_shangrila_fem_mini_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_nva_body", Array("c_t7_zm_dlchd_shangrila_nva_head", "c_t7_zm_dlchd_shangrila_nva_head2"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_nva_mini_body", Array("c_t7_zm_dlchd_shangrila_nva_mini_head", "c_t7_zm_dlchd_shangrila_nva_mini_head2"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_vietcong_body", "c_t7_zm_dlchd_shangrila_vietcong_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_shangrila_vietcong_mini_body", "c_t7_zm_dlchd_shangrila_vietcong_mini_head");
}

/*
	Name: function_b162c543
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2AC8
	Size: 0x2F8
	Parameters: 0
	Flags: None
	Line Number: 237
*/
function function_b162c543()
{
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_militarypolice_body", Array("c_t7_zm_dlchd_moon_militarypolice_head1", "c_t7_zm_dlchd_moon_militarypolice_head2", "c_t7_zm_dlchd_moon_militarypolice_head3", "c_t7_zm_dlchd_moon_militarypolice_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_body1", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_body1_green", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_body1_orange", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_body2", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_body2_green", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_body2_orange", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_cap", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_cap_green", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_moon_tech_cap_orange", Array("c_t7_zm_dlchd_moon_tech_head", "c_t7_zm_dlchd_moon_tech_head2", "c_t7_zm_dlchd_moon_tech_head3", "c_t7_zm_dlchd_moon_tech_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlchd_moon_quad_body", "c_zom_dlchd_moon_quad_head");
}

/*
	Name: function_11b37693
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x2DC8
	Size: 0x848
	Parameters: 0
	Flags: None
	Line Number: 262
*/
function function_11b37693()
{
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_crusader_body", "c_t7_zm_dlchd_origins_crusader_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_crusader_body_fire", "c_t7_zm_dlchd_origins_crusader_head_fire");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_crusader_body_ice", "c_t7_zm_dlchd_origins_crusader_head_ice");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body1", Array("c_t7_zm_dlchd_origins_soldiers_head1", "c_t7_zm_dlchd_origins_soldiers_head2", "c_t7_zm_dlchd_origins_soldiers_head3"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body1_cin", Array("c_t7_zm_dlchd_origins_soldiers_head1_cin", "c_t7_zm_dlchd_origins_soldiers_head2_cin", "c_t7_zm_dlchd_origins_soldiers_head3_cin"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body1_fire", Array("c_t7_zm_dlchd_origins_soldiers_head1_fire", "c_t7_zm_dlchd_origins_soldiers_head2_fire", "c_t7_zm_dlchd_origins_soldiers_head3_fire"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body1_ice", Array("c_t7_zm_dlchd_origins_soldiers_head1_ice", "c_t7_zm_dlchd_origins_soldiers_head2_ice", "c_t7_zm_dlchd_origins_soldiers_head3_ice"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2", Array("c_t7_zm_dlchd_origins_soldiers_head1", "c_t7_zm_dlchd_origins_soldiers_head2", "c_t7_zm_dlchd_origins_soldiers_head3"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2_cin", Array("c_t7_zm_dlchd_origins_soldiers_head1_cin", "c_t7_zm_dlchd_origins_soldiers_head2_cin", "c_t7_zm_dlchd_origins_soldiers_head3_cin"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2_fire", Array("c_t7_zm_dlchd_origins_soldiers_head1_fire", "c_t7_zm_dlchd_origins_soldiers_head2_fire", "c_t7_zm_dlchd_origins_soldiers_head3_fire"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2_ice", Array("c_t7_zm_dlchd_origins_soldiers_head1_ice", "c_t7_zm_dlchd_origins_soldiers_head2_ice", "c_t7_zm_dlchd_origins_soldiers_head3_ice"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2a", Array("c_t7_zm_dlchd_origins_soldiers_head1", "c_t7_zm_dlchd_origins_soldiers_head2", "c_t7_zm_dlchd_origins_soldiers_head3"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2a_fire", Array("c_t7_zm_dlchd_origins_soldiers_head1_fire", "c_t7_zm_dlchd_origins_soldiers_head2_fire", "c_t7_zm_dlchd_origins_soldiers_head3_fire"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body2a_ice", Array("c_t7_zm_dlchd_origins_soldiers_head1_ice", "c_t7_zm_dlchd_origins_soldiers_head2_ice", "c_t7_zm_dlchd_origins_soldiers_head3_ice"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3", Array("c_t7_zm_dlchd_origins_soldiers_head1", "c_t7_zm_dlchd_origins_soldiers_head2", "c_t7_zm_dlchd_origins_soldiers_head3"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3_cin", Array("c_t7_zm_dlchd_origins_soldiers_head1_cin", "c_t7_zm_dlchd_origins_soldiers_head2_cin", "c_t7_zm_dlchd_origins_soldiers_head3_cin"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3_fire", Array("c_t7_zm_dlchd_origins_soldiers_head1_fire", "c_t7_zm_dlchd_origins_soldiers_head2_fire", "c_t7_zm_dlchd_origins_soldiers_head3_fire"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3_ice", Array("c_t7_zm_dlchd_origins_soldiers_head1_ice", "c_t7_zm_dlchd_origins_soldiers_head2_ice", "c_t7_zm_dlchd_origins_soldiers_head3_ice"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3a", Array("c_t7_zm_dlchd_origins_soldiers_head1", "c_t7_zm_dlchd_origins_soldiers_head2", "c_t7_zm_dlchd_origins_soldiers_head3"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3a_fire", Array("c_t7_zm_dlchd_origins_soldiers_head1_fire", "c_t7_zm_dlchd_origins_soldiers_head2_fire", "c_t7_zm_dlchd_origins_soldiers_head3_fire"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_soldiers_body3a_ice", Array("c_t7_zm_dlchd_origins_soldiers_head1_ice", "c_t7_zm_dlchd_origins_soldiers_head2_ice", "c_t7_zm_dlchd_origins_soldiers_head3_ice"));
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_templar_body", "c_t7_zm_dlchd_origins_templar_head");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_templar_body_fire", "c_t7_zm_dlchd_origins_templar_head_fire");
	xmodelalias::function_ed5a9118("c_t7_zm_dlchd_origins_templar_body_ice", "c_t7_zm_dlchd_origins_templar_head_ice");
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head1", Array("c_t7_zm_dlchd_origins_soldiers_helmet", "c_t7_zm_dlchd_origins_soldiers_officer_cap", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head1_cin", Array("c_t7_zm_dlchd_origins_soldiers_helmet", "c_t7_zm_dlchd_origins_soldiers_officer_cap", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head1_fire", Array("c_t7_zm_dlchd_origins_soldiers_helmet_fire", "c_t7_zm_dlchd_origins_soldiers_officer_cap_fire", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet_fire"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head1_ice", Array("c_t7_zm_dlchd_origins_soldiers_helmet_ice", "c_t7_zm_dlchd_origins_soldiers_officer_cap_ice", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet_ice"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head2", Array("c_t7_zm_dlchd_origins_soldiers_helmet", "c_t7_zm_dlchd_origins_soldiers_officer_cap", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head2_cin", Array("c_t7_zm_dlchd_origins_soldiers_helmet", "c_t7_zm_dlchd_origins_soldiers_officer_cap", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head2_fire", Array("c_t7_zm_dlchd_origins_soldiers_helmet_fire", "c_t7_zm_dlchd_origins_soldiers_officer_cap_fire", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet_fire"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head2_ice", Array("c_t7_zm_dlchd_origins_soldiers_helmet_ice", "c_t7_zm_dlchd_origins_soldiers_officer_cap_ice", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet_ice"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head3", Array("c_t7_zm_dlchd_origins_soldiers_helmet", "c_t7_zm_dlchd_origins_soldiers_officer_cap", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head3_cin", Array("c_t7_zm_dlchd_origins_soldiers_helmet", "c_t7_zm_dlchd_origins_soldiers_officer_cap", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head3_fire", Array("c_t7_zm_dlchd_origins_soldiers_helmet_fire", "c_t7_zm_dlchd_origins_soldiers_officer_cap_fire", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet_fire"));
	xmodelalias::function_58b48067("c_t7_zm_dlchd_origins_soldiers_head3_ice", Array("c_t7_zm_dlchd_origins_soldiers_helmet_ice", "c_t7_zm_dlchd_origins_soldiers_officer_cap_ice", "c_t7_zm_dlchd_origins_soldiers_spiked_helmet_ice"));
}

/*
	Name: function_b27b76f5
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x3618
	Size: 0x680
	Parameters: 0
	Flags: None
	Line Number: 312
*/
function function_b27b76f5()
{
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body1", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body1_skin1", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body1_skin2", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body2", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body2_skin1", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body2_skin2", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body3", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body3_skin1", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_body3_skin2", Array("c_zom_zod_zombie_head1_1", "c_zom_zod_zombie_head1_2", "c_zom_zod_zombie_head1_3", "c_zom_zod_zombie_head2", "c_zom_zod_zombie_head3"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_fem_body1", Array("c_zom_zod_zombie_fem_head1", "c_zom_zod_zombie_fem_head2"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_fem_body1_skin1", Array("c_zom_zod_zombie_fem_head1", "c_zom_zod_zombie_fem_head2"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_fem_body3", Array("c_zom_zod_zombie_fem_head1", "c_zom_zod_zombie_fem_head2"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_fem_body3_skin1", Array("c_zom_zod_zombie_fem_head1", "c_zom_zod_zombie_fem_head2"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_fem_body3_skin2", Array("c_zom_zod_zombie_fem_head1", "c_zom_zod_zombie_fem_head2"));
	xmodelalias::function_ed5a9118("c_zom_zod_zombie_fem_body3_skin3", Array("c_zom_zod_zombie_fem_head1", "c_zom_zod_zombie_fem_head2"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_fem_head1", Array("c_zom_zod_zombie_fem_hat1", "c_zom_zod_zombie_fem_hat2", "c_zom_zod_zombie_fem_hat3"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_fem_head2", Array("c_zom_zod_zombie_fem_hat1", "c_zom_zod_zombie_fem_hat2", "c_zom_zod_zombie_fem_hat3"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_head1_1", Array("c_zom_zod_zombie_hat1", "c_zom_zod_zombie_hat1_skin1", "c_zom_zod_zombie_hat1_skin2", "c_zom_zod_zombie_hat2", "c_zom_zod_zombie_hat2_skin1", "c_zom_zod_zombie_hat2_skin2"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_head1_2", Array("c_zom_zod_zombie_hat1", "c_zom_zod_zombie_hat1_skin1", "c_zom_zod_zombie_hat1_skin2", "c_zom_zod_zombie_hat2", "c_zom_zod_zombie_hat2_skin1", "c_zom_zod_zombie_hat2_skin2"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_head1_3", Array("c_zom_zod_zombie_hat1", "c_zom_zod_zombie_hat1_skin1", "c_zom_zod_zombie_hat1_skin2", "c_zom_zod_zombie_hat2", "c_zom_zod_zombie_hat2_skin1", "c_zom_zod_zombie_hat2_skin2"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_head2", Array("c_zom_zod_zombie_hat1", "c_zom_zod_zombie_hat1_skin1", "c_zom_zod_zombie_hat1_skin2", "c_zom_zod_zombie_hat2", "c_zom_zod_zombie_hat2_skin1", "c_zom_zod_zombie_hat2_skin2"));
	xmodelalias::function_58b48067("c_zom_zod_zombie_head3", Array("c_zom_zod_zombie_hat1", "c_zom_zod_zombie_hat1_skin1", "c_zom_zod_zombie_hat1_skin2", "c_zom_zod_zombie_hat2", "c_zom_zod_zombie_hat2_skin1", "c_zom_zod_zombie_hat2_skin2"));
	xmodelalias::function_1a44f029("c_zom_zod_zombie_fem_head2", "c_zom_zod_zombie_fem_head2_nohair");
}

/*
	Name: function_850fdb62
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x3CA0
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 349
*/
function function_850fdb62()
{
	xmodelalias::function_ed5a9118("c_zom_dlc1_skeleton_zombie_body", "c_zom_dlc1_skeleton_zombie_head");
	xmodelalias::function_ed5a9118("c_zom_dlc1_drgropf_body", "c_zom_dlc1_drgropf_head");
}

/*
	Name: function_6c97126b
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x3CF0
	Size: 0x268
	Parameters: 0
	Flags: None
	Line Number: 365
*/
function function_6c97126b()
{
	xmodelalias::function_ed5a9118("c_zom_dlc2_jpn_zombies_body1", Array("c_zom_dlc2_jpn_zombies_head1", "c_zom_dlc2_jpn_zombies_head2", "c_zom_dlc2_jpn_zombies_head3", "c_zom_dlc2_jpn_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc2_jpn_zombies_body2", Array("c_zom_dlc2_jpn_zombies_head1", "c_zom_dlc2_jpn_zombies_head2", "c_zom_dlc2_jpn_zombies_head3", "c_zom_dlc2_jpn_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc2_jpn_zombies_body3", Array("c_zom_dlc2_jpn_zombies_head1", "c_zom_dlc2_jpn_zombies_head2", "c_zom_dlc2_jpn_zombies_head3", "c_zom_dlc2_jpn_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc2_jpn_zombies_body4", Array("c_zom_dlc2_jpn_zombies_head1", "c_zom_dlc2_jpn_zombies_head2", "c_zom_dlc2_jpn_zombies_head3", "c_zom_dlc2_jpn_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc2_thrasher_body", "c_zom_dlc2_thrasher_head");
	xmodelalias::function_58b48067("c_zom_dlc2_jpn_zombies_head1", Array("c_zom_dlc2_jpn_zombies_head1_hat1", "c_zom_dlc2_jpn_zombies_head1_hat2", "c_zom_dlc2_jpn_zombies_head1_hat3", "c_zom_dlc2_jpn_zombies_head1_hat4"));
	xmodelalias::function_58b48067("c_zom_dlc2_jpn_zombies_head2", Array("c_zom_dlc2_jpn_zombies_head2_hat1", "c_zom_dlc2_jpn_zombies_head2_hat2", "c_zom_dlc2_jpn_zombies_head2_hat3", "c_zom_dlc2_jpn_zombies_head2_hat4"));
	xmodelalias::function_58b48067("c_zom_dlc2_jpn_zombies_head3", Array("c_zom_dlc2_jpn_zombies_head3_hat1", "c_zom_dlc2_jpn_zombies_head3_hat2", "c_zom_dlc2_jpn_zombies_head3_hat3", "c_zom_dlc2_jpn_zombies_head3_hat4"));
	xmodelalias::function_58b48067("c_zom_dlc2_jpn_zombies_head4", Array("c_zom_dlc2_jpn_zombies_head4_hat1", "c_zom_dlc2_jpn_zombies_head4_hat2", "c_zom_dlc2_jpn_zombies_head4_hat3", "c_zom_dlc2_jpn_zombies_head4_hat4"));
}

/*
	Name: function_abbae36c
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x3F60
	Size: 0x220
	Parameters: 0
	Flags: None
	Line Number: 388
*/
function function_abbae36c()
{
	xmodelalias::function_ed5a9118("c_zom_dlc3_rus_zombies_body1", Array("c_zom_dlc3_rus_zombies_head1", "c_zom_dlc3_rus_zombies_head2", "c_zom_dlc3_rus_zombies_head3", "c_zom_dlc3_rus_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc3_rus_zombies_body2", Array("c_zom_dlc3_rus_zombies_head1", "c_zom_dlc3_rus_zombies_head2", "c_zom_dlc3_rus_zombies_head3", "c_zom_dlc3_rus_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc3_rus_zombies_body3", Array("c_zom_dlc3_rus_zombies_head1", "c_zom_dlc3_rus_zombies_head2", "c_zom_dlc3_rus_zombies_head3", "c_zom_dlc3_rus_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc3_rus_zombies_body4", Array("c_zom_dlc3_rus_zombies_head1", "c_zom_dlc3_rus_zombies_head2", "c_zom_dlc3_rus_zombies_head3", "c_zom_dlc3_rus_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc3_zombie_sentinel_body", "c_zom_dlc3_zombie_sentinel_head");
	xmodelalias::function_58b48067("c_zom_dlc3_rus_zombies_head1", Array("c_zom_dlc3_rus_zombies_head1_helmet", "c_zom_dlc3_rus_zombies_head1_officercap", "c_zom_dlc3_rus_zombies_head1_ushanka"));
	xmodelalias::function_58b48067("c_zom_dlc3_rus_zombies_head2", Array("c_zom_dlc3_rus_zombies_head2_officercap", "c_zom_dlc3_rus_zombies_head2_ushanka"));
	xmodelalias::function_58b48067("c_zom_dlc3_rus_zombies_head3", Array("c_zom_dlc3_rus_zombies_head3_helmet", "c_zom_dlc3_rus_zombies_head3_officercap", "c_zom_dlc3_rus_zombies_head3_ushanka"));
	xmodelalias::function_58b48067("c_zom_dlc3_rus_zombies_head4", "c_zom_dlc3_rus_zombies_head4_helmet");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4cc7caf0
	Namespace: namespace_e0ec58c4
	Checksum: 0x424F4353
	Offset: 0x4188
	Size: 0x60C
	Parameters: 0
	Flags: None
	Line Number: 413
*/
function function_4cc7caf0()
{
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body1", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head4", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body2", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body2_skin1", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body2_skin2", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body3", Array("c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head4"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body4", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head4", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body5", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head4", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body6", Array("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_head2", "c_zom_dlc4_zombies_head3", "c_zom_dlc4_zombies_head4", "c_zom_dlc4_zombies_head5", "c_zom_dlc4_zombies_head6"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body7", Array("c_zom_dlc4_zombies_head1_fem", "c_zom_dlc4_zombies_head2_fem"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body7_skin1", Array("c_zom_dlc4_zombies_head1_fem", "c_zom_dlc4_zombies_head2_fem"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body7_skin2", Array("c_zom_dlc4_zombies_head1_fem", "c_zom_dlc4_zombies_head2_fem"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_zombies_body7_skin3", Array("c_zom_dlc4_zombies_head1_fem", "c_zom_dlc4_zombies_head2_fem"));
	xmodelalias::function_ed5a9118("c_zom_dlc4_keeper_body", "c_zom_dlc4_keeper_head");
	xmodelalias::function_ed5a9118("c_zom_dlc4_keeper_body_dissolve", "c_zom_dlc4_keeper_head_dissolve");
	xmodelalias::function_ed5a9118("c_zom_dlc4_keeper_hooded_body", "c_zom_dlc4_keeper_head");
	xmodelalias::function_ed5a9118("c_zom_dlc4_keeper_hooded_body_dissolve", "c_zom_dlc4_keeper_head_dissolve");
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head1", "c_zom_dlc4_zombies_hat_ger_officer");
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head1_fem", Array("c_zom_dlc4_zombies_hat_fem1_cloche", "c_zom_dlc4_zombies_hat_fem1_cloche_skin1", "c_zom_dlc4_zombies_hat_fem1_cloche_skin2", "c_zom_dlc4_zombies_hat_fem1_cloche_skin3", "c_zom_dlc4_zombies_hat_fem2_frontbun"));
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head2", Array("c_zom_dlc4_zombies_hat_civ_fedora", "c_zom_dlc4_zombies_hat_civ_fedora_skin1", "c_zom_dlc4_zombies_hat_civ_fedora_skin2", "c_zom_dlc4_zombies_hat_civ_golfcap", "c_zom_dlc4_zombies_hat_civ_golfcap_skin1", "c_zom_dlc4_zombies_hat_civ_golfcap_skin2"));
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head2_fem", Array("c_zom_dlc4_zombies_hat_fem1_cloche", "c_zom_dlc4_zombies_hat_fem1_cloche_skin1", "c_zom_dlc4_zombies_hat_fem1_cloche_skin2", "c_zom_dlc4_zombies_hat_fem1_cloche_skin3", "c_zom_dlc4_zombies_hat_fem2_frontbun"));
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head3", Array("c_zom_dlc4_zombies_hat_jpn_fieldcap", "c_zom_dlc4_zombies_hat_jpn_fieldcap_noflaps", "c_zom_dlc4_zombies_hat_jpn_helmet"));
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head4", Array("c_zom_dlc4_zombies_hat_rus_helmet", "c_zom_dlc4_zombies_hat_rus_officer", "c_zom_dlc4_zombies_hat_rus_ushanka"));
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head5", Array("c_zom_dlc4_zombies_hat_rus_helmet", "c_zom_dlc4_zombies_hat_rus_officer", "c_zom_dlc4_zombies_hat_rus_ushanka"));
	xmodelalias::function_58b48067("c_zom_dlc4_zombies_head6", Array("c_zom_dlc4_zombies_hat_rus_helmet", "c_zom_dlc4_zombies_hat_rus_officer", "c_zom_dlc4_zombies_hat_rus_ushanka"));
}

