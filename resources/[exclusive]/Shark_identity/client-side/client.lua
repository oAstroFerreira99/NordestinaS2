-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("Shark_identity",cRP)
vSERVER = Tunnel.getInterface("Shark_identity")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem",function(data)
	SendNUIMessage({ action = "closeSystem" })
	SetNuiFocus(false,false)
	vRP.removeObjects()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateName')
AddEventHandler('updateName', function(identity)
  SendNUIMessage({
    action = "updateName",
    identity = identity
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateAge')
AddEventHandler('updateAge', function(age)
  SendNUIMessage({
    action = "updateAge",
    age = age
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateId')
AddEventHandler('updateId', function(userid)
  SendNUIMessage({
    action = "updateId",
    userid = userid
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updatePhone')
AddEventHandler('updatePhone', function(phone)
  SendNUIMessage({
    action = "updatePhone",
    phone = phone
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateRg')
AddEventHandler('updateRg', function(rg)
  SendNUIMessage({
    action = "updateRg",
    rg = rg
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateBank')
AddEventHandler('updateBank', function(bank)
  SendNUIMessage({
    action = "updateBank",
    bank = bank
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('updateCash')
AddEventHandler('updateCash', function(cash)
  SendNUIMessage({
    action = "updateCash",
    cash = cash
  })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--EVENTS:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
local nuiVisible = false
RegisterCommand("openIdentity",function()
    local ped = PlayerPedId()
    if not IsPedSwimming(ped) then
        nuiVisible = not nuiVisible
        if nuiVisible then
            SendNUIMessage({ action = "openIdentity" })
            TriggerEvent("dynamic:closeSystem")
            SetNuiFocus(false, false)

            if not IsPedInAnyVehicle(ped) then
                vRP.removeObjects()
                vRP.createObjects("cellphone@", "cellphone_horizontal_intro", "prop_police_phone", 50, 28422)
            end
        else
            SendNUIMessage({ action = "closeSystem" })
            SetNuiFocus(false, false)
            vRP.removeObjects()

        end
    end
end)
--------------------------------------------------------------------------------------------------------------
-- SENDINFO
--------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("sendInfo")
        Citizen.Wait(1000)
    end
end)
--------------------------------------------------------------------------------------------------------------
-- DRAWTEXT
--------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    
    if onScreen then
        SetTextScale(0.39, 0.39)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 235)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0125, 0.005 + factor, 0.04, 0, 0, 0, 145)
    end
end


RegisterKeyMapping('openIdentity', 'Abrir ou Fechar Identidade', 'keyboard', 'F11')