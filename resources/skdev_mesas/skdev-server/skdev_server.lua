local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")
local vCLIENT = Tunnel.getInterface("skdev_mesas")
local vRPClient = Tunnel.getInterface("vRP")

skdev = {}
Tunnel.bindInterface("skdev_mesas",skdev)

local tableUsers = {}
local drugsInTable = {}
local tablesCoord = {}
local moneyTable = {}

RegisterCommand("mesadrogas", function(source,args,rawcmd)
    local source = source
    local user_id = Passportbase(source)

    vCLIENT.initTablePosition(source)
end)

function skdev.createTableDrugs(coords,heading)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] then
        local tableID = parseInt(tableUsers[tostring(user_id)])
        moneyTable[tostring(tableID)] = nil
        tableUsers[tostring(user_id)] = nil
        tablesCoord[tostring(tableID)] = nil
        drugsInTable[tostring(tableID)] = {}
        vCLIENT.replaceTables(-1,tablesCoord)
    end

    tableUsers[tostring(user_id)] = tostring(user_id)
    drugsInTable[tostring(user_id)] = {}
    tablesCoord[tostring(user_id)] = {coords,heading}

    vCLIENT.replaceTables(-1,tablesCoord)
end

function skdev.RemoveTable(objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) or HasPermissionbase(user_id,policia_permissao,index_policia) then
        for drug,amount in pairs(drugsInTable[tostring(objID)]) do
            if amount >= 1 then
                local invWeight = Getinventoryweightbase(user_id)
                local backpackWeight = Getinventorymaxweightbase(user_id)
                local itemWeight = Getitemweightbase(drug)

                if (invWeight + itemWeight) <= itemWeight then
                    Giveinventoryitembase(user_id,drug,amount)
                    TriggerClientEvent("Notify", source, notify_config[1], "Você recolheu: "..amount.." drogas com sucesso!",10000)
                end

                drugsInTable[tostring(objID)][drug] = nil
            end
        end

        local moneyInTheTable = 0
        if moneyTable[tostring(objID)] then
            moneyInTheTable = parseInt(moneyTable[tostring(objID)])
        end

        if moneyInTheTable >= 1 then
            moneyTable[tostring(objID)] = nil
            Giveinventoryitembase(user_id,money_item,moneyInTheTable)
            TriggerClientEvent("Notify", source, notify_config[1], "Você retirou: "..moneyInTheTable.." dinheiro com sucesso!",10000)
        end

        if tableUsers[tostring(user_id)] then
            local tableID = parseInt(tableUsers[tostring(user_id)])
            moneyTable[tostring(tableID)] = nil
            tableUsers[tostring(user_id)] = nil
            tablesCoord[tostring(tableID)] = nil
            drugsInTable[tostring(tableID)] = {}
            vCLIENT.replaceTables(-1,tablesCoord)
        end

        return true
    end

    return false
end

function skdev.verifyTable(objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) or HasPermissionbase(user_id,policia_permissao,index_policia) then
        local drugs = {}

        local money = 0
        local amountDrugs = 0

        for drug,amount in pairs(drugsInTable[tostring(objID)]) do
            if amount >= 1 then
                amountDrugs = amountDrugs + amount
            end
        end

        if moneyTable[tostring(objID)] then
            money = parseInt(moneyTable[tostring(objID)])
        end

        for drug,info in pairs(drogas_configuracao) do
            local drugsintable = 0

            if drugsInTable[tostring(objID)] then
                if drugsInTable[tostring(objID)][tostring(info["ingame"])] then
                    drugsintable = parseInt(drugsInTable[tostring(objID)][tostring(info["ingame"])])
                end
            end

            drugs[#drugs+1] = {img = info["image"], drugintable = drugsintable, price = info["sell"], drugname = info["ingame"]}
        end

        return true, drugs, money, amountDrugs
    end
    
    return false, {}, {}, 0
end

function skdev.putDrug(drug,objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) or HasPermissionbase(user_id,policia_permissao,index_policia) then
        local request = PromptBase(source,"QUANTIDADE ADICIONAR")
        if request then
            local amount = parseInt(request)
            if amount >= 1 then
                if drug then
                    if ItemAmountbase(user_id,drug) >= amount then
                        if Trygetinventorybase(user_id,drug,amount) then
                            if drugsInTable[tostring(objID)] then
                                if drugsInTable[tostring(objID)][drug] then
                                    drugsInTable[tostring(objID)][drug] = parseInt(drugsInTable[tostring(objID)][drug] + amount)
                                else
                                    drugsInTable[tostring(objID)][drug] = parseInt(amount)
                                end
                                vCLIENT.requestDrugs(source)
                                TriggerClientEvent("Notify", source, notify_config[1], "Você colocou: "..amount.." com sucesso!",10000)
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdev.remDrug(drug,objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) or HasPermissionbase(user_id,policia_permissao,index_policia) then
        local request = PromptBase(source,"QUANTIDADE REMOVER")
        if request then
            local amount = parseInt(request)
            if amount >= 1 then
                if drug then
                    if drugsInTable[tostring(objID)] then
                        if drugsInTable[tostring(objID)][drug] then
                            local amountInTable = parseInt(drugsInTable[tostring(objID)][drug])
                            if amountInTable >= amount then
                                local invWeight = Getinventoryweightbase(user_id)
                                local backpackWeight = Getinventorymaxweightbase(user_id)
                                local itemWeight = Getitemweightbase(drug)

                                if (invWeight + (itemWeight  * amount)) <= backpackWeight then
                                    if amountInTable - amount < 0 then
                                        drugsInTable[tostring(objID)][drug] = 0
                                    else
                                        drugsInTable[tostring(objID)][drug] = parseint(amountInTable - amount)
                                    end
                                    Giveinventoryitembase(user_id,drug,amount)
                                    TriggerClientEvent("Notify", source, notify_config[1], "Você recolheu: "..amount.." com sucesso!",10000)
                                    vCLIENT.requestDrugs(source)
                                else
                                    TriggerClientEvent("Notify", source, notify_config[2], "Você não tem espaço na mochila!",10000)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdev.withdrawMoney(objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) or HasPermissionbase(user_id,policia_permissao,index_policia) then
        local request = PromptBase(source,"QUANTIDADE")
        if request then
            local amount = parseInt(request)
            if amount >= 1 then
                local moneyInTheTable = 0
                if moneyTable[tostring(objID)] then
                    moneyInTheTable = parseInt(moneyTable[tostring(objID)])
                end

                if moneyInTheTable >= amount then
                    if moneyInTheTable - amount < 0 then
                        moneyTable[tostring(objID)] = 0
                    else
                        moneyTable[tostring(objID)] = parseInt(moneyInTheTable - amount)
                    end
                    Giveinventoryitembase(user_id,money_item,amount)
                    TriggerClientEvent("Notify", source, notify_config[1], "Você recolheu: "..amount.." com sucesso!",10000)
                end
            end
        end
    end
end

function skdev.HaveDrugsInTheTable(objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) then
        if drugsInTable[tostring(objID)] then
            for drug,amountdrug in pairs(drugsInTable[tostring(objID)]) do
                if amountdrug >= 1 then
                    return true
                end
            end
        end
    end

    return false
end

local police_reports = {}
function skdev.SellOneOfThese(objID)
    local source = source
    local user_id = Passportbase(source)

    if tableUsers[tostring(user_id)] == tostring(objID) then
        if drugsInTable[tostring(objID)] then
            for drug,amountdrug in pairs(drugsInTable[tostring(objID)]) do
                if amountdrug >= 1 then
                    for drugName,info in pairs(drogas_configuracao) do
                        if drug == info["ingame"] then
                            local randomAmount = math.random(1, amountdrug)
                            local amountGain = (info["sell"] * randomAmount)
                            if amountdrug >= randomAmount then
                                if drugsInTable[tostring(objID)] then
                                    if drugsInTable[tostring(objID)][drug] then
                                        if drugsInTable[tostring(objID)][drug] - randomAmount  < 0 then
                                            drugsInTable[tostring(objID)][drug] = 0
                                        else
                                            drugsInTable[tostring(objID)][drug] = parseInt(drugsInTable[tostring(objID)][drug] - randomAmount)
                                        end
                                    end
                                end

                                if moneyTable[tostring(objID)] then
                                    moneyTable[tostring(objID)] = parseInt(moneyTable[tostring(objID)] + amountGain)
                                else
                                    moneyTable[tostring(objID)] = parseInt(amountGain)
                                end

                                TriggerClientEvent("Notify", source, notify_config[1], "Você vendeu: "..drugName.." e ganhou: "..amountGain.." com sucesso!",10000)

                                if avisar_policia then
                                    local x,y,z = vCLIENT.getPosition(source)
                                    local police_random = math.random(1,200)
                                    if police_random >= 170 then
                                        local policiais = Getusersbypermissionsbase(policia_permissao)
                                        for _,UserIdPolice in pairs(policiais) do
                                            local sourcePolice = Getusersourcebase(parseInt(UserIdPolice))
                                            if sourcePolice then
                                                async(function()
                                                    local report_id = newIDGenerator()
                                                    police_reports[report_id] = vCLIENT.addBlip(sourcePolice,x,y,z,153,84,"Venda de Drogas Ilegal",0.5,false)
                                                    TriggerClientEvent("Notify",sourcePolice,notify_config[2],"[DENUNCIA ANONIMA] - Foi avistada uma venda de drogas, vá ao local e prenda o traficante.",10000)
                                                    vCLIENT.playSound(sourcePolice,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
                                                    SetTimeout(60000,function() vCLIENT.removeBlip(sourcePolice,police_reports[report_id]) IDGenerator:free(report_id) end)
                                                end)
                                            end
                                        end
                                        TriggerClientEvent("Notify",source,notify_config[1],"A Policia foi avisada sobre sua venda de drogas.",10000)
                                        vCLIENT.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
                                    end
                                end

                                return false
                            end
                        end
                    end
                end
            end
        end
    end
end