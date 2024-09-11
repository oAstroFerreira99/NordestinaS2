local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_tattoos")
func = {}
Tunnel.bindInterface("nation_tattoos", func)

function func.checkPermission(permission, src)
    local source = src or source
    local Passport = vRP.Passport(source)
    if vRP.HasPermission(Passport,"Admin",{1,2,3}) and vRP.HasService(Passport,"Admin") then
        return true
    end
    return 
end

function func.saveChar(t)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local char = getUserChar(Passport)
        char.tattoos, char.overlay = t.tattoos, t.overlay
        -- vRP.setUData("playerdata/setUserdata",{ Passport = parseInt(Passport), key = "Tatuagens", value = json.encode(char,{indent=false}) })
        vRP.setUData(Passport, "Tattoos", json.encode(char,{indent=false}))
    end
end

function func.tryPay(Amount)
    local source = source
    local Passport = vRP.Passport(source)
    if Amount >= 0 then
        if vRP.GetBank(source) > Amount then
            vRP.RemoveBank(Passport, Amount)
        -- if vRP.PaymentFull(Passport, Amount) or Amount == 0 then
            return true
        end
    end
    return false
end

function func.getTattoos()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local char = getUserChar(Passport)
        return (char.tattoos or {}), (char.overlay or 0)
    end
    return false
end

function getUserChar(Passport)
    local data = vRP.UserData(Passport, "Tattoos")
    if next(data) ~= nil then
        local char = data
        if char then
            return char
        end
    end
    return {}
end

