mob/Build
	verb
		Stairs()
			set name = "-Staircase-"
			set category = "-Build-"
			if(src.Nobuild())
				switch(input("What would you like to build?","Stairs") as null|anything in list("Ascending Stairs","Descending Stairs","Elevator"))
					if("Ascending Stairs")
						if(usr.z == 1)
							var/o = new/obj/Ascending_Stairs(usr.loc)
							o:owner = "[usr.ckey]"
							var/p = new/obj/Descending_Stairs(loc=locate(usr.x,usr.y,4))
							p:owner = "[usr.ckey]"
						if(usr.z == 3)
							var/o = new/obj/Ascending_Stairs(usr.loc)
							o:owner = "[usr.ckey]"
							var/p = new/obj/Descending_Stairs(loc=locate(usr.x,usr.y,1))
							p:owner = "[usr.ckey]"
						if(usr.z == 4)
							var/o = new/obj/Ascending_Stairs(usr.loc)
							o:owner = "[usr.ckey]"
							var/p = new/obj/Descending_Stairs(loc=locate(usr.x,usr.y,5))
							p:owner = "[usr.ckey]"
						else
							..()
					if("Descending Stairs")
						if(usr.z == 1)
							var/o = new/obj/Descending_Stairs(usr.loc)
							o:owner = "[usr.ckey]"
							var/p = new/obj/Ascending_Stairs(loc=locate(usr.x,usr.y,3))
							p:owner = "[usr.ckey]"
						if(usr.z == 4)
							var/o = new/obj/Descending_Stairs(usr.loc)
							o:owner = "[usr.ckey]"
							var/p = new/obj/Ascending_Stairs(loc=locate(usr.x,usr.y,1))
							p:owner = "[usr.ckey]"
						if(usr.z == 5)
							var/o = new/obj/Descending_Stairs(usr.loc)
							o:owner = "[usr.ckey]"
							var/p = new/obj/Ascending_Stairs(loc=locate(usr.x,usr.y,4))
							p:owner = "[usr.ckey]"
						else
							..()
					if("Elevator")
						if((usr.z==1)||((usr.z>=3)&&(usr.z<=5)))
							var/o = new/obj/Elevator(loc=locate(usr.x,usr.y,1))
							o:owner = "[usr.ckey]"
							var/p = new/obj/Elevator(loc=locate(usr.x,usr.y,3))
							p:owner = "[usr.ckey]"
							var/q = new/obj/Elevator(loc=locate(usr.x,usr.y,4))
							q:owner = "[usr.ckey]"
							var/r = new/obj/Elevator(loc=locate(usr.x,usr.y,5))
							r:owner = "[usr.ckey]"
						else
							..()
					else
						..()
		Icon_Dispenser()
			set name = "-Icon Dispenser-"
			set category = "-Build-"
			if(src.Nobuild())
				switch(alert(usr,"Do you want to build an Icon Dispenser?","Icon Dispenser","Yes","No"))
					if("Yes")
						var/a = new/obj/Icon_Dispenser(usr.loc)
						a:owner = "[usr.ckey]"
						a:underlays += new/obj/Icon_Dispenser_Base
						a:icon = input(src,"What icon would you like for this dipenser?","Icon Dispenser") as null|icon
						if(!a:icon)
							del a
						var/states=list("")
						states+="null"
						for(var/L in icon_states(a:icon))
							states+=list("[L]")
						a:icon_state = input("What Icon State?") in states
						a:name = input(src,"What would you like to name this icon?","Icon Dispenser","[a]") as null|text
						a:name = copytext(a:name,1,30)
						if (a:name == "" || !a:name)
							a:name = "Icon Dispenser"
		Window()
			set category = "-Build-"
			if(src.Nobuild())
				for(var/mob/M in view())
				var/a = new/obj/Window(usr.loc)
				var/bl1 = "v"
				var/bl2 = "red"
				a:owner = "[usr.ckey]"
				switch(input("What direction should it face?","Window")in list("Vertical","Horizontal"))
					if("Vertical")
						bl1 = "v"
					if("Horizontal")
						bl1 = "h"
				switch(input("What color would you like the blinds?","Window")in list("Red","Yellow","Blue","Purple","Green","Black"))
					if("Red")
						bl2 = "red"
					if("Yellow")
						bl2 = "yellow"
					if("Blue")
						bl2 = "blue"
					if("Purple")
						bl2 = "purple"
					if("Green")
						bl2 = "green"
					if("Black")
						bl2 = "black"
				a:icon_state = "[bl2][bl1]"
		Punching_Bag()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/P_Bag(usr.loc)
				o:owner = "[usr.ckey]"
		Stone_Crystal_Path()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Stone_Crystal_Path(usr.loc)
				o:owner = "[usr.ckey]"
		Stone_Crystal_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Stone_Crystal_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Black_Slab_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/BlackSlab(usr.loc)
				o:owner = "[usr.ckey]"
		Volcanic_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Volcanic_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Volcanic_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Volcanic_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Black_Slab_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/BlackSlabW(usr.loc)
				o:owner = "[usr.ckey]"
		Brick_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Brick_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Castle_Tiles()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Castle_Tiles(usr.loc)
				o:owner = "[usr.ckey]"
		Castle_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Castle_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Metallic_Tile()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Metallic_Tile(usr.loc)
				o:owner = "[usr.ckey]"
		Metallic_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Metallic_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Snow()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Snow(usr.loc)
				o:owner = "[usr.ckey]"
		Ice()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Ice(usr.loc)
				o:owner = "[usr.ckey]"
		Blue_Berry_Bush()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Blue_Berry_Bush(usr.loc)
				o:owner = "[usr.ckey]"
		Flower_Bush()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Flower_Bush(usr.loc)
				o:owner = "[usr.ckey]"
		Stereo()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Stereo(usr.loc)
				o:owner = "[usr.ckey]"
		Refrigerator()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Refrigerator(usr.loc)
				o:owner = "[usr.ckey]"
		Stove()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Stove(usr.loc)
				o:owner = "[usr.ckey]"
		Microwave()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Microwave(usr.loc)
				o:owner = "[usr.ckey]"
		Cliffside()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Cliffside(usr.loc)
				o:owner = "[usr.ckey]"
		Crappy_Carpeting()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Crappy_Carpeting(usr.loc)
				o:owner = "[usr.ckey]"
		Dirt()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Gravel(usr.loc)
				o:owner = "[usr.ckey]"
		Green_Tile()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Green_Tile(usr.loc)
				o:owner = "[usr.ckey]"
		Blue_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Blue_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		White_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/White_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Pink_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Pink_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Purple_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Purple_GM_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Red_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Red_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Gold_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Gold_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Green_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Green_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Fancy_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Fancy_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Blue_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Blue_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Red_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Red_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Green_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Green_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Grey_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Grey_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Wooden_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Wooden_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Wooden_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Wooden_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Sign()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/sign/Sign(usr.loc)
				a:owner = "[usr.ckey]"
				a:msg = input("What should the sign say?","Creating sign")as text
				if(a:msg == "")
					a:name = "Sign"
				else
					a:name = "[a:msg]"
		Table()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Table(usr.loc)
				o:owner = "[usr.ckey]"
		Chair()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/Chair(usr.loc)
				a:owner = "[usr.ckey]"
		Glass_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Glass_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Shower()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Shower(usr.loc)
				o:owner = "[usr.ckey]"
		Bathtub()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/Bathtub(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What direction should it face?","Bathtub")in list("Up","Down","Left","Right"))
					if("Left")
						a:dir = WEST
					if("Right")
						a:dir = EAST
					if("Up")
						a:dir = NORTH
					if("Down")
						a:dir = SOUTH
		Fire()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Fire(usr.loc)
				o:owner = "[usr.ckey]"
		TV()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/TV(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What direction should it face?","TV")in list("Up","Down","Left","Right"))
					if("Left")
						a:dir = WEST
					if("Right")
						a:dir = EAST
					if("Up")
						a:dir = NORTH
					if("Down")
						a:dir = SOUTH
		Kiddy_TV()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/TV(usr.loc)
				a:overlays += /obj/overlay/kiddytv
				a:name = "Kiddy TV"
				a:owner = "[usr.ckey]"
				switch(input("What direction should it face?","TV")in list("Up","Down","Left","Right"))
					if("Left")
						a:dir = WEST
					if("Right")
						a:dir = EAST
					if("Up")
						a:dir = NORTH
					if("Down")
						a:dir = SOUTH
		Toilet()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/Toilet(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What direction should it face?","Toilet")in list("Up","Down","Left","Right"))
					if("Left")
						a:dir = WEST
					if("Right")
						a:dir = EAST
					if("Up")
						a:dir = NORTH
					if("Down")
						a:dir = SOUTH

		Sink()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/Sink(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What direction should it face?","Sink")in list("Up","Down","Left","Right"))
					if("Left")
						a:dir = WEST
					if("Right")
						a:dir = EAST
					if("Up")
						a:dir = NORTH
					if("Down")
						a:dir = SOUTH

		Fancy_Tile()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Fancy_Tile(usr.loc)
				o:owner = "[usr.ckey]"
		Box()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Box(usr.loc)
				o:owner = "[usr.ckey]"

		Water()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Water(usr.loc)
				o:owner = "[usr.ckey]"
		Pool()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Water(usr.loc)
				o:owner = "[usr.ckey]"
				o:density = 0
				o:name = "Pool"
		Stone_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Stone_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Red_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Red_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Purple_Tiles()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Purple_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		White_Slabs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/WhiteSlab(usr.loc)
				o:owner = "[usr.ckey]"
		Green_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Green_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Kitchen_Tiles()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Kitchen_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Dance_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Dance_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Door()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/door/Door(usr.loc)
				a:owner = "[usr.ckey]"
				switch(alert(usr,"What direction will it open?","Door","Horizontal","Vertical"))
					if("Horizontal")
						a:dir = SOUTH
					else
						a:dir = NORTH
				switch(alert("See through?","Door","No","Yes"))
					if("Yes")
						a:see = 0
						a:opacity = 0
					else
						a:see = 1
						a:opacity = 1
				switch(alert(usr,"Would you like to set a password for your door?","Building","Yes","No"))
					if("Yes")
						a:password = input("What should it's password be?","Building")as text
		Warp_Point()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/warps/Warp(usr.loc)
				a:owner = "[usr.ckey]"
				a:name = input("What is the name of this warp?","Warp") as text
				if(a:name == "")
					a:name = "[usr.ckey]'s Warp at [a:x],[a:y],[a:z]"
				switch(alert("Is this a private warp?","Door","No","Yes"))
					if("Yes")
						a:private = 1
						a:icon_state = "pwarp"
					if("No")
						a:private = 0
						a:icon_state = "warp"
		Metal_Door()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/door/Metal_Door(usr.loc)
				a:owner = "[usr.ckey]"
				switch(alert(usr,"What direction will the door open?","Building","Horizontal","Vertical"))
					if("Horizontal")
						a:dir = SOUTH
					else
						a:dir = NORTH
				switch(alert("Is this door see-through?","Building","Yes","No"))
					if("Yes")
						a:see = 0
						a:opacity = 0
					else
						a:see = 1
						a:opacity = 1
				switch(alert(usr,"Would you like to set a password for your door?","Building","Yes","No"))
					if("Yes")
						a:password = input("What should it's password be?","Building")as text
		Kiddy_Door()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/door/Kiddy_Door(usr.loc)
				a:owner = "[usr.ckey]"
				switch(alert(usr,"What direction will the door open?","Building","Horizontal","Vertical"))
					if("Horizontal")
						a:dir = SOUTH
					else
						a:dir = NORTH
				switch(alert("Is this door see-through?","Building","Yes","No"))
					if("Yes")
						a:see = 0
						a:opacity = 0
					else
						a:see = 1
						a:opacity = 1
				switch(alert(usr,"Would you like to set a password for your door?","Building","Yes","No"))
					if("Yes")
						a:password = input("What should it's password be?","Building")as text
		Garage_Door()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/door/Garage_Door(usr.loc)
				a:owner = "[usr.ckey]"
				switch(alert("See through?","Garage Door","No","Yes"))
					if("Yes")
						a:see = 0
						a:opacity = 0
					else
						a:see = 1
						a:opacity = 1
				switch(alert(usr,"Would you like to set a password for your door?","Building","Yes","No"))
					if("Yes")
						a:password = input("What should it's password be?","Building")as text
		Tall_Fence_Gate()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/door/Pfence_Gate(usr.loc)
				a:owner = "[usr.ckey]"
				switch(alert(usr,"Would you like to set a password for your door?","Building","Yes","No"))
					if("Yes")
						a:password = input("What should it's password be?","Building")as text
		Tree()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Tree(usr.loc)
				o:owner = "[usr.ckey]"
		Fountain()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Fountain(usr.loc)
				o:owner = "[usr.ckey]"
		Laptop()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Laptop(usr.loc)
				o:owner = "[usr.ckey]"
		PC()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/PC(usr.loc)
				o:owner = "[usr.ckey]"
		Water_Fall()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/WFall(usr.loc)
				a:owner = "[usr.ckey]"
		Rock()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Rock(usr.loc)
				o:owner = "[usr.ckey]"
		Flowers()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Flowers(usr.loc)
				o:owner = "[usr.ckey]"
				switch(input("What type of flowers do you want?","Foliage")in list("Red","Orange","Yellow", "Blue", "Pink", "White"))
					if("Red")
						o:icon_state = "Red"
					if("Orange")
						o:icon_state = "Orange"
					if("Yellow")
						o:icon_state = "Yellow"
					if("Blue")
						o:icon_state = "Blue"
					if("Pink")
						o:icon_state = "Pink"
					if("White")
						o:icon_state = "White"
					else
						return()
		Log_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Log_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Log_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Log_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Sandstone_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Sand_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Sand()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Sand_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Jagged_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Jagged_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Jagged_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Jagged_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Proper_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Proper_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Proper_Tiles()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Proper_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Wicker_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Wicker_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Wicker_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Wicker_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Dilapidated_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Dilapidated_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Dilapidated_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Dilapidated_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Marble_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Marble_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Orange_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Orange_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		Diagnal_Wood_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Diagnal_Wood(usr.loc)
				o:owner = "[usr.ckey]"
		Waffle_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Waffle_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Red_Brick_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Red_Brick_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Fire_Place()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Fire_Place_1(loc=locate(usr.x-1,usr.y+1,usr.z))
				o:owner = "[usr.ckey]"
				var/p = new/obj/Fire_Place_2(loc=locate(usr.x,usr.y+1,usr.z))
				p:owner = "[usr.ckey]"
				var/q = new/obj/Fire_Place_3(loc=locate(usr.x+1,usr.y+1,usr.z))
				q:owner = "[usr.ckey]"
				var/r = new/obj/Fire_Place_4(loc=locate(usr.x-1,usr.y,usr.z))
				r:owner = "[usr.ckey]"
				var/s = new/obj/Fire_Place_5(loc=locate(usr.x,usr.y,usr.z))
				s:owner = "[usr.ckey]"
				var/t = new/obj/Fire_Place_6(loc=locate(usr.x+1,usr.y,usr.z))
				t:owner = "[usr.ckey]"
				var/u = new/obj/Chimney(loc=locate(usr.x,usr.y+2,usr.z))
				u:owner = "[usr.ckey]"
		Bed()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Head_Board(loc=locate(usr.x,usr.y+1,usr.z))
				o:owner = "[usr.ckey]"
				var/p = new/obj/Bed_Center(loc=locate(usr.x,usr.y,usr.z))
				p:owner = "[usr.ckey]"
				var/q = new/obj/Bed_Bottom(loc=locate(usr.x,usr.y-1,usr.z))
				q:owner = "[usr.ckey]"
				var/r = new/obj/Bed_Covers(loc=locate(usr.x,usr.y,usr.z))
				r:owner = "[usr.ckey]"
		Classy_Bed()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Classy_Head_Board(loc=locate(usr.x,usr.y+1,usr.z))
				o:owner = "[usr.ckey]"
				var/p = new/obj/Classy_Bed_Center(loc=locate(usr.x,usr.y,usr.z))
				p:owner = "[usr.ckey]"
				var/q = new/obj/Classy_Bed_Bottom(loc=locate(usr.x,usr.y-1,usr.z))
				q:owner = "[usr.ckey]"
				var/r = new/obj/Classy_Bed_Covers(loc=locate(usr.x,usr.y,usr.z))
				r:owner = "[usr.ckey]"
		Kiddy_Bed()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Kiddy_Head_Board(loc=locate(usr.x,usr.y+1,usr.z))
				o:owner = "[usr.ckey]"
				var/p = new/obj/Kiddy_Bed_Center(loc=locate(usr.x,usr.y,usr.z))
				p:owner = "[usr.ckey]"
				var/q = new/obj/Kiddy_Bed_Bottom(loc=locate(usr.x,usr.y-1,usr.z))
				q:owner = "[usr.ckey]"
				var/r = new/obj/Kiddy_Bed_Covers(loc=locate(usr.x,usr.y,usr.z))
				r:owner = "[usr.ckey]"
		Teddy_Bear()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Teddy_Bear(usr.loc)
				o:owner = "[usr.ckey]"
		Lava()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Lava(usr.loc)
				o:owner = "[usr.ckey]"
		Fancy_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Fancy_Tile_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Log_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Log_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Wooden_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Wooden_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Red_Carpet_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Red_Carpet_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Blue_Carpet_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Blue_Carpet_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Gold_Carpet_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Gold_Carpet_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Castle_Tile_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Castle_Tile_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Green_Carpet_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Green_Carpet_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Orange_Carpet_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Orange_Carpet_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Purple_Carpet_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Purple_Carpet_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Brick_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Brick_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Metal_Stairs()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Metal_Stairs(usr.loc)
				o:owner = "[usr.ckey]"
		Kiddy_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Kiddy_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Kiddy_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Kiddy_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Kiddy_Table()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Kiddy_Table(usr.loc)
				o:owner = "[usr.ckey]"
		Neon_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Neon_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Neon_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Neon_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Chao_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Chao_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Chao_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Chao_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Choco_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Choco_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Choco_Floor()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Choco_Floor(usr.loc)
				o:owner = "[usr.ckey]"
		Sidewalk()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Sidewalk(usr.loc)
				o:owner = "[usr.ckey]"
		Asphalt()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Asphalt(usr.loc)
				o:owner = "[usr.ckey]"
		Traffic_Line()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Line(usr.loc)
				o:owner = "[usr.ckey]"
				switch(input("What direction will the line face?","Line")in list("Horizontal","Vertical"))
					if("Vertical")
						o:dir = NORTH
					if("Horizontal")
						o:dir = WEST
		Black_Carpet()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/Black_Carpet(usr.loc)
				o:owner = "[usr.ckey]"
		White_Panal_Wall()
			set category = "-Build-"
			if(src.Nobuild())
				var/o = new/obj/White_Panaled_Wall(usr.loc)
				o:owner = "[usr.ckey]"
		Wooden_Bench()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/Bench(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What part of the bench is this?","Bench")in list("Left Side","Center","Right Side","Chair"))
					if("Left Side")
						a:dir = SOUTH
					if("Center")
						a:dir = NORTH
					if("Right Side")
						a:dir = EAST
					if("Chair")
						a:dir = WEST
		Kiddy_Couch()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/Kiddy_Couch(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What part of the couch is this?","Bench")in list("Left Side","Center","Right Side","Chair"))
					if("Left Side")
						a:dir = SOUTH
					if("Center")
						a:dir = NORTH
					if("Right Side")
						a:dir = EAST
					if("Chair")
						a:dir = WEST
		Tall_Fence()
			set category = "-Build-"
			if(src.Nobuild())
				var/a = new/obj/pfence(usr.loc)
				a:owner = "[usr.ckey]"
				switch(input("What part of the fence is this?","Tall Fence")in list("Horizontal","Vertical (Left)","Vertical (Right)","Horizontal to Vertical (Left)","Horizontal to Vertical (Right)","Vertical (Left) to Horizontal","Vertical (Right) to Horizontal"))
					if("Horizontal")
						a:dir = SOUTH
					if("Vertical (Left)")
						a:dir = WEST
					if("Vertical (Right)")
						a:dir = EAST
					if("Horizontal to Vertical (Left)")
						a:dir = SOUTHWEST
					if("Horizontal to Vertical (Right)")
						a:dir = SOUTHEAST
					if("Vertical (Left) to Horizontal")
						a:dir = NORTHWEST
					if("Vertical (Right) to Horizontal")
						a:dir = NORTHEAST
mob
	Bump(atom/O)
		if(istype(O,/obj/door/))
			O:tryit(usr)
		if(istype(O,/obj/GM_Door))
			O:gmtryit(usr)
		if(istype(O,/obj/sign/))
			usr << "<center><font color=white>[O:msg]"
			usr << "<center><font color=red>~[O:owner]"