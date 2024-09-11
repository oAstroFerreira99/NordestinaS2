-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("admin",Creative)
vCLIENT = Tunnel.getInterface("admin")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- UGROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ugroups",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and parseInt(Message[1]) > 0 then
		local Messages = ""
		local Groups = vRP.Groups()
		local OtherPassport = Message[1]
		for Permission,_ in pairs(Groups) do
			local Data = vRP.DataGroups(Permission)
			if Data[OtherPassport] then
				Messages = Messages..Permission.."<br>"
			end
		end

		if Messages ~= "" then
			TriggerClientEvent("Notify",source,"verde",Messages,10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addvehs",function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.HasGroup(Passport,"Admin") then
            vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = args[2], plate = vRP.GeneratePlate(), work = "false" })
            TriggerClientEvent("Notify",args[1],"verde","Recebido o veículo <b>"..args[2].."</b> em sua garagem.",5000)
            TriggerClientEvent("Notify",source,"verde","Adicionado o veiculo <b>"..args[2].."</b> na garagem de ID <b>"..args[1].."</b>.",10000)
        end
    end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remvehs",function(source,Message)
    local Passport = vRP.Passport(source)
    if vRP.HasGroup(Passport,"Admin",1) then
        if Message[1] and Message[2] then
            local OtherPlayer = vRP.Passport(parseInt(Message[2]))
            local OtherIdentity = vRP.Identity(parseInt(Message[2]))
            if vRP.Request(source,"Deseja retirar o veículo <b>"..VehicleName(Message[1]).."</b> do Passaporte: <b>"..parseInt(Message[2]).." "..OtherIdentity.name.." "..OtherIdentity.name2.."</b> ?","Sim","Não") then
                vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(Message[2]), vehicle = Message[1] })
                TriggerClientEvent("Notify",source,"verde", "Você removeu o veículo <b>"..VehicleName(Message[1]).."</b> do Passaporte: <b>"..parseInt(Message[2]).."</b>.", 5000)
                TriggerClientEvent("Notify",OtherPlayer,"vermelho", "O veículo <b>"..VehicleName(Message[1]).."</b> foi removido da sua garagem.", 5000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remvehs",function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.HasGroup(Passport,"Admin") then
            vRP.Query("vehicles/removeVehicles",{ Passport = Passport, vehicle = args[2], plate = vRP.GeneratePlate(), work = "false" })
            TriggerClientEvent("Notify",args[1],"verde","Removido o veículo <b>"..args[2].."</b> de sua garagem.",5000)
            TriggerClientEvent("Notify",source,"verde","Removido o veiculo <b>"..args[2].."</b> da garagem de ID <b>"..args[1].."</b>.",10000)
        end
    end
end) 

-----------------------------------------------------------------------------------------------------------------------------------------
-- Checar a quantidade de players e ids online.     ~ admin/server-side/core.lua
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("pon",function(source,args,rawCommand)
    local user_id = vRP.Passport(source)
    if vRP.HasGroup(user_id, "Admin") then
        local users = vRP.Players()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent("Notify",source,"amarelo","TOTAL ONLINE : <b>"..quantidade.."</b><br>ID's ONLINE : <b>"..players.."</b>",5000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("remvehs",function(source,Message)
--     local Passport = vRP.Passport(source)
--     if vRP.HasGroup(Passport,"Admin",1) then
--         if Message[1] and Message[2] then
--             local OtherPlayer = vRP.Passport(parseInt(Message[2]))
--             local OtherIdentity = vRP.Identity(parseInt(Message[2]))
--             if vRP.Request(source,"Deseja retirar o veículo <b>"..VehicleName(Message[1]).."</b> do Passaporte: <b>"..parseInt(Message[2]).." "..OtherIdentity.name.." "..OtherIdentity.name2.."</b> ?","Sim","Não") then
--                 vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(Message[2]), vehicle = Message[1] })
--                 TriggerClientEvent("Notify",source,"verde", "Você removeu o veículo <b>"..VehicleName(Message[1]).."</b> do Passaporte: <b>"..parseInt(Message[2]).."</b>.", 5000)
--                 TriggerClientEvent("Notify",OtherPlayer,"vermelho", "O veículo <b>"..VehicleName(Message[1]).."</b> foi removido da sua garagem.", 5000)
--             end
--         end
--     end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("clearinv",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 then
			TriggerClientEvent("Notify",source,"verde","Limpeza concluída.",5000)
			vRP.ClearInventory(Message[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gem",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Amount = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				TriggerClientEvent("Notify",source,"verde","Gemas entregues.",5000)
				vRP.Query("accounts/AddGems",{ license = Identity["license"], gems = Amount })
				TriggerEvent("Discord","Gemstone","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.."\n**Gemas:** "..Amount.."\n**Address:** "..GetPlayerEndpoint(source),3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("blips",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			vRPC.BlipAdmin(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			if Message[1] then
				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.UpgradeThirst(OtherPassport,100)
					vRP.UpgradeHunger(OtherPassport,100)
					vRP.DowngradeStress(OtherPassport,100)
					vRP.Revive(ClosestPed,200)
				end
			else
				vRP.Revive(source,200,true)
				vRP.UpgradeThirst(Passport,100)
				vRP.UpgradeHunger(Passport,100)
				vRP.DowngradeStress(Passport,100)

				TriggerClientEvent("paramedic:Reset",source)

				vRPC.removeObjects(source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			if Message[1] and Message[2] and itemBody(Message[1]) ~= nil then
				vRP.GenerateItem(Passport,Message[1],parseInt(Message[2]),true)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			if Message[1] and Message[2] and Message[3] and itemBody(Message[1]) ~= nil then
				vRP.GenerateItem(Message[3],Message[1],parseInt(Message[2]),true)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delete",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] then
		if vRP.HasGroup(Passport,"Admin",2) then
			local OtherPassport = parseInt(Message[1])
			vRP.Query("characters/removeCharacter",{ id = OtherPassport })
			TriggerClientEvent("Notify",source,"verde","Personagem <b>"..OtherPassport.."</b> deletado.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("nc",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			vRPC.noClip(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 then
			local OtherSource = vRP.Source(Message[1])
			if OtherSource then
				TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..Message[1].."</b> expulso.",5000)
				vRP.Kick(OtherSource,"Expulso da cidade.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Days = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("banneds/InsertBanned",{ license = Identity["license"], time = Days })
				TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..OtherPassport.."</b> banido por <b>"..Days.."</b> dias.",5000)

				local OtherSource = vRP.Source(OtherPassport)
				if OtherSource then
					vRP.Kick(OtherSource,"Banido.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 then
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("banneds/RemoveBanned",{ license = Identity["license"] })
				TriggerClientEvent("Notify",source,"verde","Passaporte <b>"..OtherPassport.."</b> desbanido.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			local Keyboard = vKEYBOARD.keySingle(source,"Cordenadas:")
			if Keyboard then
				local Split = splitString(Keyboard[1],",")
				vRP.Teleport(source,Split[1] or 0,Split[2] or 0,Split[3] or 0)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("announce",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Tempo (em MS):")
			if Keyboard then
				TriggerClientEvent("Notify",-1,Keyboard[2],Keyboard[1],Keyboard[3])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vKEYBOARD.keyCopy(source,"Cordenadas:",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(heading))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		-- if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 and Message[2] then
			TriggerClientEvent("Notify",source,"verde","Adicionado <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.",5000)
			vRP.SetPermission(Message[1],Message[2],Message[3])
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 and Message[2] then
			TriggerClientEvent("Notify",source,"verde","Removido <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.",5000)
			vRP.RemovePermission(Message[1],Message[2])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)

				vRP.Teleport(ClosestPed,Coords["x"],Coords["y"],Coords["z"])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(ClosestPed)
				local Coords = GetEntityCoords(Ped)
				vRP.Teleport(source,Coords["x"],Coords["y"],Coords["z"])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			vCLIENT.teleportWay(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limbo",function(source)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) <= 100 then
		vCLIENT.teleportLimbo(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hash",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local vehicle = vRPC.VehicleHash(source)
			if vehicle then
				vRP.Archive("hash.txt",vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			TriggerClientEvent("admin:vehicleTuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fix",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,10)
			if Vehicle then
				TriggerClientEvent("inventory:repairAdmin",source,Network,Plate)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limparea",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			TriggerClientEvent("syncarea",source,Coords["x"],Coords["y"],Coords["z"],100)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) then
			TriggerClientEvent("Notify",source,"azul","<b>Jogadores Conectados:</b> "..GetNumPlayerIndices(),5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:COORDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Coords")
AddEventHandler("admin:Coords",function(Coords)
	vRP.Archive("coordenadas.txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.buttonTxt()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vRP.Archive(Passport..".txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(heading))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("announce2",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and Message[1] then
			TriggerClientEvent("chat:ClientMessage",-1,"Governador",History:sub(9))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSOLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("console",function(source,Message,History)
	if source == 0 then
		TriggerClientEvent("chat:ClientMessage",-1,"Governador",History:sub(9))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kickall",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin") then
			return
		end
	end

	local List = vRP.Players()
	for _,Sources in pairs(List) do
		vRP.Kick(Sources,"Desconectado, a cidade reiniciou.")
		Wait(100)
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("save",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin") then
			return
		end
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local List = vRP.Players()
			for OtherPlayer,_ in pairs(List) do
				async(function()
					vRP.GenerateItem(OtherPlayer,Message[1],Message[2],true)
				end)
			end

			TriggerClientEvent("Notify",source,"verde","Envio concluído.",10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACECOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
local Checkpoint = 0
function Creative.raceCoords(vehCoords,leftCoords,rightCoords)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Checkpoint = Checkpoint + 1

		vRP.Archive("races.txt","["..Checkpoint.."] = {")

		vRP.Archive("races.txt","{ "..mathLength(vehCoords["x"])..","..mathLength(vehCoords["y"])..","..mathLength(vehCoords["z"]).." },")
		vRP.Archive("races.txt","{ "..mathLength(leftCoords["x"])..","..mathLength(leftCoords["y"])..","..mathLength(leftCoords["z"]).." },")
		vRP.Archive("races.txt","{ "..mathLength(rightCoords["x"])..","..mathLength(rightCoords["y"])..","..mathLength(rightCoords["z"]).." }")

		vRP.Archive("races.txt","},")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
local Spectate = {}
RegisterCommand("spectate",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			if Spectate[Passport] then
				local Ped = GetPlayerPed(Spectate[Passport])
				if DoesEntityExist(Ped) then
					SetEntityDistanceCullingRadius(Ped,0.0)
				end

				TriggerClientEvent("admin:resetSpectate",source)
				Spectate[Passport] = nil
			else
				local nsource = vRP.Source(Message[1])
				if nsource then
					local Ped = GetPlayerPed(nsource)
					if DoesEntityExist(Ped) then
						SetEntityDistanceCullingRadius(Ped,999999999.0)
						Wait(1000)
						TriggerClientEvent("admin:initSpectate",source,nsource)
						Spectate[Passport] = nsource
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Work"] = 0
GlobalState["Hours"] = 12
GlobalState["Minutes"] = 0
GlobalState["Weather"] = "CLEAR"
GlobalState["Blackout"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEATHERLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local WeatherList = { "CLEAR", "EXTRASUNNY", "SMOG", "OVERCAST", "CLOUDS", "CLEARING" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYNC
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		GlobalState["Work"] = GlobalState["Work"] + 1
		GlobalState["Minutes"] = GlobalState["Minutes"] + 1

		if GlobalState["Minutes"] >= 60 then
			GlobalState["Hours"] = GlobalState["Hours"] + 1
			GlobalState["Minutes"] = 0

			if GlobalState["Hours"] >= 24 then
				GlobalState["Hours"] = 0
			end
		end

		Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("timeset",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			GlobalState["Hours"] = parseInt(Message[1])
			GlobalState["Minutes"] = parseInt(Message[2])

			if Message[3] then
				GlobalState["Weather"] = Message[3]
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Spectate[Passport] then
		Spectate[Passport] = nil
	end
end)