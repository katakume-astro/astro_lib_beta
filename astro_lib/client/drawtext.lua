-- Credit: https://github.com/Qbox-project, https://github.com/Qbox-project/qb-core/blob/main/client/drawtext.lua
local positions = {
    left = 'left-center',
    right = 'right-center',
    top = 'top-center'
}

local function hideText()
    lib.hideTextUI()
end

local function drawText(text, position)
    position = positions[position] or position
    lib.showTextUI(text, {
        position = position
    })
end

local function changeText(text, position)
    position = positions[position] or position
    lib.hideTextUI()
    lib.showTextUI(text, {
        position = position
    })
end

local function keyPressed()
    CreateThread(function() -- Not sure if a thread is needed but why not eh?
        Wait(500)
        lib.hideTextUI()
    end)
end

exports('DrawText', drawText) -- exports['astro_lib']:DrawText('[E] button', 'left')
exports('ChangeText', changeText) -- exports['astro_lib']:ChangeText('[E] button', 'left')
exports('HideText', hideText) -- exports['astro_lib']:HideText()
exports('KeyPressed', keyPressed) -- exports['astro_lib']:KeyPressed()
