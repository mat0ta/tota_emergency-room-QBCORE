QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterCommand("next", function(source, args, user)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "ambulance" then
	QBCore.Functions.ExecuteSql(false, "SELECT * FROM emergency ORDER BY name ASC LIMIT 1", function(result)
	local nombre = result[1].name
	local apellido = result[1].lastname
	local sala = args[1]
	msg = "Emergency Room"
	msg2 = nombre .. " " .. apellido .. " go to the Observations Room Nº [".. sala .."] so that you can be treated by our medical staff. Thank you"
	TriggerClientEvent("SendAlert", -1, msg, msg2)
	QBCore.Functions.ExecuteSql(false, "DELETE FROM emergency WHERE name = '"..result[1].name.."'")
    end)
	else
		TriggerClientEvent('chatMessage', source, "[EMERGENCY ROOM SYSTEM]", "error", "This command is for emergency services!")
	end
end)