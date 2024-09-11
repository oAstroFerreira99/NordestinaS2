local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("nation_skinshop")
fclient = {}
Tunnel.bindInterface("nation_skinshop", fclient)


---------------------------------------------------------------------------
-----------------------ANIMAÇÃO DE PARADO---------------------------
---------------------------------------------------------------------------

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

function freezeAnim(dict, anim, flag, keep)
    if not keep then
        ClearPedTasks(PlayerPedId())
    end
    LoadAnim(dict)
    TaskPlayAnim(PlayerPedId(), dict, anim, 2.0, 2.0, -1, flag or 1, 0, false, false, false)
    RemoveAnimDict(dict)
end

handsUp = false
handsup = function()
    handsUp = not handsUp
    if handsUp then
        freezeAnim("random@mugging3", "handsup_standing_base", 49)
    else
        freezeAnim("move_f@multiplayer", "idle")
    end
end



---------------------------------------------------------------------------
-----------------------CÂMERAS--------------------------
---------------------------------------------------------------------------

local cameras = {
    body = { coords = vec3(0.4, 2.1, 0.9), point = vec3(-0.7,-0.1,-0.2) }, 
    head = { coords = vec3(0.0, 0.7, 0.8), point = vec3(-0.1,0.0,0.6) },
    chest = { coords = vec3(0.0, 1.4, 0.7), point = vec3(-0.4,0.0,0.2) },
    legs = { coords = vec3(0.0, 1.3, 0.2), point = vec3(-0.4,0.0,-0.5) },
    feet = { coords = vec3(0.0, 0.8, -0.5), point = vec3(-0.25,0.0,-1.0) }
}


componentCams = {
    ["masks"] = "head",
    ["torsos"] = "chest",
    ["legs"] = "legs",
    ["bags"] = "chest",
    ["shoes"] = "feet",
    ["accessories"] = "body",
    ["undershirts"] = "chest",
    ["bodyArmors"] = "chest",
    ["decals"] = "body",
    ["tops"] = "chest",
    ["hats"] = "head",
    ["glasses"] = "head",
    ["ears"] = "head",
    ["watches"] = "legs",
    ["bracelets"] = "legs",
}

local activeCam

function interpCamera(cameraName)
    if cameras[cameraName] then
        if cameraName == activeCam then return end
        activeCam = cameraName
        local ped = PlayerPedId()
        local cam = cameras[cameraName]
        local coord = GetOffsetFromEntityInWorldCoords(ped,cam.coords)
        local tempCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coord, 0,0,0, 50.0)
        local pointCoords = GetOffsetFromEntityInWorldCoords(ped,cam.point)
        SetCamActive(tempCam, true)
        SetCamActiveWithInterp(tempCam, fixedCam, 600, true, true)
        PointCamAtCoord(tempCam, pointCoords)
        CreateThread(function()
            Wait(600)
            DestroyCam(fixedCam)
            fixedCam = tempCam
        end)
    end
end


function createCamera()
    local ped = PlayerPedId()
    local groundCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    if store and store.coords then
        SetEntityCoords(ped, store.coords.x, store.coords.y, store.coords.z-0.97)
        if store.h then
            SetEntityHeading(ped, store.h)
        end
    end
    AttachCamToEntity(groundCam, ped, 0.5, -1.6, 0.0)
    SetCamRot(groundCam, 0, 0.0, 0.0)
    SetCamActive(groundCam, true)
    RenderScriptCams(true, false, 1, true, true)
    activeCam = "body"
    local cam = cameras[activeCam]
    local coord = GetOffsetFromEntityInWorldCoords(ped,cam.coords)
    fixedCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coord, 0,0,0, 50.0)
    local pointCoords = GetOffsetFromEntityInWorldCoords(ped,cam.point)
    PointCamAtCoord(fixedCam, pointCoords)
    SetCamActive(fixedCam, true)
    SetCamActiveWithInterp(fixedCam, groundCam, 1000, true, true)
    CreateThread(function()
        Wait(1000)
        DestroyCam(groundCam)
    end)
end

---------------------------------------------------------------------------
-----------------------DEIXAR OUTROS PLAYERS INVISÍVEIS--------------------------
---------------------------------------------------------------------------

function setPlayersVisible(bool)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, not bool)
    SetEntityInvincible(ped, false)--mqcu
    if bool then
        for _, player in ipairs(GetActivePlayers()) do
            local otherPlayer = GetPlayerPed(player)
            if ped ~= otherPlayer then
                SetEntityVisible(otherPlayer, bool)
            end
        end
    else
        CreateThread(function()
            while inMenu do
                for _, player in ipairs(GetActivePlayers()) do
                    local otherPlayer = GetPlayerPed(player)
                    if ped ~= otherPlayer then
                        SetEntityVisible(otherPlayer, bool)
                    end
                end
                InvalidateIdleCam()
                Wait(1)
            end
        end)
    end
end






---------------------------------------------------------------------------
-----------------------LOJAS DE ROUPAS--------------------------
---------------------------------------------------------------------------


defaultPrices = {
    ["masks"] = 50,
    ["torsos"] = 20,
    ["legs"] = 200,
    ["bags"] = 150,
    ["shoes"] = 200,
    ["accessories"] = 90,
    ["undershirts"] = 100,
    ["bodyArmors"] = 300,
    ["decals"] = 50,
    ["tops"] = 300,
    ["hats"] = 120,
    ["glasses"] = 180,
    ["ears"] = 40,
    ["watches"] = 40,
    ["bracelets"] = 35,
}



customClothes = {
    ["test"] = {
        ['tops'] = {
            male = {
                defaultPrice = 500,
                type = "insert",
                [0] = true,
                [1] = true,
                [2] = 1000,
                [3] = true,
            }
        },

        ['glasses'] = {
            male = {
                defaultPrice = 500,
                type = "insert",
                [1] = { price = 250,
                    textures = {
                        [0] = { blocked = true }
                    }
                },
            }
        },

        ['legs'] = {
            male = {
                type = "remove",
                [0] = 5000,
                [1] = true,
                [2] = true,
                [3] = true,
            }
        },
    },


}


function format(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end


function isCloth(index, value)
    return type(index) == "number" and type(value) == "table" -- verificar se está acessando o indice de uma roupa
end

isComponentBlocked = function(id, component)
    --if component == "bodyArmors" then return true end
    return customClothes[id] and customClothes[id][component] and customClothes[id][component].blocked
end

isClothBlocked = function(id, component, index, gender)
    if customClothes[id] and customClothes[id][component] and customClothes[id][component][gender] then
        local c = customClothes[id][component][gender]
        return (c.type == "insert" and (not c[index] or (type(c[index]) == "table" and c[index].blocked))) or (c.type == "remove" and c[index] and (type(c[index]) == "boolean" or (type(c[index]) == "table" and c[index].blocked)))
    end
    return false
end

getBlockedComponentTextures = function(cloth, id, component, index, gender)
    for i = 0, cloth.textures do
        if not cloth[i] then
            cloth[i] = { blocked = false }
        else
            cloth[i].blocked = false
        end
        if customClothes[id] and customClothes[id][component] and customClothes[id][component][gender] and customClothes[id][component][gender][index] then
            local c = customClothes[id][component][gender][index]
            if type(c) == "table" and c.textures and c.textures[i] then
                cloth[i].blocked =  c.textures[i].blocked
            end
        end
    end
    return cloth
end

getClothPrice = function(id, component, index, gender)
    if id == "nation_creator" then return 0 end
    if customClothes[id] and customClothes[id][component] and customClothes[id][component][gender] then
        local c = customClothes[id][component][gender]
        if c[index] then
            local price = c[index]
            if type(price) == "table" then
                price = price.price or c.defaultPrice or defaultPrices[component]
            elseif type(price) == "boolean" then
                price = c.defaultPrice
            end
            return price
        else 
            return c.defaultPrice or defaultPrices[component]
        end
    end
    return defaultPrices[component]
end



getClothes = function(id)
    local clothes = getAllClothes()
    local gender = getGender()
    for component, v in pairs(clothes) do
        v.blocked = isComponentBlocked(id, component)
        for index, j in pairs(v) do
            if isCloth(index, j) then 
                j.price = getClothPrice(id, component, index, gender)
                j.blocked = isClothBlocked(id, component, index, gender)
                j = getBlockedComponentTextures(j, id, component, index, gender)
            end
        end
    end
    return clothes
end

getCartTotal = function(cart, initialClothes, storeId)
    local total = 0
    local gender = getGender()
    for component, index in pairs(cart) do
        if initialClothes[component] then
            local i = initialClothes[component][1]
            if index >= 0 and index ~= i then
                total = total + getClothPrice(storeId, component, index, gender)
            end
        end
    end
    return math.floor(total)
end


getPopupText = function(total) -- TEXTO QUE VAI APARECER NO POPUP NA HORA DE COMPRAR
    return "você deseja pagar o valor de $ <b>"..format(total or 0).."</b> ?"
end

skinshops = {
    [1] = {
        clothes = getClothes, permission = nil, coords = vec3(73.27, -1397.01, 29.67), h = 2.84, blip = false
    },
    [2] = {
        clothes = getClothes, permission = nil, coords = vec3(-710.018, -153.072, 37.1), blip = true
    },
    [3] = {
        clothes = getClothes, permission = nil, coords = vec3(-163.261, -302.83, 39.733)
    },
    [4] = {
        clothes = getClothes, permission = nil, coords = vec3(427.68, -802.35, 29.79)
    },
    [5] = {
        clothes = getClothes, permission = nil, coords = vec3(-827.03, -1073.49, 11.63)
    },
    [6] = {
        clothes = getClothes, permission = nil, coords = vec3(-1450.32, -237.514, 49.81)
    },
    [7] = {
        clothes = getClothes, permission = nil, coords = vec3(9.14, 6514.21, 32.17)
    },
    [8] = {
        clothes = getClothes, permission = nil, coords = vec3(125.112, -223.696, 54.557)
    },
    [10] = {
        clothes = getClothes, permission = nil, coords = vec3(-1105.96, 2709.55, 19.39)
    },
    [11] = {
        clothes = getClothes, permission = nil, coords = vec3(-3170.66, 1043.62, 20.86)
    },
    [12] = {
        clothes = getClothes, permission = nil, coords = vec3(1192.71, 2711.71, 38.52)
    },
    [13] = {
        clothes = getClothes, permission = nil, coords = vec3(615.23, 2763.42, 42.08)
    },
    [14] = {
        clothes = getClothes, permission = nil, coords = vec3(1694.6,4826.85, 42.36)
    },
    [15] = {
        clothes = getClothes, permission = nil, coords = vec3(-1192.61, -768.61, 17.32)
    },
    [16] = {
        clothes = getClothes, permission = nil, coords = vec3(1372.34, -104.4, 124.78)
    },
    [17] = {
        clothes = getClothes, permission = nil, coords = vec3(474.46, -1085.5, 38.7)
    },
    [18] = {
        clothes = getClothes, permission = {"Policia", "waitPolice"}, coords = vec3(-313.06,-1060.6,28.34) --departamento de policia
    },
    [19] = {
        clothes = getClothes, permission = nil, coords = vec3(300.7, -597.32, 43.29) 
    },
    [20] = {
        clothes = getClothes, permission = nil, coords = vec3(80.42,-1400.08,29.37), blip = true  --loja de roupa perto do vanila
    },
    [19] = {
        clothes = getClothes, permission = nil, coords = vec3(75.02,-1400.26,29.37), blip = true  --loja de roupa perto do vanila
    },
    [20] = {
        clothes = getClothes, permission = {"Hospital", "waitParamedic"}, coords = vec3(-447.13,-1034.4,33.68), blip = true  --loja de roupa perto do vanila
    },
    [22] = {
        clothes = getClothes, permission = nil, coords = vec3(-796.24,-2604.81,17.25), blip = true  --Mecanica
    },
    [25] = {
        clothes = getClothes, permission = nil, coords = vec3(-934.24,5748.85,5.59), blip = true  --Loja festa na praia
    },
    [27] = {
        clothes = getClothes, permission = nil, coords = vec3(-788.46,338.73,243.38), blip = true  --Mansao 11
    },
    [29] = {
        clothes = getClothes, permission = nil, coords = vec3(-3653.49,-1344.79,4.52), blip = true  --nudismo
    },
    [30] = {
        clothes = getClothes, permission = nil, coords = vec3(-1044.92,-3466.07,14.32), blip = true  --kart
    }, 
    [31] = {
        clothes = getClothes, permission = nil, coords = vec3(-1424.9,-457.25,35.91), blip = true  
    }, 
    [32] = {
        clothes = getClothes, permission = nil, coords = vec3(816.48,-887.2,25.68), blip = true  --kart
    }, 
    [33] = {
        clothes = getClothes, permission = nil, coords = vec3(-2034.69,-510.32,12.22), blip = true  --Mec
    }, 
    [34] = {
        clothes = getClothes, permission = nil, coords = vec3(368.09,-1602.19,29.28), blip = true  --DP
    },
    [35] = {
        clothes = getClothes, permission = nil, coords = vec3(605.39,-6.11,87.82), blip = true  --DP2
    },
    [36] = {
        clothes = getClothes, permission = nil, coords = vec3(1836.27,2572.12,46.02), blip = true  --dp presidio
    },
    ["admin"] = {
        clothes = getClothes
    },

    ["nation_creator"] = {
        clothes = getClothes
    },
}

RegisterNetEvent("skinshop:openShop")
AddEventHandler("skinshop:openShop", function()
    toggleMenu("admin")
end)  

nearestSkinshops = {}
mainThread = function()
    local getNearestSkinshops = function()
        while true do
            if not inMenu then
                local myCoords = GetEntityCoords(PlayerPedId())
                for k,v in pairs(skinshops) do
                    if v and v.coords then
                        local distance = #(myCoords - v.coords)
                        if nearestSkinshops[k] then
                            if distance > 10 then
                                nearestSkinshops[k] = nil
                            end
                        else
                            if distance <= 10 then
                                nearestSkinshops[k] = v
                            end
                        end
                    end
                end
            end
            Wait(500)
        end
    end

   -- addBlips()
    CreateThread(getNearestSkinshops)

    while true do
        local idle = 500
        local ped = PlayerPedId()
        local myCoords = GetEntityCoords(ped)
        if not inMenu then
            for skinShopId, v in pairs(nearestSkinshops) do
                if v and v.coords and GetEntityHealth(ped) > 101 then 
                    idle = 0 
                    local coords = v.coords
                    DrawMarker(30,coords.x, coords.y, coords.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,111, 0, 255,50,0,0,0,1)
                    local distance = #(myCoords - v.coords)
                    if IsDisabledControlJustPressed(0,38) and distance < 1.5 then
                        if v.permission then
                            if func.checkPermission(v.permission) then
                                toggleMenu(skinShopId)
                            end
                        else
                            toggleMenu(skinShopId)
                        end
                    end
                end
            end
        end
        Wait(idle)
    end
end



function addBlips()
    for _, v in pairs(skinshops) do
        local coords = v.coords
        if coords and v.blip ~= false then
            local blip = AddBlipForCoord(coords)
            SetBlipSprite(blip, v.id or 73)
            SetBlipColour(blip, v.color or 13)
            SetBlipScale(blip, 0.4)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.name or "Loja de Roupas")
            EndTextCommandSetBlipName(blip)
        end
    end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.45, 0.45)
    SetTextFont(6)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end


RegisterCommand('skinshop',function() -- COMANDO DE ADMIN
    if func.checkPermission({"Admin", "Mod"}) then
        toggleMenu("admin")
    end
end)


RegisterNetEvent("nation_skinshop:toggleMenu")
AddEventHandler("nation_skinshop:toggleMenu", function(menu)
    toggleMenu(menu)
end)






--------- CREATIVE V3 ------------
mySkinData = {}

local skinData = {
	["pants"] = "legs",
	["arms"] = "torsos",
	["tshirt"] = "undershirts",
	["torso"] = "tops",
	["vest"] = "bodyArmors",
	["backpack"] = "bags",
	["shoes"] = "shoes",
	["mask"] = "masks",
	["hat"] = "hats",
	["glass"] = "glasses",
	["ear"] = "ears",
	["watch"] = "watches",
	["bracelet"] = "bracelets",
	["accessory"] = "accessories",
	["decals"] = "decals"
}



function fclient.getCloths()
    local myCloths = getMyClothes()
    local cloths = {}
    for cloth, comp in pairs(skinData) do
        local item = myCloths[comp][1]
        local texture = myCloths[comp][2]
        cloths[cloth] = { item = item, texture = texture }
    end
    mySkinData = cloths
    return cloths
end

-- Server -----------•  ************************* -----------------------------------------------------------------------------------------------------------------------
-- VROUPAS -- Server -----------•  ************************* ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Server -----------•  ************************* -----------------------------------------------------------------------------------------------------------------------
local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>" 
            end

            player_customs[source] = true
            vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 250px; margin-top: 200px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
        end
    end
end)

--[[function resetClothing(data)
	local ped = PlayerPedId()

	SetPedComponentVariation(ped,4,data["pants"].item,data["pants"].texture,2)
	SetPedComponentVariation(ped,3,data["arms"].item,data["arms"].texture,2)
	SetPedComponentVariation(ped,8,data["t-shirt"].item,data["t-shirt"].texture,2)
	SetPedComponentVariation(ped,9,data["vest"].item,data["vest"].texture,2)
	SetPedComponentVariation(ped,11,data["torso2"].item,data["torso2"].texture,2)
	SetPedComponentVariation(ped,6,data["shoes"].item,data["shoes"].texture,2)
	SetPedComponentVariation(ped,1,data["mask"].item,data["mask"].texture,2)
	SetPedComponentVariation(ped,10,data["decals"].item,data["decals"].texture,2)
	SetPedComponentVariation(ped,7,data["accessory"].item,data["accessory"].texture,2)
	SetPedComponentVariation(ped,5,data["bag"].item,data["bag"].texture,2)

	if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
		SetPedPropIndex(ped,0,data["hat"].item,data["hat"].texture,2)
	else
		ClearPedProp(ped,0)
	end

	if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
		SetPedPropIndex(ped,1,data["glass"].item,data["glass"].texture,2)
	else
		ClearPedProp(ped,1)
	end

	if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
		SetPedPropIndex(ped,2,data["ear"].item,data["ear"].texture,2)
	else
		ClearPedProp(ped,2)
	end

	if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
		SetPedPropIndex(ped,6,data["watch"].item,data["watch"].texture,2)
	else
		ClearPedProp(ped,6)
	end

	if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
		SetPedPropIndex(ped,7,data["bracelet"].item,data["bracelet"].texture,2)
	else
		ClearPedProp(ped,7)
	end
end

RegisterNetEvent("updateRoupas")
AddEventHandler("updateRoupas",function(custom)
	mySkinData = custom
	resetClothing(custom)
	func.updateClothes()
end)]]





--------- NYO GUARDA ROUPAS ------------

--[[ local skinData = {
	["legs"] = 4,
	["torsos"] = 3,
	["undershirts"] = 8,
	["tops"] = 11,
	["bodyArmors"] = 9,
	["bags"] = 5,
	["shoes"] = 6,
	["masks"] = 1,
	["hats"] = "p0",
	["glasses"] = "p1",
	["ears"] = "p2",
	["watches"] = "p7",
	["bracelets"] = "p7",
	["accessories"] = 7,
	["decals"] = 10
}



function fclient.getCloths()
    local myCloths = getMyClothes()
    local cloths = {}
    for cloth, comp in pairs(skinData) do
        local item = myCloths[cloth][1]
        local texture = myCloths[cloth][2]
        cloths[comp] = { item, texture }
    end
    return cloths
end





 ]]