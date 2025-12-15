#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\zm\_zm_perks;

#namespace namespace_b8afaefc;

/*
	Name: function_fc92a42d
	Namespace: namespace_b8afaefc
	Checksum: 0x277B124C
	Offset: 0x1D0
	Size: 0xCA
	Parameters: 0
	Flags: None
	Line Number: 19
*/
function function_fc92a42d()
{
	script = ToLower(GetDvarString("mapname"));
	switch(script)
	{
		case "zm_asylum":
		case "zm_castle":
		case "zm_cosmodrome":
		case "zm_factory":
		case "zm_genesis":
		case "zm_island":
		case "zm_moon":
		case "zm_prototype":
		case "zm_stalingrad":
		case "zm_sumpf":
		case "zm_temple":
		case "zm_theater":
		case "zm_tomb":
		case "zm_zod":
		{
			return 1;
		}
		default
		{
			return 0;
		}
	}
}

