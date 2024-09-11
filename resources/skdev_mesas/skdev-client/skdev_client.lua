local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")
local vSERVER = Tunnel.getInterface("skdev_mesas")

skdev = {}
Tunnel.bindInterface("skdev_mesas",skdev)

local placingTable = false
local tableObject = nil
local npcBuyDrugs = nil
local bagsOld = 0
local newBags = 0
local tablePositions = {}
local tableCreateds = {}

function skdev.initTablePosition()
    if not placingTable then
        TriggerEvent("skdev:tableInitSettings")
        placingTable = true
    end
end

RegisterNetEvent("skdev:tableInitSettings")
AddEventHandler("skdev:tableInitSettings", function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)

    local tableHash = `prop_table_03`
    if not HasModelLoaded(tableHash) then
        RequestModel(tableHash)
        while not HasModelLoaded(tableHash) do
            Citizen.Wait(1)
        end
    end

    tableObject = CreateObject(tableHash, pedCoords.x, pedCoords.y, pedCoords.z, false, true, true)
    PlaceObjectOnGroundProperly(tableObject)
    FreezeEntityPosition(tableObject, true)

    buttons = setupScaleform("instructional_buttons")

    local sk_loop = true
    disableActions = true
    while sk_loop do
        Wait(5)

        DrawScaleformMovieFullscreen(buttons)

        local hit, coords = GetMouseHitCoords()
        if hit then
            SetEntityCoords(tableObject, coords.x, coords.y, coords.z, false, false, false, true)
            PlaceObjectOnGroundProperly(tableObject)
        end

        if IsControlJustPressed(0, 191) then
            local coordsTable = GetEntityCoords(tableObject)
            local rotateTable = GetEntityHeading(tableObject)
            DeleteEntity(tableObject)
            sk_loop = false
            placingTable = false
            buttons = nil
            tableObject = nil
            disableActions = false

            local x,y,z = coordsTable["x"],coordsTable["y"],coordsTable["z"]
            _,z = GetGroundZFor_3dCoord(x, y, z, unk)
            vSERVER.createTableDrugs(vector3(x,y,z),rotateTable)
        end

        if IsControlJustPressed(0, 45) then
            local heading = GetEntityHeading(tableObject)
            SetEntityHeading(tableObject, heading + 15)
        end

        if IsControlJustPressed(0, 177) then
            DeleteEntity(tableObject)
            sk_loop = false
            placingTable = false
            buttons = nil
            tableObject = nil
            disableActions = false
        end

        DisableControlAction(0,21,true)
        DisableControlAction(0,24,true)
        DisableControlAction(0,25,true)
        DisableControlAction(0,47,true)
        DisableControlAction(0,58,true)
        DisableControlAction(0,263,true)
        DisableControlAction(0,264,true)
        DisableControlAction(0,257,true)
        DisableControlAction(0,140,true)
        DisableControlAction(0,141,true)
        DisableControlAction(0,142,true)
        DisableControlAction(0,143,true)
        DisableControlAction(0,75,true)
        DisableControlAction(27,75,true)
    end
end)

function spawnBagsOnTable(x, y, z, heading, bags)
    bagsOld = bags

    if bags >= 1 then
        local bagHash = `prop_paper_bag_small`
        local objects = GetGamePool("CObject")
        for _, object in ipairs(objects) do
            if GetEntityModel(object) == bagHash then
                DeleteEntity(object)
            end
        end

        if not HasModelLoaded(bagHash) then
            RequestModel(bagHash)
            while not HasModelLoaded(bagHash) do
                Citizen.Wait(1)
            end
        end

        if bags >= 30 then
            bags = 30
        end

        local bagsPerRow = 6
        local bagCount = bags
        local offsetX = 0.2
        local offsetY = 0.2

        for i = 0, (bagCount - 1) do
            local row = math.floor(i / bagsPerRow)
            local col = i % bagsPerRow

            local relativeX = (col * offsetX) - ((bagsPerRow / 2) * offsetX) + (offsetX / 2)
            local relativeY = (row * offsetY) - ((math.ceil(bagCount / bagsPerRow) / 2) * offsetY) + (offsetY / 2)

            local angle = math.rad(heading)
            local bagX = x + relativeX * math.cos(angle) - relativeY * math.sin(angle)
            local bagY = y + relativeX * math.sin(angle) + relativeY * math.cos(angle)
            local bagZ = z

            local bag = CreateObject(bagHash, bagX, bagY, bagZ + 0.8, false, false, false)
            SetEntityHeading(bag, heading)
            SetEntityRotation(bag, 90.0, 0.0, heading, 2, true)
            FreezeEntityPosition(bag, true)
        end
    else
        local bagHash = `prop_paper_bag_small`
        local objects = GetGamePool("CObject")
        for _, object in ipairs(objects) do
            if GetEntityModel(object) == bagHash then
                DeleteEntity(object)
            end
        end
    end
end

function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(1)
    end
end

function GetMouseHitCoords()
    local camCoords = GetGameplayCamCoord()
    local camRot = GetGameplayCamRot(2)
    local forwardVector = RotAnglesToVec(camRot)
    local farCoords = vec(camCoords.x + forwardVector.x * 1000, camCoords.y + forwardVector.y * 1000, camCoords.z + forwardVector.z * 1000)
    local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, farCoords.x, farCoords.y, farCoords.z, 1, -1, 0)
    local _, hit, endCoords, _, _ = GetShapeTestResult(rayHandle)
    return hit, endCoords
end

function RotAnglesToVec(rot)
    local z = math.rad(rot.z)
    local x = math.rad(rot.x)
    local num = math.abs(math.cos(x))
    return vec(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

function isTableAtCoords(x, y, z)
    local tableHash = `prop_table_03`
    local objects = GetGamePool("CObject")
    for _, object in ipairs(objects) do
        if GetEntityModel(object) == tableHash then
            local objCoords = GetEntityCoords(object)
            if #(objCoords - vector3(x, y, z)) <= 4.0 then
                return true
            end
        end
    end
    return false
end

function createTableInCoords(x,y,z,head)
    if not isTableAtCoords(x,y,z) then
        local tableHash = `prop_table_03`
        if not HasModelLoaded(tableHash) then
            RequestModel(tableHash)
            while not HasModelLoaded(tableHash) do
                Citizen.Wait(1)
            end
        end
    
        tableObject = CreateObject(tableHash, x, y, z, false, false, false)
        PlaceObjectOnGroundProperly(tableObject)
        FreezeEntityPosition(tableObject, true)
        SetEntityHeading(tableObject, head)
    end
end

function deleteAllTables()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    ClearAreaOfObjects(coords["x"],coords["y"],coords["z"],20.0)

    local tableHash = `prop_table_03`
    local objects = GetGamePool("CObject")
    for _, object in ipairs(objects) do
        if GetEntityModel(object) == tableHash then
            if DoesEntityExist(object) then
                DeleteObject(object)
                Citizen.Wait(1)
            end
        end
    end
end

function skdev.replaceTables(newTable)
    deleteAllTables()
    tablePositions = newTable
end

Citizen.CreateThread(function()
    deleteAllTables()
    while true do
        local skotimizar = 1000

        for objID,coord in pairs(tablePositions) do
            local x,y,z = coord[1]["x"],coord[1]["y"],coord[1]["z"]
            local _,zt = GetGroundZFor_3dCoord(x, y, z)
            local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(PlayerPedId())), x, y, z,false)
            local heading = coord[2]
            if distance <= 15.0 then
                skotimizar = 5
                DrawText3D(x,y,zt + 1.0, "APERTE ~r~[E]~w~ PARA AVALIAR A MESA\nAPERTE ~r~[R]~w~ PARA DESMONTAR A MESA!")
                if not isTableAtCoords(x,y,z) then
                    createTableInCoords(x,y,z,heading)
                end
                if distance <= 4.0 and IsControlJustPressed(0, 38) then
                    local status,drugs,money,amountDrugs = vSERVER.verifyTable(objID)
                    if status then
                        SendNUIMessage({show = true, drugs = drugs, money = money})
                        SetNuiFocus(true,true)
                    end
                end
                if distance <= 4.0 and (IsControlJustPressed(0, 263) or IsControlJustPressed(0, 45) or IsControlJustPressed(0, 80) or IsControlJustPressed(0, 140) or IsControlJustPressed(0, 250) or IsControlJustPressed(0, 263) or IsControlJustPressed(0, 310) or IsControlJustPressed(0, 45) or IsControlJustPressed(0, 45)) then
                    if vSERVER.RemoveTable(objID) then
                        deleteAllTables()

                        local bagHash = `prop_paper_bag_small`
                        local objects = GetGamePool("CObject")
                        for _,object in ipairs(objects) do
                            if GetEntityModel(object) == bagHash then
                                DeleteEntity(object)
                            end
                        end

                        bagsOld = 0
                        newBags = 0
                    end
                end
                if newBags >= 0 and (bagsOld == 0 or bagsOld ~= newBags) then
                    spawnBagsOnTable(x, y, z, heading, newBags)
                end
            end
        end

        Citizen.Wait(skotimizar)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(20000)

        for objID,coord in pairs(tablePositions) do
            local x,y,z = coord[1]["x"],coord[1]["y"],coord[1]["z"]
            local _,zt = GetGroundZFor_3dCoord(x, y, z)
            local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(PlayerPedId())), x, y, z,false)
            if distance <= 15.0 then
                if npcBuyDrugs == nil then
                    if vSERVER.HaveDrugsInTheTable(objID) then
                        local player = PlayerPedId()
                        TriggerEvent("skdev:SpawnNPCNearPlayer",player,x,y,z,objID)
                    end
                    local status,drugs,money,amountDrugs = vSERVER.verifyTable(objID)
                    if status then
                        newBags = amountDrugs
                    end
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0225, 0.017+ factor, 0.05, 0, 0, 0, 75)
end

RegisterNUICallback("close", function(data,cb)
    SetNuiFocus(false,false)
end)

RegisterNUICallback("putDrug", function(data,cb)
    for objID,coord in pairs(tablePositions) do
        local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(PlayerPedId())), coord[1]["x"], coord[1]["y"], coord[1]["z"],false)
        if distance <= 15.0 then
            vSERVER.putDrug(data.drug,objID)
        end
    end
end)

RegisterNUICallback("remDrug", function(data,cb)
    for objID,coord in pairs(tablePositions) do
        local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(PlayerPedId())), coord[1]["x"], coord[1]["y"], coord[1]["z"],false)
        if distance <= 15.0 then
            vSERVER.remDrug(data.drug,objID)
        end
    end
end)

RegisterNUICallback("withdrawMoney", function(data,cb)
    for objID,coord in pairs(tablePositions) do
        local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(PlayerPedId())), coord[1]["x"], coord[1]["y"], coord[1]["z"],false)
        if distance <= 15.0 then
            vSERVER.withdrawMoney(objID)
        end
    end
end)

function getSafeSpawnPosition(player)
    local playerPos = GetEntityCoords(player)
    local found = false
    local spawnPos = vector3(0, 0, 0)
    while not found do
        local offsetX = math.random(-10, 10)
        local offsetY = math.random(-10, 10)
        spawnPos = vector3(playerPos.x + offsetX, playerPos.y + offsetY, playerPos.z)
        if IsPositionOnSidewalk(spawnPos) and not IsPositionInWall(spawnPos) and not IsEntityOnScreenSearch(spawnPos) then
            found = true
        end
        Wait(5)
    end
    return spawnPos
end

function IsPositionOnSidewalk(position)
    local hash = GetStreetNameAtCoord(position.x, position.y, position.z)
    return hash ~= 0
end

function IsPositionInWall(position)
    local rayHandle = StartShapeTestRay(position.x, position.y, position.z + 1.0, position.x, position.y, position.z - 1.0, 1, nil, 0)
    local _, hit, _, _, _ = GetShapeTestResult(rayHandle)
    return hit == 1
end

function IsEntityOnScreenSearch(position)
    local handle = CreateFakeEntity()
    SetEntityCoords(handle, position.x, position.y, position.z)
    local isOnScreen = IsEntityOnScreen(handle)
    DeleteEntity(handle)
    return isOnScreen
end

function CreateFakeEntity()
    local model = GetHashKey("p_amb_coffeecup_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local entity = CreateObject(model, 0.0, 0.0, 0.0, false, false, false)
    SetEntityVisible(entity, false, false)
    return entity
end

RegisterNetEvent("skdev:SpawnNPCNearPlayer")
AddEventHandler("skdev:SpawnNPCNearPlayer", function(player, x, y, z, objID)
    if npcBuyDrugs == nil then
        local npcList = {`a_m_m_bevhills_02`, `a_m_m_og_boss_01`, `a_m_m_hillbilly_02`, `a_m_m_salton_02`, `a_m_m_salton_03`, `a_m_m_soucent_01`, `a_m_m_soucent_03`, `a_m_m_tramp_01`, `a_m_y_beachvesp_02`}
        local npcRandom = math.random(1, #npcList)
        if npcList[npcRandom] then
            local spawnPos = getSafeSpawnPosition(player)
            RequestModel(npcList[npcRandom])
            while not HasModelLoaded(npcList[npcRandom]) do
                Citizen.Wait(1)
            end

            npcBuyDrugs = CreatePed(26, npcList[npcRandom], spawnPos.x, spawnPos.y, spawnPos.z, 0.0, false, false)
            SetPedConfigFlag(npcBuyDrugs, 17, true)
            TaskGoToCoordAnyMeans(npcBuyDrugs, x, y, z, 1.0)

            local attempts = 0
            local npcStop = true
            while npcStop do
                attempts = attempts + 1

                local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(npcBuyDrugs)), x, y, z, false)

                if distance <= 2 then
                    TaskTurnPedToFaceCoord(npcBuyDrugs, x, y, z, 1000)

                    local animDict = "amb@prop_human_parking_meter@female@idle_a"
                    RequestAnimDict(animDict)
                    while not HasAnimDictLoaded(animDict) do
                        Citizen.Wait(1)
                    end

                    TaskPlayAnim(npcBuyDrugs, animDict, "idle_a_female", 8.0, -8.0, -1, 49, 0, false, false, false)
                    Citizen.Wait(3000)
                    ClearPedTasksImmediately(npcBuyDrugs)

                    vSERVER.SellOneOfThese(objID)
                    local status, drugs, money, amountDrugs = vSERVER.verifyTable(objID)
                    if status then
                        newBags = amountDrugs
                    end

                    TaskSmartFleeCoord(npcBuyDrugs, x, y, z, 100.0, -1, false, false)
                    SetPedAsNoLongerNeeded(npcBuyDrugs)
                    npcBuyDrugs = nil
                    npcStop = false
                end

                if attempts >= 90 then
                    npcStop = false
                    ClearPedTasksImmediately(npcBuyDrugs)
                    TaskSmartFleeCoord(npcBuyDrugs, x, y, z, 100.0, -1, false, false)
                end

                Wait(1000)
            end
        end
    end
end)

function skdev.addBlip(x,y,z,idtype,idcolor,text,scale,route)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip,idtype)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,idcolor)
	SetBlipScale(blip,scale)
	if route then
		SetBlipRoute(blip,true)
	end
	if text then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(text)
		EndTextCommandSetBlipName(blip)
	end
	return blip
end

function skdev.removeBlip(id)
	RemoveBlip(id)
end

function skdev.playSound(dict,name)
	PlaySoundFrontend(-1,dict,name,false)
end

function skdev.getPosition()
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
	return x,y,z
end

function skdev.requestDrugs()
    for objID,coord in pairs(tablePositions) do
        local x,y,z = coord[1]["x"],coord[1]["y"],coord[1]["z"]
        local _,zt = GetGroundZFor_3dCoord(x, y, z)
        local distance = GetDistanceBetweenCoords(vector3(GetEntityCoords(PlayerPedId())), x, y, z,false)
        local heading = coord[2]
        if distance <= 15.0 then
            local status, drugs, money, amountDrugs = vSERVER.verifyTable(objID)
            if status then
                newBags = amountDrugs
            end
            if newBags >= 0 and (bagsOld == 0 or bagsOld ~= newBags) then
                spawnBagsOnTable(x, y, z, heading, newBags)
            end
        end
    end
end