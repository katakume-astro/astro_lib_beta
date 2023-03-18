RegisterNetEvent('astro:cheater')
AddEventHandler('astro:cheater', function()
local _src = source
local reason = 'ban'
local Invoke = GetInvokingResource()
print(("[^1ERROR^7] Resource ^5%s^7 Used the ^5astro:cheater^7 Event, this event ^1no longer supported!^7 Visit https://github.com/katakume-astro/astro_lib_beta/edit/main/astro_lib/server/old.lua for how to fix!"):format(Invoke))
ban(_src, reason)
end)
