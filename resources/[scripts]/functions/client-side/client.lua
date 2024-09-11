local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

local Tunnel = module("vrp","lib/Tunnel")
vRPS = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("dynamic", cRP)
vSERVER = Tunnel.getInterface("dynamic")
vINVENTORY = Tunnel.getInterface("inventory")

function _RNE(event, ...)
	RegisterNetEvent(event)
	AddEventHandler(event, ...)

	print(event)
end

function _TRE(event, ...)
	TriggerEvent(event, ...)

	print(event)
end

local isDisplayingMenu = false

local policeService = false
local paramedicService = false

local animalHahs
local animalFollow = false

local function getMenuItems(menuItems)
	if not menuItems then return end
	local ply = PlayerPedId()

	local availableItems = {}

	for _, menuItem in ipairs(menuItems) do
		if not menuItem.enableMenu or menuItem.enableMenu(ply) then
			availableItems[#availableItems + 1] = {
				id = menuItem.id,
				title = menuItem.title,
				icon = menuItem.icon,
				items = getMenuItems(menuItem.items),
			}
		end
	end

	return availableItems
end

local function getAvailableMenus()
	local availableMenus = {}
	local ply = PlayerPedId()

	for _, menuOption in ipairs(MenuOptions) do
		if not menuOption.enableMenu or menuOption.enableMenu(ply) then
			local menuItems = getMenuItems(menuOption.items)

			availableMenus[#availableMenus + 1] = {
				id = menuOption.id,
				title = menuOption.title,
				icon = menuOption.icon,
				items = menuItems,
			}
		end
	end

	return availableMenus
end

local function isNight()
	local hours = GetClockHours()

	return hours > 19 or hours < 6
end



local function openRadialMenu()
	local ply = PlayerPedId()

    if isDisplayingMenu then return end

    --[[ if exports["player"]:blockCommands() or exports["player"]:handCuff() or GetEntityHealth(ply) <= 101 then return end
 ]]
    isDisplayingMenu = true

	local availableMenus = getAvailableMenus()

    SendNUIMessage({
        state = "show",
        data = availableMenus,
		isNight = isNight()
    })

    SetCursorLocation(0.5, 0.5)
    SetNuiFocus(true, true)
	SetNuiFocusKeepInput(true)

	CreateThread(function()
		while isDisplayingMenu do
			DisableControlAction(0, 1, true) -- INPUT_LOOK_LR
			DisableControlAction(0, 2, true) -- INPUT_LOOK_UD
			DisableControlAction(0, 24, true) -- INPUT_ATTACK
			DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
			DisableControlAction(0, 85, true) -- INPUT_VEH_RADIO_WHEEL
			DisableControlAction(0, 257, true) -- INPUT_ATTACK2
			DisableControlAction(0, 346, true) -- INPUT_VEH_MELEE_LEFT
			
			Wait(0)
		end
	end)
end

local function closeRadialMenu()
    if not isDisplayingMenu then return end

    isDisplayingMenu = false

    SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
    SendNUIMessage({ state = 'destroy' })
end

local function addOptionToMenu(option)
    if not option.id or not option.title then return end

    MenuOptions[#MenuOptions + 1] = option
end

local function findMenuItemById(items, id)
    for _, menuItem in ipairs(items) do
        if menuItem.id == id then
            return menuItem
        end
        if menuItem.items then
            local foundItem = findMenuItemById(menuItem.items, id)
            if foundItem then
                return foundItem
            end
        end
    end
end

function HasAnimal()
    return animalHash
end

RegisterKeyMapping("+radial_menu", "Abrir menu radial.", "keyboard", "F1")

RegisterCommand("+radial_menu", openRadialMenu, false)
RegisterCommand("-radial_menu", closeRadialMenu, false)

exports("AddOption", addOptionToMenu)

RegisterNUICallback("triggerAction", function(data, cb)
    cb("ok")

    local menuOption = findMenuItemById(MenuOptions, data.id)
    if not menuOption then return end

    if menuOption.server then
        TriggerServerEvent(menuOption.trigger, menuOption.triggerArgs and table.unpack(menuOption.triggerArgs) or nil)
    else
        TriggerEvent(menuOption.trigger, menuOption.triggerArgs and table.unpack(menuOption.triggerArgs) or nil)
    end
end)

RegisterNUICallback("close", function(data, cb)
    closeRadialMenu()

	cb("ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:ANIMALSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:animalSpawn")
AddEventHandler("dynamic:animalSpawn",function(model)
	if animalHash == nil then
		if not spawnAnimal then
			spawnAnimal = true

			local Ped = PlayerPedId()
			local heading = GetEntityHeading(Ped)
			local coords = GetOffsetFromEntityInWorldCoords(Ped,0.0,1.0,0.0)
			local myObject,objNet = vRPS.CreatePed(model,coords["x"],coords["y"],coords["z"],heading,28)
			if myObject then
				local spawnAnimal = 0
				animalHash = NetworkGetEntityFromNetworkId(objNet)
				while not DoesEntityExist(animalHash) and spawnAnimal <= 1000 do
					animalHash = NetworkGetEntityFromNetworkId(objNet)
					spawnAnimal = spawnAnimal + 1
					Wait(1)
				end

				spawnAnimal = 0
				local pedControl = NetworkRequestControlOfEntity(animalHash)
				while not pedControl and spawnAnimal <= 1000 do
					pedControl = NetworkRequestControlOfEntity(animalHash)
					spawnAnimal = spawnAnimal + 1
					Wait(1)
				end

				SetPedCanRagdoll(animalHash,false)
				SetEntityInvincible(animalHash,true)
				SetPedFleeAttributes(animalHash,0,0)
				SetEntityAsMissionEntity(animalHash,true,false)
				SetBlockingOfNonTemporaryEvents(animalHash,true)
				SetPedRelationshipGroupHash(animalHash,GetHashKey("k9"))
				GiveWeaponToPed(animalHash,GetHashKey("WEAPON_ANIMAL"),200,true,true)
		
				SetEntityAsNoLongerNeeded(animalHash)

				TriggerEvent("dynamic:animalFunctions","seguir")

				vSERVER.animalRegister(objNet)
			end

			spawnAnimal = false
		end
	else
		vSERVER.animalCleaner()
		animalFollow = false
		animalHash = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:ANIMALFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:animalFunctions")
AddEventHandler("dynamic:animalFunctions",function(functions)
	if animalHash ~= nil then
		local Ped = PlayerPedId()

		if functions == "seguir" then
			if not animalFollow then
				TaskFollowToOffsetOfEntity(animalHash,Ped,1.0,1.0,0.0,5.0,-1,2.5,1)
				SetPedKeepTask(animalHash,true)
				animalFollow = true
			else
				SetPedKeepTask(animalHash,false)
				ClearPedTasks(animalHash)
				animalFollow = false
			end
		elseif functions == "colocar" then
			if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) then
				local vehicle = GetVehiclePedIsUsing(Ped)
				if IsVehicleSeatFree(vehicle,0) then
					TaskEnterVehicle(animalHash,vehicle,-1,0,2.0,16,0)
				end
			end
		elseif functions == "remover" then
			if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) then
				TaskLeaveVehicle(animalHash,GetVehiclePedIsUsing(Ped),256)
				TriggerEvent("dynamic:animalFunctions","seguir")
			end
		elseif functions == "deletar" then
			vSERVER.animalCleaner()
			animalFollow = false
			animalHash = nil
		end
	end
end)