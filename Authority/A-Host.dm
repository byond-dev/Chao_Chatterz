mob/UHM/verb
	Shutdown_Server()
		set category = "Host"
		set name = "Shutdown Server"
		set background = 1
		if(gonnadie == 1)
			return 0
		switch(alert(usr,"Are you sure you want to shut down the server?","Shut Down","Yes","No"))
			if("Yes")
				gonnadie = 1
				world<<"<font color=#FFFFC0>[src.name] will be be shutting down the server in 1 minute!"
				sleep(300)
				world<<"<font color=#FFFFC0>The server will be shutting down in 30 seconds!"
				sleep(200)
				world<<"<font color=#FFFFC0>The server will be shutting down in 10 seconds!"
				sleep(50)
				world<<"<font color=#FFFFC0>The server will be shutting down in 5 seconds!"
				sleep(50)
				world<<"<font color=#FFFFC0>The server is now shutting down!"
				del(world)
	Reboot()
		set name="Reboot"
		set desc="Reboots the world."
		set category= "Host"
		set background = 1
		if(gonnadie == 1)
			return 0
		if(alert("Are you sure you want to reboot?","Reboot World.","Yes","No") == "Yes")
			if(alert("Do you want to issue a warning?","Reboot World","Yes","No") == "Yes")
				gonnadie = 1
				world<<"<font color=#FFFFC0>[src.name] will be be rebooting the server in 1 minute!"
				sleep(300)
				world<<"<font color=#FFFFC0>The server will be rebooting in 30 seconds!"
				sleep(200)
				world<<"<font color=#FFFFC0>The server will be rebooting in 10 seconds!"
				sleep(50)
				world<<"<font color=#FFFFC0>The server will be rebooting in 5 seconds!"
				sleep(50)
				world<<"<font color=#FFFFC0>The server is now rebooting!"
			world.Reboot()
	Count_Objects()
		set category= "Host"
		set name="Tally Server"
		set desc="Counts the number of objects in the world."
		var/towho
		switch(input("Would you like to show the results to the world?","Tally Server") as null|anything in list("Show results to world.","Keep results private."))
			if(null)
				return 0
			if("Show results to world.")
				towho=1
			if("Keep results private.")
				towho=2
		var/Num=0
		var/Num2=0
		Countppl()
		for(var/obj/O in world.contents)
			if(O.owner)
				Num2+=1
			Num+=1
		sleep(15)
		if(towho==1)
			world<<"<font color=#FFFFC0><b><u><center>[src.name] counted...</u><br><center>...<font color=#00FFFF>[Num2]/[Num]/65535</font> items...<br><center>...<font color=#FF0000>[People]/[maxpeeps]</font> mobs...<br><center><u>...present in the world.</u>"
		else
			alert(usr,"There are [Num2]/[Num]/65535 objects and [People]/[maxpeeps] mobs in the world.","Tally Server")
	Set_Limits()
		set category="Host"
		set name = "Configure Server"
		set desc = "Allows you to change the server's settings."
		var/list/options = list("Change World Name","Change Host Name","Toggle Cuss Filters","Set Building Limits","Set Sound File Size Limits","Enable/Disable Music","Enable/Disable Play to World","Set Icon File Size Limits","Set Player Limit","Open/Lock Server","Change Server Password","Change Server Theme","Change Server Sky")
		switch(input("What limits would you like to configure?","Configure Server") as null|anything in options)
			if("Change World Name")
				var/name = input("What would you like to set the world's name to?","Configure Server","[world.name]") as null|text
				if(!name)
					return 0
				else
					world.name = name
					Countppl()
					Getstats()
			if("Change Host Name")
				var/name = input("What would you like to set the host's name to? Note that this does not change who is hosting.","Configure Server","[HostMSG]") as null|text
				if(!name)
					return 0
				else
					HostMSG = name
					Countppl()
					Getstats()
			if("Toggle Cuss Filters")	//-- Swear Filters
				switch(alert("Would you like to turn the Swear Filters on or off?","Configure Server","On","Off"))
					if("On")
						swear=1
						world << "<font color=#FFFFC0>Swear filters have been enabled!"
					if("Off")
						swear=0
						world << "<font color=#FFFFC0>Swear filters have been disabled!"
			if("Set Building Limits")
				var/n = input(src,"What would you like to set the maximum number of built objects to?","Configure Server",BMax) as null|num
				if(n == null)
					return 0
				if(n >= 999999)
					n = 999999
				BMax = n
				world<<"<font color=#FFFFC0>The maximum number of objects per key has been set to [BMax]."
			if("Set Sound File Size Limits")
				var/n = input(src,"What would you like to set the maximum size of sound files to (in bytes)?","Configure Server",musicsize) as null|num
				if(n == null)
					return 0
				if(n >= 999999)
					n = 999999
				Size(n)
				musicsize = n
				musicsizemsg = filemsg
				world<<"<font color=#FFFFC0>The maximum file size for sound files has been set to [filemsg]."
			if("Enable/Disable Music")
				switch(input("What would you like to do?","Configure Server") as null|anything in list("Enable All Sounds","Enable MIDI Files Only","Disable All Sounds"))
					if("Enable All Sounds")
						world << "<font color=#FFFFC0>All Music has been enabled."
						soundopt = 0
						world << sound(null)
						return 0
					if("Enable MIDI Files Only")
						world << "<font color=#FFFFC0>Only MIDIs may be played now."
						soundopt = 1
						world << sound(null)
						return 0
					if("Disable All Sounds")
						world << "<font color=#FFFFC0>All Music has been disabled."
						soundopt = 2
						world << sound(null)
						return 0
					else
						return 0
			if("Enable/Disable Play to World")
				switch(input("Would you like to enable or disable playing to the world?","Configure Server") as null|anything in list("Enable World Play","Disable World Play"))
					if(null)
						return 0
					if("Enable World Play")
						world << "<font color=#FFFFC0>World play has been enabled."
						woundopt = 0
					if("Disable World Play")
						world << "<font color=#FFFFC0>World play has been disabled."
						woundopt = 1
			if("Set Icon File Size Limits")
				var/n = input(src,"What would you like to set the maximum size of icon files to (in bytes)?","Configure Server",iconsize) as null|num
				if(n == null)
					return 0
				if(n >= 999999)
					n = 999999
				Size(n)
				iconsize = n
				iconsizemsg = filemsg
				world<<"<font color=#FFFFC0>The maximum file size for icons has been set to [filemsg]."
			if("Set Player Limit")
				Countppl()
				var/n = input(src,"What would you like to set the maximum number of connections to?","Configure Server",maxpeeps) as null|num
				if(n == null)
					return 0
				if(n >= 999999)
					n = 999999
				if(People > n)
					alert(src,"There are too many players connected at the moment to adjust this setting.","Configure Server")
					return 0
				maxpeeps = n
				world<<"<font color=#FFFFC0>The maximum number of connections has been set to [maxpeeps] people."
			if("Open/Lock Server")
				switch(alert("Would you like to open or lock the server?","Configure Server","Open","Lock","Cancel"))
					if("Open")
						Open=1
						world << "<font color=#FFFFC0>The server is now accepting new connections."
					if("Lock")
						Open=0
						world << "<font color=#FFFFC0>The server is no longer accepting new connections."
					if("Cancel")
						return 0
			if("Change Server Password")
				switch(input("Would you like to change the server's password?","Configure Server") as null|anything in list("Change Password","Delete Password"))
					if("Change Password")
						var/inpo = input("What would you like to set the server's password to?","Configure Server",conpass) as null|text
						if(!inpo)
							return 0
						var/inpa = lowertext(inpo)
						conpass = inpa
						world << "<font color=#FFFFC0>The server has been password protected."
					if("Delete Password")
						conpass = null
						world << "<font color=#FFFFC0>The server is no longer password protected."
					else
						return 0
			if("Change Server Theme")
				var/theme = input("What theme would you like?","Configure Server") as null|anything in list("Asphalt","Chocolate!","Cookie","Dance!","Dirt","Grass","Ice","Mansion","Metal","Ocean","Sand","Sky","Snow","Space","Tron","Volcanic")
				if(!theme)
					return 0
				for(var/turf/theme/o in world)
					if(istype(o,/turf/theme/Grass))
						//--Regular
						if(theme == "Grass")
							o.icon_state = "grass"
						if(theme == "Dirt")
							o.icon_state = "dirt"
						if(theme == "Asphalt")
							o.icon_state = "road"
						if(theme == "Ocean")
							o.icon_state = "water"
						if(theme == "Dance!")
							o.icon_state = "dance"
						if(theme == "Mansion")
							o.icon_state = "mansion"
						if(theme == "Metal")
							o.icon_state = "metal"
						if(theme == "Ice")
							o.icon_state = "ice"
						//--Dynamic

						if(theme == "Sky")
							var/g = rand(1,rand(10,60))
							if(g==10)
								o.icon_state = "sky2"
							else
								o.icon_state = "sky1"
						if(theme == "Snow")
							var/g = rand(1,10000)
							if(g==6700)
								o.icon_state = "snow2"
							else
								o.icon_state = "snow1"
						if(theme == "Sand")
							var/g = rand(1,10)
							if(g>=9)
								g = rand(1,10)
							o.icon_state = "sand[g]"
						if(theme == "Space")
							var/g = rand(1,10)
							if(g>=9)
								g = rand(1,10)
							o.icon_state = "space[g]"
						if(theme == "Cookie")
							var/g = rand(1,8)
							o.icon_state = "cookie[g]"
						if(theme == "Chocolate!")
							var/g = rand(1,12)
							o.icon_state = "choc[g]"
						if(theme == "Tron")
							var/g = rand(1,8)
							o.icon_state = "tron[g]"
						if(theme == "Volcanic")
							var/g = rand(1,2)
							o.icon_state = "volcano[g]"
				world << "<font color=#FFFFC0>The server's theme is now [theme]!"
	Clean_server()
		set category = "Host"
		set desc="Various options for cleaning out the server."
		switch(input("What would you like to do?","Clean Server") as null|anything in list("Delete All the Objects in the World","Delete the Objects of Inactive Players"))
			if(null)
				return 0
			if("Delete All the Objects in the World")
				switch(alert("Are you sure you want to delete all the objects in the world?","Clean Server","Yes","No"))
					if("Yes")
						for(var/obj/a in world.contents)
							if(a.owner)
								del a
						world << "<font color=#FFC0C0>[src.name] has deleted all of the objects in the world!"
			if("Delete the Objects of Inactive Players")
				switch(alert("Are you sure you want to delete the objects of inactive players?","Clean Server","Yes","No"))
					if("Yes")
						var/list/Peez = list()
						for(var/mob/M in world)
							Peez += M.ckey
						for(var/obj/O in world)
							if(O.owner)
								if(!Peez.Find(O.owner))
									del O
						world << "<font color=#FFC0C0>[src.name] has deleted the objects of inactive players!"
	Check_PagerBans()
		set category = "Host"
		set desc = "Verify who is and isn't pagerbanned."
		LoadBan()
		var/list/tehpage = world.GetConfig("keyban")
		if(!tehpage)
			alert("You haven't pagerbanned anyone!","PagerBans")
		switch(input("These are the keys you have pagerbanned.","PagerBans") as anything in tehpage)
			if("Gold Dean")
				alert("Yeah, that's not a good idea, buddy.","PagerBans")
				return 0
			else
				return 0