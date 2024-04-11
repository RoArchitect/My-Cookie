-- parented in LeftHandSide UI, but shown in a folder in github for code review.
-- SERVICES --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players           = game:GetService("Players")

-- OBJECTS --
local ScreenGui       = script.Parent
local UpgradesUI      = ScreenGui.UpgradesUI
local ViewUpgradesBtn = ScreenGui.ViewUpgrades

local Player = Players.LocalPlayer
local leaderstats = Player:WaitForChild("leaderstats")
local plrUpgrades = Player:WaitForChild("Upgrades")

local PointsAmt = ScreenGui.PointsAmt
local PointsLabel = PointsAmt.PointsLabel

local UDesc = UpgradesUI.UpgradeInfo.UDesc
local UName = UpgradesUI.UpgradeInfo.UName
local UPrice = UpgradesUI.UpgradeInfo.UPrice
local UpgradePurchaseBtn = UpgradesUI.UpgradeInfo.Purchase

local Remotes  = ReplicatedStorage.Remotes
local upgradeEvent = Remotes.Upgrade

local Upgrades = ReplicatedStorage.Upgrades

-- VALUES --
local SelectedUpgrade = ""

-- PRIVATE FUNCTIONS --
local function OnViewUpgradesClick()
	UpgradesUI.Visible = not UpgradesUI.Visible
end

local function round(num)
	local roundedNum = string.format("%.2f", num)
	return roundedNum
end

-- OTHER --
UDesc.Text = ""
UName.Text = ""
UPrice.Text = ""

PointsLabel.Text = "POINTS: <font color='rgb(80,186,61)'>".. round(leaderstats.Points.Value) .."</font>"
leaderstats.Points.Changed:Connect(function()
	PointsLabel.Text = "POINTS: <font color='rgb(80,186,61)'>".. round(leaderstats.Points.Value) .."</font>"
end)

local UpgradeModules = {}

for _ , upgrade in ipairs(UpgradesUI.UpgradeList:GetChildren()) do
	if not upgrade:IsA("TextButton") then continue end
	
	local UpgradeModule = require(Upgrades[upgrade.Name])
	
	UpgradeModules[upgrade.Name] = UpgradeModule
	
	upgrade.MouseButton1Down:Connect(function()
		SelectedUpgrade = upgrade.Name
		
		UDesc.Text = UpgradeModule.Description
		UName.Text = UpgradeModule.Name
		UPrice.Text = UpgradeModules[upgrade.Name].Price .. " Points"
		
		UpgradePurchaseBtn.Visible = true
	end)
end

-- CONNECTIONS --
UpgradePurchaseBtn.MouseButton1Down:Connect(function()
	local old = SelectedUpgrade
	if SelectedUpgrade == "" then return end
	if leaderstats.Points.Value < UpgradeModules[SelectedUpgrade].Price then return end
	
	upgradeEvent:FireServer(tostring(SelectedUpgrade) , UpgradeModules[SelectedUpgrade].Price)

	UpgradeModules[SelectedUpgrade].Price += UpgradeModules[SelectedUpgrade].PriceIncreasePerPurchase
	
	if SelectedUpgrade ~= "" and SelectedUpgrade == old then
		UPrice.Text = UpgradeModules[old].Price .. " Points"
	end 
end)

ViewUpgradesBtn.MouseButton1Down:Connect(OnViewUpgradesClick)
