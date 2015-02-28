-- Paragon Helper
-- Author: Dreamer
-- Slash Commands

SLASH_FLYSPEED1, SLASH_FLYSPEED2 = '/fly', '/flyspeed';
local function handler(msg, editbox)
	flySpeedVar = msg
	print(msg);
	SendChatMessage(".mod fly "..msg);
end
SlashCmdList["FLYSPEED"] = handler;

SLASH_ITEM1, SLASH_ITEM2 = '/add', '/additem';
local function handler(msg, editbox)
	local tbl = {}
	if string.find(msg, "^%d") then
		for v in string.gmatch(msg, "[^, ]+") do
			tinsert(tbl, v)
			SendChatMessage(".additem "..v)
--			print(".additem "..v)
		end
	elseif string.find(msg, "item[%-?%d:]+") then
		for v in string.gmatch(msg, "item[%-?%d:]+") do
			tinsert(tbl, v)
			local iName, iLink = GetItemInfo(v);
			SendChatMessage(".additem "..iLink)
--			print(".additem "..iLink)
		end
	else
		print("Syntax: /add Itemx Itemy Itemz")
	end
end
SlashCmdList["ITEM"] = handler;