#include scripts\codescripts\struct;
#include scripts\zm\_zm_perks;

#namespace namespace_bbc93beb;

/*
	Name: main
	Namespace: namespace_bbc93beb
	Checksum: 0xD4B37CC9
	Offset: 0x100
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 15
*/
function main()
{
	level.var_4fd2d0c8 = 0;
	var_d3bdea95 = GetEntArray("z", "script_noteworthy");
	level.var_23e62614 = var_d3bdea95.size;
	for(i = 0; i < var_d3bdea95.size; i++)
	{
		var_d3bdea95[i] thread function_cfcf5d5a();
	}
}

/*
	Name: function_cfcf5d5a
	Namespace: namespace_bbc93beb
	Checksum: 0x9C854CE4
	Offset: 0x1A0
	Size: 0x2AC
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function function_cfcf5d5a()
{
	e_model = GetEnt("z", "script_noteworthy");
	e_model setcandamage(1);
	while(1)
	{
		e_model waittill("damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		break;
	}
	level.var_4fd2d0c8++;
	playsoundatposition("disco_of_the_dead_shorter", self.origin);
	fx2 = spawn("script_model", (544, 216, 40));
	fx2.angles = (270, 227.868, 132.132);
	fx2 SetModel("tag_origin");
	PlayFXOnTag(level._effect["disco"], fx2, "tag_origin");
	FX3 = spawn("script_model", (544, 216, 344));
	FX3.angles = (89.9997, 36.8785, 36.8785);
	FX3 SetModel("tag_origin");
	PlayFXOnTag(level._effect["disco2"], FX3, "tag_origin");
	wait(51);
	fx2 delete();
	FX3 delete();
}

