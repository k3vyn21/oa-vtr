--
-- Vars
--
universalText = true

local jobs = {
    [1] = {
        ['job'] = {
            ['street'] = "Groove Street", --nombre de la casa
            ['coordsFirstPoint'] = vector3(-39.31, -1859.4, 29.41), -- primer punto
            ['coordsSecondPoint'] = vector3(-34.08, -1847.1, 26.19), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(-24.1, -1839.36, 25.36),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [2] = {
        ['job'] = {
            ['street'] = "Rancho", --nombre de la casa
            ['coordsFirstPoint'] = vector3(328.38, -1743.57, 33.04), -- primer punto
            ['coordsSecondPoint'] = vector3(333.03, -1740.98, 29.73), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(340.04, -1752.14, 29.22),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [3] = {
        ['job'] = {
            ['street'] = "Davis", --nombre de la casa
            ['coordsFirstPoint'] = vector3(86.73, -1962.67, 24.47), -- primer punto
            ['coordsSecondPoint'] = vector3(85.85, -1959.63, 21.12), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(86.98, -1949.91, 20.81),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [4] = {
        ['job'] = {
            ['street'] = "Chambelain", --nombre de la casa
            ['coordsFirstPoint'] = vector3(-59.16, -1442.05, 34.88), -- primer punto
            ['coordsSecondPoint'] = vector3(-64.22, -1449.81, 32.52), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(-57.12, -1458.16, 32.04),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [5] = {
        ['job'] = {
            ['street'] = "Estudio", --nombre de la casa
            ['coordsFirstPoint'] = vector3(-1217.71, -556.7, 43.14), -- primer punto
            ['coordsSecondPoint'] = vector3(-1193.82, -557.16, 27.98), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(-1201.46, -569.41, 26.74),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [6] = {
        ['job'] = {
            ['street'] = "Sustancias Road", --nombre de la casa
            ['coordsFirstPoint'] = vector3(1324.66, -1558.44, 58.13), -- primer punto
            ['coordsSecondPoint'] = vector3(1327.58, -1553.14, 54.05), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(1319.2, -1551.96, 50.61),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [7] = {
        ['job'] = {
            ['street'] = "Sustancias Road 2", --nombre de la casa
            ['coordsFirstPoint'] = vector3(1381.52, -1512.96, 63.3), -- primer punto
            ['coordsSecondPoint'] = vector3(1379.13, -1514.92, 58.44), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(1374.86, -1522.46, 56.45),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    },
    [8] = {
        ['job'] = {
            ['street'] = "Negocio 1", --nombre de la casa
            ['coordsFirstPoint'] = vector3(-1539.25, -898.92, 17.56), -- primer punto
            ['coordsSecondPoint'] = vector3(-1533.98, -905.4, 10.17), --segundo punto
            ['thirtpoint'] = vector3(147.56, 320.19, 112.14), --punto final 
            ['stopFurgo'] = vector3(-1539.47, -914.72, 10.12),  --stop la furgo
            ['job0'] = false,
            ['job1'] = false,
            ['job2'] = false,
            ['job3'] = false,
            ['job4'] = false
        }
    }
}

local VTR = {
    ['npc'] = {
        ['coords'] = vector4(135.36, 322.98, 115.63, 112.79),
        ['label'] = vector3(135.36, 322.98, 117.63) 
    }
}

--
-- ESX Callbacks
--
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

    PlayerData = ESX.GetPlayerData()
    
    SpawnNPC('a_m_y_business_01', 'WORLD_HUMAN_CLIPBOARD', VTR['npc']['coords'])
    while true do
        local s = 1000
        local ply = PlayerPedId()
        local plyc = GetEntityCoords(ply)
        if #(plyc - VTR['npc']['label']) < 5.0 then
            s = 5
            if #(plyc - VTR['npc']['label']) < 2.5 then
                s = 0
                if PlayerData.job2 ~= nil and PlayerData.job2.name == 'vtr' then
                    if universalText == true then
                        ESX.ShowFloatingHelpNotification("[~g~E~w~] Conseguir un trabajo", VTR['npc']['label'])
                        if IsControlJustPressed(0, 38) then
                            TriggerServerEvent('InteractSound_SV:PlayOnSource', 'vtr', 0.9)
                            TriggerEvent('oa-vtr:StartTutorial')
                            selectedJob = jobs[math.random(1, #jobs)]
                            selectedJob['job']['job0'] = true
                            blip1 = AddBlipForCoord(selectedJob['job']['stopFurgo'])
                            SetBlipRoute(blip1, true)
                            universalText = false
                            ESX.Game.SpawnVehicle('minivan', vector3(139.03, 311.61, 111.75), 89.99, function(ven)
                                exports['oa-fuel']:SetFuel(ven, 100)
                            end)
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                if skin.sex == 0 then
                                    TriggerEvent('skinchanger:change', 'tshirt_1', 15)
                                    TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                                    TriggerEvent('skinchanger:change', 'torso_1', 73)
                                    TriggerEvent('skinchanger:change', 'torso_2', 0)
                                    TriggerEvent('skinchanger:change', 'pants_1', 36)
                                    TriggerEvent('skinchanger:change', 'pants_2', 0)
                                    TriggerEvent('skinchanger:change', 'shoes_1', 12)
                                    TriggerEvent('skinchanger:change', 'shoes_2', 0)
                                    TriggerEvent('skinchanger:change', 'helmet_1', 76)
                                    TriggerEvent('skinchanger:change', 'helmet_2', 4)
                                    TriggerEvent('skinchanger:change', 'arms', 63)
                                    TriggerEvent('skinchanger:change', 'decals_1', 1)
                                else
                                    TriggerEvent('skinchanger:change', 'tshirt_1', 15)
                                    TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                                    TriggerEvent('skinchanger:change', 'torso_1', 73)
                                    TriggerEvent('skinchanger:change', 'torso_2', 0)
                                    TriggerEvent('skinchanger:change', 'pants_1', 35)
                                    TriggerEvent('skinchanger:change', 'pants_2', 0)
                                    TriggerEvent('skinchanger:change', 'shoes_1', 24)
                                    TriggerEvent('skinchanger:change', 'shoes_2', 0)
                                    TriggerEvent('skinchanger:change', 'helmet_1', -1)
                                    TriggerEvent('skinchanger:change', 'helmet_2', -1)
                                    TriggerEvent('skinchanger:change', 'arms', 83)
                                    TriggerEvent('skinchanger:change', 'decals_1', 1)
                                end
                            end)
                        end
                    else
                        ESX.ShowFloatingHelpNotification("~r~Ya estas en un encargo", VTR['npc']['label'])
                    end
                else
                    ESX.ShowFloatingHelpNotification("~r~No eres empleado de VTR", VTR['npc']['label'])
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent("pNotify:SendNotification", {text = "<center><strong><b style='color:#9e66f2'>VTR</b><strong><br /> <br /> Eres menso o te pegan¿? no necesito mas trabajadores sale!!<center>", type = "info", queue = "global", timeout = 10000, layout = "centerRight" })
                    end
                end
            end
        end
        Citizen.Wait(s)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ply = PlayerPedId()
        local plyc = GetEntityCoords(ply)
        while selectedJob == nil do
            Citizen.Wait(100)
        end
        if selectedJob['job']['job0'] == true then
            DrawText("Ve a instalar la ~g~Antena~w~ en ~y~"..selectedJob['job']['street'])
            if #(plyc - selectedJob['job']['stopFurgo']) < 3.0 then
                ESX.ShowFloatingHelpNotification("[~g~E~w~] Para aparcar la furgo", selectedJob['job']['stopFurgo'])
                if IsControlJustPressed(0, 38) then
                    ExecuteCommand("me Saca del auto un router y una antena satelital")
                    ESX.TriggerServerCallback('oa-vtr:giveItem', function()
                    
                    end, 'antena', 1)
                    ESX.TriggerServerCallback('oa-vtr:giveItem', function()
                    
                    end, 'router', 1)
                    SetBlipRoute(blip1, false)
                    RemoveBlip(blip1)
                    blip4 = AddBlipForCoord(selectedJob['job']['coordsFirstPoint'])
                    SetBlipRoute(blip4, true)
                    FreezeEntityPosition(GetVehiclePedIsIn(ply), true)
                    selectedJob['job']['job0'] = false
                    selectedJob['job']['job1'] = true
                end
            end
        end
        if selectedJob['job']['job1'] == true then
            DrawText("Ve a instalar la ~g~Antena~w~ en ~y~"..selectedJob['job']['street'])
            if #(plyc - selectedJob['job']['coordsFirstPoint']) < 3.0 then
                ESX.ShowFloatingHelpNotification("[~g~E~w~] Para instalar la antena", selectedJob['job']['coordsFirstPoint'])
                if IsControlJustPressed(0, 38) then
                    TriggerEvent("mythic_progbar:client:progress", {name = "unique_action_name",duration = 12 * 1000, label = "Instalando antena..."})
                    FreezeEntityPosition(ply, true)
                    ExecuteCommand("e mechanic")
                    Citizen.Wait(12000)
                    FreezeEntityPosition(ply, false)
                    ClearPedTasks(ply)
                    SetBlipRoute(blip4, false)
                    RemoveBlip(blip4)
                    ESX.TriggerServerCallback('oa-vtr:removeItem', function()
                    
                    end, 'antena', 1)
                    --exports.oa_xp:ESXP_Add(15)
                    blip2 = AddBlipForCoord(selectedJob['job']['coordsSecondPoint'])
                    SetBlipRoute(blip2, true)
                    selectedJob['job']['job1'] = false
                    selectedJob['job']['job2'] = true
                end
            end
        end
        if selectedJob['job']['job2'] == true then
            DrawText("Ve a instalar el ~g~Router~w~ en ~y~"..selectedJob['job']['street'])
            if #(plyc - selectedJob['job']['coordsSecondPoint']) < 2 then
                ESX.ShowFloatingHelpNotification("[~g~E~w~] Para instalar el router", selectedJob['job']['coordsSecondPoint'])
                if IsControlJustPressed(0, 38) then
                    TriggerEvent("mythic_progbar:client:progress", {name = "unique_action_name",duration = 20 * 1000, label = "Instalando router..."})
                    FreezeEntityPosition(ply, true)
                    ExecuteCommand("e mechanic")
                    Citizen.Wait(20000)
                    FreezeEntityPosition(ply, false)
                    ClearPedTasks(ply)
                    SetBlipRoute(blip2, false)
                    ESX.TriggerServerCallback('oa-vtr:removeItem', function()
                    
                    end, 'router', 1)
                    --exports.oa_xp:ESXP_Add(25)
                    RemoveBlip(blip2)
                    blip3 = AddBlipForCoord(selectedJob['job']['thirtpoint'])
                    SetBlipRoute(blip3, true)
                    SetBlipRouteColour(blip3, 1)
                    selectedJob['job']['job2'] = false
                    selectedJob['job']['job3'] = true
                    selectedJob['job']['job4'] = true
                end
            end
        end
        if selectedJob['job']['job3'] == true then
            DrawText("Ve a dejar la ~g~furgoneta")
            if selectedJob['job']['job4'] == true then
                if #(plyc - selectedJob['job']['stopFurgo']) < 5 then
                    if IsVehicleModel(GetVehiclePedIsIn(ply), GetHashKey('minivan')) then
                        ESX.ShowFloatingHelpNotification("[~g~E~w~] Para encender el motor", selectedJob['job']['stopFurgo'])
                        if IsControlJustPressed(0, 38) then
                            FreezeEntityPosition(GetVehiclePedIsIn(ply), false)
                            selectedJob['job']['job4'] = false
                        end
                    else
                        ESX.ShowFloatingHelpNotification("~r~Montate en la furgoneta", selectedJob['job']['stopFurgo'])
                    end
                end
            end
            if #(plyc - selectedJob['job']['thirtpoint']) < 5 then
                ESX.ShowFloatingHelpNotification("[~g~E~w~] Para dejar la camioneta", selectedJob['job']['thirtpoint'])
                if IsControlJustPressed(0, 38) then
                    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1)), GetHashKey('minivan')) then
                        DeleteEntity(GetVehiclePedIsIn(ply))
                        SetBlipRoute(blip3, false)
                        RemoveBlip(blip3)
                        ESX.TriggerServerCallback('oa-vtr:addMoney', function()
                        
                        end)
                        --exports.oa_xp:ESXP_Add(28)
                        selectedJob['job']['job3'] = false
                        universalText = true
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                            local model = nil
                
                            if skin.sex == 0 then
                                model = GetHashKey("mp_m_freemode_01")
                            else
                                model = GetHashKey("mp_f_freemode_01")
                            end
                
                            RequestModel(model)
                            while not HasModelLoaded(model) do
                                RequestModel(model)
                                Citizen.Wait(1)
                            end
                
                            SetPlayerModel(PlayerId(), model)
                            SetModelAsNoLongerNeeded(model)
                
                            TriggerEvent('skinchanger:loadSkin', skin)
                            TriggerEvent('esx:restoreLoadout')
                            local playerPed = GetPlayerPed(-1)
                            SetPedArmour(playerPed, 0)
                            ClearPedBloodDamage(playerPed)
                            ResetPedVisibleDamage(playerPed)
                            ClearPedLastWeaponDamage(playerPed)
                        end)
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

--
-- Funcs
--
SpawnNPC = function(modelo, anim, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x,y,z,h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)
    TaskStartScenarioInPlace(crearNPC, anim, 0, false)
end

DrawText = function(text)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(0, 1)
end

Citizen.CreateThread(function()
    blip = AddBlipForCoord(VTR['npc']['label'])
    SetBlipSprite(blip, 564)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 30)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Central VTR")
    EndTextCommandSetBlipName(blip)
end)

--
-- Commands
--
RegisterCommand('finalizartrabajo', function()
    if PlayerData.job2.name == 'vtr' then
        selectedJob['job']['job0'] = false
        selectedJob['job']['job1'] = false
        selectedJob['job']['job2'] = false
        selectedJob['job']['job3'] = false
        selectedJob['job']['job4'] = false
        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local model = nil

            if skin.sex == 0 then
                model = GetHashKey("mp_m_freemode_01")
            else
                model = GetHashKey("mp_f_freemode_01")
            end

            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(1)
            end

            SetPlayerModel(PlayerId(), model)
            SetModelAsNoLongerNeeded(model)

            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('esx:restoreLoadout')
            local playerPed = GetPlayerPed(-1)
            SetPedArmour(playerPed, 0)
            ClearPedBloodDamage(playerPed)
            ResetPedVisibleDamage(playerPed)
            ClearPedLastWeaponDamage(playerPed)
        end)
    elseif PlayerData.job2.name == 'bus' then
        TriggerEvent('oa-bus:forceEnd')
    elseif PlayerData.job2.name == 'trucker' then
        TriggerEvent('oa-camionero:forceEnd')
    elseif PlayerData.job2.name == 'lumberjack' then
        TriggerEvent('oa-basurero:forceEnd')
    elseif PlayerData.job2.name == 'chilquinta' then
        TriggerEvent('oa-aereo:forceEnd')
    elseif PlayerData.job2.name == 'chilquinta' then
        TriggerEvent('oa-lipi:forceEnd')
    end
end)

--
-- Job callback
--

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
end)

RegisterNetEvent('oa-vtr:StartTutorial')
AddEventHandler('oa-vtr:StartTutorial',function()
	EnableGui(true)
end)

RegisterNUICallback('closeNUI', function(data, cb)
    EnableGui(false)
end) 

function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enabledvtr",
        enable = enable
    })
end