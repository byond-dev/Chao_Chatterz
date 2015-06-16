var						//-- Universal Variables
	log = "<HR>"		//-- Server Chat Log
	creation = "unknown"		//-- Server Birth
	Host = "unknown"	//-- The Host			(Default = "unknown".)
	HostMSG = "Unknown"	//-- The Host Key		(Default = "Unknown".)
	HostIP = "127.0.0.1"	//-- The Host's IP		(Default = 127.0.0.1.)
	BMax = 750			//-- Build Limit		(Default = 750.)
	musicsize = 358400	//-- Maximum Sound Size	(Default = 350 KB.)
	iconsize = 307200	//-- Maximum Icon Size	(Default = 300 KB.)
	musicsizemsg = "350 KB"		//-- Sound Size Message
	iconsizemsg	= "300 KB"		//-- Icon Size Message
	People = 0			//-- Number of Players	(Default = 0.)
	Open = 1			//-- Server is Open		(1 = Yes, 0 = No)
	swear = 0			//-- Cuss Filters		(1 = On, 0 = Off)
	maxpeeps = 75		//-- Maximum Players	(Default = 75 players.)
	soundopt = 0		//-- Sound Options		(0 = All, 1 = Only Midis, 2 = Off)
	woundopt = 0		//-- World Play Options	(0 = On, 1 = Off)
	conpass = null		//-- World Password		(Default = null)
	assssin = null
	gonnadie = 0
var/list				//-- Universal Lists
	muted = list()		//-- Muted People
	buildless = list()	//-- People who can't build.
	songmuted = list()	//-- People who can't play songs.
	jailed = list()		//-- People who are jailed.
	IPs = list()		//-- Logs ALL IPs that enter the server.

mob/var					//-- Mob Variables
	nayme				//-- Colored Name
	saysetting = 0		//-- Say Options		(0 = View, 1 = Shout, 2 = GM)
	ignoretele = 0		//-- Ignore Teleport	(1 = Yes, 0 = No)
	ignorefami = 0		//-- Ignore Family		(1 = Yes, 0 = No)
	NoBuild = 0			//-- Disable Build		(1 = Yes, 0 = No)
	numobj = 0			//-- Number of Objects	(Default = 0.)
	Mute = 0			//-- User is Muted		(1 = Yes, 0 = No)
	songmute = 0		//-- User is Songmuted	(1 = Yes, 0 = No)
	AFK					//-- User is AFK		(1 = Yes, 0 = No)
	Flying = 1			//-- User has density.	(1 = Yes, 0 = No)
	Warning = 0			//-- Warning level		(Default = 0.)
	watchchat = 0		//-- Monitor Chats		(0 = Normal, 1 = View Say, 2 = View Whisper, 3 = View Both)
	Jailed = 0			//-- Jailed?			(1 = Yes, 0 = No)
	fontclr	= "008080"	//-- Font Color			(Default = #008080)
	naymecol = "FFFFFF"	//-- Name Color			(Default = #000000)
mob/var				//-- Ghost Mode Variables
	ghost = 0			//-- Ghost Mode?		(1 = Yes, 0 = No)
	ghosticon
	ghosticon_state
	ghostname

mob/var/list		//-- Family Variables
	spouse = ""
	parents	= list("")
	siblings = list("")
	children = list("")
	pets = list("")

mob/var/list			//-- Mob Lists
	ignorelist = list()	//-- Ignore List		(Default = Blank.)
	nowhisp	= list()	//-- No Whisper List	(Default = Blank.)
	undurlays = list()	//-- Underlays
	ovurlays = list()	//-- Overlays

obj/var
	owner = null		//-- Object's Owner		(Default = Blank.)

obj/elect/var
	channel = 0			//-- Object's Channel	(Default = Off.)

obj/sign/var
	msg = null			//-- Object's Message	(Default = Blank.)
	sig = null			//-- Object Owner Key	(Default = Blank.)

obj/door/var
	password = null		//-- Object's Password	(Default = Blank.)
	open = 0
	see = 1

obj/banning/BanData
obj/banning/var			//-- Banned Variables
	banckey = null		//-- Banned ckey
	banaddress = null	//-- Banned IP
obj/warps/var
	private = 0			//-- Personal			(1 = Yes, 0 = No)
obj/unique/GMchair/var
	thatgm = "Unknown"	//-- Whose chair?		(Default = Unknown)