#include scripts\shared\array_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\util_shared;
#include scripts\zm\_zm_audio;

#namespace charIndex;

/*
	Name: init
	Namespace: charIndex
	Checksum: 0x424F4353
	Offset: 0x228
	Size: 0x18
	Parameters: 0
	Flags: None
	Line Number: 17
*/
function init()
{
	thread function_e67ba2a2();
}

/*
	Name: function_e67ba2a2
	Namespace: charIndex
	Checksum: 0x424F4353
	Offset: 0x248
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function function_e67ba2a2()
{
	wait(0.5);
	level.giveCustomCharacters = &function_d02c3cd2;
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_1ba3fe09
	Namespace: charIndex
	Checksum: 0x424F4353
	Offset: 0x278
	Size: 0x358
	Parameters: 1
	Flags: None
	Line Number: 50
*/
function function_1ba3fe09(index)
{
	switch(level.script)
	{
		case "zm_zod":
		{
			if(index <= 4)
			{
				index = index + 5;
			}
			self setcharacterbodytype(index);
			break;
		}
		case "zm_factory":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_castle":
		{
			if(index == 7)
			{
				index = 8;
			}
			index = index - 5;
			self setcharacterbodytype(index);
			break;
		}
		case "zm_stalingrad":
		{
			index = index - 5;
			self setcharacterbodytype(index);
			break;
		}
		case "zm_genesis":
		{
			index = index - 5;
			self setcharacterbodytype(index);
			break;
		}
		case "zm_prototype":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_asylum":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_sumpf":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_sumpf":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_theater":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_temple":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_cosmodrome":
		{
			self setcharacterbodytype(index);
			break;
		}
		case "zm_moon":
		{
			if(index == 7)
			{
				index = 8;
			}
			index = index - 5;
			self setcharacterbodytype(index);
			break;
		}
		case "zm_tomb":
		{
			index = index - 5;
			self setcharacterbodytype(index);
			break;
		}
		default
		{
			if(index == 7)
			{
				index = 8;
			}
			index = index - 5;
			self setcharacterbodytype(index, function_2757d595(index));
			break;
		}
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2757d595
	Namespace: charIndex
	Checksum: 0x424F4353
	Offset: 0x5D8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function function_2757d595(var_eb4e6d3f)
{
	if(level.script == "zm_escape_room")
	{
		return var_eb4e6d3f;
	}
	return 0;
}

/*
	Name: function_d02c3cd2
	Namespace: charIndex
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0x9A8
	Parameters: 0
	Flags: None
	Line Number: 185
*/
function function_d02c3cd2()
{
	self DetachAll();
	if(self GetEntityNumber() == 8)
	{
		self.characterindex = 1;
		self setcharacterbodytype(1, function_2757d595(1));
		self setMoveSpeedScale(1);
		self SetSprintDuration(4);
		self SetSprintCooldown(0);
		self setcharacterbodystyle(0);
		self setcharacterhelmetstyle(0);
		self thread set_exert_id();
		return;
	}
	if(self GetEntityNumber() == 9)
	{
		self.characterindex = 0;
		self setcharacterbodytype(0, function_2757d595(0));
		self setMoveSpeedScale(1);
		self SetSprintDuration(4);
		self SetSprintCooldown(0);
		self setcharacterbodystyle(0);
		self setcharacterhelmetstyle(0);
		self thread set_exert_id();
		return;
	}
	if(isdefined(self.var_c57b913e) && isdefined(self.characterindex))
	{
		if(self GetEntityNumber() <= 3)
		{
			if(level.script == "zm_zod")
			{
				self function_1ba3fe09(self.var_c57b913e);
			}
			else
			{
				self setcharacterbodytype(self.var_c57b913e, function_2757d595(self.var_c57b913e));
			}
		}
		else
		{
			self function_1ba3fe09(self.var_c57b913e);
		}
		self setMoveSpeedScale(1);
		self SetSprintDuration(4);
		self SetSprintCooldown(0);
		self setcharacterbodystyle(0);
		self setcharacterhelmetstyle(0);
		self thread set_exert_id();
	}
	else
	{
		level.has_richtofen = 1;
		charindexarray = [];
		if(self GetEntityNumber() <= 3)
		{
			charindexarray[0] = 0;
			charindexarray[1] = 1;
			charindexarray[2] = 2;
			charindexarray[3] = 3;
		}
		else
		{
			charindexarray[0] = 5;
			charindexarray[1] = 6;
			charindexarray[2] = 7;
			charindexarray[3] = 8;
		}
		charindexarray = Array::randomize(charindexarray);
		foreach(player in GetPlayers())
		{
			if(isdefined(player.var_c57b913e) && IsInArray(charindexarray, player.var_c57b913e))
			{
				ArrayRemoveValue(charindexarray, player.var_c57b913e, 0);
			}
		}
		if(charindexarray.size > 0)
		{
			index = charindexarray[0];
			self.var_c57b913e = index;
			if(self GetEntityNumber() <= 3)
			{
				if(level.script == "zm_zod")
				{
					self function_1ba3fe09(index);
				}
				else
				{
					self setcharacterbodytype(index, function_2757d595(index));
				}
			}
			else
			{
				self function_1ba3fe09(index);
			}
			if(index >= 5)
			{
				index = index - 5;
			}
			self.characterindex = index;
		}
		if(!isdefined(self.characterindex))
		{
			self.characterindex = 3;
			self.var_c57b913e = 3;
			self setcharacterbodytype(3 function_2757d595(3));
		}
		self.favorite_wall_weapons_list = [];
		self.talks_in_danger = 0;
		self setcharacterbodystyle(0);
		self setcharacterhelmetstyle(0);
		switch(self.characterindex)
		{
			case 0:
			{
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("frag_grenade");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("lmg_mg08");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("pistol_standard_upgraded");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("pistol_standard_upgraded");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("bouncingbetty");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("lmg_cqb");
				break;
			}
			case 1:
			{
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("ar_standard");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("smg_ppsh");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("shotgun_pump");
				break;
			}
			case 2:
			{
				self.talks_in_danger = 1;
				level.rich_sq_player = self;
				level.sndRadioA = self;
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("smg_mp40_1940");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("smg_mp40");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("pistol_standard");
				break;
			}
			case 3:
			{
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("ar_accurate");
				self.favorite_wall_weapons_list[self.favorite_wall_weapons_list.size] = GetWeapon("melee_katana");
				break;
			}
		}
		self setMoveSpeedScale(1);
		self SetSprintDuration(4);
		self SetSprintCooldown(0);
		self thread set_exert_id();
		return;
	}
}

/*
	Name: set_exert_id
	Namespace: charIndex
	Checksum: 0x424F4353
	Offset: 0xFB8
	Size: 0x5C
	Parameters: 0
	Flags: None
	Line Number: 351
*/
function set_exert_id()
{
	self endon("disconnect");
	self endon("death");
	util::wait_network_frame();
	util::wait_network_frame();
	self zm_audio::SetExertVoice(self.characterindex + 1);
}

