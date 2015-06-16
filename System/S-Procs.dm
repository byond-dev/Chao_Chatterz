var/filesize
var/filemsg

proc	//-- Filesize Message
	Size(file as num)
		filemsg = "[file] Bytes"
		if(file >= 1024)
			var/n = file / 1024
			filemsg = "[n] KB"
			if(n >= 1024)
				var/o = n / 1024
				filemsg = "[o] MB"

proc/extension(G as file)	//-- Extension Checker
	var/file = "[G]"
	for(var/i=length(file);i>0;i--)
		if(copytext(file,i,i+1) == ".") return copytext(file,i+1)

proc	//-- Save/Load Mute
	SaveMute()
		var/savefile/F = new ("Save Data/Mute List.sav") // or whatever you know =\ the save name dont matta
		F["muted"] << muted
		F["buildless"] << buildless
		F["jailed"] << jailed
		F["songmuted"] << songmuted
	LoadMute()
		var/savefile/F = new ("Save Data/Mute List.sav")
		F["muted"] >> muted
		F["buildless"] >> buildless
		F["jailed"] >> jailed
		F["songmuted"] >> songmuted
		if(!muted)
			muted = list()
		if(!buildless)
			buildless = list()
		if(!songmuted)
			songmuted = list()
		if(!jailed)
			jailed = list()
		if(usr.Jailed == 1)
			usr.loc= locate(20,57,2)
			usr.verbs.Remove(typesof(/mob/Basic/verb/))
			usr.verbs.Remove(typesof(/mob/Customize/verb/))
			usr.verbs.Remove(typesof(/mob/Build/verb/))
			usr << "<font color=#C0FFC0>You are in jail."

proc	//-- Cuss Filter
	filter(say as text)
		var/p
		say = "" + copytext(say,1) + ""
		if(profanity.len)
			for(var/i=1,i<=profanity.len,i++)
				p = findtext(say,profanity[i])
				while(p)
					say = copytext(say,1,p) + profanfix[i] + copytext(say,p+length(profanity[i]))
					p = findtext(say,profanity[i])
		return say

var/list	//-- Cusses
	profanity = list("fuck","shit","cunt","faggot","fag","cock","penis","vagina","pussy","pussies","asshole","nigger","nigga","slut","whore","douche","twat","clit","clitorous","bitch","ass hole","vulva","ebaumsworld")
	profanfix = list("****","****","****","******","***","****","*****","******","*****","*******","*******","******","*****","****","*****","******","****","****","*********","*****","********","*****","YTMND")

proc	//-- HTML Removal
	Remove_HTML(string)
		while(findtext(string,"<"))
			var/i = findtext(string,"<")
			var/ii = findtext(string,">")
			if(ii) string = copytext(string,1,i) + copytext(string,ii+1)
			else string = copytext(string,1,i) + copytext(string,i+1)
		while(findtext(string,">"))
			var/i = findtext(string,">")
			if(i) string = copytext(string,1,i) + copytext(string,i+1)
		if(!string)
			string = "BLANK"
		return string

proc	//-- Peep counter
	Countppl()
		People=0
		for(var/mob/M in world.contents)
			if(!M.client)
				del(M)
			else
				if(M.ckey == null)
					del(M)
				else
					People+=1
		Getstats()

mob/proc	//-- Watch
	track(mob/M)
		src.client.eye = M
		src.client.perspective = EYE_PERSPECTIVE