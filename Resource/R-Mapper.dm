//////****************Crispy.Mapper****************\\\\\\
                ////January 24, 2003\\\\

/*

	Crispy.Mapper is a rarity - a library with only one proc! :-D

	Mapper lets you display maps of the game world to players, using
	the built-in browser. Turfs, mobs, and objs are all displayed on
	this map. If you wish to exclude certain types of atoms, pass
	those types in a list to cr_browsermap() as the fourth argument.

	See the demo for an example!

	Mapper is limited to one Z level at a time, and always displays the
	entire Z level. If you really need this to be changed, email me
	and I'll add that feature. :-)

	The proc to use is:
		cr_browsermap(zlevel=1,tilesizex=16,tilesizey=16,
			denytypes[],windowname="map",browseopt="")

	zlevel						- The Z level to map.
	tilesizex,tilesizey		- The x and y size of each tile in the browser
									  window.
	denytypes[]					- A list of atom types to exclude from the map.
	windowname					- The name of the browser window. Set this to
									  null to use the built-in browser pane.
	browseopt					- Any additional options to pass to browse().

	Thanks to:

	- AbyssDragon, for assistance in solving two elusive bugs.
	  He was kind enough to help in a lot of testing runs!
	  Also, the mob icon is his - it was "borrowed" from
	  AbyssDragon.AbyssSprites. :-)

	- Gughunter, for inspiring the idea for this library by making his
	  unterra.monstoro.MapCompress library, which does basically the
	  same thing as this one does but with text instead of images. If
	  this library is too slow for your liking, MapCompress is the one
	  to check out. :-)

	- tenkuu, for much-valued assistance in testing!

	Send bug fixes, comments, suggestions, etc. to cpelling@webone.com.au

*/

mob/ADM/verb
	displaymap()
		set category="GM"
		set name = "Bird's Eye View"
		set desc="See everything in a 25-tile radius."
		src << "Displaying map... (Size: [world.maxx]x[world.maxy])"
		src.cr_browsermap(25,src.z)
		src << "Map displayed."


mob/proc/cr_browsermap(zone,zlevel=1,tilesizex=16,tilesizey=16,denytypes[/turf,/area],windowname="map",browseopt="")
	////////Send the map to the mob's browser window
	var/filename="crmap[ckey].tmp"

	//Display "please wait" message
	src << browse("<body bgcolor=black text=white><p align=center>\
	<font size=5 face='Verdana'>...please wait...</font></body>","window=[windowname],\
	size=[((zone*tilesizex)*2.1)]x[(zone*tilesizey)*2.1],[browseopt]")

	var/html="<html><body bgcolor=black><table border=0 cellspacing=0 cellpadding=0><center>"

	//If the temp. file exists, delete it
	if (fexists(filename)) fdel(filename)

	//Display everything in the world
	for (var/y=src.y+zone,y>=src.y-zone,y--)
		html+="</tr><tr>"
		text2file(html,filename)
		html=""
		sleep()
		for (var/x=src.x-zone,x<=src.x+zone,x++)
			//Turfs
			var/obj/T=locate(x,y,zlevel)
			if (!T) continue
			var/icon/I=icon(T.icon,T.icon_state)
			var/imgstring=dd_replacetext("[T.type]-[T.icon_state]","/","_")
			var/ownerstring

			//Movable atoms
			for (var/atom/movable/A in T)
				//Make sure it's allowed to be displayed
				var/allowed=1
				for (var/X in denytypes)
					if (istype(A,X))
						allowed=0
						break
				if (!allowed) continue

				if (A.icon) I.Blend(icon(A.icon,A.icon_state,A.dir),ICON_OVERLAY)
				imgstring+=dd_replacetext("__[A.type]_[A.icon_state]","/","_")
				if(istype(A,/mob))
					ownerstring+=dd_replacetext("{P}[A:name] - ([A:ckey])\n","/","_")
				if(istype(A,/obj))
					ownerstring+=dd_replacetext("[A:name] - ([A:owner])\n","/","_")

			//Output it
			src << browse_rsc(I,"[imgstring].dmi")
			html+="<td><img src=\"[imgstring].dmi\" width=[tilesizex] height=[tilesizey] alt=\"\n[ownerstring]\"></td>"

	text2file("</table></center></body></html>",filename)

	//Display it
	src << browse(file(filename),"window=[windowname],\
	size=[((zone*tilesizex)*2.1)]x[(zone*tilesizey)*2.1],[browseopt]")

///////////////////
// TEXT HANDLING //
///////////////////
/*
 This text handling library is a Deadron core library,
 providing some helpful text functions not found in BYOND.

 To include this library, click the library checkbox in the
 Lib folder of the file tree, or add this line in your code:

#include <deadron/texthandling>

 If you have suggestions or questions, please email
 ron@deadron.com.

 Copyright (c) 1999, 2000, 2001, 2002, 2003 Ronald J. Hayden. All rights reserved.

 09/12/03: Integrated Crispy's changes so dd_text2list() supports non-text items in list.
 02/10/02: Added dd_centertext() and dd_limittext().

dd_file2list(file_path, separator = "\n")
	Splits the text from the specified file into a list.
	file_path is the path to the file.
	separator is an optional delimiter between items in the file;
	it defaults to "\n", which makes each line of the file an item in the list.

	Example:

	// Read in the list of possible NPC names.
	var/list/names = dd_file2list("NPCs.txt")

dd_replacetext(text, search_string, replacement_string)
	Returns a new string replacing all occurrences of search_string in text
	with replacement_string. This is not case-sensitive.

	Example:

	verb/say(msg as text)
		// Don't let the player fake people out using line breaks when they say things.
		// Replace any instances of <BR> or /n with a space.
		var/search_string = "<BR>"
		var/replacement = " "
		var/sanitized_text = dd_replacetext(msg, search_string, replacement)

		search_string = "/n"
		sanitized_text = dd_replacetext(sanitized_text, search_string, replacement)

		view(src) << sanitized_text
		return

dd_replaceText(text, search_string, replacement_string)
	The case-sensitive version of dd_replacetext().

dd_hasprefix(text, prefix)
	Returns 1 if the text has the specified prefix, 0 otherwise.  This version is not case sensitive.

	Example:

	// Does the player's name have GM as the prefix?
	if (dd_hasprefix(name, "GM"))
		// Give them GM abilities.

dd_hasPrefix(text, prefix)
	The case-sensitive version of dd_hasprefix.

dd_hassuffix(text, suffix)
	Returns 1 if the text has the specified prefix, 0 otherwise.
	This version is not case sensitive.

dd_hasSuffix(text, suffix)
	Returns 1 if the text has the specified prefix, 0 otherwise.
	This version is case sensitive.

dd_text2list(text, separator)
	Split the text into a list, where separator is the delimiter between items.
	Returns the list. This is not case-sensitive.

	If the myText string is "a = b = c", and you call dd_text2list(myText, " = "), you get a list back with these items:
		a
		b
		c

	Example:

	// Get a list containing the names in this string.
	var/mytext = "George; Bernard; Shaw"
	var/separator = "; "
	var/list/names = dd_text2list(mytext, separator)

dd_text2List(text, separator)
	The case-sensitive version of dd_text2list().

dd_list2text(list/the_list, separator)
	Create a string by combining each element of the list,
	inserting the separator between each item.

	Example:

	// Turn this list of names into one string separated by semi-colons.
	var/list/names = list("George", "Bernard", "Shaw")
	var/separator = "; "
	var/mytext = dd_list2text(names, separator)

dd_centertext(message, length)
	Returns a new text string, centered based on the length.

	If the string is not as long as the length, spaces are added
	on both sides of the message.

	If the string is longer than the specified length, the message
	is truncated to fit to the length.

	This function is useful when laying out text on the map, where you
	might want to center a title, for example.

dd_limittext(message, length)
	If the message is longer than length, truncates the message to fit
	length. This is useful for text on the map, where you might want
	to display a player name, for example, but have to make sure it's
	not too long to fit.
*/




proc
	///////////////////
	// Reading files //
	///////////////////
	dd_file2list(file_path, separator = "\n")
		var/file
		if (isfile(file_path))
			file = file_path
		else
			file = file(file_path)
		return dd_text2list(file2text(file), separator)


    ////////////////////
    // Replacing text //
    ////////////////////
	dd_replacetext(text, search_string, replacement_string)
		// A nice way to do this is to split the text into an array based on the search_string,
		// then put it back together into text using replacement_string as the new separator.
		var/list/textList = dd_text2list(text, search_string)
		return dd_list2text(textList, replacement_string)


	dd_replaceText(text, search_string, replacement_string)
		var/list/textList = dd_text2List(text, search_string)
		return dd_list2text(textList, replacement_string)


    /////////////////////
	// Prefix checking //
	/////////////////////
	dd_hasprefix(text, prefix)
		var/start = 1
		var/end = length(prefix) + 1
		return findtext(text, prefix, start, end)

	dd_hasPrefix(text, prefix)
		var/start = 1
		var/end = length(prefix) + 1
		return findtextEx(text, prefix, start, end)


    /////////////////////
	// Suffix checking //
	/////////////////////
	dd_hassuffix(text, suffix)
		var/start = length(text) - length(suffix)
		if (start) return findtextEx(text, suffix, start)

	dd_hasSuffix(text, suffix)
		var/start = length(text) - length(suffix)
		if (start) return findtextEx(text, suffix, start)

	/////////////////////////////
	// Turning text into lists //
	/////////////////////////////
	dd_text2list(text, separator)
		var/textlength      = length(text)
		var/separatorlength = length(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			else
				if (searchPosition > textlength)							// Found separator at very end of string.
					textList += ""											// So add empty element.
					return textList

	dd_text2List(text, separator)
		var/textlength      = length(text)
		var/separatorlength = length(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findtextEx(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			else
				if (searchPosition > textlength)							// Found separator at very end of string.
					textList += ""											// So add empty element.
					return textList

	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)														// Nothing to work with.
			return

		var/newText = "[the_list[1]]"										// Treats any object/number as text also.
		var/count
		for (count = 2, count <= total, count++)
			if (separator) newText += separator
			newText += "[the_list[count]]"
		return newText

	dd_centertext(message, length)
		var/new_message = message
		var/size = length(message)
		if (size == length)
			return new_message
		if (size > length)
			return copytext(new_message, 1, length + 1)

		// Need to pad text to center it.
		var/delta = length - size
		if (delta == 1)
			// Add one space after it.
			return new_message + " "

		// Is this an odd number? If so, add extra space to front.
		if (delta % 2)
			new_message = " " + new_message
			delta--

		// Divide delta in 2, add those spaces to both ends.
		delta = delta / 2
		var/spaces = ""
		for (var/count = 1, count <= delta, count++)
			spaces += " "
		return spaces + new_message + spaces

	dd_limittext(message, length)
		// Truncates text to limit if necessary.
		var/size = length(message)
		if (size <= length)
			return message
		else
			return copytext(message, 1, length + 1)