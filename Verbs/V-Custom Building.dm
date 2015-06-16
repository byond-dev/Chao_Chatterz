var/list/objs = list()

proc
	SaveCusts()
		var/savefile/F = new ("Save Data/Customs.sav")
		F["Objs"] << objs
	LoadCusts()
		var/savefile/F = new ("Save Data/Customs.sav")
		F["Objs"] >> objs
		if(!objs)
			objs = list()

obj/Custom

mob/Build/verb
	Create_Custom()
		set name = "Create Custom Item"
		set category = "-Tools-"
		var/CO = new/obj/Custom()
		switch(input("Would you like to create a new custom object?","Create Custom Object","Yes") in list("Yes","No"))
			if("No")
				return 0

		var/new_name = input(src,"What would you like to name this item?","Create Custom") as null|text
		if(!new_name)
			return 0
		CO:name = copytext(new_name,1,30)
		CO:owner = "[src.ckey]"

		CO:icon = input("Pick and icon:","Icon") as icon
		var/states=list("")
		states+="null"
		for(var/L in icon_states(CO:icon))
			states+=list("[L]")
		CO:icon_state = input("What Icon State?") in states

		switch(input("Will this object be dense?","Create Custom Object","Yes") in list("Yes","No"))
			if("Yes")
				CO:density = 1
			else
				CO:density = 0

		switch(input("Will this object be see-through?","Create Custom Object","Yes") in list("Yes","No"))
			if("Yes")
				CO:opacity = 0
			else
				CO:opacity = 1

		switch(input("What layer will this object be on?","Create Custom Object","Object Layer") in list("Upper Layer","Object Layer","Wall Layer","Turf Layer"))
			if("Upper Layer")
				CO:layer = 7
			if("Object Layer")
				CO:layer = 4
			if("Wall Layer")
				CO:layer = 3
			if("Turf Layer")
				CO:layer = 2

		if((!CO:name)||(!CO:icon))
			alert(src,"Invalid parimeters have been entered. The object will not be saved.","Create Custom Object")
			del(CO)
			return 0

		alert(src,"The object has been saved.","Save")
		objs += CO
		SaveCusts()

	Build_Custom()
		set name = "-Custom Item-"
		set category = "-Build-"
		if(src.Nobuild())
			LoadCusts()
			var/buildable=list("")
			buildable+="Cancel"
			for(var/obj/O in objs)
				if(O.owner == src.ckey)
					buildable+=O
			var/select = input("What object would you like to build?","Build Custom Object") in buildable
			if(select == "Cancel")
				return 0
			else
				var/obj/newobj = select
				newobj.loc = src.loc