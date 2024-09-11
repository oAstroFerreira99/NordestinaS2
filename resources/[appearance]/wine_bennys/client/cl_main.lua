-----------------------------------------------------------------------------------------------------------------------------------------
-- MODULES
-----------------------------------------------------------------------------------------------------------------------------------------
local lib    = loadmodule(GetCurrentResourceName(),"lib/lib")
local config = loadmodule(GetCurrentResourceName(),"config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
psRP = {}
lib.registerModule(GetCurrentResourceName(),psRP)
vSERVER = lib.getModule(GetCurrentResourceName())
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local menuEnabled   = false
local menuTablet    = false
local menuPlayer    = false
local menuHelp      = false
local index         = nil
local manager       = false
local id            = nil
local cam           = nil
local gameplaycam   = nil
local freecam       = false
local myveh         = {}
local damage        = 0
local cart          = {}
local modschange    = {}
local cartlist      = {}
local blips         = {}
local vsettings     = {}
local vsettingssync = {}
local playerkits    = {}
local admin         = false
local block         = false
local reboque       = nil
local rebocado      = nil
local vehicle
local anims         = {}
local anim_ids      = lib.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- ToggleActionMenu
-----------------------------------------------------------------------------------------------------------------------------------------
function ToggleActionMenu()
    local ped = PlayerPedId()
	menuEnabled = not menuEnabled
	if menuEnabled then
        DisplayRadar(false)
        vehicle = GetVehiclePedIsIn(ped)
        damage = (1000 - GetVehicleBodyHealth(vehicle))/100
		if not admin then
			if not config.mechanics[index].repair then
				damage = 0
			end
		end
        SetVehicleModKit(vehicle,0)
        myveh = getAllVehicleMods(vehicle)
        gameplaycam = GetRenderingCam()
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true,2)
        camControl(7)
        FreezeEntityPosition(vehicle,true)

        TriggerEvent("cancelando",true)
        TriggerEvent("status:celular",true)
        TriggerEvent("player:blockCommands",true)
		
		SetNuiFocus(false,false)
		SendNUIMessage({ action = "hide" })


		SetNuiFocus(true,true)
		local vehiclemods = getVehicleMods(vehicle)
		local tunning = getVehicleTunning(vehicle)
		
		
        SendNUIMessage({ action = "load", vehiclemods = vehiclemods, tunning = tunning, damage = damage })

        SendNUIMessage({ action = "show" })

	else
        DisplayRadar(true)
        if IsCamActive(cam) then
            SetCamActive(cam, false)
        end

        ResetCam()
	    camControl("close")
        FreezeEntityPosition(vehicle,false)
		if not admin then
			setVehicleMods(vehicle,myveh)
		end
        gameplaycam = nil
        cam         = nil
        myveh       = {}
        cart        = {}
        modschange  = {}
		cartlist    = {}
		index       = nil
		admin       = false

        TriggerEvent("cancelando",false)
        TriggerEvent("status:celular",false)
        TriggerEvent("player:blockCommands",false)

		SetVehicleLights(vehicle,0)
		SetNuiFocus(false,false)
		SendNUIMessage({ action = "hide" })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ToggleActionTablet
-----------------------------------------------------------------------------------------------------------------------------------------
function ToggleActionTablet()
	menuTablet = not menuTablet
	if menuTablet then

		SetNuiFocus(true,true)

		local infos = vSERVER.getDataMechanic(index)
        SendNUIMessage({ action = "loadtablet", infos = infos, manager = manager })

        SendNUIMessage({ action = "showtablet" })

	else
		index   = nil
		manager = false
		SetNuiFocus(false,false)
		SendNUIMessage({ action = "hidetablet" })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ToggleActionPlayer
-----------------------------------------------------------------------------------------------------------------------------------------
function ToggleActionPlayer()
    local ped = PlayerPedId()
	menuPlayer = not menuPlayer
	if menuPlayer then
        vehicle = GetVehiclePedIsIn(ped)
        SetVehicleModKit(vehicle,0)

		SetNuiFocus(true,true)

		local plate = tostring(GetVehicleNumberPlateText(vehicle))
		plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
		local vehname  = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()

		playerkits = vSERVER.getVehicleKits(vehname, plate)

        SendNUIMessage({ action = "showplayer" })

	else
		admin = false
		SetNuiFocus(false,false)
		SendNUIMessage({ action = "hideplayer" })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ToggleActionHelp
-----------------------------------------------------------------------------------------------------------------------------------------
function ToggleActionHelp()
	menuHelp = not menuHelp
	if menuHelp then
		SetNuiFocus(true,true)
        SendNUIMessage({ action = "showhelp" })
	else
		SetNuiFocus(false,false)
		SendNUIMessage({ action = "hidehelp" })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- blips
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped    = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local idle   = 1000

		if not menuEnabled and checklicense then
			for key,value in pairs(config.mechanics) do
				local title  = config.mechanics[key].title
				local nblips = config.mechanics[key].blips
				for k, v in pairs(nblips) do
					local distance = #(coords - vector3(v.x,v.y,v.z))
					if GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
						if distance <= 10 then
							local r,g,b = table.unpack(config.drawmarker.colorrgb)
							local sx,sy,sz = table.unpack(config.drawmarker.scale)
							DrawMarker(config.drawmarker.blip, v.x,v.y,v.z-config.drawmarker.height,0, 0, 0, 0, 0, 0, sx, sy, sz, r,g,b, 180, 0, 1, 0, config.drawmarker.rotate)
							idle = 0
							if distance <= 1.2 then
								drawTxt(title,4,0.5,0.92,0.35,255,255,255,180)
								if IsControlJustPressed(0,38) then
									-- if vSERVER.chekOpenMenu(key) then
										index = key
										ToggleActionMenu()
										
									-- end
								end
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- close
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close", function(data, cb)
	if menuTablet then
		ToggleActionTablet()
	elseif menuPlayer then
		ToggleActionPlayer()
	elseif menuHelp then
		ToggleActionHelp()
	else
    	ToggleActionMenu()
	end
    cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- camera
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("camera",function(data, cb)
	if data and data.camera then
		if data.camera == "freecam" then
            freecam = true
			freeCam()
		else
			camControl(data.camera)
		end
	end

    cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- setmod
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("setmod",function(data, cb)
	if data and data.type then
		if data.type == "repair" then
			if block then
				return
			end
			block = true
			if vSERVER.repairVehicle(vehicle) then
				ToggleActionMenu()
				if not IsPedInAnyVehicle(PlayerPedId()) then
					psRP.playAnim(false,{{"mini@repair","fixing_a_player"}},true)
				end
				vSERVER.sendprogress(10000,"reparando")
				Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDirtLevel(vehicle,0.0)
				SetVehicleUndriveable(vehicle,false)
				SetEntityAsMissionEntity(vehicle,true,true)
				SetVehicleOnGroundProperly(vehicle)
				myveh.damage = 0.0
				psRP.stopAnim(false)
				vSERVER.sendnotify("Notify","sucesso","Veículo reparado com <b>sucesso</b>.",7000)
			end
			block = false
		elseif data.type == "color" then
			SetVehicleModKit(vehicle,0)
			local primary, secondary = GetVehicleColours(vehicle)
			if data.colortype == "paint1" then
				playSound("respray",1.0)
				ClearVehicleCustomPrimaryColour(vehicle)
				SetVehicleColours(vehicle,tonumber(data.index),secondary)
			elseif data.colortype == "paint2" then
				playSound("respray",1.0)
				ClearVehicleCustomSecondaryColour(vehicle)
				SetVehicleColours(vehicle,primary,tonumber(data.index))
			end

			local index = data.type..data.colortype

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						local primary, secondary = GetVehicleColours(vehicle)
						modschange[i].primary   = primary
						modschange[i].secondary = secondary
					end
				end

				if not exist then
					local primary, secondary = GetVehicleColours(vehicle)
					local data = {
						type      = data.type,
						primary   = primary,
						secondary = secondary
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
		elseif data.type == "customcolor" then
			local r,g,b = tonumber(data.index.r),tonumber(data.index.g),tonumber(data.index.b)
			if data.colortype == "paint1" then
				playSound("respray",1.0)
				SetVehicleCustomPrimaryColour(vehicle,r,g,b)
			elseif data.colortype == "paint2" then
				playSound("respray",1.0)
				SetVehicleCustomSecondaryColour(vehicle,r,g,b)
			end

			local index = data.type..data.colortype

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			elseif cart[index].index ~= table.pack(data.index) then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						local primary, secondary = GetVehicleColours(vehicle)
						modschange[i].primary   = table.pack(GetVehicleCustomPrimaryColour(vehicle))
						modschange[i].secondary = table.pack(GetVehicleCustomSecondaryColour(vehicle))
					end
				end

				if not exist then
					local data = {
						type      = data.type,
						primary   = table.pack(GetVehicleCustomPrimaryColour(vehicle)),
						secondary = table.pack(GetVehicleCustomSecondaryColour(vehicle))
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
        elseif data.type == "pearly" then
			playSound("respray",1.0)
			local pearly,wheel = GetVehicleExtraColours(vehicle)
			SetVehicleExtraColours(vehicle,tonumber(data.index),wheel)

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			elseif cart[index].index ~= table.pack(data.index) then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
		elseif data.type == "smoke-colors" then
			local r,g,b = tonumber(data.index.r),tonumber(data.index.g),tonumber(data.index.b)
			playSound("respray",1.0)
			ToggleVehicleMod(vehicle,20,true)
			SetVehicleTyreSmokeColor(vehicle,r,g,b)

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			elseif cart[index].index ~= table.pack(data.index) then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
		elseif data.type == "wheelcolor" then
			playSound("respray",1.0)
			local wheel,wcolor = GetVehicleExtraColours(vehicle)
			SetVehicleExtraColours(vehicle,wheel,tonumber(data.index))

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			elseif cart[index].index ~= table.pack(data.index) then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
		elseif data.type == "plate" then
			playSound("wrench",0.25)
			SetVehicleNumberPlateTextIndex(vehicle,tonumber(data.index))

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end
			
			updateCart()
		elseif data.type == "window" then
			playSound("wrench",0.25)
			SetVehicleWindowTint(vehicle,tonumber(data.index))

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end
			
			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end
			
			updateCart()
		elseif data.type == "wheeltype" then
			playSound("wrench",0.25)
            if data.wheelid == "wheelfront" then
                SetVehicleWheelType(vehicle,23)
                SetVehicleMod(vehicle,23,(tonumber(data.index)-1),false)
            elseif data.wheelid == "wheelback" then
                SetVehicleWheelType(vehicle,24)
                SetVehicleMod(vehicle,24,(tonumber(data.index)-1),false)
            else
                SetVehicleWheelType(vehicle,tonumber(data.wheelid))
                SetVehicleMod(vehicle,23,(tonumber(data.index)-1),false)
            end

            if data.wheelid == "wheelfront" or data.wheelid == "wheelback" then
                data.type = data.wheelid
            end

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price   = tonumber(data.price),
					wheelid = tonumber(data.wheelid),
					index   = data.index,
				}
			elseif cart[index].wheelid ~= tonumber(data.wheelid) then
				cart[index] = {
					price   = tonumber(data.price),
					wheelid = tonumber(data.wheelid),
					index   = data.index,
				}
			elseif cart[index].index ~= (tonumber(data.index)-1) then
				cart[index] = {
					price   = tonumber(data.price),
					wheelid = tonumber(data.wheelid),
					index   = (tonumber(data.index)-1),
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
                        if modschange[i].wheelid ~= tonumber(data.wheelid) then
                            modschange[i].wheelid = tonumber(data.wheelid)
                            modschange[i].index = (tonumber(data.index)-1)
                        end
						if modschange[i].index ~= (tonumber(data.index)-1) then
							modschange[i].index = (tonumber(data.index)-1)
						end
					end
				end

				if not exist then
                    local data = {
                        type    = data.type,
                        wheelid = tonumber(data.wheelid),
                        index   = (tonumber(data.index)-1)
                    }
                    table.insert(modschange, data)
				end
			end
			
			updateCart()
		elseif data.type == "customtires" then
			playSound("wrench",0.25)
			local modindex = GetVehicleMod(vehicle,23)
			SetVehicleMod(vehicle,23,modindex,tonumber(data.index))

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end
			
			updateCart()
		elseif data.type == "bulletproof" then
			playSound("wrench",0.25)
            SetVehicleTyresCanBurst(vehicle,tonumber(data.index))

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end
			
			updateCart()
		elseif data.type == "xenon" then
			local indexenon = nil
			for k, v in pairs(config.vehicleCustomsList) do
				if v.id == "xenon" then
					indexenon = k
				end
			end

			if indexenon == nil then
				return
			end

			local colour = config.vehicleCustomsList[indexenon].colors[data.index]

			if colour == nil then
				return
			end

			playSound("wrench",0.25)
			SetVehicleLights(vehicle,2)
			ToggleVehicleMod(vehicle,22,2)
			SetVehicleXenonLightsColour(vehicle,colour)

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end
			
			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						if modschange[i].index ~= data.index then
							modschange[i].index = data.index
						end
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end
			
			updateCart()
		elseif data.type == "perfomance" then
			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			elseif cart[index].index ~= table.pack(data.index) then
				cart[index] = {
					price = tonumber(data.price),
					index = table.pack(data.index)
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == data.type then
						exist = true
						modschange[i].index = data.index
					end
				end

				if not exist then
					local data = {
						type  = data.type,
						index = data.index
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
		else
        	SetVehicleMod(vehicle,tonumber(data.type),(tonumber(data.index) - 1),GetVehicleModVariation(vehicle,tonumber(data.type)))
			if tonumber(data.type) == 14 then
				StartVehicleHorn(vehicle, 5000, "HELDDOWN", true)
			else
				playSound("wrench",0.25)
			end

			local index = data.type

			if cart[index] == nil then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			elseif cart[index].index ~= data.index then
				cart[index] = {
					price = tonumber(data.price),
					index = data.index
				}
			end

			if tonumber(data.price) > 0 then
				local exist = false
				for i = 1, #modschange do
					if modschange[i].type == tonumber(data.type) then
						exist = true
						if modschange[i].index ~= (tonumber(data.index) - 1) then
							modschange[i].index = (tonumber(data.index) - 1)
						end
					end
				end

				if not exist then
					local data = {
						type  = tonumber(data.type),
						index = (tonumber(data.index) - 1)
					}
					table.insert(modschange, data)
				end
			end

			updateCart()
		end
	end

    cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- savemod
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("savemod",function(data, cb)
	if admin then
		local custom = getAllVehicleMods(vehicle)
		TriggerServerEvent(GetCurrentResourceName()..":syncVehicleMods",custom,VehToNet(vehicle))
		ToggleActionMenu()
		cb(true)
		return
	end

	local total = 0
	for k, v in pairs(cart) do
		total = total + v.price
	end

	local data = {
		mods     = modschange,
		cartlist = cartlist,
		price    = total,
		mechanic = index
	}

	local check = vSERVER.saveBudget(data)
	if check then
		ToggleActionMenu()
		cb(true)
	else
		cb(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- addannounce
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("addannounce",function(data, cb)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local nblips = config.mechanics[index].blips
	for k, v in pairs(nblips) do
		local distance = #(coords - vector3(v.x,v.y,v.z))
		if distance <= 50 then
			if data and data.message then
				local check = vSERVER.addAnnounce(index,data)
				if check then
					local infos = vSERVER.getDataMechanic(index)
					SendNUIMessage({ action = "loadtablet", infos = infos, manager = manager })
				end
			end
			cb(true)
			return
		end
	end
	vSERVER.sendnotify("negado", "Você está longe da mecânica", 8000)
	cb(false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- servicestatus
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("servicestatus", function(data, cb)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local nblips = config.mechanics[index].blips
	for k, v in pairs(nblips) do
		local distance = #(coords - vector3(v.x,v.y,v.z))
		if distance <= 50 then
			local check = vSERVER.serviceStatus(index)
			if check then
				local infos = vSERVER.getDataMechanic(index)
				SendNUIMessage({ action = "loadtablet", infos = infos, manager = manager })
			end
			cb(true)
			return
		end
	end
	vSERVER.sendnotify("negado", "Você está longe da mecânica", 8000)
	cb(false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- applymod
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("applymod",function(data, cb)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local nblips = config.mechanics[index].blips
	for k, v in pairs(nblips) do
		local distance = #(coords - vector3(v.x,v.y,v.z))
		if distance <= 50 then
			if data and data.id then
				local check = vSERVER.applyMods(index,data)
				if check then
					ToggleActionTablet()
					cb(true)
				else
					cb(false)
				end
			else
				cb(false)
			end

			return
		end
	end
	vSERVER.sendnotify("negado", "Você está longe da mecânica", 8000)
	cb(false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- accepthelp
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("accepthelp",function(data, cb)
	if data and data.index and data.id then
		vSERVER.acceptHelp(data)
		ToggleActionTablet()
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- changeneon
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changeneon",function(data, cb)
	if data and data.color and vehicle then
		if playerkits.neon or admin then
			for i = 0, 3 do 
				if not IsVehicleNeonLightEnabled(vehicle,i) then 
					SetVehicleNeonLightEnabled(vehicle,i,true)
				end 
			end
			local r,g,b = tonumber(data.color.r),tonumber(data.color.g),tonumber(data.color.b)
			SetVehicleNeonLightsColour(vehicle,r,g,b)
		else
			vSERVER.sendnotify("negado", "Você não possui o módulo de neon", 5000)
		end
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- changesuspension
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changesuspension",function(data, cb)
	if data and data.index then
		if playerkits.suspension or admin then
			local min   = GetVehicleSuspensionHeight(vehicle)
			local count = 0
			local good  = false
			playSound("suspension",1.00)

			while min > tonumber(data.index) and count < 50 do
				TriggerServerEvent(GetCurrentResourceName()..":syncVehicleSuspension", VehToNet(vehicle), (GetVehicleSuspensionHeight(vehicle) - (1.0 * 0.01)))
				min = GetVehicleSuspensionHeight(vehicle)
				count = count + 1
				Citizen.Wait(75)
				good = true
			end

			while not good and min < tonumber(data.index) and count < 50 do
				TriggerServerEvent(GetCurrentResourceName()..":syncVehicleSuspension", VehToNet(vehicle), (GetVehicleSuspensionHeight(vehicle) + (1.0 * 0.01)))
				min = GetVehicleSuspensionHeight(vehicle)
				count = count + 1
				Citizen.Wait(75)
			end
		else
			vSERVER.sendnotify("negado", "Você não possui o módulo de suspensão", 5000)
		end
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- changeoffsetfront
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changeoffsetfront",function(data, cb)
	if data and data.index then
		if playerkits.camber or admin then
            local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
			local plate = tostring(GetVehicleNumberPlateText(vehicle))
			plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
			if vsettings[vehname..plate] == nil then vsettings[vehname..plate] = {} end

			local val = round(tonumber(data.index) * 100)
			SetWheelOffsetFront(vehicle, val, vehname, plate)
		else
			vSERVER.sendnotify("negado", "Você não possui o módulo de cambagem", 5000)
		end
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- changeoffsetrear
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changeoffsetrear",function(data, cb)
	if data and data.index then
		if playerkits.camber or admin then
            local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
			local plate = tostring(GetVehicleNumberPlateText(vehicle))
			plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
			if vsettings[vehname..plate] == nil then vsettings[vehname..plate] = {} end

			local val = round(tonumber(data.index) * 100)
			SetWheelOffsetRear(vehicle, val, vehname, plate)
		else
			vSERVER.sendnotify("negado", "Você não possui o módulo de cambagem", 5000)
		end
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- changerotationfront
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changerotationfront",function(data, cb)
	if data and data.index then
		if playerkits.camber or admin then
            local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
			local plate = tostring(GetVehicleNumberPlateText(vehicle))
			plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
			if vsettings[vehname..plate] == nil then vsettings[vehname..plate] = {} end

			local val = round(tonumber(data.index) * 100)
			SetWheelRotationFront(vehicle, val, vehname, plate)
		else
			vSERVER.sendnotify("negado", "Você não possui o módulo de cambagem", 5000)
		end
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- changerotationrear
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changerotationrear",function(data, cb)
	if data and data.index then
		if playerkits.camber or admin then
            local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
			local plate = tostring(GetVehicleNumberPlateText(vehicle))
			plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
			if vsettings[vehname..plate] == nil then vsettings[vehname..plate] = {} end

			local val = round(tonumber(data.index) * 100)
			SetWheelRotationRear(vehicle, val, vehname, plate)
		else
			vSERVER.sendnotify("negado", "Você não possui o módulo de cambagem", 5000)
		end
	end
	cb(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendhelp
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sendhelp",function(data, cb)
	local check = vSERVER.sendHelp(data.message)
	if check then
		cb(true)
	else
		cb(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- opentablet
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.commands.opentablet, function(source, args, rawCommand)
	local check,mechanic,managermechanic = vSERVER.chekOpenTablet()
	if check and mechanic ~= nil then
		index   = mechanic
		manager = managermechanic
		ToggleActionTablet()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- wine_bennys:opentabletmechanic
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":opentabletmechanic")
AddEventHandler(GetCurrentResourceName()..":opentabletmechanic", function()
	local check,mechanic,managermechanic = vSERVER.chekOpenTablet()
	if check and mechanic ~= nil then
		index   = mechanic
		manager = managermechanic
		ToggleActionTablet()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- openplayernui
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.commands.openplayernui, function(source, args, rawCommand)
	local ped = PlayerPedId()
    if GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
		if vSERVER.checkPermissionsAdmin() then
			admin = true
		end
		ToggleActionPlayer()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- wine_bennys:opentabletplayer
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":opentabletplayer")
AddEventHandler(GetCurrentResourceName()..":opentabletplayer", function()
	local ped = PlayerPedId()
    if GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
		if vSERVER.checkPermissionsAdmin() then
			admin = true
		end
		ToggleActionPlayer()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendhelp
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.commands.sendhelp, function(source, args, rawCommand)
    ToggleActionHelp()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- wine_bennys:openhelp
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":openhelp")
AddEventHandler(GetCurrentResourceName()..":openhelp", function()
    ToggleActionHelp()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- admintunning
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.admintunning.command, function(source, args, rawCommand)
    local ped = PlayerPedId()
    if GetPedInVehicleSeat(GetVehiclePedIsUsing(ped),-1) == ped then
		if vSERVER.checkPermissionsAdmin() then
			admin = true
        	ToggleActionMenu()
		end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- tow vehicle
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.commands.tow,function(source,args)
	local check,mechanic = vSERVER.chekOpenTablet()
	if check and mechanic ~= nil then
		local vehicle = GetPlayersLastVehicle()
		local vehicletow = IsVehicleModel(vehicle,GetHashKey("slamtruck"))
	
		if vehicletow and not IsPedInAnyVehicle(PlayerPedId()) then
			rebocado = getVehicleInDirection(GetEntityCoords(PlayerPedId()),GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,5.0,0.0))
			if IsEntityAVehicle(vehicle) and IsEntityAVehicle(rebocado) then
				TriggerServerEvent(GetCurrentResourceName()..":trytow",VehToNet(vehicle),VehToNet(rebocado))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- wine_bennys:applymodsinstall
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":applymodsinstall")
AddEventHandler(GetCurrentResourceName()..":applymodsinstall", function(veh,mods)
    psRP.applyMods(veh,mods)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- applyMods
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.applyMods(veh,mods)
	if mods and IsEntityAVehicle(veh) then
		if mods.type == "color" then
			SetVehicleModKit(veh,0)
            ClearVehicleCustomPrimaryColour(veh)
            ClearVehicleCustomSecondaryColour(veh)
			SetVehicleColours(veh,tonumber(mods.primary),tonumber(mods.secondary))
		elseif mods.type == "customcolor" then
			SetVehicleCustomPrimaryColour(veh,mods.primary[1],mods.primary[2],mods.primary[3])
			SetVehicleCustomSecondaryColour(veh,mods.secondary[1],mods.secondary[2],mods.secondary[3])
		elseif mods.type == "plate" then
			SetVehicleNumberPlateTextIndex(veh,tonumber(mods.index))
		elseif mods.type == "window" then
			SetVehicleWindowTint(veh,tonumber(mods.index))
		elseif mods.type == "wheeltype" then
			SetVehicleWheelType(veh,tonumber(mods.wheelid))
			SetVehicleMod(veh,23,(tonumber(mods.index)),false)
		elseif mods.type == "wheelfront" then
            SetVehicleWheelType(veh,23)
            SetVehicleMod(veh,23,(tonumber(mods.index)),false)
		elseif mods.type == "wheelback" then
            SetVehicleWheelType(veh,24)
            SetVehicleMod(veh,24,(tonumber(mods.index)),false)
		elseif mods.type == "pearly" then
			local pearly,wheel = GetVehicleExtraColours(veh)
			SetVehicleExtraColours(veh,tonumber(mods.index),wheel)
		elseif mods.type == "wheelcolor" then
			local pearly,wheel = GetVehicleExtraColours(veh)
			SetVehicleExtraColours(veh,pearly,tonumber(mods.index))
		elseif mods.type == "customtires" then
			local modindex = GetVehicleMod(veh,23)
			SetVehicleMod(veh,23,modindex,tonumber(mods.index))
		elseif mods.type == "bulletproof" then
            SetVehicleTyresCanBurst(veh,tonumber(mods.index))
		elseif mods.type == "xenon" then
			for k, v in pairs(config.vehicleCustomsList) do
				if v.id == "xenon" then
					indexenon = k
				end
			end

			if indexenon == nil then
				return
			end

			local colour = config.vehicleCustomsList[indexenon].colors[tonumber(mods.index)]

			if colour == nil then
				return
			end

			SetVehicleLights(veh,2)
			ToggleVehicleMod(veh,22,2)
			SetVehicleXenonLightsColour(veh,colour)
		elseif mods.type == "smoke-colors" then
			local r,g,b = tonumber(mods.index.r),tonumber(mods.index.g),tonumber(mods.index.b)
			ToggleVehicleMod(veh,20,true)
			SetVehicleTyreSmokeColor(veh,r,g,b)
		elseif mods.type == "perfomance" then
			setVehicleTunnig(data.index)
		else
			if mods.type == 18 then
				ToggleVehicleMod(veh,tonumber(mods.type),true)
			else
				SetVehicleMod(veh,tonumber(mods.type),(tonumber(mods.index)))
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- saveMods
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.saveMods(veh)
	if IsEntityAVehicle(veh) then
		local custom   = getAllVehicleMods(veh)
		local vehname  = GetEntityArchetypeName(veh)
		local vehplate = GetVehicleNumberPlateText(veh)
		vSERVER.saveMods(vehname,vehplate,custom)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setCoords
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.setCoords(id,x,y,z,blip,colour,scale,title)
	blips[id] = AddBlipForCoord(x,y,z)
	SetBlipSprite(blips[id],blip)
	SetBlipColour(blips[id],colour)
	SetBlipScale(blips[id],scale)
	SetBlipAsShortRange(blips[id],false)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(title)
	EndTextCommandSetBlipName(blips[id])
	SetNewWaypoint(x+0.0001,y+0.0001)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setCoords
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.removeBlip(id)
	if blips[id] ~= nil then
		RemoveBlip(blips[id])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getVehicleProximity
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getVehicleProximity(radius)
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)

	if not IsPedInAnyVehicle(ped) then
		veh = getNearestVehicle(radius)
	end

	if IsEntityAVehicle(veh) then
        return {
            vehicle = veh,
            netid   = VehToNet(veh),
            plate   = GetVehicleNumberPlateText(veh),
            name    = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower(),
        }
	end
    return {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- playAnim
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.playAnim(upper,seq,looping)
	if seq.task then
		psRP.stopAnim(true)

		local ped = PlayerPedId()
		if seq.task == "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			TaskStartScenarioAtPosition(ped,seq.task,x,y,z-1,GetEntityHeading(ped),0,0,false)
		else
			TaskStartScenarioInPlace(ped,seq.task,0,not seq.play_exit)
		end
	else
		psRP.stopAnim(upper)

		local flags = 0
		if upper then flags = flags+48 end
		if looping then flags = flags+1 end

		Citizen.CreateThread(function()
			local id = anim_ids:gen()
			anims[id] = true

			for k,v in pairs(seq) do
				local dict = v[1]
				local name = v[2]
				local loops = v[3] or 1

				for i=1,loops do
					if anims[id] then
						local first = (k == 1 and i == 1)
						local last = (k == #seq and i == loops)

						RequestAnimDict(dict)
						local i = 0
						while not HasAnimDictLoaded(dict) and i < 1000 do
						Citizen.Wait(10)
						RequestAnimDict(dict)
						i = i + 1
					end

					if HasAnimDictLoaded(dict) and anims[id] then
						local inspeed = 3.0
						local outspeed = -3.0
						if not first then inspeed = 2.0 end
						if not last then outspeed = 2.0 end

						TaskPlayAnim(PlayerPedId(),dict,name,inspeed,outspeed,-1,flags,0,0,0,0)
					end
						Citizen.Wait(5)
						while GetEntityAnimCurrentTime(PlayerPedId(),dict,name) <= 0.95 and IsEntityPlayingAnim(PlayerPedId(),dict,name,3) and anims[id] do
							Citizen.Wait(5)
						end
					end
				end
			end
			anim_ids:free(id)
			anims[id] = nil
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- stopAnim
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.stopAnim(upper)
	anims = {}
	if upper then
		ClearPedSecondaryTask(PlayerPedId())
	else
		ClearPedTasks(PlayerPedId())
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- applymods
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":applymods")
AddEventHandler(GetCurrentResourceName()..":applymods", function(veh,vname, plate)
	if veh then
		local vehname  = vname or GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
		local vehplate = plate or GetVehicleNumberPlateText(veh)
		local custom   = vSERVER.getMods(vehname,vehplate)
		if custom then
			TriggerServerEvent(GetCurrentResourceName()..":syncVehicleMods",custom,VehToNet(veh))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- applymods_sync
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":applymods_sync")
AddEventHandler(GetCurrentResourceName()..":applymods_sync",function(custom,vnet)
	if NetworkDoesEntityExistWithNetworkId(vnet) then
		local veh = NetToVeh(vnet)
		if DoesEntityExist(veh) then
			if custom and custom.customPcolor then
				setVehicleMods(veh,custom)
				SetVehicleDirtLevel(veh,0.0)
			else
				TriggerEvent("vrp_garages:mods", vnet, custom)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- synctow
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":synctow")
AddEventHandler(GetCurrentResourceName()..":synctow",function(vehid,rebid)
    if NetworkDoesNetworkIdExist(vehid) and NetworkDoesNetworkIdExist(rebid) then
        local vehicle = NetToVeh(vehid)
        local rebocado = NetToVeh(rebid)
        if DoesEntityExist(vehicle) and DoesEntityExist(rebocado) then
            if reboque == nil then
                if vehicle ~= rebocado then
                    local min,max = GetModelDimensions(GetEntityModel(rebocado))
                    AttachEntityToEntity(rebocado,vehicle,GetEntityBoneIndexByName(vehicle,"bodyshell"),0,-2.2,0.2-min.z,11.5,0,0,1,1,0,1,0,1)
                    reboque = rebocado
                end
            else
                AttachEntityToEntity(reboque,vehicle,20,-0.5,-15.0,-0.3,0.0,0.0,0.0,false,false,true,false,20,true)
                DetachEntity(reboque,false,false)
                PlaceObjectOnGroundProperly(reboque)
                reboque = nil
                rebocado = nil
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- synctow
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":syncwheel")
AddEventHandler(GetCurrentResourceName()..":syncwheel",function(settings)
	vsettingssync = settings
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- suspension_sync
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(GetCurrentResourceName()..":suspension_sync")
AddEventHandler(GetCurrentResourceName()..":suspension_sync",function(vnet, calc)
	if NetworkDoesEntityExistWithNetworkId(vnet) then
		local veh = NetToVeh(vnet)
		if DoesEntityExist(veh) then
			SetVehicleSuspensionHeight(veh,calc)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CarryMod
-----------------------------------------------------------------------------------------------------------------------------------------
function CarryMod(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
	local ped = PlayerPedId()

	RequestModel(GetHashKey(prop))
	while not HasModelLoaded(GetHashKey(prop)) do
		Citizen.Wait(10)
	end

	if pos1 then
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,false,false)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),pos1,pos2,pos3,pos4,pos5,pos6,true,true,false,true,1,true)
	else
		LoadAnim(dict)
		TaskPlayAnim(ped,dict,anim,3.0,3.0,-1,flag,0,0,0,0)
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,false,false)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LoadAnim
-----------------------------------------------------------------------------------------------------------------------------------------
function LoadAnim(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SetWheelOffsetFront
-----------------------------------------------------------------------------------------------------------------------------------------
function SetWheelOffsetFront(vehicle, val, vehname, plate)
	SetVehicleWheelXOffset(vehicle,0,tonumber("-0."..val..""))
	SetVehicleWheelXOffset(vehicle,1,tonumber("0."..val..""))

	if vsettings[vehname..plate]['wheeloffset'] == nil then vsettings[vehname..plate]['wheeloffset'] = {} end
	vsettings[vehname..plate]['wheeloffset'].wheel0 = tonumber("-0."..val.."")
	vsettings[vehname..plate]['wheeloffset'].wheel1 = tonumber("0."..val.."")

	TriggerServerEvent(GetCurrentResourceName()..":trywheel", vsettings)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SetWheelOffsetRear
-----------------------------------------------------------------------------------------------------------------------------------------
function SetWheelOffsetRear(vehicle, val, vehname, plate)
	SetVehicleWheelXOffset(vehicle,2,tonumber("-0."..val..""))
	SetVehicleWheelXOffset(vehicle,3,tonumber("0."..val..""))

	if vsettings[vehname..plate]['wheeloffset'] == nil then vsettings[vehname..plate]['wheeloffset'] = {} end
	vsettings[vehname..plate]['wheeloffset'].wheel2 = tonumber("-0."..val.."")
	vsettings[vehname..plate]['wheeloffset'].wheel3 = tonumber("0."..val.."")

	TriggerServerEvent(GetCurrentResourceName()..":trywheel", vsettings)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SetWheelRotationFront
-----------------------------------------------------------------------------------------------------------------------------------------
function SetWheelRotationFront(vehicle, val, vehname, plate)
	SetVehicleWheelYRotation(vehicle,0,tonumber("-0."..val..""))
	SetVehicleWheelYRotation(vehicle,1,tonumber("0."..val..""))

	if vsettings[vehname..plate]['wheelrotation'] == nil then vsettings[vehname..plate]['wheelrotation'] = {} end
	vsettings[vehname..plate]['wheelrotation'].wheel0 = tonumber("-0."..val.."")
	vsettings[vehname..plate]['wheelrotation'].wheel1 = tonumber("0."..val.."")

	TriggerServerEvent(GetCurrentResourceName()..":trywheel", vsettings)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SetWheelRotationRear
-----------------------------------------------------------------------------------------------------------------------------------------
function SetWheelRotationRear(vehicle, val, vehname, plate)
	SetVehicleWheelYRotation(vehicle,2,tonumber("-0."..val..""))
	SetVehicleWheelYRotation(vehicle,3,tonumber("0."..val..""))

	if vsettings[vehname..plate]['wheelrotation'] == nil then vsettings[vehname..plate]['wheelrotation'] = {} end
	vsettings[vehname..plate]['wheelrotation'].wheel2 = tonumber("-0."..val.."")
	vsettings[vehname..plate]['wheelrotation'].wheel3 = tonumber("0."..val.."")

	TriggerServerEvent(GetCurrentResourceName()..":trywheel", vsettings)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getAllVehicleMods
-----------------------------------------------------------------------------------------------------------------------------------------
function getAllVehicleMods(veh)
	local myveh = {}
	myveh.vehicle = veh
	myveh.model = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
	myveh.color =  table.pack(GetVehicleColours(veh))
	myveh.customPcolor = table.pack(GetVehicleCustomPrimaryColour(veh))
	myveh.customScolor = table.pack(GetVehicleCustomSecondaryColour(veh))
	myveh.extracolor = table.pack(GetVehicleExtraColours(veh))
	-- myveh.neon = hasNeonKit(veh)
	myveh.neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
	myveh.xenoncolor = GetVehicleHeadlightsColour(veh)
	myveh.smokecolor = table.pack(GetVehicleTyreSmokeColor(veh))
	myveh.plateindex = GetVehicleNumberPlateTextIndex(veh)
	myveh.pcolortype = myveh.color[1]
	myveh.scolortype = myveh.color[2]
	myveh.perfomance = getVehicleTunning(veh)
	myveh.mods = {}
	for i = 0, 48 do
		myveh.mods[i] = {mod = nil}
	end
	for i,t in pairs(myveh.mods) do 
		if i == 22 or i == 18 then
			if IsToggleModOn(veh,i) then
				t.mod = 1
			else
				t.mod = 0
			end
		elseif i == 23 or i == 24 then
			t.mod = GetVehicleMod(veh,i)
			t.variation = GetVehicleModVariation(veh, i)
		else
			t.mod = GetVehicleMod(veh,i)
		end
	end
	if GetVehicleWindowTint(veh) == -1 or GetVehicleWindowTint(veh) == 0 then
		myveh.windowtint = false
	else
		myveh.windowtint = GetVehicleWindowTint(veh)
	end
	if myveh.xenoncolor > 12 or myveh.xenoncolor < -1 then
		myveh.xenoncolor = -1
	end
	myveh.wheeltype = GetVehicleWheelType(veh)
	myveh.damage = (1000 - GetVehicleBodyHealth(vehicle))/100
	return myveh
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getVehicleMods
-----------------------------------------------------------------------------------------------------------------------------------------
function getVehicleMods(veh)
	rodaatual = GetVehicleMod(veh,23)
    rodaatualcustom = GetVehicleModVariation(vehicle,23)
	SetVehicleMod(veh,23, rodaatual,rodaatualcustom)
    local mods = {}
	if index ~= nil then
		if #config.mechanics[index].modsavailable > 0 or admin then
			for k, v in pairs(config.vehicleCustomsList) do
				local modAmount = GetNumVehicleMods(veh,v.id) + 1
				if v.id == "extra" or v.id == "window" or v.id == "plate" then
					if config.mechanics[index].modsavailable[v.id] then
						local data = {
							id       = v.id,
							name     = v.category,
							maxmods  = v.maxmods,
							actived  = -1,
							price    = getPriceMod(v.price),
							multiple = v.multiple or false,
						}
						table.insert(mods, data)
					end
				elseif v.id == "color" then
					if config.mechanics[index].modsavailable[v.id] then
						local data = {
							id       = v.id,
							name     = v.category,
							menu     = v.menu,
							actived  = -1,
							price    = getPriceMod(v.price),
							multiple = v.multiple or false,
						}
						table.insert(mods, data)
					end
				elseif v.id == "wheel" then
					if config.mechanics[index].modsavailable[v.id] then
						local tempWheel = GetVehicleMod(vehicle,23)
						local tempWheelType = GetVehicleWheelType(vehicle)
						local tempWheelCustom = GetVehicleModVariation(vehicle,23)

						local menu = {}

						for _, mdata in pairs(v.menu) do

							local list = {}

                            if IsThisModelABike(GetEntityModel(vehicle)) then
                                if mdata.id ~= "wheeltype" then
                                    for m, ldata in pairs(mdata.list) do
                                        local maxmods = 0
                                        if ldata.id == "wheelcolor" then
                                            maxmods = ldata.maxmods
                                        elseif ldata.id == "smoke-colors" or ldata.id == "customtires" or ldata.id == "bulletproof" then
                                            maxmods = 2
                                        end
        
                                        local data = {
                                            category = ldata.category,
                                            id       = ldata.id,
                                            price    = getPriceMod(ldata.price),
                                            maxmods  = ldata.maxmods or maxmods
                                        }
                                        table.insert(list, data)
                                    end
                                else
                                    local wheelsbike = { 
                                        ["wheelfront"] = { "Dianteira", 23 }, 
                                        ["wheelback"]  = { "Traseira", 23 }
                                    }
        
                                    for cat, wheel in pairs(wheelsbike) do
                                        SetVehicleWheelType(vehicle,wheel[2])
                                        maxmods = GetNumVehicleMods(vehicle,wheel[2])
            
                                        local data = {
                                            category = wheel[1],
                                            id       = cat,
                                            price    = getPriceMod(v.price),
                                            maxmods  = maxmods
                                        }
                                        table.insert(list, data)
                                    end
                                end
                            else
                                for m, ldata in pairs(mdata.list) do
                                    local maxmods = 0
                                    if ldata.id == "wheelcolor" then
                                        maxmods = ldata.maxmods
                                    elseif ldata.id == "smoke-colors" or ldata.id == "customtires" or ldata.id == "bulletproof" then
                                        maxmods = 2
                                    else
                                        SetVehicleWheelType(vehicle,ldata.id)
                                        maxmods = GetNumVehicleMods(vehicle,23)
                                    end
    
                                    local data = {
                                        category = ldata.category,
                                        id       = ldata.id,
                                        price    = getPriceMod(ldata.price),
                                        maxmods  = ldata.maxmods or maxmods
                                    }
                                    table.insert(list, data)
                                end
                            end

							local data = {
								category = mdata.category,
								id       = mdata.id,
								list     = list
							}
							table.insert(menu, data)
						end

						local data = {
							id       = v.id,
							name     = v.category,
							menu     = menu,
							actived  = -1,
							price    = getPriceMod(v.price),
							multiple = v.multiple or false,
						}
						table.insert(mods, data)
						SetVehicleWheelType(vehicle,tempWheelType)
						SetVehicleMod(vehicle,23,tempWheel,tempWheelCustom)
					end
				elseif v.id == "xenon" then
					if config.mechanics[index].modsavailable[v.id] then
						local data = {
							id       = v.id,
							name     = v.category,
							maxmods  = #v.colors,
							actived  = -1,
							price    = getPriceMod(v.price),
							multiple = v.multiple or false,
						}
						table.insert(mods, data)
					end
				elseif v.id == "perfomance" then
					if config.mechanics[index].modsavailable[v.id] then
						local data = {
							id       = v.id,
							name     = v.category,
							menu     = v.menu,
							actived  = -1,
							price    = getPriceMod(v.price),
							multiple = v.multiple or false,
						}
						table.insert(mods, data)
					end
				else
					if config.mechanics[index].modsavailable[v.id] then						
						if v.id == 18 then
							modAmount = 2
						end
						local data = {
							id       = v.id,
							name     = v.category,
							maxmods  = modAmount,
							actived  = GetVehicleMod(veh,v.id),
							price    = getPriceMod(v.price),
							multiple = v.multiple,
						}

						if modAmount > 1 then
							table.insert(mods, data)
						end
					end
				end
			end
		end
	end

	if admin then
		for k, v in pairs(config.vehicleCustomsList) do
			local modAmount = GetNumVehicleMods(veh,v.id) + 1
			if v.id == "extra" or v.id == "window" or v.id == "plate" then
				local data = {
					id       = v.id,
					name     = v.category,
					maxmods  = v.maxmods,
					actived  = -1,
					price    = 0,
					multiple = v.multiple or false,
				}
				table.insert(mods, data)
			elseif v.id == "color" then
				local data = {
					id       = v.id,
					name     = v.category,
					menu     = v.menu,
					actived  = -1,
					price    = 0,
					multiple = v.multiple or false,
				}
				table.insert(mods, data)
			elseif v.id == "wheel" then
				local tempWheel = GetVehicleMod(vehicle,23)
				local tempWheelType = GetVehicleWheelType(vehicle)
				local tempWheelCustom = GetVehicleModVariation(vehicle,23)

				local menu = {}

				for _, mdata in pairs(v.menu) do

					local list = {}

                    if IsThisModelABike(GetEntityModel(vehicle)) then
                        if mdata.id ~= "wheeltype" then
                            for m, ldata in pairs(mdata.list) do
                                local maxmods = 0
                                if ldata.id == "wheelcolor" then
                                    maxmods = ldata.maxmods
                                elseif ldata.id == "smoke-colors" or ldata.id == "customtires" or ldata.id == "bulletproof" then
                                    maxmods = 2
                                end

                                local data = {
                                    category = ldata.category,
                                    id       = ldata.id,
                                    price    = getPriceMod(ldata.price),
                                    maxmods  = ldata.maxmods or maxmods
                                }
                                table.insert(list, data)
                            end
                        else
                            local wheelsbike = { 
                                ["wheelfront"] = { "Dianteira", 23 }, 
                                ["wheelback"]  = { "Traseira", 23 }
                            }

                            for cat, wheel in pairs(wheelsbike) do
                                SetVehicleWheelType(vehicle,wheel[2])
                                maxmods = GetNumVehicleMods(vehicle,wheel[2])
    
                                local data = {
                                    category = wheel[1],
                                    id       = cat,
                                    price    = getPriceMod(v.price),
                                    maxmods  = maxmods
                                }
                                table.insert(list, data)
                            end
                        end
                    else
                        for m, ldata in pairs(mdata.list) do
                            local maxmods = 0
                            if ldata.id == "wheelcolor" then
                                maxmods = ldata.maxmods
                            elseif ldata.id == "smoke-colors" or ldata.id == "customtires" or ldata.id == "bulletproof" then
                                maxmods = 2
                            else
                                SetVehicleWheelType(vehicle,ldata.id)
                                maxmods = GetNumVehicleMods(vehicle,23)
                            end

                            local data = {
                                category = ldata.category,
                                id       = ldata.id,
                                price    = getPriceMod(ldata.price),
                                maxmods  = ldata.maxmods or maxmods
                            }
                            table.insert(list, data)
                        end
                    end

					local data = {
						category = mdata.category,
						id       = mdata.id,
						list     = list
					}
					table.insert(menu, data)
				end

				local data = {
					id       = v.id,
					name     = v.category,
					menu     = menu,
					actived  = -1,
					price    = 0,
					multiple = v.multiple or false,
				}
				table.insert(mods, data)
				SetVehicleWheelType(vehicle,tempWheelType)
				SetVehicleMod(vehicle,23,tempWheel,tempWheelCustom)
			elseif v.id == "xenon" then
				local data = {
					id       = v.id,
					name     = v.category,
					maxmods  = #v.colors,
					actived  = -1,
					price    = 0,
					multiple = v.multiple or false,
				}
				table.insert(mods, data)
			elseif v.id == "perfomance" then
				local data = {
					id       = v.id,
					name     = v.category,
					menu     = v.menu,
					actived  = -1,
					price    = 0,
					multiple = v.multiple or false,
				}
				table.insert(mods, data)
			else
				if v.id == 18 then
					modAmount = 2
				end
				local data = {
					id       = v.id,
					name     = v.category,
					maxmods  = modAmount,
					actived  = GetVehicleMod(veh,v.id),
					price    = 0,
					multiple = v.multiple,
				}

				if modAmount > 1 then
					table.insert(mods, data)
				end
			end
		end
	end

	return mods
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getPriceMod
-----------------------------------------------------------------------------------------------------------------------------------------
function getPriceMod(price)
	if price == nil then
		return nil
	end

	local newprice = price
	
	local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()

	if config.vehiclesprice[vehname] ~= nil then
		newprice = newprice + (newprice * config.vehiclesprice[vehname])
	end

	return newprice
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getVehicleTunning
-----------------------------------------------------------------------------------------------------------------------------------------
function getVehicleTunning(vehicle)
	local vehBoost = {
		boost = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveForce"),
		fuelmix = GetVehicleHandlingFloat(vehicle,"CHandlingData","fDriveInertia"),
		braking = GetVehicleHandlingFloat(vehicle,"CHandlingData","fBrakeBiasFront"),
		drivetrain = GetVehicleHandlingFloat(vehicle,"CHandlingData","fDriveBiasFront"),
		brakeforce = GetVehicleHandlingFloat(vehicle,"CHandlingData","fBrakeForce")
	}

	return vehBoost
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setVehicleTunnig
-----------------------------------------------------------------------------------------------------------------------------------------
function setVehicleTunnig(vehicle,data)
	SetVehicleHandlingFloat(vehicle,"CHandlingData","fDriveInertia",data.fuelmix * 1.0)
	SetVehicleHandlingFloat(vehicle,"CHandlingData","fBrakeForce",data.brakeforce * 1.0)
	SetVehicleHandlingFloat(vehicle,"CHandlingData","fBrakeBiasFront",data.braking * 1.0)
	SetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveForce",data.boost * 1.0)
	SetVehicleHandlingFloat(vehicle,"CHandlingData","fDriveBiasFront",data.drivetrain * 1.0)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setVehicleMods
-----------------------------------------------------------------------------------------------------------------------------------------
function setVehicleMods(veh,myveh)
	SetVehicleModKit(veh,0)
	if not myveh or not myveh.customPcolor then
		return
	end
	local bug = false
	local primary = myveh.color[1]
	local secondary = myveh.color[2]
	local cprimary = myveh.customPcolor
	if cprimary['1'] then
		bug = true
	end
	local csecondary = myveh.customScolor
	local perolado = myveh.extracolor[1]
	local wheelcolor = myveh.extracolor[2]
	local neoncolor = myveh.neoncolor
	local smokecolor = myveh.smokecolor
    if myveh.perfomance ~= nil then
        setVehicleTunnig(veh,myveh.perfomance)
    end
	ClearVehicleCustomPrimaryColour(veh)
	ClearVehicleCustomSecondaryColour(veh)
	SetVehicleWheelType(veh,myveh.wheeltype)
	SetVehicleColours(veh,primary,secondary)
	if bug then
		SetVehicleCustomPrimaryColour(veh,cprimary['1'],cprimary['2'],cprimary['3'])
		SetVehicleCustomSecondaryColour(veh,csecondary['1'],csecondary['2'],csecondary['3'])
	else
		SetVehicleCustomPrimaryColour(veh,cprimary[1],cprimary[2],cprimary[3])
		SetVehicleCustomSecondaryColour(veh,csecondary[1],csecondary[2],csecondary[3])
	end
	SetVehicleExtraColours(veh,perolado,wheelcolor)
	SetVehicleNeonLightsColour(veh,neoncolor[1],neoncolor[2],neoncolor[3])
	SetVehicleXenonLightsColour(veh,myveh.xenoncolor)
	SetVehicleNumberPlateTextIndex(veh,myveh.plateindex)
	SetVehicleWindowTint(veh,myveh.windowtint)
	for i,t in pairs(myveh.mods) do 
		if tonumber(i) == 22 or tonumber(i) == 18 then
			if t.mod > 0 then
				ToggleVehicleMod(veh,tonumber(i),true)
			else
				ToggleVehicleMod(veh,tonumber(i),false)
			end
		elseif tonumber(i) == 20 then
			local r,g,b = tonumber(smokecolor[1]),tonumber(smokecolor[2]),tonumber(smokecolor[3])
			ToggleVehicleMod(veh,20,true)
			SetVehicleTyreSmokeColor(veh,r,g,b)
		elseif tonumber(i) == 23 or tonumber(i) == 24 then
			SetVehicleMod(veh,tonumber(i),tonumber(t.mod),tonumber(t.variation))
		else
			SetVehicleMod(veh,tonumber(i),tonumber(t.mod))
		end
	end
	SetVehicleTyresCanBurst(veh,myveh.bulletProofTyres)
	if myveh.neon then
		for i = 0, 3 do
			SetVehicleNeonLightEnabled(veh,i,true)
		end
	else
		for i = 0, 3 do
			SetVehicleNeonLightEnabled(veh,i,false)
		end
	end
	-- if myveh.damage > 0 then
	-- 	SetVehicleBodyHealth(veh,myveh.damage)
	-- end

end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getNearestVehicles
-----------------------------------------------------------------------------------------------------------------------------------------
function getNearestVehicles(radius)
	local r = {}
	local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)

	for _,veh in pairs(vehs) do
		local x,y,z = table.unpack(GetEntityCoords(veh,true))
		local distance = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
		if distance <= radius then
			r[veh] = distance
		end
	end
	return r
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getNearestVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
function getNearestVehicle(radius)
	local veh
	local vehs = getNearestVehicles(radius)
	local min = radius+0.0001
	for _veh,dist in pairs(vehs) do
		if dist < min then
			min = dist
			veh = _veh
		end
	end
	return veh 
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- f
-----------------------------------------------------------------------------------------------------------------------------------------
local function f(n)
	return (n + 0.00001)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PointCamAtBone
-----------------------------------------------------------------------------------------------------------------------------------------
local function PointCamAtBone(bone,ox,oy,oz)
	SetCamActive(cam, true)
	local veh = vehicle
	local b = GetEntityBoneIndexByName(veh, bone)
	if b and b > -1 then
		local bx,by,bz = table.unpack(GetWorldPositionOfEntityBone(veh, b))
		local ox2,oy2,oz2 = table.unpack(GetOffsetFromEntityGivenWorldCoords(veh, bx, by, bz))
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(veh, ox2 + f(ox), oy2 + f(oy), oz2 +f(oz)))
		SetCamCoord(cam, x, y, z)
		PointCamAtCoord(cam,GetOffsetFromEntityInWorldCoords(veh, 0, oy2, oz2))
		RenderScriptCams( 1, 1, 1000, 0, 0)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MoveVehCam
-----------------------------------------------------------------------------------------------------------------------------------------
local function MoveVehCam(pos,x,y,z)
	SetCamActive(cam, true)
	local veh = vehicle
	local vx,vy,vz = table.unpack(GetEntityCoords(veh))
	local d = GetModelDimensions(GetEntityModel(veh))
	local length,width,height = d.y*-2, d.x*-2, d.z*-2
	local ox,oy,oz
	if pos == 'front' then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, f(x), (length/2)+ f(y), f(z)))
	elseif pos == "front-top" then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, f(x), (length/2) + f(y),(height) + f(z)))
	elseif pos == "back" then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, f(x), -(length/2) + f(y),f(z)))
	elseif pos == "back-top" then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, f(x), -(length/2) + f(y),(height/2) + f(z)))
	elseif pos == "left" then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, -(width/2) + f(x), f(y), f(z)))
	elseif pos == "right" then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, (width/2) + f(x), f(y), f(z)))
	elseif pos == "middle" then
		ox,oy,oz= table.unpack(GetOffsetFromEntityInWorldCoords(veh, f(x), f(y), (height/2) + f(z)))
	end
	SetCamCoord(cam, ox, oy, oz)
	PointCamAtCoord(cam,GetOffsetFromEntityInWorldCoords(veh, 0, 0, f(0)))
	RenderScriptCams( 1, 1, 1000, 0, 0)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- camControl
-----------------------------------------------------------------------------------------------------------------------------------------
function camControl(modtype)
	if modtype == 1 or modtype == 6 or modtype == 42 then
		MoveVehCam('front',-0.6,1.5,0.4)
	elseif modtype == "cor-primaria" or modtype == "cor-secundaria" or modtype == 48 then
		MoveVehCam('middle',-2.6,2.5,1.4)
	elseif  modtype == 2  or modtype == 4 then
		MoveVehCam('back',-0.5,-1.5,0.2)
	elseif modtype == 7 then
		MoveVehCam('front-top',-0.5,1.3,1.0)
	elseif modtype == 10 then
		MoveVehCam('middle',-2.2,2,1.5)
	elseif modtype == "window" then
		MoveVehCam('middle',-2.0,2,0.5)
	elseif modtype == 22 then
		MoveVehCam('front',-0.6,1.3,0.6)
	elseif modtype == "plate" then
		MoveVehCam('back',0,-1,0.2)
	elseif modtype == 8 then
		MoveVehCam('left',-1.8,-1.3,0.7)
	elseif modtype == 3 then
		MoveVehCam('left',-1.8,-1.3,0.7)
	elseif modtype == 0 then
		MoveVehCam('back',0.5,-1.6,1.3)
	elseif modtype == 24 then
		PointCamAtBone("wheel_lr",-1.4,0,0.3)
	elseif modtype == 23 or modtype == "wheel" then
		PointCamAtBone("wheel_lf",-1.4,0,0.3)
	elseif modtype == "neon" or modtype == "neon-colors" or modtype == 15 then
		if not IsThisModelABike(GetEntityModel(vehicle)) then
			PointCamAtBone("neon_l",-2.0,2.0,0.4)
		end
	elseif modtype == 46 or modtype == 27 or modtype == 28 or modtype == 29 or modtype == 30 or modtype == 32 or modtype == 5 then
		MoveVehCam('back-top',0.0,4.0,0.7)
	elseif modtype == 31 then
		SetVehicleDoorOpen(vehicle, 0, 0, 0)
		SetVehicleDoorOpen(vehicle, 1, 0, 0)
		doorsopen = true
	else
        if IsCamActive(cam) then
            MoveVehCam('front-top',-0.5,1.3,1.0)
        end
		if doorsopen then
			SetVehicleDoorShut(vehicle, 0, 0)
			SetVehicleDoorShut(vehicle, 1, 0)
			SetVehicleDoorShut(vehicle, 4, 0)
			SetVehicleDoorShut(vehicle, 5, 0)
			doorsopen = false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ResetCam
-----------------------------------------------------------------------------------------------------------------------------------------
function ResetCam()
	SetCamCoord(cam,GetGameplayCamCoords())
	SetCamRot(cam, GetGameplayCamRot(2), 2)
	RenderScriptCams( 0, 1, 1000, 0, 0)
	SetCamActive(gameplaycam, true)
	EnableGameplayCam(true)
	SetCamActive(cam, false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- freeCam
-----------------------------------------------------------------------------------------------------------------------------------------
function freeCam()
    SetNuiFocus(false,false)
    ResetCam()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- resetfreecam
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("resetfreecam", function(source, args, rawCommand)
    if freecam then
        freecam = false
        SetNuiFocus(true,true)
    end
end)
RegisterKeyMapping("resetfreecam","Resetar camera livre","keyboard","H")
-----------------------------------------------------------------------------------------------------------------------------------------
-- playSound
-----------------------------------------------------------------------------------------------------------------------------------------
function playSound(sound,volume)
	SendNUIMessage({ action = "playSound", sound = sound, volume = volume })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- updateCart
-----------------------------------------------------------------------------------------------------------------------------------------
function updateCart()
	local total = 0
	local ncartlist = {}
	for k, v in pairs(cart) do
		total = total + v.price

		for _,mod in pairs(config.vehicleCustomsList) do
			if k == mod.id then
				local data = {
					name  = mod.category,
					price = v.price
				}
				table.insert(ncartlist, data)
			end
		end

		if k == "colorpaint1" or k == "customcolorpaint1" then
			local data = {
				name  = "Cor Primária",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "colorpaint2" or k == "customcolorpaint2" then
			local data = {
				name  = "Cor Secundária",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "pearly" then
			local data = {
				name  = "Cor Perolada",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "wheeltype" then
			local data = {
				name  = "Rodas",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

        if k == "wheelfront" then
			local data = {
				name  = "Roda Dianteira",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

        if k == "wheelback" then
			local data = {
				name  = "Roda Traseira",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "smoke-colors" then
			local data = {
				name  = "Fumaça",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "customtires" then
			local data = {
				name  = "Tiras do Pneus",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "wheelcolor" then
			local data = {
				name  = "Cor Roda",
				price = v.price
			}
			table.insert(ncartlist, data)
		end

		if k == "bulletproof" then
			local data = {
				name  = "Blindagem Pneus",
				price = v.price
			}
			table.insert(ncartlist, data)
		end
	end

	cartlist = ncartlist

	SendNUIMessage({ action = "updateCart", cartlist = cartlist, total = total })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getVehicleInDirection
-----------------------------------------------------------------------------------------------------------------------------------------
function getVehicleInDirection(coordsfrom,coordsto)
	local handle = CastRayPointToPoint(coordsfrom.x,coordsfrom.y,coordsfrom.z,coordsto.x,coordsto.y,coordsto.z,10,PlayerPedId(),false)
	local a,b,c,d,vehicle = GetRaycastResult(handle)
	return vehicle
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- drawTxt
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- round
-----------------------------------------------------------------------------------------------------------------------------------------
function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5)
end

Citizen.CreateThread(function()
	while true do
		local idle = 2000

		local ped = PlayerPedId()
		local vehicles = getNearestVehicles(10)

		for vehicle, dist in pairs(vehicles) do
            local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
			local plate   = tostring(GetVehicleNumberPlateText(vehicle))
			      plate   = string.gsub(plate, '^%s*(.-)%s*$', '%1')

			if vsettingssync[vehname..plate] ~= nil then
				idle = 1
				if vsettingssync[vehname..plate]['wheeloffset'] ~= nil then
					if vsettingssync[vehname..plate]['wheeloffset'].wheel0 ~= nil then
						SetVehicleWheelXOffset(vehicle,0,tonumber(vsettingssync[vehname..plate]['wheeloffset'].wheel0))
					end
					if vsettingssync[vehname..plate]['wheeloffset'].wheel1 ~= nil then
						SetVehicleWheelXOffset(vehicle,1,tonumber(vsettingssync[vehname..plate]['wheeloffset'].wheel1))
					end
					if vsettingssync[vehname..plate]['wheeloffset'].wheel2 ~= nil then
						SetVehicleWheelXOffset(vehicle,2,tonumber(vsettingssync[vehname..plate]['wheeloffset'].wheel2))
					end
					if vsettingssync[vehname..plate]['wheeloffset'].wheel3 ~= nil then
						SetVehicleWheelXOffset(vehicle,3,tonumber(vsettingssync[vehname..plate]['wheeloffset'].wheel3))
					end
				end

				if vsettingssync[vehname..plate]['wheelrotation'] ~= nil then
					if vsettingssync[vehname..plate]['wheelrotation'].wheel0 ~= nil then
						SetVehicleWheelYRotation(vehicle,0,tonumber(vsettingssync[vehname..plate]['wheelrotation'].wheel0))
					end
					if vsettingssync[vehname..plate]['wheelrotation'].wheel1 ~= nil then
						SetVehicleWheelYRotation(vehicle,1,tonumber(vsettingssync[vehname..plate]['wheelrotation'].wheel1))
					end
					if vsettingssync[vehname..plate]['wheelrotation'].wheel2 ~= nil then
						SetVehicleWheelYRotation(vehicle,2,tonumber(vsettingssync[vehname..plate]['wheelrotation'].wheel2))
					end
					if vsettingssync[vehname..plate]['wheelrotation'].wheel3 ~= nil then
						SetVehicleWheelYRotation(vehicle,3,tonumber(vsettingssync[vehname..plate]['wheelrotation'].wheel3))
					end
				end
			end
		end

		if not checklicense then
			checklicense = true
		end

		Citizen.Wait(idle)
	end
end)