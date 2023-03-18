RegisterNetEvent('astro:cheater')
AddEventHandler('astro:cheater', function()
local reason = 'ban'
local Invoke = GetInvokingResource()
print(("[^1ERROR^7] Resource ^5%s^7 Used the ^5astro:cheater^7 Event, this event ^1no longer supported^7"):format(Invoke))
ban(source, reason)
end)
