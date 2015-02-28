-- Paragon Helper
-- Author: Dreamer
-- Slash Commands

local status = false
frameSettings = {}
settings = {}

function Hud_OnLoad(self)
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("MODIFIER_STATE_CHANGED");
	HudFlyStatus(status);
	HudWalkStatus(status);
	CheckLocks();
end

function Hud_OnEvent(self, event)
	if (event == "PLAYER_TARGET_CHANGED") then
		if UnitName("target") ~= nil then
			currentTarget:SetText("Targeting " .. UnitName("target") .. "!")
		else 
			currentTarget:SetText("No target!")
		end
	end
	if (event == "MODIFIER_STATE_CHANGED") then
		GetKeys();
	end
	if event=="PLAYER_LOGIN" then
		frameSettings = frameSettings or {}
		settings = frameSettings
		if settings.XPos then
			Hud:ClearAllPoints()
			Hud:SetPoint("BOTTOMLEFT",settings.XPos,settings.YPos)
		end
	end
end

function HudButtonCommands_OnClick()
	if CommandHud:IsVisible() then
		CommandHud:Hide();
		HudButtonCommands:UnlockHighlight();
	else
		CommandHud:Show();
		HudButtonCommands:LockHighlight();
	end
end

function CommandHudButtonClearInventory_OnClick()
	ConfirmHud:Show();
	CommandHud:Hide();
end

function GetKeys()
	if IsAltKeyDown() and IsControlKeyDown() then
		ctrlKey:SetText("|cffffffffCtrl Key|r");
		altKey:SetText("|cffffffffAlt Key|r");
		rightClick:SetText("|cffffffffCtrl + Alt|r + |cffbfbfffRight Click|r");
		rightClickOnOne:SetText("|cffffffffOn Item|r");
		rightClickOne:SetText("|cffbfbfffRemove Item|r");
		rightClickOnTwo:SetText("|cffffffffOn Faction|r");
		rightClickTwo:SetText("|cffbfbfffSet Hated|r");
		rightClickOnThree:SetText("|cffffffffNearby GO...|r");
		rightClickThree:SetText("|cffbfbfffDel GO...|r");
		rightClickOnFour:SetText("");
		rightClickFour:SetText("");
		rightClickOnFive:SetText("");
		rightClickFive:SetText("");
		rightClickOnSix:SetText("");
		rightClickSix:SetText("");
		leftClick:SetText("");
		leftClickOnOne:SetText("");
		leftClickOne:SetText("");
		leftClickOnTwo:SetText("");
		leftClickTwo:SetText("");
--	else
--		altKey:SetText("|cffbfbfffAlt Key|r");
--		ctrlKey:SetText("|cffbfbfffCtrl Key|r");
--	end
	elseif IsAltKeyDown() then
		ctrlKey:SetText("|cffbfbfffCtrl Key|r");
		altKey:SetText("|cffffffffAlt Key|r");
		rightClick:SetText("|cffffffffAlt|r + |cffbfbfffRight Click|r");
		rightClickOnOne:SetText("|cffffffffOn Item|r");
		rightClickOne:SetText("|cffbfbfffLookup Item|r");
		rightClickOnTwo:SetText("");
		rightClickTwo:SetText("");
		rightClickOnThree:SetText("");
		rightClickThree:SetText("");
		rightClickOnFour:SetText("");
		rightClickFour:SetText("");
		rightClickOnFive:SetText("");
		rightClickFive:SetText("");
		rightClickOnSix:SetText("");
		rightClickSix:SetText("");
		leftClick:SetText("");
		leftClickOnOne:SetText("");
		leftClickOne:SetText("");
		leftClickOnTwo:SetText("");
		leftClickTwo:SetText("");
--	else
--		altKey:SetText("|cffbfbfffAlt Key|r");
--	end
	elseif IsControlKeyDown() then
		altKey:SetText("|cffbfbfffAlt Key|r");
		ctrlKey:SetText("|cffffffffCtrl Key|r");
		rightClick:SetText("|cffffffffCtrl|r + |cffbfbfffRight Click|r");
		rightClickOnOne:SetText("|cffffffffOn Item|r");
		rightClickOne:SetText("|cffbfbfffAdd Item|r");
		rightClickOnTwo:SetText("|cffffffffOn ItemSet|r");
		rightClickTwo:SetText("|cffbfbfffAdd ItemSet|r");
		rightClickOnThree:SetText("|cffffffffOn Faction|r");
		rightClickThree:SetText("|cffbfbfffSet Revered|r");
		rightClickOnFour:SetText("|cffffffffOn GObject|r");
		rightClickFour:SetText("|cffbfbfffSpawn|r");
		rightClickOnFive:SetText("|cffffffffOn NPC|r");
		rightClickFive:SetText("|cffbfbfffSpawn NPC|r");
		rightClickOnSix:SetText("|cffffffffOn Spell|r");
		rightClickSix:SetText("|cffbfbfffCast Spell|r");
		leftClick:SetText("|cffffffffCtrl|r + |cffbfbfffLeft Click|r");
		leftClickOnOne:SetText("|cffffffffOn Item|r");
		leftClickOne:SetText("|cffbfbfffDressup|r");
		leftClickOnTwo:SetText("");
		leftClickTwo:SetText("");
	else
		altKey:SetText("|cffbfbfffAlt Key|r");
        ctrlKey:SetText("|cffbfbfffCtrl Key|r");
		rightClick:SetText("");
		rightClick:SetText("");
		rightClickOnOne:SetText("");
		rightClickOne:SetText("");
		rightClickOnTwo:SetText("");
		rightClickTwo:SetText("");
		rightClickOnThree:SetText("");
		rightClickThree:SetText("");
		rightClickOnFour:SetText("");
		rightClickFour:SetText("");
		rightClickOnFive:SetText("");
		rightClickFive:SetText("");
		rightClickOnSix:SetText("");
		rightClickSix:SetText("");
		leftClick:SetText("");
		leftClickOnOne:SetText("");
		leftClickOne:SetText("");
		leftClickOnTwo:SetText("");
		leftClickTwo:SetText("");
	end
end

function HudFlyStatus(status)
	if flySpeedVar == nil then
		flySpeedVar = 1
	end
    if status == true then
		SendChatMessage(".gm fly on")
		SendChatMessage(".mod fly "..flySpeedVar)
        flyStatus:SetText("|cffffffffFlight mode ON|r "..flySpeedVar);
    else
		SendChatMessage(".gm fly off")
        flyStatus:SetText("|cffbfbfffFlight mode OFF|r");
    end
end

function flyStatus_OnClick()
	if status == true then
		status = false
		HudFlyStatus(status);
	else
		status = true
		HudFlyStatus(status);
	end
end

function CommandHudButtonAddBags_OnClick()
	CreateInventory();
	Paragon_wait(8,CleanInventory);
end

function CommandHudButtonShowHelp_OnClick()
	CommandHud:Hide();
	HelpHud:Show();
end

function HelpHudButtonClose_OnClick()
	HelpHud:Hide();
	CommandHud:Show();
end

function CommandHudButtonClose_OnClick()
	CommandHud:Hide();	
	HudButtonCommands:UnlockHighlight();
end

function CheckGmStatus()
	if selectorVar == 4 then
		UIDropDownMenu_SetSelectedID(DropDownMenuTest, selectorVar)
		print("Character "..UnitName("player").." registered as Staff Member!");
	elseif selectorVar == 3 then
		UIDropDownMenu_SetSelectedID(DropDownMenuTest, selectorVar)
		print("Character "..UnitName("player").." registered as Dungeon Master!");
	elseif selectorVar == 2 then
		UIDropDownMenu_SetSelectedID(DropDownMenuTest, selectorVar)
		print("Character "..UnitName("player").." registered as Builder!");
	elseif selectorVar == 1 then
		UIDropDownMenu_SetSelectedID(DropDownMenuTest, selectorVar)
		print("Character "..UnitName("player").." registered as Player!");
	end
end

function HudButtonTips_OnClick()
	if TipsHud:IsVisible() then
		TipsHud:Hide();
		HudButtonTips:UnlockHighlight();
	else
		TipsHud:Show();
		HudButtonTips:LockHighlight();
	end	
end

function ConfirmHudButtonConfirm_OnClick()
	ConfirmHud:Hide();
	CommandHud:Show();
	print("Cleaning...")
	ClearInventory();
	print("Inventory Cleared!")
end

function ConfirmHudButtonClose_OnClick()
	ConfirmHud:Hide();
	CommandHud:Show();
end

function TipsHud_OnLoad()
	GetKeys();
    TipsHud:CreateTitleRegion():SetAllPoints()
    TipsHud:SetUserPlaced(true)
end

function CheckLocks()
	if hudLock == 1 then
		HudButtonLock:LockHighlight();
		Hud:RegisterForDrag("")
	elseif hudLock == 0 then
		HudButtonLock:UnlockHighlight();
		Hud:EnableMouse(true)
		Hud:RegisterForDrag("LeftButton")
		Hud:SetScript("OnDragStart", HudMoveStart)
		Hud:SetScript("OnDragStop", HudMoveStop)
	else
		hudLock = 1
		CheckLocks();
	end
end

function HudMoveStart()
	Hud:StartMoving();
end

function HudMoveStop()
	Hud:StopMovingOrSizing();
	frameSettings.XPos = Hud:GetLeft()
	frameSettings.YPos = Hud:GetBottom()
end

function HudButtonLock_OnClick()
	if hudLock == 1 then
		hudLock = 0
		CheckLocks();
	elseif hudLock == 0 then
		hudLock = 1
		CheckLocks();
	end
end

function CommandHud_OnLoad()
    CommandHud:CreateTitleRegion():SetAllPoints()
    CommandHud:SetUserPlaced(true)
end

function HudButtonFly1_OnClick()
	flySpeedVar = 1
	status = true
	SendChatMessage(".gm fly on")
	SendChatMessage(".mod fly "..flySpeedVar)
	flyStatus:SetText("|cffffffffFlight mode ON|r "..flySpeedVar);
end

function HudButtonFly3_OnClick()
	flySpeedVar = 3
	status = true
	SendChatMessage(".gm fly on")
	SendChatMessage(".mod fly "..flySpeedVar)
	flyStatus:SetText("|cffffffffFlight mode ON|r "..flySpeedVar);
end

function HudButtonFly7_OnClick()
	flySpeedVar = 7
	status = true
	SendChatMessage(".gm fly on")
	SendChatMessage(".mod fly "..flySpeedVar)
	flyStatus:SetText("|cffffffffFlight mode ON|r "..flySpeedVar);
end

function HudWalkStatus(status)
	if walkSpeedVar == nil then
		walkSpeedVar = 1
	end
    if status == true then
		SendChatMessage(".mod speed "..walkSpeedVar)
        walkStatus:SetText("|cffffffffWalk mode ON|r "..walkSpeedVar);
    else
		SendChatMessage(".mod speed 1")
        walkStatus:SetText("|cffbfbfffWalk mode OFF|r");
    end
end

function walkStatus_OnClick()
	if status == true then
		status = false
		HudWalkStatus(status);
	else
		status = true
		HudWalkStatus(status);
	end
end

function HudButtonWalk1_OnClick()
	walkSpeedVar = 1
	status = true
	SendChatMessage(".mod speed "..walkSpeedVar)
	walkStatus:SetText("|cffffffffWalk mode ON|r "..walkSpeedVar);
end

function HudButtonWalk3_OnClick()
	walkSpeedVar = 3
	status = true
	SendChatMessage(".mod speed "..walkSpeedVar)
	walkStatus:SetText("|cffffffffWalk mode ON|r "..walkSpeedVar);
end

function HudButtonWalk7_OnClick()
	walkSpeedVar = 7
	status = true
	SendChatMessage(".mod speed "..walkSpeedVar)
	walkStatus:SetText("|cffffffffWalk mode ON|r "..walkSpeedVar);
end

--------------------------------------------------------------------------------

if not DropDownMenuTest then
   CreateFrame("Button", "DropDownMenuTest", UIParent, "UIDropDownMenuTemplate")
end
 
DropDownMenuTest:ClearAllPoints()
DropDownMenuTest:SetPoint("BOTTOMLEFT", Hud, "BOTTOMLEFT", 0, -25)
DropDownMenuTest:Show()
 
local items = {
   "Player",
   "Builder",
   "DM",
   "Staff",
}

function GetItems(selectorLevel)
	if selectorLevel == 1 then
		selectorVar = selectorLevel
	elseif selectorLevel == 2 then
		selectorVar = selectorLevel
	elseif selectorLevel == 3 then
		selectorVar = selectorLevel
	elseif selectorLevel == 4 then
		selectorVar = selectorLevel
	end
end
 
local function OnClick(self)
	UIDropDownMenu_SetSelectedID(DropDownMenuTest, self:GetID())
	testVar = self:GetID()
	GetItems(testVar);
	CheckGmStatus();
end
 
local function initialize(self, level)
	local info = UIDropDownMenu_CreateInfo()
	for k,v in pairs(items) do
		info = UIDropDownMenu_CreateInfo()
		info.text = v
		info.value = v
		info.func = OnClick
		UIDropDownMenu_AddButton(info, level)
	end
end
 
UIDropDownMenu_Initialize(DropDownMenuTest, initialize)
UIDropDownMenu_SetWidth(DropDownMenuTest, 150);
UIDropDownMenu_SetButtonWidth(DropDownMenuTest, 150)
UIDropDownMenu_SetSelectedID(DropDownMenuTest, 1)
UIDropDownMenu_JustifyText(DropDownMenuTest, "LEFT")
CheckGmStatus();