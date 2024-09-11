--[[
    PROPOSTA:



]]

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

blzr = {}
Tunnel.bindInterface("alpha_desmanche", blzr)
vRPRAGE = Tunnel.getInterface("garages")
vCLIENT = Tunnel.getInterface("alpha_desmanche")

local desmanche = "WEBHOOK"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

------------------------------------------------------
-- CONFIG 
------------------------------------------------------
local RestritoParaDesmanche = false -- É restrito para quem tiver só a permissão do desmanche? (TRUE/FALSE)
local PermissaoDesmanche = 'admin' or 'pca.permissao' -- Se RestritoParaDesmanche for TRUE, aqui deverá ter a permissão que será verifiada.

local PrecisaDeItem = false -- Precisa de item para iniciar o desmanche? (TRUE/FALSE)
local ItemNecessario = 'macarico' -- Qual item precisa para iniciar o desmanche?
local QtdNecessaria = 20 -- Quantos itens precisará para iniciar o desmanche?


local CarrosDesmanches = {

-------------------------------------------------------------------------|
----- CONCESSIONÁRIA ----------------------------------------------------|
-------------------------------------------------------------------------| 
    
    ['150'] = 8500,
    ['amarok'] = 380000,
    ['biz25'] = 5000,
    ['bros60'] = 15000,
    ['civic2016'] = 70000,
    ['dm1200'] = 10000,
    ['ds4'] = 30000,
    ['eletran17'] = 40000,
    ['evoq'] = 145000,
    ['fiat'] = 10000,
    ['fiatstilo'] = 75000, 
    ['fiattoro'] = 180000, 
    ['fiatuno'] = 13000, 
    ['fordka'] = 10000, 
    ['fusion'] = 75000,
    ['golg7'] = 20000, 
    ['hornet'] = 70000, 
    ['jetta2017'] = 50000, 
    ['l200civil'] = 90000, 
    ['monza'] = 15000, 
    ['p207'] = 18000, 
    ['palio'] = 18000, 
    ['punto'] = 48000,
    ['santafe'] = 60000, 
    ['saveiro'] = 35000, 
    ['sonata18'] = 75000, 
    ['upzinho'] = 23000, 
    ['veloster'] = 50000, 
    ['voyage'] = 20000,
    ['vwgolf'] = 45000, 
    ['vwpolo'] = 30000, 
    ['xj'] = 65000, 
    ['xt66'] = 45000, 
    ['z1000'] = 100000, 
    ['dune'] = 450000,
    ['audirs6'] = 600500, 
    ['audirs7'] = 600500, 
    ['bmwm3f80'] = 600000, 
    ['bmwm4gts'] = 400000,
    ['dodgechargersrt'] = 800000,
    ['focusrs'] = 400000,
    ['fordmustang'] = 600000,
    ['hondafk8'] = 750000,
    ['lancerevolution9'] = 600500,
    ['lancerevolutionx'] = 600500, --
    ['f150'] = 70000,
    ['evoque'] = 350000,
    ['mazdarx7'] = 420000,
    ['mercedesa45'] = 420000,
    ['mustangmach1'] = 380000,
    ['nissan370z'] = 380000,
    ['nissangtr'] = 380000,
    ['nissangtrnismo'] = 380000,
    ['nissanskyliner34'] = 380000,
    ['porsche930'] = 420000,
    ['raptor2017'] = 380000,
    ['teslaprior'] = 600500,
    ['toyotasupra'] = 380000,
    ['ruiner'] = 80000,
    ['verlierer2'] = 15000,
    ['sentinel'] = 5000,
    ['intruder'] = 15000,
    ['asea'] = 18000,
    ['sultanrs'] = 210000,
    ['casco'] = 9000,
    ['zentorno'] = 250000,
    ['voltic'] = 250000,
    ['sanchez'] = 6000,
    ['manchez'] = 17820,
    ['santafe'] = 45000,
    ['skyline'] = 180000,
    ['skyliner34'] = 150000,
    ['toyotasupra'] = 160000,
    ['teslaprior'] = 140000, 
    ['subaruimpreza'] = 137000,
    ['silvias15'] = 145000,
    ['nissangtrnismo'] = 220000,
    ['nissangtr2'] = 200000,
    ['nissangtr'] = 200000,
    ['mustangfast'] = 120000,
    ['mercedesgt63'] = 187000,
    ['mclarensenna'] = 230000,
    ['mclarenp1'] = 227000,
    ['mazdarx7'] = 138000,
    ['lancerevolutionx'] = 195000,
    ['lamborghinihuracan'] = 205000,
    ['fordmustang'] = 235000,
    ['ferrariitalia'] = 196000,
    ['ferrarif12'] = 190000,
    ['ferrari812'] = 200000,
    ['dodgechargersrt'] = 175000,
    ['civictyper'] = 143000,
    ['bmwm4gts'] = 176000,
    ['bmwm3e36'] = 172000,
    ['bmwi8'] = 243000,
    ['audirs6'] = 178000,
    ['teslapd'] = 145000,
    ['m6gc'] = 187000,
    ['p7'] = 176000,
    ['p1gtr'] = 203000,
    ['rmodlp750'] = 200000,
    ['rmodveneno'] = 207000,
    ['rxf7'] = 169000,
    ['rx7veilside'] = 173000,
    ['mers63c'] = 124000,
    ['velociraptor'] = 237000,
    ['macan'] = 210000,
    ['lx2018'] = 122000,
    ['panamera17turbo'] = 215000,
    ['m4f82'] = 176000,
    ['jagpr8'] = 156000,
    ['i8'] = 245000,
    ['panto'] = 187000,
    
----------------------------------------------------------------------|
----- CARROS VIPS ----------------------------------------------------|
----------------------------------------------------------------------| 

    ['r1'] = 90000,
    ['zx10r'] = 90000,
    ['tiger'] = 130000,
    ['i8'] = 780000,
    ['ferrariitalia'] = 800000,
    ['lamborghinihuracan'] = 650000,
    ['t20'] = 650000,
		["xre"] = { ['name'] = "Xre", ['price'] = 500000, ['tipo'] = "motos" },
    ['laferrari15'] = 800000,
    ['tyrant'] = 550000,
    ['r1250'] = 350000,
    ['divo'] = 800000,

    




}

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


-- RETORNA VEICULOS PERMITIDOS
function blzr.GetVehs()
    return CarrosDesmanches
end


-- FUNÇÃO VERIFICAR PERMISSÃO DO DESMANCHE
function blzr.CheckPerm()
    local source = source
    local user_id = vRP.getUserId(source)
    local Passport = vRP.Passport(source)
    if RestritoParaDesmanche then
        if vRP.hasPermission(Passport, PermissaoDesmanche) then
            return true
        end
        return false
    end
    return true
end

-- FUNÇÃO PRA VERIFICAR SE POSSUI O ITEM
function blzr.CheckItem()
    local source = source
    local Passport = vRP.Passport(source)
    local user_id = vRP.getUserId(source)
    if PrecisaDeItem then
        if vRP.tryGetInventoryItem(Passport,ItemNecessario,QtdNecessaria) then
            return true
        end
        return false
    end
    return true
end


-- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
function blzr.GerarPagamento(placa, nomeFeio, nomeBonito)
    local source = source
    local user_id = vRP.getUserId(source)
    local Passport = vRP.Passport(source)
    local identity = vRP.getUserIdentity(Passport)
    for k, v in pairs(CarrosDesmanches) do
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v
            -- vRP.giveMoney(user_id,pagamento) -- DINHEIRO LIMPO
            vRP.GenerateItem(Passport,"dollars2",pagamento,true) -- DINHEIRO SUJO
            TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
            TriggerClientEvent("Notify",source,"verde","Voce recebeu o pagamento de um anonimo.",5000)
        end
    end
end


