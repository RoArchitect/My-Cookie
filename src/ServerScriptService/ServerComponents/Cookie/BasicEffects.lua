-- SERVICES --
local _workspace    = game:GetService("Workspace")
local TweenService  = game:GetService("TweenService")

-- OBJECTS --
local GameObjects   = _workspace.GameObjects
local PlayerCookie  = GameObjects.PlayerCookie

-- VALUES --
local Cookie        = PlayerCookie:FindFirstChildOfClass("Model")

local Speed         = 0.9

-- LOCAL FUNCTIONS --
local function UpdateCookie()
	Cookie = PlayerCookie:FindFirstChildOfClass("Model")
end

local function CookiePositionTween()
	local TweenUp = TweenService:Create(Cookie.PrimaryPart , TweenInfo.new(Speed) , {
		CFrame = Cookie.DownCF.CFrame
	})
	local TweenDown = TweenService:Create(Cookie.PrimaryPart , TweenInfo.new(Speed) , {
		CFrame = Cookie.UpCF.CFrame
	})
	
	TweenUp:Play()
	TweenUp.Completed:Wait()
	TweenDown:Play()
	TweenDown.Completed:Wait()
end

-- LOOP --
while task.wait() do
	UpdateCookie()
	CookiePositionTween()
end

return 'BE'
