-- SERVICES --
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- OBJECTS --
local Remotes      = ReplicatedStorage.Remotes
local UpgradeEvent = Remotes.Upgrade
local Upgrades     = ReplicatedStorage.Upgrades

-- LOCAL FUNCTIONS --
local function OnServerEvent(Player , ToUpgrade , Price)
	local leaderstats = Player:FindFirstChild("leaderstats")
	if not leaderstats then return end
	local PlrUpgrades    = Player:FindFirstChild("Upgrades")
		
	local Points       = leaderstats.Points
	local UpgradeValue = PlrUpgrades[ToUpgrade]
	local UpgradeModule = require(Upgrades:FindFirstChild(ToUpgrade))
	
	if Points.Value < Price then return end
	Points.Value -= Price
	
	UpgradeValue.Value += UpgradeModule.PerPurchase
end

-- CONNECTIONS --
local OnServerEventConnection
OnServerEventConnection = UpgradeEvent.OnServerEvent:Connect(OnServerEvent)

return 'UPG'
