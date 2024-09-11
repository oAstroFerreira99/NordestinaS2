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
vCLIENT = Tunnel.getInterface("Shark_identity")



-- local resourceName = "Shark_identity"
-- AddEventHandler('onResourceStart', function()
--     if (GetCurrentResourceName() ~= resourceName) then
--         print('^1Você mudou o nome do script.')
--         Wait(15000)
--         os.exit()
--         return  
--     end
--     print("^2O script " ..resourceName.. " foi iniciado com sucesso!")
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORYITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getItemAmount(Passport, Item)
    if vRP.Source(Passport) then
        local Inventory = vRP.Inventory(Passport)
        for k, v in pairs(Inventory) do
            if splitString(Item, "-")[1] == splitString(v["item"], "-")[1] then
                return { "R$"..v["amount"] }
            end
        end
    end
    
    return { 0 }
end
--------------------------------------------------------------------------------------------------------------
-- ENVIARINFO
--------------------------------------------------------------------------------------------------------------
RegisterNetEvent("sendInfo")
AddEventHandler("sendInfo", function()
    local source = source 
    local user_id = vRP.Passport(source)
    if user_id then
        local identity = vRP.Identity(user_id)
        local user_id = vRP.Passport(source)
        local age = identity.sex or "Não encontrada"
        local phone =  identity.phone or "Não encontrada"
        local License = identity.license
        local rg = vRP.UserGemstone(License)  or "Não encontrada"
        local bank =  identity.bank or "Não encontrada"
        local cash = vRP.getItemAmount(user_id,"dollars") or "Não encontrada"
        if identity then
            TriggerClientEvent('updateName', source, identity.name .." ".. identity.name2)
            TriggerClientEvent('updateId', source, user_id)
            TriggerClientEvent('updateAge', source, age)
            TriggerClientEvent('updatePhone', source, phone)
            TriggerClientEvent('updateRg', source, rg)
            TriggerClientEvent('updateBank', source, "R$"..bank)
            TriggerClientEvent('updateCash', source, cash)
        else
            print("Erro: identity é nil. Por favor verifique a sua função ou verifique com o suporte.")
        end
    end
end)

