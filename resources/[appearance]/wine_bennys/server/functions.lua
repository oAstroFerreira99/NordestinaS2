-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy  = module("vrp","lib/Proxy")
local Tools  = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- variabless
-----------------------------------------------------------------------------------------------------------------------------------------
local blips   = {}
local queries = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- database set
-----------------------------------------------------------------------------------------------------------------------------------------
DB = {}

DB.prepare = function(name, query)
    queries[name] = query
end

DB.execute = function(name, params)
    local query = queries[name]

    if query == nil then
        query = name
    end

    local r = asynclib()
    if config.DBConector == "GHMattiMySQL" then
        if query == nil then
            local _params = {}
            _params._ = true

            for k,v in pairs(params) do
                _params["@"..k] = v
            end

            params = _params
        end

        exports['GHMattiMySQL']:QueryAsync(query, params, function(affected)
            r(affected or 0)
        end)
    elseif config.DBConector == "ghmattimysql" then
        exports.ghmattimysql:execute(query, params, function(data)
            r(data.affectedRows or 0)
        end)
    elseif config.DBConector == "oxmysql" then
        exports.oxmysql:execute(query, params, function(data)
            r(data or 0)
        end)
    else
        exports.oxmysql:execute(query, params, function(data)
            r(data or 0)
        end)
    end

    return r:wait()
end

DB.query = function(name, params)
    local query = queries[name]

    if query == nil then
        query = name
    end

    local rows = {}
    
    if config.DBConector == "GHMattiMySQL" then
        if query == nil then
            local _params = {}
            _params._ = true

            for k,v in pairs(params) do
                _params["@"..k] = v
            end

            params = _params
        end

        local r = asynclib()

        exports['GHMattiMySQL']:QueryResultAsync(query, params, function(rows)
            r(rows,#rows)
        end)

        rows = r:wait()
    elseif config.DBConector == "ghmattimysql" then
        rows = exports.ghmattimysql:executeSync(query, params)
    elseif config.DBConector == "oxmysql" then
        rows = exports.oxmysql:executeSync(query, params)
    else
        rows = exports.oxmysql:executeSync(query, params)
    end
    return rows
end

DB.insert = function(name, params)
    local query = queries[name]

    if query == nil then
        query = name
    end

    local r = asynclib()
    if config.DBConector == "ghmattimysql" then
        exports.ghmattimysql:executeSync(query, params, function(id)
            r(id or 0)
        end)
    elseif config.DBConector == "oxmysql" then
        exports.oxmysql:insert(query, params, function(id)
            r(id or 0)
        end)
    else
        exports.oxmysql:insert(query, params, function(id)
            r(id or 0)
        end)
    end

    return r:wait()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUserSource
-----------------------------------------------------------------------------------------------------------------------------------------
getUserSource = function(user_id)
    return vRP.getUserSource(tonumber(user_id))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUserId
-----------------------------------------------------------------------------------------------------------------------------------------
getUserId = function(source)
    return vRP.getUserId(source)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUserIdentity
-----------------------------------------------------------------------------------------------------------------------------------------
getUserIdentity = function(user_id)
    return vRP.getUserIdentity(user_id)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUserFullName
-----------------------------------------------------------------------------------------------------------------------------------------
getUserFullName = function(user_id)
    local identity = getUserIdentity(user_id)
    if identity ~= nil then
        local name = identity.name.." "..identity.name2
        return name
    else
        return "Sem Nome"
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUserPhone
-----------------------------------------------------------------------------------------------------------------------------------------
getUserPhone = function(user_id)
    local identity = getUserIdentity(user_id)
    if identity ~= nil then
    return identity.telefone
    else
        return "000-000"
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUsers
-----------------------------------------------------------------------------------------------------------------------------------------
getUsers = function()
    return vRP.Players()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getHasPermission
-----------------------------------------------------------------------------------------------------------------------------------------
getHasPermission = function(user_id, perm)
    return vRP.hasPermission(user_id,perm)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getHasGroup
-----------------------------------------------------------------------------------------------------------------------------------------
getHasGroup = function(user_id, group)
    return vRP.hasGroup(user_id,group)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getGroupTitle
-----------------------------------------------------------------------------------------------------------------------------------------
getGroupTitle = function(group)
    return vRP.getGroupTitle(group)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- addUserGroup
-----------------------------------------------------------------------------------------------------------------------------------------
addUserGroup = function(user_id, group)
    return vRP.addUserGroup(user_id, group)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- remUserGroup
-----------------------------------------------------------------------------------------------------------------------------------------
remUserGroup = function(user_id, group)
    return vRP.removeUserGroup(user_id, group)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getProfission
-----------------------------------------------------------------------------------------------------------------------------------------
getProfission = function(user_id)
    local profission = 'A mais procurada'
    local primary    = vRP.getUserGroupByType(user_id,'org')
    local hie        = vRP.getUserGroupByType(user_id,'hie')

    if primary ~= '' then
        profission = primary
    end

    if hie ~= '' then
        profission = hie
    end

    return profission
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- vRP.getUserByRegistration
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.getUserByRegistration = function(plate)
    return vRP.getUserByRegistration(plate)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getModsVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
getModsVehicle = function(name, plate)
    local plate_user = vRP.getUserByRegistration(plate)
    if plate_user then
        local mods = getServerData("custom:u"..plate_user.."veh_"..tostring(name)) or "{}"
        return json.decode(mods) or {}
    end
    return {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setModsVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
setModsVehicle = function(name, plate, mods)
    local plate_user = vRP.getUserByRegistration(plate)
    if plate_user then

        setServerData("custom:u"..plate_user.."veh_"..tostring(name),json.encode(mods))
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getVehicleKits
-----------------------------------------------------------------------------------------------------------------------------------------
getVehicleKits = function(name, plate)
    local kits = {
        camber     = false,
        suspension = false,
        neon       = false
    }

    local plate_user = vRP.getUserByRegistration(plate)
    if plate_user then
        local kit = getServerData("kit:u"..plate_user.."veh_"..tostring(name)) or "{}"
        kit = json.decode(kit) or {}

        if kit.camber then
            kits.camber = true
        end

        if kit.suspension then
            kits.suspension = true
        end

        if kit.neon then
            kits.neon = true
        end
    end
    return kits
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setVehicleKits
-----------------------------------------------------------------------------------------------------------------------------------------
setVehicleKits = function(name, plate, mod)
    local kits = {
        camber     = false,
        suspension = false,
        neon       = false
    }

    local plate_user = vRP.getUserByRegistration(plate)
    if plate_user then
        local kit = getServerData("kit:u"..plate_user.."veh_"..tostring(name)) or "{}"
        kit = json.decode(kit) or {}

        if kit.camber then
            kits.camber = true
        end

        if kit.suspension then
            kits.suspension = true
        end

        if kit.neon then
            kits.neon = true
        end

        if mod == "camber" then
            kits.camber = true
        end

        if mod == "suspension" then
            kits.suspension = true
        end

        if mod == "neon" then
            kits.neon = true
        end

        setServerData("kit:u"..plate_user.."veh_"..tostring(name),json.encode(kits))
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getBankMoney
-----------------------------------------------------------------------------------------------------------------------------------------
getBankMoney = function(user_id)
    return vRP.GetBank(user_id)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- addBankMoney
-----------------------------------------------------------------------------------------------------------------------------------------
addBankMoney = function(user_id, amount)
    local bank  = getBankMoney(user_id)
    local total = bank + amount
    vRP.GiveBank(user_id, tonumber(total))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- remBankMoney
-----------------------------------------------------------------------------------------------------------------------------------------
remBankMoney = function(user_id, amount)
    local bank  = getBankMoney(user_id)
    local total = bank - amount
    vRP.GiveBank(user_id, tonumber(total))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getInventoryItemAmount
-----------------------------------------------------------------------------------------------------------------------------------------
getInventoryItemAmount = function(user_id, item)
    return vRP.getInventoryItemAmount(user_id, item)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- tryGetInventoryItem
-----------------------------------------------------------------------------------------------------------------------------------------
tryGetInventoryItem = function(user_id, item, amount)
    return vRP.tryGetInventoryItem(user_id, item, amount)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getItemName
-----------------------------------------------------------------------------------------------------------------------------------------
getItemName = function(item)
    return vRP.itemNameList(item)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getUserData
-----------------------------------------------------------------------------------------------------------------------------------------
getServerData = function(key)
    return vRP.getSData(key)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setServerData
-----------------------------------------------------------------------------------------------------------------------------------------
setServerData = function(key, data)
    vRP.setSData(key, data)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- openPrompt
-----------------------------------------------------------------------------------------------------------------------------------------
openPrompt = function(source,title,content)
    return vRP.prompt(source, title, content)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendnotify
-----------------------------------------------------------------------------------------------------------------------------------------
sendnotify = function(source, type, message, time)
    if time == nil then
        time = 5000
    end
    if source then 
        TriggerClientEvent("Notify",source,type,message,time)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendprogress
-----------------------------------------------------------------------------------------------------------------------------------------
sendprogress = function(source, time, title)
    if time == nil then
        return
    end
    if source then 
        TriggerClientEvent("progress",source,time,title)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendwebhook
-----------------------------------------------------------------------------------------------------------------------------------------
sendwebhook = function(webhook,data)
    if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
			embeds = data
		}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- numberToInt
-----------------------------------------------------------------------------------------------------------------------------------------
function numberToInt(v)
	local n = tonumber(v)
	if n == nil then 
		return 0
	else
		return math.floor(n)
	end
end