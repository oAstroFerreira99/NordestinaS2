local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("nation_bennys",src)
Proxy.addInterface("nation_bennys",src)

vCLIENT = Tunnel.getInterface("nation_bennys")

local using_bennys = {}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermission()
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.HasGroup(user_id, "Admin") then
        return true
    end
end

function src.getSavedMods(vehplate,vehname)
    local vehuser = vRP.getUserByRegistration(vehplate)
    if vehuser then
        local rows = vRP.query("vRP/get_tunagem", {user_id = vehuser, veiculo = vehname})
		if rows[1] then
        	return json.decode(rows[1].tunagem or {}) or {}
		end
    end
    return false
end

function src.checkPayment(amount)
    local source = source
    local user_id = vRP.getUserId(source)
	
	if amount == nil or parseInt(amount) <= 0 then
	   amount = 5000
	end

    if vRP.tryFullPayment(user_id, parseInt(amount)) then
        TriggerClientEvent("Notify",source,"sucesso","Modificações aplicadas com <b>sucesso</b><br >Você pagou <b>$ "..vRP.format(tonumber(amount)).."<b>.", 5000)
        return true
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro suficiente.", 5000)
        return false
    end 
	
end

function src.repairVehicle(vehicle, damage)
    TriggerEvent("tryreparar", vehicle)
    return true
end

function src.removeVehicle(vehicle)
    using_bennys[vehicle] = nil
    return true
end

function src.checkVehicle(vehicle)
    if using_bennys[vehicle] then
        return false
    end
    using_bennys[vehicle] = true
    return true
end

function src.checkTuningVehicle()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if type == "engines" or type == "brakes" or type == "transmission" or type == "suspension" or type == "shield" then
			local Price = vehicleCustomisationPrices[type][mod]

			if vRP.PaymentFull(Passport,Price) then
				TriggerClientEvent("lscustoms:purchaseSuccessful",source)
			else
				TriggerClientEvent("lscustoms:purchaseFailed",source)
			end
		else
			if vRP.PaymentFull(Passport,vehicleCustomisationPrices[type]) then
				TriggerClientEvent("lscustoms:purchaseSuccessful",source)
			else
				TriggerClientEvent("lscustoms:purchaseFailed",source)
			end
		end
	end
end

function src.saveVehicle(vehname, vehplate, custom)
	local Passport = vRP.PassportPlate(Plate)
	if Passport then
		vRP.Query("entitydata/SetData",{ dkey = "Mods:"..Passport["Passport"]..":"..vehName, dvalue = json.encode(Mods) })
	end
end

RegisterServerEvent("nation:syncApplyMods")
AddEventHandler("nation:syncApplyMods",function(vehicle_tuning,vehicle)
    TriggerClientEvent("nation:applymods_sync",-1,vehicle_tuning,vehicle)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
RegisterCommand('gabyb',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        TriggerClientEvent('actionmenu',source)
    end
end)






























































































































































































































































































































































--CHORA NÃO TACO MONO BOLA! PRINCIPALMENTE PARA O ITACHI ISSO!













































































































































































