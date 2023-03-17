local function ban(source, reason)
    TriggerEvent("EasyAdmin:banPlayer", source, "astro_lib / (" .. reason .. ")", 1044463300)
    log(source, 'the player was banned for (" .. reason .. ")')
end
exports('ban', ban) -- exports['astro_lib']:ban(source, 'reason')

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

exports('log', log) -- exports['astro_lib']:log(source, 'reason')