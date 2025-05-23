-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("luckywheel",Creative)
vSERVER = Tunnel.getInterface("luckywheel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Wheel = nil
local Vehicle = nil
local Active = false
LocalPlayer["state"]["Cassino"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Active()
	if LocalPlayer["state"]["Cassino"] then
		Active = true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCASSINO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			local Coords = GetEntityCoords(Ped)
			local Distance = #(Coords - vec3(976.38,50.67,74.68))
			if Distance <= 100 then
				if not LocalPlayer["state"]["Cassino"] then
					LocalPlayer["state"]["Cassino"] = true

					if LoadModel("S15ONEPIECEDM") and LoadModel("vw_prop_vw_luckywheel_02a") then
						Wheel = CreateObjectNoOffset("vw_prop_vw_luckywheel_02a",977.69,49.82,75.00,false,false,false)
						SetEntityHeading(Wheel,120)

						Vehicle = CreateVehicle("S15ONEPIECEDM",963.57,47.13,75.13,119.06,false,false)
						SetVehicleNumberPlateText(Vehicle,"PDMSPORT")
						SetVehicleOnGroundProperly(Vehicle)
						FreezeEntityPosition(Vehicle,true)
						SetEntityInvincible(Vehicle,true)
						SetVehicleDoorsLocked(Vehicle,2)
						SetVehicleColours(Vehicle,0,1)

						SetModelAsNoLongerNeeded("vw_prop_vw_luckywheel_02a")
						SetModelAsNoLongerNeeded("S15ONEPIECEDM")
					end
				end
			else
				if LocalPlayer["state"]["Cassino"] then
					LocalPlayer["state"]["Cassino"] = false

					if DoesEntityExist(Vehicle) then
						DeleteEntity(Vehicle)
					end

					if DoesEntityExist(Wheel) then
						DeleteEntity(Wheel)
					end

					Vehicle = nil
					Wheel = nil
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- START
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Start(Result)
	if Result ~= nil then
		if LocalPlayer["state"]["Cassino"] then
			if DoesEntityExist(Wheel) then
				SetEntityRotation(Wheel,0.0,0.0,0.0,2,true)
			end

			CreateThread(function()
				local rollingRatio = 1
				local rollingSpeed = 1.0
				local rollingAngle = (Result - 1) * 18
				local wheelAngles = rollingAngle + (360 * 8)
				local middleResult = (wheelAngles / 2)

				while rollingRatio > 0 do
					local xRot = GetEntityRotation(Wheel,2)
					if wheelAngles > middleResult then
						rollingRatio = rollingRatio + 1
					else
						rollingRatio = rollingRatio - 1

						if rollingRatio <= 0 then
							rollingRatio = 0

							if Active then
								vSERVER.Payment()
								Active = false
							end
						end
					end

					rollingSpeed = rollingRatio / 200
					local yRot = xRot["y"] - rollingSpeed
					wheelAngles = wheelAngles - rollingSpeed
					SetEntityRotation(Wheel,0.0,yRot,328.16,2,true)

					Wait(0)
				end
			end)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGETROLL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("luckywheel:Target")
AddEventHandler("luckywheel:Target",function()
	if LocalPlayer["state"]["Cassino"] then
		if vSERVER.Check() then
			vSERVER.Rolling()
		end
	end
end)