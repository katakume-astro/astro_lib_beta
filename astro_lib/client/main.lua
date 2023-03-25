function spawnobject(object, coords)
    ESX.Game.SpawnLocalObject(object, coords, function(object)
        FreezeEntityPosition(object, true)
        PlaceObjectOnGroundProperly(object)
        if Config.debug == true then
        print(object, 'spawned by astro_lib')
        end
      end)
end

-- exports['astro_lib']:spawnobject('prop_cs_cuffs_01', vector3(404.9496, -1634.0852, 29.2920))
exports('spawnobject', spawnobject) 

function spawnvehicle(vehicle, coords, heading)
    ESX.Game.SpawnVehicle(vehicle, coords, heading, function(vehicle)
        SetVehicleFuelLevel(vehicle, 100.0)
        if Config.TaskWarpPedIntoVehicle == true then TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
        elseif Config.debug == true then
        print(vehicle, 'spawned by astro_lib')
        end
      end)
end

-- exports['astro_lib']:spawnvehicle('blista', vector3(402.7710, -1633.7021, 29.2919), 258.1375)
exports('spawnvehicle', spawnvehicle) 

function deletevehicle()
    if cache.vehicle then
        SetEntityAsMissionEntity(cache.vehicle, true, true)
        DeleteVehicle(cache.vehicle)
    else
        local pcoords = GetEntityCoords(cache.ped)
        local vehicles = GetGamePool('CVehicle')
        for _, v in pairs(vehicles) do
            if #(pcoords - GetEntityCoords(v)) <= 5.0 then
                SetEntityAsMissionEntity(v, true, true)
                DeleteVehicle(v)
            end
        end
    end
end

-- exports['astro_lib']:deletevehicle()
exports('deletevehicle', deletevehicle) 

function spawnped(ped, coords, heading) --[[DO NOT run this function every tick]]--
        if lib.requestModel(ped, 1000) then 
            npc = CreatePed(1, GetHashKey(ped), coords, heading, false, false)
            FreezeEntityPosition(npc, true)
            SetEntityInvincible(npc, true)
            SetBlockingOfNonTemporaryEvents(npc, true)
        else 
            print('Couldn\'t load npc : '..npc..'')
        end
end
    
-- exports['astro_lib']:spawnped('csb_anita', vector3(402.7710, -1633.7021, 29.2919), 258.1375)
exports('spawnped', spawnped)
