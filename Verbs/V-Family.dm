mob/Basic/verb/Family()	//-- Family
	set category = "-Commands-"
	set name = "Family Options"
	set desc = "Add/Remove Family Members."
	switch(input("What would you like to do?","Family") as null|anything in list("Add Family","Remove Family","Check Family"))
		if("Add Family")
			var/list/people = list()
			for(var/mob/M in world)
				if((M.client)&&(M.ckey!="[src.ckey]"))
					people += M
			var/mob/G = input("Who would you like to ask?","Family") as null|anything in people
			if(!G)
				return 0
			if(G.ignorelist.Find(usr.key))
				return 0
			if(G.ignoretele)
				src << "This user is not accepting these requests right now."
				return 0
			var/list/youcando = list()
			if((src.spouse!="[G.key]")&&(!src.siblings.Find("[G.key]"))&&(!src.children.Find("[G.key]"))&&(!src.pets.Find("[G.key]")))
				if(!G.spouse)
					youcando += list("Marry")
				youcando += list("Become Siblings")
				youcando += list("Adopt as Child")
				youcando += list("Adopt as Pet")
			if(youcando==list())
				alert(src,"There's nothing you can do with this person!","Family")
				..()
			var/gkey
			for(var/mob/K in world)
				if("[K]" == "[G]")
					gkey = "[G.key]"
			switch(input(src,"What would you like to do with [G]?","Family") as null|anything in youcando)
				if("Marry")
					switch(alert(G,"[src.name] proposes to you! Do you accept?", "Family", "Yes","No"))
						if("Yes")
							world << "<font color=#C0FFC0>[src.name] and [G] have married eachother!"
							G.spouse = "[usr.key]"
							src.spouse = "[gkey]"
							return 0
						if("No")
							src << "<font color=#FFC0C0>[G] has declined your marriage request."
							return 0
				if("Become Siblings")
					switch(alert(G,"[src.name] wants to be siblings! Do you accept?", "Family", "Yes","No"))
						if("Yes")
							world << "<font color=#C0FFC0>[src.name] and [G] have become siblings!"
							G.siblings += "[usr.key]"
							src.siblings += "[gkey]"
							return 0
						if("No")
							src << "<font color=#FFC0C0>[G] has declined your sibling request."
							return 0
				if("Adopt as Child")
					switch(alert(G,"[src.name] wants to adopt you as a child! Do you accept?", "Family", "Yes","No"))
						if("Yes")
							world << "<font color=#C0FFC0>[src.name] has adopted [G] as a child!"
							G.parents += "[usr.key]"
							src.children += "[gkey]"
							return 0
						if("No")
							src << "<font color=#FFC0C0>[G] has declined your adoption request."
							return 0
				if("Adopt as Pet")
					switch(alert(G,"[src.name] wants to adopt you as a pet! Do you accept?", "Family", "Yes","No"))
						if("Yes")
							world << "<font color=#C0FFC0>[src.name] has adopted [G] as a pet!"
							G.parents += "[usr.key]"
							src.pets += "[gkey]"
							return 0
						if("No")
							src << "<font color=#FFC0C0>[G] has declined your adoption request."
							return 0
		if("Remove Family")
			var/list/youcando = list("")
			var/sibnum = -1
			var/parnum = -1
			var/chinum = -1
			var/petnum = -1
			for(var/a in src.siblings)
				sibnum += 1
			for(var/b in src.parents)
				parnum += 1
			for(var/c in src.children)
				chinum += 1
			for(var/d in src.pets)
				petnum += 1
			if(src.spouse)
				youcando += "Divorce"
			if(sibnum>=1)
				youcando += "Remove Sibling"
			if(parnum>=1)
				youcando += "Emancipate Self"
			if(chinum>=1)
				youcando += "Disown Child"
			if(petnum>=1)
				youcando += "Disown Pet"
			if((!src.spouse)&&(sibnum==0)&&(parnum==0)&&(chinum==0)&&(petnum==0))
				alert(src,"There's nothing you can do!","Family")
				return 0
			switch(input(src,"What would you like to do?","Family") as null|anything in youcando)
				if("Divorce")
					if(src.spouse)
						switch(alert("Are you sure you want to divorce [src.spouse]?","Family","Yes","No"))
							if("Yes")
								for(var/mob/M in world)
									if(M.key == src.spouse)
										M << "<font color=#FFC0C0>[src] has divorced you."
										M.spouse = null
								src.spouse = ""
					else
						alert("You don't have a spouse.","Family")
						..()
				if("Remove Sibling")
					if(src.siblings)
						var/sib = input("Which sibling will you remove?","Family") as null|anything in src.siblings
						if(!sib)
							return 0
						else
							switch(alert("Are you sure you want to remove [sib] as a sibling?","Family","Yes","No"))
								if("Yes")
									for(var/mob/M in world)
										if(M.key == sib)
											M << "<font color=#FFC0C0>[src] has removed you as a sibling."
											M.siblings -= "[usr.key]"
									src.siblings -= "[sib]"
					else
						alert("You don't have siblings.","Family")
						..()
				if("Disown Child")
					if(src.children)
						var/sib = input("Which child will you remove?","Family") as null|anything in src.children
						if(!sib)
							return 0
						else
							switch(alert("Are you sure you want to remove [sib] as a child?","Family","Yes","No"))
								if("Yes")
									for(var/mob/M in world)
										if(M.key == sib)
											M << "<font color=#FFC0C0>[src] has removed you as a child."
											M.parents -= "[usr.key]"
									src.children -= "[sib]"
					else
						alert("You don't have children.","Family")
						..()
				if("Disown Pet")
					if(src.pets)
						var/sib = input("Which pet will you remove?","Family") as null|anything in src.pets
						if(!sib)
							return 0
						else
							switch(alert("Are you sure you want to remove [sib] as a pet?","Family","Yes","No"))
								if("Yes")
									for(var/mob/M in world)
										if(M.key == sib)
											M << "<font color=#FFC0C0>[src] has removed you as a pet."
											M.parents -= "[usr.key]"
									src.pets -= "[sib]"
					else
						alert("You don't have pets.","Family")
						return 0
				if("Emancipate Self")
					if(src.parents)
						var/sib = input("Which parent will you remove?","Family") as null|anything in src.parents
						if(!sib)
							return 0
						else
							switch(alert("Are you sure you want to remove [sib] as a parent?","Family","Yes","No"))
								if("Yes")
									for(var/mob/M in world)
										if(M.key == sib)
											M << "<font color=#FFC0C0>[src] has removed you as a parent."
											M.children -= "[usr.key]"
											M.pets -= "[usr.key]"
									src.parents -= "[sib]"
					else
						alert("You don't have parents.","Family")
						..()
		if("Check Family")
			var/list/everyfam = list()
			var/sibnum = -1
			var/parnum = -1
			var/chinum = -1
			var/petnum = -1
			for(var/a in src.siblings)
				sibnum += 1
			for(var/b in src.parents)
				parnum += 1
			for(var/c in src.children)
				chinum += 1
			for(var/d in src.pets)
				petnum += 1
			if(src.spouse)
				everyfam += "-=Spouse=-"
				everyfam += spouse
			if(sibnum>=1)
				everyfam += "-=Siblings=-"
				everyfam += siblings
			if(parnum>=1)
				everyfam += "-=Parents=-"
				everyfam += parents
			if(chinum>=1)
				everyfam += "-=Children=-"
				everyfam += children
			if(petnum>=1)
				everyfam += "-=Pets=-"
				everyfam += pets
			if((!src.spouse)&&(sibnum==0)&&(parnum==0)&&(chinum==0)&&(petnum==0))
				alert("You don't have any family...","Family")
				return 0
			input("Your family is as follows:","Family") in everyfam
		else
			return 0