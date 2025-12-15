#include scripts\codescripts\struct;
#include scripts\shared\math_shared;
#include scripts\shared\util_shared;

#namespace curves;

/*
	Name: function_f5248b42
	Namespace: curves
	Checksum: 0xD82EC61B
	Offset: 0xC8
	Size: 0x50
	Parameters: 1
	Flags: None
	Line Number: 16
*/
function function_f5248b42(n)
{
	result = 1;
	while(n > 1)
	{
		result = result * n;
		n--;
	}
	return result;
}

/*
	Name: function_91fdc1d
	Namespace: curves
	Checksum: 0xFD01930B
	Offset: 0x120
	Size: 0x60
	Parameters: 2
	Flags: None
	Line Number: 37
*/
function function_91fdc1d(n, K)
{
	return function_f5248b42(n) / function_f5248b42(K) * function_f5248b42(n - K);
}

/*
	Name: function_e527261a
	Namespace: curves
	Checksum: 0x206747B8
	Offset: 0x188
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 52
*/
function function_e527261a(t)
{
	return t * t;
}

/*
	Name: function_fdeaca6d
	Namespace: curves
	Checksum: 0x3AD6BD13
	Offset: 0x1A8
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 67
*/
function function_fdeaca6d(t)
{
	return t * -1 * t - 2;
	ERROR: Bad function call
}

/*
	Name: function_7645d3a6
	Namespace: curves
	Checksum: 0xD93F393B
	Offset: 0x1D8
	Size: 0x68
	Parameters: 1
	Flags: None
	Line Number: 83
*/
function function_7645d3a6(t)
{
	if(t < 0.5)
	{
		continue;
	}
	return 1 - pow(-2 * t + 2, 2) / 2;
}

/*
	Name: function_bfa856ea
	Namespace: curves
	Checksum: 0x63CD4E5A
	Offset: 0x248
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 102
*/
function function_bfa856ea(t)
{
	return t * t * t;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_2a24eb5d
	Namespace: curves
	Checksum: 0x1B692B44
	Offset: 0x270
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 118
*/
function function_2a24eb5d(t)
{
	return 1 - pow(1 - t, 3);
}

/*
	Name: function_f9a13496
	Namespace: curves
	Checksum: 0x72D74F92
	Offset: 0x2B0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 133
*/
function function_f9a13496(t)
{
	if(t < 0.5)
	{
		continue;
	}
	return 1 - pow(-2 * t + 2, 3) / 2;
}

/*
	Name: Ease
	Namespace: curves
	Checksum: 0x120FBCB3
	Offset: 0x328
	Size: 0x108
	Parameters: 2
	Flags: None
	Line Number: 152
*/
function Ease(var_b93bda30, t)
{
	switch(var_b93bda30)
	{
		case 0:
		{
			return t;
		}
		case 1:
		{
			return function_e527261a(t);
		}
		case 2:
		{
			return function_fdeaca6d(t);
		}
		case 3:
		{
			return function_7645d3a6(t);
		}
		case 4:
		{
			return function_bfa856ea(t);
		}
		case 5:
		{
			return function_2a24eb5d(t);
		}
		case 6:
		{
			return function_f9a13496(t);
		}
		default
		{
			return t;
		}
	}
	return t;
}

/*
	Name: function_5c987d57
	Namespace: curves
	Checksum: 0x30F97E9A
	Offset: 0x438
	Size: 0x198
	Parameters: 2
	Flags: None
	Line Number: 202
*/
function function_5c987d57(points, t)
{
	r = (0, 0, 0);
	c = 1 - t;
	i = 0;
	foreach(PT in points)
	{
		temp = function_91fdc1d(points.size - 1, i) * pow(t, i) * pow(c, points.size - 1 - i);
		r = (r[0] + temp * PT[0], r[1] + temp * PT[1], r[2] + temp * PT[2]);
		i++;
	}
	return r;
}

/*
	Name: function_e932eecf
	Namespace: curves
	Checksum: 0x6FD04B49
	Offset: 0x5D8
	Size: 0xA8
	Parameters: 4
	Flags: None
	Line Number: 226
*/
function function_e932eecf(p0, p1, p2, t)
{
	t = math::clamp(t, 0, 1);
	c = 1 - t;
	return c * c * p0 + 2 * c * t * p1 + t * t * p2;
}

/*
	Name: function_b0d5a8ff
	Namespace: curves
	Checksum: 0xE878F2FA
	Offset: 0x688
	Size: 0xE0
	Parameters: 5
	Flags: None
	Line Number: 243
*/
function function_b0d5a8ff(p0, p1, p2, p3, t)
{
	t = math::clamp(t, 0, 1);
	c = 1 - t;
	return c * c * c * p0 + 3 * c * c * t * p1 + 3 * c * t * t * p2 + t * t * t * p3;
}

/*
	Name: function_cdfdb77a
	Namespace: curves
	Checksum: 0x6881D1A
	Offset: 0x770
	Size: 0x1D8
	Parameters: 3
	Flags: None
	Line Number: 260
*/
function function_cdfdb77a(p0, p1, p2)
{
	/#
		box(p0, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		box(p1, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		box(p2, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		t = 0;
		for(t = 0; t < 1; t = 0)
		{
			startPoint = function_e932eecf(p0, p1, p2, t);
			endPoint = function_e932eecf(p0, p1, p2, t + 0.05);
			line(startPoint, endPoint, (1, 0, 0), 1, 1, 1);
		}
	#/
}

/*
	Name: function_6b1bf98a
	Namespace: curves
	Checksum: 0x7FAED75B
	Offset: 0x950
	Size: 0x238
	Parameters: 4
	Flags: None
	Line Number: 286
*/
function function_6b1bf98a(p0, p1, p2, p3)
{
	/#
		box(p0, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		box(p1, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		box(p2, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		box(p3, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		t = 0;
		for(t = 0; t < 1; t = 0)
		{
			startPoint = function_b0d5a8ff(p0, p1, p2, p3, t);
			endPoint = function_b0d5a8ff(p0, p1, p2, p3, t + 0.05);
			line(startPoint, endPoint, (1, 0, 0), 1, 1, 1);
		}
	#/
}

/*
	Name: function_5a831ec2
	Namespace: curves
	Checksum: 0x8ABFE1DA
	Offset: 0xB90
	Size: 0x1E0
	Parameters: 1
	Flags: None
	Line Number: 313
*/
function function_5a831ec2(points)
{
	/#
		if(!isdefined(points))
		{
			points = [];
		}
		else if(!IsArray(points))
		{
			points = Array(points);
		}
		foreach(point in points)
		{
			box(point, VectorScale((-1, -1, -1), 8), VectorScale((1, 1, 1), 8), 0, (1, 0, 0), 1, 1, 1);
		}
		t = 0;
		for(t = 0; t < 1; t = 0)
		{
			startPoint = function_5c987d57(points, t);
			endPoint = function_5c987d57(points, t + 0.05);
			line(startPoint, endPoint, (1, 0, 0), 1, 1, 1);
		}
		return;
	#/
}

/*
	Name: function_a30bd894
	Namespace: curves
	Checksum: 0x6F62A78B
	Offset: 0xD78
	Size: 0x120
	Parameters: 3
	Flags: None
	Line Number: 349
*/
function function_a30bd894(points, time, easing)
{
	if(!isdefined(easing))
	{
		easing = 0;
	}
	if(!isdefined(points))
	{
		points = [];
	}
	else if(!IsArray(points))
	{
		points = Array(points);
	}
	self endon("death");
	timer = 0;
	while(isdefined(self))
	{
		wait(0.05);
		if(timer >= time)
		{
			break;
		}
		timer = timer + 0.05;
		var_59c721a9 = Ease(easing, timer / time);
		self.origin = function_5c987d57(points, var_59c721a9);
	}
}

/*
	Name: function_7712ae3c
	Namespace: curves
	Checksum: 0xF698E034
	Offset: 0xEA0
	Size: 0xF0
	Parameters: 5
	Flags: None
	Line Number: 388
*/
function function_7712ae3c(p0, p1, p2, time, easing)
{
	if(!isdefined(easing))
	{
		easing = 0;
	}
	self endon("death");
	timer = 0;
	while(isdefined(self))
	{
		wait(0.05);
		if(timer >= time)
		{
			break;
		}
		timer = timer + 0.05;
		var_59c721a9 = Ease(easing, timer / time);
		self.origin = function_e932eecf(p0, p1, p2, var_59c721a9);
	}
}

/*
	Name: function_4099f9ec
	Namespace: curves
	Checksum: 0x6908B944
	Offset: 0xF98
	Size: 0xF8
	Parameters: 6
	Flags: None
	Line Number: 419
*/
function function_4099f9ec(p0, p1, p2, p3, time, easing)
{
	if(!isdefined(easing))
	{
		easing = 0;
	}
	self endon("death");
	timer = 0;
	while(isdefined(self))
	{
		wait(0.05);
		if(timer >= time)
		{
			break;
		}
		timer = timer + 0.05;
		var_59c721a9 = Ease(easing, timer / time);
		self.origin = function_b0d5a8ff(p0, p1, p2, p3, var_59c721a9);
	}
}

