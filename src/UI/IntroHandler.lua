repeat
 task.wait()
until game:IsLoaded()

-- SERVICES --
local Players             = game:GetService("Players")
local ReplicacatedStorage = game:GetService("ReplicatedStorage")
local Lighting            = game:GetService("Lighting")
local TweenService        = game:GetService("TweenService")

-- OBJECTS --
local Player     = Players.LocalPlayer
local Character  = Player.Character or Player.CharacterAdded:Wait()
local Humanoid   = Character:WaitForChild("Humanoid")
local Camera     = workspace.CurrentCamera

local Gui           = script.Parent
local NameContainer = Gui.NameContainer
local Container     = Gui.Container
local TextContainer = Container.TextContainer

local OrElseColorCor = Lighting.OrElseColorCor

local Sounds        = ReplicacatedStorage.Sounds
local TypingSound   = Sounds.Type

-- PRIVATE FUNCTIONS --
local function TypeSound()
	coroutine.resume(coroutine.create(function()
		local New = TypingSound:Clone()
		New.Parent = script
		New:Play()
		New.Ended:Wait()
		New:Destroy()
	end))
end

local function Type(Text)
	for i = 1,#Text do
		TypeSound()
		TextContainer.Text = string.sub(Text,1,i)
		wait()
	end
end

-- OTHER --
Humanoid.WalkSpeed = 0

Type('Welcome to "My Cookie". It is a game I made for well, something, yes.')
task.wait(2.5)
Type('Honestly, it was easy to do and I enjoyed making this game.')
task.wait(2.5)
Type('The way it works, is, you click the cookie model and earn points.')
task.wait(2.5)
Type('On the left side, you can view upgrades and purchase them. That is all.')
task.wait(2.5)
Type('I hope you will like this game!')
task.wait(2.5)
TextContainer.TextColor3 = Color3.fromRGB(140, 3, 5)

coroutine.resume(coroutine.create(function()
	for i = 1 , 8 do
		local ctween1 = TweenService:Create(Camera,TweenInfo.new(0.1),{
			FieldOfView = 64;
		})
		local ctween2 = TweenService:Create(Camera,TweenInfo.new(0.1),{
			FieldOfView = 70;
		})
		
		OrElseColorCor.Enabled = true
		ctween1:Play()
		task.wait(0.1)
		ctween2:Play()
		OrElseColorCor.Enabled = false
		task.wait(0.1)
	end
end))

TextContainer.TextSize = 24
Type('OR ELSE...')
task.wait(3.5)

Gui.Enabled = false
Humanoid.WalkSpeed = 16
