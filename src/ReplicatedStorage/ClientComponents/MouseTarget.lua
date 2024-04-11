-- SERVICES --
local Players = game:GetService("Players")

-- OBJECTS --
local Player  = Players.LocalPlayer
local Mouse   = Player:GetMouse()

-- TABLES --
local MouseTarget = {}

-- PUBLIC FUNCTIONS --
function MouseTarget.GetTarget()
	return Mouse.Target
end

function MouseTarget.IsValidTargetOfDescendant(Target , Descendant)
	return Target:IsDescendantOf(Descendant)
end

return MouseTarget
