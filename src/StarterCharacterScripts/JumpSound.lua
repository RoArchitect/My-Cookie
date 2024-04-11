-- SERVICES --
local UserInputService  = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players           = game:GetService("Players")

-- OBJECTS --
local Sounds            = ReplicatedStorage.Sounds

local JumpSound         = Sounds.Jump

local Player            = Players.LocalPlayer
local Character         = Player.Character or Player.CharacterAdded:Wait()

-- CONNECTIONS --
UserInputService.JumpRequest:Connect(function()
	if Character:FindFirstChild("Jump") then return end
	
	local New  = JumpSound:Clone()
	New.Parent = Character
	New:Play()
	New.Ended:Wait()
	New:Destroy()
end)
