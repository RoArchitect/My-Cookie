-- VARIABLES --
local ServerComponents = script.Parent.ServerComponents

-- INITIATE --

--[[

We'll attempt to run all the components in the ServerComponents folder.
Of course, we still will check if it's a module.

--]]

for _ , Component in ipairs(ServerComponents:GetDescendants()) do
	if not Component:IsA("ModuleScript") then continue end
	
	xpcall(function()
		coroutine.resume(coroutine.create(function()
			require(Component)
		end))
	end , function(Error)
		warn("Server Component:",Component.Name,"Failed to initiate with the error message: " .. [[
		
		]] .. tostring(Error))
	end)
	
end
