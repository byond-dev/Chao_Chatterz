obj/unique/GMchair
	Deans_Frame
		layer = 4
		name = "Gold Dean's Chair"
		icon = 'PNG/Deans Chair.png'
		thatgm = "{!!!}"
		density = 1
	Deans_Chair
		layer = 4
		name = "Gold Dean's Chair"
		icon = 'PNG/Deans Chair.png'
		icon_state = "1,1"
		thatgm = "{!!!}"
		density = 1
		verb
			Sit()
				set category = null
				set src in oview(1)
				if(usr.ckey == src.thatgm)
					usr.loc = locate(20,119,2)
					usr.dir = SOUTH