mob/Customize/verb
	Change_Icon()
		set category = "-Customize-"
		set name = "Change Icon"
		set desc = "Select a new icon to use."
		var/ICO = input("Select an icon to use.","Change Icon") as null|icon
		if(!ICO)
			return 0
		var/size = length(ICO)
		Size(size)
		if(length(ICO) > iconsize)
			alert(usr,"[ICO] ([filemsg]) is above the maximum icon size ([iconsize].)","Change Icon")
			return 0
		else
			src.icon = ICO
			Pick_Icon_State()

	Change_Icon_State()
		set category = "-Customize-"
		set name = "Change Icon State"
		set desc = "Select a new icon state to use."
		Pick_Icon_State()

	Rename_Character()
		set category = "-Customize-"
		set desc = "Rename your character."
		var/kaname = input(src,"What would you like to name this character? (Limited to 24 characters.)","Rename Character","[src.name]") as text
		if(!kaname)
			return 0
		else
			var/lastname = "[copytext(kaname,1,24)]"
			src.name = "[Remove_HTML(lastname)]"
			src.nayme = "<font color=#[src.naymecol]>[src.name]"
	Change_Font_Color()
		set category = "-Customize-"
		set name = "Set Font Color"
		set desc = "Change your chat font color."
		var/font = input(src,"What font color would you like? (6-Digit Color Code.)","Font Color","[src.fontclr]") as null|text
		if(!font)
			return 0
		var/check = length(font)
		if(check != 6)
			return 0
		else
			src.fontclr = font
	Change_Name_Color()
		set category = "-Customize-"
		set name = "Set Name Color"
		set desc = "Change your name font color."
		var/font = input(src,"What font color would you like? (6-Digit Color Code.)","Font Color","[src.naymecol]") as null|text
		if(!font)
			return 0
		var/check = length(font)
		if(check != 6)
			return 0
		else
			src.naymecol = font
			src.nayme = "<font color=#[naymecol]>[src.name]"
	Set_Display_Name()
		set category = "-Customize-"
		var/prompt_title = "Set Display Name"
		var/help_text = "What would you like your name to appear as?"
		var/default_value = nayme
		var/char_name = input(src, help_text, prompt_title, default_value) as text
		var/T = copytext(char_name,1)
		var/check = lowertext(T)
		if(findtextEx(check,"\n"))
			usr << "Invalid content detected."
			return
		if(findtextEx(check,"<br>"))
			usr << "Invalid content detected."
			return
		else
			usr.nayme = sd.ProcessHTML(T)
			if (T == "")
				usr.nayme = "[usr.name]"
			else
				return()
	Scoot()
		set category = "-Customize-"
		set desc = "Move across the x and y axis."
		for(var/area/A in oview(0,src))
			if(PGM.Find(src.ckey))
			else
				if(istype(A,/area/NoBuild/noscoot))
					src << "<font color=#C0FFC0>You cannot scoot here."
					return 0
			switch(input("What direction would you like to scoot?","Scoot") as null|anything in list("Up","Down","Left","Right","Return to Center"))
				if(null)
					return 0
				if("Left")
					if(usr.pixel_x != -24)
						usr.pixel_x -= 4
				if("Right")
					if(usr.pixel_x != 24)
						usr.pixel_x += 4
				if("Up")
					if(usr.pixel_y != 24)
						usr.pixel_y += 4
				if("Down")
					if(usr.pixel_y != -24)
						usr.pixel_y -= 4
				if("Return to Center")
					usr.pixel_y = 0
					usr.pixel_x = 0
	Face()
		set name = "Change Direction"
		set category = "-Customize-"
		set desc = "Change your direction."
		switch(input("What direction would you like to face?","Face") as null|anything in list("Up","Down","Left","Right"))
			if(null)
				return 0
			if("Left")
				usr.dir = WEST
			if("Right")
				usr.dir = EAST
			if("Up")
				usr.dir = NORTH
			if("Down")
				usr.dir = SOUTH
	Layer_Tools()		//-- By Bunnie
		set name = "Manage Layers"
		set category = "-Customize-"
		set desc = "Add and Remove Overlays and Underlays."
		switch(input("What would you like to do?","Manage Layers") as null|anything in list("Add Overlays","Remove Overlays","Add Underlays","Remove Underlays","Change Mouse Over","Remove Mouse Over"))
			if(null)
				return 0
			if("Add Underlays")
				var/I = input("Choose an icon for the underlay.","Manage Layers") as null|icon
				if(!I)
					return 0
				var/loel = input("Choose a name for the underlay.","Manage Layers") as null|text
				if(!loel)
					return 0
				var/o = new/obj/IconObject(usr)
				var/States = icon_states(I)
				var/bitch = input("What icon state will the overlay be?","Manage Layers") in States + list("null","Cancel")
				if(bitch=="Cancel") return
				if(bitch=="Null") o:icon_state = null
				else o:icon_state = bitch
				o:icon = I
				o:name = loel
				undurlays+=o
				underlays = null
				for(var/yep in undurlays)
					underlays+=yep
			if("Remove Underlays")
				var/choice = input("Pick a underlay to remove.","Manage Layers") as null|anything in undurlays
				if(!choice)
					return 0
				undurlays-=choice
				underlays = null
				for(var/yep in undurlays)
					underlays+=yep
			if("Add Overlays")
				var/I = input("Choose an icon for the overlay.","Manage Layers") as null|icon
				if(!I)
					return 0
				var/loel = input("Choose a name for the overlay.","Manage Layers") as null|text
				var/o = new/obj/IconObject(usr)
				if(!loel)
					return 0
				var/States = icon_states(I)
				var/bitch = input("What icon state will the overlay be?","Icon state") in States + list("null","Cancel")
				if(bitch=="Cancel") return
				if(bitch=="Null") o:icon_state = null
				else o:icon_state = bitch
				o:icon = I
				o:name = loel
				o:layer = 6
				ovurlays+=o
				overlays = null
				for(var/yep in ovurlays)
					overlays+=yep
			if("Remove Overlays")
				var/choice = input("Pick a Overlay to remove","Remove Underlay") as null|anything in ovurlays
				if(!choice)
					return()
				ovurlays-=choice
				overlays = null
				for(var/yep in ovurlays)
					overlays+=yep
			if("Change Mouse Over")
				var/obj/O = new /obj
				var/I = input("Choose an icon for the overlay.","Manage Layers") as null|icon
				if(!I)
					return 0
				O.icon = I
				var/States = icon_states(O.icon)
				var/bitch = input("Icon state?","Icon state") in States + list("null","Cancel")
				if(bitch=="Cancel") return
				if(bitch=="Null") O.icon_state = null
				else O.icon_state = bitch
				usr.mouse_over_pointer = O
			if("Remove Mouse Over")
				usr.mouse_over_pointer = null
mob/proc
	Pick_Icon_State()
		var/list/states = list()
		for(var/L in icon_states(src.icon))
			states+=L
		if(states.Find(""))
			states+="Default Icon State"
		var/pick = input("Select an icon state to use.","Change Icon State") as null|anything in states
		if(!pick)
			return 0
		if(pick == "Default Icon State")
			src.icon_state = null
		else
			src.icon_state = pick

mob/Customize
	verb
		Change_Object_Icon(obj/o in oview(), arg as icon)
			set category = "-Tools-"
			if(o:owner == "[usr.ckey]")
				o.icon = arg
				var/states=list("")
				states+="null"
				for(var/L in icon_states(o.icon))
					states+=list("[L]")
				o.icon_state = input("What Icon State?") in states
				return 0
			if(TGM.Find("[usr.ckey]"))
				o.icon = arg
				var/states=list("")
				states+="null"
				for(var/L in icon_states(o.icon))
					states+=list("[L]")
				o.icon_state = input("What Icon State?") in states
				return 0
			usr << "<font color=lime>You can't edit this. It's not yours."
		Change_Object_Icon_State(obj/o in oview())
			set category = "-Tools-"
			var/states=list("")
			states+="null"
			for(var/L in icon_states(o.icon))
				states+=list("[L]")
			if(o:owner == "[usr.ckey]")
				o.icon_state = input("What Icon State?") in states
			else
				if(TGM.Find("[usr.ckey]"))
					o.icon_state = input("What Icon State?") in states
				else
					usr << "<font color=lime>You can't edit this. It's not yours."

		Rename_Object(obj/o in oview())
			set category="-Tools-"
			if((o:owner == "[usr.ckey]")||(TGM.Find("[usr.ckey]")))
				var/obj_name = input(src,"What would you like to name this item?","Rename Object","[o]") as null|text
				if(!obj_name)
					return 0
				o.name = copytext(obj_name,1,30)
				if (o.name == "")
					o.name = "Object"
					return 0
			else
				usr << "<font color=lime>You can't edit this. It's not yours."

		Destroy_Object(obj/o in oview(9))
			set category = "-Tools-"
			if(o.owner == "[usr.ckey]")
				del o
				return 0
			else
				if(TGM.Find(usr.ckey))
					del o
					return 0
				else
					usr << "<font color=lime>You can't destroy this. It's not yours."
		Delete_View()
			set category = "-Tools-"
			switch(alert(usr,"Are you sure you want to delete all your objects in sight?","Delete View","Yes","No"))
				if("Yes")
					for(var/obj/o in oview(8))
						if(o:owner == usr.ckey)
							del o
						else
							..()
				else
					..()
		Delete_Your_Objects()
			set category = "-Tools-"
			switch(alert(usr,"Are you sure you want to delete everything you own?","Delete Your Objects","Yes","No"))
				if("Yes")
					for(var/obj/o in world)
						if(o:owner == usr.ckey)
							del o
						else
							..()
				else
					..()