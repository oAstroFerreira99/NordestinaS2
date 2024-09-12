--------------------------------
-- [ CONEXAO ] --
--------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
src = {}
Tunnel.bindInterface("wine_groups",src)
vCLIENT = Tunnel.getInterface("wine_groups")
Config = module(GetCurrentResourceName(), "cfg/config")

vRP._Prepare("wnGroups/jesterInstagram", "SELECT * FROM smartphone_instagram WHERE user_id = @user_id")

src.CheckImagePlayer = function(passaporte)
    local infos = vRP.Query("wnGroups/jesterInstagram", {user_id = parseInt(passaporte)})
    if infos[1] then
        return infos[1].avatarURL
    else
        return "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"
    end
end

src.receiveSalary = function()
	local source = source
	local user_id = vRP.Passport(source)
    
        local GetJogador = vRP.Query("GetEmpresa", {user_id = user_id})
        if GetJogador[1] then
            if GetJogador[1].empresa ~= "Desempregado" then
                local empresa_player = GetJogador[1].empresa
                local cargo_player = GetJogador[1].cargo
                for k,v in pairs(Config.Empresas[empresa_player].cargos) do  
                    if v.Acesso == cargo_player and vRP.HasPermission(user_id,Config.Empresas[empresa_player].Cargo_Default) then
                        -- SALÁRIO NÃO ADAPTADO
                        if v.Salario then
                            local identity = vRP.Identity(user_id)
                            local banco_antigo = vRP.getBank(user_id)
                            vRP.GiveBank(user_id,parseInt(v.Salario),"Private")
                            TriggerClientEvent("Notify",source,"azul","Salário de "..empresa_player.." no valor de <b>$"..v.Salario.."</b> recebido.",5000)
                            local banco_novo = vRP.getBank(user_id)
                            PerformHttpRequest("LOGS", function(err, text, headers) end, 'POST', json.encode({
                                embeds = {
                                    {     
                                        title = "**Salario "..empresa_player.."**",
                                        fields = {
                                            { 
                                                name = "📝 Author:", 
                                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                            },
                                            { 
                                                name = "💋 Recebeu:", 
                                                    value = ""..v.Salario   .." $" 
                                            },
                                            { 
                                                name = "💰 Conta Bancaria:", 
                                                    value = "Valor Antigo: "..banco_antigo.." $ / Valor Novo: "..banco_novo.." $" 
                                            },
                                        }, 
                                        footer = { 
                                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                                            icon_url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
                                        },
                                        thumbnail = { 
                                            url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
                                        },
                                        color = 3092790
                                    }
                                }
                            }), { ['Content-Type'] = 'application/json' })
                        end
                    end
                end
            end
        end 


end

src.returnBau = function(empresa) 
    local verify = vRP.GetSrvData("chest:"..tostring(empresa))
    if verify and next(verify) ~= nil then 
        local bauFac = {} 
        for k, v in pairs(verify) do
            local split = splitString(v.item,"-")
            table.insert(bauFac, { 
                name = split[1], 
                index = split[1],  
                amount = v.amount,
                linkimgs  = Config.Imagens
            })
        end
        return bauFac
    end
end

src.returnExtrato = function(empresa) 
    if not empresa then return end
    local infos = vRP.Query("VerificarExtratoEmpresa", {empresa = empresa})
    if infos and #infos > 0 then 
        local source = source
	    local user_id = vRP.Passport(source)
        local extrato = {}
        
        for _, info in ipairs(infos) do
            local GetJogador = vRP.Query("GetEmpresa", {user_id = info.passaporte})
            if not GetJogador[1] then return end
            local item = {
                id = info.id,
                passaporte = info.passaporte,
                imagemplayer = src.CheckImagePlayer(info.passaporte),
                atividade = info.atividade, 
                cargo = GetJogador[1].cargo, 
                valor = info.valor,
                nome = info.nome,
            }
            table.insert(extrato, item)
        end
        return extrato
    end
end
local empresas = {}

src.depositar = function(empresa, valor)
    if not empresa or not valor then return false end
    local source = source
	local user_id = vRP.Passport(source)
    local identity = vRP.Identity(user_id)
    local nome = identity.name.." "..identity.name2
    if empresas[empresa] == nil then 
        local verify = vRP.Query("VerificarCriacao", {empresa = empresa})
        empresas[empresa] = verify
    end
    if empresas[empresa] then 
        if vRP.PaymentFull(user_id, valor) then
            local novoValor = empresas[empresa][1].banco + tonumber(valor)
            vRP.execute("updateBankOrg", {bank = parseInt(novoValor), empresa = empresa}) -- update banco
            vRP.execute("insertExtrato", {passaporte = user_id, empresa = empresa, atividade = "Depósito", valor = tonumber(valor), data = os.time(), nome = nome}) -- update extrato
            empresas[empresa][1].banco = novoValor
            TriggerClientEvent("Notify",source,"sucesso","Você depositou $ "..tonumber(valor).." Com sucesso.",3000)
            local Color = 3092790
            local Message = "**[ID]:** "..user_id.."\n**[DEPOSITOU]: $**"..valor
            SendWebhookMessage(Config.Empresas[empresa].logs_banco, Message)
            
            return true
        end
    end
end
src.sacar = function(empresa, valor)
    if not empresa or not valor then return false end
    local source = source
    local user_id = vRP.Passport(source)
    local identity = vRP.Identity(user_id)
    local nome = identity.name .. " " .. identity.name2
    local valor = tonumber(valor)
    
    -- Verificar se a empresa existe no cache
    if empresas[empresa] == nil then 
        local verify = vRP.Query("VerificarCriacao", {empresa = empresa})
        empresas[empresa] = verify
    end
    
    if empresas[empresa] then 
        local saldoAtual = empresas[empresa][1].banco
        
        -- Verificar se o saldo é suficiente para o saque
        if saldoAtual < valor then
            TriggerClientEvent("Notify", source, "negado", "Saldo insuficiente.", 3000)
            return false
        end

        local novoValor = saldoAtual - valor
        -- Atualizar o saldo do banco
        vRP.execute("updateBankOrg", {bank = parseInt(novoValor), empresa = empresa})
        -- Registrar o saque no extrato
        vRP.execute("insertExtrato", {passaporte = user_id, empresa = empresa, atividade = "Retirada", valor = valor, data = os.time(), nome = nome})
        empresas[empresa][1].banco = novoValor
        
        local Message = "**[ID]:** " .. user_id .. "\n**[RETIROU]: $**" .. valor
        SendWebhookMessage(Config.Empresas[empresa].logs_banco, Message)
        TriggerClientEvent("Notify", source, "sucesso", "Você retirou $ " .. valor .. " com sucesso.", 3000)
        vRP.GenerateItem(user_id, "dollars", valor, true) 
        
        return true
    else
        TriggerClientEvent("Notify", source, "negado", "Empresa não encontrada.", 3000)
        return false
    end
end

src.refreshExtratos = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)
    local extrato = {}
    
    if user_id then
        local infos = vRP.Query("VerificarExtratoEmpresa", {empresa = empresa})
        if infos and #infos > 0 then 
            for _, info in ipairs(infos) do
                local GetJogador = vRP.Query("GetEmpresa", {user_id = info.passaporte})
                if not GetJogador[1] then return end
                local item = {
                    id = info.id,
                    passaporte = info.passaporte,
                    imagemplayer = src.CheckImagePlayer(info.passaporte),
                    atividade = info.atividade, 
                    cargo = GetJogador[1].cargo, 
                    valor = info.valor,
                    nome = info.nome,
                    banco = empresas[empresa][1].banco
                }
                table.insert(extrato, item)
            end
        else
            -- Se não houver extratos, insira um padrão
            table.insert(extrato, {
                id = "-1",
                passaporte = "0",
                imagemplayer = "", -- Você pode definir uma imagem padrão aqui se desejar
                atividade = "Nenhuma atividade encontrada", 
                cargo = "", 
                valor = "0",
                nome = "Nenhum extrato disponível",
                banco = empresas[empresa][1].banco
            })
        end
    end
    
    return extrato
end

function SendWebhookMessage(webhook, message)
    if webhook ~= "none" then
        local perfilImg = Config.icon_url
		local imageLink = Config.url
		
        local payload = {
            -- content = message,
            username = "SENSE",
            avatar_url = perfilImg,
            embeds = {
                {
                    title = "Registro de Logs",
                    description = message,
                    image = {
                        url = imageLink
                    },
                    footer = {
                        text = "SENSE",
                        icon_url = perfilImg
                    },
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%S")
                }
            }
        }
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(payload), { ['Content-Type'] = 'application/json' })
    end
end

--------------------------------
-- [ SQL ] --
--------------------------------

vRP._Prepare("wnStaff/jesterInstagram", "SELECT * FROM smartphone_instagram WHERE user_id = @user_id")

vRP._Prepare("GetEmpresa", "SELECT * FROM groups_perfil WHERE user_id = @user_id") 
vRP._Prepare("GetEmpresaInfos","SELECT * FROM groups_perfil WHERE empresa = @empresa")
vRP._Prepare("InsertPlayer", "INSERT INTO groups_perfil(user_id, nome, empresa,cargo,groupSetado,img,login,discordid,contratante) VALUES(@user_id, @nome, @empresa,@cargo,@groupSetado,@img,@login,@discordid,@contratante)")
vRP._Prepare("updateEmpPlayer", "UPDATE groups_perfil SET empresa = @empresa,cargo = @cargo,groupSetado = @groupSetado WHERE user_id = @user_id") 
vRP._Prepare("updateEmpPlaye3r", "UPDATE groups_perfil SET cargo = @cargo WHERE user_id = @user_id") 
vRP._Prepare("updateEmpPlayer2", "UPDATE groups_perfil SET empresa = @empresa,cargo = @cargo,groupSetado = @groupSetado,contratante = @contratante WHERE user_id = @user_id") 
vRP._Prepare("updateDiscordId", "UPDATE groups_perfil SET discordid = @discordid WHERE user_id = @user_id") 
vRP._Prepare("updateBlacklist", "UPDATE groups_perfil SET blacklist = @blacklist WHERE user_id = @user_id") 
vRP._Prepare("updateBankOrg", "UPDATE groups_empresas SET banco = @bank WHERE empresa = @empresa") 
vRP._Prepare("updateVendaOrg", "UPDATE groups_empresas SET vendas = @vendas WHERE empresa = @empresa") 
vRP._Prepare("updateAdvOrg", "UPDATE groups_empresas SET avisos = @avisos WHERE empresa = @empresa") 

vRP._Prepare("insertExtrato", "INSERT INTO groups_extrato (passaporte, empresa, atividade, valor, data, nome)VALUES (@passaporte, @empresa, @atividade, @valor, @data, @nome)") 




vRP._Prepare("VerificarCriacao","SELECT * FROM groups_empresas WHERE empresa = @empresa")
vRP._Prepare("VerificarExtratoEmpresa","SELECT * FROM groups_extrato WHERE empresa = @empresa")
vRP._Prepare("updateUpgradse", "UPDATE groups_empresas SET upgradeCraft = @upgradeCraft WHERE empresa = @empresa") 
vRP._Prepare("InsertCriacao", "INSERT INTO groups_empresas(empresa, banco, avisos,vendas,upgradeCraft) VALUES(@empresa, @banco, @avisos,@vendas,@upgradeCraft)")

vRP._Prepare("GetAnuncios", "SELECT * FROM groups_anuncios") 
vRP._Prepare("InsertAnuncios", "INSERT INTO groups_anuncios(empresa,nome,passaporte,color,data,mensagem) VALUES(@empresa,@nome,@passaporte,@color,@data,@mensagem)")

vRP._Prepare("GetChat", "SELECT * FROM groups_chat") 
vRP._Prepare("InsertChat", "INSERT INTO groups_chat(empresa,nome,passaporte,data,mensagem) VALUES(@empresa,@nome,@passaporte,@data,@mensagem)")

vRP._Prepare("GetVendas", "SELECT * FROM groups_vendas") 
vRP._Prepare("GetVendaId", "SELECT * FROM groups_vendas WHERE id = @id")
vRP._Prepare("deleteVenda","DELETE FROM groups_vendas WHERE id = @id")
vRP._Prepare("InsertVenda", "INSERT INTO groups_vendas(empresa,passaporte,vendedor,comprador,imagem,valor,data) VALUES(@empresa,@passaporte,@vendedor,@comprador,@imagem,@valor,@data)")

vRP._Prepare("GetImgCelular", "SELECT * FROM smartphone_whatsapp WHERE owner = @owner") 
vRP._Prepare("updateImagem", "UPDATE groups_perfil SET img = @img WHERE user_id = @user_id") 

vRP._Prepare("PegarImgsInv", "SELECT * FROM inventario WHERE user_id = @user_id")
vRP.prepare("vRP/get_datatable","SELECT dvalue FROM vrp_user_data WHERE user_id = @user_id AND dkey = @table")

vRP._Prepare("warn/groups_perfil", [[
    CREATE TABLE IF NOT EXISTS groups_perfil(
        user_id INTEGER,
		nome TEXT,
        empresa TEXT,
        cargo TEXT,
        groupSetado TEXT,
        img TEXT,
        login INTEGER,
        discordid TEXT,
        contratante TEXT,
        blacklist varchar(255),
        PRIMARY KEY (`user_id`) USING BTREE
    )
]])

vRP._Prepare("warn/groups_empresas", [[
    CREATE TABLE IF NOT EXISTS groups_empresas(
        empresa TEXT,
		banco INTEGER,
        avisos INTEGER,
        vendas INTEGER
    )
]])

vRP._Prepare("warn/groups_anuncios", [[
    CREATE TABLE IF NOT EXISTS groups_anuncios(
        id int(11) NOT NULL AUTO_INCREMENT,
        empresa TEXT,
        nome TEXT,
        passaporte INTEGER,
        color TEXT,
        data TEXT,
        mensagem TEXT,
        PRIMARY KEY (id)
    )
]])

vRP._Prepare("warn/groups_chat", [[
    CREATE TABLE IF NOT EXISTS groups_chat(
        id int(11) NOT NULL AUTO_INCREMENT,
        empresa TEXT,
        nome TEXT,
        passaporte INTEGER,
        data TEXT,
        mensagem TEXT,
        PRIMARY KEY (id)
    )
]])

vRP._Prepare("warn/groups_vendas", [[
    CREATE TABLE IF NOT EXISTS groups_vendas(
        id int(11) NOT NULL AUTO_INCREMENT,
        passaporte INTEGER,
        empresa TEXT,
        vendedor TEXT,
        comprador TEXT,
        imagem TEXT,
        valor TEXT,
        data TEXT,
        PRIMARY KEY (id)
    )
]])
vRP._Prepare("warn/groups_extrato", [[
    CREATE TABLE IF NOT EXISTS `groups_extrato`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `passaporte` int(11) NULL DEFAULT NULL,
    `empresa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `atividade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `valor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    PRIMARY KEY (`id`) USING BTREE
    )
]])

Citizen.CreateThread(function()
    vRP.Query("warn/groups_perfil")
    vRP.Query("warn/groups_empresas")
    vRP.Query("warn/groups_anuncios")
    vRP.Query("warn/groups_chat")
    vRP.Query("warn/groups_vendas")
    vRP.Query("warn/groups_extrato")
end)

vRP._Prepare("ss2/verificar", "SELECT * FROM telar WHERE user_id = @user_id") 

vRP.prepare("wnGroups/getUsers","SELECT * FROM characters WHERE id = @id")
vRP.prepare("wnGroups/removePaypal","UPDATE characters SET paypal = @paypal WHERE id = @id")

src.verificar_cargo_player = function()
    local source = source
    local user_id = vRP.Passport(source)
    local GetJogador = vRP.Query("GetEmpresa", {user_id = user_id})
    local GetJogador2 = vRP.Query("ss2/verificar", {user_id = user_id})
    -- local inv = vRP.getDatatable(user_id)
    -- local inv = vRP.userInventory(user_id)
    local inv = "TESTE PIKA"
    local kdsak = ""
    local quantidadeS = 0
    local identity = vRP.Identity(user_id)

    local identity_paypal = vRP.Query("wnGroups/getUsers",{ id = user_id })[1]
	if parseInt(identity_paypal.paypal) then
		if parseInt(identity_paypal.paypal) >= 1 then
			vRP.GiveBank(user_id,parseInt(identity_paypal.paypal),"Private")
			TriggerClientEvent("Notify",source,"azul","Voce tinha "..identity_paypal.paypal.." $ no <b>paypal</b>, tudo foi transferindo para o seu banco",15000)
			vRP.Query("wnGroups/removePaypal",{ id = user_id,paypal = 0 })
			-- PerformHttpRequest("logs", function(err, text, headers) end, 'POST', json.encode({
			-- 	embeds = {
			-- 		{     
			-- 			title = "**Paypal (Celular Novo)**",
			-- 			fields = {
			-- 				{ 
			-- 					name = "📝 Author:", 
			-- 					value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
			-- 				},
							
			-- 				{ 
			-- 					name = "📣 Quantidade Transferida:", 
			-- 					value = "" ..identity_paypal.paypal.."",
			-- 				},
			-- 			}, 
			-- 			footer = { 
			-- 				text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
			-- 				icon_url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
			-- 			},
			-- 			thumbnail = { 
			-- 				url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
			-- 			},
			-- 			color = 3092790
			-- 		}
			-- 	}
			-- }), { ['Content-Type'] = 'application/json' })
		end
	end

    for k,v in pairs(inv) do
        quantidadeS = quantidadeS + 1
        if quantidadeS == 1 then
            kdsak = kdsak .. " "..parseInt(v.amount).."x " .. itemName(v["item"]) .. " "
        else
            kdsak = kdsak .. " / "..parseInt(v.amount).."x " .. itemName(v["item"]) .. " "
        end
    end

    local getdiscord = vRP.getDiscordPlayer(user_id)

    local identitysss = ""
    local quantidadeS2 = 0
    for k,v in pairs(GetPlayerIdentifiers(source)) do
        quantidadeS2 = quantidadeS + 1
        if quantidadeS2 == 1 then
            identitysss = identitysss .. " "..v.." "
        else
            identitysss = identitysss .. " / "..v.." "
        end
    end

   -- TriggerEvent("shops:lojacafe",source)
    if user_id ~= 884 then
        -- PerformHttpRequest("https://discord.com/api/webhooks/1129668466891313172/BWXjwjnFkZWuKbtrPXQJPeZRVi0HEQk8yeaWxmaCRjtGtVCkkK4zd5PekOedCmSEpNON", function(err, text, headers) end, 'POST', json.encode({
        --     embeds = {
        --         {     
        --             title = "**Entrou**",
        --             fields = {
        --                 { 
        --                     name = "📝 Author:", 
        --                     value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
        --                 },
        --                 { 
        --                     name = "🎒 Inventario:", 
        --                     value = " "..kdsak.."",
        --                 },
        --                 { 
        --                     name = "✨ Identificacoes:", 
        --                     value = "" ..identitysss.."",
        --                 },
        --             }, 
        --             footer = { 
        --                 text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
        --                 icon_url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
        --             },
        --             thumbnail = { 
        --                 url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
        --             },
        --             color = 3092790
        --         }
        --     }
        -- }), { ['Content-Type'] = 'application/json' })
    end

    if GetJogador2[1] then
        -- PerformHttpRequest("https://discord.com/api/webhooks/1130290239739539557/QFhqpZhRpC2jmVziCzAXRUTr3CpPzzcbmwFY_m-t38qR5-_AP6l8U7GEfqhC5SJAA1qx", function(err, text, headers) end, 'POST', json.encode({
        --     content = "<@&1074503116965285969> ",
        --     embeds = {
        --         {     
        --             title = "**Entrou**",
        --             fields = {
        --                 { 
        --                     name = "📝 Author:", 
        --                     value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
        --                 },
        --                 { 
        --                     name = "🍖 Motivo:", 
        --                     value = " "..GetJogador2[1].motivo.."",
        --                 },
        --                 { 
        --                     name = "🔥 Dia:", 
        --                     value = "" ..GetJogador2[1].dia.."",
        --                 },
        --                 { 
        --                     name = "🎫 ID Discord: " ..getdiscord.."", 
        --                     value = "<@" ..getdiscord..">",
        --                 },
        --                 { 
        --                     name = "✨ Identificacoes:", 
        --                     value = "" ..identitysss.."",
        --                 },
        --             }, 
        --             footer = { 
        --                 text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
        --                 icon_url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
        --             },
        --             thumbnail = { 
        --                 url = "https://media.discordapp.net/attachments/1094973674437750834/1101630131610591323/512.png"
        --             },
        --             color = 3092790
        --         }
        --     }
        -- }), { ['Content-Type'] = 'application/json' })
    end

    if GetJogador[1] then
        if GetJogador[1].empresa ~= "Desempregado" then
            vRP.setPermission(user_id,GetJogador[1].empresa)
            if Config.Empresas[GetJogador[1].empresa].Cargo_Discord then
                local getdiscord = vRP.getDiscordPlayer(user_id)
                -- if exports['discord']:guildMemberGetInfo(Config.discordid,""..parseInt(getdiscord).."") then
                --     exports['discord']:guildMemberRoleAdd(Config.discordid,""..getdiscord.."",""..Config.Empresas[GetJogador[1].empresa].Cargo_Discord.."")
                -- else
                --     TriggerClientEvent("Notify",source,"staff","Entre no discord: <b>discord.gg/5ZcJm2HSW</b>",300000)
                --     local identity = vRP.Identity(user_id)
                --     -- PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                --     --     embeds = {
                --     --         {     
                --     --             title = "**Player Invalido**",
                --     --             fields = {
                --     --                 { 
                --     --                     name = "📝 Author:", 
                --     --                     value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                --     --                 },
                --     --                 { 
                --     --                     name = "🍖 Facção:", 
                --     --                     value = ""..GetJogador[1].empresa..""
                --     --                 },
                --     --                 { 
                --     --                     name = "🤷 Discord:", 
                --     --                     value = "<@"..getdiscord.."> ("..getdiscord..")"
                --     --                 },
                --     --             }, 
                --     --             footer = { 
                --     --                 text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                --     --                 icon_url = Config.icon_url
                --     --             },
                --     --             image = { 
                --     --                 url = Config.url
                --     --             },
                --     --             color = 3092790
                --     --         }
                --     --     }
                --     -- }), { ['Content-Type'] = 'application/json' })
                --     Wait(5*60000)
                --     src.setar_discord_novamente()
                -- end
            end
        end
    end
end

src.setar_discord_novamente = function()
    local source = source
    local user_id = vRP.Passport(source)
    local GetJogador = vRP.Query("GetEmpresa", {user_id = user_id})
    if GetJogador[1] then
        if GetJogador[1].empresa ~= "Desempregado" then
            if Config.Empresas[GetJogador[1].empresa].Cargo_Discord then
                local getdiscord = vRP.getDiscordPlayer(user_id)
                if exports['discord']:guildMemberGetInfo(Config.discordid,""..parseInt(getdiscord).."") then
                    exports['discord']:guildMemberRoleAdd(Config.discordid,""..getdiscord.."",""..Config.Empresas[GetJogador[1].empresa].Cargo_Discord.."")
                else
                    TriggerClientEvent("Notify",source,"verde","Entre no discord: <b>discord</b>",300000)
                    Wait(5*60000)
                    src.setar_discord_novamente()
                end
            end
        end
    end
end

RegisterCommand("advorg",function(source,args,rawCommand)
    local source = source
    local user_id = vRP.Passport(source)
    if vRP.HasPermission(user_id,"Admin") and args[1] then
        local SQL = vRP.Query("VerificarCriacao", {empresa = args[1]})
        local conta = SQL[1].avisos + 1 
        vRP.execute("updateAdvOrg", {avisos = parseInt(conta), empresa = args[1]}) -- update banco
        TriggerClientEvent("Notify",source,"verde","Advertencia aplicada: "..args[1].." total "..conta.."")
    end
end)

--------------------------------
-- [ VARIAVEL ] --
--------------------------------

local SetsEscolher = {} 
local ListaAnuncios = {}
local ListaChat = {}
local ListaMembros = {}
local ListaBuscarBau = {}


src.informacoes_player = function()
    local source = source
    local user_id = vRP.Passport(source)
    local identity = Config.Functions.getUserIdentity(user_id)
    if user_id then
        local GetImagem = vRP.Query("GetImgCelular", {owner = identity.phone})
        if GetImagem[1] then
            return ""..identity.name.." "..identity.name2.."",src.CheckImagePlayer(user_id)
        else
            return ""..identity.name.." "..identity.name2.."",src.CheckImagePlayer(user_id)
        end
    end
end

src.GetEmpresa = function()
    local source = source
    local user_id = vRP.Passport(source)
    local identity = vRP.Identity(user_id)
    local GetJogador = vRP.Query("GetEmpresa", {user_id = user_id})
    if GetJogador[1] then
        if GetJogador[1].empresa ~= "Desempregado" then
            local GetImagem = vRP.Query("GetImgCelular", {owner = identity.phone})
            if GetImagem[1] then
                vRP.Query("updateImagem", {user_id = parseInt(parseInt(user_id)),img = GetImagem[1].avatarURL })
            end
            return GetJogador[1].empresa,GetJogador[1].cargo
        end
    else
        local GetImagem = vRP.Query("GetImgCelular", {owner = identity.phone})
        if GetImagem[1] then
            if GetImagem[1].avatarURL == nil then
                vRP.Query("InsertPlayer", {user_id = parseInt(user_id),nome = ""..identity.name.." "..identity.name2.."",empresa = "Desempregado",cargo = "Nenhum",groupSetado = "Nenhum",login = os.time(),discordid = "0",img = src.CheckImagePlayer(user_id), contratante = "Sistema"})
            else
                vRP.Query("InsertPlayer", {user_id = parseInt(user_id),nome = ""..identity.name.." "..identity.name2.."",empresa = "Desempregado",cargo = "Nenhum",groupSetado = "Nenhum",login = os.time(),discordid = "0",img = src.CheckImagePlayer(user_id), contratante = "Sistema"})
            end
        else
            vRP.Query("InsertPlayer", {user_id = parseInt(user_id),nome = ""..identity.name.." "..identity.name2.."",empresa = "Desempregado",cargo = "Nenhum",groupSetado = "Nenhum",login = os.time(),discordid = "0",img = src.CheckImagePlayer(user_id), contratante = "Sistema"})
        end
        return false
    end
end

src.GetEmpresaInfos = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)

    local identity = Config.Functions.getUserIdentity(user_id)
    local Membros_Setados = vRP.Query("GetEmpresaInfos", {empresa = empresa})
     if empresas[empresa] == nil then 
        local verify = vRP.Query("VerificarCriacao", {empresa = empresa})
        empresas[empresa] = verify
    end
    local verify = empresas[empresa]
    if Config.Empresas[empresa] then
        return Config.Empresas[empresa].Permissao,#Membros_Setados,Config.Empresas[empresa].Limite_Membros,verify[1].vendas,verify[1].avisos,Config.Empresas[empresa].PaginaUpgrades,verify[1].banco or 0
    end
end
src.getCargoMaximo = function(empresa) 
    if empresa then 
        return Config.Empresas[empresa].cargos[1]
    end
end

src.getAdmin = function()
    local source = source
    local user_id = vRP.Passport(source)
    if vRP.HasGroup(user_id,"Admin",1) then
        return true
    end
end

--------------------------------
-- [ Anuncios ] --
--------------------------------

src.refreshAnuncios = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)
    ListaAnuncios = {}
    if user_id then
        local SQL = vRP.Query("GetAnuncios")
        if SQL[1] then
            for k,v in pairs(SQL) do
                if v.empresa == empresa then
                    table.insert(ListaAnuncios,{ id = v.id,empresa = v.empresa,nome = v.nome,passaporte = v.passaporte,data = v.data,color = v.color,mensagem = v.mensagem})
                end
            end
        else
            table.insert(ListaAnuncios,{ id = "-1",empresa = empresa,nome = "STAFF",passaporte = "0",data = ""..os.date("%d/%m/%Y (%H:%M)").."",color = "#fc5c5c",mensagem = "Façam ja o vosso primeiro anuncio !"})
        end
    end
end

src.returnAnuncios = function()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        return ListaAnuncios
    end
end

src.addAnuncio = function(empresa,mensagem)
    local source = source
    local user_id = vRP.Passport(source)
    local identity = Config.Functions.getUserIdentity(user_id)
    if user_id then
        if mensagem ~= "" then
            vRP.Query("InsertAnuncios", {empresa = empresa,nome = ""..identity.name.." "..identity.name2.."",passaporte = user_id,color = "#295CDE",data = ""..os.date("%d/%m/%Y (%H:%M)").."",mensagem = mensagem})
            return true
        else
            return false
        end
    end
end

 
--------------------------------
-- [ Chat ] --
--------------------------------

src.refreshChat = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)
    ListaChat = {}
    if user_id then
        local SQL = vRP.Query("GetChat")
        if SQL[1] then
            for k,v in pairs(SQL) do
                if v.empresa == empresa then
                    local SQLPlayer = vRP.Query("GetEmpresa", {user_id = v.passaporte})
                    table.insert(ListaChat,{ id = v.id,empresa = v.empresa,nome = v.nome,passaporte = v.passaporte,data = v.data,imagem = src.CheckImagePlayer(v.passaporte),mensagem = v.mensagem})
                end
            end
        end
    end
end

src.returnChat = function()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        return ListaChat
    end
end

src.addChat = function(empresa,mensagem)
    local source = source
    local user_id = vRP.Passport(source)
    local identity = Config.Functions.getUserIdentity(user_id)
    if user_id then
        if mensagem ~= "" and mensagem ~= " " and mensagem ~= "  " and mensagem ~= "   " and mensagem ~= "    " and mensagem ~= "     " and mensagem ~= "     " and mensagem ~= "     " and mensagem ~= "      " and mensagem ~= "      " and mensagem ~= "      " and mensagem ~= "      " and mensagem ~= "      " and mensagem ~= "      " then
            vRP.Query("InsertChat", {empresa = empresa,nome = ""..identity.name.." "..identity.name2.."",passaporte = user_id,data = ""..os.date("%d/%m/%Y (%H:%M)").."",mensagem = mensagem})
            return true
        else
            return false
        end
    end
end

--------------------------------
-- [ Get Membros ] --
--------------------------------

src.refreshMembros = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)
    ListaMembros = {}
    if user_id then
        local SQL = vRP.Query("GetEmpresaInfos", {empresa = empresa})
        if SQL[1] then
            for k,v in pairs(SQL) do
                if v.empresa == empresa then
                    local id = vRP.Source(parseInt(v.user_id))
                    if id then
                        table.insert(ListaMembros,{ passaporte = v.user_id, nome = v.nome, empresa = empresa_ver, cargo = v.cargo, img = src.CheckImagePlayer(v.user_id), color = "#1ec450", status = "Online", contratante = v.contratante })
                    else
                        table.insert(ListaMembros,{ passaporte = v.user_id, nome = v.nome, empresa = empresa_ver, cargo = v.cargo, img = src.CheckImagePlayer(v.user_id), color = "#fc5c5c", status = "Offline", contratante = v.contratante })
                    end
                end
            end
        end
    end
end

src.returnMembros = function()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        return ListaMembros
    end
end

--------------------------------
-- [ Contratar ] --
--------------------------------
 
RegisterCommand(Config.comando_blacklist,function(source,args,rawCommand)
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        if args[1] then
            local identity = vRP.Identity(user_id)
			local identity2 = vRP.Identity(parseInt(args[1]))
            vRP.Query("updateBlacklist", {user_id = parseInt(parseInt(args[1])), blacklist = 0})
            TriggerClientEvent("Notify",source,"sucesso","Backlist removida do passaporte: "..args[1].." ", 5000)
                PerformHttpRequest(Config.log_blacklist, function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Removeu Blacklist**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Player:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..args[1].."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                                icon_url = Config.icon_url
                            },
                            image = { 
                                url = Config.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })
        else
            TriggerClientEvent("Notify",source,"negado","Insira o passaporte ex. <b>/removeblacklist "..user_id.."</b>")
        end
    end
end)

src.contratar = function(empresa,passaporte)
    local source = source
    local user_id = vRP.Passport(source)
    local nuser_source = vRP.userSource(parseInt(passaporte))
    local nplayer = vRP.getUserSource(parseInt(passaporte))
    if nuser_source then
        local identity2 = vRP.Identity(parseInt(passaporte))
        local identity = vRP.Identity(parseInt(user_id))
        if vRP.Request(source,"Você deseja contratar o #"..passaporte.." "..identity2.name.." "..identity2.name2.." ?","sim","nao") then
            local GetJogador = vRP.Query("GetEmpresa", {user_id = parseInt(passaporte)})
            
            if GetJogador[1] then
                if GetJogador[1].empresa == "Desempregado" then
                    local GetJogador2 = vRP.Query("GetEmpresa", {user_id = user_id})
                    local time = GetJogador[1].blacklist
                    if not time or parseInt((time - os.time())) <= 0 then
                       
                        if vRP.Request(nuser_source,"Voce deseja ser contratado para "..empresa.." ?","sim","nao") then
                            if Config.Empresas[empresa].Cargo_Discord then
                                local getdiscord = vRP.getDiscordPlayer(parseInt(passaporte))
                               
                            end
                            TriggerClientEvent("Notify",source,"verde","Você contratou o <b>"..identity2.name.." "..identity2.name2.." ["..passaporte.."]</b> para a <b>"..empresa.."</b>",5000)
                    
                            
                                vRP.Query("updateEmpPlayer", {user_id = parseInt(parseInt(passaporte)),empresa = empresa, cargo = Config.Empresas[empresa].Acesso_Default, groupSetado = Config.Empresas[empresa].Cargo_Default})
                                vRP.SetPermission(parseInt(passaporte),Config.Empresas[empresa].Cargo_Default,Config.Empresas[empresa].Cargo_DefaultLevel)
                                local Message = "**[ID]:** "..user_id.."\n**[CONTRATOU]: **"..passaporte.."\n**[NOME]:** "..identity2.name.." "..identity2.name2
                                SendWebhookMessage(Config.Empresas[empresa].logs_contratar, Message)
                              
                                
                            return true
                        else
                            TriggerClientEvent("Notify",source,"vermelho","Ele recusou o convite")
                        end
                    else

                        TriggerClientEvent("Notify",parseInt(nplayer),"vermelho","Você ainda precisa esperar "..parseInt((time - os.time()) / (3600)).." horas para ser contratado")
                        if user_id ~= parseInt(passaporte) then
                            TriggerClientEvent("Notify",source,"vermelho","Ele precisa esperar "..parseInt((time - os.time()) / (3600)).." horas para ser contratado")
                        end
                        return false
                    end
                else
                    TriggerClientEvent("Notify",source,"vermelho","Ele já está em outra empresa")
                    if user_id ~= parseInt(passaporte) then
                        TriggerClientEvent("Notify",parseInt(passaporte),"vermelho","Você já está em uma empresa")
                    end
                    return false
                end
            else
                vRP.Query("InsertPlayer", {user_id = parseInt(passaporte),nome = ""..identity2.name.." "..identity2.name2.."",empresa = "Desempregado",cargo = "Nenhum",groupSetado = "Nenhum",login = os.time(),discordid = "0",img = src.CheckImagePlayer(user_id), contratante = "Sistema"})
                Wait(3000)
                local GetJogador = vRP.Query("GetEmpresa", {user_id = parseInt(passaporte)})
                local time = GetJogador[1].blacklist
                if not time or parseInt((time - os.time())) <= 0 then
                    if vRP.Request(nuser_source,"Voce deseja ser contratado para "..empresa.." ?","sim","nao") then
                        TriggerClientEvent("Notify",source,"verde","Você contratou o <b>"..identity2.name.." "..identity2.name2.." ["..passaporte.."]</b> para a <b>"..empresa.."</b>",5000)
                        vRP.Query("updateEmpPlayer", {user_id = parseInt(parseInt(passaporte)),empresa = empresa, cargo = Config.Empresas[empresa].Acesso_Default, groupSetado = Config.Empresas[empresa].Cargo_Default})
                        vRP.setPermission(parseInt(passaporte),Config.Empresas[empresa].Cargo_Default)
                        return true
                    else
                        TriggerClientEvent("Notify",source,"vermelho","Ele recusou o convite")
                    end
                end
            end
        end
    end
end

function calculaExpireTime(dias)
    local stimer = parseInt(os.time()+(24*dias*60*60))
    return stimer
end


--------------------------------
-- [ Buscar Vendas ] --
--------------------------------

src.refreshVendas = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)
    ListaVendas = {}
    if user_id then
        local SQL = vRP.Query("GetVendas")
        if SQL[1] then
            for k,v in pairs(SQL) do
                if v.empresa == empresa then
                    local SQLPlayer = vRP.Query("GetEmpresa", {user_id = v.passaporte})
                    table.insert(ListaVendas,{ id = v.id,passaporte = v.passaporte, vendedor = v.vendedor,comprador = v.comprador,imagem = v.imagem,valor = parseFormat(parseInt(v.valor)),data = v.data,imagemplayer = src.CheckImagePlayer(v.passaporte),cargo = SQLPlayer[1].cargo})
                end
            end
        end
    end
end

src.returnVendas = function()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        return ListaVendas
    end
end

src.CriarVenda = function(empresa,compradorInput,valorInput,imagem_venda)
    local source = source
    local user_id = vRP.Passport(source)
    if compradorInput then
        if parseInt(valorInput) > 0 then
            local identity =vRP.getUserIdentity(user_id)
            local Message = "**[ID]:** "..user_id.."\n**[NOME]:** "..identity.name.." "..identity.name2.."\n**[VENDEU]: $**"..valorInput.."**[ITENS]: **"..compradorInput
            SendWebhookMessage(Config.Empresas[empresa].logs_vendas, Message)
            vRP.Query("InsertVenda", {empresa = empresa,passaporte = user_id,vendedor = ""..identity.name.." "..identity.name2.."",comprador = compradorInput,imagem = imagem_venda,valor = parseInt(valorInput),data = ""..os.date("%d/%m/%Y (%H:%M)")..""})     
            local SQL = vRP.Query("VerificarCriacao", {empresa = empresa})
            if SQL[1] then
                for k,v in pairs(SQL) do
                    if v.empresa == empresa then
                        local vendas = v.vendas + 1
                        vRP.execute("updateVendaOrg", {vendas = parseInt(vendas), empresa = empresa}) -- update banco
                        src.refreshVendas(empresa)
                        break
                    end
                end
            end
            
            return true
        end
    end
end

src.verVenda = function(idvenda)
    local source = source
    local user_id = vRP.Passport(source)
    local vendaInfos = vRP.Query("GetVendaId", {id = parseInt(idvenda)})
    local SQLPlayer = vRP.Query("GetEmpresa", {user_id = vendaInfos[1].passaporte})
    return idvenda,vendaInfos[1].passaporte,vendaInfos[1].empresa,vendaInfos[1].vendedor,vendaInfos[1].comprador,vendaInfos[1].imagem,parseFormat(parseInt(vendaInfos[1].valor)),vendaInfos[1].data,src.CheckImagePlayer(vendaInfos[1].passaporte)
end

src.deletarVenda = function(idvenda)
    local source = source
    local user_id = vRP.Passport(source)
    local identity = vRP.getUserIdentity(user_id)
    local vendaInfos = vRP.Query("GetVendaId", {id = parseInt(idvenda)})
    local SQLPlayer = vRP.Query("GetEmpresa", {user_id = user_id})
    local SQL = vRP.Query("VerificarCriacao", {empresa = SQLPlayer[1].empresa})
    if SQL[1] then
        for k,v in pairs(SQL) do
            --if v.empresa == empresa then
                local vendas = v.vendas - 1
                vRP.execute("updateVendaOrg", {vendas = parseInt(vendas), empresa = SQLPlayer[1].empresa}) -- update banco
                src.refreshVendas(SQLPlayer[1].empresa)
                break
            --end
        end
    end

    vRP.Query("deleteVenda", { id = idvenda })

    local Message = "**[ID]:** "..user_id.."\n**[NOME]:** "..identity.name.." "..identity.name2.."\n**[APAGOU]: ID **"..idvenda.."\nITENS: "..vendaInfos[1].comprador.."\nVALOR: "..vendaInfos[1].valor
    SendWebhookMessage(Config.Empresas[SQLPlayer[1].empresa].logs_vendas, Message)
    return true
end


--------------------------------
-- [ Demitir ] --
--------------------------------

src.demitir = function(empresa,passaporte)
    local source = source
    local user_id = vRP.Passport(source)
    local nuser_source = vRP.Source(parseInt(passaporte))
    if user_id == 1425000 then
        local identity2 = Config.Functions.Identity(parseInt(passaporte))
        vRP.remPermission(parseInt(passaporte),Config.Empresas[empresa].Cargo_Default)
        TriggerClientEvent("Notify",source,"negado","Você demitiu o <b>"..identity2.name.." "..identity2.name2.."</b>")
        vRP.Query("updateEmpPlayer", {user_id = parseInt(parseInt(passaporte)),empresa = "Desempregado", cargo = "Nenhum", groupSetado = "Nenhum"})
    else
        if vRP.Request(source,"Você deseja demitir o passaporte: "..passaporte.." ?","sim","não") then
            local identity2 = Config.Functions.getUserIdentity(parseInt(passaporte))
            vRP.remPermission(parseInt(passaporte),Config.Empresas[empresa].Cargo_Default)
            TriggerClientEvent("Notify",source,"negado","Você demitiu o <b>"..identity2.name.." "..identity2.name2.."</b>")
            vRP.Query("updateEmpPlayer", {user_id = parseInt(parseInt(passaporte)),empresa = "Desempregado", cargo = "Nenhum", groupSetado = "Nenhum"})
            vRP.Query("updateBlacklist", {user_id = parseInt(parseInt(passaporte)), blacklist = calculaExpireTime(Config.DiasBlacklist)})
            local Message = "**[ID]:** "..user_id.."\n**[DEMITIU]: **"..passaporte.."\n**[NOME]:** "..identity2.name.." "..identity2.name2
            SendWebhookMessage(Config.Empresas[empresa].logs_demitir, Message)
        end
    end

end

--------------------------------
-- [ Promover ] --
--------------------------------

src.promover = function(empresa,passaporte)
    local source = source
    local user_id = vRP.Passport(source)
    local nuser_source = vRP.Source(parseInt(passaporte))
    local profiss = 0
    if user_id then
        for k,v in pairs(Config.Empresas[empresa].cargos) do

            local GetJogador = vRP.Query("GetEmpresa", {user_id = parseInt(passaporte)})
       
            if GetJogador[1].cargo == v.Acesso then
                if k == 1 then
                    TriggerClientEvent("Notify",source,"vermelho","Ele já está no cargo <b>Máximo</b>")
                else
                    profiss = Config.Empresas[empresa].cargos[k - 1]
                    local GetJogador = vRP.Query("GetEmpresa", {user_id = user_id})

                    local identity2 = Config.Functions.getUserIdentity(parseInt(passaporte))

                    TriggerClientEvent("Notify",source,"verde","Você promoveu o <b>"..identity2.name.." "..identity2.name2.."</b> a <b>"..profiss.Set.."</b>")
                    vRP.SetPermission(parseInt(passaporte),profiss.Set,k-1)
                   
                    vRP.Query("updateEmpPlaye3r", {user_id = parseInt(parseInt(passaporte)),cargo = profiss.Acesso})
                    local Message = "**[ID]:** "..user_id.."\n**[PROMOVEU]: **"..passaporte.."\n**[NOME]:** "..identity2.name.." "..identity2.name2
                    SendWebhookMessage(Config.Empresas[empresa].logs_promover, Message)
               
                end
            end


        end
    end
end
--------------------------------
-- [ Rebaixar ] --
--------------------------------
src.rebaixar = function(empresa,passaporte)
    local source = source
    local user_id = vRP.Passport(source)
    local nuser_source = vRP.Source(parseInt(passaporte))
    local profiss = 0
    if user_id then
        for k,v in pairs(Config.Empresas[empresa].cargos) do

            local GetJogador = vRP.Query("GetEmpresa", {user_id = parseInt(passaporte)})
            if GetJogador[1].cargo == v.Acesso then
                profiss = Config.Empresas[empresa].cargos[k + 1]
                if profiss ~= nil then
                    local identity2 = Config.Functions.getUserIdentity(parseInt(passaporte))

                    TriggerClientEvent("Notify",source,"amarelo","Você rebaixou o <b>"..identity2.name.." "..identity2.name2.."</b> a <b>"..profiss.Set.."</b>")
                    vRP.SetPermission(parseInt(passaporte),profiss.Set,k+1)

                    vRP.Query("updateEmpPlayer", {user_id = parseInt(parseInt(passaporte)),empresa = empresa, cargo = profiss.Acesso, groupSetado = profiss.Set})
                    local Message = "**[ID]:** "..user_id.."\n**[REBAIXOU]: **"..passaporte.."\n**[NOME]:** "..identity2.name.." "..identity2.name2
                    SendWebhookMessage(Config.Empresas[empresa].logs_rebaixar, Message)
               
                    return true
                else
                    TriggerClientEvent("Notify",source,"vermelho","Ele já está no cargo <b>Mínimo</b>")
                end
            end

        
        end
    end
end
--------------------------------
-- [ upgrade ] --
--------------------------------
src.upgrade = function(empresa)
    local source = source
    local user_id = vRP.Passport(source)
    if empresa then
        local verify = vRP.Query("VerificarCriacao", {empresa = empresa})
        local novoNumero = verify[1].upgradeCraft + 1
        if Config.Empresas[empresa].upgrades[novoNumero] then
            if vRP.Request(source,"Você deseja comprar o upgrade de "..Config.Empresas[empresa].upgrades[novoNumero].nome.." por "..Config.Empresas[empresa].upgrades[novoNumero].valor.." ?","sim","nao") then
                if vRP.PaymentFull(user_id,parseInt(Config.Empresas[empresa].upgrades[novoNumero].valor)) then
                    vRP.Query("updateUpgradse", {empresa = empresa, upgradeCraft = novoNumero})
                    TriggerClientEvent("Notify",source,"verde","<b>"..Config.Empresas[empresa].upgrades[novoNumero].nome.."</b> comprado com sucesso")
                else
                    TriggerClientEvent("Notify",source,"vermelho","Você não tem dinheiro.")
                end
            end
        else
            TriggerClientEvent("Notify",source,"vermelho","Não existem mais upgrades.")
        end
    end
end


function getEmpresas ()
	return Config.Empresas
end


