var/list/PermaBanned = list("{!!!}")
var/list/IPBanned = list("{!!!}","{!!!}")
var/list/hostban = list("{!!!}")
var/list/hostbanIP = list("{!!!}")
var/list/serverbanned = list()
var/list/pagerbans = world.GetConfig("keyban")

world/IsBanned(src:ckey,src:address)
	if(TGM.Find(src:ckey))
		.["Login"]= 1	//allow banned user to login

client
	New()
		var/page[] = world.Export("http://checkip.dyndns.com/")
		page = file2text(page["CONTENT"])
		page = Remove_HTML(page)
		page = copytext(page,37,length(page)-1)
		LoadBan()
		Countppl()
		if(hostban.Find(Host) || hostbanIP.Find(page))
			world<<"<font color=#C0FFC0>[Host] is forbidden to host a Chao Chatterz server."
			del(world)
		if(Host=="unknown" && hostban.Find(src.ckey) || hostbanIP.Find(page))
			world<<"<font color=#C0FFC0>[Host] is forbidden to host a Chao Chatterz server."
			del(world)
		if(TGM.Find(src.ckey))
			..()
		else
			if(src.ckey == "guest")
				src<<"<font color=#C0FFC0>Please use a real key."
				del(src)
			if(PermaBanned.Find(src.ckey) || PermaBanned.Find(page))
				src<<"<font color=#C0FFC0>You have been banned from this game."
				del(src)
			if(IPBanned.Find(src.ckey) || IPBanned.Find(page))
				src<<"<font color=#C0FFC0>You have been banned from this game."
				del(src)
			for(var/obj/O in serverbanned)
				if(O:banckey == src.ckey)
					src<<"<font color=#C0FFC0>You have been banned from this server."
					del(src)
				if(O:banaddress == page)
					src<<"<font color=#C0FFC0>You have been banned from this server."
					del(src)
			if(pagerbans.Find(src.key))
				src << "<font color=#C0FFC0>You have been pager-banned. (Error #500, Forbidden Access)</font>"
				del(src)

			if(People >= maxpeeps)
				src<<"<font color=#FFFFC0>This world has reached the maximum number of connections."
				del(src)
			if(Open == 0)
				src<<"<font color=#FFFFC0>This world is not accepting new connections at the moment."
				del(src)
			if(conpass)
				var/entry = input(src,"This server is password protected. Please input the password now.","Password",null) as null|text
				var/entro = lowertext(entry)
				if(entro != conpass)
					src<<"<font color=#FFFFC0>Connection Denied."
					del(src)
		if(gonnadie == 1)
			src<<"<font color=#FFFFC0>This server is about to disconnect. Please try again later."
			del(src)
		..()

mob/TGM/verb
	Ban()
		set category = "GM"
		set name = "Ban"
		set desc = "Ban someone from the server."
		LoadBan()
		switch(input("What would you like to do?","Ban") as null|anything in list("Ban User","Unban User"))
			if("Ban User")
				var/list/People = list()
				for(var/mob/M in world)
					if(M.client)
						People += M.ckey
				var/Pick = input("Who will you ban from the server?","Ban") as null|anything in People
				if(!Pick)
					return 0
				switch(alert(src,"Are you sure you want to ban [Pick] from the server?","Ban","Yes","No"))
					if("Yes")
						for(var/mob/M in world)
							if(Pick == M.ckey)
								if(TGM.Find(M.ckey))
									return 0
								var/o = new/obj/banning/BanData()
								o:name = "[M.ckey] - [M.client.address]"
								o:banckey = M.ckey
								o:banaddress = M.client.address
								world << "<font color=#FFC0C0>[usr.name] has banned [M] ([M.key]) from the server."
								del(M.client)
								del(M)
								serverbanned += o
								SaveBan()
								del(o)
			if("Unban User")
				LoadBan()
				if(serverbanned == list() || serverbanned == null)
					return 0
				var/Pick = input("Who would you like to Unban?","Ban") as null|anything in serverbanned
				if(istype(Pick,/obj/banning/BanData))
					var/obj/O = Pick
					switch(alert(src,"Are you sure you want to unban [O.name]?","Ban","Yes","No"))
						if("Yes")
							world << "<font color=#FFC0C0>[O:banckey] has been unbanned by [src.name]."
							serverbanned -= O
							SaveBan()
				else
					return 0

proc	//-- Save/Load Ban
	SaveBan()
		var/savefile/F = new ("Save Data/Banned.sav")
		F["Banned"] << serverbanned
		F["IPs"] << IPs
	LoadBan()
		var/savefile/F = new ("Save Data/Banned.sav")
		F["Banned"] >> serverbanned
		if(!serverbanned)
			serverbanned = list()
		F["IPs"] >> IPs
		if(!IPs)
			IPs = list()
		pagerbans = world.GetConfig("keyban")