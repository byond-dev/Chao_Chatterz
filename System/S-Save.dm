mob/UHM/verb
	Save()
		set category= "Host"
		set name="Save World"
		set desc="Saves all objects in the world."
		if(gonnadie == 1)
			alert("You can't do this while the server is about to disconnect.","Save World")
			return 0
		switch(input("What would you like to do?","Save World") as null|anything in list("Save World","Load World"))
			if(null)
				return 0
			if("Save World")
				world<<"<font color=#FFFFC0>[src.name] is saving the world. Please stand by..."
				var/tehverld = world.status
				var/finame = input("What would you like to save this world as?", "Save world") as text
				world.status = "<font color=#FFFFC0><b>World is saving. Please wait.</b></font>"
				var/list/icons = list()
				var/savefile/Objects = new/savefile("Save Data/Worlds/[copytext(finame,1)].C2W")
				Objects["Sig"]<<mapcode
				var/Num=0
				Getstats()
				for(var/obj/O in world.contents)
					if(O.owner)
						Objects["Object[++Num]"]<<O
						Objects["Num"]<<Num
						Objects << O.x
						Objects << O.y
						Objects << O.z
				for(var/I in Objects)
					if(isfile(I))
						if(!icons.Find(I))
							icons += I
						else
							del(I)
				Objects << icons
				Objects["Num"]<<Num
				world.status = tehverld
				Getstats()
				world<<"<font color=#FFFFC0>[src.name] has saved [Num] Object\s successfully!"
				src << ftp("Save Data/Worlds/[copytext(finame,1)].C2W")
				return 0
			if("Load World")
				switch(alert(usr,"Are you sure you want to load the world? The current world will be deleted!","Load World","Yes","No"))
					if("Yes")
						var/tehverld = world.status
						world<<"<font color=#FFFFC0>[src.name] is loading the world. Please stand by..."
						var/F = input(src,"Select a Chao Chatterz world file (.C2W) to import","Load World") as null|file
						world.status = "<font color=#FFFFC0><b>World is loading. Please wait.</b></font>"
						if(!F)
							return 0
						if(extension(F) == "C2W")
							var/savefile/Objects = new/savefile (F)
							var/code
							Objects["Sig"] >> code
							if(code!=mapcode)
								alert(src,"Your save file is invalid, corrupt or outdated.","Load World")
								return 0
							for(var/obj/a in world.contents)
								if(a.owner)
									del a
							var/Num=0
							Objects["Num"]>>Num
							if(Num)
								for(var/i=1 to Num)
									var/obj/newobj
									Objects["Object[i]"]>>newobj
									var {newx;newy;newz}
									Objects >> newx
									Objects >> newy
									Objects >> newz
									newobj.loc = locate(newx,newy,newz)
							world.status = tehverld
							Getstats()
							world<<"<font color=#FFFFC0>[src.name] has loaded [Num] Objects."
							return 0
						else
							alert(src,"Invalid File!","Load World")
							return 0

mob/Basic/verb
	Save_Export()
		set name = "Save Export"
		set category="-Tools-"
		var/check = alert(src,"Are you sure you wish to export a save?","Save Export","Yes","No")
		if(check == "Yes")
			var/savefile/F = new("Save Data/Players/[usr.ckey].CC2")
			F["mob"] << usr.client.mob
			F["code"] << expcode
			src << ftp("Save Data/Players/[usr.ckey].CC2")
			return 0
/*	Save_Tiles()
		set category= "-Tools-"
		set name="Save Tileset"
		set desc="Saves a custom set of tiles to use at a later date."
		switch(input("What would you like to do?","Save Tiles") as null|anything in list("Save Tileset","Load Tileset"))
			if(null)
				return 0
			if("Save Tileset")
				var/finame = input("What would you like to save this tileset as?", "Save Tileset") as null|text
				if(!finame)
					return 0
				var/dist = input("How far away are these tiles? (Maximum of 11)","Save Tileset") as null|num
				if(!dist)
					return 0
				if((dist>>11)||(dist<<-11))
					dist=11
				var/list/icons = list()
				var/savefile/Objects = new/savefile("Save Data/Tilesets/[copytext(finame,1)].C2T")
				Objects["Dist"]<<"[dist]"
				Objects["Sig"]<<tilcode
				var/Num=0
				Getstats()
				for(var/obj/O in oview(dist,usr))
					if(O.owner=="[src.ckey]")
						Objects["Object[++Num]"]<<O
						Objects["Num"]<<Num
						var/nx = O.x-src.x
						Objects << nx
						var/ny = O.y-src.y
						Objects << ny
				for(var/I in Objects)
					if(isfile(I))
						if(!icons.Find(I))
							icons += I
						else
							del(I)
				Objects << icons
				Objects["Num"]<<Num
				src << ftp("Save Data/Tilesets/[copytext(finame,1)].C2T")
				src << "[copytext(finame,1)] has been saved."
				return 0
			if("Load Tileset")
				var/F = input(src,"Select a Chao Chatterz tileset file (.C2T) to import","Load Tilesets") as null|file
				if(!F)
					return 0
				if(extension(F) == "C2T")
					var/savefile/Objects = new/savefile (F)
					var/code
					Objects["Sig"] >> code
					if(code!=tilcode)
						alert(src,"Your save file is invalid, corrupt or outdated.","Load Tilesets")
						return 0
					var/Num=0
					var/dist=0
					Objects["dist"]>>dist
					for(var/area/A in oview(dist,usr))
						if(istype(A,/area/NoBuild/))
							alert(src,"You can't build this here.","Load Tilesets")
							return 0
					Objects["Num"]>>Num
					if(Num)
						for(var/i=1 to Num)
							var/obj/newobj
							Objects["Object[i]"]>>newobj
							var {newx;newy}
							Objects >> newx
							Objects >> newy
							newobj.loc = locate(newx+src.x,newy+src.y,src.z)
					src << "[F] has been loaded."
					return 0
				else
					alert(src,"Invalid File!","Load Tilesets")
					return 0
*/