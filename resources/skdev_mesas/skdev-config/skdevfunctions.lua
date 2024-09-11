local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")

if baseatual == "Maestriav6" then
    Keyboard = Tunnel.getInterface("keyboard")
    if LoadResourceFile("vrp", "config/Item.lua") ~= nil then
        load(LoadResourceFile("vrp", "config/Item.lua"))()
    end
end
if baseatual == "Maestriav5" or baseatual == "Maestriav4" or baseatual == "Maestriav3" or baseatual == "Maestriav1" then
    if LoadResourceFile("vrp", "lib/itemlist.lua") ~= nil then
        load(LoadResourceFile("vrp", "lib/itemlist.lua"))()
    end
end

function Querybase(param1,param2,param3)
    if baseatual == "Maestriav6" then
        return vRP.Query(param1,param2)
    else
        return vRP.query(param1,param2,execute)
    end
end

function Preparebase(param1,param2)
    if baseatual == "Maestriav6" then
        vRP.Prepare(param1,param2)
    else
        vRP.prepare(param1,param2)
    end
end

function Passportbase(source)
    if baseatual == "Maestriav6" then
        return vRP.Passport(source)
    else
        return vRP.getUserId(source)
    end
end

function HasPermissionbase(user_id,permission,index)
    if baseatual == "Maestriav6" then
        return vRP.HasGroup(user_id,permission,index)
    else
        return vRP.hasPermission(user_id, permission)
    end
end

function Getusersbase()
    if baseatual == "Maestriav6" then
        return vRP.Players()
    elseif baseatual == "Maestriav5" then
        return vRP.userList()
    elseif baseatual == "Maestriav4" then
        return vRP.userList()
    elseif baseatual == "Maestriav1" then
        return vRP.userList()
    else
        return vRP.getUsers()
    end
end

function Getusersbypermissionsbase(permission)
    if baseatual == "vrpex" then
        return vRP.getUsersByPermission(permission)
    end
    if baseatual == "Maestriav1" then
        local tableList = {}
        for user_id,source in pairs(vRP.userList()) do
            if vRP.hasPermission(user_id, permission) then
                table.insert(tableList, user_id)
            end
        end
        return tableList
    end
    if baseatual == "Maestriav2" then
        local tableList = {}
        for user_id,source in pairs(vRP.getUsers()) do
            if vRP.hasPermission(user_id, permission) then
                table.insert(tableList, user_id)
            end
        end
        return tableList
    end
    if baseatual == "Maestriav3" then
        local tableList = {}
        for user_id,source in pairs(vRP.getUsers()) do
            if vRP.hasPermission(user_id, permission) then
                table.insert(tableList, user_id)
            end
        end
        return tableList
    end
    if baseatual == "Maestriav4" then
        local tableList = {}
        for user_id,source in pairs(vRP.userList()) do
            if vRP.hasPermission(user_id, permission) then
                table.insert(tableList, user_id)
            end
        end
        return tableList
    end
    if baseatual == "Maestriav5" then
        return vRP.getUsersByPermission(permission)
    end
    if baseatual == "Maestriav6" then
        local tableList = {}
        for user_id,source in pairs(vRP.Players()) do
            local Passport = vRP.Passport(source)
            if vRP.HasPermission(Passport,permission) then
                table.insert(tableList, Passport)
            end
        end
        return tableList
    end
end

function Identitybase(user_id)
    if baseatual == "Maestriav6" then
        local identidadePlayer = vRP.Identity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.name2, phone = identidadePlayer.phone, registration = identidadePlayer.serial}
        end
    end
    if baseatual == "Maestriav5" then
        local identidadePlayer = vRP.userIdentity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.name2, phone = identidadePlayer.phone, registration = identidadePlayer.serial}
        end
    end
    if baseatual == "Maestriav4" then
        local identidadePlayer = vRP.userIdentity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.name2, phone = identidadePlayer.phone, registration = identidadePlayer.serial}
        end
    end
    if baseatual == "Maestriav3" then
        local identidadePlayer = vRP.userIdentity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.name2, phone = identidadePlayer.phone, registration = identidadePlayer.serial}
        end
    end
    if baseatual == "Maestriav2" then
        local identidadePlayer = vRP.getUserIdentity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.name2, phone = identidadePlayer.phone, registration = identidadePlayer.serial}
        end
    end
    if baseatual == "Maestriav1" then
        local identidadePlayer = vRP.userIdentity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.name2, phone = identidadePlayer.phone, registration = identidadePlayer.serial}
        end
    end
    if baseatual == "vrpex" then
        local identidadePlayer = vRP.getUserIdentity(user_id)
        if identidadePlayer then
            return {name = identidadePlayer.name, name2 = identidadePlayer.firstname, phone = identidadePlayer.phone, registration = identidadePlayer.registration}
        end
    end
end

function Getusersourcebase(user_id)
    if baseatual == "Maestriav6" then
        return vRP.Source(user_id)
    else
        return vRP.getUserSource(user_id)
    end
end

function Vehiclenamebase(vehicle)
    if baseatual == "Maestriav6" then
        return VehicleName(vehicle)
    elseif baseatual == "Maestriav5" or baseatual == "Maestriav4" or baseatual == "Maestriav1" then
        return vehicleName(vehicle)
    elseif baseatual == "Maestriav3" or baseatual == "Maestriav2" or baseatual == "vrpex" then
        return vRP.vehicleName(vehicle) 
    end
end

function Sendwebhookbase(webhook,message)
    PerformHttpRequest(webhook, function(err, text, headers) end, "POST", json.encode({content = message}), { ["Content-Type"] = "application/json" })
end

function Getmoneybase(user_id)
    if baseatual == "Maestriav6" then
        local Source = vRP.Source(user_id)
        return vRP.GetBank(Source)
    elseif baseatual == "Maestriav1" or baseatual == "Maestriav2" or baseatual == "Maestriav3" or baseatual == "Maestriav4" or baseatual == "Maestriav5" then
        return vRP.getBank(user_id)
    else
        return vRP.getMoney(user_id)
    end
end

function Getbankmoneybase(user_id)
    if baseatual == "Maestriav6" then
        local Source = vRP.Source(user_id)
        return vRP.GetBank(Source)
    elseif baseatual == "Maestriav1" or baseatual == "Maestriav2" or baseatual == "Maestriav3" or baseatual == "Maestriav4" or baseatual == "Maestriav5" then
        return vRP.getBank(user_id)
    else
        return vRP.getBankMoney(user_id)
    end
end

function Setmoneybase(user_id,amount)
    if baseatual == "Maestriav6" then
        local Source = vRP.Source(user_id)
        local Bank = vRP.GetBank(Source)
        vRP.RemoveBank(user_id,parseInt(Bank))
        vRP.GiveBank(user_id,parseInt(amount))
    elseif baseatual == "Maestriav1" or baseatual == "Maestriav2" or baseatual == "Maestriav3" or baseatual == "Maestriav4" or baseatual == "Maestriav5" then
        local Bank = vRP.getBank(user_id)
        vRP.delBank(user_id,parseInt(Bank),"Private")
        vRP.addBank(user_id,parseInt(amount),"Private")
    else
        return vRP.setMoney(user_id,parseInt(amount))
    end
end

function Setbankmoneybase(user_id,amount)
    if baseatual ~= "vrpex" then
        Setmoneybase(user_id,amount)
    else
        return vRP.setBankMoney(user_id,parseInt(amount))
    end
end

function Kickbase(source,reason)
    if baseatual == "Maestriav6" then
        return vRP.Kick(source,reason)
    else
        return vRP.kick(source,reason)
    end
end

function Setbanbase(user_id,boolean)
    if baseatual == "Maestriav6" then
        if boolean then
            local Source = vRP.Source(user_id)
            local Identity = vRP.Identities(Source)
            vRP.Query("banneds/InsertBanned",{license = Identity, time = 10000000})
        else
            local Source = vRP.Source(user_id)
            local Identity = vRP.Identities(Source)
            vRP.Query("banneds/RemoveBanned",{license = Identity})
        end
    elseif baseatual == "Maestriav5" then
        if boolean then
            local identity = vRP.userIdentity(user_id)
            vRP.execute("banneds/insertBanned",{ steam = identity["steam"], time = 10000000 })
        else
            local identity = vRP.userIdentity(user_id)
            vRP.execute("banneds/removeBanned",{ steam = identity["steam"] })
        end
    elseif baseatual == "Maestriav4" then
        if boolean then
            local identity = vRP.userIdentity(user_id)
            vRP.execute("banneds/insertBanned",{ steam = identity["steam"], days = 10000000 })
        else
            local identity = vRP.userIdentity(user_id)
            vRP.execute("banneds/removeBanned",{ steam = identity["steam"] })
        end
    elseif baseatual == "Maestriav3" then
        if boolean then
            local identity = vRP.getUserIdentity(user_id)
            vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })
        else
            local identity = vRP.getUserIdentity(user_id)
            vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 0 })
        end
    elseif baseatual == "Maestriav2" then
        if boolean then
            local identity = vRP.getUserIdentity(user_id)
            vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })
        else
            local identity = vRP.getUserIdentity(user_id)
            vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 0 })
        end
    elseif baseatual == "Maestriav1" then
        if boolean then
            local identity = vRP.userIdentity(user_id)
            vRP.execute("banneds/insertBanned",{ steam = identity["steam"], days = 10000000 })
        else
            local identity = vRP.userIdentity(nuser_id)
            vRP.execute("banneds/removeBanned",{ steam = identity["steam"] })
        end
    else
        if boolean then
            vRP.setBanned(user_id,1)
        else
            vRP.setBanned(user_id,0)
        end
    end
    return true
end

function Getinventorybase(user_id)
    if baseatual == "Maestriav6" then
        return vRP.Inventory(user_id)
    elseif baseatual == "Maestriav5" or baseatual == "Maestriav4" or baseatual == "Maestriav1" then
        return vRP.userInventory(user_id)
    elseif baseatual == "vrpex" or baseatual == "Maestriav3" or baseatual == "Maestriav2" then
        return vRP.getInventory(user_id)
    end
end

function Itemnamelistbase(itemname)
    if baseatual == "Maestriav6" or baseatual == "Maestriav5" or baseatual == "Maestriav4" or baseatual == "Maestriav1" then
        return itemName(itemname)
    else
        return vRP.itemNameList(itemname)
    end
end

function Getinventoryweightbase(user_id)
    if baseatual == "Maestriav6" then
        return vRP.InventoryWeight(user_id)
    elseif baseatual == "Maestriav5" then
        return vRP.inventoryWeight(user_id)
    elseif baseatual == "Maestriav4" then
        return vRP.inventoryWeight(user_id)
    elseif baseatual == "Maestriav3" then
        return vRP.computeInvWeight(user_id)
    elseif baseatual == "Maestriav2" then
        return vRP.computeInvWeight(user_id)
    elseif baseatual == "Maestriav1" then
        return vRP.inventoryWeight(user_id)
    else
        return vRP.getInventoryWeight(user_id)
    end
end

function Getinventorymaxweightbase(user_id)
    if baseatual == "Maestriav6" then
        return vRP.GetWeight(user_id)
    elseif baseatual == "Maestriav5" then
        return vRP.getWeight(user_id)
    elseif baseatual == "Maestriav4" then
        return vRP.getBackpack(user_id)
    elseif baseatual == "Maestriav3" then
        return vRP.getBackpack(user_id)
    elseif baseatual == "Maestriav2" then
        return vRP.getBackpack(user_id)
    elseif baseatual == "Maestriav1" then
        return vRP.getBackpack(user_id)
    else
        return vRP.getInventoryMaxWeight(user_id)
    end
end

function Getitemweightbase(itemname)
    if baseatual == "Maestriav6" then
        return itemWeight(itemname)
    elseif baseatual == "Maestriav5" then
        return itemWeight(itemname)
    elseif baseatual == "Maestriav4" then
        return itemWeight(itemname)
    elseif baseatual == "Maestriav3" then
        return vRP.itemWeightList(itemname)
    elseif baseatual == "Maestriav2" then
        return vRP.itemWeightList(itemname)
    elseif baseatual == "Maestriav1" then
        return itemWeight(itemname)
    else
        return vRP.getItemWeight(itemname)
    end
end

function Trygetinventorybase(user_id,item,amount)
    if baseatual == "Maestriav6" then
        return vRP.TakeItem(user_id,item,amount)
    else
        return vRP.tryGetInventoryItem(user_id,item,amount)
    end
end

function Giveinventoryitembase(user_id,itemname,amount)
    if baseatual == "Maestriav6" then
        return vRP.giveItem(user_id,itemname,amount)
    else
        return vRP.giveInventoryItem(user_id,itemname,amount)
    end
    return true
end

function ItemAmountbase(user_id,itemname)
    if baseatual == "Maestriav6" then
        return vRP.itemAmount(user_id,itemname)
    elseif baseatual == "Maestriav5" then
        return vRP.itemAmount(user_id,itemname)
    elseif baseatual == "Maestriav1" then
        return vRP.itemAmount(user_id,itemname)
    else
        return vRP.getInventoryItemAmount(user_id,itemname)
    end
    return true
end

function Updateidentitybase(tabela)
    if baseatual == "Maestriav6" then
        if tabela["name"] ~= nil then
            vRP.UpgradeNames(tabela["user_id"],tabela["name"],tabela["firstname"])
        end
        if tabela["phone"] ~= nil then
            vRP.UpgradePhone(tabela["user_id"],tabela["phone"])
        end
    elseif baseatual == "Maestriav5" then
        if tabela["name"] ~= nil then
            vRP.upgradeNames(tabela["user_id"],tabela["name"],tabela["firstname"])
        end
        if tabela["phone"] ~= nil then
            vRP.upgradePhone(tabela["user_id"],tabela["phone"])
        end
    elseif baseatual == "Maestriav4" then
        Querybase("skdev/updtidentity",tabela,"execute")
    elseif baseatual == "Maestriav3" then
        Querybase("skdev/updtidentity",tabela,"execute")
    elseif baseatual == "Maestriav2" then
        Querybase("skdev/updtidentity",tabela,"execute")
    elseif baseatual == "Maestriav1" then
        Querybase("skdev/updtidentity",tabela,"execute")
    else
        Querybase("skdev/updtidentity",tabela,"execute")
    end
end

function PromptBase(source,title,default_text)
    if baseatual == "Maestriav6" then
        local returnPp = Keyboard.keySingle(source,"TESTE")
        if returnPp then
            if returnPp[1] then
                return returnPp[1]
            end
        end
        return nil
    elseif baseatual == "Maestriav5" then
        return vRP.prompt(source,title,"")
    elseif baseatual == "Maestriav4" then
        return vRP.prompt(source,title,"")
    elseif baseatual == "Maestriav3" then
        return vRP.prompt(source,title,"")
    elseif baseatual == "Maestriav2" then
        return vRP.prompt(source,title,"")
    elseif baseatual == "Maestriav1" then
        return vRP.prompt(source,title,"")
    else
        return vRP.prompt(source,title,"")
    end
end

IDGenerator = {}
selfIds = {}

function newIDGenerator()
	local r = setmetatable({}, { __index = IDGenerator })
	IDGenerator:construct()
	return r
end

function IDGenerator:construct()
	IDGenerator:clear()
end

function IDGenerator:clear()
	selfIds.max = 0
	selfIds.ids = {}
end

function IDGenerator:gen()
	if #selfIds.ids > 0 then
		return table.remove(selfIds.ids)
	else
		local r = selfIds.max
		selfIds.max = selfIds.max+1
		return r
	end
end

function IDGenerator:free(id)
	table.insert(selfIds.ids,id)
end