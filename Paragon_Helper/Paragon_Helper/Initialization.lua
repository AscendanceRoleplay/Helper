-- Paragon Helper
-- Author: Dreamer
-- Initialization script.

local waitTable = {};
local waitFrame = nil;

function Paragon_wait(delay, func, ...)
  if(type(delay)~="number" or type(func)~="function") then
    return false;
  end
  if(waitFrame == nil) then
    waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
    waitFrame:SetScript("onUpdate",function (self,elapse)
      local count = #waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable,{delay,func,{...}});
  return true;
end

local addonName = ...

local frame = CreateFrame("Frame")
-- frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self, event, ...)
--	if event == "ADDON_LOADED" and ... == addonName then
		if type(charVar) ~= "number" then
			charVar = 0
		end
		charVar = charVar + 1
		if charVar == 1 then
			PARAGONgreeting = ("Hello there " .. UnitName("player") .. ", it's nice to meet you! I hope you enjoy utilizing this program!")
			print(PARAGONgreeting)
		else
			PARAGONgreeting = ("Hello again " .. UnitName("player") .. "! Welcome back to the Paragon Helper.")
			print(PARAGONgreeting)
--		end
	end
end)