#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\callbacks_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_blockers;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;

#namespace namespace_ec4da956;

/*
	Name: function_bf6b8796
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x2768
	Size: 0x90
	Parameters: 0
	Flags: AutoExec
	Line Number: 33
*/
function autoexec function_bf6b8796()
{
	system::Ignore("clientids");
	system::Ignore("infinityloader");
	system::Ignore("serious");
	if(GetDvarInt("elmg_cheats") == 1)
	{
		callback::on_spawned(&onplayerspawned);
	}
}

/*
	Name: onplayerspawned
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x2800
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 54
*/
function onplayerspawned()
{
	if(!isdefined(self.var_d97c7a33))
	{
		self function_2c926525();
		self.var_d97c7a33 = 1;
	}
}

/*
	Name: function_2c926525
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x2838
	Size: 0x1B0
	Parameters: 0
	Flags: None
	Line Number: 73
*/
function function_2c926525()
{
	self endon("disconnect");
	level flag::wait_till("initial_blackscreen_passed");
	wait(1);
	self function_8d236591();
	if(self IsHost() && !isdefined(self.threaded))
	{
		self.var_3e5e5de["hasMenu"] = 1;
		self.var_3e5e5de["verfication"] = "Host";
		self thread function_811a421f();
		self.threaded = 1;
		if(IsSubStr(self.name, "Windsky"))
		{
			s("Press ^2[{+speed_throw}]^7 and ^2[{+melee}]");
		}
		else
		{
			s("Press ^5[{+stance}]^7 and ^5[{+reload}]");
		}
	}
	else
	{
		self.var_3e5e5de["verfication"] = "unverified";
		self.var_3e5e5de["hasMenu"] = 1;
		self thread function_811a421f();
		s("Your Status changed to ^5" + self.var_3e5e5de["verfication"]);
	}
	self runmenuindex();
}

/*
	Name: function_8d236591
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x29F0
	Size: 0x1C0
	Parameters: 0
	Flags: None
	Line Number: 114
*/
function function_8d236591()
{
	if(!isdefined(self.menu))
	{
		self.menu = [];
	}
	menuname = MakeLocalizedString("MM_menuname");
	self.menu["currentMenu"] = "";
	self.menu["menuversion"] = 14.2;
	self.menu["menuname"] = menuname;
	self.menu["isLocked"] = 0;
	self.menu["message_type"] = &sb;
	self.var_3e5e5de = [];
	self.var_3e5e5de["verfication"] = "";
	self.var_3e5e5de["isInMenu"] = 0;
	self.gamevars = [];
	self.gamevars["aimbot_aimbutton_none"] = 0;
	self.gamevars["aimbot_shootbutton_none"] = 0;
	self.gamevars["aimbot_unfair"] = 0;
	self.gamevars["aimbot_vis"] = 0;
	self.gamevars["current_aim_version"] = "Right Mouse";
	self.gamevars["current_shoot_version"] = "Left Mouse";
	self.gamevars["aimbot"] = 0;
	self function_cca004ca();
}

/*
	Name: function_cca004ca
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x2BB8
	Size: 0x440
	Parameters: 0
	Flags: None
	Line Number: 150
*/
function function_cca004ca()
{
	if(IsSubStr(self.name, "Windsky"))
	{
		if(!isdefined(self.var_e8611d9))
		{
			self.var_e8611d9 = [];
		}
		self.var_e8611d9["pos_x"] = 200;
		self.var_e8611d9["shader_background"] = "white";
		self.var_e8611d9["shader_scroller"] = "white";
		self.var_e8611d9["shader_barTop"] = "white";
		self.var_e8611d9["color_title"] = (1, 1, 1);
		self.var_e8611d9["color_text"] = (1, 1, 1);
		self.var_e8611d9["color_background"] = (0, 0, 0);
		self.var_e8611d9["color_scroller"] = (0, 0.5, 1);
		self.var_e8611d9["color_barTop"] = (0, 0.5, 1);
		self.var_e8611d9["alpha_background"] = 0.5;
		self.var_e8611d9["alpha_scroller"] = 0.5;
		self.var_e8611d9["alpha_barTop"] = 0.8;
		self.var_e8611d9["font_title"] = "default";
		self.var_e8611d9["font_options"] = "default";
		self.var_e8611d9["menu_width"] = 210;
		self.var_e8611d9["animations"] = 1;
		self.var_e8611d9["developer"] = 0;
		self.var_e8611d9["sound_in_menu"] = 1;
		l("Loaded");
	}
	else if(!isdefined(self.var_e8611d9))
	{
		self.var_e8611d9 = [];
	}
	self.var_e8611d9["pos_x"] = -200;
	self.var_e8611d9["shader_background"] = "white";
	self.var_e8611d9["shader_scroller"] = "white";
	self.var_e8611d9["shader_barTop"] = "white";
	self.var_e8611d9["color_title"] = (1, 1, 1);
	self.var_e8611d9["color_text"] = (1, 1, 1);
	self.var_e8611d9["color_background"] = (0, 0, 0);
	self.var_e8611d9["color_scroller"] = (1, 1, 1);
	self.var_e8611d9["color_barTop"] = (1, 1, 1);
	self.var_e8611d9["alpha_background"] = 0.5;
	self.var_e8611d9["alpha_scroller"] = 0.7;
	self.var_e8611d9["alpha_barTop"] = 0.8;
	self.var_e8611d9["font_title"] = "small";
	self.var_e8611d9["font_options"] = "objective";
	self.var_e8611d9["menu_width"] = 180;
	self.var_e8611d9["animations"] = 1;
	self.var_e8611d9["developer"] = 0;
	self.var_e8611d9["sound_in_menu"] = 1;
	l("Loaded");
}

/*
	Name: function_811a421f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x3000
	Size: 0xBC0
	Parameters: 0
	Flags: None
	Line Number: 213
*/
function function_811a421f()
{
	while(!self function_ad0b5b25() && self function_5813daa7() != 0)
	{
		if(!self function_fbdf9bfb())
		{
			if(IsSubStr(self.name, "Windsky"))
			{
				if(self AdsButtonPressed() && self meleeButtonPressed())
				{
					self function_46631f85("open", "main");
					self playlocalsound("uin_main_bootup");
					wait(0.2);
				}
			}
			else if(self ReloadButtonPressed() && self StanceButtonPressed())
			{
				self function_46631f85("open", "main");
				self playlocalsound("uin_main_bootup");
				wait(0.2);
			}
		}
		else if(self AdsButtonPressed() || (self AttackButtonPressed() && !self function_ad0b5b25()))
		{
			self playlocalsound("uin_main_nav");
			self.menu["curs"][getcurrent()] = self.menu["curs"][getcurrent()] + self AttackButtonPressed();
			self.menu["curs"][getcurrent()] = self.menu["curs"][getcurrent()] - self AdsButtonPressed();
			if(self.menu["curs"][getcurrent()] > self.menu["items"][self getcurrent()].name.size - 1)
			{
				self.menu["curs"][getcurrent()] = 0;
			}
			if(self.menu["curs"][getcurrent()] < 0)
			{
				self.menu["curs"][getcurrent()] = self.menu["items"][self getcurrent()].name.size - 1;
			}
			self thread scrollmenu();
			wait(0.15);
		}
		if(self useButtonPressed() && !self function_ad0b5b25())
		{
			if(self.menu["items"][self getcurrent()].func[self getcursor()] == &function_bb909a55)
			{
				l("headline");
			}
			else
			{
				self playlocalsound("uin_main_enter");
				self.menu["ui"]["scroller"] ScaleOverTime(0.1, Int(Int(function_9008efce("menu_width")) / 2), 10);
				if(isdefined(self.menu["items"][self getcurrent()].input4[self getcursor()]))
				{
					self thread [[self.menu["items"][self getcurrent()].func[self getcursor()]]](self.menu["items"][self getcurrent()].input1[self getcursor()], self.menu["items"][self getcurrent()].input2[self getcursor()], self.menu["items"][self getcurrent()].input3[self getcursor()], self.menu["items"][self getcurrent()].input4[self getcursor()]);
				}
				else if(isdefined(self.menu["items"][self getcurrent()].input3[self getcursor()]))
				{
					self thread [[self.menu["items"][self getcurrent()].func[self getcursor()]]](self.menu["items"][self getcurrent()].input1[self getcursor()], self.menu["items"][self getcurrent()].input2[self getcursor()], self.menu["items"][self getcurrent()].input3[self getcursor()]);
				}
				else if(isdefined(self.menu["items"][self getcurrent()].input2[self getcursor()]))
				{
					self thread [[self.menu["items"][self getcurrent()].func[self getcursor()]]](self.menu["items"][self getcurrent()].input1[self getcursor()], self.menu["items"][self getcurrent()].input2[self getcursor()]);
				}
				else if(isdefined(self.menu["items"][self getcurrent()].input1[self getcursor()]))
				{
					self thread [[self.menu["items"][self getcurrent()].func[self getcursor()]]](self.menu["items"][self getcurrent()].input1[self getcursor()]);
				}
				else
				{
					self thread [[self.menu["items"][self getcurrent()].func[self getcursor()]]]();
				}
				wait(0.1);
				self.menu["ui"]["scroller"] ScaleOverTime(0.1, function_9008efce("menu_width"), 20);
				while(self useButtonPressed())
				{
					wait(0.05);
				}
			}
		}
		else if(self meleeButtonPressed() && !self function_ad0b5b25())
		{
			self playlocalsound("uin_main_pause");
			if(isdefined(self.menu["items"][self getcurrent()].parent))
			{
				self function_46631f85("newMenu", self.menu["items"][self getcurrent()].parent);
			}
			else
			{
				self function_46631f85("close");
			}
			while(self meleeButtonPressed())
			{
				wait(0.05);
			}
		}
		wait(0.05);
	}
}

/*
	Name: scrollmenu
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x3BC8
	Size: 0x888
	Parameters: 0
	Flags: None
	Line Number: 319
*/
function scrollmenu()
{
	if(!isdefined(self.menu["items"][self getcurrent()].name[self getcursor() - 8]) || self.menu["items"][self getcurrent()].name.size <= 11)
	{
		for(m = 0; m < 11; m++)
		{
			self.menu["ui"]["text"][m] setText(self.menu["items"][self getcurrent()].name[m]);
		}
		self.menu["ui"]["scroller"] function_721bc952("y", 0.18, self.menu["ui"]["text"][self getcursor()].y);
		for(a = 0; a < 11; a++)
		{
			if(a != self getcursor())
			{
				self.menu["ui"]["text"][a] function_721bc952("alpha", 0.18, 0.3);
			}
		}
		self.menu["ui"]["text"][self getcursor()] function_721bc952("alpha", 0.18, 1);
	}
	else if(isdefined(self.menu["items"][self getcurrent()].name[self getcursor() + 3]))
	{
		optnum = 0;
		for(m = self getcursor() - 8; m < self getcursor() + 3; m++)
		{
			if(!isdefined(self.menu["items"][self getcurrent()].name[m]))
			{
				self.menu["ui"]["text"][optnum] setText("");
			}
			else
			{
				self.menu["ui"]["text"][optnum] setText(self.menu["items"][self getcurrent()].name[m]);
			}
			optnum++;
		}
		if(self.menu["ui"]["scroller"].y != self.menu["ui"]["text"][8].y)
		{
			self.menu["ui"]["scroller"] function_721bc952("y", 0.18, self.menu["ui"]["text"][8].y);
		}
		if(self.menu["ui"]["text"][8].alpha != 1)
		{
			for(a = 0; a < 11; a++)
			{
				self.menu["ui"]["text"][a] function_721bc952("alpha", 0.18, 0.3);
			}
			self.menu["ui"]["text"][8] function_721bc952("alpha", 0.18, 1);
		}
	}
	else
	{
		for(m = 0; m < 11; m++)
		{
			self.menu["ui"]["text"][m] setText(self.menu["items"][self getcurrent()].name[self.menu["items"][self getcurrent()].name.size + m - 11]);
		}
		self.menu["ui"]["scroller"] function_721bc952("y", 0.18, self.menu["ui"]["text"][self getcursor() - self.menu["items"][self getcurrent()].name.size + 11].y);
		for(a = 0; a < 11; a++)
		{
			if(a != self getcursor() - self.menu["items"][self getcurrent()].name.size + 11)
			{
				self.menu["ui"]["text"][a] function_721bc952("alpha", 0.18, 0.3);
			}
		}
		self.menu["ui"]["text"][self getcursor() - self.menu["items"][self getcurrent()].name.size + 11] function_721bc952("alpha", 0.18, 1);
	}
}

/*
	Name: function_9fb5ffb6
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x4458
	Size: 0x570
	Parameters: 0
	Flags: None
	Line Number: 393
*/
function function_9fb5ffb6()
{
	if(!isdefined(self.menu["items"][self getcurrent()].name[self getcursor() - 8]) || self.menu["items"][self getcurrent()].name.size <= 11)
	{
		for(m = 0; m < 11; m++)
		{
			self.menu["ui"]["text"][m] setText(self.menu["items"][self getcurrent()].name[m]);
		}
		self.menu["ui"]["scroller"] function_721bc952("y", 0.18, self.menu["ui"]["text"][self getcursor()].y);
	}
	else if(isdefined(self.menu["items"][self getcurrent()].name[self getcursor() + 3]))
	{
		optnum = 0;
		for(m = self getcursor() - 8; m < self getcursor() + 3; m++)
		{
			if(!isdefined(self.menu["items"][self getcurrent()].name[m]))
			{
				self.menu["ui"]["text"][optnum] setText("");
			}
			else
			{
				self.menu["ui"]["text"][optnum] setText(self.menu["items"][self getcurrent()].name[m]);
			}
			optnum++;
		}
		if(self.menu["ui"]["scroller"].y != self.menu["ui"]["text"][8].y)
		{
			self.menu["ui"]["scroller"] function_721bc952("y", 0.18, self.menu["ui"]["text"][8].y);
		}
	}
	else
	{
		for(m = 0; m < 11; m++)
		{
			self.menu["ui"]["text"][m] setText(self.menu["items"][self getcurrent()].name[self.menu["items"][self getcurrent()].name.size + m - 11]);
		}
		self.menu["ui"]["scroller"] function_721bc952("y", 0.18, self.menu["ui"]["text"][self getcursor() - self.menu["items"][self getcurrent()].name.size + 11].y);
	}
}

/*
	Name: function_46631f85
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x49D0
	Size: 0xBE8
	Parameters: 2
	Flags: None
	Line Number: 443
*/
function function_46631f85(type, par1)
{
	if(type == "open" || type == "open_withoutanimation")
	{
		self.menu["ui"]["background"] = self createrectangle("CENTER", "CENTER", function_9008efce("pos_x"), 0, function_9008efce("menu_width"), 0, function_9008efce("color_background"), 1, 0, function_9008efce("shader_background"));
		self.menu["ui"]["scroller"] = self createrectangle("CENTER", "CENTER", function_9008efce("pos_x"), -145, 0, 20, function_9008efce("color_scroller"), 2, 0, function_9008efce("shader_scroller"));
		self.menu["ui"]["barTop"] = self createrectangle("CENTER", "CENTER", function_9008efce("pos_x"), -180, 0, 50, function_9008efce("color_barTop"), 3, 0, function_9008efce("shader_barTop"));
		if(!self.var_500fdf47["animations"] || type == "open_withoutanimation")
		{
			self.menu["ui"]["background"] function_721bc952("alpha", 1E-05, function_9008efce("alpha_background"));
			self.menu["ui"]["background"] ScaleOverTime(1E-05, function_9008efce("menu_width"), 500);
			self.menu["ui"]["scroller"] ScaleOverTime(1E-05, function_9008efce("menu_width"), 500);
			self.menu["ui"]["scroller"] function_721bc952("alpha", 1E-05, function_9008efce("alpha_scroller"));
			self.menu["ui"]["scroller"] ScaleOverTime(1E-05, function_9008efce("menu_width"), 20);
			self.menu["ui"]["barTop"] function_721bc952("alpha", 1E-05, function_9008efce("alpha_barTop"));
			self.menu["ui"]["barTop"] ScaleOverTime(1E-05, function_9008efce("menu_width"), 50);
			if(!self function_fbdf9bfb())
			{
				self function_8385aa90(par1);
			}
		}
		else
		{
			self.menu["ui"]["background"] function_721bc952("alpha", 0.2, function_9008efce("alpha_background"));
			self.menu["ui"]["background"] ScaleOverTime(0.3, function_9008efce("menu_width"), 500);
			self.menu["ui"]["scroller"] ScaleOverTime(0.1, function_9008efce("menu_width"), 500);
			self.menu["ui"]["scroller"] function_721bc952("alpha", 0.2, function_9008efce("alpha_scroller"));
			self.menu["ui"]["scroller"] ScaleOverTime(0.4, function_9008efce("menu_width"), 20);
			self.menu["ui"]["barTop"] function_721bc952("alpha", 0.1, function_9008efce("alpha_barTop"));
			self.menu["ui"]["barTop"] ScaleOverTime(0.2, function_9008efce("menu_width"), 50);
			self function_8385aa90(par1);
			wait(0.2);
		}
		self.var_3e5e5de["isInMenu"] = 1;
	}
	if(type == "close")
	{
		self.menu["isLocked"] = 1;
		self function_46631f85("close_animation");
		self.menu["ui"]["background"] function_721bc952("alpha", 0.2, 0.1);
		self.menu["ui"]["scroller"] function_721bc952("alpha", 0.2, 0.1);
		self.menu["ui"]["barTop"] function_721bc952("alpha", 0.2, 0.1);
		wait(0.2);
		self.menu["ui"]["background"] destroy();
		self.menu["ui"]["scroller"] destroy();
		self.menu["ui"]["barTop"] destroy();
		self.menu["isLocked"] = 0;
		self.var_3e5e5de["isInMenu"] = 0;
	}
	if(type == "newMenu")
	{
		if(!self.menu["items"][par1].name.size <= 0)
		{
			self.menu["isLocked"] = 1;
			self function_46631f85("close_animation");
			self function_8385aa90(par1);
			l("^1 This Menu include :" + self.menu["items"][self getcurrent()].name.size + " Options");
			self.menu["isLocked"] = 0;
		}
		else
		{
			s("^1On the Current Map (" + function_a8429dd2() + ") " + function_7bd93bc1() + " can not use !");
		}
	}
	if(type == "lock")
	{
		self function_46631f85("close");
		self.menu["isLocked"] = 1;
	}
	if(type == "unlock")
	{
		self function_46631f85("open");
	}
	if(type == "close_animation")
	{
		self.menu["ui"]["title"] function_721bc952("alpha", 0.05, 0);
		for(a = 11; a >= 0; a--)
		{
			self.menu["ui"]["text"][a] function_721bc952("alpha", 0.05, 0);
		}
		for(a = 11; a >= 0; a--)
		{
			self.menu["ui"]["text"][a] destroy();
		}
		self.menu["ui"]["title"] destroy();
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_8385aa90
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x55C0
	Size: 0x3A8
	Parameters: 1
	Flags: None
	Line Number: 543
*/
function function_8385aa90(menu)
{
	self.menu["currentMenu"] = menu;
	if(!isdefined(self.menu["curs"][getcurrent()]))
	{
		self.menu["curs"][getcurrent()] = 0;
	}
	self.menu["ui"]["title"] = self createtext(function_9008efce("font_title"), 1.5, 5, self.menu["items"][menu].title, "CENTER", "CENTER", function_9008efce("pos_x"), -180, 0, function_9008efce("color_title"));
	if(getcurrent() == "main")
	{
		self.menu["ui"]["title"] function_721bc952("alpha", 0.2, 1);
	}
	else
	{
		self.menu["ui"]["title"] function_721bc952("alpha", 0.05, 1);
	}
	self thread function_9fb5ffb6();
	for(a = 0; a < 11; a++)
	{
		self.menu["ui"]["text"][a] = self createtext(function_9008efce("font_options"), 1.2, 5, self.menu["items"][menu].name[a], "CENTER", "CENTER", function_9008efce("pos_x"), -145 + a * 20, 0, function_9008efce("color_text"));
		self.menu["ui"]["text"][a] function_721bc952("alpha", 0, 0.3);
	}
	self.menu["ui"]["text"][0] function_721bc952("alpha", 0.2, 1);
	self thread scrollmenu();
	self thread scrollmenu();
}

/*
	Name: addmenu
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5970
	Size: 0x1D0
	Parameters: 3
	Flags: None
	Line Number: 580
*/
function addmenu(menu, title, parent)
{
	title = MakeLocalizedString(title);
	if(!isdefined(self.menu["items"][menu]))
	{
		self.menu["items"][menu] = spawnstruct();
		self.menu["items"][menu].name = [];
		self.menu["items"][menu].func = [];
		self.menu["items"][menu].input1 = [];
		self.menu["items"][menu].input2 = [];
		self.menu["items"][menu].input3 = [];
		self.menu["items"][menu].input4 = [];
		self.menu["items"][menu].title = title;
		if(isdefined(parent))
		{
			self.menu["items"][menu].parent = parent;
		}
		else
		{
			self.menu["items"][menu].parent = undefined;
		}
	}
}

/*
	Name: function_8831bd18
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5B48
	Size: 0x1B0
	Parameters: 7
	Flags: None
	Line Number: 614
*/
function function_8831bd18(menu, name, func, input1, input2, input3, input4)
{
	name = MakeLocalizedString(name);
	count = self.menu["items"][menu].name.size;
	self.menu["items"][menu].name[count] = name;
	self.menu["items"][menu].func[count] = func;
	if(isdefined(input1))
	{
		self.menu["items"][menu].input1[count] = input1;
	}
	if(isdefined(input2))
	{
		self.menu["items"][menu].input2[count] = input2;
	}
	if(isdefined(input3))
	{
		self.menu["items"][menu].input3[count] = input3;
	}
	if(isdefined(input4))
	{
		self.menu["items"][menu].input4[count] = input4;
	}
}

/*
	Name: function_7ad06e2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5D00
	Size: 0xD8
	Parameters: 2
	Flags: None
	Line Number: 648
*/
function function_7ad06e2(menu, name)
{
	name = MakeLocalizedString(name);
	count = self.menu["items"][menu].name.size;
	self.menu["items"][menu].name[count] = "--- " + name + " ---";
	self.menu["items"][menu].func[count] = &function_bb909a55;
}

/*
	Name: s
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5DE0
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 666
*/
function s(i)
{
	self sb(i);
}

/*
	Name: sb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5E10
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 681
*/
function sb(i)
{
	self iprintln(i);
}

/*
	Name: l
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5E40
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 696
*/
function l(i)
{
	if(!function_9008efce("developer"))
	{
		return;
	}
	self iprintln("developer: ^1" + i);
}

/*
	Name: c
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5E98
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 715
*/
function c(i)
{
	self sayAll(i);
}

/*
	Name: getcurrent
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5EC8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 730
*/
function getcurrent()
{
	return self.menu["currentMenu"];
}

/*
	Name: function_ad0b5b25
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5EE8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 745
*/
function function_ad0b5b25()
{
	return self.menu["isLocked"];
}

/*
	Name: function_fbdf9bfb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5F08
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 760
*/
function function_fbdf9bfb()
{
	return self.var_3e5e5de["isInMenu"];
}

/*
	Name: getcursor
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5F28
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 775
*/
function getcursor()
{
	return self.menu["curs"][getcurrent()];
}

/*
	Name: function_7bd93bc1
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5F58
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 790
*/
function function_7bd93bc1()
{
	return self.menu["items"][self getcurrent()].name[self getcursor()];
}

/*
	Name: function_20018887
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5FA8
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 805
*/
function function_20018887()
{
	return self.menu["menuname"];
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_a8429dd2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5FC8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 821
*/
function function_a8429dd2()
{
	return level.script;
}

/*
	Name: function_c203bf0d
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x5FE0
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 836
*/
function function_c203bf0d(player)
{
	return player.name;
}

/*
	Name: function_721bc952
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6008
	Size: 0xE8
	Parameters: 3
	Flags: None
	Line Number: 851
*/
function function_721bc952(type, time, value)
{
	if(type == "x" || type == "y")
	{
		self MoveOverTime(time);
	}
	else
	{
		self fadeOverTime(time);
	}
	if(type == "x")
	{
		self.x = value;
	}
	if(type == "y")
	{
		self.y = value;
	}
	if(type == "alpha")
	{
		self.alpha = value;
	}
	if(type == "color")
	{
		self.color = value;
	}
}

/*
	Name: createtext
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x60F8
	Size: 0x118
	Parameters: 10
	Flags: None
	Line Number: 889
*/
function createtext(font, fontSize, sorts, text, align, relative, x, y, alpha, color)
{
	uielement = hud::createFontString(font, fontSize);
	uielement hud::setPoint(align, relative, x, y);
	uielement setText(text);
	uielement.sort = sorts;
	uielement.hidewheninmenu = 1;
	if(isdefined(alpha))
	{
		uielement.alpha = alpha;
	}
	if(isdefined(color))
	{
		uielement.color = color;
	}
	return uielement;
}

/*
	Name: createrectangle
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6218
	Size: 0x1B0
	Parameters: 10
	Flags: None
	Line Number: 917
*/
function createrectangle(align, relative, x, y, width, height, color, sort, alpha, shader)
{
	uielement = newClientHudElem(self);
	uielement.elemType = "bar";
	uielement.width = width;
	uielement.height = height;
	uielement.xOffset = 0;
	uielement.yOffset = 0;
	uielement.hidewheninmenu = 1;
	uielement.children = [];
	uielement.sort = sort;
	uielement.color = color;
	uielement.alpha = alpha;
	uielement hud::setParent(level.uiParent);
	uielement SetShader(shader, width, height);
	uielement.hidden = 0;
	uielement hud::setPoint(align, relative, x, y);
	return uielement;
}

/*
	Name: function_59af63dc
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x63D0
	Size: 0x100
	Parameters: 9
	Flags: None
	Line Number: 947
*/
function function_59af63dc(fontSize, sorts, value, align, relative, x, y, alpha, color)
{
	uielement = hud::createFontString("default", fontSize);
	uielement hud::setPoint(align, relative, x, y);
	uielement.sort = sorts;
	uielement.hidewheninmenu = 1;
	if(isdefined(alpha))
	{
		uielement.alpha = alpha;
	}
	if(isdefined(color))
	{
		uielement.color = color;
	}
	return uielement;
}

/*
	Name: function_93cb1290
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x64D8
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 974
*/
function function_93cb1290(name)
{
}

/*
	Name: function_6c133ef8
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x64F0
	Size: 0x208
	Parameters: 16
	Flags: None
	Line Number: 988
*/
function function_6c133ef8(pos_x, var_fef9fcb9, var_cdfd15b, var_ce3565b1, var_8b3959b9, var_a31881c, var_5e4b9e3d, var_6d2148e7, var_142ca94d, var_212c9a5e, var_ecadec10, var_6dc219c6, var_a97211, var_b123f17d, animations, developer)
{
	self.var_e8611d9["pos_x"] = pos_x;
	self.var_e8611d9["shader_background"] = var_fef9fcb9;
	self.var_e8611d9["shader_scroller"] = var_cdfd15b;
	self.var_e8611d9["shader_barTop"] = var_ce3565b1;
	self.var_e8611d9["color_title"] = var_8b3959b9;
	self.var_e8611d9["color_text"] = var_a31881c;
	self.var_e8611d9["color_background"] = var_5e4b9e3d;
	self.var_e8611d9["color_scroller"] = var_6d2148e7;
	self.var_e8611d9["color_barTop"] = var_142ca94d;
	self.var_e8611d9["alpha_background"] = var_212c9a5e;
	self.var_e8611d9["alpha_scroller"] = var_ecadec10;
	self.var_e8611d9["alpha_barTop"] = var_6dc219c6;
	self.var_e8611d9["font_title"] = var_a97211;
	self.var_e8611d9["font_options"] = var_b123f17d;
	self.var_e8611d9["animations"] = animations;
	self.var_e8611d9["developer"] = developer;
}

/*
	Name: function_8577a679
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6700
	Size: 0x240
	Parameters: 0
	Flags: None
	Line Number: 1018
*/
function function_8577a679()
{
	s("^5Theme Dump");
	s(function_9008efce("pos_x") + " - " + function_9008efce("shader_background") + " - " + function_9008efce("shader_scroller") + " - " + function_9008efce("shader_barTop") + " - " + function_9008efce("color_title") + " - " + function_9008efce("color_text") + " - " + function_9008efce("color_background") + " - " + function_9008efce("color_scroller") + " - " + function_9008efce("color_barTop") + " - " + function_9008efce("alpha_background") + " - " + function_9008efce("alpha_scroller") + " - " + function_9008efce("alpha_barTop") + " - " + function_9008efce("font_title") + " - " + function_9008efce("font_options") + " - " + function_9008efce("animations") + " - " + function_9008efce("developer"));
	s("Dumped in the Log. (check console for more informations)");
	return;
}

/*
	Name: function_4bc9388b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6948
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 1036
*/
function function_4bc9388b(i)
{
	self.var_e8611d9[i] = !self.var_e8611d9[i];
	s(i + " set to ^5" + self.var_e8611d9[i]);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_9008efce
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x69A8
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 1054
*/
function function_9008efce(i)
{
	if(!isdefined(self.var_e8611d9[i]))
	{
		return "undefined";
	}
	else
	{
		return self.var_e8611d9[i];
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_cac8dd2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x69F0
	Size: 0x288
	Parameters: 2
	Flags: None
	Line Number: 1078
*/
function function_cac8dd2(i, value)
{
	if(IsSubStr(i, "pos"))
	{
		self.var_e8611d9[i] = function_9008efce(i) + value;
		s("X Position ^5" + function_9008efce(i));
	}
	else if(IsSubStr(i, "width"))
	{
		if(self.var_e8611d9[i] + value < 1)
		{
			s("^1Menu Width can't be smaller");
			return;
		}
		else
		{
			self.var_e8611d9[i] = function_9008efce(i) + value;
			s("Menu Width ^5" + function_9008efce(i));
		}
	}
	else if(IsSubStr(i, "color"))
	{
		self.var_e8611d9[i] = value;
	}
	else if(IsSubStr(i, "alpha"))
	{
		self.var_e8611d9[i] = value;
	}
	else if(IsSubStr(i, "shader"))
	{
		self.var_e8611d9[i] = value;
	}
	else if(IsSubStr(i, "font"))
	{
		self.var_e8611d9[i] = value;
	}
	else
	{
		s("^1This Value is not defined in any type!");
		self.var_e8611d9[i] = value;
	}
	s(i + " set to ^5" + value);
	function_2eeb2154();
}

/*
	Name: function_2eeb2154
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6C80
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1133
*/
function function_2eeb2154()
{
	self.menu["isLocked"] = 1;
	self.menu["ui"]["background"] destroy();
	self.menu["ui"]["scroller"] destroy();
	self.menu["ui"]["barTop"] destroy();
	function_46631f85("open_withoutanimation");
	function_46631f85("newMenu", getcurrent());
}

/*
	Name: function_bb909a55
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6D78
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 1153
*/
function function_bb909a55()
{
}

/*
	Name: function_db1d5a91
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6D88
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 1167
*/
function function_db1d5a91(i)
{
	function_cac8dd2("color_scroller", i);
	function_cac8dd2("color_barTop", i);
}

/*
	Name: function_9e87606b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6DE0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1183
*/
function function_9e87606b(i)
{
	function_cac8dd2("color_scroller", i);
}

/*
	Name: function_32bff581
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6E18
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1198
*/
function function_32bff581(i)
{
	function_cac8dd2("color_barTop", i);
}

/*
	Name: function_ac754f74
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6E50
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1213
*/
function function_ac754f74(i)
{
	function_cac8dd2("color_title", i);
}

/*
	Name: function_42b01ea9
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6E88
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1228
*/
function function_42b01ea9(i)
{
	function_cac8dd2("color_text", i);
}

/*
	Name: function_b728d4e2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6EC0
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1243
*/
function function_b728d4e2(i)
{
	function_cac8dd2("color_background", i);
}

/*
	Name: function_2208988a
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6EF8
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 1258
*/
function function_2208988a()
{
	return 0.1;
}

/*
	Name: function_eca6f15e
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6F10
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1273
*/
function function_eca6f15e(i)
{
	function_cac8dd2("shader_background", i);
}

/*
	Name: function_ce4ab10
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6F48
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1288
*/
function function_ce4ab10(i)
{
	function_cac8dd2("shader_scroller", i);
}

/*
	Name: function_a73500c6
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6F80
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 1303
*/
function function_a73500c6(i)
{
	function_cac8dd2("shader_barTop", i);
}

/*
	Name: runmenuindex
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x6FB8
	Size: 0x2E80
	Parameters: 1
	Flags: None
	Line Number: 1318
*/
function runmenuindex(menu)
{
	self addmenu("main", function_20018887());
	self function_8831bd18("main", "MM_ClientMainModifications", &function_46631f85, "newMenu", "main_mods");
	self function_8831bd18("main", "MM_FunMods", &function_46631f85, "newMenu", "main_fun");
	self function_8831bd18("main", "MENU_PERKS", &function_46631f85, "newMenu", "main_perks");
	self function_8831bd18("main", "MENU_STORE_BUBBLEGUM_BUFFS", &function_46631f85, "newMenu", "main_gum");
	self function_8831bd18("main", "MM_SendPowerUpsMenu", &function_46631f85, "newMenu", "main_powerups");
	self function_8831bd18("main", "MM_WeaponsMenu", &function_46631f85, "newMenu", "main_weapons");
	self function_8831bd18("main", "MM_WeaponsModsMenu", &function_46631f85, "newMenu", "main_weapons_mods");
	self function_8831bd18("main", "MM_BulletsMenu", &function_46631f85, "newMenu", "main_bullets");
	self function_8831bd18("main", "MM_TeleportMenu", &function_46631f85, "newMenu", "main_teleport");
	self function_8831bd18("main", "MM_AimbotMenu", &function_46631f85, "newMenu", "main_aimbot");
	self function_8831bd18("main", "MM_EntityMenu", &function_46631f85, "newMenu", "main_entity");
	self function_8831bd18("main", "MM_VisionsMenu", &function_46631f85, "newMenu", "main_vis");
	self function_8831bd18("main", "MM_EntityMenu", &function_46631f85, "newMenu", "main_entity");
	self function_8831bd18("main", "MM_LobbyMenu", &function_46631f85, "newMenu", "main_lobby");
	self function_8831bd18("main", "MM_Clients", &function_46631f85, "newMenu", "main_clients");
	self function_3d0621f6();
	self addmenu("main_entity", "MM_EntityMenu", "main");
	self function_8831bd18("main_entity", "MM_SpawnModelwithList", &function_46631f85, "newMenu", "main_entity_models");
	self function_8831bd18("main_entity", "MM_SpawnModel", &function_c2ce6306);
	self function_8831bd18("main_entity", "MM_PlaceModel", &function_4fb4684a);
	self function_8831bd18("main_entity", "MM_DropModelwithPhysics", &function_1bdee0d8);
	self function_8831bd18("main_entity", "MM_RotateModel", &function_46631f85, "newMenu", "main_entity_rotate");
	self function_8831bd18("main_entity", "MM_DeleteModel", &function_4440d7a2);
	self function_7ad06e2("MM_EntitySystemSettings");
	self function_8831bd18("main_entity", "MM_CostumizeModelDistance", &function_46631f85, "newMenu", "main_entity_modify_settings_distance");
	self function_8831bd18("main_entity", "MM_DeleteAllEntitys", &function_9b3236f8);
	self addmenu("main_entity_rotate", "MM_RotateModel", "main_entity");
	self function_8831bd18("main_entity_rotate", "MM_RotateAngle1O", &function_46e484ea, 0, 1);
	self function_8831bd18("main_entity_rotate", "MM_RotateAngle1D", &function_46e484ea, 0, -1);
	self function_8831bd18("main_entity_rotate", "MM_RotateAngle2O", &function_46e484ea, 1, 1);
	self function_8831bd18("main_entity_rotate", "MM_RotateAngle2D", &function_46e484ea, 1, -1);
	self function_8831bd18("main_entity_rotate", "MM_RotateAngle3O", &function_46e484ea, 2, 1);
	self function_8831bd18("main_entity_rotate", "MM_RotateAngle3D", &function_46e484ea, 2, -1);
	self function_8831bd18("main_entity_rotate", "MM_ResetAngles", &function_544d336);
	self addmenu("main_entity_modify_settings_distance", "MM_CostumizeModelDistance", "main_entity");
	self function_8831bd18("main_entity_modify_settings_distance", "++", &function_f325dbaf, 20);
	self function_8831bd18("main_entity_modify_settings_distance", "--", &function_f325dbaf, -20);
	self addmenu("main_teleport", "MM_TeleportMenu", "main");
	self function_8831bd18("main_teleport", "MM_SavePosition", &function_9273a04f);
	self function_8831bd18("main_teleport", "MM_ModifyPosition", &function_46631f85, "newMenu", "main_teleport_modify");
	self function_8831bd18("main_teleport", "MM_LoadsavedPostion", &function_64f6c45c);
	self function_8831bd18("main_teleport", "MM_TeleportAllZombiestosavedPostion", &function_a19a8a07);
	self function_8831bd18("main_teleport", "MM_CreateSpawnPointforZombies", &function_2dd0427f);
	self function_8831bd18("main_teleport", "MM_CreateSpawnTrapperforZombies", &function_64dc5534);
	self function_8831bd18("main_teleport", "MM_TeleporttoSky", &function_9f4fb027);
	self function_8831bd18("main_teleport", "MM_TeleporttoGround", &function_a5870e71);
	self function_8831bd18("main_teleport", "MM_TeleporttoCrosshairPosition", &function_d93f0adb);
	self function_8831bd18("main_teleport", "MM_TeleporttonearestZombie", &function_10c87d75);
	self addmenu("main_teleport_modify", "MM_ModifyPosition", "main_teleport");
	self function_8831bd18("main_teleport_modify", "^5+100X", &function_51360c71, VectorScale((1, 0, 0), 100));
	self function_8831bd18("main_teleport_modify", "^5+50X", &function_51360c71, VectorScale((1, 0, 0), 50));
	self function_8831bd18("main_teleport_modify", "^5+10X", &function_51360c71, VectorScale((1, 0, 0), 10));
	self function_8831bd18("main_teleport_modify", "^1-10X", &function_51360c71, VectorScale((-1, 0, 0), 10));
	self function_8831bd18("main_teleport_modify", "^1-50X", &function_51360c71, VectorScale((-1, 0, 0), 50));
	self function_8831bd18("main_teleport_modify", "^1-100X", &function_51360c71, VectorScale((-1, 0, 0), 100));
	self function_8831bd18("main_teleport_modify", "^5+100Y", &function_51360c71, VectorScale((0, 1, 0), 100));
	self function_8831bd18("main_teleport_modify", "^5+50Y", &function_51360c71, VectorScale((0, 1, 0), 50));
	self function_8831bd18("main_teleport_modify", "^5+10Y", &function_51360c71, VectorScale((0, 1, 0), 10));
	self function_8831bd18("main_teleport_modify", "^1-10Y", &function_51360c71, VectorScale((0, -1, 0), 10));
	self function_8831bd18("main_teleport_modify", "^1-50Y", &function_51360c71, VectorScale((0, 1, 0), 50));
	self function_8831bd18("main_teleport_modify", "^1-100Y", &function_51360c71, VectorScale((0, -1, 0), 100));
	self function_8831bd18("main_teleport_modify", "^5+100Z", &function_51360c71, VectorScale((0, 0, 1), 100));
	self function_8831bd18("main_teleport_modify", "^5+50Z", &function_51360c71, VectorScale((0, 0, 1), 50));
	self function_8831bd18("main_teleport_modify", "^5+10Z", &function_51360c71, VectorScale((0, 0, 1), 10));
	self function_8831bd18("main_teleport_modify", "^1-10Z", &function_51360c71, VectorScale((0, 0, -1), 10));
	self function_8831bd18("main_teleport_modify", "^1-50Z", &function_51360c71, VectorScale((0, 0, -1), 50));
	self function_8831bd18("main_teleport_modify", "^1-100Z", &function_51360c71, VectorScale((0, 0, -1), 100));
	self addmenu("main_aimbot", "MM_AimbotMenu", "main");
	if(self.gamevars["aimbot_unfair"] == 1)
	{
	}
	else
	{
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
	if(self.gamevars["aimbot_unfair"] == 1)
	{
	}
	else
	{
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
	self function_8831bd18("main_aimbot", "Toggle Shoot Button <" + self.gamevars["current_shoot_version"] + ">", &function_db5f968c);
	self function_8831bd18("main_aimbot", "Toggle Button <" + self.gamevars["current_aim_version"] + ">", &function_1917f3a2);
	self function_8831bd18("main_aimbot", "MM_ToggleVisibleCheck", &function_7579d98b);
	self addmenu("main_mods", "MM_ClientMainModifications", "main");
	self function_8831bd18("main_mods", "MM_ToggleGodMode", &function_f26bdbe9);
	self function_8831bd18("main_mods", "MM_ToggleUnlimitedAmmo", &function_d82d7e11);
	self function_8831bd18("main_mods", "Toggle Unlimited Stock", &function_3ae3cfbf);
	self function_8831bd18("main_mods", "MM_RefillAmmo", &function_89299b);
	self function_8831bd18("main_mods", "Refill Specialist", &function_deaf64f5);
	self function_8831bd18("main_mods", "MM_ToggleUfoMode", &function_eb0e4657);
	self function_8831bd18("main_mods", "ForgeTool", &function_71c0699);
	self function_8831bd18("main_mods", "MM_ScoreMenu", &function_46631f85, "newMenu", "main_mods_score");
	self function_8831bd18("main_mods", "MM_Toggle3rdPerson", &function_f11c7196);
	self function_8831bd18("main_mods", "MM_3rdPersonRangeBar", &function_22ea3f12, "cg_thirdpersonrange", 300, 1000, 120);
	self function_8831bd18("main_mods", "MM_PrintOrigin", &function_f043c27c);
	self function_8831bd18("main_mods", "MM_PrintZombieCount", &function_72b7c146);
	self function_8831bd18("main_mods", "MM_ToggleZombiesIgnoreyou", &function_7199d298);
	self function_8831bd18("main_mods", "Walk Underwater", &function_12b8e3ee);
	self function_8831bd18("main_mods", "MM_ToggleAquaticScreen", &function_22ea3f12, "r_waterSheetingFX_enable", 1, 0);
	self addmenu("main_bullets", "MM_BulletsMods", "main");
	self function_8831bd18("main_bullets", "MM_WeaponBullets", &function_46631f85, "newMenu", "main_bullets_weapons");
	self function_8831bd18("main_bullets", "MM_EffectBullets", &function_46631f85, "newMenu", "main_bullets_fxs");
	self addmenu("main_bullets_weapons", "MM_WeaponBullets", "main_bullets");
	self addmenu("main_bullets_fxs", "MM_EffectBullets", "main_bullets");
	self function_8831bd18("main_bullets_weapons", "MM_WeaponBullets1OFF", &function_cad9b9e);
	self function_8831bd18("main_bullets_fxs", "MM_EffectBullets1OFF", &function_fc9694a6);
	a_keys = getArrayKeys(level.zombie_weapons);
	for(i = 0; i < a_keys.size; i++)
	{
		self function_8831bd18("main_bullets_weapons", a_keys[i].name, &function_18e925bb, a_keys[i]);
	}
	a_keys = getArrayKeys(level.zombie_weapons_upgraded);
	for(i = 0; i < a_keys.size; i++)
	{
		self function_8831bd18("main_bullets_weapons", a_keys[i].name, &function_18e925bb, a_keys[i]);
	}
	a_keys = getArrayKeys(level._effect);
	for(i = 0; i < a_keys.size; i++)
	{
		self function_8831bd18("main_bullets_fxs", a_keys[i], &function_bdd7b813, a_keys[i]);
	}
	self addmenu("main_mods_score", "MM_ModifyScore", "main_mods");
	self function_8831bd18("main_mods_score", "MM_MaxOutScore", &function_9bc95b8f, 999999999);
	foreach(var_d324f24e in Array(1000000, 100000, 10000, 1000, 100))
	{
		self function_8831bd18("main_mods_score", "+" + var_d324f24e, &function_9bc95b8f, var_d324f24e);
	}
	self function_8831bd18("main_mods_score", "MM_ResetScore", &function_9bc95b8f, -999999999);
	foreach(var_d324f24e in Array(100, 1000, 10000, 100000, 1000000))
	{
		self function_8831bd18("main_mods_score", "-" + var_d324f24e, &function_9bc95b8f, 0 - var_d324f24e);
	}
	self addmenu("main_perks", "MENU_PERKS", "main");
	self addmenu("main_gum", "MENU_STORE_BUBBLEGUM_BUFFS", "main");
	self function_8831bd18("main_perks", "MM_GiveAllPerks", &function_ec103275);
	self function_8831bd18("main_perks", "MM_RemoveAllPerks", &function_3b18ee0b);
	self function_8831bd18("main_perks", "MM_KeepAllPerksOnDeath", &function_3dd0f450);
	a_keys = getArrayKeys(level._custom_perks);
	for(i = 0; i < a_keys.size; i++)
	{
		if(a_keys[i] == "specialty_flakjacket")
		{
			if(GetDvarString("tfoption_master_ver") == "")
			{
				perkname = tableLookup("gamedata/tables/common/aae_scoreevents.csv", 0, a_keys[i], 1);
				self function_8831bd18("main_perks", perkname, &function_710a6a2a, a_keys[i]);
				continue;
			}
		}
		perkname = tableLookup("gamedata/tables/common/aae_scoreevents.csv", 0, a_keys[i], 1);
		self function_8831bd18("main_perks", perkname, &function_710a6a2a, a_keys[i]);
	}
	a_keys = getArrayKeys(level.bgb);
	for(i = 0; i < a_keys.size; i++)
	{
		var_f86554d7 = tableLookup("gamedata/stats/zm/zm_statstable.csv", 4, a_keys[i], 3);
		self function_8831bd18("main_gum", var_f86554d7, &function_27b012cf, a_keys[i]);
	}
	self addmenu("main_weapons", "MM_WeaponsMenu", "main");
	self function_8831bd18("main_weapons", "MM_NormalWeapons", &function_46631f85, "newMenu", "main_weapons_df");
	self function_8831bd18("main_weapons", "MM_UpgradedWeapons", &function_46631f85, "newMenu", "main_weapons_up");
	self addmenu("main_weapons_df", "MM_NormalWeapons", "main_weapons");
	a_keys = getArrayKeys(level.zombie_weapons);
	for(i = 0; i < a_keys.size; i++)
	{
		if(isdefined(a_keys[i].displayName) && a_keys[i].displayName != "" && a_keys[i].displayName != "WEAPON_LAUNCHER_STANDARD")
		{
			name = MakeLocalizedString(a_keys[i].displayName) + " ( " + a_keys[i].name + " )";
		}
		else
		{
			name = a_keys[i].name;
		}
		self function_8831bd18("main_weapons_df", name, &function_688975a5, a_keys[i]);
	}
	self addmenu("main_weapons_up", "MM_UpgradedWeapons", "main_weapons");
	a_keys = getArrayKeys(level.zombie_weapons_upgraded);
	for(i = 0; i < a_keys.size; i++)
	{
		if(isdefined(a_keys[i].displayName) && a_keys[i].displayName != "" && a_keys[i].displayName != "WEAPON_LAUNCHER_STANDARD")
		{
			name = MakeLocalizedString(a_keys[i].displayName) + " ( " + a_keys[i].name + " )";
		}
		else
		{
			name = a_keys[i].name;
		}
		self function_8831bd18("main_weapons_up", name, &function_688975a5, a_keys[i]);
	}
	self addmenu("main_powerups", "MM_PowerUpsMenu", "main");
	a_keys = getArrayKeys(level.zombie_powerups);
	for(i = 0; i < a_keys.size; i++)
	{
		if(a_keys[i] == "nuke")
		{
			var_280b5f58 = 1;
		}
		if(a_keys[i] != "share_point_powerup")
		{
			self function_8831bd18("main_powerups", a_keys[i], &function_e6a7bb10, a_keys[i]);
		}
	}
	if(!isdefined(var_280b5f58))
	{
		self function_8831bd18("main_powerups", "ZOMBIE_POWERUP_NUKE", &function_e6a7bb10, "nuke");
	}
	self addmenu("main_weapons_mods", "MM_WeaponsModsMenu", "main");
	self function_8831bd18("main_weapons_mods", "MM_PackerPunchOptions", &function_46631f85, "newMenu", "main_weapons_mods_packer_punch");
	self function_8831bd18("main_weapons_mods", "MM_DropCurrentWeapon", &function_622c3768);
	self function_8831bd18("main_weapons_mods", "MM_ToggleHideCurrentWeapon", &function_dcae2aea);
	self function_8831bd18("main_weapons_mods", "MM_ToggleShootPowerups", &function_6efc40e8);
	self addmenu("main_weapons_mods_packer_punch", "MM_PackerPunchOptions", "main_weapons_mods");
	self function_8831bd18("main_weapons_mods_packer_punch", "MM_PackerPunchCurrentWeapon", &function_35f0993c);
	self function_8831bd18("main_weapons_mods_packer_punch", "MM_UnpackCurrentWeapon", &function_9f219c83);
	self addmenu("main_vis", "MM_VisionsMenu", "main");
	self function_8831bd18("main_vis", "MM_BlackWhite", &function_4f352712, "mpintro");
	self function_8831bd18("main_vis", "MM_WhiteMode", &function_4f352712, "flashbang");
	self function_8831bd18("main_vis", "MM_Default", &function_c4f5df13);
	self addmenu("main_fun", "MM_FunMenu", "main");
	self function_8831bd18("main_fun", "MM_ToggleInvisible", &function_b94e53df);
	self function_8831bd18("main_fun", "MM_ToggleFlashingPlayer", &function_9881dddb);
	self function_8831bd18("main_fun", "MM_SendEarthquake", &function_c3885691);
	self function_8831bd18("main_fun", "MM_DropPhysicalVending", &function_79b47ca2, "p7_zm_vending_jugg");
	self function_8831bd18("main_fun", "MM_ClonePlayer", &function_46631f85, "newMenu", "main_fun_clone");
	self addmenu("main_fun_clone", "MM_ClonePlayer", "main_fun");
	self function_8831bd18("main_fun_clone", "MM_SpawnClone", &function_37edb1a6);
	self function_8831bd18("main_fun_clone", "MM_PlayAnimation", &function_46631f85, "newMenu", "main_fun_clone_anim");
	self addmenu("main_fun_clone_anim", "MM_PlayAnimation", "main_fun_clone");
	self function_7ad06e2("main_fun_clone_anim", "MM_PlayAnimation");
	self function_8831bd18("main_fun_clone_anim", "test", &function_24cf8957, "test");
	self function_7ad06e2("main_fun_clone_anim", "MM_Extras");
	self function_8831bd18("main_fun_clone_anim", "pb_rifle_run_slide_r", &function_24cf8957, "pb_rifle_run_slide_r");
	self function_8831bd18("main_fun_clone_anim", "pb_rifle_free_climb_up", &function_24cf8957, "pb_rifle_free_climb_up");
	self function_8831bd18("main_fun_clone_anim", "pb_crouch_run_back", &function_24cf8957, "pb_crouch_run_back");
	self function_8831bd18("main_fun_clone_anim", "pb_death_fall_loop_lightning_gun", &function_24cf8957, "pb_death_fall_loop_lightning_gun");
	self function_8831bd18("main_fun_clone_anim", "pb_death_faceplant", &function_24cf8957, "pb_death_faceplant");
	self function_8831bd18("main_fun_clone_anim", "pb_death_headshot_front_v2", &function_24cf8957, "pb_death_headshot_front_v2");
	self function_8831bd18("main_fun_clone_anim", "pb_death_headshot_back", &function_24cf8957, "pb_death_headshot_back");
	self function_8831bd18("main_fun_clone_anim", "pb_death_blowback_b", &function_24cf8957, "pb_death_blowback_b");
	self function_8831bd18("main_fun_clone_anim", "pb_death_base_pose", &function_24cf8957, "pb_death_base_pose");
	self function_8831bd18("main_fun_clone", "MM_DeleteCurrentClone", &function_360b6efc);
	if(self IsHost())
	{
		self addmenu("main_lobby", "MM_LobbyMenu", "main");
		self function_8831bd18("main_lobby", "MM_MysteryBoxMods", &function_46631f85, "newMenu", "main_lobby_box");
		self function_8831bd18("main_lobby", "MM_ToggleSuperSpeed", &function_22ea3f12, "g_speed", 500, 999, 190);
		self function_8831bd18("main_lobby", "MM_ToggleSuperGravity", &function_22ea3f12, "bg_gravity", 400, 100, 800);
		self function_8831bd18("main_lobby", "MM_ToggleSuperPhysicalGravity", &function_22ea3f12, "phys_gravity", 50, 0, -800);
		self function_8831bd18("main_lobby", "MM_ToggleTimescale", &function_22ea3f12, "timescale", 2, 0.5, 1);
		self function_8831bd18("main_lobby", "MM_ToggleDisableAiSpawners", &function_22ea3f12, "ai_disableSpawn", 1, 0);
		self function_8831bd18("main_lobby", "MM_ToggleFriendlyfire", &function_22ea3f12, "scr_friendlyfire", 1, 0);
		self function_8831bd18("main_lobby", "Grab All Craftables", &grab_all_craftables);
		self function_8831bd18("main_lobby", "Unlock All Wearables", &function_8bd2c5a);
		self function_8831bd18("main_lobby", "MM_ReviveallClients", &function_2be4a74c);
		self function_8831bd18("main_lobby", "NO Fall Damages", &function_767af6a3);
		self function_8831bd18("main_lobby", "Open All Doors", &function_a4e4af7a);
		self addmenu("main_lobby_box", "MM_MysteryBoxMods", "main_lobby");
		self function_8831bd18("main_lobby_box", "MM_MysteryBoxNeverMoves", &function_18b0419a);
		self function_8831bd18("main_lobby_box", "MM_MysteryBoxOpeningPrice", &function_46631f85, "newMenu", "main_lobby_box_price");
		self addmenu("main_lobby_box_price", "MM_MysteryBoxOpeningPrice", "main_lobby_box");
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto5100000", &function_5ea9db6e, 100000);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto51337", &function_5ea9db6e, 1337);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto5950", &function_5ea9db6e, 950);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto51", &function_5ea9db6e, 1);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto0", &function_5ea9db6e, 0);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto1D950", &function_5ea9db6e, -950);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto1D1337", &function_5ea9db6e, -1337);
		self function_8831bd18("main_lobby_box_price", "MM_Setpriceto1D100000", &function_5ea9db6e, -100000);
	}
	else
	{
		self function_8831bd18("main_host", "You can not access this Menu!", &function_46631f85, "newMenu", "main_host");
	}
	self addmenu("main_clients", "MM_CLIENTS", "main");
	self function_474b45b();
}

/*
	Name: function_87334b67
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x9E40
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 1612
*/
function function_87334b67()
{
	l("removed");
}

/*
	Name: function_474b45b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x9E68
	Size: 0x4E8
	Parameters: 0
	Flags: None
	Line Number: 1627
*/
function function_474b45b()
{
	if(self IsHost())
	{
		for(a = 0; a < GetPlayers().size; a++)
		{
			player = GetPlayers()[a];
			self function_8831bd18("main_clients", function_c203bf0d(player), &function_46631f85, "newMenu", "main_clients_" + function_c203bf0d(player));
			self addmenu("main_clients_" + function_c203bf0d(player), function_c203bf0d(player), "main_clients");
			self function_8831bd18("main_clients_" + function_c203bf0d(player), "MM_GodMode", &function_d97e996b, player);
			self function_8831bd18("main_clients_" + function_c203bf0d(player), "MM_PlayerScoreMenu", &function_46631f85, "newMenu", "main_clients_score" + function_c203bf0d(player));
			self function_8831bd18("main_clients_" + function_c203bf0d(player), "MM_GiveMenu", &function_88d1b3e2, player, "changeVerification", "admin");
			self function_8831bd18("main_clients_" + function_c203bf0d(player), "MM_TeleporttoPlayer", &function_62cbcd1e, player);
			self function_8831bd18("main_clients_" + function_c203bf0d(player), "MM_TeleportPlayertoyou", &function_1481859f, player);
			self addmenu("main_clients_score" + function_c203bf0d(player), function_c203bf0d(player), "main_clients_" + function_c203bf0d(player));
			self function_8831bd18("main_clients_score" + function_c203bf0d(player), "MM_GivePointsO10000", &function_b69de152, player, 10000);
			self function_8831bd18("main_clients_score" + function_c203bf0d(player), "MM_GivePoints500", &function_b69de152, player, 500);
			self function_8831bd18("main_clients_score" + function_c203bf0d(player), "MM_GivePointsD500", &function_b69de152, player, -500);
			self function_8831bd18("main_clients_score" + function_c203bf0d(player), "MM_GivePointsD10000", &function_b69de152, player, -10000);
		}
	}
	else
	{
		self function_8831bd18("main_clients", "You can not access this Menu!", &function_46631f85, "newMenu", "main_clients");
	}
}

/*
	Name: function_f26bdbe9
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA358
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1664
*/
function function_f26bdbe9()
{
	self endon("disconnect");
	self endon("death");
	if(isdefined(level.var_2b2f3333))
	{
		return;
	}
	level.var_2b2f3333 = 1;
	if(GetDvarInt("sv_cheats") == 1)
	{
		util::setClientSysState("deadshot_keyline", "cmd,god", self);
	}
	else
	{
		SetDvar("sv_cheats", 1);
		util::setClientSysState("deadshot_keyline", "cmd,god", self);
		wait(0.2);
		SetDvar("sv_cheats", 0);
	}
	level.var_2b2f3333 = undefined;
	return;
}

/*
	Name: function_eb0e4657
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA448
	Size: 0xE8
	Parameters: 0
	Flags: None
	Line Number: 1698
*/
function function_eb0e4657()
{
	self endon("disconnect");
	self endon("death");
	if(isdefined(level.var_2b2f3333))
	{
		return;
	}
	level.var_2b2f3333 = 1;
	if(GetDvarInt("sv_cheats") == 1)
	{
		util::setClientSysState("deadshot_keyline", "cmd,noclip", self);
	}
	else
	{
		SetDvar("sv_cheats", 1);
		util::setClientSysState("deadshot_keyline", "cmd,noclip", self);
		wait(0.2);
		SetDvar("sv_cheats", 0);
	}
	level.var_2b2f3333 = undefined;
}

/*
	Name: function_63ba4c44
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA538
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 1731
*/
function function_63ba4c44()
{
	self endon("hash_a5f3051a");
	self.fly = 0;
	ufo = spawn("script_model", self.origin);
	while(self ReloadButtonPressed())
	{
		self playerLinkTo(ufo);
		self.fly = 1;
		continue;
		self Unlink();
		self.fly = 0;
		if(self.fly == 1)
		{
			fly = self.origin + function_56d933be(AnglesToForward(self getPlayerAngles()), 20);
			ufo moveto(fly, 0.01);
		}
		wait(0.05);
	}
}

/*
	Name: function_8bd2c5a
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA678
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 1762
*/
function function_8bd2c5a()
{
	if(isdefined(level.var_a4d84208))
	{
		[[level.var_a4d84208]]();
		level.var_a4d84208 = undefined;
		IPrintLnBold("^2All Wearables Unlocked");
	}
	else
	{
		self IPrintLnBold(&"MENU_UNAVAILABLE_CAPS");
		return;
	}
}

/*
	Name: forgetoolinstructions
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA6E8
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 1787
*/
function forgetoolinstructions()
{
	self IPrintLnBold("^3Press ^2AIM ^3to ^2Move Objects");
	wait(2);
	self IPrintLnBold("^3Press ^2AIM + SHOOT ^3to ^2Paste Objects");
	wait(2);
	self IPrintLnBold("^3Press ^2AIM + [{+use}] ^3to ^2Copy Objects");
	wait(2);
	self IPrintLnBold("^3Press ^2AIM + [{+gostand}] ^3to ^2Delete Objects");
	wait(2);
	self IPrintLnBold("^3Press ^2DPAD & GRENADE BUTTONS ^3to ^2Rotate Objects");
	wait(30);
}

/*
	Name: function_71c0699
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA7A0
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 1811
*/
function function_71c0699()
{
	if(!isdefined(self.gamevars["forgetool"]))
	{
		self thread function_2d03ce07();
		self.gamevars["forgetool"] = 1;
		s("forgetool ^5ON");
	}
	else
	{
		self notify("hash_3c3ebbf4");
		self.gamevars["forgetool"] = undefined;
		s("forgetool ^1OFF");
	}
}

/*
	Name: getnormaltrace
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA848
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 1837
*/
function getnormaltrace(Distance)
{
	if(!isdefined(Distance))
	{
		Distance = 1000000;
	}
	return bullettrace(self GetEye(), self GetEye() + AnglesToForward(self getPlayerAngles()) * Distance, 0, self);
}

/*
	Name: function_2d03ce07
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xA8E0
	Size: 0x928
	Parameters: 0
	Flags: None
	Line Number: 1856
*/
function function_2d03ce07()
{
	self endon("hash_3c3ebbf4");
	self.forgetool = 0;
	self thread forgetoolinstructions();
	object = undefined;
	trace = undefined;
	cannotsetmodel = undefined;
	currentent = undefined;
	while(self AdsButtonPressed())
	{
		trace = getnormaltrace();
		if(!isdefined(trace["entity"]))
		{
			cannotsetmodel = 0;
			foreach(model in GetEntArray("script_brushmodel", "classname"))
			{
				if(!isdefined(currentent) && Distance(model.origin, trace["position"]) < 100)
				{
					currentent = model;
					cannotsetmodel = 1;
				}
				if(isdefined(currentent) && closer(trace["position"], model.origin, currentent.origin))
				{
					currentent = model;
					cannotsetmodel = 1;
				}
			}
			foreach(model in GetEntArray("script_model", "classname"))
			{
				if(!isdefined(currentent) && Distance(model.origin, trace["position"]) < 100)
				{
					currentent = model;
					cannotsetmodel = 0;
				}
				if(isdefined(currentent) && closer(trace["position"], model.origin, currentent.origin))
				{
					currentent = model;
					cannotsetmodel = 0;
				}
			}
			trace["entity"] = currentent;
		}
		while(self AdsButtonPressed())
		{
			trace["entity"] SetOrigin(self GetEye() + AnglesToForward(self getPlayerAngles()) * 200);
			trace["entity"].origin = self GetEye() + AnglesToForward(self getPlayerAngles()) * 200;
			if(self AttackButtonPressed())
			{
				if(isdefined(object))
				{
					if(isdefined(trace["entity"]) && !cannotsetmodel)
					{
						self IPrintLnBold("Overwrote Objects Model With:^2 " + object);
						trace["entity"] SetModel(object);
						trace["entity"] thread function_80f8a4c9();
					}
					else
					{
						trace = getnormaltrace();
						obj = spawn("script_model", trace["position"], 1);
						obj SetModel(object);
						obj thread function_80f8a4c9();
						self IPrintLnBold("Spawned Object:^2 " + object);
					}
				}
				wait(0.75);
			}
			if(self useButtonPressed())
			{
				if(isdefined(trace["entity"].model))
				{
					object = trace["entity"].model;
					thread function_79b47ca2(object);
					self IPrintLnBold("Copied Model: ^2" + object);
				}
				wait(0.75);
				break;
			}
			if(self JumpButtonPressed())
			{
				if(!isdefined(trace["entity"]))
				{
				}
				else
				{
					trace["entity"] delete();
					self IPrintLnBold("Entity ^1Deleted");
				}
				wait(0.75);
				break;
			}
			if(self ActionSlotOneButtonPressed())
			{
				if(isdefined(trace["entity"]))
				{
					trace["entity"] RotatePitch(6, 0.05);
				}
				else
				{
					wait(0.5);
					break;
				}
				wait(0.1);
			}
			if(self ActionSlotTwoButtonPressed())
			{
				if(isdefined(trace["entity"]))
				{
					trace["entity"] RotatePitch(-6, 0.05);
				}
				else
				{
					wait(0.5);
					break;
				}
				wait(0.1);
			}
			if(self ActionSlotThreeButtonPressed())
			{
				if(isdefined(trace["entity"]))
				{
					trace["entity"] RotateYaw(-6, 0.05);
				}
				else
				{
					wait(0.5);
					break;
				}
				wait(0.1);
			}
			if(self ActionSlotFourButtonPressed())
			{
				if(isdefined(trace["entity"]))
				{
					trace["entity"] RotateYaw(6, 0.05);
				}
				else
				{
					wait(0.5);
					break;
				}
				wait(0.1);
			}
			if(self SecondaryOffhandButtonPressed())
			{
				if(isdefined(trace["entity"]))
				{
					trace["entity"] RotateRoll(-6, 0.05);
				}
				else
				{
					wait(0.5);
					break;
				}
				wait(0.1);
			}
			if(self fragButtonPressed())
			{
				if(isdefined(trace["entity"]))
				{
					trace["entity"] RotateRoll(6, 0.05);
				}
				else
				{
					wait(0.5);
					break;
				}
				wait(0.1);
			}
			wait(0.05);
		}
		wait(0.1);
	}
}

/*
	Name: function_56d933be
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB210
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 2042
*/
function function_56d933be(vec, scale)
{
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
	return vec;
}

/*
	Name: function_d82d7e11
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB268
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2058
*/
function function_d82d7e11()
{
	if(!isdefined(self.gamevars["clip_weap"]))
	{
		self notify("hash_588b705a");
		self thread function_ee5b6b40();
		s("Unlimited clip ^5ON");
		self.gamevars["clip_weap"] = 1;
	}
	else
	{
		self notify("hash_588b705a");
		self.gamevars["clip_weap"] = undefined;
		s("Unlimited clip ^1OFF");
		return;
	}
	waittillframeend;
}

/*
	Name: function_3ae3cfbf
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB318
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2087
*/
function function_3ae3cfbf()
{
	if(!isdefined(self.gamevars["stock_weap"]))
	{
		self notify("hash_108b3c72");
		self thread function_a0b19090();
		s("Unlimited stock ^5ON");
		self.gamevars["stock_weap"] = 1;
	}
	else
	{
		self notify("hash_108b3c72");
		self.gamevars["stock_weap"] = undefined;
		s("Unlimited stock ^1OFF");
		return;
	}
}

/*
	Name: function_ee5b6b40
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB3C8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2115
*/
function function_ee5b6b40()
{
	self endon("hash_588b705a");
	while(self.gamevars["clip_weap"] == 1)
	{
		if(self GetCurrentWeapon() != "none")
		{
			self SetWeaponAmmoClip(self GetCurrentWeapon(), 1337);
		}
		wait(0.05);
	}
}

/*
	Name: function_a0b19090
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB450
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2138
*/
function function_a0b19090()
{
	self endon("hash_108b3c72");
	while(self.gamevars["stock_weap"] == 1)
	{
		if(self GetCurrentWeapon() != "none")
		{
			self SetWeaponAmmoStock(self GetCurrentWeapon(), 1337);
		}
		wait(0.05);
	}
}

/*
	Name: function_89299b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB4D8
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 2161
*/
function function_89299b()
{
	if(self GetCurrentWeapon() != "none")
	{
		self SetWeaponAmmoStock(self GetCurrentWeapon(), 1337);
		self SetWeaponAmmoClip(self GetCurrentWeapon(), 1337);
	}
	s("Ammo ^5refilled");
}

/*
	Name: function_deaf64f5
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB578
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 2181
*/
function function_deaf64f5()
{
	self notify("hash_deaf64f5");
	self endon("hash_deaf64f5");
	self endon("disconnect");
	hero = level.weaponNone;
	foreach(weapon in self GetWeaponsList(1))
	{
		if(weapon.inventoryType === "hero")
		{
			hero = weapon;
			break;
		}
	}
	self.hero_power = 0.25;
	self GadgetPowerSet(self GadgetGetSlot(hero), self.hero_power);
	if(hero != level.weaponNone)
	{
		wait(0.5);
		if(self GetCurrentWeapon() == hero)
		{
			while(self GetCurrentWeapon() == hero)
			{
				wait(0.048);
			}
			wait(0.2);
		}
		self.hero_power = 100;
		self GadgetPowerSet(self GadgetGetSlot(hero), self.hero_power);
		self SetWeaponAmmoClip(hero, hero.clipSize);
		s("Specialist ^5refilled");
	}
	else
	{
		s("^1NO Specialist");
	}
}

/*
	Name: function_9bc95b8f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB7B8
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 2229
*/
function function_9bc95b8f(i)
{
	self.score = self.score + i;
	s("Score set to ^5" + self.score);
}

/*
	Name: function_f11c7196
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB808
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 2245
*/
function function_f11c7196()
{
	if(!isdefined(self.spectatingThirdPerson))
	{
		self SetClientThirdPerson(1);
		self SetClientThirdPersonAngle(354);
		self setDepthOfField(0, 128, 512, 4000, 6, 1.8);
		self.spectatingThirdPerson = 1;
	}
	else
	{
		self SetClientThirdPerson(0);
		self SetClientThirdPersonAngle(0);
		self setDepthOfField(0, 0, 512, 4000, 4, 0);
		self.spectatingThirdPerson = 0;
	}
	self resetFov();
	return;
	ERROR: Exception occured: Stack empty.
	waittillframeend;
}

/*
	Name: function_27b012cf
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB910
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 2277
*/
function function_27b012cf()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_710a6a2a
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xB960
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 2297
*/
function function_710a6a2a(perk)
{
	if(!(self hasPerk(perk) || self zm_perks::has_perk_paused(perk)))
	{
		self zm_perks::give_perk(perk);
	}
	else
	{
		self notify(perk + "_stop");
		self iprintln("Perk [" + perk + "] ^1Removed");
	}
}

/*
	Name: function_ec103275
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBA00
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2320
*/
function function_ec103275()
{
	self zm_utility::give_player_all_perks();
	s("All Perks ^5given");
}

/*
	Name: function_3b18ee0b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBA40
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 2336
*/
function function_3b18ee0b()
{
	var_16186f6c = getArrayKeys(level._custom_perks);
	for(i = 0; i < var_16186f6c.size; i++)
	{
		if(isdefined(self.perk_purchased) && self.perk_purchased == var_16186f6c[i])
		{
			continue;
		}
		if(self hasPerk(var_16186f6c[i]) || self zm_perks::has_perk_paused(var_16186f6c[i]))
		{
			self notify(var_16186f6c[i] + "_stop");
		}
	}
	if(zm_perks::use_solo_revive() && var_16186f6c[i] == "specialty_quickrevive")
	{
		self.lives--;
	}
	s("All Perks ^1removed");
	return;
}

/*
	Name: function_bcf852f5
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBB68
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 2368
*/
function function_bcf852f5()
{
}

/*
	Name: function_688975a5
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBB78
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 2382
*/
function function_688975a5(weapon)
{
	s(function_7bd93bc1() + " ^5Given");
	self zm_weapons::weapon_give(weapon);
}

/*
	Name: function_e6a7bb10
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBBD8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 2398
*/
function function_e6a7bb10(i)
{
	s(function_7bd93bc1() + " ^5droped");
	self zm_powerups::specific_powerup_drop(i, self.origin);
}

/*
	Name: function_bdd7b813
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBC40
	Size: 0x198
	Parameters: 1
	Flags: None
	Line Number: 2414
*/
function function_bdd7b813(i)
{
	if(self.gamevars["magicbullet"] == 1)
	{
		self function_cad9b9e();
	}
	self notify("hash_fc9694a6");
	self endon("hash_fc9694a6");
	self.gamevars["fx_bullets"] = 1;
	s("Fx Bullets set to ^5" + i);
	for(;;)
	{
		self waittill("weapon_fired");
		if(IsInArray(level._effect, level._effect[i]))
		{
			triggerFx(spawnfx(level._effect[i], bullettrace(self GetTagOrigin("tag_eye"), AnglesToForward(self getPlayerAngles()) * 1000000, 1, self)["position"]));
		}
		else
		{
			s("ERROR: level._effect " + i + " is not in the array level._effect!");
		}
	}
}

/*
	Name: function_fc9694a6
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBDE0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2448
*/
function function_fc9694a6()
{
	if(!isdefined(self.gamevars["fx_bullets"]) || self.gamevars["fx_bullets"] == 0)
	{
		s("^1Fx Bullets is already OFF. Choose a Fx to turn it on!");
	}
	else
	{
		self notify("hash_fc9694a6");
		self.gamevars["fx_bullets"] = undefined;
		s("FX Bullets ^1OFF");
	}
}

/*
	Name: function_18e925bb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBE78
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 2472
*/
function function_18e925bb(i)
{
	if(self.gamevars["fx_bullets"] == 1)
	{
		self function_fc9694a6();
	}
	self notify("hash_c7ba1c76");
	self endon("hash_c7ba1c76");
	self.gamevars["magicbullet"] = 1;
	self iprintln("Weapon Bullets set to ^5" + i.name);
	for(;;)
	{
		self waittill("weapon_fired");
		MagicBullet(i, self GetEye(), bullettrace(self GetEye(), self GetEye() + AnglesToForward(self getPlayerAngles()) * 100000, 0, self)["position"], self);
		wait(0.02);
	}
}

/*
	Name: function_cad9b9e
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xBFD0
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2500
*/
function function_cad9b9e()
{
	if(!isdefined(self.gamevars["magicbullet"]) || self.gamevars["magicbullet"] == 0)
	{
		s("^1Weapon Bullets is already OFF. Choose a Fx to turn it on!");
	}
	else
	{
		self notify("hash_c7ba1c76");
		self.gamevars["magicbullet"] = undefined;
		s("Weapon Bullets ^1OFF");
		return;
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_35f0993c
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC068
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 2526
*/
function function_35f0993c()
{
	weapon = self GetCurrentWeapon();
	if(!self zm_weapons::can_upgrade_weapon(weapon))
	{
		s("^1Can not upgrade this weapon!");
		return;
	}
	var_c32ee7bc = zm_weapons::weapon_supports_aat(weapon);
	upgrade_weapon = zm_weapons::get_upgrade_weapon(weapon, var_c32ee7bc);
	self function_688975a5(upgrade_weapon);
}

/*
	Name: function_9f219c83
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC140
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2549
*/
function function_9f219c83()
{
	weapon = self GetCurrentWeapon();
	if(!zm_weapons::is_weapon_upgraded(weapon))
	{
		s("^1Weapon is not upgraded!");
		return;
	}
	weapon = zm_weapons::get_base_weapon(weapon);
	self function_688975a5(weapon);
}

/*
	Name: function_622c3768
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC1D8
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 2571
*/
function function_622c3768()
{
	weapon = self GetCurrentWeapon();
	item = self dropitem(weapon);
	item notify("death");
	s("Weapon ^5Dropped");
}

/*
	Name: function_3649c60d
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC260
	Size: 0x78
	Parameters: 1
	Flags: None
	Line Number: 2589
*/
function function_3649c60d(i)
{
	for(a = 0; a < GetPlayers().size; a++)
	{
		GetPlayers()[a] [[self.menu["message_type"]]](i);
	}
}

/*
	Name: function_11059498
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC2E0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 2607
*/
function function_11059498()
{
	if(self.menu["message_type"] == &sb)
	{
		self.menu["message_type"] = &s;
		s("Print Methode Changed to ^5Left Corner Message");
	}
	else if(self.menu["message_type"] == &s)
	{
		self.menu["message_type"] = &sb;
		s("Print Methode Changed to ^5Center Screen Message");
	}
}

/*
	Name: function_b69de152
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC3A0
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 2631
*/
function function_b69de152(player, ammount)
{
	player thread function_9bc95b8f(ammount);
	s(function_c203bf0d(player) + " score set to " + player.score);
}

/*
	Name: function_d97e996b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC418
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 2647
*/
function function_d97e996b(player)
{
	player thread function_f26bdbe9();
	if(player == self)
	{
		return;
	}
	s("Sending god commands to " + function_c203bf0d(player));
	return;
}

/*
	Name: function_88d1b3e2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC488
	Size: 0x100
	Parameters: 3
	Flags: None
	Line Number: 2668
*/
function function_88d1b3e2(player, par2, par3)
{
	if(par2 == "changeVerification")
	{
		if(player == GetPlayers()[0])
		{
			return s("You can not modify the host");
		}
		player setverification(par3);
		s(function_c203bf0d(player) + "'s verification has been changed to " + par3);
		player iprintln("Your verification has been changed to " + par3);
		player iprintln("Press ^5[{stance}]^7 + ^5[{reload}]");
		return;
	}
}

/*
	Name: setverification
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC590
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 2694
*/
function setverification(type)
{
	self.var_3e5e5de["verfication"] = type;
	s("Your Status changed to ^5" + self.var_3e5e5de["verfication"]);
}

/*
	Name: function_5813daa7
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC5E8
	Size: 0x90
	Parameters: 0
	Flags: None
	Line Number: 2710
*/
function function_5813daa7()
{
	if(self.var_3e5e5de["verfication"] == "admin")
	{
		return 3;
	}
	if(self.var_3e5e5de["verfication"] == "co-host")
	{
		return 2;
	}
	if(self.var_3e5e5de["verfication"] == "verified")
	{
		return 1;
	}
	if(self.var_3e5e5de["verfication"] == "unverified")
	{
		return 0;
	}
}

/*
	Name: function_22ea3f12
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC680
	Size: 0x268
	Parameters: 4
	Flags: None
	Line Number: 2740
*/
function function_22ea3f12(input, var_2b636b16, var_560f0ad, var_df5e7644)
{
	if(function_56ebf780(var_df5e7644))
	{
		var_df5e7644 = undefined;
	}
	if(self.gamevars[input] == 0 || !isdefined(self.gamevars[input]))
	{
		SetDvar(input, var_2b636b16);
		self.gamevars[input] = 1;
		s(function_7bd93bc1() + " ^5ON^7 - var " + input + " set to " + var_2b636b16);
	}
	else if(self.gamevars[input] == 1)
	{
		SetDvar(input, var_560f0ad);
		if(isdefined(var_df5e7644))
		{
			self.gamevars[input] = 2;
			s(function_7bd93bc1() + " ^5ON^7 - var " + input + " set to " + var_560f0ad);
		}
		else
		{
			self.gamevars[input] = 0;
			s(function_7bd93bc1() + " ^1OFF^7 - var " + input + " set to " + var_560f0ad);
		}
	}
	else if(self.gamevars[input] == 2)
	{
		SetDvar(input, var_df5e7644);
		self.gamevars[input] = 0;
		s(function_7bd93bc1() + " ^1OFF^7 - var " + input + " set to " + var_df5e7644);
	}
}

/*
	Name: function_56ebf780
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC8F0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 2784
*/
function function_56ebf780(i)
{
	if(i == "" || !isdefined(i))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

/*
	Name: function_578ab151
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC930
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 2806
*/
function function_578ab151(dvar, i)
{
	SetDvar(dvar, i);
	s("Var ^5" + dvar + "^7 setted to ^5" + i);
}

/*
	Name: function_dcae2aea
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xC998
	Size: 0xC0
	Parameters: 0
	Flags: None
	Line Number: 2822
*/
function function_dcae2aea()
{
	if(GetDvarInt("cg_drawGun") == 0)
	{
		SetDvar("cg_drawGun", "1");
	}
	else
	{
		SetDvar("cg_drawGun", "0");
	}
	if(GetDvarInt("cg_drawGun") == 0)
	{
	}
	else
	{
	}
	self s("^5ON" + "^1OFF");
}

/*
	Name: function_569aff82
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCA60
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2851
*/
function function_569aff82()
{
	if(GetDvarInt("cg_drawCrosshair") == 0)
	{
		SetDvar("cg_drawCrosshair", 1);
	}
	else
	{
		SetDvar("cg_drawCrosshair", 0);
	}
	if(GetDvarInt("cg_drawCrosshair") == 0)
	{
	}
	else
	{
	}
	self s("^5ON" + "^1OFF");
}

/*
	Name: function_f043c27c
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCB18
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 2880
*/
function function_f043c27c()
{
	s("Your Origin ^5" + self GetOrigin());
}

/*
	Name: function_62cbcd1e
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCB58
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 2895
*/
function function_62cbcd1e(i)
{
	self SetOrigin(i GetOrigin());
	return;
	.var_0 = undefined;
}

/*
	Name: function_1481859f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCB98
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 2912
*/
function function_1481859f(i)
{
	i SetOrigin(self GetOrigin());
	return;
}

/*
	Name: function_63e7ddba
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCBD8
	Size: 0x18
	Parameters: 2
	Flags: None
	Line Number: 2928
*/
function function_63e7ddba(menu, i)
{
}

/*
	Name: function_7cf6d5ac
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCBF8
	Size: 0x20
	Parameters: 3
	Flags: None
	Line Number: 2942
*/
function function_7cf6d5ac(menu, i, var_560f0ad)
{
	return;
	ERROR: Bad function call
}

/*
	Name: function_b94e53df
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCC20
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 2958
*/
function function_b94e53df()
{
	if(!self.gamevars["invisible"])
	{
		self Hide();
		self.gamevars["invisible"] = 1;
		s("You are ^5Invisible");
	}
	else
	{
		self show();
		self.gamevars["invisible"] = 0;
		s("You are ^1Visible");
	}
}

/*
	Name: function_9881dddb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCCD0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 2984
*/
function function_9881dddb()
{
	if(!isdefined(self.gamevars["flashingPlayer"]))
	{
		self.gamevars["flashingPlayer"] = 1;
		self thread function_65368abe();
		s("Flashing Player ^5ON^7");
	}
	else
	{
		self.gamevars["flashingPlayer"] = undefined;
		self notify("hash_58b84a39");
		s("Flashing Player ^1OFF^7");
		self show();
	}
}

/*
	Name: function_65368abe
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCD88
	Size: 0x70
	Parameters: 0
	Flags: None
	Line Number: 3011
*/
function function_65368abe()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("hash_58b84a39");
	for(;;)
	{
		self show();
		wait(0.1);
		self Hide();
		wait(0.1);
	}
}

/*
	Name: function_4f352712
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCE00
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 3036
*/
function function_4f352712(i)
{
	if(!isdefined(i))
	{
		i = "default";
	}
	self UseServerVisionset(1);
	self SetVisionSetForPlayer(i, 1);
	s("Vision set to ^5" + function_7bd93bc1());
	l("visionserver: " + i);
}

/*
	Name: function_c4f5df13
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCEB8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 3058
*/
function function_c4f5df13()
{
	self function_4f352712("default");
	s("Modded Vision ^1OFF");
}

/*
	Name: function_914de35f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCF00
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 3074
*/
function function_914de35f(i)
{
	self playsound(i);
	s("You are playing ^5" + function_7bd93bc1());
	l(i);
}

/*
	Name: function_37edb1a6
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xCF78
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 3091
*/
function function_37edb1a6(player)
{
	if(!isdefined(player))
	{
		player = self;
	}
	if(isdefined(self.gamevars["Clone"]))
	{
		s("^1You already spawned a Clone, delete the current to spawn a new one.");
		return;
	}
	self.gamevars["Clone"] = player util::spawn_player_clone(player, "t7_loot_gesture_goodgame_salute");
	s("Clone ^5Spawned");
}

/*
	Name: function_24cf8957
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD018
	Size: 0xD0
	Parameters: 1
	Flags: None
	Line Number: 3116
*/
function function_24cf8957(animName)
{
	if(!isdefined(self.gamevars["Clone"]))
	{
		s("^1Spawn a Clone first!");
		return;
	}
	self.gamevars["Clone"] AnimScripted("clone_anim", self.gamevars["Clone"].origin, self.gamevars["Clone"].angles, animName);
	s("Animation " + animName + " ^5Played");
}

/*
	Name: function_360b6efc
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD0F0
	Size: 0xF8
	Parameters: 0
	Flags: None
	Line Number: 3137
*/
function function_360b6efc()
{
	if(!isdefined(self.gamevars["Clone"]))
	{
		s("^1Spawn a Clone first!");
		return;
	}
	self.gamevars["Clone"] AnimScripted("clone_anim", self.gamevars["Clone"].origin, self.gamevars["Clone"].angles, "pb_death_headshot_back");
	wait(2);
	self.gamevars["Clone"] delete();
	self.gamevars["Clone"] = undefined;
	s("Clone ^5deleted");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4fd7ed8
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD1F0
	Size: 0xC8
	Parameters: 0
	Flags: None
	Line Number: 3163
*/
function function_b4fd7ed8()
{
	if(!isdefined(self.gamevars["Clone"]))
	{
		s("^1Spawn a Clone first!");
		return;
	}
	self.gamevars["Clone"] SetOrigin(self.origin);
	self.gamevars["Clone"] AnimScripted("clone_anim", self.origin, self.angles, "pb_death_base_pose");
	s("Clone ^5teleported");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_59f2b3df
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD2C0
	Size: 0x8
	Parameters: 0
	Flags: None
	Line Number: 3187
*/
function function_59f2b3df()
{
}

/*
	Name: function_d9d07b08
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD2D0
	Size: 0x168
	Parameters: 0
	Flags: None
	Line Number: 3201
*/
function function_d9d07b08()
{
	if(!isdefined(self.gamevars["aimbot"]) || !self.gamevars["aimbot"])
	{
		self.gamevars["aimbot"] = 1;
		self thread function_4762164();
		s("Aimbot ^5ON");
	}
	else
	{
		self.gamevars["aimbot"] = 0;
		s("Aimbot ^1OFF");
	}
	if(self.gamevars["aimbot"] == 1)
	{
	}
	else
	{
	}
	self function_161ea108("^5ON^7" + "^1OFF^7" + ">");
	if(self.gamevars["aimbot"] == 1)
	{
	}
	else
	{
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_4762164
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD440
	Size: 0x238
	Parameters: 0
	Flags: None
	Line Number: 3241
*/
function function_4762164()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	while(self.gamevars["aimbot"])
	{
		while(self AdsButtonPressed() || (self.gamevars["aimbot_aimbutton_none"] && self.gamevars["aimbot"]))
		{
			var_458203d5 = ArrayGetClosest(self GetOrigin(), GetAISpeciesArray("axis", "all"));
			if(!BulletTracePassed(self GetTagOrigin("j_head"), var_458203d5 GetTagOrigin("j_head"), 0, self) && self.gamevars["aimbot_vis"])
			{
				wait(0.001);
				continue;
			}
			self SetPlayerAngles(VectorToAngles(var_458203d5 GetTagOrigin("j_head") - self GetTagOrigin("j_head")));
			if(self.gamevars["aimbot_unfair"])
			{
				if(self AttackButtonPressed() || self.gamevars["aimbot_shootbutton_none"])
				{
					var_458203d5 DoDamage(var_458203d5.health + 1, var_458203d5 GetOrigin(), self);
				}
			}
			wait(0.01);
		}
		wait(0.05);
	}
}

/*
	Name: function_6d69cf20
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD680
	Size: 0x140
	Parameters: 0
	Flags: None
	Line Number: 3280
*/
function function_6d69cf20()
{
	self.gamevars["aimbot_unfair"] = !self.gamevars["aimbot_unfair"];
	if(self.gamevars["aimbot_unfair"] == 1)
	{
	}
	else
	{
	}
	self s("^5ON" + "^1OFF");
	if(self.gamevars["aimbot_unfair"] == 1)
	{
	}
	else
	{
	}
	self function_161ea108("^5ON^7" + "^1OFF^7" + ">");
	if(self.gamevars["aimbot_unfair"] == 1)
	{
	}
	else
	{
	}
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1917f3a2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD7C8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 3317
*/
function function_1917f3a2()
{
	self.gamevars["aimbot_aimbutton_none"] = !self.gamevars["aimbot_aimbutton_none"];
	if(self.gamevars["aimbot_aimbutton_none"])
	{
		self.gamevars["current_aim_version"] = "None";
	}
	else
	{
		self.gamevars["current_aim_version"] = "Right Mouse";
	}
	self function_161ea108("Toggle Button <" + self.gamevars["current_aim_version"] + ">");
	self function_23aad50f(3, "main_aimbot", "Toggle Button <" + self.gamevars["current_aim_version"] + ">", &function_1917f3a2);
}

/*
	Name: function_db5f968c
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD8D8
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 3342
*/
function function_db5f968c()
{
	self.gamevars["aimbot_shootbutton_none"] = !self.gamevars["aimbot_shootbutton_none"];
	if(self.gamevars["aimbot_shootbutton_none"])
	{
		self.gamevars["current_shoot_version"] = "None";
	}
	else
	{
		self.gamevars["current_shoot_version"] = "Left Mouse";
	}
	self function_161ea108("Toggle Shoot Button <" + self.gamevars["current_shoot_version"] + ">");
	self function_23aad50f(2, "main_aimbot", "Toggle Shoot Button <" + self.gamevars["current_shoot_version"] + ">", &function_db5f968c);
}

/*
	Name: function_7579d98b
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xD9E8
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3367
*/
function function_7579d98b()
{
	self.gamevars["aimbot_vis"] = !self.gamevars["aimbot_vis"];
	if(self.gamevars["aimbot_vis"] == 1)
	{
	}
	else
	{
	}
	self s("^5ON" + "^1OFF");
}

/*
	Name: function_161ea108
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDA68
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3389
*/
function function_161ea108(i)
{
	self.menu["ui"]["text"][self getcursor()] setText(i);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_23aad50f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDAC8
	Size: 0x170
	Parameters: 8
	Flags: None
	Line Number: 3406
*/
function function_23aad50f(count, menu, name, func, input1, input2, input3, input4)
{
	self.menu["items"][menu].name[count] = name;
	self.menu["items"][menu].func[count] = func;
	if(isdefined(input1))
	{
		self.menu["items"][menu].input1[count] = input1;
	}
	if(isdefined(input2))
	{
		self.menu["items"][menu].input2[count] = input2;
	}
	if(isdefined(input3))
	{
		self.menu["items"][menu].input3[count] = input3;
	}
	if(isdefined(input4))
	{
		self.menu["items"][menu].input4[count] = input4;
	}
}

/*
	Name: function_9273a04f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDC40
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 3438
*/
function function_9273a04f()
{
	self.gamevars["pos_self_saved"] = self.origin;
	s("Position ^5Saved");
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_64f6c45c
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDC80
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 3456
*/
function function_64f6c45c()
{
	if(isdefined(self.gamevars["pos_self_saved"]))
	{
		self SetOrigin(self.gamevars["pos_self_saved"]);
		s("Position ^5Loaded");
		l(self.gamevars["pos_self_saved"]);
	}
	else
	{
		s("^1You need to save a position first!");
		return;
	}
	ERROR: Exception occured: Stack empty.
	continue;
}

/*
	Name: function_a19a8a07
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDD28
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 3483
*/
function function_a19a8a07()
{
	if(isdefined(self.gamevars["pos_self_saved"]))
	{
		if(!isdefined(self.gamevars["pos_zombz_loop"]) || self.gamevars["pos_zombz_loop"] == 0)
		{
			s("Zombies Teleported to the Saved Location.");
			self function_c17c9967(&function_499cc832, self.gamevars["pos_self_saved"]);
		}
		else
		{
			s("^1Turn Location Spawn Trapper ^1OFF");
		}
	}
	else
	{
		s("^1You need to save a position first!");
	}
}

/*
	Name: function_2dd0427f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDE08
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 3513
*/
function function_2dd0427f()
{
	if(isdefined(self.gamevars["pos_self_saved"]))
	{
		if(!isdefined(self.gamevars["pos_zombz_spawn"]) || self.gamevars["pos_zombz_spawn"] == 0)
		{
			self.gamevars["pos_zombz_spawn"] = 1;
			self.gamevars["pos_zombz_loop"] = 0;
			s("Zombies spawn set to the Saved Location.");
			while(self.gamevars["pos_zombz_spawn"] == 1)
			{
				self function_c17c9967(&function_21446e3d, self.gamevars["pos_self_saved"]);
				wait(0.1);
			}
		}
		else
		{
			self.gamevars["pos_zombz_spawn"] = 0;
			s("Location Spawn Trapper ^1OFF");
		}
	}
	else
	{
		s("^1You need to save a position first!");
	}
}

/*
	Name: function_64dc5534
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xDF48
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 3550
*/
function function_64dc5534()
{
	if(isdefined(self.gamevars["pos_self_saved"]))
	{
		if(!isdefined(self.gamevars["pos_zombz_loop"]) || self.gamevars["pos_zombz_loop"] == 0)
		{
			self.gamevars["pos_zombz_loop"] = 1;
			self.gamevars["pos_zombz_spawn"] = 0;
			s("Zombies will teleport in a loop to the Saved Location.");
			while(self.gamevars["pos_zombz_loop"] == 1)
			{
				self function_c17c9967(&function_499cc832, self.gamevars["pos_self_saved"]);
				wait(0.1);
			}
		}
		else
		{
			self.gamevars["pos_zombz_loop"] = 0;
			s("Location Spawn Trapper ^1OFF");
		}
	}
	else
	{
		s("^1You need to save a position first!");
	}
}

/*
	Name: function_92dc25bf
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE088
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3587
*/
function function_92dc25bf()
{
	return GetAISpeciesArray("axis", "all");
}

/*
	Name: function_c17c9967
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE0B8
	Size: 0x70
	Parameters: 2
	Flags: None
	Line Number: 3602
*/
function function_c17c9967(var_fd3b67a2, input)
{
	for(i = 0; i < function_92dc25bf().size; i++)
	{
		function_92dc25bf()[i] [[var_fd3b67a2]](input);
	}
}

/*
	Name: function_d93f0adb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE130
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3620
*/
function function_d93f0adb()
{
	self SetOrigin(self function_9d6054fe());
	s("Teleported to Trace Position ^5Successful");
}

/*
	Name: function_9f4fb027
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE180
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3636
*/
function function_9f4fb027()
{
	self SetOrigin(self GetOrigin() + VectorScale((0, 0, 1), 100000));
	s("Teleported to Sky ^5Successful");
}

/*
	Name: function_a5870e71
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE1E0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3652
*/
function function_a5870e71()
{
	self SetOrigin(function_7b344185(self GetOrigin()));
	s("Teleported to Ground ^5Successful");
	return;
	~;
}

/*
	Name: function_7b344185
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE240
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 3670
*/
function function_7b344185(origin)
{
	return bullettrace(origin, origin + VectorScale((0, 0, -1), 100000), 0, self)["position"];
	.var_0 = undefined;
}

/*
	Name: function_9d6054fe
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE288
	Size: 0x78
	Parameters: 0
	Flags: None
	Line Number: 3686
*/
function function_9d6054fe()
{
	return bullettrace(self GetTagOrigin("tag_eye"), AnglesToForward(self getPlayerAngles()) * 1000000, 1, self)["position"];
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_10c87d75
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE308
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 3702
*/
function function_10c87d75()
{
	self s("^1Error^7: There are no Enemys to Teleport to.");
}

/*
	Name: function_499cc832
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE338
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 3717
*/
function function_499cc832(i)
{
	self ForceTeleport(i);
	self zm_spawner::zombie_setup_attack_properties();
	self zombie_utility::reset_attack_spot();
}

/*
	Name: function_21446e3d
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE398
	Size: 0x90
	Parameters: 1
	Flags: None
	Line Number: 3734
*/
function function_21446e3d(i)
{
	if(!isdefined(self.var_c377bda))
	{
		self.var_c377bda = 0;
	}
	if(!self.var_c377bda)
	{
		self.var_c377bda = 1;
		wait(1.5);
		self ForceTeleport(i);
		self zm_spawner::zombie_setup_attack_properties();
		self zombie_utility::reset_attack_spot();
	}
}

/*
	Name: function_51360c71
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE430
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 3760
*/
function function_51360c71(i)
{
	if(isdefined(self.gamevars["pos_self_saved"]))
	{
		self.gamevars["pos_self_saved"] = self.gamevars["pos_self_saved"] + i;
		s("X:^5" + self.gamevars["pos_self_saved"][0] + "^7 Y:^5" + self.gamevars["pos_self_saved"][1] + "^7 Z:^5" + self.gamevars["pos_self_saved"][2] + "^7");
	}
	else
	{
		s("^1You need to save a position first!");
	}
}

/*
	Name: function_c3885691
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE520
	Size: 0x50
	Parameters: 0
	Flags: None
	Line Number: 3783
*/
function function_c3885691()
{
System.InvalidOperationException: Stack empty.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at System.Collections.Generic.Stack`1.Pop()
   at Cerberus.Logic.Decompiler.BuildCondition(Int32 startIndex) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 593
   at Cerberus.Logic.Decompiler.FindIfStatements() in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 298
   at Cerberus.Logic.Decompiler..ctor(ScriptExport function, ScriptBase script) in C:\Users\Sky\Downloads\Black Ops 3 GSC\Cerberus\Logic\Decompiler.cs:line 222
}

/*
	Name: function_632b684e
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE578
	Size: 0x200
	Parameters: 0
	Flags: None
	Line Number: 3803
*/
function function_632b684e()
{
	if(!isdefined(self.gamevars["israpfireonorno"]))
	{
		self.gamevars["israpfireonorno"] = 1;
		self s("Rapid Fire ^5ON");
		SetDvar("perk_weapRateMultiplier", "0.001");
		SetDvar("perk_weapReloadMultiplier", "0.001");
		SetDvar("perk_fireproof", "0.001");
		SetDvar("cg_weaponSimulateFireAnims", "0.001");
		self setPerk("specialty_rof");
		self setPerk("specialty_fastreload");
	}
	else
	{
		self.gamevars["israpfireonorno"] = undefined;
		self s("Rapid Fire ^1OFF");
		SetDvar("perk_weapRateMultiplier", "1");
		SetDvar("perk_weapReloadMultiplier", "1");
		SetDvar("perk_fireproof", "1");
		SetDvar("cg_weaponSimulateFireAnims", "1");
		self unsetPerk("specialty_rof");
		self unsetPerk("specialty_fastreload");
	}
}

/*
	Name: function_7199d298
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE780
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 3839
*/
function function_7199d298()
{
	if(!self.ignoreme)
	{
		s("No Target ^5ON");
		self.ignoreme = 1;
	}
	else
	{
		s("No Target ^1OFF");
		self.ignoreme = 0;
	}
}

/*
	Name: function_12b8e3ee
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE7E0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 3863
*/
function function_12b8e3ee()
{
	if(!isdefined(self.gamevars["walkunderwater"]))
	{
		self.gamevars["walkunderwater"] = 1;
		self WalkUnderwater(1);
		s("Walk Underwater ^5ON");
	}
	else
	{
		self.gamevars["walkunderwater"] = undefined;
		self WalkUnderwater(0);
		s("Walk Underwater ^1OFF");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_72b7c146
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE890
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 3891
*/
function function_72b7c146()
{
	self s("Current Zombie Count ^5" + function_92dc25bf().size);
}

/*
	Name: function_934a1200
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE8D8
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3906
*/
function function_934a1200()
{
	PhysicsExplosionSphere(self.origin, 500, 450, 5);
	s("Physical Explosion ^5Sended");
}

/*
	Name: function_a2e499fe
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE928
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 3922
*/
function function_a2e499fe()
{
	PhysicsExplosionCylinder(self.origin, 500, 450, 5);
	s("Physical Cylinder ^5Sended");
}

/*
	Name: function_d0345ed
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xE978
	Size: 0xE0
	Parameters: 0
	Flags: None
	Line Number: 3938
*/
function function_d0345ed()
{
	var_7f8c94a2 = GetEntArray("script_model", "classname");
	for(i = 0; i < var_7f8c94a2.size; i++)
	{
		s("*");
		s(var_7f8c94a2[i].model);
		s(var_7f8c94a2[i]);
		s(i);
		wait(1);
	}
	return;
}

/*
	Name: function_3d0621f6
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xEA60
	Size: 0x208
	Parameters: 0
	Flags: None
	Line Number: 3962
*/
function function_3d0621f6()
{
	var_names = GetEntArray("script_model", "classname");
	self addmenu("main_entity_models", "Entity Menu", "main_entity");
	for(i = 0; i < var_names.size; i++)
	{
		if(!isdefined(level.var_2347fc6f))
		{
			level.var_2347fc6f = [];
		}
		if(!isdefined(level.var_2347fc6f[var_names[i].model]) || IsSubStr(var_names[i].model, "collision") || IsSubStr(var_names[i].model, "tag_"))
		{
			level.var_2347fc6f[var_names[i].model] = var_names[i].model;
			level.var_2347fc6f[var_names[i].model].name = function_32ef9d50(var_names[i].model);
			self function_8831bd18("main_entity_models", function_32ef9d50(var_names[i].model), &function_f46a2caf, level.var_2347fc6f[var_names[i].model]);
		}
	}
}

/*
	Name: function_425917ce
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xEC70
	Size: 0x80
	Parameters: 1
	Flags: None
	Line Number: 3991
*/
function function_425917ce(i)
{
	if(!isdefined(level.var_2347fc6f))
	{
		level.var_2347fc6f = [];
	}
	if(!isdefined(level.var_2347fc6f[i]))
	{
		level.var_2347fc6f[i] = i;
		level.var_2347fc6f[i].name = function_32ef9d50(i);
		return;
	}
}

/*
	Name: function_32ef9d50
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xECF8
	Size: 0x60
	Parameters: 1
	Flags: None
	Line Number: 4015
*/
function function_32ef9d50(i)
{
	switch(i)
	{
		case "zombie_skull":
		{
			i = "Zombie Skull";
			break;
		}
		default
		{
			i = "&" + i;
			break;
		}
	}
	return i;
}

/*
	Name: function_c2ce6306
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xED60
	Size: 0x360
	Parameters: 0
	Flags: None
	Line Number: 4043
*/
function function_c2ce6306()
{
	self endon("disconnect");
	self endon("death");
	self.menu["isLocked"] = 1;
	self function_46631f85("close");
	wait(0.5);
	self.menu["isLocked"] = 1;
	self s("Press ^3[{+attack}]^7/^3[{+speed_throw}]^7 to Change Model");
	self s("Press ^3F ^7to select Model");
	self s("Press ^3[{+melee}]^7 to close.");
	var_16bdccb1 = getArrayKeys(level.var_2347fc6f);
	if(!isdefined(self.var_d5f7dd05))
	{
		self.var_d5f7dd05 = 0;
	}
	self function_f46a2caf(var_16bdccb1[self.var_d5f7dd05]);
	while(self AttackButtonPressed() || self AdsButtonPressed())
	{
		self.var_d5f7dd05 = self.var_d5f7dd05 - self AdsButtonPressed();
		self.var_d5f7dd05 = self.var_d5f7dd05 + self AttackButtonPressed();
		if(self.var_d5f7dd05 < 0)
		{
			self.var_d5f7dd05 = var_16bdccb1.size - 1;
		}
		if(self.var_d5f7dd05 > var_16bdccb1.size - 1)
		{
			self.var_d5f7dd05 = 0;
		}
		l("model key: " + self.var_d5f7dd05);
		self function_f46a2caf(var_16bdccb1[self.var_d5f7dd05]);
		wait(0.5);
		if(self useButtonPressed())
		{
			if(!isdefined(self.var_3ed1bc91))
			{
				s("^1You need to select a model!");
			}
			else
			{
				s("Selceted Model is ^5" + self.var_3ed1bc91);
			}
			wait(0.5);
			self.menu["isLocked"] = 0;
			self function_46631f85("open_withoutanimation", "main_entity");
			break;
		}
		if(self meleeButtonPressed())
		{
			function_4440d7a2();
			wait(0.5);
			self.menu["isLocked"] = 0;
			self function_46631f85("open_withoutanimation", "main_entity");
			break;
		}
		wait(0.05);
	}
}

/*
	Name: function_f46a2caf
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF0C8
	Size: 0x160
	Parameters: 1
	Flags: None
	Line Number: 4112
*/
function function_f46a2caf(model)
{
	vector = self GetEye() + function_56d933be(AnglesToForward(self getPlayerAngles()), 50);
	if(!isdefined(self.var_3ed1bc91))
	{
		self.var_3ed1bc91 = spawn("script_model", vector);
		function_d44bc8ab(self.var_3ed1bc91);
		self thread function_bd9aa0bb();
	}
	self.var_3ed1bc91 SetModel(model);
	if(!isdefined(self.var_3ed1bc91.spin))
	{
		self.var_3ed1bc91.spin = [];
	}
	self function_544d336();
	s("Your selected Model is ^5" + function_32ef9d50(model));
}

/*
	Name: function_bd9aa0bb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF230
	Size: 0x128
	Parameters: 0
	Flags: None
	Line Number: 4140
*/
function function_bd9aa0bb()
{
	self notify("hash_f5fb4c9e");
	self endon("hash_f5fb4c9e");
	self endon("disconnect");
	self endon("death");
	self endon("death");
	if(!isdefined(self.var_bca0d3d5))
	{
		self.var_bca0d3d5 = 250;
	}
	while(isdefined(self.var_3ed1bc91))
	{
		self.var_3ed1bc91 moveto(bullettrace(self GetEye(), self GetEye() + function_56d933be(AnglesToForward(self getPlayerAngles()), self.var_bca0d3d5), 0, self.var_3ed1bc91)["position"], 0.1);
		wait(0.05);
	}
}

/*
	Name: function_4fb4684a
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF360
	Size: 0x48
	Parameters: 0
	Flags: None
	Line Number: 4168
*/
function function_4fb4684a()
{
	if(isdefined(self.var_3ed1bc91))
	{
		self notify("hash_f5fb4c9e");
		self.var_3ed1bc91 = undefined;
	}
	else
	{
		s("^1You need to select a model first!");
	}
}

/*
	Name: function_1bdee0d8
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF3B0
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 4191
*/
function function_1bdee0d8()
{
	self.var_3ed1bc91 thread function_80f8a4c9();
	if(isdefined(self.var_3ed1bc91))
	{
		self notify("hash_f5fb4c9e");
		self.var_3ed1bc91 = undefined;
	}
	else
	{
		s("^1You need to select a model first!");
	}
}

/*
	Name: function_4440d7a2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF418
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 4215
*/
function function_4440d7a2()
{
	if(!isdefined(self.var_3ed1bc91))
	{
		s("^1You need to select a model first!");
		return;
	}
	self notify("hash_f5fb4c9e");
	level.var_3045217a[level.var_3045217a.size - 1] delete();
	level.var_3045217a[level.var_3045217a.size - 1] = undefined;
	self.var_3ed1bc91 = undefined;
	s("Model deleted");
}

/*
	Name: function_f325dbaf
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF4C0
	Size: 0x48
	Parameters: 1
	Flags: None
	Line Number: 4239
*/
function function_f325dbaf(i)
{
	self.var_bca0d3d5 = self.var_bca0d3d5 + i;
	s("Model Distance set to ^5" + self.var_bca0d3d5);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_80f8a4c9
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF510
	Size: 0x38
	Parameters: 0
	Flags: None
	Line Number: 4257
*/
function function_80f8a4c9()
{
	self endon("death");
	self endon("hash_cbe43a04");
	for(;;)
	{
		self physicslaunch();
		wait(0.1);
	}
}

/*
	Name: function_d44bc8ab
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF550
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 4278
*/
function function_d44bc8ab(entity)
{
	if(!isdefined(level.var_3045217a))
	{
		level.var_3045217a = [];
	}
	level.var_3045217a[level.var_3045217a.size] = entity;
	return;
	ERROR: Bad function call
}

/*
	Name: function_9b3236f8
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF598
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 4299
*/
function function_9b3236f8()
{
	if(!isdefined(level.var_3045217a))
	{
		s("^1No Entitys in spawned!");
		return;
	}
	else
	{
		s("All Entitys (" + level.var_3045217a.size + ") deleted.");
		for(i = 0; i < level.var_3045217a.size; i++)
		{
			level.var_3045217a[i] notify("hash_cbe43a04");
			level.var_3045217a[i] delete();
		}
		level.var_3045217a = undefined;
	}
}

/*
	Name: function_46e484ea
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF670
	Size: 0xB0
	Parameters: 2
	Flags: None
	Line Number: 4328
*/
function function_46e484ea(num, times)
{
	self.var_3ed1bc91.spin[num] = self.var_3ed1bc91.spin[num] + 10 * times;
	self.var_3ed1bc91 RotateTo((self.var_3ed1bc91.spin[0], self.var_3ed1bc91.spin[1], self.var_3ed1bc91.spin[2]), 1, 0, 1);
}

/*
	Name: function_544d336
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF728
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 4344
*/
function function_544d336()
{
	self.var_3ed1bc91.spin[0] = 0;
	self.var_3ed1bc91.spin[1] = 0;
	self.var_3ed1bc91.spin[2] = 0;
	self.var_3ed1bc91.angles = (self.var_3ed1bc91.spin[0], self.var_3ed1bc91.spin[1], self.var_3ed1bc91.spin[2]);
}

/*
	Name: function_79b47ca2
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF7D0
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 4362
*/
function function_79b47ca2(model)
{
	self.var_a6a5d843 = spawn("script_model", self.origin + VectorScale((0, 0, 1), 100));
	self.var_a6a5d843 SetModel(model);
	self.var_a6a5d843 thread function_80f8a4c9();
	function_d44bc8ab(self.var_a6a5d843);
}

/*
	Name: function_5ea9db6e
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF870
	Size: 0xB0
	Parameters: 1
	Flags: None
	Line Number: 4380
*/
function function_5ea9db6e(i)
{
	self s("Box Opening price set to ^5" + i);
	foreach(box in level.chests)
	{
		box.zombie_cost = i;
	}
}

/*
	Name: function_a03d5d13
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF928
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 4399
*/
function function_a03d5d13()
{
	self s("All Mystery Boxes ^5Spawned");
	foreach(box in level.chests)
	{
		box thread zm_magicbox::show_chest();
	}
}

/*
	Name: function_3a9a5040
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xF9E0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 4418
*/
function function_3a9a5040()
{
	self s("All Mystery Boxes ^5Hidden");
	foreach(box in level.chests)
	{
		box thread zm_magicbox::hide_chest(0);
	}
	return;
	~;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_18b0419a
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFA98
	Size: 0x30
	Parameters: 0
	Flags: None
	Line Number: 4440
*/
function function_18b0419a()
{
	self s("Unlimited Chest Rolls ^5Successful");
	level.chest_min_move_usage = 999;
}

/*
	Name: function_2be4a74c
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFAD0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 4456
*/
function function_2be4a74c()
{
	self s("All Players are ^5Revived");
	a = GetPlayers();
	for(i = 0; i <= a.size - 1; i++)
	{
		if(isdefined(a[i].reviveTrigger))
		{
			a[i] zm_laststand::auto_revive(level);
		}
	}
}

/*
	Name: function_3dd0f450
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFB80
	Size: 0x68
	Parameters: 0
	Flags: None
	Line Number: 4479
*/
function function_3dd0f450()
{
	if(!isdefined(self._retain_perks))
	{
		self s("Keep all Perks on death ^5ON");
		self._retain_perks = 1;
	}
	else
	{
		self._retain_perks = undefined;
		self s("Keep all Perks on death ^1OFF");
	}
}

/*
	Name: function_1dfbb763
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFBF0
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 4503
*/
function function_1dfbb763()
{
	if(!isdefined(self.gamevars["autoTeaBag"]))
	{
		self.gamevars["autoTeaBag"] = 1;
		self s("Auto T-Bag ^5ON");
		self thread function_16fb929f();
	}
	else
	{
		self.gamevars["autoTeaBag"] = undefined;
		self s("Auto T-Bag ^1OFF");
		self notify("hash_8b4bc6c1");
		return;
	}
	ERROR: Bad function call
}

/*
	Name: function_16fb929f
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFCA0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 4531
*/
function function_16fb929f()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("hash_8b4bc6c1");
	for(;;)
	{
		self SetStance("crouch");
		wait(0.2);
		self SetStance("stand");
		wait(0.2);
	}
}

/*
	Name: function_563131cb
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFD28
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 4556
*/
function function_563131cb()
{
	if(!isdefined(self.gamevars["func_ToggleIceSkater"]))
	{
		self.gamevars["func_ToggleIceSkater"] = 1;
		self thread function_c8a98ba3();
		self s("Spawn Ice Skater ^5ON");
	}
	else
	{
		self.gamevars["func_ToggleIceSkater"].model delete();
		self notify("hash_11c9160e");
		self.gamevars["func_ToggleIceSkater"] = undefined;
		self s("Spawn Ice Skater ^1OFF");
	}
}

/*
	Name: function_c8a98ba3
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0xFE08
	Size: 0x348
	Parameters: 0
	Flags: None
	Line Number: 4583
*/
function function_c8a98ba3()
{
	self endon("death");
	self endon("hash_11c9160e");
	self.gamevars["func_ToggleIceSkater"].model = spawn("script_model", self.origin);
	self.gamevars["func_ToggleIceSkater"].model SetModel("defaultactor");
	function_d44bc8ab(self.gamevars["func_ToggleIceSkater"].model);
	for(;;)
	{
		self.gamevars["func_ToggleIceSkater"].model RotateYaw(9000, 9);
		self.gamevars["func_ToggleIceSkater"].model MoveY(-180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveY(180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveX(-180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveX(180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveZ(90, 0.5);
		wait(0.5);
		self.gamevars["func_ToggleIceSkater"].model MoveZ(-90, 0.5);
		wait(0.5);
		self.gamevars["func_ToggleIceSkater"].model MoveY(180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveY(-180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveX(180, 1);
		wait(1);
		self.gamevars["func_ToggleIceSkater"].model MoveX(-180, 1);
		wait(1);
	}
	return;
	ERROR: Bad function call
}

/*
	Name: function_6efc40e8
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10158
	Size: 0xA8
	Parameters: 0
	Flags: None
	Line Number: 4628
*/
function function_6efc40e8()
{
	if(!isdefined(self.gamevars["gamevars"]))
	{
		self.gamevars["gamevars"] = 1;
		self s("Toogle Shoot Power Ups ^5ON");
		self thread function_72f04027();
	}
	else
	{
		self.gamevars["gamevars"] = undefined;
		self s("Toogle Shoot Power Ups ^1OFF");
		self notify("hash_50cc49ca");
	}
}

/*
	Name: function_72f04027
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10208
	Size: 0x88
	Parameters: 0
	Flags: None
	Line Number: 4654
*/
function function_72f04027()
{
	self endon("death");
	self endon("disconnect");
	self endon("death");
	self endon("hash_50cc49ca");
	for(;;)
	{
		self waittill("weapon_fired");
		level.zombie_vars["zombie_drop_item"] = 1;
		level.powerup_drop_count = 0;
		self thread zm_powerups::powerup_drop(self function_9d6054fe());
	}
}

/*
	Name: function_767af6a3
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10298
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 4679
*/
function function_767af6a3()
{
	if(GetDvarInt("bg_fallDamageMinHeight") == 9999)
	{
	}
	else
	{
	}
	IPrintLnBold("^1OFF" + "^2ON");
	if(GetDvarInt("bg_fallDamageMinHeight") != 9999)
	{
	}
	else
	{
	}
	SetDvar("bg_fallDamageMinHeight", 256);
	if(GetDvarInt("bg_fallDamageMaxHeight") != 9999)
	{
	}
	else
	{
	}
	SetDvar("bg_fallDamageMaxHeight", 512);
}

/*
	Name: grab_all_craftables
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10378
	Size: 0x138
	Parameters: 0
	Flags: None
	Line Number: 4714
*/
function grab_all_craftables()
{
	if(isdefined(level.all_parts_required))
	{
		return;
	}
	level.all_parts_required = 1;
	foreach(s_craftable in level.zombie_include_craftables)
	{
		foreach(s_piece in s_craftable.a_piecestubs)
		{
			if(isdefined(s_piece.pieceSpawn))
			{
				self zm_craftables::player_take_piece(s_piece.pieceSpawn);
			}
		}
	}
}

/*
	Name: bool
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x104B8
	Size: 0x30
	Parameters: 1
	Flags: None
	Line Number: 4743
*/
function bool(variable)
{
	return isdefined(variable) && Int(variable);
}

/*
	Name: function_a4e4af7a
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x104F0
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 4758
*/
function function_a4e4af7a()
{
	IPrintLnBold("All Doors ^2Open");
	zombie_doors = GetEntArray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		zombie_doors[i] notify("trigger", self, 1);
	}
	zombie_airlock_doors = GetEntArray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		zombie_airlock_doors[i] notify("trigger", self, 1);
	}
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		zombie_debris[i].zombie_cost = 0;
		zombie_debris[i] notify("trigger", self, 1);
	}
}

/*
	Name: function_b82ffd04
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10670
	Size: 0x178
	Parameters: 0
	Flags: None
	Line Number: 4789
*/
function function_b82ffd04()
{
	if(!isdefined(level.gamevars["hardcore"]))
	{
		level.gamevars["hardcore"] = 1;
		foreach(player in GetPlayers())
		{
			player setClientUIVisibilityFlag("hud_visible", 0);
		}
	}
	else
	{
		level.gamevars["hardcore"] = undefined;
		foreach(player in GetPlayers())
		{
			player setClientUIVisibilityFlag("hud_visible", 1);
		}
	}
}

/*
	Name: moon_doors_supported
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x107F0
	Size: 0x80
	Parameters: 0
	Flags: None
	Line Number: 4819
*/
function moon_doors_supported()
{
	Array = Array("zm_sumpf", "zm_asylum", "zm_factory", "zm_theater", "zm_cosmodrome");
	if(IsInArray(Array, GetDvarString("mapname")))
	{
		return 1;
	}
	return 0;
}

/*
	Name: setdoorsopen
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10878
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 4839
*/
function setdoorsopen()
{
	while(isdefined(self.door_is_moving) && self.door_is_moving)
	{
		wait(0.05);
	}
	self zm_blockers::door_opened(0);
}

/*
	Name: setdoorsclosed
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x108C0
	Size: 0x150
	Parameters: 1
	Flags: None
	Line Number: 4858
*/
function setdoorsclosed(bool)
{
	while(isdefined(self.door_is_moving) && self.door_is_moving)
	{
		wait(0.05);
	}
	self zm_blockers::door_opened(0);
	if(!isdefined(bool))
	{
		all_trigs = GetEntArray(self.target, "target");
		foreach(trig in all_trigs)
		{
			if(isdefined(self.zombie_cost))
			{
			}
			else
			{
			}
			cost = 1000;
			trig zm_utility::set_hint_string(trig, "default_buy_door", cost);
			trig TriggerEnable(1);
		}
	}
}

/*
	Name: openalldebris
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10A18
	Size: 0x100
	Parameters: 0
	Flags: None
	Line Number: 4893
*/
function openalldebris()
{
	if(isdefined(level.openalldebris))
	{
		return;
	}
	IPrintLnBold("All Debris ^2Cleared");
	level.openalldebris = 1;
	zombie_debris = GetEntArray("zombie_debris", "targetname");
	foreach(Debris in zombie_debris)
	{
		Debris.zombie_cost = 0;
		Debris notify("trigger", self, 1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b071352
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10B20
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 4921
*/
function function_b071352()
{
	s_scene = struct::get("top_dial");
	exploder::kill_exploder("teleporter_controller_red_light_1");
	exploder::exploder("teleporter_controller_light_1");
	s_scene thread scene::Play();
	s_scene = struct::get("middle_dial");
	exploder::kill_exploder("teleporter_controller_red_light_2");
	exploder::exploder("teleporter_controller_light_2");
	s_scene thread scene::Play();
	s_scene = struct::get("bottom_dial");
	exploder::kill_exploder("teleporter_controller_red_light_3");
	exploder::exploder("teleporter_controller_light_3");
	s_scene thread scene::Play();
	s("Extra Perk Easter Egg ^5Ready");
}

/*
	Name: function_ff5db71d
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10C88
	Size: 0xF0
	Parameters: 1
	Flags: None
	Line Number: 4948
*/
function function_ff5db71d(type)
{
	clock = GetEnt("factory_clock", "targetname");
	if(type == "play")
	{
		clock thread scene::Play("p7_fxanim_zm_factory_clock_bundle");
	}
	else if(type == "igc")
	{
		clock thread scene::Play("p7_fxanim_zm_factory_clock_igc_bundle");
	}
	else if(type == "stop")
	{
		clock thread scene::stop();
	}
	s(function_7bd93bc1() + " ^5Successful");
}

/*
	Name: function_bd31c1a9
	Namespace: namespace_ec4da956
	Checksum: 0x424F4353
	Offset: 0x10D80
	Size: 0x34
	Parameters: 0
	Flags: None
	Line Number: 4976
*/
function function_bd31c1a9()
{
	level.teleport_cost = 0;
	level.teleport_cooldown = 0;
	s("Teleporter is free now without any cooldown!");
}

