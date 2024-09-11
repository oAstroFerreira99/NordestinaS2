-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("tablet")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Open = "Santos"
----------------------------------------------------------------------------------------------------------------------------------------
-- DEALERSHIP:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("tablet:Open")
AddEventHandler("tablet:Open",function(Select)
	if LocalPlayer["state"]["Route"] < 900000 then
		local Ped = PlayerPedId()
		if not LocalPlayer["state"]["Buttons"] and not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and GetEntityHealth(Ped) > 100 then
			TriggerEvent("hud:Active",false)
			TriggerServerEvent("vRP:BucketClient","Enter")
			Open = "Santos" -- Open = Select
			SetNuiFocus(true,true)
			SetCursorLocation(0.5,0.5)
			SendNUIMessage({ action = "openSystem" })

			cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 231.1, -991.19, -98.7, 117.27, 0.00, 0.00, 80.00, false, 0)
			PointCamAtCoord(cam, 224.62, -991.18, -98.99)
	
			SetCamActive(cam, true)
			RenderScriptCams(true, true, 1, true, true)
			
			SetFocusPosAndVel(224.62, -991.18, -98.99, 0.0, 0.0, 0.0)
		end
	end
end)

-- RegisterCommand("dealership",function(source,args,rawCommand)
-- 	TriggerEvent("dealership:Open")
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEVEHICLESPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
function updateVehicleSpawn(vehName)
	local mHash = GetHashKey(vehName)

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		Citizen.Wait(1)
	end

	if entityVehicle ~= nil then
        DeleteEntity(entityVehicle)
    end

	if HasModelLoaded(mHash) then
		entityVehicle = CreateVehicle(mHash, 227.4, -989.29, -98.99, 10, 0, 1)
		SetEntityHeading(entityVehicle, 215.08)
		SetEntityInvincible(entityVehicle,true)
		SetVehicleColours(entityVehicle,64,0)
		SetVehicleExtraColours(entityVehicle,140,1)
		FreezeEntityPosition(entityVehicle,true)
		SetVehicleNumberPlateText(entityVehicle,"PDMSPORT")
		SetModelAsNoLongerNeeded(mHash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function rotation(dir)
    local entityRot = GetEntityHeading(entityVehicle) + dir
    SetEntityHeading(entityVehicle, entityRot % 360)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotate", function(data, cb)
    if (data["key"] == "left") then
        rotation(2)
    else
    	rotation(-2)
    end
    cb("ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NAMEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("nameVehicle",function(data)
	updateVehicleSpawn(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem",function()
	TriggerEvent("hud:Active",true)
	TriggerServerEvent("vRP:BucketClient","Exit")
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	RenderScriptCams(false)
	DestroyAllCams(true)
    DeleteEntity(entityVehicle)
	ClearFocus()
	SendNUIMessage({ action = "closeSystem" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCARROS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCarros",function(data,cb)
	cb({ result = GlobalState["Cars"] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTMOTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestMotos",function(data,cb)
	cb({ result = GlobalState["Bikes"] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTALUGUEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestAluguel",function(data,cb)
	cb({ result = GlobalState["Rental"] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPOSSUIDOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestPossuidos",function(data,cb)
	cb({ result = vSERVER.requestPossuidos() })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestBuy",function(data)
	vSERVER.requestBuy(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTRENTAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestRental",function(data)
	vSERVER.requestRental(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTRENEW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestRenew",function(data)
	vSERVER.requestRenew(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RENTALMONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rentalMoney",function(data)
	vSERVER.rentalMoney(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTTAX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestTax",function(data)
	vSERVER.requestTax(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTTRANSF
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestTransf",function(data)
	vSERVER.requestTransf(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSELL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestSell",function(data)
	vSERVER.requestSell(data["name"])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TABLET:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("tablet:Update")
AddEventHandler("tablet:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIVEABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local vehDrive = nil
local benDrive = false
local benCoords = { 0.0,0.0,0.0 }
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestDrive",function(Data,Callback)
	if vSERVER.startDrive() then
		SetNuiFocus(false,false)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ action = "closeSystem" })

		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		benCoords = { Coords["x"],Coords["y"],Coords["z"] }

		LocalPlayer["state"]["Race"] = true
		LocalPlayer["state"]["Commands"] = true
		TriggerEvent("Notifyy","Sucesso","Teste iniciado, para finalizar saia do veículo.","verde",5000)

		Wait(1000)

		vehCreate(Data["name"])

		Wait(1000)

		SetPedIntoVehicle(Ped,vehDrive,-1)
		benDrive = true
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCREATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vehCreate(vehName)
	if LoadModel(vehName) then
		if Open == "Santos" then
			vehDrive = CreateVehicle(vehName,-53.28,-1110.93,26.47,68.04,false,false)
		elseif Open == "Sandy" then
			vehDrive = CreateVehicle(vehName,1209.74,2713.49,37.81,175.75,false,false)
		end

		SetModelAsNoLongerNeeded(vehName)
		SetEntityInvincible(vehDrive,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if benDrive then
			TimeDistance = 1
			DisableControlAction(1,69,false)

			local Ped = PlayerPedId()
			if not IsPedInAnyVehicle(Ped) then
				Wait(1000)

				benDrive = false
				vSERVER.removeDrive()
				LocalPlayer["state"]["Race"] = false
				LocalPlayer["state"]["Commands"] = false
				SetEntityCoords(Ped,benCoords[1],benCoords[2],benCoords[3],false,false,false,false)
				
				if DoesEntityExist(vehDrive) then
					DeleteEntity(vehDrive)
				end
			end
		end

		Wait(TimeDistance)
	end
end)