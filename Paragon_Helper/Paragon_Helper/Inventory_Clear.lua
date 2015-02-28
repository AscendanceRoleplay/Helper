-- Paragon Helper
-- Author: Dreamer
-- Inventory Cleanup Functionality

local itemID = 1100
local itemCount = 4
local bookID = 6

function ClearInventory()
	for i=0,4 do 
		for j=1,GetContainerNumSlots(i)do n=(GetContainerItemLink(i,j)or"") 
			PickupContainerItem(i,j) 
			DeleteCursorItem()
		end 
	end
end
function CreateInventory()
	SendChatMessage(".additem "..itemID.." "..itemCount)
	SendChatMessage(".additem "..bookID)
	Paragon_wait(1.5,PickupBagFromSlot,23);
	Paragon_wait(1.5,DeleteCursorItem);
	Paragon_wait(1.5,PickupBagFromSlot,22);
	Paragon_wait(1.5,DeleteCursorItem);
	Paragon_wait(1.5,PickupBagFromSlot,21);
	Paragon_wait(1.5,DeleteCursorItem);
	Paragon_wait(1.5,PickupBagFromSlot,20);
	Paragon_wait(1.5,DeleteCursorItem);
	Paragon_wait(2.5,EquipItemByName,"Monster Bag");
	Paragon_wait(2.7,EquipItemByName,"Monster Bag");
	Paragon_wait(2.9,EquipItemByName,"Monster Bag");
	Paragon_wait(3.1,EquipItemByName,"Monster Bag");
end
function CleanInventory()
	for i=0,4 do 
		for j=1,GetContainerNumSlots(i)do n=(GetContainerItemLink(i,j)or"") 
			if(n:find("Monster Bag")) then
				PickupContainerItem(i,j) 
				DeleteCursorItem()
			else
			end
		end 
	end
end