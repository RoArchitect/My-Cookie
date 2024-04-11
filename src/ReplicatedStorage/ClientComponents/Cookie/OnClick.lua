-- SERVICES --
local _workspace        = game:GetService("Workspace")
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- OBJECTS --
local Player       = Players.LocalPlayer
local GameObjects  = _workspace.GameObjects
local PlayerCookie = GameObjects.PlayerCookie
local ClientComps  = script.Parent.Parent
local Sounds       = ReplicatedStorage.Sounds
local ClickSound   = Sounds.Click
local Remotes      = ReplicatedStorage.Remotes
local Mouse        = Player:GetMouse()
local AwardEvent   = Remotes.Award

-- NON-REQUIRED-MODULES --
local MouseTargetModule  = ClientComps.MouseTarget

-- REQUIRED MODULES --
local MouseTarget        = require(MouseTargetModule)

-- CHECK CLICK --
Mouse.Button1Down:Connect(function()
	local Target = MouseTarget.GetTarget()
	if Target == nil then return end
	
	if MouseTarget.IsValidTargetOfDescendant(Target , PlayerCookie) then
		AwardEvent:FireServer()
		ClickSound:Play()
	end
end)

return 'OC'
