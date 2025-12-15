#include scripts\codescripts\struct;
#include scripts\core\_multi_extracam;
#include scripts\core\frontend_cam_override;
#include scripts\shared\_character_customization;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace LUI;

/*
	Name: __init__sytem__
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 21
*/
function autoexec __init__sytem__()
{
	system::register("lui_shared", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x2B8
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 36
*/
function __init__()
{
	level.client_menus = associativeArray();
	callback::on_localclient_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x300
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 52
*/
function on_player_connect(localClientNum)
{
	level thread client_menus(localClientNum);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: initMenuData
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x330
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 69
*/
function initMenuData(localClientNum)
{
	/#
		Assert(!isdefined(level.client_menus[localClientNum]));
	#/
	level.client_menus[localClientNum] = associativeArray();
}

/*
	Name: createExtraCamXCamData
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x390
	Size: 0x1A8
	Parameters: 7
	Flags: None
	Line Number: 87
*/
function createExtraCamXCamData(menu_name, localClientNum, extracam_index, target_name, xcam, sub_xcam, xcam_frame)
{
	/#
		Assert(isdefined(level.client_menus[localClientNum][menu_name]));
	#/
	menu_data = level.client_menus[localClientNum][menu_name];
	extracam_data = spawnstruct();
	extracam_data.extracam_index = extracam_index;
	extracam_data.target_name = target_name;
	extracam_data.xcam = xcam;
	extracam_data.sub_xcam = sub_xcam;
	extracam_data.xcam_frame = xcam_frame;
	if(!isdefined(menu_data.extra_cams))
	{
		menu_data.extra_cams = [];
	}
	else if(!IsArray(menu_data.extra_cams))
	{
		menu_data.extra_cams = Array(menu_data.extra_cams);
	}
	menu_data.extra_cams[menu_data.extra_cams.size] = extracam_data;
}

/*
	Name: createCustomExtraCamXCamData
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x540
	Size: 0x150
	Parameters: 4
	Flags: None
	Line Number: 120
*/
function createCustomExtraCamXCamData(menu_name, localClientNum, extracam_index, camera_function)
{
	/#
		Assert(isdefined(level.client_menus[localClientNum][menu_name]));
	#/
	menu_data = level.client_menus[localClientNum][menu_name];
	extracam_data = spawnstruct();
	extracam_data.extracam_index = extracam_index;
	extracam_data.camera_function = camera_function;
	if(!isdefined(menu_data.extra_cams))
	{
		menu_data.extra_cams = [];
	}
	else if(!IsArray(menu_data.extra_cams))
	{
		menu_data.extra_cams = Array(menu_data.extra_cams);
	}
	menu_data.extra_cams[menu_data.extra_cams.size] = extracam_data;
}

/*
	Name: addMenuExploders
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x698
	Size: 0x228
	Parameters: 3
	Flags: None
	Line Number: 150
*/
function addMenuExploders(menu_name, localClientNum, exploder)
{
	/#
		Assert(isdefined(level.client_menus[localClientNum][menu_name]));
	#/
	menu_data = level.client_menus[localClientNum][menu_name];
	if(IsArray(exploder))
	{
		foreach(expl in exploder)
		{
			if(!isdefined(menu_data.exploders))
			{
				menu_data.exploders = [];
			}
			else if(!IsArray(menu_data.exploders))
			{
				menu_data.exploders = Array(menu_data.exploders);
			}
			menu_data.exploders[menu_data.exploders.size] = expl;
		}
	}
	else if(!isdefined(menu_data.exploders))
	{
		menu_data.exploders = [];
	}
	else if(!IsArray(menu_data.exploders))
	{
		menu_data.exploders = Array(menu_data.exploders);
	}
	menu_data.exploders[menu_data.exploders.size] = exploder;
	return;
}

/*
	Name: linkToCustomCharacter
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x8C8
	Size: 0x158
	Parameters: 3
	Flags: None
	Line Number: 193
*/
function linkToCustomCharacter(menu_name, localClientNum, target_name)
{
	/#
		Assert(isdefined(level.client_menus[localClientNum][menu_name]));
	#/
	menu_data = level.client_menus[localClientNum][menu_name];
	/#
		Assert(!isdefined(menu_data.custom_character));
	#/
	model = GetEnt(localClientNum, target_name, "targetname");
	if(!isdefined(model))
	{
		model = util::spawn_model(localClientNum, "tag_origin");
		model.targetname = target_name;
	}
	model useanimtree(-1);
	menu_data.custom_character = character_customization::create_character_data_struct(model, localClientNum);
	model Hide();
}

/*
	Name: getCharacterDataForMenu
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0xA28
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 223
*/
function getCharacterDataForMenu(menu_name, localClientNum)
{
	if(isdefined(level.client_menus[localClientNum][menu_name]))
	{
		return level.client_menus[localClientNum][menu_name].custom_character;
	}
	return undefined;
}

/*
	Name: createCameraMenu
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0xA80
	Size: 0x168
	Parameters: 8
	Flags: None
	Line Number: 242
*/
function createCameraMenu(menu_name, localClientNum, target_name, xcam, sub_xcam, xcam_frame, custom_open_fn, custom_close_fn)
{
	if(!isdefined(xcam_frame))
	{
		xcam_frame = undefined;
	}
	if(!isdefined(custom_open_fn))
	{
		custom_open_fn = undefined;
	}
	if(!isdefined(custom_close_fn))
	{
		custom_close_fn = undefined;
	}
	/#
		Assert(!isdefined(level.client_menus[localClientNum][menu_name]));
	#/
	level.client_menus[localClientNum][menu_name] = spawnstruct();
	menu_data = level.client_menus[localClientNum][menu_name];
	menu_data.target_name = target_name;
	menu_data.xcam = xcam;
	menu_data.sub_xcam = sub_xcam;
	menu_data.xcam_frame = xcam_frame;
	menu_data.custom_open_fn = custom_open_fn;
	menu_data.custom_close_fn = custom_close_fn;
	return menu_data;
}

/*
	Name: createCustomCameraMenu
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0xBF0
	Size: 0x178
	Parameters: 6
	Flags: None
	Line Number: 280
*/
function createCustomCameraMenu(menu_name, localClientNum, camera_function, has_state, custom_open_fn, custom_close_fn)
{
	if(!isdefined(custom_open_fn))
	{
		custom_open_fn = undefined;
	}
	if(!isdefined(custom_close_fn))
	{
		custom_close_fn = undefined;
	}
	if(GetDvarString("mapname") == "core_frontend" && (menu_name == "Main" || menu_name == "Pregame_Main"))
	{
		camera_function = &namespace_17578f14::function_e61f2bcd;
	}
	/#
		Assert(!isdefined(level.client_menus[localClientNum][menu_name]));
	#/
	level.client_menus[localClientNum][menu_name] = spawnstruct();
	menu_data = level.client_menus[localClientNum][menu_name];
	menu_data.camera_function = camera_function;
	menu_data.has_state = has_state;
	menu_data.custom_open_fn = custom_open_fn;
	menu_data.custom_close_fn = custom_close_fn;
	return menu_data;
}

/*
	Name: setup_menu
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0xD70
	Size: 0x870
	Parameters: 3
	Flags: None
	Line Number: 316
*/
function setup_menu(localClientNum, menu_data, previous_menu)
{
	if(isdefined(previous_menu) && isdefined(level.client_menus[localClientNum][previous_menu.menu_name]))
	{
		previous_menu_info = level.client_menus[localClientNum][previous_menu.menu_name];
		if(isdefined(previous_menu_info.custom_close_fn))
		{
			if(IsArray(previous_menu_info.custom_close_fn))
			{
				foreach(fn in previous_menu_info.custom_close_fn)
				{
					[[fn]](localClientNum, previous_menu_info);
				}
			}
			else
			{
				[[previous_menu_info.custom_close_fn]](localClientNum, previous_menu_info);
			}
		}
		if(isdefined(previous_menu_info.extra_cams))
		{
			foreach(extracam_data in previous_menu_info.extra_cams)
			{
				multi_extracam::extracam_reset_index(localClientNum, extracam_data.extracam_index);
			}
		}
		level notify(previous_menu.menu_name + "_closed");
		if(isdefined(previous_menu_info.camera_function))
		{
			StopMainCamXCam(localClientNum);
		}
		else if(isdefined(previous_menu_info.xcam))
		{
			StopMainCamXCam(localClientNum);
		}
		if(isdefined(previous_menu_info.custom_character))
		{
			previous_menu_info.custom_character.characterModel Hide();
		}
		if(isdefined(previous_menu_info.exploders))
		{
			foreach(exploder in previous_menu_info.exploders)
			{
				KillRadiantExploder(localClientNum, exploder);
			}
		}
	}
	else if(isdefined(menu_data) && isdefined(level.client_menus[localClientNum][menu_data.menu_name]))
	{
		new_menu = level.client_menus[localClientNum][menu_data.menu_name];
		if(isdefined(new_menu.custom_character))
		{
			new_menu.custom_character.characterModel show();
		}
		if(isdefined(new_menu.exploders))
		{
			foreach(exploder in new_menu.exploders)
			{
				PlayRadiantExploder(localClientNum, exploder);
			}
		}
		else if(isdefined(new_menu.camera_function))
		{
			if(new_menu.has_state === 1)
			{
				level thread [[new_menu.camera_function]](localClientNum, menu_data.menu_name, menu_data.state);
			}
			else
			{
				level thread [[new_menu.camera_function]](localClientNum, menu_data.menu_name);
			}
		}
		else if(isdefined(new_menu.xcam))
		{
			camera_ent = struct::get(new_menu.target_name);
			if(isdefined(camera_ent))
			{
				PlayMainCamXCam(localClientNum, new_menu.xcam, 0, new_menu.sub_xcam, "", camera_ent.origin, camera_ent.angles);
			}
		}
		if(isdefined(new_menu.custom_open_fn))
		{
			if(IsArray(new_menu.custom_open_fn))
			{
				foreach(fn in new_menu.custom_open_fn)
				{
					[[fn]](localClientNum, new_menu);
				}
			}
			else
			{
				[[new_menu.custom_open_fn]](localClientNum, new_menu);
			}
		}
		if(isdefined(new_menu.extra_cams))
		{
			foreach(extracam_data in new_menu.extra_cams)
			{
				if(isdefined(extracam_data.camera_function))
				{
					if(new_menu.has_state === 1)
					{
						level thread [[extracam_data.camera_function]](localClientNum, menu_data.menu_name, extracam_data, menu_data.state);
					}
					else
					{
						level thread [[extracam_data.camera_function]](localClientNum, menu_data.menu_name, extracam_data);
						continue;
					}
				}
				camera_ent = multi_extracam::extracam_init_index(localClientNum, extracam_data.target_name, extracam_data.extracam_index);
				if(isdefined(camera_ent))
				{
					if(isdefined(extracam_data.xcam_frame))
					{
						camera_ent PlayExtraCamXCam(extracam_data.xcam, 0, extracam_data.sub_xcam, extracam_data.xcam_frame);
						continue;
					}
					camera_ent PlayExtraCamXCam(extracam_data.xcam, 0, extracam_data.sub_xcam);
				}
			}
		}
	}
}

/*
	Name: client_menus
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x15E8
	Size: 0x3F0
	Parameters: 1
	Flags: None
	Line Number: 451
*/
function client_menus(localClientNum)
{
	level endon("disconnect");
	clientMenuStack = Array();
	while(1)
	{
		level waittill("menu_change" + localClientNum, menu_name, status, state);
		menu_index = undefined;
		for(i = 0; i < clientMenuStack.size; i++)
		{
			if(clientMenuStack[i].menu_name == menu_name)
			{
				menu_index = i;
				break;
			}
		}
		if(status === "closeToMenu" && isdefined(menu_index))
		{
			topMenu = undefined;
			for(i = 0; i < menu_index; i++)
			{
				popped = Array::pop_front(clientMenuStack, 0);
				if(!isdefined(topMenu))
				{
					topMenu = popped;
				}
			}
			setup_menu(localClientNum, clientMenuStack[0], topMenu);
			continue;
		}
		stateChange = isdefined(menu_index) && status !== "closed" && clientMenuStack[menu_index].state !== state && (!(!isdefined(clientMenuStack[menu_index].state) && !isdefined(state)));
		updateOnly = stateChange && menu_index !== 0;
		if(updateOnly)
		{
			clientMenuStack[i].state = state;
		}
		else if(status === "closed" || stateChange && isdefined(menu_index))
		{
			popped = undefined;
			if(GetDvarInt("ui_execdemo_e3") == 1)
			{
				while(menu_index >= 0)
				{
					if(!isdefined(popped))
					{
						popped = Array::pop_front(clientMenuStack, 0);
					}
					menu_index--;
				}
			}
			else
			{
				Assert(menu_index == 0);
				popped = Array::pop_front(clientMenuStack, 0);
			}
			/#
			#/
			setup_menu(localClientNum, clientMenuStack[0], popped);
		}
		if(status === "opened" && (!isdefined(menu_index) || stateChange))
		{
			menu_data = spawnstruct();
			menu_data.menu_name = menu_name;
			menu_data.state = state;
			if(clientMenuStack.size > 0)
			{
			}
			else
			{
			}
			lastMenu = undefined;
			setup_menu(localClientNum, menu_data, lastMenu);
			Array::push_front(clientMenuStack, menu_data);
		}
	}
}

/*
	Name: screen_fade
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x19E0
	Size: 0x150
	Parameters: 5
	Flags: None
	Line Number: 538
*/
function screen_fade(n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu)
{
	if(!isdefined(n_target_alpha))
	{
		n_target_alpha = 1;
	}
	if(!isdefined(n_start_alpha))
	{
		n_start_alpha = 0;
	}
	if(!isdefined(str_color))
	{
		str_color = "black";
	}
	if(!isdefined(b_force_close_menu))
	{
		b_force_close_menu = 0;
	}
	if(self == level)
	{
		foreach(player in level.players)
		{
			player thread _screen_fade(n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu);
		}
	}
	else
	{
		self thread _screen_fade(n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu);
		return;
	}
}

/*
	Name: screen_fade_out
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x1B38
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 580
*/
function screen_fade_out(n_time, str_color)
{
	screen_fade(n_time, 1, 0, str_color, 0);
	wait(n_time);
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: screen_fade_in
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x1B80
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 599
*/
function screen_fade_in(n_time, str_color)
{
	screen_fade(n_time, 0, 1, str_color, 1);
	wait(n_time);
}

/*
	Name: screen_close_menu
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x1BD0
	Size: 0xB8
	Parameters: 0
	Flags: None
	Line Number: 615
*/
function screen_close_menu()
{
	if(self == level)
	{
		foreach(player in level.players)
		{
			player thread _screen_close_menu();
		}
	}
	else
	{
		self thread _screen_close_menu();
	}
}

/*
	Name: _screen_close_menu
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x1C90
	Size: 0xF0
	Parameters: 0
	Flags: Private
	Line Number: 640
*/
function private _screen_close_menu()
{
	self notify("_screen_fade");
	self endon("_screen_fade");
	self endon("disconnect");
	if(isdefined(self.screen_fade_menus))
	{
		str_menu = "FullScreenBlack";
		if(isdefined(self.screen_fade_menus[str_menu]))
		{
			CloseLUIMenu(self.localClientNum, self.screen_fade_menus[str_menu].lui_menu);
			self.screen_fade_menus[str_menu] = undefined;
		}
		str_menu = "FullScreenWhite";
		if(isdefined(self.screen_fade_menus[str_menu]))
		{
			CloseLUIMenu(self.localClientNum, self.screen_fade_menus[str_menu].lui_menu);
			self.screen_fade_menus[str_menu] = undefined;
		}
	}
}

/*
	Name: _screen_fade
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x1D88
	Size: 0x3D8
	Parameters: 5
	Flags: Private
	Line Number: 672
*/
function private _screen_fade(n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu)
{
	self notify("_screen_fade");
	self endon("_screen_fade");
	self endon("disconnect");
	self endon("entityshutdown");
	if(!isdefined(self.screen_fade_menus))
	{
		self.screen_fade_menus = [];
	}
	if(!isdefined(v_color))
	{
		v_color = (0, 0, 0);
	}
	n_time_ms = Int(n_time * 1000);
	str_menu = "FullScreenBlack";
	if(IsString(v_color))
	{
		switch(v_color)
		{
			case "black":
			{
				v_color = (0, 0, 0);
				break;
			}
			case "white":
			{
				v_color = (1, 1, 1);
				break;
			}
			default
			{
				/#
					ASSERTMSG("Dev Block strings are not supported");
				#/
			}
		}
	}
	lui_menu = "";
	if(isdefined(self.screen_fade_menus[str_menu]))
	{
		s_menu = self.screen_fade_menus[str_menu];
		lui_menu = s_menu.lui_menu;
		CloseLUIMenu(self.localClientNum, lui_menu);
		n_start_alpha = LerpFloat(s_menu.n_start_alpha, s_menu.n_target_alpha, GetTime() - s_menu.n_start_time);
	}
	lui_menu = CreateLUIMenu(self.localClientNum, str_menu);
	self.screen_fade_menus[str_menu] = spawnstruct();
	self.screen_fade_menus[str_menu].lui_menu = lui_menu;
	self.screen_fade_menus[str_menu].n_start_alpha = n_start_alpha;
	self.screen_fade_menus[str_menu].n_target_alpha = n_target_alpha;
	self.screen_fade_menus[str_menu].n_target_time = n_time_ms;
	self.screen_fade_menus[str_menu].n_start_time = GetTime();
	self set_color(lui_menu, v_color);
	SetLUIMenuData(self.localClientNum, lui_menu, "startAlpha", n_start_alpha);
	SetLUIMenuData(self.localClientNum, lui_menu, "endAlpha", n_target_alpha);
	SetLUIMenuData(self.localClientNum, lui_menu, "fadeOverTime", n_time_ms);
	OpenLUIMenu(self.localClientNum, lui_menu);
	wait(n_time);
	if(b_force_close_menu || n_target_alpha == 0)
	{
		CloseLUIMenu(self.localClientNum, self.screen_fade_menus[str_menu].lui_menu);
		self.screen_fade_menus[str_menu] = undefined;
	}
}

/*
	Name: set_color
	Namespace: LUI
	Checksum: 0x424F4353
	Offset: 0x2168
	Size: 0xA4
	Parameters: 2
	Flags: None
	Line Number: 748
*/
function set_color(menu, color)
{
	SetLUIMenuData(self.localClientNum, menu, "red", color[0]);
	SetLUIMenuData(self.localClientNum, menu, "green", color[1]);
	SetLUIMenuData(self.localClientNum, menu, "blue", color[2]);
}

