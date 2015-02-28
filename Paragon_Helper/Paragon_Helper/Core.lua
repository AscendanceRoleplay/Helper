-- Paragon Helper
-- Author: Dreamer
-- Click Handler for Blizzard Chat Hyperlinks

local function th(i) -- Custom Item Modifier Identifier
	local n = i % 10
	if n == 1 then
		return i .. " - Two Handed Sword Sheath; Helm/Shoulder/Cloak/Shield"
	elseif n == 2 then
		return i .. " - Two Handed Staff/Polearm Sheath; Chest"
	elseif n == 3 then
		return i .. " - One Handed Hip Sheath; Shirt"
	elseif n == 4 then
		return i .. " - Shield Sheath; Tabard"
	elseif n == 5 then
		return i .. " - Invisible Sheath; Wrist"
	elseif n == 6 then
		return i .. " - Ranged Two Handed Sword Sheath; Gloves"
	elseif n == 7 then
		return i .. " - Ranged Two Handed Staff/Polearm Sheath; Belt"
	elseif n == 8 then
		return i .. " - Ranged One Handed Hip Sheath; Legs"
	elseif n == 9 then
		return i .. " - Ranged Shield Sheath; Boots"
	end
	return i .. "th"
end

PARAGONSetItemRef = SetItemRef
function SetItemRef(link, text, button, chatFrame)
	if IsControlKeyDown() then
		if button == "RightButton" then
			if ( strsub(link, 1, 7) == "itemset" ) then
				local PARAGONtype, PARAGONid = strsplit(":", link);
				SendChatMessage(".additemset "..PARAGONid)
			elseif ( strsub(link, 1, 4) == "item" ) then
				local PARAGONtype, PARAGONid = strsplit(":", link);
				if IsAltKeyDown() then
					SendChatMessage(".add "..PARAGONid.." -1")
				else
					SendChatMessage(".add "..PARAGONid)
				end
			elseif ( strsub(link, 1, 7) == "faction" ) then
				local PARAGONtype, PARAGONid = strsplit(":", link);
				if IsAltKeyDown() then
					SendChatMessage(".mod reputation "..PARAGONid.." -40000")
				else
					SendChatMessage(".mod reputation "..PARAGONid.." 40000")
				end
			elseif ( strsub(link, 1, 16) == "gameobject_entry" ) then
				if selectorVar >= 2 then
					local PGWtype, PGWid = strsplit(":", link);
					SendChatMessage(".gobject add "..PGWid)
				else
					print("You're not permitted to use this command!");
				end
			elseif ( strsub(link, 1, 10) == "gameobject" ) then
				if IsAltKeyDown() and selectorVar >= 2 then
					local PGWtype, PGWid = strsplit(":", link);
					print(PGWid);
					SendChatMessage(".gobject del "..PGWid)
				else
					print("You're not permitted to use this command!");
				end
			elseif ( strsub(link, 1, 5) == "spell" ) then
				if selectorVar >= 2 then
					local PGWtype, PGWid = strsplit(":", link);
					SendChatMessage(".cast "..PGWid)
				else
					print("You're not permitted to use this command!");
				end
			elseif ( strsub(link, 1, 14) == "creature_entry" ) then
				if selectorVar >= 2 then
					local PGWtype, PGWid = strsplit(":", link);
					SendChatMessage(".npc add "..PGWid)
				else
					print("You're not permitted to use this command!");
				end
			else
				PARAGONSetItemRef(link, text, button, chatFrame)
			end
		elseif button =="LeftButton" then
			if ( strsub(link, 1, 4) == "item" ) then
				local PARAGONtype, PARAGONid = strsplit(":", link);
				DressUpItemLink(PARAGONid)
			else
				PARAGONSetItemRef(link, text, button, chatFrame)
			end
		end
	elseif IsAltKeyDown() then
		if button == "RightButton" then
			if ( strsub(link, 1, 4) == "item" ) then
				local PARAGONtype, PARAGONid = strsplit(":", link);
				local sName = GetItemInfo(PARAGONid);
					SendChatMessage(".lookup item "..sName)
			end
		elseif button == "LeftButton" then
			print("Functionality Coming Soon!")
		else
			PARAGONSetItemRef(link, text, button, chatFrame)
		end
	elseif button == "RightButton" then
		if ( strsub(link, 1, 4) == "item" ) then
			local PARAGONtype, PARAGONid = strsplit(":", link);
			local startPos, endPos, firstWord, restOfString = string.find( PARAGONid, "(%w)[%s%p]*(.*)");
			PARAGONlength = string.len(PARAGONid)
				if PARAGONlength == 7 then
					print(th(tonumber(firstWord)))
				else
					print("Not a Custom Item!")
				end
		else
			PARAGONSetItemRef(link, text, button, chatFrame)
		end
	else
		PARAGONSetItemRef(link, text, button, chatFrame)
	end
end