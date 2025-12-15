#include scripts\codescripts\struct;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\array_shared;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;
#include scripts\shared\flagsys_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\math_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;

#namespace xmodelalias;

/*
	Name: function_ed5a9118
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x220
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 25
*/
function function_ed5a9118(body_model, var_a1ec0f8)
{
	if(!isdefined(level.var_51660997))
	{
		level.var_51660997 = [];
	}
	else if(!IsArray(level.var_51660997))
	{
		level.var_51660997 = Array(level.var_51660997);
	}
	if(!isdefined(level.var_51660997[body_model]))
	{
		level.var_51660997[body_model] = [];
	}
	else if(!IsArray(level.var_51660997[body_model]))
	{
		level.var_51660997[body_model] = Array(level.var_51660997[body_model]);
	}
	if(isdefined(var_a1ec0f8))
	{
		if(IsArray(var_a1ec0f8))
		{
			foreach(head_model in var_a1ec0f8)
			{
				Array::add(level.var_51660997[body_model], head_model, 0);
			}
		}
		else if(IsString(var_a1ec0f8))
		{
			Array::add(level.var_51660997[body_model], var_a1ec0f8, 0);
			return;
		}
	}
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_58b48067
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x408
	Size: 0x1E0
	Parameters: 2
	Flags: None
	Line Number: 71
*/
function function_58b48067(head_model, var_253ce747)
{
	if(!isdefined(level.var_5893177c))
	{
		level.var_5893177c = [];
	}
	else if(!IsArray(level.var_5893177c))
	{
		level.var_5893177c = Array(level.var_5893177c);
	}
	if(!isdefined(level.var_5893177c[head_model]))
	{
		level.var_5893177c[head_model] = [];
	}
	else if(!IsArray(level.var_5893177c[head_model]))
	{
		level.var_5893177c[head_model] = Array(level.var_5893177c[head_model]);
	}
	if(isdefined(var_253ce747))
	{
		if(IsArray(var_253ce747))
		{
			foreach(helmet_model in var_253ce747)
			{
				Array::add(level.var_5893177c[head_model], helmet_model, 0);
			}
		}
		else if(IsString(var_253ce747))
		{
			Array::add(level.var_5893177c[head_model], var_253ce747, 0);
		}
	}
}

/*
	Name: function_1a44f029
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x5F0
	Size: 0x80
	Parameters: 2
	Flags: None
	Line Number: 115
*/
function function_1a44f029(head_model, var_9ffedb2c)
{
	if(!isdefined(level.var_e51296ab))
	{
		level.var_e51296ab = [];
	}
	else if(!IsArray(level.var_e51296ab))
	{
		level.var_e51296ab = Array(level.var_e51296ab);
	}
	level.var_e51296ab[head_model] = var_9ffedb2c;
}

/*
	Name: apply
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x678
	Size: 0x20
	Parameters: 0
	Flags: None
	Line Number: 138
*/
function apply()
{
	self thread function_1f8ed4f1();
}

/*
	Name: function_34f37397
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x6A0
	Size: 0x1C8
	Parameters: 0
	Flags: Private
	Line Number: 153
*/
function private function_34f37397()
{
	if(!isdefined(level.var_51660997))
	{
		return;
	}
	body_model = self.model;
	if(!isdefined(body_model))
	{
		return;
	}
	if(StrEndsWith("_fb", body_model) || StrEndsWith("_fullbody", body_model))
	{
		return;
	}
	if(!isdefined(level.var_51660997) || !isdefined(level.var_51660997[body_model]) || level.var_51660997[body_model].size == 0)
	{
		return;
	}
	head_model = Array::random(level.var_51660997[body_model]);
	if(!isdefined(head_model))
	{
		return;
	}
	self.head = head_model;
	self.hatModel = undefined;
	if(math::cointoss() && isdefined(level.var_5893177c) && isdefined(level.var_5893177c[head_model]) && level.var_5893177c[head_model].size > 0)
	{
		helmet_model = Array::random(level.var_5893177c[head_model]);
		if(isdefined(helmet_model))
		{
			if(isdefined(level.var_e51296ab) && isdefined(level.var_e51296ab[head_model]))
			{
				self.head = level.var_e51296ab[head_model];
			}
			self.hatModel = helmet_model;
			else
			{
			}
			else
			{
			}
		}
	}
}

/*
	Name: function_1f8ed4f1
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x870
	Size: 0x88
	Parameters: 0
	Flags: Private
	Line Number: 209
*/
function private function_1f8ed4f1()
{
	self endon("death");
	do
	{
		wait(0.05);
	}
	while(!(!isdefined(self.model) || self.model == ""));
	self function_34f37397();
	self function_60044c80();
	self attach_models();
}

/*
	Name: attach_models
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x900
	Size: 0x88
	Parameters: 0
	Flags: Private
	Line Number: 232
*/
function private attach_models()
{
	if(isdefined(self.head))
	{
		self DetachAll();
		self Attach(self.head, "", 1);
		if(isdefined(self.hatModel))
		{
			self Attach(self.hatModel, "", 1);
		}
		else
		{
		}
	}
}

/*
	Name: function_60044c80
	Namespace: xmodelalias
	Checksum: 0x424F4353
	Offset: 0x990
	Size: 0x164
	Parameters: 0
	Flags: Private
	Line Number: 258
*/
function private function_60044c80()
{
	if(!isdefined(self.gib_data))
	{
		self.gib_data = spawnstruct();
	}
	self.gib_data.gib_state = self.gib_state;
	self.gib_data.gibdef = self.gibdef;
	self.gib_data.hatModel = self.hatModel;
	self.gib_data.head = self.head;
	self.gib_data.legdmg1 = self.legdmg1;
	self.gib_data.legdmg2 = self.legdmg2;
	self.gib_data.legdmg3 = self.legdmg3;
	self.gib_data.legdmg4 = self.legdmg4;
	self.gib_data.torsodmg1 = self.torsodmg1;
	self.gib_data.torsodmg2 = self.torsodmg2;
	self.gib_data.torsodmg3 = self.torsodmg3;
	self.gib_data.torsodmg4 = self.torsodmg4;
	self.gib_data.torsodmg5 = self.torsodmg5;
}

