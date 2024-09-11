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
    ["torsos"] = 50,
    ["legs"] = 50,
    ["bags"] = 50,
    ["shoes"] = 50,
    ["accessories"] = 50,
    ["undershirts"] = 50,
    ["bodyArmors"] = 50,
    ["decals"] = 50,
    ["tops"] = 50,
    ["hats"] = 50,
    ["glasses"] = 50,
    ["ears"] = 50,
    ["watches"] = 50,
    ["bracelets"] = 50,
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
        clothes = getClothes, permission = nil, coords = vec3(80.46,-1399.99,29.37), h = 2.84, blip = false
    },
    [2] = {
        clothes = getClothes, permission = nil, coords = vec3(-710.018, -153.072, 37.1), blip = true
    },
    [3] = {
        clothes = getClothes, permission = nil, coords = vec3(-163.261, -302.83, 39.733)
    },
    [4] = {
        clothes = getClothes, permission = nil, coords = vec3(425.51, -806.27, 29.49)
    },
    [5] = {
        clothes = getClothes, permission = nil, coords = vec3(-829.413, -1073.71, 11.5)
    },
    [6] = {
        clothes = getClothes, permission = nil, coords = vec3(-1450.32, -237.514, 49.81)
    },
    [7] = {
        clothes = getClothes, permission = nil, coords = vec3(12.138, 6514.402, 31.877)
    },
    [8] = {
        clothes = getClothes, permission = nil, coords = vec3(125.112, -223.696, 54.557)
    },
    [9] = {
        clothes = getClothes, permission = nil, coords = vec3(-1083.9, -2732.77, 14.6)
    },
    [10] = {
        clothes = getClothes, permission = nil, coords = vec3(-1101.27, 2710.63, 19.1)
    },
    [11] = {
        clothes = getClothes, permission = nil, coords = vec3(-3170.66, 1043.62, 20.86)
    },
    [12] = {
        clothes = getClothes, permission = nil, coords = vec3(1196.81, 2710.16, 38.22)
    },
    [13] = {
        clothes = getClothes, permission = nil, coords = vec3(615.23, 2763.42, 42.08)
    },
    [14] = {
        clothes = getClothes, permission = nil, coords = vec3(1695.64,4829.36,42.08)
    },
    [15] = {
        clothes = getClothes, permission = nil, coords = vec3(-1192.61, -768.61, 17.32)
    },
    [16] = {
        clothes = getClothes, permission = nil, coords = vec3(-26.05,322.16,113.16) -- comprado ?
    },
    [17] = {
        clothes = getClothes, permission = nil, coords = vec3(474.46, -1085.5, 38.7)
    },
    [18] = {
        clothes = getClothes, permission = nil, coords = vec3(86.47,-356.79,98.0) --departamento de policia
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
        clothes = getClothes, permission = {"Paramedic", "waitParamedic"}, coords = vec3(-664.74,322.2,92.74), blip = true  --loja de roupa perto do vanila
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
        clothes = getClothes, permission = nil, coords = vec3(62.21,-1772.16,29.47), blip = true  --Mecânica
    },
    [32] = {
        clothes = getClothes, permission = {"Paramedic", "waitParamedic"}, coords = vec3(-2790.51,-74.98,18.6), blip = true  -- Hospital
    }, 
    [33] = {
        clothes = getClothes, permission = nil, coords = vec3(-557.81,2783.28,47.26), blip = true  -- 4M
    },
    [34] = {
        clothes = getClothes, permission = nil, coords = vec3(1214.93,-265.04,75.81), blip = true  -- Franca
    },
    [35] = {
        clothes = getClothes, permission = nil, coords = vec3(-566.4,280.05,82.97), blip = true  -- Bar CN
    },
    [36] = {
        clothes = getClothes, permission = nil, coords = vec3(-1137.75,365.33,71.31), blip = true  -- Casa CN
    }, 
    [37] = {
        clothes = getClothes, permission = nil, coords = vec3(1243.72,-1078.04,47.55), blip = true  -- Favela do Helipa
    },
    [38] = {
        clothes = getClothes, permission = nil, coords = vec3(100.4,-1310.36,21.13), blip = true  -- Favela do Helipa
    },
    [39] = {
        clothes = getClothes, permission = nil, coords = vec3(902.73,914.05,237.28), blip = true  -- Arma3
    },
    [40] = {
        clothes = getClothes, permission = nil, coords = vec3(-587.32,-1050.27,22.34), blip = true  -- Arma3
    },
    [41] = {
        clothes = getClothes, permission = nil, coords = vec3(-1376.74,-1526.61,4.5), blip = true  -- KidsCafe
    },
    [42] = {
        clothes = getClothes, permission = nil, coords = vec3(-619.34,-296.91,35.33), blip = true  -- Pokecafé
    },
    [43] = {
        clothes = getClothes, permission = nil, coords = vec3(350.51,207.66,98.64), blip = true  -- Cinema
    },
    [44] = {
        clothes = getClothes, permission = nil, coords = vec3(2724.53,3505.15,55.97), blip = true  -- Benys
    },
    [45] = {
        clothes = getClothes, permission = nil, coords = vec3(-1387.58,6776.26,391.51), blip = true  -- bruxa
    },
    [46] = {
        clothes = getClothes, permission = nil, coords = vec3(431.78,9.1,91.93), blip = true  -- COMPRA FEITA -
    },
    [47] = {
        clothes = getClothes, permission = nil, coords = vec3(-1997.32,542.44,118.03), blip = true  -- LOJA DE ROUPA ESCOLA MASC -
    },
    [48] = {
        clothes = getClothes, permission = nil, coords = vec3(-1993.1,559.21,118.05), blip = true  -- LOJA DE ROUPA ESCOLA FEM -
    },
    [49] = {
        clothes = getClothes, permission = nil, coords = vec3(2499.39,-2293.51,95.52), blip = true  -- LOJA DE ROUPA ESCOLA FEM -
    },
    [50] = {
        clothes = getClothes, permission = nil, coords = vec3(2345.83,3332.97,58.11), blip = true  -- ARMA1 --
    },
    [51] = {
        clothes = getClothes, permission = nil, coords = vec3(3460.19,4915.44,39.85), blip = true  -- RUIVA  --
    },
    [52] = {
        clothes = getClothes, permission = nil, coords = vec3(-2333.88,2616.64,8.93), blip = true  -- MERCADO  --
    },
    [53] = {
        clothes = getClothes, permission = nil, coords = vec3(3572.87,2561.73,5.78), blip = true  -- KITSUNES  --
    },
    [54] = {
        clothes = getClothes, permission = nil, coords = vec3(-272.41,195.47,5.54), blip = true  -- HOTEL
    },
    [55] = {
        clothes = getClothes, permission = nil, coords = vec3(-269.09,-731.85,125.46), blip = true  -- mansão dex
    },
    [56] = {
        clothes = getClothes, permission = nil, coords = vec3(2619.72,7872.35,18.52), blip = true
    },
    [57] = {
        clothes = getClothes, permission = nil, coords = vec3(1414.58,4723.22,134.85), blip = false
    },
    [58] = {
        clothes = getClothes, permission = nil, coords = vec3(-1646.33,704.18,206.39), blip = false
    },
    [59] = {
        clothes = getClothes, permission = nil, coords = vec3(758.93,3424.13,67.45), blip = false
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
                    idle = 5 
                    local coords = v.coords
                    
                    DrawText3D(coords.x, coords.y, coords.z, "~w~~b~[Loja de Roupa]\n~w~[E]~w~~b~ PARA ACESSAR")
                    
                    local distance = #(myCoords - v.coords)
                    if IsControlJustPressed(0,38) and distance < 1.5 then
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
            SetBlipScale(blip, 0.5)
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
    if func.checkPermission({"Admin", "Influencer", "Skinshop", "Roupa"}) then
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



function resetClothing(data)
	local ped = PlayerPedId()
    
	SetPedComponentVariation(ped,1,data["mask"].item,data["mask"].texture,2)
	SetPedComponentVariation(ped,3,data["arms"].item,data["arms"].texture,2)
	SetPedComponentVariation(ped,4,data["pants"].item,data["pants"].texture,2)
	SetPedComponentVariation(ped,5,data["backpack"].item,data["backpack"].texture,2)
	SetPedComponentVariation(ped,6,data["shoes"].item,data["shoes"].texture,2)
	SetPedComponentVariation(ped,7,data["accessory"].item,data["accessory"].texture,2)
	SetPedComponentVariation(ped,8,data["tshirt"].item,data["tshirt"].texture,2)
	SetPedComponentVariation(ped,9,data["vest"].item,data["vest"].texture,2)
	SetPedComponentVariation(ped,10,data["decals"].item,data["decals"].texture,2)
	SetPedComponentVariation(ped,11,data["torso"].item,data["torso"].texture,2)

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

RegisterNetEvent("updateRoupass")
AddEventHandler("updateRoupass",function(custom)
	mySkinData = custom
	resetClothing(custom)
	func.updateClothes()
end)





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