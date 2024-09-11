-----------------------------------------------------------------------------------------------------------------------------------------
--[ vRP ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")

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
vCLIENT = lib.getModule(GetCurrentResourceName())
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUERYES
-----------------------------------------------------------------------------------------------------------------------------------------
DB.prepare(GetCurrentResourceName().."/check_budget","SELECT * FROM wine_bennys_budgets WHERE user_id = @user_id AND vehicle = @vehicle AND plate = @plate and status = @status ")
DB.prepare(GetCurrentResourceName().."/get_budget_id","SELECT * FROM wine_bennys_budgets WHERE id = @id")
DB.prepare(GetCurrentResourceName().."/get_budgets_mechanic","SELECT * FROM wine_bennys_budgets WHERE mechanic = @mechanic ORDER BY id DESC")
DB.prepare(GetCurrentResourceName().."/set_budget_status","UPDATE wine_bennys_budgets SET status = @status WHERE id = @id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local helpslist          = {}
local announces          = {}
local license_authorized = false
local limite             = 10
local contador           = 0
local defaultnumber      = 5
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOKS
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookPainel(data)
    local url = ""

	PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- saveBudget
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.saveBudget(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if data.mods ~= nil and data.cartlist ~= nil and data.price ~= nil and data.mechanic ~= nil then
            local vehicle = vCLIENT.getVehicleProximity(source, 3)
            if vehicle.name ~= nil then
                local check = DB.query(GetCurrentResourceName().."/check_budget", { user_id = user_id, vehicle = vehicle.name, plate = vehicle.plate, status = "pending" })
                if #check <= 0 then
                    local price = numberToInt(data.price)
                    if vRP.PaymentFull(user_id, price) then
                        local inserted = DB.insert("INSERT INTO wine_bennys_budgets (`user_id`, `mechanic`, `vehicle`, `plate`, `mods`, `cartlist`, `price`, `status`, `created`) VALUES(@user_id, @mechanic, @vehicle, @plate, @mods, @cartlist, @price, @status, @created);",{ 
                            ['@user_id']  = user_id,
                            ['@mechanic'] = data.mechanic,
                            ['@vehicle']  = vehicle.name,
                            ['@plate']    = vehicle.plate,
                            ['@mods']     = json.encode(data.mods),
                            ['@cartlist'] = json.encode(data.cartlist),
                            ['@price']    = price,
                            ['@status']   = "pending",
                            ['@created']  = os.date("%Y-%m-%d %H:%I:%S"),
                        })
                        if inserted > 0 then
                            --vRP.tryFullPayment(user_id, price)
                            TriggerClientEvent('Notify', source, "sucesso", "Orçamento gerado com sucesso agora é só esperar um mêcanico!")
                            return true
                        end
                    else
                        TriggerClientEvent('Notify', source, "negado", "Você não dinheiro suficiente", 5000)
                    end
                else
                    TriggerClientEvent('Notify', source, "negado", "Você já tem um orçamento pendente para esse veículo", 5000)
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- chekOpenTablet
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.chekOpenMenu(index)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if config.mechanics[index].checkpermtoopen then
            for _, permission in pairs(config.mechanics[index].permissions) do
                if vRP.hasPermission(user_id, permission.inservice) then
                    return true
                end
            end
        else
            return true
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- chekOpenTablet
-----------------------------------------------------------------------------------------------------------------------------------------

function psRP.chekOpenTablet()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        for k, v in pairs (config.mechanics) do
            for _, permission in pairs(v.permissions) do
                if vRP.hasPermission(user_id, permission.inservice) then
                    return true, k, permission.manager
                end
                if vRP.hasPermission(user_id, permission.offservice) then
                    return true, k, permission.manager
                end
            end
        end
    end
    return false,nil,nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getDataMechanic
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getDataMechanic(mechanic)
    local source  = source
    local user_id = vRP.getUserId(source)
    local data    = {}
    if user_id then
        if mechanic ~= nil then
            if config.mechanics[mechanic] ~= nil then
                local users = getUsers()
                local userslist = {}
                for k,v in pairs(users) do
                    local id = getUserSource(tonumber(k))
                    if id then
                        for _, permission in pairs(config.mechanics[mechanic].permissions) do
                            if vRP.hasPermission(tonumber(k), permission.inservice) then
                                local name = getUserFullName(tonumber(k))
            
                                local ndata = {
                                    user_id   = tonumber(k),
                                    name      = name,
                                    title     = getGroupTitle(permission.inservice),
                                    inservice = true,
                                }
            
                                table.insert(userslist, ndata)
                            end
                            if vRP.hasPermission(tonumber(k), permission.offservice) then
                                local ndata = {
                                    user_id   = tonumber(k),
                                    name      = getUserFullName(tonumber(k)),
                                    title     = getGroupTitle(permission.inservice),
                                    inservice = false,
                                }
            
                                table.insert(userslist, ndata)
                            end
                        end
                    end
                end
            
                local myuser = {
                    user_id   = user_id,
                    name      = getUserFullName(user_id),
                    title     = getProfission(user_id),
                }

                local helps   = {}
                local budgets = {}

                local rows = DB.query(GetCurrentResourceName().."/get_budgets_mechanic", { mechanic = mechanic })

                if #rows > 0 then
                    for k,v in pairs(rows) do
                        local name  = getUserFullName(tonumber(v.user_id))
                        local phone = getUserPhone(tonumber(v.user_id))
    
                        local ndata = {
                            id       = tonumber(v.id),
                            user_id  = tonumber(v.user_id),
                            name     = name,
                            phone    = phone,
                            vehicle  = v.vehicle,
                            plate    = v.plate,
                            mods     = json.decode(v.mods),
                            cartlist = json.decode(v.cartlist),
                            price    = tonumber(v.price),
                            status   = v.status,
                            created  = v.created,
                        }
    
                        table.insert(budgets, ndata)
                    end
                end

                if config.mechanics[mechanic].receivehelp then
                    helps = helpslist
                end

                local announce = nil

                if announces[mechanic] ~= nil then
                    announce = announces[mechanic]
                else
                    announce = config.mechanics[mechanic].announcedefault
                end

                data = {
                    users    = userslist,
                    myuser   = myuser,
                    budgets  = budgets,
                    helps    = helps,
                    announce = announce
                }
            end
        end
    end
    return data
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- addAnnounce
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.addAnnounce(mechanic, data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if mechanic and data.message then
            if announces[mechanic] == nil then
                announces[mechanic] = data.message
                return true
            else
                announces[mechanic] = data.message
                return true
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- serviceStatus
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.serviceStatus(mechanic)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if config.mechanics[mechanic] ~= nil then
            for _, permission in pairs(config.mechanics[mechanic].permissions) do
                if vRP.hasPermission(user_id, permission.inservice) then
					addUserGroup(user_id,permission.offservice)
					remUserGroup(user_id,permission.inservice)
                    TriggerClientEvent('Notify', source, "sucesso", "Você saiu de serviço", 8000)
                    return true
                end
                if vRP.hasPermission(user_id, permission.offservice) then
					addUserGroup(user_id,permission.inservice)
					remUserGroup(user_id,permission.offservice)
                    TriggerClientEvent('Notify', source, "sucesso", "Você entrou em serviço", 8000)
                    return true
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- applyMods
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.applyMods(mechanic, data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if mechanic and data.id then
            if config.mechanics[mechanic] ~= nil then
                local vehicle = vCLIENT.getVehicleProximity(source, 3)
                if vehicle.name ~= nil then
                    local budget_id = tonumber(data.id)
                    local row = DB.query(GetCurrentResourceName().."/get_budget_id", { id = budget_id })

                    if #row > 0 then
                        
                        if row[1].status ~= "pending" then
                            TriggerClientEvent('Notify', source, "negado", "Esse orçamento foi cancelado ou aplicado", 5000)
                            return false
                        end

                        if row[1].vehicle ~= vehicle.name then
                            TriggerClientEvent('Notify', source, "negado", "Esse orçamento não é para esse veículo", 5000)
                            return false
                        end 

                        if row[1].plate ~= vehicle.plate then
                            TriggerClientEvent('Notify', source, "negado", "Esse orçamento não é para essa placa", 5000)
                            return false
                        end

                        local mods    = json.decode(row[1].mods)
                        local mconfig = config.mechanics[mechanic]
                        local time    = mconfig.time
                        if mconfig.partsmode.active then
                            if mconfig.partsmode.mode == "all" then
                                local itens = {}

                                for k,v in pairs(mods) do
                                    for _,mod in pairs(config.vehicleCustomsList) do
                                        local typemod = v.type
                                        if v.type == "customcolor" then
                                            typemod = "color"
                                        end
                                        if mod.id == typemod then
                                            if mod.part ~= nil then
                                                local idata = {
                                                    typemod = typemod,
                                                    item    = mod.part,
                                                    amount  = 1
                                                }
                                                table.insert(itens, idata)
                                            end
                                        end

                                        if mod.menu ~= nil then
                                            for __, menu in pairs(mod.menu) do
                                                if menu.id == typemod then
                                                    if menu.part ~= nil then
                                                        local idata = {
                                                            typemod = typemod,
                                                            item    = menu.part,
                                                            amount  = 1
                                                        }
                                                        table.insert(itens, idata)
                                                    end
                                                end

                                                if menu.list ~= nil then
                                                    for ___, list in pairs(menu.list) do
                                                        if list.id == typemod then
                                                            if list.part ~= nil then
                                                                local idata = {
                                                                    typemod = typemod,
                                                                    item    = list.part,
                                                                    amount  = 1
                                                                }
                                                                table.insert(itens, idata)
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end

                                if #itens > 0 then
                                    local check = true
                                    for k, v in pairs(itens) do
                                        if v.item ~= nil then
                                            if getInventoryItemAmount(user_id, v.item, tonumber(v.amount)) < v.amount then
                                                TriggerClientEvent('Notify', source, "negado", "Você precisa de "..tonumber(v.amount).."x "..getItemName(v.item), 5000)
                                                check = false
                                            end
                                        end
                                    end

                                    if not check then
                                        return false
                                    end

                                    local check = true
                                    for k, v in pairs(itens) do
                                        if v.item ~= nil then
                                            if not tryGetInventoryItem(user_id, v.item, tonumber(v.amount)) then
                                                TriggerClientEvent('Notify', source, "negado", "Você precisa de "..tonumber(v.amount).."x "..getItemName(v.item), 5000)
                                                check = false
                                            end
                                        end
                                    end

                                    if not check then
                                        return false
                                    end

                                    time = time * tonumber(#itens)
                                end
                            else
                                local item = mconfig.partsmode.partdefault
                                local amount = mconfig.partsmode.partamount
                                if not tryGetInventoryItem(user_id, item, amount) then
                                    TriggerClientEvent('Notify', source, "negado", "Você precisa de "..amount.."x "..item, 5000)
                                    return false
                                end
                            end

                            DB.execute(GetCurrentResourceName().."/set_budget_status", { id = budget_id, status = "finished" })

                            TriggerClientEvent('cancelando',source,true)
                            sendprogress(source,time,"Aplicando mods")
                            vCLIENT.playAnim(source,false,mconfig.anim,true)
                            SetTimeout(time,function()
                                for k, v in pairs(mods) do
                                    vCLIENT.applyMods(source, vehicle.vehicle, v)
                                end
                                if mconfig.price.fixed then
                                    addBankMoney(user_id, mconfig.price.amount)
                                    TriggerClientEvent('Notify', source, "sucesso", "Você recebeu R$"..mconfig.price.amount.." pelo orçamento", 5000)
                                else
                                    local price = numberToInt(row[1].price) * mconfig.price.percentage
                                    addBankMoney(user_id, price)
                                    TriggerClientEvent('Notify', source, "sucesso", "Você recebeu R$"..price.." pelo orçamento", 5000)
                                end
                                vCLIENT.saveMods(source, vehicle.vehicle)
                                vCLIENT.stopAnim(source,false)
                                TriggerClientEvent('cancelando',source,false)
                            end)

                            return true
                        else

                            DB.execute(GetCurrentResourceName().."/set_budget_status", { id = budget_id, status = "finished" })

                            TriggerClientEvent('cancelando',source,true)
                            sendprogress(source,time,"Aplicando mods")
                            vCLIENT.playAnim(source,false,mconfig.anim,true)
                            SetTimeout(mconfig.time,function()
                                for k, v in pairs(mods) do
                                    vCLIENT.applyMods(source, vehicle.vehicle, v)
                                end
                                if mconfig.price.fixed then
                                    addBankMoney(user_id, mconfig.price.amount)
                                    TriggerClientEvent('Notify', source, "sucesso", "Você recebeu R$"..mconfig.price.amount.." pelo orçamento", 5000)
                                else
                                    local price = numberToInt(row[1].price) * mconfig.price.percentage
                                    addBankMoney(user_id, price)
                                    TriggerClientEvent('Notify', source, "sucesso", "Você recebeu R$"..price.." pelo orçamento", 5000)
                                end
                                vCLIENT.saveMods(source, vehicle.vehicle)
                                vCLIENT.stopAnim(source,false)
                                TriggerClientEvent('cancelando',source,false)
                            end)

                            return true

                        end
                    end
                else
                    TriggerClientEvent('Notify', source, "negado", "Você está longe do veiculo", 5000)
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getMods
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getMods(name, plate)
    return getModsVehicle(name, plate)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- saveMods
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.saveMods(name, plate, mods)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return setModsVehicle(name, plate, mods)
    end
    return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- setModsVehicle
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("vRP/wine_bennys","UPDATE vehicles SET tunagem = @tunagem WHERE Passport = @user_id and vehicle = @vehicle")
setModsVehicle = function(name, plate, mods)
--    -- print(mods)
--     local plate_user = vRP.PassportPlate(plate) 
--   --  print(json.encode(plate_user))
--     if plate_user then


--         -- setServerData("custom:u"..plate_user.."veh_"..tostring(name),json.encode(mods))
--         -- print("custom:u"..plate_user.."veh_"..tostring(name),json.encode(mods))
--         -- vRP.setSData("custom:u"..plate_user.."veh_"..tostring(name),json.encode(mods))
--         vRP.execute("vRP/wine_bennys",{ user_id = plate_user.Passport, tunagem = json.encode(mods), vehicle = name })
--         return true
--     else
--        -- print('nao consegui pegar a placa desse carro')
--     end
  ---  return false
  local Passport = vRP.PassportPlate(plate)
	if Passport then
		vRP.Query("entitydata/SetData",{ dkey = "Mods:"..Passport["Passport"]..":"..name, dvalue = json.encode(mods) })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendhelp
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.sendHelp(message)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local exist = false
        local index = false

        for k,v in pairs(helpslist) do
            if v.user_id == user_id and v.time > 0 then
                exist = true
                index = k
            end
        end

        if not exist then
            local target    = GetPlayerPed(source)
            local tgtCoords = GetEntityCoords(target)

            local data = {
                user_id = user_id,
                name    = getUserFullName(user_id),
                phone   = getUserPhone(user_id),
                message = message,
                coords  = tgtCoords,
                status  = "pending",
                time    = config.help.time
            }

            for k, v in pairs (config.mechanics) do
                for _, permission in pairs(v.permissions) do
                    if vRP.hasPermission(user_id, permission.inservice) then
                        TriggerClientEvent('Notify', source, "aviso", "Chamado recebido, abra o tablet para mais informações", 5000)
                    end
                end
            end
            
            table.insert(helpslist, data)
            TriggerClientEvent('Notify', source, "sucesso", "Chamado efetuado agora é só esperar", 5000)
            return true
        else
            TriggerClientEvent('Notify', source, "negado", "Você já tem um chamado pendente, aguarde "..helpslist[index].time.." segundos para efetuar outro", 5000)
            return true
        end
    end
    TriggerClientEvent('Notify', source, "negado", "Error ao efetuar o chamado, tente novamente", 5000)
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- acceptHelp
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.acceptHelp(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if data.index and data.id then
            local index    = tonumber(data.index) + 1
            local nuser_id = tonumber(data.id)


            if helpslist[index] ~= nil then
                if helpslist[index].status == "pending" then
                    helpslist[index].status = "accepted"
                end

                if helpslist[index].status == "denied" then
                    TriggerClientEvent('Notify', source,"negado","Esse chamado já foi recusado",5000)
                    return
                end

                TriggerClientEvent('Notify', source,"sucesso","Marcação ativada no mapa",5000)

                local coords = helpslist[index].coords
                vCLIENT.setCoords(source,index,coords.x,coords.y,coords.z,config.help.blip,config.help.color,config.help.scale,config.help.title)
                SetTimeout(config.help.time * 1000,function() vCLIENT.removeBlip(source,index) end)                
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getVehicleKits
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getVehicleKits(name, plate)
    return getVehicleKits(name, plate)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setVehicleKits
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.setVehicleKits(name, plate, mod)
    return setVehicleKits(name, plate, mod)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- checkPermissionsAdmin
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.checkPermissionsAdmin()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        for k, v in pairs(config.admintunning.permissions) do
            if vRP.hasPermission(user_id, v) then
                return true
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- checkPermissionsAdmin
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.repairVehicle(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        for _, permission in pairs(config.mechanics[index].permissions) do
            if vRP.hasPermission(user_id, permission.inservice) then
                TriggerEvent("tryreparar", vehicle)
                return true
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TriggerClientEvent
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.TriggerClientEvent(type, message, time)
    local source = source
    TriggerClientEvent('Notify', source, type, message, time)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendprogress
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.sendprogress(time, title)
    local source = source
    sendprogress(source, time, title)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- syncVehicleMods
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent(GetCurrentResourceName()..":syncVehicleMods")
AddEventHandler(GetCurrentResourceName()..":syncVehicleMods",function(mods,vehicle)
    TriggerClientEvent(GetCurrentResourceName()..":applymods_sync",-1,mods,vehicle)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- setVehicleKits
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent(GetCurrentResourceName()..":setVehicleKits")
AddEventHandler(GetCurrentResourceName()..":setVehicleKits",function(name, plate, mod)
    psRP.setVehicleKits(name, plate, mod)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- trytow
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent(GetCurrentResourceName()..":trytow")
AddEventHandler(GetCurrentResourceName()..":trytow",function(nveh,rveh)
	TriggerClientEvent(GetCurrentResourceName()..":synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- trywheel
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent(GetCurrentResourceName()..":trywheel")
AddEventHandler(GetCurrentResourceName()..":trywheel",function(settings)
	TriggerClientEvent(GetCurrentResourceName()..":syncwheel",-1,settings)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- syncVehicleSuspension
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent(GetCurrentResourceName()..":syncVehicleSuspension")
AddEventHandler(GetCurrentResourceName()..":syncVehicleSuspension",function(vehicle, calc)
	TriggerClientEvent(GetCurrentResourceName()..":suspension_sync",-1,vehicle, calc)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendhelp
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent(GetCurrentResourceName()..":sendhelp")
AddEventHandler(GetCurrentResourceName()..":sendhelp",function(user_id, message)
    local source = source
    if user_id == nil then
        local user_id = vRP.getUserId(source)
    end
    if source == "" then
        source = getUserSource(user_id)
    end
    if user_id then
        local exist = false
        local index = false

        for k,v in pairs(helpslist) do
            if v.user_id == user_id and v.time > 0 then
                exist = true
                index = k
            end
        end

        if not exist then
            local target    = GetPlayerPed(source)
            local tgtCoords = GetEntityCoords(target)

            local data = {
                user_id = user_id,
                name    = getUserFullName(user_id),
                phone   = getUserPhone(user_id),
                message = message,
                coords  = tgtCoords,
                status  = "pending",
                time    = config.help.time
            }

            for k, v in pairs (config.mechanics) do
                for _, permission in pairs(v.permissions) do
                    if vRP.hasPermission(user_id, permission.inservice) then
                        TriggerClientEvent('Notify', source, "aviso", "Chamado recebido, abra o tablet para mais informações", 5000)
                    end
                end
            end
            
            table.insert(helpslist, data)
            TriggerClientEvent('Notify', source, "sucesso", "Chamado efetuado agora é só esperar", 5000)
        else
            TriggerClientEvent('Notify', source, "negado", "Você já tem um chamado pendente, aguarde "..helpslist[index].time.." segundos para efetuar outro", 5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- thread help
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(helpslist) do
			if v.time > 0 then
                if (v.time - 1) <= 0 then
                    helpslist[k].status = "denied"
                end

				helpslist[k].time = v.time - 1
			end
		end
	end
end)
