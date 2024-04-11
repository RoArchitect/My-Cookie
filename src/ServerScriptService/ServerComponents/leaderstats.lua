-- SERVICES --
local Players   = game:GetService("Players")

-- LEADERSTATS --
Players.PlayerAdded:Connect(function(Player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name  = "leaderstats"
	leaderstats.Parent = Player
	
	local Points      = Instance.new("NumberValue")
	Points.Parent     = leaderstats
	Points.Value      = 0
	Points.Name       = "Points"
	
	local CurrentCookie = Instance.new("StringValue")
	CurrentCookie.Parent = leaderstats
	CurrentCookie.Name   = "CurrentCookie"
	CurrentCookie.Value  = "RegularCookie"
	
	local Upgrades    = Instance.new("Folder")
	Upgrades.Name     = "Upgrades"
	Upgrades.Parent   = Player
	
	local ClickPowerUpgrade  = Instance.new("NumberValue")
	ClickPowerUpgrade.Name   = "ClickPower"
	ClickPowerUpgrade.Parent = Upgrades
	ClickPowerUpgrade.Value  = 1
	
	local CookieQualityUpgrade = Instance.new("NumberValue")
	CookieQualityUpgrade.Name = "CookieQuality"
	CookieQualityUpgrade.Parent = Upgrades
	CookieQualityUpgrade.Value = 1
end)

return 'LE'
