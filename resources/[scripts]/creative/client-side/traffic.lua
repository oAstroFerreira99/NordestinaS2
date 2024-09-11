local convarInt = 200
local onlinePlayers = 10
local crowdDensity = 0.7
local trafficDensity = 0.2
local crowdScaling = true
local crowdDensitivity = true
local trafficDensitivity = true
local trafficScaling = true
local nCrowd = crowdDensity - (onlinePlayers / convarInt / (2 / crowdDensity))

if trafficDensitivity then
    local nTraff = trafficDensity - ( onlinePlayers / convarInt / ( 2 / trafficDensity ) )
end

if trafficDensitivity or crowdDensitivity then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10000)
            local coords = GetEntityCoords(GetPlayerPed(-1),false)
            if coords["z"] < -100.0 then
                if crowdDensitivity then 
                    nCrowd = 0.0 
                end

                if trafficDensitivity then
                    nTraff = 0.0 
                end
            else
                if trafficDensity or crowdDensitivity then
                    if crowdScaling or trafficScaling then
                        onlinePlayers = 0
                        for i = 0, 63 do
                            if NetworkIsPlayerActive(i) then
                                onlinePlayers = onlinePlayers + 1
                            end
                        end

                        if crowdDensitivity then
                            nCrowd = crowdDensity - (onlinePlayers / convarInt / (2 / crowdDensity))
                        end

                        if trafficDensitivity then
                            nTraff = trafficDensity - (onlinePlayers / convarInt / (2 / trafficDensity))
                        end
                    end
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    local player = GetPlayerPed(-1)
    while true do
        Citizen.Wait(0)

        if crowdDensitivity then 
            if crowdScaling then
                SetPedDensityMultiplierThisFrame(nCrowd)  
                SetScenarioPedDensityMultiplierThisFrame(nCrowd,nCrowd)
            else 
                SetPedDensityMultiplierThisFrame(crowdDensity)
                SetScenarioPedDensityMultiplierThisFrame(crowdDensity,crowdDensity)
            end
        end
  
        if trafficDensitivity then
            if trafficScaling then
                SetVehicleDensityMultiplierThisFrame(nTraff)
                SetRandomVehicleDensityMultiplierThisFrame(nTraff)
                SetParkedVehicleDensityMultiplierThisFrame(nTraff)
            else
                SetVehicleDensityMultiplierThisFrame(trafficDensity)
                SetRandomVehicleDensityMultiplierThisFrame(trafficDensity)
                SetParkedVehicleDensityMultiplierThisFrame(trafficDensity)
            end
        end
    end
end)