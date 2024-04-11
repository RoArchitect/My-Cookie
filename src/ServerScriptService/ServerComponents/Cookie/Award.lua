-- SERVICES --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage     = game:GetService("ServerStorage")

-- OBJECTS --
local Remotes      = ReplicatedStorage.Remotes
local AwardEvent   = Remotes.Award
local Cookies      = ServerStorage.Cookies

-- TABLES --
local LastClicked = {}

-- LOCAL FUNCTIONS --
local function GetCookieInfo(Name)
	return require(Cookies[Name])
end

local function OnServerEvent(Player , ...)
	if LastClicked[Player.Name] ~= nil then
		if tick() - LastClicked[Player.Name] <= 0.1 then
			return
		end
	end
	
	local leaderstats = Player:FindFirstChild("leaderstats")
	if not leaderstats then return end
	local Upgrades = Player:FindFirstChild("Upgrades")
	
	local Points = leaderstats.Points
	
	local ClickPower    = Upgrades.ClickPower
	local CookieQuality = Upgrades.CookieQuality
	
	local CurrentCookie = leaderstats.CurrentCookie.Value
	local CookieInfo    = GetCookieInfo(CurrentCookie)
	
	Points.Value += (((CookieInfo.DefaultAward * CookieInfo.Multiplier) * ClickPower.Value) * CookieQuality.Value)
	
	LastClicked[Player.Name] = tick()
end

-- CONNECTIONS --
local OnServerEventConnection
OnServerEventConnection = AwardEvent.OnServerEvent:Connect(OnServerEvent)

return 'AW'
