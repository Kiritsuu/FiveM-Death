RegisterServerEvent("CustomDeath:revivePlayerCheck")
RegisterServerEvent("CustomDeath:revivePlayerSuccessRelay")
RegisterServerEvent("CustomDeath:revivePlayerAliveRelay")

AddEventHandler("CustomDeath:revivePlayerCheck", function(args)
	local playerName = GetPlayerName(args[2])
	sourcePlayer = source
	
	if playerName == nil then
		TriggerClientEvent("CustomDeath:revivePlayerNotFound", source, args[2])
	else
		TriggerClientEvent('CustomDeath:reviveExecute', args[2], playerName)
	end
end)

AddEventHandler("CustomDeath:revivePlayerSuccessRelay", function(playerName)
	TriggerClientEvent("CustomDeath:revivePlayerSuccess", sourcePlayer, playerName)
end)

AddEventHandler("CustomDeath:revivePlayerAliveRelay", function(playerName)
	TriggerClientEvent("CustomDeath:revivePlayerAlive", sourcePlayer, playerName)
end)
