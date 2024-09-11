-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Proxy = module("lib/Proxy")
Tunnel = module("lib/Tunnel")
vRPC = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vRP = {}
tvRP = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNNER/PROXY
-----------------------------------------------------------------------------------------------------------------------------------------
Proxy.addInterface("vRP",vRP)
Tunnel.bindInterface("vRP",tvRP)
DEVICE = Tunnel.getInterface("device")
REQUEST = Tunnel.getInterface("request")
SURVIVAL = Tunnel.getInterface("survival")
-----------------------------------------------------------------------------------------------------------------------------------------
-- GG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gg",function(source)
	if GetPlayerRoutingBucket(source) < 900000 then
		local Passport = vRP.Passport(source)
		if Passport and SURVIVAL.CheckDeath(source) then
			local Datatable = vRP.Datatable(Passport)
			if Datatable and Datatable["Weight"] then
				Datatable["Weight"] = BackpackWeightDefault
			end

			vRP.ClearInventory(Passport)
			vRP.UpgradeThirst(Passport,100)
			vRP.UpgradeHunger(Passport,100)
			vRP.DowngradeStress(Passport,100)

			TriggerEvent("Discord","Airport","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Address:** "..GetPlayerEndpoint(source),3092790)

			SURVIVAL.Respawn(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SMARTPHONE:SERVICE_REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("smartphone:service_request",function(Data)
	local Service = vRP.NumPermission(Data["service"]["permission"])
	local Passport = vRP.Passport(Data["source"])
	local Identity = vRP.Identity(Passport)
	local Answered = false

	for Passport,Sources in pairs(Service) do
		async(function()
			TriggerClientEvent("NotifyPush",Sources,{ code = 20, phone = Identity["phone"], title = "Chamado de "..Data["name"], text = Data["content"], x = Data["location"][1], y = Data["location"][2], z = Data["location"][3], time = "Recebido às "..os.date("%H:%M"), blipColor = 2 })

			if vRP.Request(Sources,"Aceitar o chamado de <b>"..Data["name"].."?","Sim","Não") then
				if not Answered then
					Answered = true
					TriggerClientEvent("smartphone:pusher",Data["source"],"SERVICE_RESPONSE",{})
					TriggerClientEvent("smartphone:pusher",Sources,"GPS",{ location = Data["location"] })
				else
					TriggerClientEvent("Notify",Sources,"negado","Chamado atendido.",5000)
				end
			end
		end)
	end

	SetTimeout(30000,function()
		if not Answered then
			TriggerClientEvent("smartphone:pusher",Data["source"],"SERVICE_REJECT",{})
		end
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP.REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Request(source,Message,Accept,Reject)
	return REQUEST.Function(source,Message,Accept or "Sim",Reject or "Não")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP.REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Revive(source,Health,Arena)
	return SURVIVAL.Revive(source,Health,Arena)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP.DEVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Device(source,Seconds)
    return DEVICE.Device(source,Seconds)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetMapName(ServerName)
	SetGameType(ServerName)
	SetRoutingBucketEntityLockdownMode(0,"relaxed")
end)