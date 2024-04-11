-- SERVICES --
local _workspace        = game:GetService("Workspace")
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService      = game:GetService("TweenService")

-- OBJECTS --
local Player       = Players.LocalPlayer
local GameObjects  = _workspace.GameObjects
local PlayerCookie = GameObjects.PlayerCookie
local ClientComps  = script.Parent.Parent
local Remotes      = ReplicatedStorage.Remotes
local Mouse        = Player:GetMouse()

-- NON-REQUIRED-MODULES --
local MouseTargetModule  = ClientComps.MouseTarget

-- REQUIRED MODULES --
local MouseTarget        = require(MouseTargetModule)

-- CHECK FOR COOKIE --
while task.wait() do
	local Target = MouseTarget.GetTarget()
	
	if Target == nil then continue end
	if not PlayerCookie:FindFirstChildOfClass("Model") then continue end
	
	local Highlight = PlayerCookie:FindFirstChildOfClass("Model").Highlight

	if MouseTarget.IsValidTargetOfDescendant(Target , PlayerCookie) then
		local TweenHover = TweenService:Create(Highlight , TweenInfo.new(0.25) , {FillTransparency = 0.5})
		TweenHover:Play()
	else
		local TweenHover = TweenService:Create(Highlight , TweenInfo.new(0.25) , {FillTransparency = 1})
		TweenHover:Play()
	end
end

return 'OC'
