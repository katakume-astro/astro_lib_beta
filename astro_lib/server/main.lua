local ascii = [[                 __                    .__  ._____.    
_____    _______/  |________  ____     |  | |__\_ |__  
\__  \  /  ___/\   __\_  __ \/  _ \    |  | |  || __ \ 
 / __ \_\___ \  |  |  |  | \(  <_> )   |  |_|  || \_\ \
(____  /____  > |__|  |__|   \____/____|____/__||___  /
     \/     \/                   /_____/            \/ ]]

print(ascii)

function log(source, reason)
if reason == nil then print('You have not provided content') return end
if source == nil then print('You didnt specify a player') return end
    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "Discord Log",
            ["fields"] = {
                {name = "Source"; value = "```" ..source.. "```"; inline = true},
                {name = "Reason"; value = "```" .. reason .. "```"; inline = true}
            },
            ["footer"] = {
                ["text"] = 'astro_lib'
            },
            ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S')
        }
    }
    
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({embeds = content}), { ['Content-Type'] = 'application/json' })
end

-- exports['astro_lib']:log(source, 'reason')
exports('log', log) 

CreateThread(function()
	--version check with github latest version
	PerformHttpRequest(
		"https://raw.githubusercontent.com/[User]/[Repo]/main/fxmanifest.lua",
		function(err, text, headers)
			if err ~= 200 then
				return
			end
			local version = GetResourceMetadata(GetCurrentResourceName(), "version")
			local latestVersion = string.match(text, '%sversion \"(.-)\"')
			if version ~= latestVersion then
				print("Resource is outdated. Please update " .. GetCurrentResourceName() .. " to the newest version.")
			end
		end,
		"GET"
	)
end)
