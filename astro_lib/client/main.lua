function spawnobject(object, coords)
    ESX.Game.SpawnLocalObject(object, coords, function(object)
        if Config.debug == true then
        print(object, 'spawned by astro_lib')
        end
      end)
end

-- exports['astro_lib']:spawnobject('prop_cs_cuffs_01', vector3(404.9496, -1634.0852, 29.2920))
exports('spawnobject', spawnobject) 






function spawnvehicle(vehicle, coords, heading)
    ESX.Game.SpawnVehicle(vehicle, coords, heading, function(vehicle)
        if Config.TaskWarpPedIntoVehicle == true then TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        elseif Config.debug == true then
        print(vehicle, 'spawned by astro_lib')
        end
      end)
end

-- exports['astro_lib']:spawnvehicle('blista', vector3(402.7710, -1633.7021, 29.2919), 258.1375)
exports('spawnvehicle', spawnvehicle) 