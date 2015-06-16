mob/Basic
	verb
		Say(t as text)	//-- The classic say verb.
			set category = "-Commands-"
			set desc="Say something. (Limited to 250 characters.)"
			t = copytext(t,1,250)
			if(!t)
				return
			if(usr.Mute == 1)
				usr << "<B><font color=#C0FFC0>You have been muted!"
				return
			else
				var/list/a = list()
				if(swear == 1)
					t = filter(t)
				if(usr.saysetting == 0)
					log += "([time2text(world.timeofday,"hh:mm:ss")])-[src.ckey] says: [html_encode(copytext(t,1,255))]<br>"
					for(var/mob/M in view())
						a += M.ckey
						if(M.ignorelist.Find(src.ckey))
						else
							M << "<P align=left>\icon[usr]<font color=teal><b>[src.nayme] says: <font color=#[src.fontclr]><b>[html_encode(copytext(t,1,255))]"
					for(var/mob/da in world)	//-- Monitoring
						if(AGM.Find(da.ckey))
							if(da.watchchat == 1 | da.watchchat == 3)
								if(a.Find(da.ckey))
								else
									da << "<P align=right><font size=-2>\icon[usr]<font color=teal><b>[src.name] says: <b>[html_encode(copytext(t,1,255))]"
				if(usr.saysetting == 1)
					log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800080>[src.ckey] shouts: [html_encode(copytext(t,1,255))]</font><br>"
					for(var/mob/M in world)
						if(M.ignorelist.Find(src.ckey))
						else
							M << "<P align=left>\icon[usr]<font color=red>[src.nayme] shouts: <font color=#[src.fontclr]>[html_encode(copytext(t,1,255))]"
				if(usr.saysetting == 2)
					log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=808000>[src.ckey] walkies: [html_encode(copytext(t,1,255))]</font><br>"
					for(var/mob/M in world)
						if(TGM.Find(M.ckey))
							M << "<P align=left>\icon[usr]<font color=yellow><i>[src.nayme] walkies: <font color=#[src.fontclr]>[html_encode(copytext(t,1,255))]"
		Say_Settings()
			set category = "-Commands-"
			set desc="Configure how your say verb is displayed."
			var/list/settings = list("To View Only","To World")
			if(PGM.Find(src.ckey))
				settings += "To GMs"
			switch(input("How would you like your say verb to be displayed?","Say Settings") as null|anything in settings)
				if(null)
					return 0
				if("To View Only")
					src << "<font color=#C0FFC0>Say now displays only to your view."
					src.saysetting = 0
				if("To World")
					src << "<font color=#C0FFC0>Say now displays to the world."
					src.saysetting = 1
				if("To GMs")
					src << "<font color=#C0FFC0>Say now displays only to GMs."
					src.saysetting = 2
		Shout(t as text)	//-- The classic shout verb.
			set category = "-Commands-"
			set desc="Say something for the entire world to hear. (Limited to 250 characters.)"
			t = copytext(t,1,250)
			if(!t)
				return
			if(usr.Mute == 1)
				usr << "<B><font color=#C0FFC0>You have been muted!"
				return
			else
				log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=800080>[src.ckey] shouts: [html_encode(copytext(t,1,255))]</font><br>"
				if(swear == 1)
					t = filter(t)
				for(var/mob/M in world)
					if(M.ignorelist.Find(src.ckey))
					else
						M << "<P align=left>\icon[usr]<font color=red>[src.nayme] shouts: <font color=#[src.fontclr]>[html_encode(copytext(t,1,255))]"
		Action(t as text)	//-- The emote.
			set category = "-Commands-"
			set desc="Do something for your screen to see. (Limited to 250 characters.)"
			t = copytext(t,1,250)
			if(!t)
				return
			if(usr.Mute == 1)
				usr << "<B><font color=#C0FFC0>You have been muted!"
				return
			else
				log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=008000>*[src.ckey] [html_encode(copytext(t,1,255))]*</font><br>"
				if(swear == 1)
					t = filter(t)
				var/list/a = list()
				for(var/mob/M in view())
					a += M.ckey
					if(M.ignorelist.Find(src.ckey))
					else
						M << "<P align=left>\icon[usr]<font color=green><b><i>*[src.nayme] <font color=#[src.fontclr]>[html_encode(copytext(t,1,255))]*"
				for(var/mob/da in world)	//-- Monitoring
					if(AGM.Find(da.ckey))
						if(da.watchchat == 1 | da.watchchat == 3)
							if(a.Find(da.ckey))
							else
								da << "<P align=right><font size=-2>\icon[usr]<font color=green><b><i>*[src.name] [html_encode(copytext(t,1,255))]*"
		Whisper(mob/M in world)	//-- The classic shout verb.
			set category = "-Commands-"
			set desc="Say something for a single person to hear. (Limited to 250 characters.)"
			var/t = input("What would you like to tell [M]?","Whisper") as null|text
			t = copytext(t,1,250)
			if(!t)
				return
			if(usr.Mute == 1)
				usr << "<B><font color=#C0FFC0>You have been muted!"
				return
			if(M.ignorelist.Find(src.ckey))
				usr << "<B><font color=#C0FFC0>You cannot whisper this person."
				return
			else
				log += "([time2text(world.timeofday,"hh:mm:ss")])-<font color=000080>[src.ckey] whispers to [M.ckey]: [html_encode(copytext(t,1,255))]</font><br>"
				if(swear == 1)
					t = filter(t)
				src << "<P align=left><font color=blue><b>(\icon[M]You whisper to [M]: [html_encode(copytext(t,1,255))])"
				M << "<P align=left><font color=blue><b>(\icon[usr][src.name] whispers to you: [html_encode(copytext(t,1,255))])"
				for(var/mob/da in world)	//-- Monitoring
					if(AGM.Find(da.ckey))
						if(da.watchchat == 2 | da.watchchat == 3)
							if(da.nowhisp.Find(src.ckey))
							else
								da << "<P align=right><font size=-2><font color=blue><b>(\icon[usr][src.name] whispers to \icon[M][M]: [html_encode(copytext(t,1,255))])"

		Goto_Player()	//-- Goto Player
			set category = "-Commands-"
			set name = "Goto Player"
			set desc = "Ask any player in the world to goto him or her."

			var/list/people = list()

			for(var/mob/M in world)
				if(M.client)
					people += M
			var/mob/G = input("Who would you like to go to?","Goto Player") as null|anything in people
			if(!G)
				return 0
			if(G.Jailed == 1)
				return 0
			if(G.ignorelist.Find(usr.ckey))
				return 0
			if(G.ignoretele)
				src << "This user is not accepting these requests right now."
				return 0
			switch(alert(G,"[src.name] wants to go to you. Do you accept?", "Goto Player", "Yes","No"))
				if("Yes")
					src.loc = G.loc
					usr << "<font color=#C0FFC0>You appear before [G]"
					G << "<font color=#FFC0C0>[usr.name] appears before you."
					return 0
				if("No")
					src << "<font color=#FFC0C0>[G] has declined your request."
					return 0

		Summon_Player()	//-- Summon Player
			set category = "-Commands-"
			set name = "Summon Player"
			set desc = "Ask any player in the world to come to you."

			var/list/people = list()

			for(var/mob/M in world)
				if(M.client)
					people += M
			var/mob/G = input("Who would you like to summon?","Summon Player") as null|anything in people
			if(!G)
				return 0
			if(G.ignorelist.Find(usr.ckey))
				return 0
			if(G.Jailed == 1)
				return 0
			if(G.ignoretele)
				src << "<font color=#FFC0C0>This user is not accepting these requests right now."
				return 0
			switch(alert(G,"[src.name] wants you to go to him or her. Do you accept?", "Summon Player", "Yes","No"))
				if("Yes")
					G.loc = src.loc
					usr << "<font color=#FFC0C0>[G] appears before you."
					G << "<font color=#C0FFC0>You appear before [usr.name]"
					return 0
				if("No")
					usr << "<font color=#FFC0C0>[G] has declined your request."
					return 0
		AFK()	//-- AFK Sign
			set category = "-Commands-"
			set name = "AFK"
			set desc = "Let the world know you are AFK."
			if(usr.AFK)
				for(var/mob/M in world)
					if(M.ignorelist.Find(usr.ckey))
					else
						M << "<font color=#FFC0C0>[src.name] Is Back"
				usr.overlays -= 'System/S-Overlays.dmi'
				src.AFK = 0
			else
				for(var/mob/M in world)
					if(M.ignorelist.Find(usr.ckey))
					else
						M << "<font color=#FFC0C0>[src.name] Is Now AFK"
				usr.overlays += 'System/S-Overlays.dmi'
				src.AFK = 1
		Send_File()	//-- Send file or trade files.
			set category = "-Commands-"
			set name = "Send Files"
			set desc = "Send or trade files with another player."

			var/list/people = list()

			switch(input("What would you like to do?","Send File") as null|anything in list("Send File","Trade Files"))
				if("Send File")		//-- Classic Send File System.
					for(var/mob/M in world)
						if(M.client&&!M.ghost)
							people += M.ckey
					var/select = input("Who would you like to send a file to?","Send File") as null|anything in people
					if(!select)
						return 0
					var/file = input("What file would you like to send to [select]?","Send File") as null|file
					if(!file)
						return 0
					switch(alert(src,"Are you sure you want to send [file] ([length(file)] bytes.) to [select]?","Send File","Yes","No"))
						if("Yes")
							for(var/mob/TO in world)
								if(TO.ckey == select)
									if(TO.ignorelist.Find(usr.ckey))
									else
										switch(alert(TO,"[src.name] would like to send you [file] ([length(file)] bytes.) Do you accept the file?","Send File","Yes","No"))
											if("Yes")
												alert(src,"[select] has accepted the file, [file].","Send File")
												TO<<ftp(file)
											if("No")
												alert(src,"[select] has declined the file, [file].","Send File")
												return
				if("Trade Files")	//-- Secure Trade System
					for(var/mob/M in world)
						if(M.client&&!M.ghost)
							people += M.ckey
					var/select = input("Who would you like to initiate trade with?","Send File") as null|anything in people
					if(!select)
						return 0
					switch(alert(src,"Are you sure you want to initiate trade with [select]?","Send File","Yes","No"))
						if("Yes")
							for(var/mob/T1 in world)
								if(T1.ckey == select)
									if(T1.ignorelist.Find(usr.ckey))
									else
										switch(alert(T1,"[src.name] would like to initiate a trade. Do you accept?","Send File","Yes","No"))
											if("Yes")
												var/F1 = input(src,"What file would you like to send to [select]?","Send File") as null|file
												var/F2 = input(T1,"What file would you like to send to [select]?","Send File") as null|file
												switch(alert(T1,"[src.name] would like to send you [F1] ([length(F1)] bytes.) for your [F2] ([length(F2)]) bytes.) Do you accept this trade?","Send File","Yes","No"))
													if("Yes")
														switch(alert(src,"[T1] would like to send you [F2] ([length(F2)] bytes.) for your [F1] ([length(F1)]) bytes.) Do you accept this trade?","Send File","Yes","No"))
															if("Yes")
																src<<ftp(F2)
																T1<<ftp(F1)
																alert(src,"The trade has been completed.","Send File")
																alert(T1,"The trade has been completed.","Send File")
																return 0
															if("No")
																alert(src,"[src.name] has declined your offer of [F2].","Send File")
													if("No")
														alert(src,"[T1] has declined your offer of [F1].","Send File")
														return 0
											if("No")
												alert(src,"[T1] has declined your trade request.","Send File")
												return 0
		Check_Player(O as mob)
			set desc="Investigate Something"
			set category = null
			if(TGM.Find(usr.ckey))
				if(maskedip.Find(O:client.address))
					usr << "<font color=#B8B8B8><font size=5>{<BIG>\icon[O]</BIG>}</font><br>Character Name: [O:name]<br>Key: [O:ckey]<br>IP: Masked</font>"
				else
					usr << "<font color=#B8B8B8><font size=5>{<BIG>\icon[O]</BIG>}</font><br>Character Name: [O:name]<br>Key: [O:ckey]<br>IP: [O:client.address]</font>"
				return
			else
				usr << "<font color=#B8B8B8><font size=5>{<BIG>\icon[O]</BIG>}</font><br>Character Name: [O:name]<br>Key: [O:key]</font>"
		Check_Object(O as obj)
			set desc="Investigate Something"
			set category = null
			if(istype(O,/obj))
				if(O:owner)
					usr << "<font color=#B8B8B8><font size=5>{<BIG>\icon[O]</BIG>}</font><br>Name: [O:name] <br>Owner: [O:owner]</font>"
		Goto_Start()
			set category = "-Commands-"
			set desc = "Send your character to start."
			src.loc = locate(125,125,1)
		Ignore()
			set category = "-Commands-"
			set desc = "Ignore a player."
			switch(input("What would you like to do?","Ignore") as null|anything in list("Ignore a Player","Unignore a Player","Ignore Teleport Requests","Ignore Family Requests"))
				if(null)
					return 0
				if("Ignore a Player")
					var/list/Peepz = list()
					for(var/mob/M in world)
						if(TGM.Find(M.ckey))
							..()
						else
							Peepz += M.ckey
					if(!Peepz)
						return 0
					var/igadd = input("Who will you ignore?","Ignore") as null|anything in Peepz
					if(!igadd)
						return 0
					else
						src << "<font color=#C0FFC0>[igadd] has been added it your ignore list."
						src.ignorelist += igadd
				if("Unignore a Player")
					var/igno = input("Who will you remove from your ignore list?","Ignore") as null|anything in ignorelist
					if(!igno)
						return 0
					else
						src << "<font color=#C0FFC0>[igno] has been removed from your ignore list."
						src.ignorelist -= igno
				if("Ignore Teleport Requests")
					switch(input("Do you want to allow or disallow teleport requests?","Ignore") as null|anything in list("Allow","Disallow"))
						if("Allow")
							src.ignoretele = 0
						if("Disallow")
							src.ignoretele = 1
						else
							return 0
				if("Ignore Family Requests")
					switch(input("Do you want to allow or disallow family requests?","Ignore") as null|anything in list("Allow","Disallow"))
						if("Allow")
							src.ignorefami = 0
						if("Disallow")
							src.ignorefami = 1
						else
							return 0
		Who()
			set category = "-Commands-"
			set desc = "Look at all the people online."
			for(var/mob/M in world)
				if(M.ghost)
					..
				else
					if(AGM.Find(usr.ckey))
						src << "\icon[M] [TGM.Find(M.ckey)? "(GM) ":null][M.name] - Key: [M.key] - IP: [maskedip.Find(M.client.address)? "Masked":"[M.client.address]"]"
					else
						src << "\icon[M] [TGM.Find(M.ckey)? "(GM) ":null][M.name] - Key: [M.key]"
		View_Song()
			set name = "Play Song to View"
			set category = "-Commands-"
			set desc = "Play a song for everyone onscreen."
			if(usr.songmute == 1)
				usr << "<B><font color=#C0FFC0>You cannot play songs!"
				return
			if(soundopt == 2)
				alert(src,"Music is currently disabled.","Play Music to View")
				return 0
			var/sound = input("What song would you like to play?","Play Music to View") as null|sound
			if(!sound)
				return 0
			if(soundopt == 1)
				if(extension(sound) != "mid")
					alert(usr,"Only MIDI files are allowed at the moment.","Play Music to View")
					return 0
			var/size = length(sound)
			Size(size)
			if(length(sound) > musicsize)
				alert(usr,"[sound] ([filemsg]) is above the maximum sound size ([musicsizemsg].)","Play Music to View")
				return 0
			else
				switch(alert(usr,"Are you sure you want to play [sound] ([filemsg]) to your view?","Play Music to View","Yes","No"))
					if("Yes")
						for(var/mob/M in view())
							M << "[usr.name] plays [sound]!"
							M << sound(null)
							M << sound(sound)
		Self_Song()
			set name = "Play Song to Self"
			set category = "-Commands-"
			set desc = "Play a song for you to hear."
			if(usr.songmute == 1)
				usr << "<B><font color=#C0FFC0>You cannot play songs!"
				return
			if(soundopt == 2)
				alert(src,"Music is currently disabled.","Play Music to Self")
				return 0
			var/sound = input("What song would you like to play?","Play Music to Self") as null|sound
			if(!sound)
				return 0
			if(soundopt == 1)
				if(extension(sound) != "mid")
					alert(usr,"Only MIDI files are allowed at the moment.","Play Music to Self")
					return 0
			var/size = length(sound)
			Size(size)
			if(length(sound) > musicsize)
				alert(usr,"[sound] ([filemsg]) is above the maximum sound size ([musicsizemsg].)","Play Music to Self")
				return 0
			else
				switch(alert(usr,"Are you sure you want to play [sound] ([filemsg]) to yourself?","Play Music to Self","Yes","No"))
					if("Yes")
						usr << "You play [sound] to yourself!"
						usr << sound(null)
						usr << sound(sound)
		Stop_Music()
			set name = "Stop Music"
			set category = "-Commands-"
			set desc = "Stops all music you hear."
			usr << "All music has been stopped for you only."
			usr << sound(null)
		SOS()
			set category="-Commands-"
			set desc="Call for help from a online GM"
			for(var/L in SOS)
				var/tmp/theirkey = copytext(L,1,findtext(L," ("))
				if(theirkey==src.ckey)
					alert(src,"You are already in the SOS list. Please wait while a GM gets to you","SOS!")
					return 0
			switch(alert(usr,"Add yourself to the SOS List?","SOS!","Yes","No"))
				if("Yes")
					SOS+="[src.name] ([src.ckey])"
					for(var/mob/M in world)
						if(PGM.Find(M.ckey))
							M<<"[src.name] ([src.ckey]) is seeking help"
				else
					return 0
proc
	World_Song()
		if(usr.songmute == 1)
			usr << "<B><font color=#C0FFC0>You cannot play songs!"
			return
		if(soundopt == 2)
			alert(src,"Music is currently disabled.","Play Music to World")
			return 0
		if(woundopt == 1)
			alert(src,"Playing music to the world is currently disabled.","Play Music to World")
			return 0
		var/sound = input("What song would you like to play?","Play Music to World") as null|sound
		if(!sound)
			return 0
		if(soundopt == 1)
			if(extension(sound) != "mid")
				alert(usr,"Only MIDI files are allowed at the moment.","Play Music to World")
				return 0
		var/size = length(sound)
		Size(size)
		if(length(sound) > musicsize)
			alert(usr,"[sound] ([filemsg]) is above the maximum sound size ([musicsizemsg].)","Play Music to World")
			return 0
		else
			switch(alert(usr,"Are you sure you want to play [sound] ([filemsg]) to the world?","Play Music to World","Yes","No"))
				if("Yes")
					world << "[usr.name] plays [sound] for everyone!"
					world << sound(null)
					world << sound(sound)
