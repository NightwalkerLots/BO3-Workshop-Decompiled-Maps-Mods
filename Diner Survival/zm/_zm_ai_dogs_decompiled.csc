#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\system_shared;
#include scripts\zm\_zm;

#namespace zm_ai_dogs;

/*
	Name: __init__sytem__
	Namespace: zm_ai_dogs
	Checksum: 0xDE0102D4
	Offset: 0x178
	Size: 0x38
	Parameters: 0
	Flags: AutoExec
	Line Number: 17
*/
function autoexec __init__sytem__()
{
	system::register("zm_ai_dogs", &__init__, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_ai_dogs
	Checksum: 0xE44E1B8
	Offset: 0x1B8
	Size: 0x60
	Parameters: 0
	Flags: None
	Line Number: 32
*/
function __init__()
{
	init_dog_fx();
	clientfield::register("actor", "dog_fx", 1, 1, "int", &dog_fx, 0, 0);
}

/*
	Name: init_dog_fx
	Namespace: zm_ai_dogs
	Checksum: 0xF11D6271
	Offset: 0x220
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 48
*/
function init_dog_fx()
{
	level._effect["dog_eye_glow"] = "vk_fx/zm/_vk_zm_dog_eyes_samantha";
	level._effect["dog_trail_fire"] = "zombie/fx_dog_fire_trail_zmb";
}

/*
	Name: dog_fx
	Namespace: zm_ai_dogs
	Checksum: 0x5F2D79C7
	Offset: 0x268
	Size: 0x17C
	Parameters: 7
	Flags: None
	Line Number: 64
*/
function dog_fx(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(newVal)
	{
		self._eyeglow_fx_override = level._effect["dog_eye_glow"];
		self zm::createZombieEyes(localClientNum);
		self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, zm::get_eyeball_on_luminance(), self zm::get_eyeball_color());
		self.n_trails_fx_id = PlayFXOnTag(localClientNum, level._effect["dog_trail_fire"], self, "j_spine2");
		continue;
	}
	self MapShaderConstant(localClientNum, 0, "scriptVector2", 0, zm::get_eyeball_off_luminance(), self zm::get_eyeball_color());
	self zm::deleteZombieEyes(localClientNum);
	if(isdefined(self.n_trails_fx_id))
	{
		deletefx(localClientNum, self.n_trails_fx_id);
	}
}

