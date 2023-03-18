function notify(type, msg, duration)
	if (duration == nil) then duration = 5000 end
	if Config.NotifyType == "mythic_notify" then
		if type == '' or type == nil then type = 'inform' end
		exports['mythic_notify']:DoCustomHudText(type, string.gsub(msg, '(~[rbgypcmuonshw]~)', ''), duration)
	elseif Config.NotifyType == "okokNotify" then
		if type == '' or type == nil then type = 'info' end
		exports['okokNotify']:Alert("", string.gsub(msg, '(~[rbgypcmuonshw]~)', ''), duration, type)
	else
		ESX.ShowNotification(msg)
	end
end

RegisterNetEvent('astro_lib:notify')
AddEventHandler('astro_lib:notify', function(type, msg, duration)
	notify(type, msg, duration)
end)
