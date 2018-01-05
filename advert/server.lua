AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'advert' then
		if #args < 1 then
				RconPrint("Usage: advert Your message OR /templateName\n")
				CancelEvent()
				return
		end
		
		local msg = ""
		for _, v in ipairs(args) do
			msg = msg .. v .. " "
		end
		msg = string.sub(msg, 1, string.len(msg)-1)
		
		if(startswith(msg, "/")) then
			local templateName = string.sub(msg, 2)
			for k, v in pairs(templates) do
				if(k == templateName) then
					TriggerClientEvent('chatMessage', -1, "Advert", {255, 0, 0}, v)
					RconPrint("The template '"..templateName.."' has been broadcasted !\n")
					CancelEvent()
					return
				end
			end
			RconPrint(templateName.." doesn't exist !\n")
		else
			TriggerClientEvent('chatMessage', -1, "Advert", {255, 0, 0}, msg)
			RconPrint("The message has been broadcasted !\n")
		end
		
		CancelEvent()
		return
	end
end)

function startswith(String,Start)
	return string.sub(String,1,string.len(Start))==Start
end