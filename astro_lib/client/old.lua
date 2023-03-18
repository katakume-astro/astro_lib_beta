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


-- exports['astro_lib']:notify('inform', 'test', 5000)
exports('notify', notify) 
RegisterNetEvent('astro_lib:notify')
AddEventHandler('astro_lib:notify', function(type, msg, duration)
	notify(type, msg, duration)
end)

RegisterNetEvent('Astro-NotifySystem:Notify')
AddEventHandler('Astro-NotifySystem:Notify', function(type, msg, duration)
	local Invoke = GetInvokingResource()
	print(("[^1ERROR^7] Resource ^5%s^7 Used the ^5Astro-NotifySystem:Notify^7 Event, this event ^1no longer supported!^7 Visit https://github.com/katakume-astro/astro_lib_beta/edit/main/astro_lib/client/old.lua for how to fix!"):format(Invoke))
end)

