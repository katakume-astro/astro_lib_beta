lib.versionCheck('katakume-astro/astro_lib_beta')



local ascii = [[                 __                    .__  ._____.    
_____    _______/  |________  ____     |  | |__\_ |__  
\__  \  /  ___/\   __\_  __ \/  _ \    |  | |  || __ \ 
 / __ \_\___ \  |  |  |  | \(  <_> )   |  |_|  || \_\ \
(____  /____  > |__|  |__|   \____/____|____/__||___  /
     \/     \/                   /_____/            \/ ]]

print(ascii)


local function ban(source, reason)
    if reason == nil then print('You have not provided content') return end
    if source == nil then print('You didnt specify a player') return end
    TriggerEvent("EasyAdmin:banPlayer", source, "astro_lib / (" .. reason .. ")", 1044463300)
    log(source, 'the player was banned for (" .. reason .. ")')
end

-- exports['astro_lib']:ban(source, 'reason')
exports('ban', ban) 

local function log(source, reason)
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
