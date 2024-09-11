----==={ CONEXÃO }===----

Resource = GetCurrentResourceName()
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

fClient = Tunnel.getInterface(Resource)

tClient = {}
Tunnel.bindInterface(Resource,tClient)

----==={ CONFIGURAÇÕES SERVER-SIDE }===----

local wrappers = { -- TABELA DE WRAPPERS, WRAPPER = FUNÇÃO DE QUERY.
    oxmysql = 'execute', -- Novas versões do oxmysql usam "query"
    ghmattimysql = 'execute',
    GHMattiMySQL = 'QueryResultAsync'
}

local function getActualWrapper()
    for k,v in next, wrappers do
        local state = GetResourceState(k)
        if state == 'started' then 
            return exports[k][v]
        end
    end
end

config = {
    execute = getActualWrapper(),
    queries = {},
    prepare = function(self,name,query) -- Não mexer
        self.queries[name] = query
    end,
    query = function(self, name, params) -- Função de querie para a database, mude algo, apenas se entender o que está fazendo
        local query = self.queries[name] or name
        if not query then return end
        local _params = {_=true}
        for k,v in next,(params or {}) do 
            _params[k] = v 
        end
        local res = promise.new()
        self.execute(self.execute, query, _params, function(rows)
            res:resolve(rows)
        end)
        return Citizen.Await(res)
    end,
    getUserId = function(source) -- FUNÇÃO QUE SERÁ ACIONADA COM A SOURCE, E RETORNARÁ O IDENTIFICADOR DO JOGADOR PARA A FRAMEWORK, NO VRPEX, O NOME DADO É USER_ID
        if source then
            local user_id = vRP.Passport(source)
            if user_id then
                return user_id
            end
        end
    end,
    getUserSource = function(user_id) -- FUNÇÃO QUE SERÁ ACIONADA COM O USER_ID, E RETORNARÁ A SOURCE DO JOGADOR
        if user_id then
            return vRP.Source(user_id)
        end
    end,
    getUserIdentity = function(user_id) -- FUNÇÃO QUE SERÁ ACIONADA COM USER_ID, E RETORNARÁ A IDENTIDADE DA PESSOA COM AS INFORMAÇÕES DELA SENDO IDENTITY.NAME E IDENTITY.FIRSTNAME
        if user_id then
            local identity = vRP.Identity(user_id)
            if not identity.name or not identity.name2 then
                identity.name = identity.name or ''
                identity.name2 = identity.name2 or ''
            end
            return identity
        end
    end,
    hasPermission = function(user_id,permissao) -- FUNÇÃO QUE SERÁ ACIONADA COM USER_ID E PERMISSÃO, E RETORNARÁ UMA BOOLEANA (TRUE/FALSE), SE TIVER OU NÃO A PERMISSÃO.
        if user_id and permissao then
            return vRP.HasPermission(user_id,permissao) or false
        end
    end,
    hasGroup = function(user_id,group) -- FUNÇÃO QUE SERÁ ACIONADA COM USER_ID E NOME DO GRUPO, E RETORNARÁ UMA BOOLEANA (TRUE/FALSE), SE ESTÁ OU NÃO SETADO COM AQUELE GRUPO
        if user_id and group then
            return vRP.HasGroup(user_id,group) or false
        end
    end,
    getUserGroups = function(user_id) -- FUNÇÃO QUE SERÁ ACIONADA COM USER_ID, E RETORNARÁ UM OBJETO COM A KEY SENDO O NOME DO GRUPO, E O VALUE SENDO TRUE, OU UM VALOR VERDADEIRO
        if user_id then
            return vRP.GetUserGroups(user_id) or {}
        end
    end,
    getUsersByPermission = function(permissao) -- FUNÇÃO QUE SERÁ ACIONADA COM UMA PERMISSÃO, E RETORNARÁ TODOS ONLINE QUE TEM ESSA PERMISSÃO, EM UMA ARRAY COM O VALUE SENDO O USER_ID DO PLAYER
        local ids,amount = vRP.NumPermission(permissao)
        if permissao then
            return ids,amount
        end
    end,
    getItemName = function(idname) -- FUNÇÃO QUE SERÁ ACIONADA COM O NOME DE SPAWN DE UM ITEM, E RETORNARÁ O NOME ILUSTRATIVO DELE (NOME BONITO, COM ESPAÇOS, ACENTOS...)
        if idname then
            return vRP.ItemName(idname) or ''
        end
    end,
    getItemWeight = function(idname) -- FUNÇÃO QUE SERÁ ACIONADA COM O NOME DE SPAWN DE UM ITEM, E RETORNARÁ O PESO DELE
        if idname then
            return vRP.InventoryWeight(idname) or 0
        end
    end,
    getBackpack = function(user_id)
        if user_id then 
            return vRP.GetWeight(user_id) - vRP.InventoryWeight(user_id)
        end
    end,
    getInventoryItemAmount = function(user_id, idname) -- FUNÇÃO QUE SERÁ ACIONADA COM O USER_ID E O NOME DE SPAWN DE UM ITEM, E RETORNARÁ A QUANTIDADE DAQUELE ITEM NO INVENTÁRIO DO JOGADOR
        if user_id and idname then
            return vRP.InventoryItemAmount(user_id,idname)[1] or 0
        end
    end,
    giveAwardRobbery = function(user_id, amount, moneytype) -- moneytype: 'darkmoeny' para dinheiro sujo, e 'money' para dinheiro limpo
        if user_id and amount and moneytype then 
            local options = {
                darkmoney = function()
                    vRP.GiveItem(user_id, 'dollars2', amount, true)
                    return true -- retornar true para a notify
                end, 
                money = function()
                    vRP.GiveBank(user_id, amount)
                    return true -- retornar true para a notify
                end,
            }
            if type(options[moneytype]) == 'function' then 
                return options[moneytype]()
            end
        end
    end,
    giveInventoryItem = function(user_id, idname, amount) -- FUNÇÃO QUE DA ITENS À UMA PESSOA (Pode se tirar a verificação de peso, se não deseja isso, ou adaptar ela à sua base)
        if user_id and type(idname) == 'string' and type(amount) == 'number' then 
            local backpack = config.getBackpack(user_id)
            if backpack - (config.getItemWeight(idname) * amount) >= 0 then 
                return vRP.GiveItem(user_id, idname, amount, true) 
            end
        end
    end,
    tryGetInventoryItem = function(user_id, idname, amount) -- FUNÇÃO QUE DÁ UM ITEM DE UMA PESSOA  
        if user_id and type(idname) == 'string' and type(amount) == 'number' then 
            return vRP.TakeItem(user_id, idname, amount, true)
        end
    end,
    getNearestPlayers = function(source, radius) -- FUNÇÃO QUE É ACIONADA COM SOURCE E RADIUS, TODOS OS PLAYERS QUE ESTÃO NAQUELE RAIO (SENDO KEY = SOURCE, E VALUE = DISTANCE)
        return fClient.ClosestPeds(source,radius) -- FUNÇÃO QUE RETORNA UMA TABELA COM A KEY SENDO SOURCE, E O VALUE, A DISTÂNCIA DO JOGADOR À SOURCE QUE RODOU O CÓDIGO
    end,
    setHealth = function(source, health) -- FUNÇÃO QUE SETA A VIDA DO PLAYER
        fClient.setHealth(source,parseInt(health))
    end,
}

AddEventHandler('Disconnect', function(Passport,source,Reason)
    playerDropped(source, Passport, Reason)
end)