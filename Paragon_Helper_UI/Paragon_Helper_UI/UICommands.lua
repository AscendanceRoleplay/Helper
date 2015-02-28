-- Paragon Helper
-- Author: Dreamer
-- Slash Commands

SLASH_HIDEUI1, SLASH_HIDEUI2 = '/hide', '/hideui';
local function handler(msg, editbox)
	Hud:Hide();
	print("Type /show to reveal the Paragon Helper UI!");
end
SlashCmdList["HIDEUI"] = handler; -- Also a valid assignment strategy

SLASH_SHOWUI1, SLASH_SHOWUI2 = '/show', '/showui';
local function handler(msg, editbox)
	Hud:Show();
	print("Type /hide to hide the Paragon Helper UI!");
end
SlashCmdList["SHOWUI"] = handler; -- Also a valid assignment strategy