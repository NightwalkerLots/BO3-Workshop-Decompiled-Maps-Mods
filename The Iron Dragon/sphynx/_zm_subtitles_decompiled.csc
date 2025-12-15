#include scripts\shared\util_shared;

#namespace namespace_56430b4;

/*
	Name: init
	Namespace: namespace_56430b4
	Checksum: 0x1EF3BB6C
	Offset: 0xA0
	Size: 0x30
	Parameters: 0
	Flags: AutoExec
	Line Number: 14
*/
function autoexec init()
{
	util::REGISTER_SYSTEM("subtitleMessage", &function_d398ef35);
}

/*
	Name: function_d398ef35
	Namespace: namespace_56430b4
	Checksum: 0x536412B1
	Offset: 0xD8
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 29
*/
function function_d398ef35(var_3d850ea0, message)
{
	time = function_ca98b515(message);
	function_39659176(var_3d850ea0, time, message);
}

/*
	Name: function_ca98b515
	Namespace: namespace_56430b4
	Checksum: 0xFC6CD869
	Offset: 0x138
	Size: 0x5A
	Parameters: 1
	Flags: None
	Line Number: 45
*/
function function_ca98b515(message)
{
	calc_time = 0;
	for(i = 0; i < message.size; i++)
	{
		calc_time = calc_time + 75;
	}
	return calc_time;
}

