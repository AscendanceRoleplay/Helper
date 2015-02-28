-- Paragon Helper
-- Author: Dreamer
-- Progressive Scanning for Tooltips.

function DisplayItemID(self)
	PARAGONtooltip = (GetContainerItemID(self:GetParent():GetID(), self:GetID()))
end
function ClearItemID(self)
	PARAGONtooltip = "nil"
end
for i=1, 13 do
	for j=1, 36 do
		_G["ContainerFrame"..i.."Item"..j]:HookScript("OnEnter", DisplayItemID)
		_G["ContainerFrame"..i.."Item"..j]:HookScript("OnLeave", ClearItemID)
	end
end