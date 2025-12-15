#namespace namespace_11e193f1;

/*
	Name: function_89cedfa0
	Namespace: namespace_11e193f1
	Checksum: 0xCB9B0F29
	Offset: 0x88
	Size: 0x170
	Parameters: 2
	Flags: None
	Line Number: 12
*/
function function_89cedfa0(index, value)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(index) || !isdefined(value))
	{
		return;
	}
	if(index == 9 || index == 5)
	{
		if(!isdefined(self.var_70a24c4d) || !self.var_70a24c4d)
		{
			return;
		}
	}
	index = index * 2;
	index = index + 50;
	if(index < 0 || index > 330)
	{
		return;
	}
	if(value < 0)
	{
		return;
	}
	remainder = value % 255;
	multiples = Int(floor(value / 255));
	self LUINotifyEvent(&"setSaveData", 2, index, multiples);
	self LUINotifyEvent(&"setSaveData", 2, index + 1, remainder);
	return;
}

/*
	Name: function_466e3f3e
	Namespace: namespace_11e193f1
	Checksum: 0x3BCE2BFE
	Offset: 0x200
	Size: 0xE8
	Parameters: 1
	Flags: None
	Line Number: 56
*/
function function_466e3f3e(index)
{
	self LUINotifyEvent(&"getSaveData", 1, index);
	while(1)
	{
		self waittill("menuresponse", menu, response);
		if(Int(GetSubStr(response, 0, index + "".size)) == index)
		{
			return Int(GetSubStr(response, index + "".size + 1));
		}
	}
}

/*
	Name: function_69424d4c
	Namespace: namespace_11e193f1
	Checksum: 0xA726F478
	Offset: 0x2F0
	Size: 0x1A0
	Parameters: 1
	Flags: None
	Line Number: 79
*/
function function_69424d4c(index)
{
	if(index != 300)
	{
		index = index * 2;
		index = index + 50;
		if(!isdefined(self))
		{
			return;
		}
		if(!isdefined(index))
		{
			return;
		}
		if(index < 0 || index > 330)
		{
			return;
		}
		m = function_466e3f3e(index);
		remainder = function_466e3f3e(index + 1);
		result = 255 * m + remainder;
		return result;
	}
	else
	{
		index = index * 2;
		index = index + 50;
		var_70c091a8 = function_466e3f3e(index);
		var_5fb0bce = function_466e3f3e(index + 1);
		r = function_466e3f3e(index + 2);
		result = 65025 * var_70c091a8 + 255 * var_5fb0bce + r;
		return result;
	}
}

/*
	Name: function_6425b622
	Namespace: namespace_11e193f1
	Checksum: 0x8CFB0161
	Offset: 0x498
	Size: 0xE2
	Parameters: 1
	Flags: None
	Line Number: 124
*/
function function_6425b622(index)
{
	if(index != 300)
	{
		index = index * 2;
		index = index + 50;
		if(!isdefined(self))
		{
			return;
		}
		if(!isdefined(index))
		{
			return;
		}
		if(index < 0 || index > 330)
		{
			return;
		}
		m = function_466e3f3e(index);
		remainder = function_466e3f3e(index + 1);
		result = 255 * m + remainder;
		return result / 100;
	}
}

