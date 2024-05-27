local password = "Bandz42" --TODO Replace with AcePerms

RegisterCommand("revive", function(source, args)
	TriggerEvent("CustomDeath:revive", args)
end, false)

RegisterNetEvent("CustomDeath:revive")
RegisterNetEvent("CustomDeath:revivePlayerNotFound")
RegisterNetEvent("CustomDeath:revivePlayerSuccess")
RegisterNetEvent("CustomDeath:revivePlayerAlive")

AddEventHandler("CustomDeath:revive", function(args)
	local playerInput = args[2]
	
	if args[1] == nil then
	elseif args[1] ~= password then --TODO Replace with checking perms
		Alert(error, "Incorrect Password", "Make sure you're using the most up-to-date password.", 5000)
	elseif playerInput == nil then
		ShowNotification(red, "Please enter a player ID")
	else
		TriggerServerEvent("CustomDeath:revivePlayerCheck", args)
	end
end)

AddEventHandler("CustomDeath:revivePlayerNotFound", function(playerServerId)
	ShowNotification(red, "Player with ID " .. playerServerId .. " is not found")
end)

AddEventHandler("CustomDeath:revivePlayerSuccess", function(playerName)
	ShowNotification(green, playerName .. " successfully revived")
end)

AddEventHandler("CustomDeath:revivePlayerAlive", function(playerName)
	ShowNotification(red, playerName .. " is alive")
end)
