#namespace namespace_a1bbf102;

/*
	Name: init
	Namespace: namespace_a1bbf102
	Checksum: 0xEB3D004B
	Offset: 0xE0
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 12
*/
function init()
{
	level.var_cbee09ed = "music_raise_the_dead";
	level.var_7b5d695f = "ee_trigger";
	level.var_71a97969 = "ee_loop_trigger";
	level.var_4c9eddc0 = 1;
	setupMusic();
}

/*
	Name: setupMusic
	Namespace: namespace_a1bbf102
	Checksum: 0xD4CCB89A
	Offset: 0x140
	Size: 0x108
	Parameters: 0
	Flags: None
	Line Number: 31
*/
function setupMusic()
{
	level.var_cb401bd0 = 0;
	triggers = GetEntArray("song_trigger", "targetname");
	foreach(trigger in triggers)
	{
		trigger setcursorhint("HINT_NOICON");
		trigger UseTriggerRequireLookAt();
		trigger thread function_35a1b9d9(triggers.size);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_35a1b9d9
	Namespace: namespace_a1bbf102
	Checksum: 0x988AC570
	Offset: 0x250
	Size: 0xA8
	Parameters: 1
	Flags: None
	Line Number: 55
*/
function function_35a1b9d9(numTriggers)
{
	ent = self function_4116c49(level.var_71a97969);
	self waittill("trigger");
	ent delete();
	self playsound(level.var_7b5d695f);
	level.var_cb401bd0++;
	if(level.var_cb401bd0 >= numTriggers)
	{
		function_a4081b54();
	}
}

/*
	Name: function_a4081b54
	Namespace: namespace_a1bbf102
	Checksum: 0x603D408C
	Offset: 0x300
	Size: 0x40
	Parameters: 0
	Flags: None
	Line Number: 78
*/
function function_a4081b54()
{
	function_4b4cb54c(level.var_cbee09ed);
	if(level.var_4c9eddc0)
	{
		setupMusic();
	}
}

/*
	Name: function_4b4cb54c
	Namespace: namespace_a1bbf102
	Checksum: 0xD91DD954
	Offset: 0x348
	Size: 0x98
	Parameters: 1
	Flags: None
	Line Number: 97
*/
function function_4b4cb54c(sound)
{
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent playsoundwithnotify(sound, sound + "wait");
	temp_ent waittill(sound + "wait");
	wait(0.05);
	temp_ent delete();
}

/*
	Name: function_4116c49
	Namespace: namespace_a1bbf102
	Checksum: 0x8672DFC
	Offset: 0x3E8
	Size: 0x58
	Parameters: 1
	Flags: None
	Line Number: 116
*/
function function_4116c49(sound)
{
	temp_ent = spawn("script_origin", self.origin);
	temp_ent PlayLoopSound(sound);
	return temp_ent;
}

