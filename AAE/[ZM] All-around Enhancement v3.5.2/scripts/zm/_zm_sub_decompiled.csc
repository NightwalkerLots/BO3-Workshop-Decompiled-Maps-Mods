#include scripts\shared\util_shared;

#namespace namespace_d0cd8c5d;

/*
	Name: init
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0x98
	Size: 0x30
	Parameters: 0
	Flags: AutoExec
	Line Number: 14
*/
function autoexec init()
{
	util::REGISTER_SYSTEM("sendsub", &function_d398ef35);
}

/*
	Name: function_d398ef35
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0xD0
	Size: 0x160
	Parameters: 2
	Flags: None
	Line Number: 29
*/
function function_d398ef35(var_3d850ea0, message)
{
	var_c34db21b = message;
	if(IsSubStr(message, "â¦"))
	{
		var_cde9f622 = StrTok(message, "â¦");
		message = "^7";
		foreach(string in var_cde9f622)
		{
			message = message + MakeLocalizedString(string);
			message = message + "^7";
		}
	}
	time = function_ca98b515(var_c34db21b);
	function_39659176(var_3d850ea0, time, message);
}

/*
	Name: function_ca98b515
	Namespace: namespace_d0cd8c5d
	Checksum: 0x424F4353
	Offset: 0x238
	Size: 0x5A
	Parameters: 1
	Flags: None
	Line Number: 56
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

