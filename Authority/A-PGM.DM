var/list/ADM = list("{!!!}")										//-- Administrator
var/list/UHM = list("{!!!}")	//-- Universal Host Moderator
var/list/AGM = list("{!!!}")	//-- Advanced Game Moderator
var/list/PGM = list("{!!!}")	//-- Permanent Game Moderator
var/list/TGM = list("{!!!}")	//-- Trial Game Moderator
var/list/maskedip = list("{!!!}","127.0.0.1",null) // -- Hidden IPs
var/list/SHM = list()	//-- Special Host Moderator
var/list/SOS = list("") //-- SOS List


var/list/
	golddeanInterns = list("{!!!}")

mob/Login()	//-- Gives the user his or her verbs.
	src.verbs.Remove(typesof(/mob/ADM/verb/))
	src.verbs.Remove(typesof(/mob/UHM/verb/))
	src.verbs.Remove(typesof(/mob/AGM/verb/))
	src.verbs.Remove(typesof(/mob/PGM/verb/))
	src.verbs.Remove(typesof(/mob/TGM/verb/))
	src.Flying = 0
	src.density = 1
	if(!src.nayme)
		src.nayme = src.name
	if(ADM.Find(src.ckey))
		src.verbs.Add(typesof(/mob/ADM/verb/))
	if(UHM.Find(src.ckey))
		src.verbs.Add(typesof(/mob/UHM/verb/))
	if(AGM.Find(src.ckey))
		src.verbs.Add(typesof(/mob/AGM/verb/))
	if(PGM.Find(src.ckey))
		src.verbs.Add(typesof(/mob/PGM/verb/))
	if(src.client.address==null | src.client.address==world.address || src.client.address=="127.0.0.1")
		Host = "[src.ckey]"
		HostMSG = "[src.key]"
		var/page[] = world.Export("http://checkip.dyndns.com/")
		page = file2text(page["CONTENT"])
		page = Remove_HTML(page)
		page = copytext(page,37,length(page)-1)
		HostIP = "[page]"
		src.verbs.Add(typesof(/mob/PGM/verb/))
		src.verbs.Add(typesof(/mob/TGM/verb/))
		src.verbs.Add(typesof(/mob/UHM/verb/))
		TGM += "[src.ckey]"
		PGM += "[src.ckey]"
		if(SHM.Find(src.ckey))
			src.verbs.Add(typesof(/mob/AGM/verb/))
		creation = world.realtime-world.time
		LoopLog()
	if(TGM.Find(src.ckey))
		src.verbs.Add(typesof(/mob/TGM/verb/))
	else
		if(Host != src.ckey)
			src.verbs.Remove(typesof(/mob/PGM/verb/))
			src.verbs.Remove(typesof(/mob/TGM/verb/))

	if(!src.Jailed)
		src.verbs.Add(typesof(/mob/Basic/verb/))
		src.verbs.Add(typesof(/mob/Customize/verb/))
		src.verbs.Add(typesof(/mob/Build/verb/))
		if(src.z == 2)
			if(src.x >= 11 && src.x <= 29)
				if(src.y >= 51 && src.y <= 70)
					src.loc = locate(125,125,1)

mob/TGM/verb
	Stop_All_Music()
		set name = "Stop All Music"
		set category = "GM"
		set desc = "Stops all music in the world."
		switch(alert("Are you sure you want stop all the music?","Stop All Music","Yes","No"))
			if("Yes")
				world << "[usr] has stopped all the music!"
				world << sound(null)
	GM_SOS()
		set name = "Check SOS List"
		set category="GM"
		set desc = "Check and respond to SOS's."
		var/choice = input("Which person do you wish to help?\n(This will teleport you directly to them)","SOS!") as null|anything in SOS
		if(choice)
			for(var/L in SOS)
				if(L=="-=Cancel=-")
					SOS-=L
			var/tmp/theirkey = copytext(choice,findtext(choice,"(")+1,findtext(choice,")"))
			for(var/mob/M in world)
				if(M.ckey==theirkey)
					M<<"[usr.name] has come to your aid."
					usr.loc=M.loc
					SOS-=choice
					return 0
			usr<<"[choice] currently isn't online"
	Delete_Players_Objects()	//-- Delete All of a Player's Objects
		set category = "GM"
		set desc="Delete all the objects a person has created."
		var/list/People = list()
		for(var/obj/o in world)
			if(o.owner)
				People += o.owner
		var/select = input("Whose objects will you delete?","Delete Player's Objects") as null|anything in People
		if(!select)
			return 0
		else
			for(var/mob/M in world)
				if(M.ckey == select)
					if(TGM.Find(M.ckey))
						return 0
			switch(alert("Are you sure you want to delete all of [select]'s objects?","Delete Player's Objects","Yes","No"))
				if("Yes")
					for(var/obj/a in world.contents)
						if(a.owner == select)
							del a
					world << "<font color=#FFC0C0>[src.name] has deleted all of [select]'s objects!"
	Send_to_Start(mob/M in world)
		set category = "GM"
		set desc = "Send a character to start."
		M.loc = locate(125,125,1)
	Warn()	//-- WEEEEE!!!
		set category = "GM"
		set desc="Adjust a user's warning level."
		var/list/People = list()
		switch(input("What would you like to do?","Warn") as null|anything in list("Increase Warning Levels","Decrease Warning Levels"))
			if("Increase Warning Levels")
				for(var/mob/M in world)
					if(M.client)
						People += M.ckey
				var/Pick = input("Whose warning will you increase?","Warn") as null|anything in People
				if(!Pick)
					return 0
				var/Value = input("How much will you increase [Pick]'s warning level by?","Warn") as null|num
				if(!Value)
					return 0
				switch(alert(src,"Are you sure you want to add [Value]% to [Pick]'s warning level?","Warn","Yes","No"))
					if("Yes")
						for(var/mob/M in world)
							if(TGM.Find(M.ckey))
								return 0
							if(Pick == M.ckey)
								M.Warning += Value
								if(M.Warning >= 100)
									M.Warning = 100
								if(M.Warning <= 0)
									M.Warning = 0
								M << "<font color=#C0FFC0>Your warning level has been increased by [Value]% by [src.name]. Your warn level is now [M.Warning]%."
			if("Decrease Warning Levels")
				for(var/mob/M in world)
					if(M.client)
						People += M.ckey
				var/Pick = input("Whose warning will you decrease?","Warn") as null|anything in People
				if(!Pick)
					return 0
				var/Value = input("How much will you decrease [Pick]'s warning level by?","Warn") as null|num
				if(!Value)
					return 0
				switch(alert(src,"Are you sure you want to subtract [Value]% from [Pick]'s warning level?","Warn","Yes","No"))
					if("Yes")
						for(var/mob/M in world)
							if(Pick == M.ckey)
								M.Warning -= Value
								if(M.Warning >= 100)
									M.Warning = 100
								if(M.Warning <= 0)
									M.Warning = 0
								M << "<font color=#C0FFC0>Your warning level has been decreased by [Value]% by [src.name]. Your warn level is now [M.Warning]%."
	Fly()	//-- WEEEEE!!!
		set category = "GM"
		set desc="Enable/Disable the ability to walk through objects."
		if(src.Flying == 0)
			src.Flying = 1
			src.density = 1
			src << "<font color=#C0FFC0>You have landed."
			return 0
		if(src.Flying == 1)
			src.Flying = 0
			src.density = 0
			src << "<font color=#C0FFC0>You are now flying."
			return 0
	Silence()	//-- Mute and Unmute
		set category = "GM"
		set name = "Silence"
		set desc = "Silence or Unsilence anyone in the world."
		LoadMute()
		switch(input("What would you like to do?","Silence") as null|anything in list("Silence","Unsilence"))
			if("Silence")
				var/list/People = list()
				for(var/mob/M in world)
					if(M.client)
						if(M.Mute == 0)
							People += M.ckey
				var/ToMute = input("Who will you mute?","Silence") as null|anything in People
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to silence [ToMute]?","Mute","Yes","No"))
					if("Yes")
						for(var/mob/M in world)
							if(M.ckey == ToMute)
								if(TGM.Find(M.ckey))
									return 0
								if(!M.client)return
								if(M.Mute == 1)
									return
								M.Mute = 1
								world << "<font color=#FFC0C0>[M] has been silenced by [src.name]!"
								log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[M.ckey] has been silenced by [src.ckey].</font><br>"
								M << "<font color=#C0FFC0>You have been silenced."
								muted += list("[M.ckey]")
								SaveMute()
			if("Unsilence")
				if(muted == list() || muted == null)
					return
				var/ToMute = input("Who would you like to unsilence?","Silence") as null|anything in muted
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to unsilence [ToMute]?","Mute","Yes","No"))
					if("Yes")
						world << "<font color=#FFC0C0>[ToMute] has been unsilenced by [src.name]."
						log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[ToMute] has been unsilenced by [src.ckey].</font><br>"
						muted -= ToMute
						for(var/mob/M in world)
							if(ToMute == M.ckey)
								M.Mute = 0
								M << "<font color=#C0FFC0>You are no longer silenced."
						SaveMute()
	Song_Rights()	//-- Mute and Unmute
		set category = "GM"
		set name = "Music Rights"
		set desc = "Take or Return the Music Rights to anyone in the world."
		LoadMute()
		switch(input("What would you like to do?","Music Rights") as null|anything in list("Take Music Rights","Return Music Rights"))
			if("Take Music Rights")
				var/list/People = list()
				for(var/mob/M in world)
					if(M.client)
						if(M.songmute == 0)
							People += M.ckey
				var/ToMute = input("Who will you mute?","Music Rights") as null|anything in People
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to Music Rights [ToMute]?","Music Rights","Yes","No"))
					if("Yes")
						for(var/mob/M in world)
							if(M.ckey == ToMute)
								if(!M.client)return
								if(M.songmute == 1)
									return
								M.songmute = 1
								world << "<font color=#FFC0C0>[M] has had their Music Rights taken by [src.name]!"
								log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[M.ckey] has had their music rights taken by [src.ckey].</font><br>"
								M << "<font color=#C0FFC0>Your Music Rights have been taken."
								songmuted += list("[M.ckey]")
								SaveMute()
			if("Return Music Rights")
				if(songmuted == list() || songmuted == null)
					return
				var/ToMute = input("Who would you like to return the Music Rights of?","Music Rights") as null|anything in songmuted
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to return the Music Rights of [ToMute]?","Music Rights","Yes","No"))
					if("Yes")
						world << "<font color=#FFC0C0>[ToMute] has had their Music Rights returned by [src.name]."
						log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[ToMute] has had their music rights returned by [src.ckey].</font><br>"
						songmuted -= ToMute
						for(var/mob/M in world)
							if(ToMute == M.ckey)
								M.songmute = 0
								M << "<font color=#C0FFC0>Your Music Rights have been returned."
						SaveMute()

	Building_Rights()	//-- Give/Take Building Rights
		set category = "GM"
		set name = "Building Rights"
		set desc = "Take or remove someone's building rights."
		LoadMute()
		switch(input("What would you like to do?","Building Rights") as null|anything in list("Take Building Rights","Return Building Rights"))
			if("Take Building Rights")
				var/list/People = list()
				for(var/mob/M in world)
					if(M.client)
						if(M.NoBuild == 0)
							People += M.ckey
				var/ToMute = input("Who will you remove building rights from?","Building Rights") as null|anything in People
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to remove [ToMute]'s building rights?","Building Rights","Yes","No"))
					if("Yes")
						for(var/mob/M in world)
							if(M.ckey == ToMute)
								if(TGM.Find(M.ckey))
									return 0
								if(!M.client)return
								if(M.Mute == 1)
									return
								M.NoBuild = 1
								world << "<font color=#FFC0C0>[M] has had his or her building rights taken by [src.name]!"
								log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[M.ckey] has had their build rights taken by [src.ckey].</font><br>"
								M << "<font color=#C0FFC0>You have had your building rights taken."
								buildless += list("[M.ckey]")
								SaveMute()
			if("Return Building Rights")
				if(buildless == list() || buildless == null)
					return
				var/ToMute = input("Who would you like to restore building rights to?","Building Rights") as null|anything in buildless
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to return [ToMute]'s building rights?","Building Rights","Yes","No"))
					if("Yes")
						world << "<font color=#FFC0C0>[ToMute] has had their building rights returned by [src.name]."
						log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[ToMute] has had their build rights returned by [src.ckey].</font><br>"
						buildless -= ToMute
						for(var/mob/M in world)
							if(ToMute == M.ckey)
								M.NoBuild = 0
								M << "<font color=#C0FFC0>Your building rights have been returned."
						SaveMute()
	Kick()
		set category = "GM"
		set name = "Kick"
		set desc = "Eject someone from the server."
		var/list/People = list()
		for(var/mob/M in world)
			if(M.client)
				People += M.ckey
		var/Pick = input("Who will you kick from the server?","Kick") as null|anything in People
		if(!Pick)
			return 0
		switch(alert(src,"Are you sure you want to kick [Pick] from the server?","Kick","Yes","No"))
			if("Yes")
				for(var/mob/M in world)
					if(Pick == M.ckey)
						if(TGM.Find(M.ckey))
							return 0
						world << "<font color=#FFC0C0>[src.name] has kicked [M] ([M.key]) from the server."
						log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[M.ckey] has been kicked by [src.ckey].</font><br>"
						del(M)
						del(M.client)
	Ambush_Player()	//-- Goto Player
		set category = "GM"
		set name = "Ambush Player"
		set desc = "Goto any player in the world."
		var/list/people = list()
		for(var/mob/M in world)
			if(M.client)
				people += M
		var/mob/G = input("Who would you like to go to?","Ambush Player") as null|anything in people
		if(!G)
			return 0
		src.loc = G.loc
		usr << "<font color=#C0FFC0>You appear before [G]"
		G << "<font color=#FFC0C0>[usr.name] appears before you."

	Recall_Player()	//-- Summon Player
		set category = "GM"
		set name = "Recall Player"
		set desc = "Make any player in the world to come to you."
		var/list/people = list()
		for(var/mob/M in world)
			if(M.client)
				people += M
		var/mob/G = input("Who would you like to recall?","Recall Player") as null|anything in people
		if(!G)
			return 0
		if(G.Jailed == 1)
			return 0
		G.loc = src.loc
		usr << "<font color=#FFC0C0>[G] appears before you."
		G << "<font color=#C0FFC0>You appear before [usr.name]"
	Jail()
		set category="GM"
		set name="Jail"
		set desc="Jail/Unjail Players."
		switch(input("What would you like to do?","Jail") as null|anything in list("Jail Player","Unjail Player"))
			if("Jail Player")
				var/list/people = list()
				for(var/mob/M in world)
					if(M.client)
						people += M.ckey
				var/G = input("Who would you like to jail?","Jail") as null|anything in people
				if(!G)
					return 0
				else
					switch(alert(usr,"Are you sure you want jail [G]?","Jail","Yes","No"))
						if("Yes")
							for(var/mob/M in world)
								if(M.ckey == G)
									if(TGM.Find(M.ckey))
										return 0
									if(!M.client)return
									if(M.Jailed == 1)
										return
									M.loc= locate(20,57,2)
									world << "<font color=#FFC0C0>[M] has been arrested by [src.name]!"
									log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[M.ckey] has been jailed by [src.ckey].</font><br>"
									M.verbs.Remove(typesof(/mob/Basic/verb/))
									M.verbs.Remove(typesof(/mob/Customize/verb/))
									M.verbs.Remove(typesof(/mob/Build/verb/))
									M.Jailed = 1
									jailed += list("[M.ckey]")
									SaveMute()
			if("Unjail Player")
				if(jailed == list() || jailed == null)
					return
				var/ToMute = input("Who would you like to unjail?","Jail") as null|anything in jailed
				if(!ToMute)
					return 0
				switch(alert(src,"Are you sure you want to unjail [ToMute]?","Jail","Yes","No"))
					if("Yes")
						world << "<font color=#FFC0C0>[ToMute] been unjailed by [src.name]."
						log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000>[ToMute] has been unjailed by [src.ckey].</font><br>"
						jailed -= ToMute
						for(var/mob/M in world)
							if(ToMute == M.ckey)
								M.loc = locate(125,125,1)
								M.verbs.Add(typesof(/mob/Basic/verb/))
								M.verbs.Add(typesof(/mob/Customize/verb/))
								M.verbs.Add(typesof(/mob/Build/verb/))
								M.Jailed = 0
						SaveMute()
	Walkie(t as text)	//-- GMsay
		set category = "GM"
		set desc="Say something to all the GMs online."
		t = copytext(t,1)
		if(!t)
			return
		log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=808000>[src] walkies: [html_encode(copytext(t,1,255))]</font><br>"
		if(swear == 1)
			t = cFilter(t)
		for(var/mob/M in world)
			if(TGM.Find(M.ckey))
				M << "<p align=left>\icon[usr]<font color=yellow><i>[src.name] walkies: [html_encode(copytext(t,1,255))]"

	Announce(message as message)
		set category="GM"
		set name = "Announce"
		set desc = "Announce something to all players logged in"
		for(var/client/C)
			if(usr.ckey == "golddean")
				C.mob << {"<hr><center><b><font color=red><b>Announcement from the Creator, [src]:</b></b><br><font color=yellow>[message]</font></center><hr>"}
			else
				C.mob << {"<hr><center><font color=red><b>Announcement from [src]:</b><br><font color=yellow>[message]</font></center><hr>"}
			log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800000><b>[src] announces: [message].</b></font><br>"

mob/PGM/verb
	Check_Ignore_List()
		set category = "GM"
		set name = "View Ignore List"
		set desc = "View Someone's Ignore List."
		var/list/People = list()
		for(var/mob/M in world)
			if(M.client)
				People += M.ckey
		var/Pick = input("Whose ignore list would you like to see?","View Ignore List") as null|anything in People
		if(!Pick)
			return 0
		for(var/mob/M in world)
			if(Pick == M.ckey)
				if(M.ignorelist)
					var/this = input("Here is [M.ckey]'s ignore list.","View Ignore List") in M.ignorelist
					if(this)
						return 0
	Watch()
		set category = "GM"
		var/doo = list()
		doo += ("Stop Watching")
		for(var/mob/M in world)
			if(M.client)
				doo += M.ckey
		var/mob/LOL = input("Who would you like to watch?","Watch") as null|anything in doo
		if(!LOL)
			return 0
		if(LOL == "Stop Watching")
			track(usr)
			return 0
		else
			for(var/mob/D in world)
				if(D.ckey == LOL)
					if(TGM.Find(D.ckey)&&(!AGM.Find(usr.ckey)))
						return 0
					track(D)
					var/ZOMG = D
					while(!ZOMG)
						track(usr)
						return 0
	GM_edit(O as mob|obj)
		set category = "GM"
		var/list/varlist = list()
		if(AGM.Find(src.ckey))
			varlist = O:vars
		else
			if(istype(O,/mob))
				varlist = list("name","naymecol","fontclr","icon","icon_state","x","y","z","layer","opacity","dir","pixel_x","pixel_y")
			if(istype(O,/obj))
				varlist = list("name","owner","pword","icon","icon_state","x","y","z","layer","density","opacity","dir")
		var/variable = input("Which variable will you edit?","GM Edit") as null|anything in varlist
		if(!variable)
			return 0
		var/default
		switch(input("What kind of variable will you use?","GM Edit",default) as null|anything in list("Text","Number","Icon","File","Restore to Default"))
			if(null)
				return
			if("Restore to Default")
				O:vars[variable] = initial(O:vars[variable])
			if("Text")
				O:vars[variable] = input("Enter the new text to be used.","GM Edit", O:vars[variable]) as text
			if("Number")
				O:vars[variable] = input("Enter new number to be used.","GM Edit",O:vars[variable]) as num
			if("File")
				O:vars[variable] = input("Pick a file.","GM Edit",O:vars[variable]) as file
			if("Icon")
				O:vars[variable] = input("Pick an icon.","GM Edit",O:vars[variable]) as icon
		if(variable == "naymecol")
			src.nayme = "<font color=#[naymecol]>[src.name]"

mob/AGM/verb
	Ghost_Mode()
		set category = "GM"
		set name = "Ghost Mode"
		switch(input("Would you like to display a log in/out message?","Ghost Mode") as null|anything in list("Yes","No"))
			if("Yes")
				if(src.ghost)
					world << "<font color=#FFC0C0>[usr.ghostname] has connected."
				else
					world << "<font color=#FFC0C0>[usr] has left the server."
			if(null)
				return 0
		if(src.ghost)
			GhostOff(usr)
		else
			GhostOn(usr)

mob/UHM/verb
	Manage_GMs()
		set category = "Host"
		set name = "Manage GMs"
		switch(input("What would you like to do?","Manage GMs") as null|anything in list("Add GMs","Remove GMs"))//,"Manage Interns"))
			if(null)
				return 0
			if("Add GMs")
				var/list/People = list()
				for(var/mob/M in world)
					if(M.client)
						if(TGM.Find(M.ckey))
						else
							People += M.ckey
				if(!People)
					return 0
				var/take = input("Who would you like to give GM power to?","Manage GMs") as null|anything in People
				if(!take)
					return 0
				else
					for(var/mob/M in world)
						if(M.ckey == take)
							TGM+="[M.ckey]"
							M.verbs += typesof(/mob/TGM/verb/)
							world << "<font color=#FFC0C0>[M.ckey] has been given GM powers."
							alert(M,"You have been given GM powers.","GM")
			if("Remove GMs")
				var/peez = list()
				for(var/O as anything in TGM)
					if(PGM.Find(O))
					else
						peez += O
				if(!peez)
					alert(usr,"There are no TempGMs at the moment.","Manage GMs")
					return
				var/take = input("Who would you like to remove?","Manage GMs") as null|anything in peez
				if(!take)
					return
				else
					TGM -= "[take]"
					world << "<font color=#FFC0C0>[take] had his or her GM powers removed."
					for(var/mob/M as mob in world)
						if(take == M.ckey)
							M.verbs -= typesof(/mob/TGM/verb/)
							M.Flying = 0
							M.density = 1
							alert(M,"Your GM Powers have been taken away.","GM")
/*			if("Manage Interns")
				var/list/pebeas
				if(src.ckey == "golddean")
					pebeas = golddeanInterns
				if(src.ckey == "kirbydude")
					pebeas = kirbydudeInterns
				if(!pebeas)
					alert("You have no interns.","GM")
					return 0
				switch(input("What would you like to do?","Manage GMs") as null|anything in list("Give Intern his or her Powers","Remove Intern's Powers"))
					if(null)
						return 0
					if("Give Intern his or her Powers")
						var/take = input("Who would you like to give GM power to?","Manage GMs") as null|anything in pebeas
						if(!take)
							return 0
						else
							var/meh
							for(var/mob/M in world)
								if(M.ckey == take)
									meh = 1
									TGM+="[M.ckey]"
									PGM+="[M.ckey]"
									M.verbs += typesof(/mob/TGM/verb/)
									M.verbs += typesof(/mob/PGM/verb/)
									world << "<font color=#FFC0C0>[src.name]'s intern, [M.ckey] has been given his or her GM powers."
									alert(M,"[src.name] has given you your GM commands.","GM")
							if(!meh)
								alert("This intern isn't online right now.","Manage GMs")
								return 0
					if("Remove Intern's Powers")
						var/list/peez = list()
						for(var/mob/O in world)
							if(pebeas.Find(O.ckey))
								if(PGM.Find(O.ckey))
									peez += O
						if(!peez)
							alert("No interns have their power right now.","Manage GMs")
							return 0
						var/take = input("Whose intern commands will you remove?","Manage GMs") as null|anything in peez
						if(!take)
							return 0
						else
							for(var/mob/M in world)
								if(M.ckey == take)
									M.Flying = 0
									M.density = 1
									TGM-="[M.ckey]"
									PGM-="[M.ckey]"
									M.verbs -= typesof(/mob/TGM/verb/)
									M.verbs -= typesof(/mob/PGM/verb/)
									world << "<font color=#FFC0C0>[src.name]'s intern, [M.ckey] has had their GM commands removed."
									alert(M,"[src.name] has removed your GM commands.","GM")
*/
	Check_IP_Logs()
		set category = "GM"
		set desc = "Look at the IPs of everyone who has been on the server."
		if(!IPs)
			return 0
		src << link("byond://?src=\ref[src];action=ips")
	View_Chat_Logs()
		set category = "GM"
		set desc = "Look at all the chats from the server since its creation."
		switch(input("What would you like to do?","View Chat Logs") as null|anything in list("View Server Logs","Load Previous Log"))
			if(null)
				return 0
			if("View Server Logs")
				src << link("byond://?src=\ref[src];action=log")
			if("Load Previous Log")
				var/F = input(src,"Select a Chao Chatterz log file (.clog) to import","View Chat Logs") as null|file
				if(!F)
					return 0
				if(extension(F) == "clog")
					var/savefile/Objects = new/savefile (F)
					var/code
					Objects["Sig"] >> code
					if(code!="thisisachaolog")
						alert(src,"Your log file is invalid or corrupted.","View Chat Logs")
						return 0
					var/worldlog
					Objects["Log"]>>worldlog
					client << browse(worldlog)
mob/AGM/verb
	View_Chats()
		set category = "GM"
		set name = "Monitor Chat"
		set desc = "Allows you to enable/disable the ability to view everyone's chat activity."
		switch(input("What would you like to monitor?","Monitor Chat") as null|anything in list("Disable Monitoring","Monitor Say Activity","Monitor Whisper Activity","Monitor Say and Whisper Activity","Configure Whisper Activity"))
			if(null)
				return 0
			if("Disable Monitoring")
				src << "<font color=#C0FFC0>You are no longer monitoring chat activity."
				src.watchchat = 0
			if("Monitor Say Activity")
				src << "<font color=#C0FFC0>You are now monitoring all say activity."
				src.watchchat = 1
			if("Monitor Whisper Activity")
				src << "<font color=#C0FFC0>You are now monitoring all whisper activity."
				src.watchchat = 2
			if("Monitor Say and Whisper Activity")
				src << "<font color=#C0FFC0>You are now monitoring all say and whisper activity."
				src.watchchat = 3
			if("Configure Whisper Activity")
				switch(input("What would you like to do?","Monitor Chat") as null|anything in list("Ignore Player's Whisper Activity","Unignore Player's Whisper Activity"))
					if(null)
						return 0
					if("Ignore Player's Whisper Activity")
						var/list/Peepz = list()
						for(var/mob/M in world)
							if(TGM.Find(M.ckey))
								..()
							else
								Peepz += M.ckey
						if(!Peepz)
							return 0
						var/igadd = input("Whose whispers will you ignore?","Monitor Chat") as null|anything in Peepz
						if(!igadd)
							return 0
						else
							src << "<font color=#C0FFC0>[igadd] has been added it your whisper ignore list."
							src.nowhisp += igadd
					if("Unignore Player's Whisper Activity")
						var/igno = input("Who will you remove from your whisper ignore list?","Monitor Chat") as null|anything in nowhisp
						if(!igno)
							return 0
						else
							src << "<font color=#C0FFC0>[igno] has been removed from your whisper ignore list."
							src.nowhisp -= igno
mob/UHM/verb
	Clear_Objects()
		set category = "GM"
		set desc="Delete objects in bulk."
		switch(input("What would you like to do?","Clear Objects") as null|anything in list("Delete All the Objects in the World","Delete all Objects in Range"))
			if(null)
				return 0
			if("Delete All the Objects in the World")
				switch(alert("Are you sure you want to delete all the objects in the world?","Clear Objects","Yes","No"))
					if("Yes")
						for(var/obj/a in world.contents)
							if(a.owner)
								del a
						world << "<font color=#FFC0C0>[src.name] has deleted all of the objects in the world!"
			if("Delete all Objects in Range")
				var/i = input("Input a radius to delete objects. (0-9)","Clear Objects") as num
				if(i>9)
					i=9
				switch(alert("Are you sure you want to delete all the objects in a [i] tile radius?","Clear Objects","Yes","No"))
					if("Yes")
						for(var/obj/a in oview(i))
							if(a.owner)
								del a
mob/UHM
	verb
		UpdateHost(f as file)
			set category="Host"
			set name="Force Update"
			fdel("Chao Chatterz 2.dmb")
			fcopy(f,"Chao Chatterz 2.dmb")
			world << "The world will reboot as the hosting files have been updated."
			world.Reboot()

mob/ADM/verb
	Get_Location()
		set category = "GM"
		set desc = "Get your x, y and z coordinates."
		src << "<font color=#C0FFC0>Your location is [src.x], [src.y], [src.z]."
	Change_Coordinates()
		set category = "GM"
		set desc = "Change your X, Y and Z coordinates."
		var/tx = input(src,"Input your X coordinate.","Change Coordinates",src.x) as null|num
		var/ty = input(src,"Input your Y coordinate.","Change Coordinates",src.y) as null|num
		var/tz = input(src,"Input your Z coordinate.","Change Coordinates",src.z) as null|num
		if(!tx)
			tx = src.x
		if(!ty)
			ty = src.y
		if(!tz)
			tz = src.z
		src.x = tx
		src.y = ty
		src.z = tz
		src << "<font color=#C0FFC0>Your location is [src.x], [src.y], [src.z]."
proc
	GhostOff(var/mob/m)
		m.name = m.ghostname
		m.icon = m.ghosticon
		m.icon_state = m.icon_state
		m.density = 1
		m.Flying = 0
		m.ghost = 0
		m.invisibility = 0
	GhostOn(var/mob/m)
		m.ghostname = m.name
		m.ghosticon = m.icon
		m.ghosticon_state = m.icon_state
		m.ghost = 1
		m.icon = 'resource/ghost.dmi'
		m.icon_state = "null"
		m.name = null
		m.density = 0
		m.Flying = 1
		m.invisibility = 101