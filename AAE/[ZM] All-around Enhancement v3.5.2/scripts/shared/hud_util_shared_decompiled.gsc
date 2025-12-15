#include scripts\codescripts\struct;
#include scripts\shared\lui_shared;
#include scripts\shared\util_shared;

#namespace hud;

/*
	Name: setParent
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x370
	Size: 0xE0
	Parameters: 1
	Flags: None
	Line Number: 16
*/
function setParent(element)
{
	if(isdefined(self.parent) && self.parent == element)
	{
		return;
	}
	if(isdefined(self.parent))
	{
		self.parent removeChild(self);
	}
	self.parent = element;
	self.parent addChild(self);
	if(isdefined(self.point))
	{
		self setPoint(self.point, self.relativePoint, self.xOffset, self.yOffset);
	}
	else
	{
		self setPoint("TOP");
	}
}

/*
	Name: getParent
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x458
	Size: 0x10
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function getParent()
{
	return self.parent;
}

/*
	Name: addChild
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x470
	Size: 0x40
	Parameters: 1
	Flags: None
	Line Number: 63
*/
function addChild(element)
{
	element.index = self.children.size;
	self.children[self.children.size] = element;
}

/*
	Name: removeChild
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x4B8
	Size: 0xC8
	Parameters: 1
	Flags: None
	Line Number: 79
*/
function removeChild(element)
{
	element.parent = undefined;
	if(self.children[self.children.size - 1] != element)
	{
		self.children[element.index] = self.children[self.children.size - 1];
		self.children[element.index].index = element.index;
	}
	self.children[self.children.size - 1] = undefined;
	element.index = undefined;
}

/*
	Name: setPoint
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x588
	Size: 0x950
	Parameters: 5
	Flags: None
	Line Number: 101
*/
function setPoint(point, relativePoint, xOffset, yOffset, moveTime)
{
	if(!isdefined(moveTime))
	{
		moveTime = 0;
	}
	if(isdefined(self.var_e2d1ba98) && isdefined(yOffset))
	{
		if(level.script == "zm_moon" && yOffset != 165)
		{
			yOffset = 80;
		}
		if(yOffset < 0)
		{
			self.var_e2d1ba98 SetLUIMenuData(self.menu, "x", 1);
		}
		else
		{
			self.var_e2d1ba98 SetLUIMenuData(self.menu, "x", 0);
		}
		yOffset = Abs(yOffset) / 240;
		if(yOffset > 1)
		{
			yOffset = 1;
		}
		self.var_e2d1ba98 SetLUIMenuData(self.menu, "y", yOffset);
		return;
	}
	element = self getParent();
	if(moveTime)
	{
		self MoveOverTime(moveTime);
	}
	if(!isdefined(xOffset))
	{
		xOffset = 0;
	}
	self.xOffset = xOffset;
	if(!isdefined(yOffset))
	{
		yOffset = 0;
	}
	self.yOffset = yOffset;
	self.point = point;
	self.alignX = "center";
	self.alignY = "middle";
	switch(point)
	{
		case "CENTER":
		{
			break;
		}
		case "TOP":
		{
			self.alignY = "top";
			break;
		}
		case "BOTTOM":
		{
			self.alignY = "bottom";
			break;
		}
		case "LEFT":
		{
			self.alignX = "left";
			break;
		}
		case "RIGHT":
		{
			self.alignX = "right";
			break;
		}
		case "TOPRIGHT":
		case "TOP_RIGHT":
		{
			self.alignY = "top";
			self.alignX = "right";
			break;
		}
		case "TOPLEFT":
		case "TOP_LEFT":
		{
			self.alignY = "top";
			self.alignX = "left";
			break;
		}
		case "TOPCENTER":
		{
			self.alignY = "top";
			self.alignX = "center";
			break;
		}
		case "BOTTOM RIGHT":
		case "BOTTOM_RIGHT":
		{
			self.alignY = "bottom";
			self.alignX = "right";
			break;
		}
		case "BOTTOM LEFT":
		case "BOTTOM_LEFT":
		{
			self.alignY = "bottom";
			self.alignX = "left";
			break;
		}
		default
		{
			/#
				println("Dev Block strings are not supported" + point);
				break;
			#/
		}
	}
	if(!isdefined(relativePoint))
	{
		relativePoint = point;
	}
	self.relativePoint = relativePoint;
	relativeX = "center";
	relativeY = "middle";
	switch(relativePoint)
	{
		case "CENTER":
		{
			break;
		}
		case "TOP":
		{
			relativeY = "top";
			break;
		}
		case "BOTTOM":
		{
			relativeY = "bottom";
			break;
		}
		case "LEFT":
		{
			relativeX = "left";
			break;
		}
		case "RIGHT":
		{
			relativeX = "right";
			break;
		}
		case "TOPRIGHT":
		case "TOP_RIGHT":
		{
			relativeY = "top";
			relativeX = "right";
			break;
		}
		case "TOPLEFT":
		case "TOP_LEFT":
		{
			relativeY = "top";
			relativeX = "left";
			break;
		}
		case "TOPCENTER":
		{
			relativeY = "top";
			relativeX = "center";
			break;
		}
		case "BOTTOM RIGHT":
		case "BOTTOM_RIGHT":
		{
			relativeY = "bottom";
			relativeX = "right";
			break;
		}
		case "BOTTOM LEFT":
		case "BOTTOM_LEFT":
		{
			relativeY = "bottom";
			relativeX = "left";
			break;
		}
		default
		{
			/#
				println("Dev Block strings are not supported" + relativePoint);
				break;
			#/
		}
	}
	if(element == level.uiParent)
	{
		self.horzAlign = relativeX;
		self.vertAlign = relativeY;
	}
	else
	{
		self.horzAlign = element.horzAlign;
		self.vertAlign = element.vertAlign;
	}
	if(relativeX == element.alignX)
	{
		offsetx = 0;
		xFactor = 0;
	}
	else if(relativeX == "center" || element.alignX == "center")
	{
		offsetx = Int(element.width / 2);
		if(relativeX == "left" || element.alignX == "right")
		{
			xFactor = -1;
		}
		else
		{
			xFactor = 1;
		}
	}
	else
	{
		offsetx = element.width;
		if(relativeX == "left")
		{
			xFactor = -1;
		}
		else
		{
			xFactor = 1;
		}
	}
	self.x = element.x + offsetx * xFactor;
	if(relativeY == element.alignY)
	{
		offsety = 0;
		yFactor = 0;
	}
	else if(relativeY == "middle" || element.alignY == "middle")
	{
		offsety = Int(element.height / 2);
		if(relativeY == "top" || element.alignY == "bottom")
		{
			yFactor = -1;
		}
		else
		{
			yFactor = 1;
		}
	}
	else
	{
		offsety = element.height;
		if(relativeY == "top")
		{
			yFactor = -1;
		}
		else
		{
			yFactor = 1;
		}
	}
	self.y = element.y + offsety * yFactor;
	self.x = self.x + self.xOffset;
	self.y = self.y + self.yOffset;
	switch(self.elemType)
	{
		case "bar":
		{
			setPointBar(point, relativePoint, xOffset, yOffset);
			self.barFrame setParent(self getParent());
			self.barFrame setPoint(point, relativePoint, xOffset, yOffset);
			break;
		}
	}
	self updateChildren();
}

/*
	Name: setPointBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0xEE0
	Size: 0x1C0
	Parameters: 4
	Flags: None
	Line Number: 385
*/
function setPointBar(point, relativePoint, xOffset, yOffset)
{
	self.bar.horzAlign = self.horzAlign;
	self.bar.vertAlign = self.vertAlign;
	self.bar.alignX = "left";
	self.bar.alignY = self.alignY;
	self.bar.y = self.y;
	if(self.alignX == "left")
	{
		self.bar.x = self.x;
	}
	else if(self.alignX == "right")
	{
		self.bar.x = self.x - self.width;
	}
	else
	{
		self.bar.x = self.x - Int(self.width / 2);
	}
	if(self.alignY == "top")
	{
		self.bar.y = self.y;
	}
	else if(self.alignY == "bottom")
	{
		self.bar.y = self.y;
	}
	self updateBar(self.bar.frac);
}

/*
	Name: updateBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x10A8
	Size: 0x58
	Parameters: 2
	Flags: None
	Line Number: 425
*/
function updateBar(barFrac, rateOfChange)
{
	if(isdefined(self.var_e2d1ba98) || self.elemType == "bar")
	{
		self updateBarScale(barFrac, rateOfChange);
	}
}

/*
	Name: function_319e316
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1108
	Size: 0x1B0
	Parameters: 1
	Flags: None
	Line Number: 443
*/
function function_319e316(value)
{
	if(value < 0)
	{
		value = 0;
	}
	if(value > 999.9)
	{
		value = 999.9;
	}
	var_4e2650de = [];
	var_2b4b4e16 = Int(value * 10);
	for(i = 0; i < 4; i++)
	{
		var_4e2650de[i] = var_2b4b4e16 % 10 / 10;
		var_2b4b4e16 = Int(var_2b4b4e16 / 10);
	}
	self.var_e2d1ba98 SetLUIMenuData(self.menu, "fadeOverTime", var_4e2650de[0]);
	self.var_e2d1ba98 SetLUIMenuData(self.menu, "time", var_4e2650de[1]);
	self.var_e2d1ba98 SetLUIMenuData(self.menu, "current_animation", var_4e2650de[2]);
	self.var_e2d1ba98 SetLUIMenuData(self.menu, "zRot", var_4e2650de[3]);
}

/*
	Name: function_87fb6eec
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x12C0
	Size: 0x10
	Parameters: 1
	Flags: None
	Line Number: 476
*/
function function_87fb6eec(value)
{
	return;
}

/*
	Name: updateBarScale
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x12D8
	Size: 0x388
	Parameters: 2
	Flags: None
	Line Number: 491
*/
function updateBarScale(barFrac, rateOfChange)
{
	if(isdefined(self.var_e2d1ba98))
	{
		if(isdefined(rateOfChange) && rateOfChange)
		{
			time = 1 / rateOfChange;
			self.var_e2d1ba98 SetLUIMenuData(self.menu, "startAlpha", barFrac);
			self.var_e2d1ba98 SetLUIMenuData(self.menu, "endAlpha", 1);
			self function_319e316(time);
		}
		else
		{
			self.var_e2d1ba98 SetLUIMenuData(self.menu, "startAlpha", barFrac);
			self.var_e2d1ba98 SetLUIMenuData(self.menu, "endAlpha", barFrac);
			self function_319e316(0.1);
			return;
		}
	}
	barWidth = Int(self.width * barFrac + 0.5);
	if(!barWidth)
	{
		barWidth = 1;
	}
	self.bar.frac = barFrac;
	self.bar SetShader(self.bar.shader, barWidth, self.height);
	/#
		/#
			Assert(barWidth <= self.width, "Dev Block strings are not supported" + barWidth + "Dev Block strings are not supported" + self.width + "Dev Block strings are not supported" + barFrac);
		#/
	#/
	if(isdefined(rateOfChange) && barWidth < self.width)
	{
		if(rateOfChange > 0)
		{
			/#
				/#
					Assert(1 - barFrac / rateOfChange > 0, "Dev Block strings are not supported" + barFrac + "Dev Block strings are not supported" + rateOfChange);
				#/
			#/
			self.bar ScaleOverTime(1 - barFrac / rateOfChange, self.width, self.height);
		}
		else if(rateOfChange < 0)
		{
			/#
				/#
					Assert(barFrac / -1 * rateOfChange > 0, "Dev Block strings are not supported" + barFrac + "Dev Block strings are not supported" + rateOfChange);
				#/
			#/
			self.bar ScaleOverTime(barFrac / -1 * rateOfChange, 1, self.height);
		}
	}
	self.bar.rateOfChange = rateOfChange;
	self.bar.lastUpdateTime = GetTime();
}

/*
	Name: createFontString
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1668
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 557
*/
function createFontString(font, fontscale)
{
	fontElem = newClientHudElem(self);
	fontElem.elemType = "font";
	fontElem.font = font;
	fontElem.fontscale = fontscale;
	fontElem.x = 0;
	fontElem.y = 0;
	fontElem.width = 0;
	fontElem.height = Int(level.fontHeight * fontscale);
	fontElem.xOffset = 0;
	fontElem.yOffset = 0;
	fontElem.children = [];
	fontElem setParent(level.uiParent);
	fontElem.hidden = 0;
	return fontElem;
}

/*
	Name: createServerFontString
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x17A0
	Size: 0x158
	Parameters: 3
	Flags: None
	Line Number: 585
*/
function createServerFontString(font, fontscale, team)
{
	if(isdefined(team))
	{
		fontElem = NewTeamHudElem(team);
	}
	else
	{
		fontElem = NewHudElem();
	}
	fontElem.elemType = "font";
	fontElem.font = font;
	fontElem.fontscale = fontscale;
	fontElem.x = 0;
	fontElem.y = 0;
	fontElem.width = 0;
	fontElem.height = Int(level.fontHeight * fontscale);
	fontElem.xOffset = 0;
	fontElem.yOffset = 0;
	fontElem.children = [];
	fontElem setParent(level.uiParent);
	fontElem.hidden = 0;
	return fontElem;
}

/*
	Name: createServerTimer
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1900
	Size: 0x158
	Parameters: 3
	Flags: None
	Line Number: 620
*/
function createServerTimer(font, fontscale, team)
{
	if(isdefined(team))
	{
		timerElem = NewTeamHudElem(team);
	}
	else
	{
		timerElem = NewHudElem();
	}
	timerElem.elemType = "timer";
	timerElem.font = font;
	timerElem.fontscale = fontscale;
	timerElem.x = 0;
	timerElem.y = 0;
	timerElem.width = 0;
	timerElem.height = Int(level.fontHeight * fontscale);
	timerElem.xOffset = 0;
	timerElem.yOffset = 0;
	timerElem.children = [];
	timerElem setParent(level.uiParent);
	timerElem.hidden = 0;
	return timerElem;
}

/*
	Name: createClientTimer
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1A60
	Size: 0x130
	Parameters: 2
	Flags: None
	Line Number: 655
*/
function createClientTimer(font, fontscale)
{
	timerElem = newClientHudElem(self);
	timerElem.elemType = "timer";
	timerElem.font = font;
	timerElem.fontscale = fontscale;
	timerElem.x = 0;
	timerElem.y = 0;
	timerElem.width = 0;
	timerElem.height = Int(level.fontHeight * fontscale);
	timerElem.xOffset = 0;
	timerElem.yOffset = 0;
	timerElem.children = [];
	timerElem setParent(level.uiParent);
	timerElem.hidden = 0;
	return timerElem;
}

/*
	Name: createIcon
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1B98
	Size: 0x130
	Parameters: 3
	Flags: None
	Line Number: 683
*/
function createIcon(shader, width, height)
{
	iconElem = newClientHudElem(self);
	iconElem.elemType = "icon";
	iconElem.x = 0;
	iconElem.y = 0;
	iconElem.width = width;
	iconElem.height = height;
	iconElem.xOffset = 0;
	iconElem.yOffset = 0;
	iconElem.children = [];
	iconElem setParent(level.uiParent);
	iconElem.hidden = 0;
	if(isdefined(shader))
	{
		iconElem SetShader(shader, width, height);
	}
	return iconElem;
}

/*
	Name: createServerIcon
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1CD0
	Size: 0x158
	Parameters: 4
	Flags: None
	Line Number: 713
*/
function createServerIcon(shader, width, height, team)
{
	if(isdefined(team))
	{
		iconElem = NewTeamHudElem(team);
	}
	else
	{
		iconElem = NewHudElem();
	}
	iconElem.elemType = "icon";
	iconElem.x = 0;
	iconElem.y = 0;
	iconElem.width = width;
	iconElem.height = height;
	iconElem.xOffset = 0;
	iconElem.yOffset = 0;
	iconElem.children = [];
	iconElem setParent(level.uiParent);
	iconElem.hidden = 0;
	if(isdefined(shader))
	{
		iconElem SetShader(shader, width, height);
	}
	return iconElem;
}

/*
	Name: createServerBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x1E30
	Size: 0x470
	Parameters: 6
	Flags: None
	Line Number: 750
*/
function createServerBar(color, width, height, flashFrac, team, selected)
{
	if(isdefined(team))
	{
		barElem = NewTeamHudElem(team);
	}
	else
	{
		barElem = NewHudElem();
	}
	barElem.x = 0;
	barElem.y = 0;
	barElem.frac = 0;
	barElem.color = color;
	barElem.sort = -2;
	barElem.shader = "progress_bar_fill";
	barElem SetShader("progress_bar_fill", width, height);
	barElem.hidden = 0;
	if(isdefined(flashFrac))
	{
		barElem.flashFrac = flashFrac;
	}
	if(isdefined(team))
	{
		barElemFrame = NewTeamHudElem(team);
	}
	else
	{
		barElemFrame = NewHudElem();
	}
	barElemFrame.elemType = "icon";
	barElemFrame.x = 0;
	barElemFrame.y = 0;
	barElemFrame.width = width;
	barElemFrame.height = height;
	barElemFrame.xOffset = 0;
	barElemFrame.yOffset = 0;
	barElemFrame.bar = barElem;
	barElemFrame.barFrame = barElemFrame;
	barElemFrame.children = [];
	barElemFrame.sort = -1;
	barElemFrame.color = (1, 1, 1);
	barElemFrame setParent(level.uiParent);
	if(isdefined(selected))
	{
		barElemFrame SetShader("progress_bar_fg_sel", width, height);
	}
	else
	{
		barElemFrame SetShader("progress_bar_fg", width, height);
	}
	barElemFrame.hidden = 0;
	if(isdefined(team))
	{
		barElemBG = NewTeamHudElem(team);
	}
	else
	{
		barElemBG = NewHudElem();
	}
	barElemBG.elemType = "bar";
	barElemBG.x = 0;
	barElemBG.y = 0;
	barElemBG.width = width;
	barElemBG.height = height;
	barElemBG.xOffset = 0;
	barElemBG.yOffset = 0;
	barElemBG.bar = barElem;
	barElemBG.barFrame = barElemFrame;
	barElemBG.children = [];
	barElemBG.sort = -3;
	barElemBG.color = (0, 0, 0);
	barElemBG.alpha = 0.5;
	barElemBG setParent(level.uiParent);
	barElemBG SetShader("progress_bar_bg", width, height);
	barElemBG.hidden = 0;
	return barElemBG;
}

/*
	Name: createBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x22A8
	Size: 0xB8
	Parameters: 4
	Flags: None
	Line Number: 839
*/
function createBar(color, width, height, flashFrac)
{
	self.var_f2239b88 destroyElem();
	self.var_f2239b88 = newClientHudElem(self);
	self.var_f2239b88.menu = self OpenLUIMenu("LuiBar");
	self.var_f2239b88.var_e2d1ba98 = self;
	self.var_193737d0 = self.var_f2239b88;
	return self.var_f2239b88;
}

/*
	Name: getCurrentFraction
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2368
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 859
*/
function getCurrentFraction()
{
	frac = self.bar.frac;
	if(isdefined(self.bar.rateOfChange))
	{
		frac = frac + GetTime() - self.bar.lastUpdateTime * self.bar.rateOfChange;
		if(frac > 1)
		{
			frac = 1;
		}
		if(frac < 0)
		{
			frac = 0;
		}
	}
	return frac;
}

/*
	Name: createPrimaryProgressBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2408
	Size: 0xA0
	Parameters: 0
	Flags: None
	Line Number: 887
*/
function createPrimaryProgressBar()
{
	bar = self createBar((1, 1, 1), level.primaryProgressBarWidth, level.primaryProgressBarHeight);
	if(level.splitscreen)
	{
		bar setPoint("TOP", undefined, level.primaryProgressBarX, level.primaryProgressBarY);
	}
	else
	{
		bar setPoint("CENTER", undefined, level.primaryProgressBarX, level.primaryProgressBarY);
	}
	return bar;
}

/*
	Name: createPrimaryProgressBarText
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x24B0
	Size: 0xB0
	Parameters: 0
	Flags: None
	Line Number: 911
*/
function createPrimaryProgressBarText()
{
	text = createFontString("objective", level.primaryProgressBarFontSize);
	if(level.splitscreen)
	{
		text setPoint("TOP", undefined, level.primaryProgressBarTextX, level.primaryProgressBarTextY);
	}
	else
	{
		text setPoint("CENTER", undefined, level.primaryProgressBarTextX, level.primaryProgressBarTextY);
	}
	text.sort = -1;
	return text;
}

/*
	Name: createSecondaryProgressBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2568
	Size: 0x120
	Parameters: 0
	Flags: None
	Line Number: 936
*/
function createSecondaryProgressBar()
{
	secondaryProgressBarHeight = GetDvarInt("scr_secondaryProgressBarHeight", level.secondaryProgressBarHeight);
	secondaryProgressBarX = GetDvarInt("scr_secondaryProgressBarX", level.secondaryProgressBarX);
	secondaryProgressBarY = GetDvarInt("scr_secondaryProgressBarY", level.secondaryProgressBarY);
	bar = self createBar((1, 1, 1), level.secondaryProgressBarWidth, secondaryProgressBarHeight);
	if(level.splitscreen)
	{
		bar setPoint("TOP", undefined, secondaryProgressBarX, secondaryProgressBarY);
	}
	else
	{
		bar setPoint("CENTER", undefined, secondaryProgressBarX, secondaryProgressBarY);
	}
	return bar;
}

/*
	Name: createSecondaryProgressBarText
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2690
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 963
*/
function createSecondaryProgressBarText()
{
	secondaryProgressBarTextX = GetDvarInt("scr_btx", level.secondaryProgressBarTextX);
	secondaryProgressBarTextY = GetDvarInt("scr_bty", level.secondaryProgressBarTextY);
	text = createFontString("objective", level.primaryProgressBarFontSize);
	if(level.splitscreen)
	{
		text setPoint("TOP", undefined, secondaryProgressBarTextX, secondaryProgressBarTextY);
	}
	else
	{
		text setPoint("CENTER", undefined, secondaryProgressBarTextX, secondaryProgressBarTextY);
	}
	text.sort = -1;
	return text;
}

/*
	Name: createTeamProgressBar
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x27A0
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 990
*/
function createTeamProgressBar(team)
{
	bar = createServerBar((1, 0, 0), level.teamProgressBarWidth, level.teamProgressBarHeight, undefined, team);
	bar setPoint("TOP", undefined, 0, level.teamProgressBarY);
	return bar;
}

/*
	Name: createTeamProgressBarText
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2818
	Size: 0x70
	Parameters: 1
	Flags: None
	Line Number: 1007
*/
function createTeamProgressBarText(team)
{
	text = createServerFontString("default", level.teamProgressBarFontSize, team);
	text setPoint("TOP", undefined, 0, level.teamProgressBarTextY);
	return text;
}

/*
	Name: setFlashFrac
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2890
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 1024
*/
function setFlashFrac(flashFrac)
{
	self.bar.flashFrac = flashFrac;
}

/*
	Name: hideElem
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x28B8
	Size: 0xD8
	Parameters: 0
	Flags: None
	Line Number: 1039
*/
function hideElem()
{
	if(self.hidden)
	{
		return;
	}
	self.hidden = 1;
	if(self.alpha != 0)
	{
		self.alpha = 0;
	}
	if(self.elemType == "bar" || self.elemType == "bar_shader")
	{
		self.bar.hidden = 1;
		if(self.bar.alpha != 0)
		{
			self.bar.alpha = 0;
		}
		self.barFrame.hidden = 1;
		if(self.barFrame.alpha != 0)
		{
			self.barFrame.alpha = 0;
		}
	}
}

/*
	Name: showElem
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2998
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 1075
*/
function showElem()
{
	if(!self.hidden)
	{
		return;
	}
	self.hidden = 0;
	if(self.elemType == "bar" || self.elemType == "bar_shader")
	{
		if(self.alpha != 0.5)
		{
			self.alpha = 0.5;
		}
		self.bar.hidden = 0;
		if(self.bar.alpha != 1)
		{
			self.bar.alpha = 1;
		}
		self.barFrame.hidden = 0;
		if(self.barFrame.alpha != 1)
		{
			self.barFrame.alpha = 1;
		}
	}
	else if(self.alpha != 1)
	{
		self.alpha = 1;
	}
}

/*
	Name: flashThread
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2AA8
	Size: 0xF0
	Parameters: 0
	Flags: None
	Line Number: 1115
*/
function flashThread()
{
	self endon("death");
	if(!self.hidden)
	{
		self.alpha = 1;
	}
	while(1)
	{
		if(self.frac >= self.flashFrac)
		{
			if(!self.hidden)
			{
				self fadeOverTime(0.3);
				self.alpha = 0.2;
				wait(0.35);
				self fadeOverTime(0.3);
				self.alpha = 1;
			}
			wait(0.7);
		}
		else if(!self.hidden && self.alpha != 1)
		{
			self.alpha = 1;
		}
		wait(0.05);
	}
}

/*
	Name: destroyElem
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2BA0
	Size: 0x190
	Parameters: 0
	Flags: None
	Line Number: 1154
*/
function destroyElem()
{
	if(isdefined(self) && isdefined(self.var_e2d1ba98))
	{
		self.var_e2d1ba98 CloseLUIMenu(self.menu);
		self destroy();
		return;
	}
	tempChildren = [];
	for(index = 0; index < self.children.size; index++)
	{
		if(isdefined(self.children[index]))
		{
			tempChildren[tempChildren.size] = self.children[index];
		}
	}
	for(index = 0; index < tempChildren.size; index++)
	{
		tempChildren[index] setParent(self getParent());
	}
	if(self.elemType == "bar" || self.elemType == "bar_shader")
	{
		self.bar destroy();
		self.barFrame destroy();
	}
	self destroy();
}

/*
	Name: setIconShader
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2D38
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1192
*/
function setIconShader(shader)
{
	self SetShader(shader, self.width, self.height);
}

/*
	Name: setWidth
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2D78
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 1207
*/
function setWidth(width)
{
	self.width = width;
}

/*
	Name: setHeight
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2D98
	Size: 0x18
	Parameters: 1
	Flags: None
	Line Number: 1222
*/
function setHeight(height)
{
	self.height = height;
}

/*
	Name: setSize
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2DB8
	Size: 0x30
	Parameters: 2
	Flags: None
	Line Number: 1237
*/
function setSize(width, height)
{
	self.width = width;
	self.height = height;
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Bad function call
}

/*
	Name: updateChildren
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2DF0
	Size: 0x98
	Parameters: 0
	Flags: None
	Line Number: 1256
*/
function updateChildren()
{
	for(index = 0; index < self.children.size; index++)
	{
		child = self.children[index];
		child setPoint(child.point, child.relativePoint, child.xOffset, child.yOffset);
	}
}

/*
	Name: createLoadoutIcon
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2E90
	Size: 0x140
	Parameters: 5
	Flags: None
	Line Number: 1275
*/
function createLoadoutIcon(player, verIndex, horIndex, xpos, ypos)
{
	iconSize = 32;
	if(player IsSplitscreen())
	{
		iconSize = 22;
	}
	ypos = ypos - 90 + iconSize * 3 - verIndex;
	xpos = xpos - 10 + iconSize * horIndex;
	icon = createIcon("white", iconSize, iconSize);
	icon setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", xpos, ypos);
	icon.horzAlign = "user_right";
	icon.vertAlign = "user_bottom";
	icon.archived = 0;
	icon.foreground = 0;
	return icon;
}

/*
	Name: setLoadoutIconCoords
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x2FD8
	Size: 0x110
	Parameters: 5
	Flags: None
	Line Number: 1303
*/
function setLoadoutIconCoords(player, verIndex, horIndex, xpos, ypos)
{
	iconSize = 32;
	if(player IsSplitscreen())
	{
		iconSize = 22;
	}
	ypos = ypos - 90 + iconSize * 3 - verIndex;
	xpos = xpos - 10 + iconSize * horIndex;
	self setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", xpos, ypos);
	self.horzAlign = "user_right";
	self.vertAlign = "user_bottom";
	self.archived = 0;
	self.foreground = 0;
	self.alpha = 1;
}

/*
	Name: setLoadoutTextCoords
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x30F0
	Size: 0x38
	Parameters: 1
	Flags: None
	Line Number: 1330
*/
function setLoadoutTextCoords(xCoord)
{
	self setPoint("RIGHT", "LEFT", xCoord, 0);
}

/*
	Name: createLoadoutText
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x3130
	Size: 0xD0
	Parameters: 2
	Flags: None
	Line Number: 1345
*/
function createLoadoutText(icon, xCoord)
{
	text = createFontString("small", 1);
	text setParent(icon);
	text setPoint("RIGHT", "LEFT", xCoord, 0);
	text.archived = 0;
	text.alignX = "right";
	text.alignY = "middle";
	text.foreground = 0;
	return text;
}

/*
	Name: showLoadoutAttribute
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x3208
	Size: 0xC0
	Parameters: 5
	Flags: None
	Line Number: 1367
*/
function showLoadoutAttribute(iconElem, icon, alpha, textelem, text)
{
	iconSize = 32;
	iconElem.alpha = alpha;
	if(alpha)
	{
		iconElem SetShader(icon, iconSize, iconSize);
	}
	if(isdefined(textelem))
	{
		textelem.alpha = alpha;
		if(alpha)
		{
			textelem setText(text);
		}
	}
}

/*
	Name: hideLoadoutAttribute
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x32D0
	Size: 0xC8
	Parameters: 4
	Flags: None
	Line Number: 1395
*/
function hideLoadoutAttribute(iconElem, fadetime, textelem, hideTextOnly)
{
	if(isdefined(fadetime))
	{
		if(!isdefined(hideTextOnly) || !hideTextOnly)
		{
			iconElem fadeOverTime(fadetime);
		}
		if(isdefined(textelem))
		{
			textelem fadeOverTime(fadetime);
		}
	}
	if(!isdefined(hideTextOnly) || !hideTextOnly)
	{
		iconElem.alpha = 0;
	}
	if(isdefined(textelem))
	{
		textelem.alpha = 0;
	}
}

/*
	Name: showPerks
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x33A0
	Size: 0x28
	Parameters: 0
	Flags: None
	Line Number: 1428
*/
function showPerks()
{
	self LUINotifyEvent(&"show_perk_notification", 0);
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: showPerk
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x33D0
	Size: 0x2E0
	Parameters: 3
	Flags: None
	Line Number: 1445
*/
function showPerk(index, perk, ypos)
{
	/#
		/#
			Assert(game["Dev Block strings are not supported"] != "Dev Block strings are not supported");
		#/
	#/
	if(!isdefined(self.perkicon))
	{
		self.perkicon = [];
		self.perkname = [];
	}
	if(!isdefined(self.perkicon[index]))
	{
		/#
			/#
				Assert(!isdefined(self.perkname[index]));
			#/
		#/
		self.perkicon[index] = createLoadoutIcon(self, index, 0, 200, ypos);
		self.perkname[index] = createLoadoutText(self.perkicon[index], 160);
	}
	else
	{
		self.perkicon[index] setLoadoutIconCoords(self, index, 0, 200, ypos);
		self.perkname[index] setLoadoutTextCoords(160);
	}
	if(perk == "perk_null" || perk == "weapon_null" || perk == "specialty_null")
	{
		alpha = 0;
	}
	else
	{
		/#
			Assert(isdefined(level.perkNames[perk]), perk);
		#/
		alpha = 1;
	}
	/#
	#/
	showLoadoutAttribute(self.perkicon[index], perk, alpha, self.perkname[index], level.perkNames[perk]);
	self.perkicon[index] MoveOverTime(0.3);
	self.perkicon[index].x = -5;
	self.perkicon[index].hidewheninmenu = 1;
	self.perkname[index] MoveOverTime(0.3);
	self.perkname[index].x = -40;
	self.perkname[index].hidewheninmenu = 1;
}

/*
	Name: hidePerk
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x36B8
	Size: 0x188
	Parameters: 3
	Flags: None
	Line Number: 1504
*/
function hidePerk(index, fadetime, hideTextOnly)
{
	if(!isdefined(fadetime))
	{
		fadetime = 0.05;
	}
	if(level.perksEnabled == 1)
	{
		if(game["state"] == "postgame")
		{
			if(isdefined(self.perkicon))
			{
				/#
					/#
						Assert(!isdefined(self.perkicon[index]));
					#/
				#/
				/#
					/#
						Assert(!isdefined(self.perkname[index]));
						return;
					#/
				#/
			}
		}
		/#
			/#
				Assert(isdefined(self.perkicon[index]));
			#/
		#/
		/#
			/#
				Assert(isdefined(self.perkname[index]));
			#/
		#/
		if(isdefined(self.perkicon) && isdefined(self.perkicon[index]) && isdefined(self.perkname) && isdefined(self.perkname[index]))
		{
			hideLoadoutAttribute(self.perkicon[index], fadetime, self.perkname[index], hideTextOnly);
		}
	}
}

/*
	Name: showKillstreak
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x3848
	Size: 0x160
	Parameters: 4
	Flags: None
	Line Number: 1556
*/
function showKillstreak(index, killstreak, xpos, ypos)
{
	/#
		/#
			Assert(game["Dev Block strings are not supported"] != "Dev Block strings are not supported");
		#/
	#/
	if(!isdefined(self.killstreakicon))
	{
		self.killstreakicon = [];
	}
	if(!isdefined(self.killstreakicon[index]))
	{
		self.killstreakicon[index] = createLoadoutIcon(self, 3, self.killstreak.size - 1 - index, xpos, ypos);
	}
	if(killstreak == "killstreak_null" || killstreak == "weapon_null")
	{
		alpha = 0;
	}
	else
	{
		/#
			Assert(isdefined(level.killStreakIcons[killstreak]), killstreak);
		#/
		alpha = 1;
	}
	/#
	#/
	showLoadoutAttribute(self.killstreakicon[index], level.killStreakIcons[killstreak], alpha);
}

/*
	Name: hideKillstreak
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x39B0
	Size: 0xC0
	Parameters: 2
	Flags: None
	Line Number: 1597
*/
function hideKillstreak(index, fadetime)
{
	if(util::is_killstreaks_enabled())
	{
		if(game["state"] == "postgame")
		{
			/#
				/#
					Assert(!isdefined(self.killstreakicon[index]));
					return;
				#/
			#/
		}
		/#
			/#
				Assert(isdefined(self.killstreakicon[index]));
			#/
		#/
		hideLoadoutAttribute(self.killstreakicon[index], fadetime);
	}
}

/*
	Name: setGamemodeInfoPoint
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x3A78
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 1629
*/
function setGamemodeInfoPoint()
{
	self.x = 11;
	self.y = 120;
	self.horzAlign = "user_left";
	self.vertAlign = "user_top";
	self.alignX = "left";
	self.alignY = "top";
}

/*
	Name: function_1143b5c4
	Namespace: hud
	Checksum: 0x424F4353
	Offset: 0x3AE0
	Size: 0x258
	Parameters: 8
	Flags: None
	Line Number: 1649
*/
function function_1143b5c4(text, alignment, x, y, width, RGB, height, fadeOverTime)
{
	if(!isdefined(fadeOverTime))
	{
		fadeOverTime = "1,0,1";
	}
	var_ff37f080 = self OpenLUIMenu("HudElementText");
	if(isdefined(alignment))
	{
		self SetLUIMenuData(var_ff37f080, "alignment", alignment);
	}
	if(isdefined(x))
	{
		self SetLUIMenuData(var_ff37f080, "x", x);
	}
	if(isdefined(y))
	{
		self SetLUIMenuData(var_ff37f080, "y", y);
	}
	if(isdefined(width))
	{
		self SetLUIMenuData(var_ff37f080, "width", width);
	}
	if(isdefined(height))
	{
		self SetLUIMenuData(var_ff37f080, "height", height);
	}
	if(isdefined(text))
	{
		self SetLUIMenuData(var_ff37f080, "text", text);
	}
	if(isdefined(RGB))
	{
		self SetLUIMenuData(var_ff37f080, "red", RGB[0]);
		self SetLUIMenuData(var_ff37f080, "green", RGB[1]);
		self SetLUIMenuData(var_ff37f080, "blue", RGB[2]);
	}
	if(isdefined(fadeOverTime))
	{
		self SetLUIMenuData(var_ff37f080, "fadeOverTime", fadeOverTime);
	}
	return var_ff37f080;
}

