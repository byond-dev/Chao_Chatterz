turf/login
	login1
		Login_A_1o1
			layer = 2
			name = ""
			icon = 'PNG/Login1/1-1.png'
			density = 1
		Login_A_1o2
			layer = 2
			name = ""
			icon = 'PNG/Login1/1-2.png'
			density = 1
		Login_A_2o1
			layer = 2
			name = ""
			icon = 'PNG/Login1/2-1.png'
			density = 1
		Login_A_2o2
			layer = 2
			name = ""
			icon = 'PNG/Login1/2-2.png'
			density = 1
	login2
		Login_B_1o1
			layer = 2
			name = ""
			icon = 'PNG/Login2/1-1.png'
			density = 1
		Login_B_1o2
			layer = 2
			name = ""
			icon = 'PNG/Login2/1-2.png'
			density = 1
		Login_B_2o1
			layer = 2
			name = ""
			icon = 'PNG/Login2/2-1.png'
			density = 1
		Login_B_2o2
			layer = 2
			name = ""
			icon = 'PNG/Login2/2-2.png'
			density = 1
	login3
		Login_C_1o1
			layer = 2
			name = ""
			icon = 'PNG/Login3/1-1.png'
			density = 1
		Login_C_1o2
			layer = 2
			name = ""
			icon = 'PNG/Login3/1-2.png'
			density = 1
		Login_C_2o1
			layer = 2
			name = ""
			icon = 'PNG/Login3/2-1.png'
			density = 1
		Login_C_2o2
			layer = 2
			name = ""
			icon = 'PNG/Login3/2-2.png'
			density = 1
	login4
		Login_D_1o1
			layer = 2
			name = ""
			icon = 'PNG/Login4/1-1.png'
			density = 1
		Login_D_1o2
			layer = 2
			name = ""
			icon = 'PNG/Login4/1-2.png'
			density = 1
		Login_D_2o1
			layer = 2
			name = ""
			icon = 'PNG/Login4/2-1.png'
			density = 1
		Login_D_2o2
			layer = 2
			name = ""
			icon = 'PNG/Login4/2-2.png'
			density = 1

turf
	grass
		layer = 2
		name = ""
		icon = 'resource/tiles2.dmi'
		icon_state = "grass"
	cliffside
		layer = 3
		name = ""
		icon = 'resource/tiles.dmi'
		icon_state = "crudewall"
		density = 1
	StoneFloor
		layer = 2
		name = "Stone Floor"
		icon = 'resource/tiles.dmi'
		icon_state = "stonefloor"
	GraniteSlabs
		layer = 2
		name = "Granite Slabs"
		icon = 'resource/tiles.dmi'
		icon_state = "granite slab"
	Earth
		layer = 2
		name = "Earth"
		icon = 'resource/tiles.dmi'
		icon_state = "gravel"
	Void
		layer = 2
		name = ""
		icon = 'resource/tiles.dmi'
		icon_state = "b"
	fancywall
		layer = 2
		name = "Fancy Wall"
		icon = 'resource/tiles.dmi'
		icon_state = "wall1"
		density = 1
	Snow
		layer = 2
		name = "Snow"
		icon = 'resource/tiles.dmi'
		icon_state = "Snow"
	theme
		Grass
			layer = 2
			name = ""
			icon = 'resource/theme.dmi'
			icon_state = "grass"
obj
	var/Owner = ""
	icon = 'resource/tiles.dmi'
	P_Bag
		layer = 4
		name = "Punching Bag"
		icon_state = "pbag"
	Blue_Berry_Bush
		layer = 4
		name = "Blueberry Bush"
		icon_state = "bluebush"
	Flower_Bush
		layer = 4
		name = "Flower Bush"
		icon_state = "redbush"
	Shower
		layer = 4
		name = "Shower"
		icon_state = "shower"
		density = 1
	Refrigerator
		layer = 4
		name = "Refrigerator"
		icon_state = "fridge"
		density = 1
	Microwave
		layer = 4
		icon_state = "micro"
		density = 1
	Stove
		layer = 4
		icon_state = "stove"
		density = 1
	PC
		layer = 4
		icon_state = "pc"
		density = 1
	Table
		layer = 3
		icon_state = "table1"
		density = 1
	Chair
		layer = 3
		icon_state = "chair"

	Bathtub
		layer = 4
		icon_state = "tub"
		density = 1
	Fire
		layer = 4
		icon_state = "fire"
		density = 1
	Toilet
		layer = 4
		icon_state = "toilet"
		density = 1
	Sink
		layer = 4
		icon_state = "sink"
		density = 1
	Water
		layer = 2
		icon_state = "water"
		density = 1
	Fancy_Tile
		layer = 2
		icon_state = "tile2"
	Stone_Floor
		layer = 2
		icon_state = "stonefloor"
	Red_Floor
		layer = 2
		icon_state = "redfloor"
	Purple_Floor
		layer = 2
		icon_state = "purpfloor"
	Green_Floor
		layer = 2
		icon_state = "greenfloor"
	Box
		layer = 4
		icon_state = "box"
		density = 1
	Glass_Wall
		layer = 3
		icon_state = "glass"
		density = 1


	Mixer
		icon_state = "m"
		layer = 4
		density = 1
		verb
			Use()
				set category = null
				set src in oview(1)
				World_Song()
	Stereo
		icon = 'resource/tv.dmi'
		icon_state = "ster"
		layer = 4
		density = 1
		verb
			Use()
				set category = null
				set src in oview(1)
				World_Song()
	Amp2
		layer = 4
		icon = 'resource/tiles.dmi'
		icon_state = "left"
		density = 1
	Amp1
		layer = 4
		icon_state = "right"
		density = 1
	Red_Chair
		layer = 4
		icon_state = "rc"
	Blue_Chair
		layer = 4
		icon_state = "bc"
	BlackSlab
		layer = 2
		icon = 'resource/tiles.dmi'
		icon_state = "granite slab"
	WhiteSlab
		layer = 2
		icon = 'resource/tiles.dmi'
		icon_state = "White Slabs"
	BlackSlabW
		layer = 3
		icon = 'resource/tiles.dmi'
		icon_state = "black slabs"
		density = 1
		opacity = 1
	Fountain
		layer = 4
		icon_state = "fountainflip"
		density = 1
	Laptop
		layer = 4
		icon_state = "laptop"
		density = 1
	Tree
		layer = 4
		icon_state = "tree"
		density = 1
	Disco
		layer = 2
		icon_state = "chain"
		density = 0
	Rock
		layer = 3
		icon_state = "rock"
		density = 1
	Cliffside
		layer = 3
		icon_state = "crudewall"
		density = 1
	Crappy_Carpeting
		layer = 2
		icon_state = "crudefloor"
	Gravel
		layer = 2
		name = "Dirt"
		icon_state = "gravel"
	Green_Tile
		layer = 2
		icon_state = "btile"
	Blue_Carpet
		layer = 2
		icon_state = "Blue GM Carpet"
	Purple_Carpet
		layer = 2
		icon_state = "Purple GM Carpet"
	Red_Carpet
		layer = 2
		icon_state = "Red GM Carpet"
	Gold_Carpet
		layer = 2
		icon_state = "Gold GM Carpet"
	Green_Carpet
		layer = 2
		icon_state = "Green GM Carpet"
	White_Carpet
		layer = 2
		icon_state = "White GM Carpet"
	Pink_Carpet
		layer = 2
		icon_state = "Girly Carpet"
	Fancy_Wall
		layer = 3
		icon_state = "modernwall"
		density = 1
		opacity = 1
	Red_Wall
		layer = 3
		icon_state = "rwall"
		density = 1
		opacity = 1
	Grey_Wall
		layer = 3
		icon_state = "grwall"
		density = 1
		opacity = 1
	Green_Wall
		layer = 3
		icon_state = "gwall"
		density = 1
		opacity = 1
	Blue_Wall
		layer = 3
		icon_state = "bwall"
		density = 1
		opacity = 1
	Wooden_Floor
		layer = 2
		icon_state = "modernfloor"
	Wooden_Wall
		layer = 3
		icon_state = "WoodenW"
		density = 1
		opacity = 1
	Cell_Walls
		layer = 4
		icon_state = "jail"
		density = 1

	Lava
		layer = 2
		icon_state = "lava"
		density = 1

	Water
		layer = 2
		icon_state = "water"
		density = 1
	Red_GM_Carpet
		layer = 2
		name = "Red Carpet"
		icon_state = "Red GM Carpet"
	Blue_GM_Carpet
		layer = 2
		name = "Blue Carpet"
		icon_state = "Blue GM Carpet"
	Gold_GM_Carpet
		layer = 2
		name = "Gold Carpet"
		icon_state = "Gold GM Carpet"
	Green_GM_Carpet
		layer = 2
		name = "Green Carpet"
		icon_state = "Green GM Carpet"
	Purple_GM_Carpet
		layer = 2
		name = "Purple Carps"
		icon_state = "Purple GM Carpet"

	Fancy_Tile
		layer = 2
		icon_state = "tile2"
	Stone_Floor
		layer = 2
		icon_state = "stonefloor"
	Red_Floor
		layer = 2
		icon_state = "redfloor"
	Purple_Floor
		layer = 2
		icon_state = "purpfloor"
	Green_Floor
		layer = 2
		icon_state = "greenfloor"
	Desert
		layer = 2
		icon_state = "desert"
	Black
		layer = 3
		icon_state = "b"
		density = 1
		opacity = 1
	Wood_Floor
		layer = 2
		icon_state = "Wood_Floor"
	Brick_Floor
		layer = 2
		icon_state = "Brick_Floor"
	Stone_Crystal_Path
		layer = 2
		icon_state = "Stone Crystal Path"
	Stone_Crystal_Wall
		layer = 3
		icon_state = "Stone Crystal Wall"
		density = 1
		opacity = 1
	Volcanic_Wall
		layer = 3
		icon_state = "VolcanicW"
		density = 1
		opacity = 1
	Volcanic_Floor
		layer = 2
		icon_state = "Volcanic"
	Kitchen_Floor
		layer = 2
		icon_state = "KTiles"
	Dance_Floor
		layer = 2
		icon_state = "Dance"
		verb
			Dance()
				set src in oview(1)
				set category = null
				view() << "<font color=purple>[usr.name] dances!"
				var/states=list("")
				states+="null"
				for(var/L in icon_states(usr.icon))
					states+=list("[L]")
				if("Dance" in states)
					usr.icon_state = "Dance"
				if("Dancing" in states)
					usr.icon_state = "Dancing"
				else
					return
	WFall
		layer = 3
		icon_state = "wfall"
		density = 1
	Castle_Tiles
		layer = 2
		icon_state = "CastleT"
	Castle_Wall
		layer = 3
		icon_state = "CastleW"
		density = 1
		opacity = 1
	Metallic_Tile
		layer = 2
		icon_state = "Metallic"
	Metallic_Wall
		layer = 3
		icon_state = "MetallicW"
		density = 1
		opacity = 1
	Snow
		layer = 2
		icon_state = "Snow"
	Ice
		layer = 2
		icon_state = "ice"
	DDR_Machine
	Deans_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Gold Dean's Chair"
		icon_state = "1"
		density = 1
	Deans_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		icon_state = "2"
		name = "Gold Dean's Chair"
		density = 1
	Deans_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Gold Dean's Chair"
		icon_state = "3"
		density = 1
	Deans_Chair
		layer = 3
		name = "Gold Dean's Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "4"
		density = 1
	Deans_Seat
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Gold Dean's Chair"
		icon_state = "5"
		density = 1
		verb
			Sit()
				set src in oview(3)
				set category = null
				var e = world.SetMedal("Deany Doll",usr,world.hub,world.hub_password)
				if(e == 1)
					usr << "You just earned the Deany Doll Medal!"
				else if(isnull(e))
					usr << "Hub could not be reached..."
				else
					usr << "Your cheeks settle into the golden chair."
				usr.loc = locate(20,119,2)
				usr.dir = 2
/*				if(usr.ckey == "golddean")
					usr.loc = locate(20,499,2)
					usr.dir = 2
				else
					alert(usr,"Your cheeks are not fit for this chair!","Halt!")
					return()
*/

	Deans_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Gold Dean's Chair"
		icon_state = "6"
		density = 1
	Deans_Chair
		layer = 3
		name = "Gold Dean's Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "7"
	Deans_Chair
		layer = 3
		name = "Gold Dean's Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "8"
	Deans_Chair
		layer = 3
		name = "Gold Dean's Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "9"
	Exgears_Chair
		layer = 3
		name = "Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "Exgear"
		density = 1
	Dakaggos_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Chair"
		icon_state = "Daka"
		density = 1
	Cherrys_Chair
		layer = 3
		name = "Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "Cherry"
		density = 1
	Toy_Dragons_Chair
		layer = 3
		name = "Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "Toy"
		density = 1
	Jaces_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Chair"
		icon_state = "Jace"
		density = 1
	Boreds_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Chair"
		icon_state = "Bored"
		density = 1
	Buffys_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Chair"
		icon_state = "Buffy"
		density = 1
	Drackons_Chair
		layer = 3
		name = "Chair"
		icon = 'Resource/Chair.dmi'
		icon_state = "Drackon"
		density = 1
	Themaggots_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Chair"
		icon_state = "Maggots"
		density = 1
	Bunnies_Chair
		layer = 3
		icon = 'Resource/Chair.dmi'
		name = "Chair"
		icon_state = "Bunnie"
		density = 1
	Dilapidated_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "DelapW"
		density = 1
		opacity = 1
	Dilapidated_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "DelapF"
	Sand_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "SandW"
		density = 1
		opacity = 1
	Sand_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "SandF"
	Jagged_Wall
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "JagW"
		density = 1
		opacity = 1
	Jagged_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "JagF"
	Diagnal_Wood
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "LCross"
	Waffle_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "Waffle"
		density = 1
		opacity = 1
	Wicker_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "WickW"
		density = 1
		opacity = 1
	Wicker_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "WickF"
	Proper_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "PropW"
		density = 1
		opacity = 1
	Proper_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "PropF"
	Log_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "LogW"
		density = 1
		opacity = 1
	Log_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "LogF"
	Red_Brick_Wall
		layer = 3
		icon = 'resource/tiles2.dmi'
		icon_state = "RBrick"
		density = 1
		opacity = 1
	Orange_Carpet
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "OCarpet"
	Marble_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "Marble"
	Log_Floor
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "LogF"
	Head_Board
		layer = 3
		icon = 'Resource/Bed.dmi'
		icon_state = "Bed U"
		density = 1
	Bed_Center
		icon = 'Resource/Bed.dmi'
		layer = 3
		icon_state = "Bed C"
	Bed_Covers
		layer = 7
		icon = 'Resource/Bed.dmi'
		icon_state = "Bed Cover"
	Bed_Bottom
		layer = 3
		icon = 'Resource/Bed.dmi'
		icon_state = "Bed D"
		density = 1
	Classy_Head_Board
		layer = 3
		icon = 'Resource/Bed.dmi'
		icon_state = "Bed2U"
		density = 1
	Classy_Bed_Center
		icon = 'Resource/Bed.dmi'
		layer = 3
		icon_state = "Bed2C"
	Classy_Bed_Covers
		icon = 'Resource/Bed.dmi'
		layer = 7
		icon_state = "Bed 2 Cover"
	Classy_Bed_Bottom
		icon = 'Resource/Bed.dmi'
		layer = 3
		icon_state = "Bed2D"
		density = 1
	Kiddy_Head_Board
		layer = 3
		icon = 'Resource/Bed.dmi'
		icon_state = "Bed3U"
		density = 1
	Kiddy_Bed_Center
		icon = 'Resource/Bed.dmi'
		layer = 3
		icon_state = "Bed3C"
	Kiddy_Bed_Covers
		icon = 'Resource/Bed.dmi'
		layer = 7
		icon_state = "Bed 3 Cover"
	Kiddy_Bed_Bottom
		icon = 'Resource/Bed.dmi'
		layer = 3
		icon_state = "Bed3D"
		density = 1
	Teddy_Bear
		icon = 'Resource/Bed.dmi'
		layer = 3
		icon_state = "Bear"
		density = 1
	Chimney
		icon = 'resource/fireplace.dmi'
		layer = 7
		icon_state = "2"
	Fire_Place_1
		icon = 'resource/fireplace.dmi'
		layer = 4
		icon_state = "4"
		density = 1
	Fire_Place_2
		icon = 'resource/fireplace.dmi'
		layer = 4
		icon_state = "5"
		density = 1
		verb
			Make_Fire()
				set category = null
				set src in oview(1)
				overlays += /obj/overlay/fire
			Put_Out_Fire()
				set category = null
				set src in oview(1)
				overlays -= /obj/overlay/fire
	Fire_Place_3
		icon = 'resource/fireplace.dmi'
		layer = 4
		icon_state = "6"
		density = 1
	Fire_Place_4
		icon = 'resource/fireplace.dmi'
		layer = 4
		icon_state = "7"
	Fire_Place_5
		icon = 'resource/fireplace.dmi'
		layer = 4
		icon_state = "8"
	Fire_Place_6
		icon = 'resource/fireplace.dmi'
		layer = 4
		icon_state = "9"
	TV
		layer = 4
		icon = 'resource/tv.dmi'
		density = 1
		verb/Watch_Golden_Yosh_n_Pals()
			set category = null
			set src in oview(3)
			icon_state = "gold"
			view() << "<B>[usr.name] turns to Golden Yoshi n' Pals!"
		verb/Watch_ChuChu_Vision()
			set category = null
			set src in oview(3)
			icon_state = "chu"
			view() << "<B>[usr.name] turns to ChuChu Vision!"
		verb/Watch_Chaolite_Zone()
			set category = null
			set src in oview(3)
			icon_state = "twi"
			view() << "<B>[usr.name] turns to the Chaolite Zone!"
		verb/Watch_Chao_News()
			set category = null
			set src in oview(3)
			icon_state = "news"
			view() << "<B>[usr.name] turns to the Chao News!"
		verb/Turn_Off()
			set category = null
			set src in oview(3)
			icon_state = ""
			view() << "<B>[usr.name] turns off the TV."
	Flowers
		icon = 'resource/flowers.dmi'
		icon_state = "Red"
	Log_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "logS"
	Metal_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "metalS"
	Fancy_Tile_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "tileS"
	Red_Carpet_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "redS"
	Gold_Carpet_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "goldS"
	Orange_Carpet_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "orangeS"
	Brick_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "brickS"
	Blue_Carpet_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "blueS"
	Green_Carpet_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "greenS"
	Purple_Carpet_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "purpleS"
	Wooden_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "woodS"
	Castle_Tile_Stairs
		layer = 2
		icon = 'resource/stairs.dmi'
		icon_state = "castleS"
	Kiddy_Wall
		layer = 3
		icon = 'resource/tiles3.dmi'
		icon_state = "kiddyw"
		density = 1
		opacity = 1
	Kiddy_Floor
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "kiddyf"
	Neon_Wall
		layer = 3
		icon = 'resource/tiles3.dmi'
		icon_state = "neonw"
		density = 1
		opacity = 1
	Neon_Floor
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "neonf"
	Chao_Wall
		layer = 3
		icon = 'resource/tiles3.dmi'
		icon_state = "chaow"
		density = 1
		opacity = 1
	Chao_Floor
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "chaof"
	Sidewalk
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "sidewalk"
	Asphalt
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "road"
	Line
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "line"
	Black_Carpet
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "blkcarp"
	White_Panaled_Wall
		layer = 3
		icon = 'resource/tiles3.dmi'
		icon_state = "panwhite"
		density = 1
		opacity = 1
	Kiddy_Table
		layer = 3
		icon = 'resource/tiles3.dmi'
		icon_state = "kiddytable"
		density = 1
	Kiddy_Couch
		layer = 4
		icon = 'resource/tiles3.dmi'
		icon_state = "kiddycouch"
	Bench
		layer = 4
		icon = 'resource/tiles3.dmi'
		icon_state = "bench"
	Choco_Floor
		layer = 2
		icon = 'resource/tiles3.dmi'
		icon_state = "chocf"
	Choco_Wall
		layer = 3
		icon = 'Resource/tiles3.dmi'
		icon_state = "chocw"
		opacity = 1
		density = 1
	Towel
		layer = 2
		icon = 'resource/town.dmi'
		icon_state = "towel"
	pfence
		layer = 3
		name = "Tall Fence"
		icon = 'Resource/fences.dmi'
		icon_state = "privacy"
		opacity = 1
		density = 1
	Window
		layer = 4
		icon = 'Resource/window.dmi'
		icon_state = "redv"
		density = 1
		opacity = 0
		verb
			Open_Blinds()
				set category = null
				set src in oview(1)
				src.dir = SOUTH
				src.opacity = 0
			Close_Blinds()
				set category = null
				set src in oview(1)
				src.dir = NORTH
				src.opacity = 1
obj
	GM_Door
		var/open = 0
		var/see
		var/pword = ""
		icon = 'resource/tiles.dmi'
		icon_state = "doorshut"
		layer = 4
		name = "Door"
		density = 1
		opacity = 1
		proc/gmtryit(var/mob/m)
			set background = 1
			if(src.open == 1)
				return 0
			else
				if(TGM.Find(m.ckey))
					src.open()
					return 0
				else
					m << "<I><B>GMs only.</I>"
					return 0
		proc/open()
			set background = 1
			src.density = 0
			src.opacity = 0
			src.open = 1
			flick("opening",src)
			src.icon_state = "dooropen"
			sleep(40)
			src.density = 1
			if(src.see == 0)
				src.opacity = 0
			else
				src.opacity = 1
			src.open = 0
			flick("closing",src)
			src.icon_state = "doorshut"
obj/warps
	Warp
		layer = 4
		icon = 'resource/metaldoor.dmi'
		icon_state = "warp"
		density = 1
		verb
			Use()
				set category = null
				set src in oview(1)
				if(private == 1)
					if(owner != usr.ckey)
						usr << "<font size=1><B>This is a private warp."
						return 0
				Portal()
	Telepad
		layer = 4
		name = "Warp"
		icon_state = "warp"
		density = 1
		verb
			Use()
				set category = null
				set src in oview(1)
				Portal()
obj
	GM_Table
		icon = 'resource/gmtable.dmi'
		layer = 3
		density = 1
		icon_state = "5"
		name = "Table"
	Grass
		layer = 2
		icon = 'resource/tiles2.dmi'
		icon_state = "grass"
proc
	Nofly(mob/M in world)
		if(!PGM.Find(M.ckey))
			M.density = 1

obj
	overlay
		fire
			icon = 'resource/fireplace.dmi'
			icon_state = "Fire"
			layer = 5
		kiddytv
			icon = 'resource/tiles3.dmi'
			icon_state = "kiddytv"
			layer = 5
	Cash_Register
		layer = 4
		icon = 'resource/town.dmi'
		icon_state = "register"
		density = 1

obj
	proc
		Portal()
			switch(input("Where would you like to teleport to?", "Warp") in list("Checkpoint","Special Area","Personal Warp","Cancel"))
				if("Checkpoint")
					switch(input("Where would you like to teleport to?", "Warp") in list("Center","North","North-East","East","South-East","South","South-West","West","North-West","Cancel"))
						if("Center")
							usr.loc = locate(125,125,1)
						if("South-West")
							usr.loc = locate(15,15,1)
						if("South")
							usr.loc = locate(125,15,1)
						if("South-East")
							usr.loc = locate(236,15,1)
						if("West")
							usr.loc = locate(15,125,1)
						if("East")
							usr.loc = locate(236,125,1)
						if("North-West")
							usr.loc = locate(15,236,1)
						if("North")
							usr.loc = locate(125,236,1)
						if("North-East")
							usr.loc = locate(236,236,1)
						if("Cancel")
							return 0
				if("Special Area")
					switch(input("Where would you like to teleport to?", "Warp") as null|anything in list("Chao Hall"))
						if(null)
							return 0
						if("Chao Hall")
							usr.loc = locate(20,82,2)
				if("Personal Warp")
					var/list/listTele=list()
					for(var/obj/warps/Warp/T in world)
						if(T.private == 1)
							if(T.owner == usr.ckey)
								listTele+=T
						else
							listTele+=T
					if(!listTele)
						return 0
					var/obj/telepoint=input(usr,"Select a Warp Point.","Warp") as null|anything in listTele
					if(telepoint)
						usr.loc=telepoint.loc
				if("Cancel")
					return 0
obj/sign
	Sign
		layer = 4
		icon_state = "sign"
		density = 1
obj/door
	Door
		icon_state = "doorshut"
		layer = 4
		name = "Door"
		density = 1
		opacity = 1
	Metal_Door
		icon = 'resource/metaldoor.dmi'
		icon_state = "doorshut"
		layer = 4
		name = "Metal Door"
		density = 1
		opacity = 1
	Garage_Door
		icon = 'resource/garagedoor.dmi'
		icon_state = "doorshut"
		layer = 7
		name = "Garage Door"
		density = 1
		opacity = 1
	Pfence_Gate
		icon = 'Resource/fencepgate.dmi'
		icon_state = "doorshut"
		layer = 7
		name = "Privacy Fence Gate"
		density = 1
		opacity = 1
	Kiddy_Door
		icon = 'resource/tiles3.dmi'
		icon_state = "doorshut"
		layer = 4
		name = "Kiddy Door"
		density = 1
		opacity = 1
	proc/tryit(var/mob/m)
		set background = 1
		if(src.open == 1)
			return 0
		if(src.owner == "[m.ckey]")
			if(!src.password)
				src.open()
				return 0
			else
				m << {"<font color=#C0FFC0>Remember, the password for your door is "[src.password]"."}
				src.open()
				return 0
		if(!src.password)
			src.open()
			return 0
		else
			var/choice = input("What is the password?","Door")as null|text
			if(choice == src.password)
				src.open()
				return 0
			else
				m << "<font color=#C0FFC0><I><B>Access Denied"
				return 0
	proc/open()
		set background = 1
		src.density = 0
		src.opacity = 0
		src.open = 1
		flick("opening",src)
		src.icon_state = "dooropen"
		sleep(40)
		src.density = 1
		if(src.see == 0)
			src.opacity = 0
		else
			src.opacity = 1
		src.open = 0
		flick("closing",src)
		src.icon_state = "doorshut"
obj
	Icon_Dispenser_Base
		icon = 'Resource/IconDispenser.dmi'
		icon_state = "Underlay"
		layer = 4
		pixel_y = -8
	Icon_Dispenser
		icon = 'Resource/IconDispenser.dmi'
		icon_state = "Base"
		layer = 7
		density = 1
		name = "Icon Dispenser"
		pixel_y = 8
		verb
			Take_Icon()
				set name ="Take Icon"
				set category = null
				set src in oview(2)
				switch(alert(usr,"Do you want to take the [name] icon?","Take Icon","Yes","No"))
					if("Yes")
						usr << ftp(icon)
	Ascending_Stairs
		icon = 'Resource/Stairs.dmi'
		icon_state = "up"
		layer = 4
		name = "Stairs"
		verb
			Ascend()
				set name ="-Ascend-"
				set category ="-Commands-"
				set src in oview(0)
				goup()

	Descending_Stairs
		icon = 'Resource/Stairs.dmi'
		icon_state = "down"
		layer = 4
		name = "Stairs"
		verb
			Descend()
				set name ="-Descend-"
				set category ="-Commands-"
				set src in oview(0)
				godown()
	Elevator
		icon = 'Resource/Stairs.dmi'
		icon_state = "ele"
		layer = 4
		name = "Elevator"
		verb
			Ascend()
				set name ="-Ascend-"
				set category ="-Commands-"
				set src in oview(0)
				goup()
			Descend()
				set name ="-Descend-"
				set category ="-Commands-"
				set src in oview(0)
				godown()
	proc
		goup()
			sleep(0.5)
			if(usr.z == 1)
				usr.z = 4
				sleep(1)
				usr << "<font size=1><B>You are now on the 2nd floor."
				return()
			if(usr.z == 4)
				usr.z = 5
				sleep(1)
				usr << "<font size=1><B>You are now on the 3rd floor."
				return()
			if(usr.z == 3)
				usr.z = 1
				sleep(1)
				usr << "<font size=1><B>You are now on the 1st floor."
				return()
			else
				..()
		godown()
			sleep(0.5)
			if(usr.z == 5)
				usr.z = 4
				sleep(1)
				usr << "<font size=1><B>You are now on the 2nd floor."
				return()
			if(usr.z == 4)
				usr.z = 1
				sleep(1)
				usr << "<font size=1><B>You are now on the 1st floor."
				return()
			if(usr.z == 1)
				usr.z = 3
				sleep(1)
				usr << "<font size=1><B>You are now in the basement."
				return()
			else
				..()