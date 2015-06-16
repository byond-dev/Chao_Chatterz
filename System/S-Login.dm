mob/startup/Login
	Login()
		src.Startup()

	proc
		Startup()
			var/screen = rand(8)
			if(screen==1||screen==2||screen==3)
				src.loc = locate(10,10,2)
			if(screen==4||screen==5)
				src.loc = locate(30,10,2)
			if(screen==6||screen==7)
				src.loc = locate(10,30,2)
			if(screen==8)
				src.loc = locate(30,30,2)

			var/list/characters = src.CharacterList()
			var/newCharacterChoice = "Create new character"
			var/DeleteCharacterChoice = "Delete a character"
			var/ImportCharacterChoice = "Import a Character"
			var/list/menu = new()
			menu += characters
			menu += newCharacterChoice
			menu += DeleteCharacterChoice
			menu += ImportCharacterChoice

			sleep(20)
			src << link("byond://?src=\ref[src];action=manu")
			alert("Please make sure you have read and understand all the rules.","Chao Chatterz")
			var/result = input("Welcome to Chao Chatterz. Please select a character or create a new one.", "Chao Chatterz") in menu

			if (result == newCharacterChoice)
				src.Create_New_Character()
			if (result == DeleteCharacterChoice)
				src.DeleteCharacter()
				src.Startup()
			if (result == ImportCharacterChoice)
				src.client.ImportMob()
			else
				var/success = src.client.LoadMob(result)
				if (success)
					del(src)
				else
					alert("Sorry, unable to load that character!")
					src.Startup()

		CharacterList()
			var/savefile/F = new("Save Data/Users.sav")
			F.cd = "/[ckey]"
			var/list/characters = F.dir
			return characters
	proc
		Create_New_Character()
			var/tmp/findlogin
			var/mob/new_mob
			var/kaname = input(src,"What would you like to name this character? (Limited to 24 characters.)","Chao Chatterz",src.key) as text
			var/lastname = "[copytext(kaname,1,24)]"
			switch(input("What type of Chao would you like to be?","Chao Chatterz") in list("Neutral Chao","Hero Chao","Dark Chao","Dragon Chao", "Lava Chao", "Floral Chao", "Nights Chao", "Fin Chao", "Beetle Chao", "Volcano Chao", "Neon Chao", "Sonic Chao","Tails Chao","Knuckles Chao","Shadow Chao"))
				if ("Neutral Chao")
					new_mob = new /mob/characters/NeutralChao()
				if ("Hero Chao")
					new_mob = new /mob/characters/HeroChao()
				if ("Dark Chao")
					new_mob = new /mob/characters/DarkChao()
				if ("Dragon Chao")
					new_mob = new /mob/characters/HeroDragonChao()
				if ("Lava Chao")
					new_mob = new /mob/characters/HeroLavaChao()
				if ("Floral Chao")
					new_mob = new /mob/characters/HeroFloralChao()
				if ("Nights Chao")
					new_mob = new /mob/characters/DarkNightsChao()
				if ("Fin Chao")
					new_mob = new /mob/characters/DarkFinChao()
				if ("Volcano Chao")
					new_mob = new /mob/characters/NeutralVolcanoChao()
				if ("Beetle Chao")
					new_mob = new /mob/characters/NeutralBeetleChao()
				if ("Neon Chao")
					new_mob = new /mob/characters/NeutralNeonChao()
				if ("Sonic Chao")
					new_mob = new /mob/characters/SonicChao()
				if ("Tails Chao")
					new_mob = new /mob/characters/TailsChao()
				if ("Knuckles Chao")
					new_mob = new /mob/characters/KnucklesChao()
				if ("Shadow Chao")
					new_mob = new /mob/characters/ShadowChao()
			if(TGM.Find(src.ckey)&&!AGM.Find(src.ckey))
				switch(alert(src,"Do you want to login silently?","Chao Chatterz","Yes","No"))
					if("Yes")
						findlogin=1
			if(AGM.Find(src.ckey))
				switch(alert(src,"Do you want to login silently?","Chao Chatterz","Yes","No","Ghost"))
					if("Yes")
						findlogin=1
					if("Ghost")
						findlogin=2
			new_mob.name = "[Remove_HTML(lastname)]"
			src.client.mob = new_mob
			if(!findlogin)
				world << "<font color=#FFC0C0>[new_mob] has connected."
				new_mob.loc = locate(125,125,1)
			if(findlogin==1)
				new_mob.loc = locate(3,248,2)
			if(findlogin==2)
				GhostOn(new_mob)
				new_mob.loc = locate(3,248,2)
			log += "([time2text(world.timeofday,"hh:mm:ss")])-<i><font color=800080>[src.ckey] enters the server.</font></i><br>"
			Countppl()

	proc/DeleteCharacter()
		var/savefile/F = new("Save Data/Users.sav")

		F.cd = "/[ckey]"
		var/list/characters = F.dir

		var/CancelCharacterDeletion = "Cancel"
		var/list/menu = new()
		menu += characters
		menu += CancelCharacterDeletion

		var/result = input("Which character will you delete?", "Chao Chatterz") in menu

		if (result)
			F.cd = "/[ckey]"
			F.dir.Remove(result)
		if (result == CancelCharacterDeletion)
			src.Startup()
		else
			src.Startup()

client/proc/SaveMob()
	var/gaka = "[usr.ckey]"
	if(usr.ghost)
		GhostOff(usr)
	else
		world << "<font color=#FFC0C0>[usr] has left the server."
	log += "([time2text(world.timeofday,"hh:mm:ss")])-<i><font color=800080>[src.ckey] exits the server.</font></i><br>"
	if(usr.client.address)
		IPs += "[usr.client.address] - [usr.ckey]"
	var/savefile/F = new("Save Data/Users.sav")
	var/char_ckey = ckeyEx(src.mob.name)
	F["/[ckey]/[char_ckey]"] << src.mob
	SaveMute()
	SaveBan()
	src.mob.overlays = null
	src.mob.underlays = null
	del(src.mob)
	Countppl()
	Getstats()
	if(AGM.Find(gaka))
		var/list/PEBE = list()
		if(gaka == "{!!!}")
			PEBE = golddeanInterns
		if(PEBE)
			for(var/mob/M in world)
				if(PGM.Find(M.ckey))
					if(PEBE.Find(M.ckey))
						M.Flying = 0
						M.density = 1
						TGM-="[M.ckey]"
						PGM-="[M.ckey]"
						M.verbs -= typesof(/mob/TGM/verb/)
						M.verbs -= typesof(/mob/PGM/verb/)
						world << "<font color=#FFC0C0>[gaka] has logged out. His intern, [M.ckey], has lost his or her GM commands."

client/Del()
	if(src.mob && istype(src.mob,/mob/characters))
		src.SaveMob()
	del(src.mob)
	. = ..()

client/proc/LoadMob(char_ckey)
	var/mob/new_mob
	var/tmp/findlogin
	if(TGM.Find(src.ckey)&&!AGM.Find(src.ckey))
		switch(alert(src,"Do you want to login silently?","Chao Chatterz","Yes","No"))
			if("Yes")
				findlogin=1
	if(AGM.Find(src.ckey))
		switch(alert(src,"Do you want to login silently?","Chao Chatterz","Yes","No","Ghost"))
			if("Yes")
				findlogin=1
			if("Ghost")
				findlogin=2
	var/savefile/F = new("Save Data/Users.sav")
	F["/[ckey]/[char_ckey]"] >> new_mob
	LoadMute()
	if (!new_mob)
		return 0
	else
		if(!findlogin)
			world << "<font color=#FFC0C0>[new_mob] has connected."
		if(findlogin==1)
			new_mob.loc = locate(3,248,2)
		if(findlogin==2)
			GhostOn(new_mob)
			new_mob.loc = locate(3,248,2)
		Countppl()
		log += "([time2text(world.timeofday,"hh:mm:ss")])-<i><font color=800080>[src.ckey] enters the server.</font></i><br>"
		return 1

client/proc/ImportMob()
	var/mob/new_mob
	var/tmp/findlogin
	var/tmp/code
	if(alert(src,"Are you sure you want to import a savefile?","Chao Chatterz","Yes","No") == "Yes")
		if(TGM.Find(src.ckey)&&!AGM.Find(src.ckey))
			switch(alert(src,"Do you want to login silently?","Chao Chatterz","Yes","No"))
				if("Yes")
					findlogin=1
		if(AGM.Find(src.ckey))
			switch(alert(src,"Do you want to login silently?","Chao Chatterz","Yes","No","Ghost"))
				if("Yes")
					findlogin=1
				if("Ghost")
					findlogin=2
		var/F = input(src,"Select a Chao Chatterz character file (.CC2) to import","Chao Chatterz") as file
		if(extension(F) == "CC2")
			var/savefile/S = new/savefile (F)
			S["code"] >> code
			if(code!=expcode)
				alert(src,"Your save file is invalid, corrupt or outdated.","Chao Chatterz")
				del(S)
				usr:Startup()
				return 1
			S["mob"] >> new_mob
			LoadMute()
			if (!new_mob)
				return 0
			else
				if(!findlogin)
					world << "<font color=#FFC0C0>[new_mob] has connected."
					new_mob.loc = locate(125,125,1)
				if(findlogin==1)
					new_mob.loc = locate(3,248,2)
				if(findlogin==2)
					GhostOn(new_mob)
					new_mob.loc = locate(3,248,2)
				for(var/mob/c in world)
					if(!c.ckey&&c.name == src.ckey)
						del(c)
				for(var/yep in usr.undurlays)
					usr.underlays+=yep
				for(var/yep in usr.ovurlays)
					usr.overlays+=yep
				Countppl()
				log += "([time2text(world.timeofday,"hh:mm:ss")])-<i><font color=800080>[src.ckey] enters the server.</font></i><br>"
				return 1
		else
			alert(src,"Invalid File!","Chao Chatterz")
			usr:Startup()
	else
		usr:Startup()

mob
	Login()
		..()

	Write(savefile/F)
		..()

		F["last_x"] << x
		F["last_y"] << y
		F["last_z"] << z

	Read(savefile/F)
		..()

		var/last_x
		var/last_y
		var/last_z
		F["last_x"] >> last_x
		F["last_y"] >> last_y
		F["last_z"] >> last_z
		loc = locate(last_x, last_y, last_z)