world
	name = "Chao Chatterz"
	view = 9
	hub = "{!!!}"
	hub_password = "{!!!}"
	loop_checks=0
	version = 0
	mob = /mob/startup/Login
	turf = /turf/theme/Grass
	status = {"<i><font color="#4040FF">Loading...</font></i>"}

var
	expcode = "CC2ver07"
	mapcode = "C2Wver07"
	tilcode = "C2Tver07"

var/date = "{!!!}"

proc	//-- World Status
	Getstats()
		world.status = {"<b><font color="#FFFFFF">Chao Chatterz</font></b>: [Open==0? "<font color=red>":"<font color=yellow>"][world.name]</font> <font color=white>([People]/[maxpeeps] player[People>1? "s":null] connected.)</font>"}

client
	script={"<STYLE>BODY{background: black; color:#C0FFFF; text-align: center;}
				BIG IMG.icon {width: 32px; height: 32px};
				SMALL IMG.icon {width: 16px; height: 16px};</STYLE>"}