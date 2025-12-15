#include scripts\shared\util_shared;
#include scripts\zm\_zm_story_sub;

#namespace sound;

/*
	Name: loop_fx_sound
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0xD8
	Size: 0xA8
	Parameters: 3
	Flags: None
	Line Number: 15
*/
function loop_fx_sound(alias, origin, ender)
{
	org = spawn("script_origin", (0, 0, 0));
	if(isdefined(ender))
	{
		thread loop_delete(ender, org);
		self endon(ender);
	}
	org.origin = origin;
	org PlayLoopSound(alias);
}

/*
	Name: loop_delete
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x188
	Size: 0x48
	Parameters: 2
	Flags: None
	Line Number: 37
*/
function loop_delete(ender, ent)
{
	ent endon("death");
	self waittill(ender);
	ent delete();
}

/*
	Name: play_in_space
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x1D8
	Size: 0x110
	Parameters: 3
	Flags: None
	Line Number: 54
*/
function play_in_space(alias, origin, master)
{
	org = spawn("script_origin", (0, 0, 1));
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	org.origin = origin;
	var_53a95046 = soundgetplaybacktime(alias);
	thread namespace_cc012897::Send(alias, "all", var_53a95046);
	org playsoundwithnotify(alias, "sounddone");
	org waittill("sounddone");
	if(isdefined(org))
	{
		org delete();
	}
}

/*
	Name: loop_on_tag
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x2F0
	Size: 0x160
	Parameters: 3
	Flags: None
	Line Number: 82
*/
function loop_on_tag(alias, tag, bStopSoundOnDeath)
{
	org = spawn("script_origin", (0, 0, 0));
	org endon("death");
	if(!isdefined(bStopSoundOnDeath))
	{
		bStopSoundOnDeath = 1;
	}
	if(bStopSoundOnDeath)
	{
		thread util::delete_on_death(org);
	}
	if(isdefined(tag))
	{
		org LinkTo(self, tag, (0, 0, 0), (0, 0, 0));
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org LinkTo(self);
	}
	org PlayLoopSound(alias);
	self waittill("stop sound" + alias);
	org StopLoopSound(alias);
	org delete();
}

/*
	Name: play_on_tag
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x458
	Size: 0x1A8
	Parameters: 3
	Flags: None
	Line Number: 120
*/
function play_on_tag(alias, tag, ends_on_death)
{
	org = spawn("script_origin", (0, 0, 0));
	org endon("death");
	thread delete_on_death_wait(org, "sounddone");
	if(isdefined(tag))
	{
		org.origin = self GetTagOrigin(tag);
		org LinkTo(self, tag, (0, 0, 0), (0, 0, 0));
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org LinkTo(self);
	}
	org playsoundwithnotify(alias, "sounddone");
	if(isdefined(ends_on_death))
	{
		/#
			/#
				Assert(ends_on_death, "Dev Block strings are not supported");
			#/
		#/
		wait_for_sounddone_or_death(org);
		wait(0.05);
	}
	else
	{
		org waittill("sounddone");
	}
	org delete();
	return;
	continue;
}

/*
	Name: play_on_entity
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x608
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 166
*/
function play_on_entity(alias)
{
	play_on_tag(alias);
}

/*
	Name: wait_for_sounddone_or_death
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x638
	Size: 0x28
	Parameters: 1
	Flags: None
	Line Number: 181
*/
function wait_for_sounddone_or_death(org)
{
	self endon("death");
	org waittill("sounddone");
}

/*
	Name: stop_loop_on_entity
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x668
	Size: 0x20
	Parameters: 1
	Flags: None
	Line Number: 197
*/
function stop_loop_on_entity(alias)
{
	self notify("stop sound" + alias);
}

/*
	Name: loop_on_entity
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x690
	Size: 0x168
	Parameters: 2
	Flags: None
	Line Number: 212
*/
function loop_on_entity(alias, offset)
{
	org = spawn("script_origin", (0, 0, 0));
	org endon("death");
	thread util::delete_on_death(org);
	if(isdefined(offset))
	{
		org.origin = self.origin + offset;
		org.angles = self.angles;
		org LinkTo(self);
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org LinkTo(self);
	}
	org PlayLoopSound(alias);
	self waittill("stop sound" + alias);
	org StopLoopSound(0.1);
	org delete();
}

/*
	Name: loop_in_space
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x800
	Size: 0xD0
	Parameters: 3
	Flags: None
	Line Number: 245
*/
function loop_in_space(alias, origin, ender)
{
	org = spawn("script_origin", (0, 0, 1));
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	org.origin = origin;
	org PlayLoopSound(alias);
	level waittill(ender);
	org StopLoopSound();
	wait(0.1);
	org delete();
}

/*
	Name: delete_on_death_wait
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x8D8
	Size: 0x50
	Parameters: 2
	Flags: None
	Line Number: 270
*/
function delete_on_death_wait(ent, sounddone)
{
	ent endon("death");
	self waittill("death");
	if(isdefined(ent))
	{
		ent delete();
		return;
	}
}

/*
	Name: play_on_players
	Namespace: sound
	Checksum: 0x424F4353
	Offset: 0x930
	Size: 0x17E
	Parameters: 2
	Flags: None
	Line Number: 291
*/
function play_on_players(sound, team)
{
	/#
		/#
			Assert(isdefined(level.players));
		#/
	#/
	if(level.splitscreen)
	{
		if(isdefined(level.players[0]))
		{
			level.players[0] playlocalsound(sound);
		}
	}
	else if(isdefined(team))
	{
		for(i = 0; i < level.players.size; i++)
		{
			player = level.players[i];
			if(isdefined(player.pers["team"]) && player.pers["team"] == team)
			{
				player playlocalsound(sound);
			}
		}
	}
	else
	{
		for(i = 0; i < level.players.size; i++)
		{
			level.players[i] playlocalsound(sound);
		}
	}
}

