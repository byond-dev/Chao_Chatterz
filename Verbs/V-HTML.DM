mob
	Topic(href,href_list[])
		switch(href_list["action"])
			if("ips")
				var/iplist=""
				for(var/A in IPs)
					if(!findtext(iplist,A))
						iplist+="[A]<br>"
				iplist+="<HR>"
				var/ips = {"<html>
<TITLE>IP List</TITLE>
<body>
<font face="Courier New">
"[world.name]"<br>
[HostIP] - [Host]
<HR>
[iplist]
</font>
</body></html>"}
				client << browse(ips)
			if("log")
				var/time = time2text(world.realtime)
				log += "<HR><center>Log updated on [time].</center><HR>"
				var/worldlog = {"<html>
<TITLE>[world.name] Log</TITLE>
<body>
<font face="Courier New">
"[world.name]", hosted by [Host]<br>
<hr>
Log from <b>[time2text(creation,"Day, Month DD, YYYY at hh:mm:ss")]</b> to <b>[time]</b>.
[log]
</font>
<!-- Valid Chao Chatterz Log-->
</body></html>"}
				var/logname = "Save Data/Logs/[time2text(creation,"MM-DD-YY @ hh-mm-ss")].clog"
				var/logfile = new/savefile("[logname]")
				logfile["Sig"] << "thisisachaolog"
				logfile["Log"] << "[worldlog]"
				client << browse(worldlog)
			if("manu")
				var/manu = {"<html>
<TITLE>Chao Chatterz Rule Book</TITLE>
<body TEXT="008080" LINK="000000" ALINK="000000" VLINK="000000" bgcolor="#000000" MARGINWIDTH="0" MARGINHEIGHT="0 LEFTMARGIN="0" TOPMARGIN="0">
<center>
<a href="http://games.byond.com/hub/GoldDean/ChaoChatterz"><img src="http://games.byond.com/banners/16177.jpg"></a><br>
<font face="Comic Sans MS">
<table width="90%"><td bgcolor="#666666"><center><br>
<table width="95%" height="95%" bgcolor="#FFFFFF" cellpadding="2" bordercolor="#000000" border>
<tr><td><center>1.</td><td><center>Do Not Spam</td>
<td colspawn="2"><font size="-1"><i>This includes chat spam, build spam and verbs. Punishment can range from a simple mute to a Perma-Ban..</i></td></tr>
<tr><td><center>2.</td><td><center>Do Not Impersonate</td>
<td colspawn="2"><font size="-1"><i>This includes using names, keys, icons or anything else that may mislead the community into believing you are someone else. It is illegal to impersonate anyone, this includes players and GMs alike.</i></td></tr>
<tr><td><center>3.</td><td><center>Do Not Rip</td>
<td colspawn="2"><font size="-1"><i>ChaoChatterz has 100% custom turf icons made from scratch. You can make your own, too. Anyone who is caught ripping will be reguarded as an enemy to the ChaoChatterz community; expect to have an unpleasant time on BYOND. Also, you may not rip the icons of players in-game. Anyone caught doing so will be banned.</i></td></tr>
<tr><td><center>4.</td><td><center>Do Not Advertise</td>
<td colspawn="2"><font size="-1"><i>Do not advertise other games or other ChaoChatterz servers in an attempt to steal users from ChaoChatterz or the server. Advertising your own work for the opinion of other players is okay, but expect to be banned if you are trying to recruit ChaoChatterz players to join your game. Whether or not you are trying to recruit is entirely up to the moderator; you will not have a say in this judgement.</i></td></tr>
<tr><td><center>5.</td><td><center>No Adult Content</td>
<td colspawn="2"><font size="-1"><i>ChaoChatterz is a game aimed towards children and teens. There is no room for inappropriate content. Any icons, images or audio presented will result in immediate punishment.</i></td></tr>
<tr><td><center>6.</td><td><center>Do Not Abuse Shout</td>
<td colspawn="2"><font size="-1"><i>Please do not use Shout unless it is necessary. If you are roleplaying, please do not use Shout unless it is necessary to contact your fellow roleplayers.</i></td></tr>
<tr><td><center>7.</td><td><center>Do Not Depress</td>
<td colspawn="2"><font size="-1"><i>Its okay to role play, however, do not mopre, advocating your depression in an attempt to gain attention. You will be muted.</i></td></tr>
<tr><td><center>8.</td><td><center>No Ghosts</td>
<td colspawn="2"><font size="-1"><i>You may not use invisible icons or empty names. You will be banned instantly if caught doing this. There are ways for moderators to ban you even with no name. Do not try your luck.</i></td></tr>
<tr><td><center>9.</td><td><center>Do Not Ask for GM Powers</td>
<td colspawn="2"><font size="-1"><i>There is a forum in which you can sign up to be put on Trial. Please use it if you wish to try to gain GM powers.</i></td></tr>
<tr><td><center>10.</td><td><center>Do Not Request Unbans</td>
<td colspawn="2"><font size="-1"><i>If someone has been banned, you have no say in the matter. Once a punishment is fulfilled, it is none of your business. Do not request a player's unban or any of the likes.</i></td></tr>
<tr><td><center>11.</td><td><center>Do Not Overlap</td>
<td colspawn="2"><font size="-1"><i>Please refrain from overlapping someone's audio without permission. Self and View playing is exempt from this rule.</i></td></tr>
<tr><td><center>12.</td><td><center>No Adult Roleplaying</td>
<td colspawn="2"><font size="-1"><i>A large portion of ChaoChatterz's players are under the age of 14. It is not appropriate to have any adult roleplaying. Please take any of these conversations elsewhere. Anyone caught doing this in ChaoChatterz in any form including whisper will be perma-banned from the game. There are no warnings or second chances for this rule. If you are caught, you will have your access to ChaoChatterz terminated.</i></td></tr>
<tr><td><center>13.</td><td><center>Do Not Invade</td>
<td colspawn="2"><font size="-1"><i>If a player requets that you leave his or her private area, please be kind and do so. If you fail to heed this, a GM may be summoned to expell you from the area.</i></td></tr>
</tr></td></table><br>
</center></td></table>
<a href="http://games.byond.com/hub/GoldDean/ChaoChatterz"><img src="http://games.byond.com/banners/16177.jpg"></a>
<table width="90%"><td bgcolor="#666666"><center><br>
<table width="95%" height="95%" bgcolor="#FFFFFF" cellpadding="2" bordercolor="#000000" border>
<tr><td><center>1.</td><td><center>GMs Shall Not Bias</td>
<td colspawn="2"><font size="-1"><i>Moderators shall never give players better treatment over other players due to friendships and/or rivalries.</i></td></tr>
<tr><td><center>2.</td><td><center>GMs Shall Not Exclude</td>
<td colspawn="2"><font size="-1"><i>Moderators shall never create public areas that disallow certain players from entering.</i></td></tr>
<tr><td><center>3.</td><td><center>GMs Shall Not Act<br>without Proof</td>
<td colspawn="2"><font size="-1"><i>Moderators shall never ban a player from a server without viable proof that he or she has made an offense.</i></td></tr>
<tr><td><center>4.</td><td><center>GMs Shall Not Abuse</td>
<td colspawn="2"><font size="-1"><i>Moderators shall ONLY use their GM powers for the good of ChaoChatterz and never for personal gain.</i></td></tr>
</tr></td></table><br>
</center></td></table>
<a href="http://games.byond.com/hub/GoldDean/ChaoChatterz"><img src="http://games.byond.com/banners/16177.jpg"></a>
</center></font>
</body></html>"}
				client << browse(manu)
			else return ..()

mob/Basic
	verb
		Rule_Book()
			set category = "-Commands-"
			src << link("byond://?src=\ref[src];action=manu")
var/sd/sd = new()

proc
	LoopLog()
		MakeLog()
		spawn(6000) LoopLog()
	MakeLog()
		var/time = time2text(world.realtime)
		log += "<HR><center>Log updated on [time].</center><HR>"
		var/worldlog = {"<html>
<TITLE>[world.name] Log</TITLE>
<body>
<font face="Courier New">
"[world.name]", hosted by [Host]<br>
<hr>
Log from <b>[time2text(creation,"Day, Month DD, YYYY at hh:mm:ss")]</b> to <b>[time]</b>.
[log]
</font>
<!-- Valid Chao Chatterz Log-->
</body></html>"}
		var/logname = "Save Data/Logs/[time2text(creation,"MM-DD-YY @ hh-mm-ss")].clog"
		var/logfile = new/savefile("[logname]")
		logfile["Sig"] << "thisisachaolog"
		logfile["Log"] << "[worldlog]"


sd	// custom datum that has the HTML processing procs.
	proc
		ProcessHTML(Text as text)
			var/output = ""
			var/leftbrace = findtext(Text,"<")
			while(leftbrace)
				var/rightbrace = findtext(Text,">",leftbrace)
				if(rightbrace)
					output += copytext(Text,1, leftbrace)

					var/HTML = copytext(Text,leftbrace+1,rightbrace)
					var/space = findtext(HTML," ")
					var/Tag = uppertext(copytext(HTML,1,space))
					var/list/Attributes = list()
					while(space)
						var/endtag = findtext(HTML,"=", space+1)
						var/spacedtag = findtext(HTML," ", space+1)
						if(spacedtag && (spacedtag < endtag))
							endtag = spacedtag
						if(endtag)
							var/attr = uppertext(copytext(HTML, space+1,endtag))
							var/current_char = copytext(HTML,endtag,endtag+1)
							while((current_char == " ") || (current_char == "="))
								current_char = copytext(HTML,++endtag,endtag+1)
							space = findtext(HTML," ",endtag)
							var/value = copytext(HTML,endtag,space)
							Attributes[attr] = value
						else
							space = findtext(HTML," ",space+1)

					output += ProcessTag(Tag, Attributes, "<[HTML]>")
					Text = copytext(Text, rightbrace+1)
					leftbrace = findtext(Text,"<")
				else
					leftbrace = 0
			output += Text
			return output

		RemoveHTML(Text as text)
			var/output = ""
			var/leftbrace = findtext(Text,"<")
			while(leftbrace)
				var/rightbrace = findtext(Text,">",leftbrace)
				if(rightbrace)
					output += copytext(Text,1, leftbrace)

					var/HTML = copytext(Text,leftbrace+1,rightbrace)
					var/space = findtext(HTML," ")
					var/list/Attributes = list()
					while(space)
						var/endtag = findtext(HTML,"=", space+1)
						var/spacedtag = findtext(HTML," ", space+1)
						if(spacedtag && (spacedtag < endtag))
							endtag = spacedtag
						if(endtag)
							var/attr = uppertext(copytext(HTML, space+1,endtag))
							var/current_char = copytext(HTML,endtag,endtag+1)
							while((current_char == " ") || (current_char == "="))
								current_char = copytext(HTML,++endtag,endtag+1)
							space = findtext(HTML," ",endtag)
							var/value = copytext(HTML,endtag,space)
							Attributes[attr] = value
						else
							space = findtext(HTML," ",space+1)
					if((length(HTML)<2) || findtext(HTML,"<", 2)) return
					Text = copytext(Text, rightbrace+1)
					leftbrace = findtext(Text,"<")
				else
					leftbrace = 0
			output += Text
			return output

		ProcessTag(Tag as text, list/Attributes, HTML as text)
			if((length(HTML)<2) || findtext(HTML,"<", 2)) return
			switch(Tag)
				if("FONT")	// disable the SIZE attribute of the FONT tag
					if(Attributes["SIZE"])
						Attributes -= "SIZE"
						HTML = ""
						for(var/Attr in Attributes)
							HTML += " [Attr]=[Attributes[Attr]]"
				if("/FONT")
					return "</FONT>"
				else
					HTML = ""
			return HTML