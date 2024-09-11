local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
vRP = Proxy.getInterface("vRP")
vRPS = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Street = {}
Tunnel.bindInterface("hud", Street)
vSERVER = Tunnel.getInterface("hud")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local showHud = false
local clientStress = 0
local showMovie = false
local radioDisplay = ""
local pauseBreak = false
local homeInterior = false
local flexDirection = "Norte"
local showHood = false
local showBlips = {}
local timeBlips = {}
local numberBlips = 0
local Mask = nil
local Tank = nil
local clientHunger = 100
local clientThirst = 100
local updateFoods = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Mask = nil
local Tank = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEATBELT
-----------------------------------------------------------------------------------------------------------------------------------------
local SeatbeltSpeed = 0
local SeatbeltLock = false
local SeatbeltVelocity = vec3(0,0,0)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIVINABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local clientOxigen = 100
local divingTimers = GetGameTimer()
local timeDate = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADAR
-----------------------------------------------------------------------------------------------------------------------------------------
local policeRadar = false
local policeFreeze = false
local policeService = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Mumble = false
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- MUMBLECONNECTED
-- -----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleConnected", function()
    if not Mumble then
        SendNUIMessage({ mumble = false })
        Mumble = true
    end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- MUMBLEDISCONNECTED
-- -----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleDisconnected", function()
    if Mumble then
        SendNUIMessage({ mumble = true })
        Mumble = false
    end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HUD:VOIP
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Voip")
AddEventHandler("hud:Voip", function(number)
    local Number = tonumber(number)
    local voiceTarget = { "Baixo", "Médio", "Alto", "Muito Alto" }
    EmitNuiMessage("HUD:VOICE", { voice = voiceTarget[Number] })
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- THREADGLOBAL
-- -----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        if LocalPlayer["state"]["Active"] and not LocalPlayer.state.Farming then
            if Mask ~= nil then
                if GetGameTimer() >= divingTimers then
                    divingTimers = GetGameTimer() + 35000
                    clientOxigen = clientOxigen - 1
                    -- vRPS.clientOxigen()
                    if clientOxigen <= 0 then
                        ApplyDamageToPed(ply, 50, false)
                    end
                end
            end
        end
        Wait(5000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Progress")
AddEventHandler("Progress", function(progressTimer, Timer)
    EmitNuiMessage("HUD:PROGRESS", { timer = Timer / 1000 })
end)

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- THREADHUD
-- -----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        if LocalPlayer["state"]["Active"] and not LocalPlayer.state.Farming then
            if GetGameTimer() >= updateFoods and GetEntityHealth(PlayerPedId()) > 101 then
                updateFoods = GetGameTimer() + 45000
                clientThirst = clientThirst - 1
                clientHunger = clientHunger - 1
                if clientHunger <= 10 or clientThirst <= 10 then
                    ApplyDamageToPed(PlayerPedId(), 10, false)
                end
            end
        end
        Wait(30000)
    end
end)

RegisterNetEvent("hud:Hunger")
AddEventHandler("hud:Hunger", function(Number)
    clientHunger = parseInt(Number)
    if clientHunger >= 100 then
        clientHunger = 100
    end
end)

RegisterNetEvent("hud:Thirst")
AddEventHandler("hud:Thirst", function(Number)
    clientThirst = parseInt(Number)
    if clientThirst >= 100 then
        clientThirst = 100
    end
end)


RegisterNetEvent("hud:Stress")
AddEventHandler("hud:Stress", function(Number)
    clientStress = parseInt(Number)
end)

CreateThread(function()
    while true do
        local ply = PlayerPedId()
        local timeSleep = 5000
        if LocalPlayer["state"]["Active"]  then
            timeSleep = 500
            if IsPauseMenuActive() then
                EmitNuiMessage("HUD:SHOW", { show = false })
                pauseBreak = true
            else
                if pauseBreak and showHud then
                    EmitNuiMessage("HUD:SHOW", { show = true })
                    pauseBreak = false
                end
            end
            if showHud then
                local armour = GetPedArmour(ply)
                local coords = GetEntityCoords(ply)
                local heading = GetEntityHeading(ply)
                local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords["x"], coords["y"], coords["z"]))
                if heading >= 315 or heading < 45 then
                    flexDirection = "Norte"
                elseif heading >= 45 and heading < 135 then
                    flexDirection = "Oeste"
                elseif heading >= 135 and heading < 225 then
                    flexDirection = "Sul"
                elseif heading >= 225 and heading < 315 then
                    flexDirection = "Leste"
                end

                EmitNuiMessage("HUD:PLAYER_STATS", {
                    isTalking = MumbleIsPlayerTalking(128),
                    health = GetEntityHealth(ply) - 100,
                    armour = armour,
                    hunger = clientHunger,
                    thirst = clientThirst,
                    stress = clientStress,
                    oxigen = clientOxigen,
                    street = streetName,
                    direction = flexDirection,
                    radioMhz = radioDisplay,
                })
                SetInfos()
            end
        end
        Wait(timeSleep)
    end
end)

function SetInfos()
    local ply = PlayerPedId()
    if IsPedArmed(ply, 7) then
        local weaponModel = exports.inventory:Weapons()
        local weaponHash = GetSelectedPedWeapon(ply)
        local weaponAmmo = GetAmmoInPedWeapon(ply, weaponHash)
        local _, ammoInClip = GetAmmoInClip(ply, weaponHash)
        local isPedUsingMeleeWeapon = IsPedArmed(ply, 1)

        EmitNuiMessage("HUD:WEAPON", {
            weapon = {
                ammo = weaponAmmo - ammoInClip,
                ammoInClip = ammoInClip,
                name = itemName(weaponModel),
                model = itemIndex(weaponModel),
                isMelee = isPedUsingMeleeWeapon
            }
        })
    else
        EmitNuiMessage("HUD:WEAPON", { weapon = nil })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- -- THREADHUD VEHICLE
-- -----------------------------------------------------------------------------------------------------------------------------------------
local InVeh = false
local timeVehAwait = 1000
CreateThread(function()
    LoadPtfxAsset("veh_xs_vehicle_mods")
    while true do
        timeVehAwait = 2500
        local ply = PlayerPedId()
        if LocalPlayer["state"]["Active"]  then
            if showHud then
                if IsPedInAnyVehicle(ply) then
                    if not IsMinimapRendering() then
                        DisplayRadar(true)
                    end
                    timeVehAwait = 25
                    local vehicle = GetVehiclePedIsUsing(ply)
                    --local vehModel = GetEntityModel(vehicle)
                    local fuel = GetVehicleFuelLevel(vehicle)
                    local speed = GetEntitySpeed(vehicle) * 3.6
                    --local plate = GetVehicleNumberPlateText(vehicle)
                    local vehClass = GetVehicleClass(vehicle)
                    local showBelt = true
                    if vehClass == 8 or (vehClass >= 13 and vehClass <= 16) or vehClass == 21 then
                        showBelt = false
                    end
                    local nitroShow = 0
                    if not InVeh then
                        InVeh = true
                        EmitNuiMessage("HUD:INVEH", { inVeh = InVeh })
                    end

                    if NitroFlame then
                        NitroDisable()
                    end

                    if LocalPlayer["state"]["Nitro"] then
                        Nitro = NitroFuel
                    else
                        if (GlobalState["Nitro"][Plate] or 0) ~= Nitro then
                            Nitro = GlobalState["Nitro"][Plate] or 0
                        end
                    end


                    EmitNuiMessage("HUD:VEH_STATS", {
                        isTalking = MumbleIsPlayerTalking(128),
                        lowEngine = GetVehicleEngineHealth(vehicle) > 500,
                        carLocked = GetVehicleDoorLockStatus(vehicle) == 2,
                        speed = parseInt(speed),
                        rpm = IsVehicleEngineOn(vehicle) and parseInt(GetVehicleCurrentRpm(vehicle) * 100) or 0,
                        showBelt = showBelt,
                        seatBelt = SeatbeltLock,
                        nitro = nitroShow > 0 and parseInt((nitroShow * 100) / 1000) or 0,
                        fuel = parseInt(fuel),
                        inVeh = true
                    })
                    SetInfos()
                else
                    if InVeh then
                        InVeh = false
                        EmitNuiMessage("HUD:INVEH", { inVeh = InVeh })
                    end
                end
            end
        end
        Wait(timeVehAwait)
    end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HUD
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hud", function(source, args)
    showHud = not showHud

    if showHud then
        TriggerEvent("PrimaryHud:disable")
    end

    EmitNuiMessage("HUD:SHOW", { show = showHud })
    if IsMinimapRendering() and not showHud then
        DisplayRadar(false)
    end
end, false)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HUD:TOGGLEHOOD
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:toggleHood")
AddEventHandler("hud:toggleHood", function()
    showHood = not showHood
    if showHood then
        SetPedComponentVariation(ply, 1, 69, 0, 1)
    else
        SetPedComponentVariation(ply, 1, 0, 0, 1)
    end
    SendNUIMessage({ hood = showHood })
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HUDACTIVE
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("SecondaryHud:enable", function()
    showHud = true
    DisplayRadar(true)
    EmitNuiMessage("HUD:SHOW", { show = showHud })
end)

RegisterNetEvent("SecondaryHud:disable", function()
    showHud = false
    DisplayRadar(false)

    EmitNuiMessage("HUD:SHOW", { show = showHud })
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HUD:RADIODISPLAY
-- -----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Radio")
AddEventHandler("hud:Radio", function(Frequency)
    if parseInt(Frequency) <= 0 then
        radioDisplay = ""
    else
        radioDisplay = parseInt(Frequency)
    end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- FOWARDPED
-- -----------------------------------------------------------------------------------------------------------------------------------------
function fowardPed(ped)
    local heading = GetEntityHeading(ped) + 90.0
    if heading < 0.0 then
        heading = 360.0 + heading
    end
    heading = heading * 0.0174533
    return { x = math.cos(heading) * 2.0, y = math.sin(heading) * 2.0 }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBELT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if LocalPlayer["state"]["Active"] then
			local Ped = PlayerPedId()
			if IsPedInAnyVehicle(Ped) then
				if not IsPedOnAnyBike(Ped) and not IsPedInAnyHeli(Ped) and not IsPedInAnyPlane(Ped) then
					TimeDistance = 1

					local Vehicle = GetVehiclePedIsUsing(Ped)
					local Speed = GetEntitySpeed(Vehicle) * 3.6
					if SeatbeltLock then
						DisableControlAction(1,75,true)
					end

					if Speed ~= SeatbeltSpeed then
						if (SeatbeltSpeed - Speed) >= 60 and not SeatbeltLock then
							SmashVehicleWindow(Vehicle,6)
							SetEntityNoCollisionEntity(Ped,Vehicle,false)
							SetEntityNoCollisionEntity(Vehicle,Ped,false)
							TriggerServerEvent("hud:VehicleEject",SeatbeltVelocity)

							Wait(500)

							SetEntityNoCollisionEntity(Ped,Vehicle,true)
							SetEntityNoCollisionEntity(Vehicle,Ped,true)
						end

						SeatbeltVelocity = GetEntityVelocity(Vehicle)
						SeatbeltSpeed = Speed
					end
				end
			else
				if SeatbeltSpeed ~= 0 then
					SeatbeltSpeed = 0
				end

				if SeatbeltLock then
					SendNUIMessage({ Action = "Seatbelt", Status = false })
					SeatbeltLock = false
				end

				if NitroFlame then
					NitroDisable()
				end
			end
		end

		Wait(timeDistance)
	end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- SEATBELT
-- -----------------------------------------------------------------------------------------------------------------------------------------

AddEventHandler("hud:seatbelt", function(state)
        if not IsPedInAnyVehicle(ply, false) or IsPedOnAnyBike(ply) then return end

        SeatbeltLock = state

        if SeatbeltLock then
            TriggerEvent("sounds:source", "belt", 0.5)
        else
            TriggerEvent("sounds:source", "unbelt", 0.5)

    end
end)

RegisterCommand("Beltz",function(source)
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		if not IsPedOnAnyBike(Ped) and not IsPedInAnyHeli(Ped) and not IsPedInAnyPlane(Ped) then
			if SeatbeltLock then
				TriggerEvent("sounds:Private","unbelt",0.5)
				SendNUIMessage({ Action = "Seatbelt", Status = false })
				SeatbeltLock = false
			else
				TriggerEvent("sounds:Private","belt",0.5)
				SendNUIMessage({ Action = "Seatbelt", Status = true })
				SeatbeltLock = true
			end
		end
	end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- KEYMAPPING
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterKeyMapping("seatbelt", "Colocar/Retirar o cinto.", "keyboard", "g")
RegisterKeyMapping("Beltz","Colocar/Retirar o cinto.","keyboard","G")
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:SCUBAREMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:ScubaRemove")
AddEventHandler("hud:ScubaRemove",function()
	if DoesEntityExist(Mask) then
		TriggerServerEvent("DeleteObject",ObjToNet(Mask))
		Mask = nil
	end

	if DoesEntityExist(Tank) then
		TriggerServerEvent("DeleteObject",ObjToNet(Tank))
		Tank = nil
	end

	SetEnableScuba(PlayerPedId(),false)
	SetPedMaxTimeUnderwater(PlayerPedId(),10.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:SCUBA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Scuba")
AddEventHandler("hud:Scuba",function()
	local ped = PlayerPedId()

	if DoesEntityExist(Mask) or DoesEntityExist(Tank) then
		if DoesEntityExist(Mask) then
			SendNUIMessage({ oxigen = Oxigen, oxigenShow = nil })
			TriggerServerEvent("DeleteObject",ObjToNet(Mask))
			Mask = nil
		end

		if DoesEntityExist(Tank) then
			TriggerServerEvent("DeleteObject",ObjToNet(Tank))
			Tank = nil
		end

		SetEnableScuba(ped,false)
		SetPedMaxTimeUnderwater(ped,10.0)
	else
		local coords = GetEntityCoords(ped)
		local myObject,objNet = vRPS.CreateObject("p_s_scuba_tank_s",coords["x"],coords["y"],coords["z"])
		if myObject then
			local spawnObjects = 0
			Tank = NetworkGetEntityFromNetworkId(objNet)
			while not DoesEntityExist(Tank) and spawnObjects <= 1000 do
				Tank = NetworkGetEntityFromNetworkId(objNet)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			spawnObjects = 0
			local objectControl = NetworkRequestControlOfEntity(Tank)
			while not objectControl and spawnObjects <= 1000 do
				objectControl = NetworkRequestControlOfEntity(Tank)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			AttachEntityToEntity(Tank,ped,GetPedBoneIndex(ped,24818),-0.28,-0.24,0.0,180.0,90.0,0.0,1,1,0,0,2,1)
	
			SetEntityAsNoLongerNeeded(Tank)
		end

		local myObject,objNet = vRPS.CreateObject("p_s_scuba_mask_s",coords["x"],coords["y"],coords["z"])
		if myObject then
			local spawnObjects = 0
			Mask = NetworkGetEntityFromNetworkId(objNet)
			while not DoesEntityExist(Mask) and spawnObjects <= 1000 do
				Mask = NetworkGetEntityFromNetworkId(objNet)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			spawnObjects = 0
			local objectControl = NetworkRequestControlOfEntity(Mask)
			while not objectControl and spawnObjects <= 1000 do
				objectControl = NetworkRequestControlOfEntity(Mask)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			AttachEntityToEntity(Mask,ped,GetPedBoneIndex(ped,12844),0.0,0.0,0.0,180.0,90.0,0.0,1,1,0,0,2,1)
	
			SetEntityAsNoLongerNeeded(Mask)
		end

		SetEnableScuba(ped,true)
		SetPedMaxTimeUnderwater(ped,2000.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetMinimapAnchor()
    -- Safezone goes from 1.0 (no gap) to 0.9 (5% gap (1/20))
    -- 0.05 * ((safezone - 0.9) * 10)
    local defaultAspectRatio = 1920 / 1080 -- Don't change this.
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapXOffset, minimapYOffset = 0, 0
    if aspectRatio > defaultAspectRatio then
        local aspectDifference = defaultAspectRatio - aspectRatio
        minimapXOffset = aspectDifference / 3.6
    end
    SetMinimapComponentPosition("minimap", "L", "B", -0.0045 + minimapXOffset, 0.002 + minimapYOffset, 0.150, 0.188888)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.020 + minimapXOffset, 0.030 + minimapYOffset, 0.111, 0.159)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.03 + minimapXOffset, 0.022 + minimapYOffset, 0.266, 0.237)
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()

    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    Minimap.res_x = res_x
    Minimap.res_y = res_y
    return Minimap
end

function updateMapPosition()
    local defaultAspectRatio = 1920 / 1080
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX / resolutionY
    local minimapXOffset, minimapYOffset = 0, 0
    if aspectRatio > defaultAspectRatio then
        local aspectDifference = defaultAspectRatio - aspectRatio
        minimapXOffset = aspectDifference / 3.6
    end
    DisplayRadar(true)
    DisplayRadar(false)
    RequestStreamedTextureDict("circleminimap", false)

    while not HasStreamedTextureDictLoaded("circleminimap") do
        Wait(500) -- mudei o wait de 100 para 500
    end

    SetMinimapClipType(1)
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circleminimap", "radarmasksm")
    SetMinimapComponentPosition("minimap", "L", "B", -0.0045 + minimapXOffset, 0.002 + minimapYOffset - 0.025, 0.150,
        0.188888)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.020 + minimapXOffset, 0.030 + minimapYOffset - 0.025,
        0.111,
        0.159)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.03 + minimapXOffset, 0.022 + minimapYOffset - 0.025,
        0.266,
        0.237)

    SetBigmapActive(true, false)
    Wait(50)
    SetBigmapActive(false, false)
    Wait(1000)
    DisplayRadar(false)
end

CreateThread(function()
    Wait(1000)
    while true do
        local timeSleep = 10000
        -- if LocalPlayer.state.Hud == "Street" then
            timeSleep = 5000
            local Minimap = GetMinimapAnchor()
            local anchor = {
                Street = {
                    Top = (Minimap.res_y * Minimap.top_y) - 55,
                    Left = (Minimap.res_x * Minimap.left_x)
                },
                Status = {
                    Top = (Minimap.res_y * Minimap.top_y),
                    Left = (Minimap.res_x * Minimap.right_x) + 20,
                    Height = (Minimap.height * 100) - 1.6, -- Percentage
                    Width = (Minimap.width * 100)
                }
            }

            EmitNuiMessage("HUD:BOUNDS", { anchor = anchor })
        -- end
        Wait(timeSleep)
    end
end)

function SendWeaponInfo()
    local ply = PlayerPedId()
    local weaponModel = exports.inventory:Weapons()
    local weaponHash = GetSelectedPedWeapon(ply)
    local weaponAmmo = GetAmmoInPedWeapon(ply, weaponHash)
    local _, ammoInClip = GetAmmoInClip(ply, weaponHash)
    local isPedUsingMeleeWeapon = IsPedArmed(ply, 1)
    EmitNuiMessage("HUD:WEAPON", {
        weapon = {
            ammo = weaponAmmo - ammoInClip,
            ammoInClip = ammoInClip,
            name = itemName(weaponModel),
            model = string.upper(weaponModel),
            isMelee = isPedUsingMeleeWeapon
        }
    })
end

-- local notifyId = 0
-- local notifyStyles = {
--     ["vermelho"] = { "error", "Ocorreu um erro!" },
--     ["negado"] = { "error", "Ocorreu um erro!" },
--     ["verde"] = { "success", "Sucesso!" },
--     ["azul"] = { "info", "Informação" },
--     ["amarelo"] = { "warn", "Informação" },
--     ["hunger"] = { "info", "Fome", "hunger" },
--     ["thirst"] = { "info", "Sede", "thirst" },
--     ["blood"] = { "error", "Sangramento!", "blood" },
-- }

-- RegisterNetEvent("Notify")
-- AddEventHandler("Notify", function(style, message, title, timer)
--     if LocalPlayer.state.Hud == "Street" then return end
--     if not timer then timer = 5000 end
--     notifyId = notifyId + 1
--     EmitNuiMessage("HUD:NOTIFY", {
--         notify = {
--             id = notifyId,
--             type = notifyStyles[style] and notifyStyles[style][1] or "info",
--             title = notifyStyles[style] and notifyStyles[style][2] or "Informação",
--             description = message,
--             duration = timer,
--             uniqueId = notifyStyles[style] and notifyStyles[style][3] or nil
--         }
--     })
-- end)

function EmitNuiMessage(type, payload)
    SendNUIMessage({
        type = type,
        payload = { payload } or {}
    })
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- RADAR
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local timeDistance = 999
        local ply = PlayerPedId()
        if IsPedInAnyPoliceVehicle(ply) and policeService  then
            if policeRadar then
                if not policeFreeze then
                    timeDistance = 100

                    local vehicle = GetVehiclePedIsUsing(ply)
                    local vehicleDimension = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 1.0, 1.0)

                    local vehicleFront = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 105.0, 0.0)
                    local vehicleFrontShape = StartShapeTestCapsule(vehicleDimension, vehicleFront, 3.0, 10, vehicle, 7)
                    local _, _, _, _, vehFront = GetShapeTestResult(vehicleFrontShape)

                    if IsEntityAVehicle(vehFront) then
                        local vehModel = GetEntityModel(vehFront)
                        local vehPlate = GetVehicleNumberPlateText(vehFront)
                        local vehSpeed = GetEntitySpeed(vehFront) * 3.6
                        local vehName = GetDisplayNameFromVehicleModel(vehModel)

                        EmitNuiMessage("HUD:SET_FRONT_RADAR",
                            { Plate = vehPlate, Model = vehName, Speed = math.floor(vehSpeed) })
                    end

                    local vehicleBack = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -105.0, 0.0)
                    local vehicleBackShape = StartShapeTestCapsule(vehicleDimension, vehicleBack, 3.0, 10, vehicle, 7)
                    local _, _, _, _, vehBack = GetShapeTestResult(vehicleBackShape)

                    if IsEntityAVehicle(vehBack) then
                        local vehModel = GetEntityModel(vehBack)
                        local vehPlate = GetVehicleNumberPlateText(vehBack)
                        local vehSpeed = GetEntitySpeed(vehBack) * 3.6
                        local vehName = GetDisplayNameFromVehicleModel(vehModel)

                        EmitNuiMessage("HUD:SET_BACK_RADAR",
                            { Plate = vehPlate, Model = vehName, Speed = math.floor(vehSpeed) })
                    end
                end
            end
        end

        if not IsPedInAnyVehicle(ply) and policeRadar then
            policeRadar = false
            EmitNuiMessage("HUD:SET_FRONT_RADAR", nil)
            EmitNuiMessage("HUD:SET_BACK_RADAR", nil)
        end

        Wait(timeDistance)
    end
end)

RegisterCommand("toggleRadar", function(source, args)
    if IsPedInAnyPoliceVehicle(ply) and policeService then
        if policeRadar then
            policeRadar = false

            EmitNuiMessage("HUD:SET_FRONT_RADAR", nil)
            EmitNuiMessage("HUD:SET_BACK_RADAR", nil)
        else
            policeRadar = true

            EmitNuiMessage("HUD:SET_FRONT_RADAR", { Plate = "--", Model = "Desconhecido", Speed = 0 })
            EmitNuiMessage("HUD:SET_BACK_RADAR", { Plate = "--", Model = "Desconhecido", Speed = 0 })
        end
    end
end, false)

RegisterCommand("toggleFreeze", function(source, args)
    if IsPedInAnyPoliceVehicle(ply) and policeService then
        policeFreeze = not policeFreeze
    end
end, false)

RegisterNetEvent("police:updateService", function(status)
    policeService = status
end)

RegisterKeyMapping("toggleRadar", "Ativar/Desativar radar das viaturas.", "keyboard", "N")
RegisterKeyMapping("toggleFreeze", "Travar/Destravar radar das viaturas.", "keyboard", "M")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Wanted", function()
    return false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Reposed", function()
    return false
end)

function LoadPtfxAsset(Library)
    RequestNamedPtfxAsset(Library)
    while not HasNamedPtfxAssetLoaded(Library) do
        RequestNamedPtfxAsset(Library)
        Wait(1)
    end

    return true
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOADTEXTURE
-----------------------------------------------------------------------------------------------------------------------------------------
function LoadTexture(Library)
    RequestStreamedTextureDict(Library, false)
    while not HasStreamedTextureDictLoaded(Library) do
        RequestStreamedTextureDict(Library, false)
        Wait(1)
    end

    return true
end


function LoadPtfxAsset(Library)
    RequestNamedPtfxAsset(Library)
    while not HasNamedPtfxAssetLoaded(Library) do
        RequestNamedPtfxAsset(Library)
        Wait(1)
    end

    return true
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Nitro = 0
local Tyres = 0
local Drift = false
local Locked = false
local Headbeams = false
local Headlights = false
local ActualVehicle = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITRO
-----------------------------------------------------------------------------------------------------------------------------------------
local NitroFuel = 0
local NitroFlame = false
local NitroButton = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIGHTTRAILS
-----------------------------------------------------------------------------------------------------------------------------------------
local LightTrails = {}
local LightParticles = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PURGESPRAYS
-----------------------------------------------------------------------------------------------------------------------------------------
local PurgeSprays = {}
local PurgeParticles = {}
local PurgeActive = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITROENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function NitroEnable()
    if GetGameTimer() >= NitroButton and not IsPauseMenuActive() then
        local Ped = PlayerPedId()
        if IsPedInAnyVehicle(Ped) then
            NitroButton = GetGameTimer() + 1000

            local Vehicle = GetVehiclePedIsUsing(Ped)
            if GetPedInVehicleSeat(Vehicle, -1) == Ped then
                if GetVehicleTopSpeedModifier(Vehicle) < 50.0 then
                    local Plate = GetVehicleNumberPlateText(Vehicle)
                    NitroFuel = GlobalState["Nitro"][Plate] or 0

                    if NitroFuel >= 1 then
                        if GetIsVehicleEngineRunning(Vehicle) then
                            local Speed = GetEntitySpeed(Vehicle) * 3.6
                            if Speed > 10 then
                                LocalPlayer["state"]["Nitro"] = true

                                while LocalPlayer["state"]["Nitro"] do
                                    if NitroFuel >= 1 then
                                        NitroFuel = NitroFuel - 1

                                        if not NitroFlame then
                                            SetVehicleRocketBoostActive(Vehicle, true)
                                            SetVehicleNitroEnabled(Vehicle, true)
                                            SetVehicleBoostActive(Vehicle, true)
                                            ModifyVehicleTopSpeed(Vehicle, 50.0)
                                            -- SetLightTrail(Vehicle, true)
                                            NitroFlame = Plate
                                        end
                                    else
                                        if NitroFlame then
                                            SetVehicleRocketBoostActive(Vehicle, false)
                                            vSERVER.UpdateNitro(NitroFlame, NitroFuel)
                                            SetVehicleNitroEnabled(Vehicle, false)
                                            SetVehicleBoostActive(Vehicle, false)
                                            ModifyVehicleTopSpeed(Vehicle, 0.0)
                                            -- SetLightTrail(Vehicle, false)
                                            NitroFlame = false

                                            LocalPlayer["state"]["Nitro"] = false
                                        end
                                    end

                                    Wait(1)
                                end
                            else
                                SetPurgeSprays(Vehicle, true)
                                PurgeActive = true
                            end
                        else
                            SetPurgeSprays(Vehicle, true)
                            PurgeActive = true
                        end
                    end
                end
            end
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- NITRODISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function NitroDisable()
    local Vehicle = GetLastDrivenVehicle()

    if NitroFlame then
        SetVehicleRocketBoostActive(Vehicle, false)
        vSERVER.UpdateNitro(NitroFlame, NitroFuel)
        SetVehicleNitroEnabled(Vehicle, false)
        SetVehicleBoostActive(Vehicle, false)
        ModifyVehicleTopSpeed(Vehicle, 0.0)
        -- SetLightTrail(Vehicle, false)
        NitroFlame = false

        LocalPlayer["state"]["Nitro"] = false
    end

    if PurgeActive then
        SetPurgeSprays(Vehicle, false)
        PurgeActive = false
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVENITRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("+activeNitro", NitroEnable)
RegisterCommand("-activeNitro", NitroDisable)
RegisterKeyMapping("+activeNitro", "Ativação do nitro.", "keyboard", "LMENU")
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETLIGHTTRAIL
-----------------------------------------------------------------------------------------------------------------------------------------
function SetLightTrail(Vehicle, Enable)
    if LightTrails[Vehicle] == Enable then
        return
    end

    if Enable then
        local Particles = {}
        local LeftTrail = CreateLightTrail(Vehicle, GetEntityBoneIndexByName(Vehicle, "taillight_l"))
        local RightTrail = CreateLightTrail(Vehicle, GetEntityBoneIndexByName(Vehicle, "taillight_r"))

        Particles[#Particles + 1] = LeftTrail
        Particles[#Particles + 1] = RightTrail

        LightTrails[Vehicle] = true
        LightParticles[Vehicle] = Particles
    else
        if LightParticles[Vehicle] and #LightParticles[Vehicle] > 0 then
            for _, v in ipairs(LightParticles[Vehicle]) do
                StopLightTrail(v)
            end
        end

        LightTrails[Vehicle] = nil
        LightParticles[Vehicle] = nil
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATELIGHTTRAIL
-----------------------------------------------------------------------------------------------------------------------------------------
function CreateLightTrail(Vehicle, Bone)
    UseParticleFxAssetNextCall("core")
    local Particle = StartParticleFxLoopedOnEntityBone("veh_light_red_trail", Vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Bone,
        1.0, false, false, false)
    SetParticleFxLoopedEvolution(Particle, "speed", 1.0, false)

    return Particle
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPLIGHTTRAIL
-----------------------------------------------------------------------------------------------------------------------------------------
function StopLightTrail(Particle)
    CreateThread(function()
        local endTime = GetGameTimer() + 500
        while GetGameTimer() < endTime do
            Wait(0)
            local now = GetGameTimer()
            local Scale = (endTime - now) / 500
            SetParticleFxLoopedScale(Particle, Scale)
            SetParticleFxLoopedAlpha(Particle, Scale)
        end

        StopParticleFxLooped(Particle)
    end)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPURGESPRAYS
-----------------------------------------------------------------------------------------------------------------------------------------
function SetPurgeSprays(Vehicle, Enable)
    if PurgeSprays[Vehicle] == Enable then
        return
    end

    if Enable then
        local Particles = {}
        local Bone = GetEntityBoneIndexByName(Vehicle, "bonnet")
        local Position = GetWorldPositionOfEntityBone(Vehicle, Bone)
        local Offset = GetOffsetFromEntityGivenWorldCoords(Vehicle, Position["x"], Position["y"], Position["z"])

        for i = 0, 3 do
            local LeftPurge = CreatePurgeSprays(Vehicle, Offset["x"] - 0.5, Offset["y"] + 0.05, Offset["z"], 40.0, -20.0,
                0.0, 0.5)
            local RightPurge = CreatePurgeSprays(Vehicle, Offset["x"] + 0.5, Offset["y"] + 0.05, Offset["z"], 40.0, 20.0,
                0.0, 0.5)

            Particles[#Particles + 1] = LeftPurge
            Particles[#Particles + 1] = RightPurge
        end

        PurgeSprays[Vehicle] = true
        PurgeParticles[Vehicle] = Particles
    else
        if PurgeParticles[Vehicle] then
            RemoveParticleFxFromEntity(Vehicle)
        end

        PurgeSprays[Vehicle] = nil
        PurgeParticles[Vehicle] = nil
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEPURGESPRAYS
-----------------------------------------------------------------------------------------------------------------------------------------
function CreatePurgeSprays(Vehicle, xOffset, yOffset, zOffset, xRot, yRot)
    UseParticleFxAssetNextCall("core")
    return StartParticleFxNonLoopedOnEntity("ent_sht_steam", Vehicle, xOffset, yOffset, zOffset, xRot, yRot, 0.0,
        0.5, false, false, false)
end