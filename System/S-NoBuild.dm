area/NoBuild/
	NoBuild
		layer = 8
	Dean_Only
		layer = 8
		Entered(mob/O)
			if(O.ckey != "golddean")
				var/Dean = new/obj/Chao_Floor()
				Dean:icon = 'System/S-Dean.dmi'
				O << "<P align=left>\icon[Dean]<font color=teal><b>Gold Dean Android says: Get out of here!"
				O.loc = locate(20,118,2)
				del(Dean)
	noscoot
		layer = 7
		Entered(mob/M)//When you step on top of it.
			if(!PGM.Find(M.ckey))
				M.pixel_x = 0
				M.pixel_y = 0
	Jaildiscuss
		layer = 7
		Entered(mob/M)//When you step on top of it.
			if(ismob(M))
				M.saysetting = 0
				if(M.Jailed == 1)
					M.verbs += /mob/Basic/verb/Say
					M.verbs += /mob/Basic/verb/Whisper
		Exited(mob/M)
			if(ismob(M))
				if(M.Jailed == 1)
					M.verbs -= /mob/Basic/verb/Say
					M.verbs -= /mob/Basic/verb/Whisper
mob
	proc
		Nobuild()
			if(src.NoBuild == 1)
				src<<"Your building rights have been taken."
				return 0
			if(TGM.Find(src.ckey))
				return 1
			else
				Countpobjs()
				if(src.numobj >= BMax)
					src<<"<font color=#C0FFC0>You have reached the designated building limit."
					return 0
				else
					for(var/area/A in oview(0,src))
						if(istype(A,/area/NoBuild/))
							src<<"<font color=#C0FFC0>You cannot build here."
							return 0
						else
							if((src.z>=3)&&(src.z<=5))
								var/itokay = 0
								var/floornum
								if(src.z==5)
									floornum=4
								if(src.z==4)
									floornum=1
								if(src.z==3)
									floornum=1
								for(var/obj/this in locate(src.x,src.y,floornum))
									if(this.owner==src.ckey)
										itokay = 1
								if(itokay==1)
									return 1
								else
									src<<"<font color=#C0FFC0>You lack the foundation to build here."
									return 0
							else
								return 1

mob/proc
	Countpobjs()
		src.numobj = 0
		for(var/obj/O in world.contents)
			if(O.owner == src.ckey)
				src.numobj += 1

