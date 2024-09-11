--------------------------------
-- [ CONEXAO ] --
--------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
src = {}
Tunnel.bindInterface("wine_staff",src)
vCLIENT = Tunnel.getInterface("wine_staff")
Config = module(GetCurrentResourceName(), "cfg/config")
Function = module(GetCurrentResourceName(), "cfg/functions")

vPLAYER = Tunnel.getInterface("player")


--------------------------------
-- [ VARIAVEIS ] --
--------------------------------

local logsTables = {}
local freeze = false
local banner_player = "./img/tenor.gif"

--------------------------------
-- [ SQL ] --
--------------------------------

vRP._prepare("wine_staff/jesterInstagram", "SELECT * FROM smartphone_instagram WHERE user_id = @user_id")
vRP._prepare("warn/infosTeleports", "SELECT * FROM wine_staff_teleportes WHERE user_id = @user_id") 
vRP._prepare("warn/insertTeleports", "INSERT INTO wine_staff_teleportes(user_id,id,nome,coords) VALUES(@user_id,@id,@nome,@coords)") 
vRP._prepare("warn/deleteTeleport","DELETE FROM wine_staff_teleportes WHERE id = @id")
-- vRP._prepare("warn/getadvs","SELECT * FROM wine_admin")
-- vRP._prepare("warn/getadvsId","SELECT * FROM wine_admin WHERE user_id = @user_id and status = @status")
-- vRP._prepare("warn/setadvs","INSERT INTO wine_admin (user_id,foto,background,color,status, contagem,nome, motivo,staff,data) VALUES(@user_id,@foto,@background,@color,@status,@contagem,@nome,@motivo,@staff,@data)")




vRP._prepare("warn/wine_staff_teleportes", [[
    CREATE TABLE IF NOT EXISTS wine_staff_teleportes(
        user_id INTEGER,
        id longtext,
        nome longtext,
        coords longtext
    )
]])

Citizen.CreateThread(function()
    vRP.execute("warn/wine_staff_teleportes")
end)

--------------------------------
-- [ VER PERMISSAO ] --
--------------------------------

src.Check_Permissao = function()
    local source = source
    local user_id = vRP.Passport(source)
    return vRP.HasGroup(user_id,"Admin", 1) or vRP.HasGroup(user_id,"Owner", 1)
end


src.ReturnInfos = function()
    local quantidade = 0
    local users = vRP.Players()
    for k,v in pairs(users) do
        quantidade = quantidade + 1
    end

    local id,Police = vRP.NumService("Police")
    local id2,Staff = vRP.NumPermission("Staff")
    local id3,Admin = vRP.NumPermission("Admin")
    local id3,Hospital = vRP.NumService("Paramedic")
    return quantidade, (Staff + Admin), Police, Hospital 
end

src.ReturnNames = function()
    local source = source
    local user_id = vRP.Passport(source)
   
    if user_id then
        local identity = vRP.Identity(user_id)
        if identity then
            
            return identity.name,identity.name2,Config['imagens'].semFoto
        end
     end
end

--------------------------------
-- [ CASAS ] --
--------------------------------
src.consultCasasList = function(Passport)
    local identity = vRP.userIdentity(parseInt(Passport))
    local casas = {}
    local myHomes = vRP.query("homes/get_homeuserid",{ user_id = parseInt(Passport) })
    if parseInt(#myHomes) >= 1 then
        for k,v in pairs(myHomes) do
            table.insert(casas,{ home = v.home,  user_id = Passport, nome = identity.name.." ".. identity.name2 })
            Citizen.Wait(10)
        end
        return casas, Config.Imagens_Casas
    end
    return false
end

src.consultverBauCasaList = function(Passport, casa)
    if Passport and casa then 
        local identity = vRP.userIdentity(parseInt(Passport))

        local myHomes = vRP.query("homes/get_homepermissions",{ home = tostring(casa) })
        if parseInt(#myHomes) >= 1 then
            local casas = {}
            for k,v in pairs(json.decode(myHomes[1].bau)) do
                table.insert(casas,{
                user_id = Passport,
                nome = identity.name.." ".. identity.name2,
                name = itemName(v.item),
                item = itemName(v.item),
                index = v.item,
                amount = v.amount,
                linkinventario = Config.Imagens_InventarioXamp
            })
                Citizen.Wait(10)
            end
            
         return casas, Config.Imagens_Casas
        end

    end
end

src.removerItemBauCasa = function(Passport, casa, item, quantidade)
    local myHomes = vRP.query("homes/get_homepermissions", {home = tostring(casa)})
    if parseInt(#myHomes) >= 1 then
        local casas = json.decode(myHomes[1].bau)
        for k, v in pairs(json.decode(myHomes[1].bau)) do
            local Split = splitString(item, "-")
            local Split2 = splitString(v.item, "-")
            if Split2[1] == Split[1] then 
                -- Remove o item da tabela Lua
                casas[k] = nil
                -- Codifica a tabela Lua de volta para JSON
                local novoBau = json.encode(casas)
                -- Atualiza o baú no banco de dados
                vRP.execute("homes/updateBau", {bau = novoBau, home = tostring(casa)})
                return true 
            end
        end
    end
    return false 
end
--------------------------------
-- [ PUNIÇÕES ] --
--------------------------------

src.addBan = function (Passaporte, motivo)
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.HasGroup(Passport,"Owner",2) or vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Moderador",1) and parseInt(Passaporte) > 0 and parseInt(motivo) > 0 then
            local Days = parseInt(365)
            local OtherPassport = parseInt(Passaporte)
            local Identity = vRP.Identity(OtherPassport)
            if Identity then
             --   vRP.Query("banneds/InsertBanned",{ license = Identity["license"], time = Days })
                TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..OtherPassport.."</b> banido por <b>"..Days.."</b> dias.",5000)
                TriggerEvent("Discord","BANIMENTO","**[BANIMENTOS] | REGISTROS**\n\n**[STAFF ID]:** "..Passport.."\n**[BANIDO ID]:** "..Passaporte.. "\n**[MOTIVO]:**" ..motivo.. "\n**[TEMPO]:** "..Days.."\n\n**[HORÁRIO]:** \n"..os.date("[%d/%m/%Y as %H:%M]").."")    
                local OtherSource = vRP.Source(OtherPassport)
                if OtherSource then
                 --  vRP.Kick(OtherSource,"Você foi banido do servidor! \n\nMotivo: "..motivo.." \n\nTempo: "..Days.." dias! \n\nPara recorrer acesse: https://discord.gg/4NxSDmrwRq \n\nComprar UNBAN: https://nxt.hydrus.gg/")
                end
            end
        end
    end
end
src.addTempBan = function (Passaporte, motivo)
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.HasGroup(Passport,"Owner",2) or vRP.HasGroup(Passport,"Admin",1) or vRP.HasGroup(Passport,"Moderador",1) and parseInt(Passaporte) > 0 and parseInt(motivo) > 0 then
            local Days = parseInt(3)
            local OtherPassport = parseInt(Passaporte)
            local Identity = vRP.Identity(OtherPassport)
            if Identity then
                vRP.Query("banneds/InsertBanned",{ license = Identity["license"], time = Days })
                TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..OtherPassport.."</b> banido por <b>"..Days.."</b> dias.",5000)
                TriggerEvent("Discord","BANIMENTO","**[BANIMENTOS] | REGISTROS**\n\n**[STAFF ID]:** "..Passport.."\n**[BANIDO ID]:** "..Passaporte.. "\n**[MOTIVO]:**" ..motivo.. "\n**[TEMPO]:** "..Days.."\n\n**[HORÁRIO]:** \n"..os.date("[%d/%m/%Y as %H:%M]").."")    
                local OtherSource = vRP.Source(OtherPassport)
                if OtherSource then
                    vRP.Kick(OtherSource,"Você foi banido do servidor! \n\nMotivo: "..motivo.." \n\nTempo: "..Days.." dias! \n\nPara recorrer acesse: https://discord.gg/4NxSDmrwRq \n\nComprar UNBAN: https://nxt.hydrus.gg/")
                end
            end
        end
    end
end
src.addKick = function (Passaporte, motivo)
    local OtherSource = vRP.Source(Passaporte)
    if OtherSource then
        TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..Message[1].."</b> expulso.",5000)
        vRP.Kick(OtherSource,"Expulso da cidade.")
        --SendWebhookMessage(webkick,"```prolog\n[ID]: "..Passport.." \n[Kickou Id:]: "..Message[1].."\n"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end
src.addAdv = function (Passaporte, motivo)

end


-- src.consultPunicoesList = function(Passaporte)
--     local user_id = Passaporte-- Obtém o ID do usuário
--     local status = 'Banido' -- Obtém o status do usuário
--     local rows = vRP.query("warn/getadvs") -- Obtém todos os registros da tabela wine_admin
--     local itensPunicoes = {} -- Inicializa a tabela para armazenar os resultados

--     -- Itera sobre os registros para verificar se já existe um registro com o mesmo status para o usuário
--     for k, v in pairs(rows) do
--         if v.user_id == user_id and v.status == status then
--             -- Incrementa o contador se encontrar um registro correspondente
--             v.contagem = (v.contagem or 0) + 1
--         end
--         -- Adiciona o registro na tabela de itens de punições
--         table.insert(itensPunicoes, {
--             user_id = v.user_id,
--             foto = v.foto or Config['imagens'].semFoto,
--             background = v.background or Config['puni'].background,
--             color = v.color or Config['puni'].color,
--             status = v.status,
--             contagem = v.contagem,
--             id = v.id,
--             nome = v.nome,
--             motivo = v.motivo,
--             staff = v.staff,
--             data = v.data
--         })
--     end
    
--     return itensPunicoes -- Retorna a tabela de itens de punições
-- end



--------------------------------
-- [ TELEPORT ] --
--------------------------------

src.consultTeleportes = function()
    local source = source
    local user_id = vRP.getUserId(source)
    teleportTables = {}
    if user_id then
        local SQL = vRP.query("warn/infosTeleports", {user_id = user_id})
        if SQL[1] then
            for k,v in pairs(SQL) do
                table.insert(teleportTables,{id = v.id,nome = v.nome, coord = json.decode(v.coords) })
            end
        end
    end
end

src.consultList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return teleportTables
    end
end

src.addTeleport = function(returnNome)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,Config.Perms.teleport) then
            if returnNome ~= "" then 
                returnCord = GetEntityCoords(GetPlayerPed(source))
                local aleatorio = math.random(1,99999)
                vRP.execute("warn/insertTeleports", { user_id = user_id, id = aleatorio, nome = returnNome, coords = json.encode(returnCord)})
                return true
            else
                TriggerClientEvent("Notify",source,"azul","Voce precisa inserir um <b>Nome</b>.",10000)
            end
        else
            TriggerClientEvent("Notify",source,"vermelho","Voce nao tem <b>Permissao</b>.",10000)
        end
    end
end

src.delTeleport = function(returnId,returnNome)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.execute("warn/deleteTeleport", { id = returnId })
        return true
    end
end

--------------------------------
-- [ Consult Players ] --
--------------------------------

src.consultControle = function()
    local source = source
    local user_id = vRP.getUserId(source)
    ControleTables = {}
    local players = vRP.userList()
    if user_id then
        for k,v in pairs(players) do
            local identity = vRP.userIdentity(k)
            local infos = vRP.query("wine_staff/jesterInstagram", {user_id = parseInt(k)})
            if k ~= 884 then
                if infos[1] then
                    table.insert(ControleTables,{user_id = k, nome = identity.name.." ".. identity.name2, foto = infos[1].avatarURL })
                else
                    table.insert(ControleTables,{user_id = k, nome = identity.name.." ".. identity.name2, foto = Config['imagens'].semFoto })
                end
            end
        end
    end
end

src.consultControleList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return ControleTables
    end
end

hasGroup = function(passaporte)
    
   if vRP.HasPermission(user_id,"Platina") then 
        return "Vip Platina"
   end
   if vRP.HasPermission(user_id,"Ouro") then 
        return "Vip Ouro"
   end
   if vRP.HasPermission(user_id,"Prata") then 
        return "Vip Prata"
   end
   if vRP.HasPermission(user_id,"Bronze") then 
        return "Vip Bronze"
   end
   return "Sem Vip"


end
 
src.SetIdentidade = function(passaporte)
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.userSource(parseInt(passaporte))
    if nplayer then
        local identity = vRP.userIdentity(parseInt(passaporte))
        local banco =identity.bank
        local carteira = vRP.getInventoryItemAmount(parseInt(passaporte),"dollars") or 0
        local GetJogador = vRP.Query("GetEmpresa", {user_id = parseInt(passaporte)}) or {}
        local emprego
        if #GetJogador > 0 and GetJogador[1].empresa then 
            emprego = GetJogador[1].empresa
       else
            emprego = "Desempregado"
       end
        local vip = vRP.HasPermission(user_id,"Premium") or "Nenhum"
        local teste = vRP.Account(identity.license)
        local coins = teste.gems
      
        local infos = vRP.query("wine_staff/jesterInstagram", {user_id = parseInt(passaporte)})
        if infos[1] then
            return parseFormat(carteira),parseFormat(banco),identity.name,identity.name2,identity.license,identity.phone,Sanguine(identity.blood),emprego,vip,parseFormat(coins),infos[1].avatarURL,banner_player
        else
            return parseFormat(carteira),parseFormat(banco),identity.name,identity.name2,identity.license,identity.phone,Sanguine(identity.blood),emprego,vip,parseFormat(coins),Config['imagens'].semFoto,banner_player
        end
    end
end

--------------------------------
-- [ Lista de Itens ] --
--------------------------------

src.consultItens = function()
	local source = source
	local user_id = vRP.getUserId(source) 
	if user_id then
        itemlist = {}
        for k,v in pairs(returnLista()) do
            
            if k ~= "dollars" or k ~= "WEAPON_RAYPISTOL" then
                table.insert(itemlist,{ 	
                    item = k,
                    name = v.Name, 
                    index = v.Index,
                    linkinventario = Config.Imagens_Inventario
                })
            end
        end
	return itemlist
	end
end

src.consultItenstsList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return itemlist
    end
end

src.pegarItem = function(item_pegar,quantidade)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    if user_id then
        if vRP.HasGroup(user_id,Config.Perms.pegar_itens, 1) then
            vRP.giveInventoryItem (user_id,item_pegar,quantidade,true)
            TriggerClientEvent("Notify",source,"verde","Voce Pegou <b>"..quantidade.."x "..itemName(item_pegar).."</b>.",10000)

            local identity = vRP.userIdentity(user_id)
            PerformHttpRequest(Config.Webhooks.spanwItem, function(err, text, headers) end, 'POST', json.encode({
            embeds = {
                {     
                    title = "**Spawn de Item**",
                    fields = {
                        { 
                            name = "📝 Author:", 
                            value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                        },
                        { 
                            name = "📦 Item:", 
                            value = "" ..quantidade.."x "..itemName(item_pegar).." ",
                        },
                    }, 
                    footer = { 
                        text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                        icon_url = Config.Webhooks.icon_url
                    },
                    image = { 
                        url = ""..Config.Imagens_InventarioXamp..""..itemIndex(item_pegar)..".png",
                    },
                    thumbnail = { 
                        url = Config.Webhooks.icon_url
                    },
                    color = 3092790
                }
            }
        }), { ['Content-Type'] = 'application/json' })

            return true
        else
            TriggerClientEvent("Notify", source, "vermelho", "Voce nao tem <b>Permissao</b>",10000)
        end
    end
end

--------------------------------
-- [ Lista de Carros ] --
--------------------------------

src.consultGaragemTotal = function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		garagemList = {}

        for k,v in pairs(VehicleGlobal()) do
            table.insert(garagemList,{ 	
                carro = k,
                name = k, 
                linkgaragem = Config.Imagens_Garagem
            })
        end
		return garagemList
	end
end

src.consultGaragemListTotal = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return garagemList
    end
end

src.pegarCarro = function(carro_pegar,passaporte)
 --   print(passaporte)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    if passaporte then
        local identity2 = vRP.userIdentity(parseInt(passaporte))
        if vRP.HasGroup(user_id,Config.Perms.pegar_carros, 1) then
            vRP.execute("vehicles/addVehicles",{ Passport = passaporte, vehicle = carro_pegar, plate = vRP.generatePlate(), work = tostring(false) })
            TriggerClientEvent("Notify", source, "verde", "Voce setou o <b>"..VehicleName(carro_pegar).."</b> no passaporte: <b>"..identity2.name.." "..identity2.name2.." ["..passaporte.."]</b>.",10000)
            
            local identity2 = vRP.userIdentity(parseInt(passaporte))
            local x,y,z = vCLIENT.getPosition(source)
            PerformHttpRequest("", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Setou Carro**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Player:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },

                            { 
                                name = "🚗 Carro:", 
                                value = "" ..VehicleName(carro_pegar).." ",
                            },

                            { 
                                name = "🌐 Coordenada do Staff:", 
                                    value = ""..x..","..y..","..z.." \n \n " 
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            return true
        else
            TriggerClientEvent("Notify", source, "vermelho", "Voce nao tem <b>Permissao</b>",10000)
        end
    else
        TriggerClientEvent("Notify", source, "vermelho", "Voce precisa colocar um <b>Passaporte</b>",10000)
    end
end

--------------------------------
-- [ SISTEMA VER OPCOES RAPIDAS ] --
--------------------------------
local Spectate = {}
src.opcoesRapidas = function(passaporte,tipo)
    local source = source
    local user_id = vRP.getUserId(source)
    local id = vRP.userSource(parseInt(passaporte))
    if user_id and parseInt(passaporte) ~= 77 or parseInt(passaporte) ~= 499 or parseInt(passaporte) ~= 7 then
        if id then
            local identity2 = vRP.userIdentity(parseInt(passaporte))
            local x,y,z = vCLIENT.getPosition(source)
            if tipo == "reviver" then 
				--vRPclient.revivePlayer(id,200)
                vRP.Revive(id,200,true)
				TriggerClientEvent("resetBleeding",id)
				TriggerClientEvent("resetDiagnostic",id)
                TriggerClientEvent("Notify",source,"verde","Voce reviveu o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

              
                    local identity = vRP.userIdentity(user_id)
                    PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Reviveu**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })
           

            elseif tipo == "matar" then
               -- vRPclient.revivePlayer(id,0)
                vRP.Revive(id,0,true)
                TriggerClientEvent("Notify",source,"verde","Voce matou o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

                
                local identity = vRP.userIdentity(user_id)
                PerformHttpRequest("", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Matou**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            elseif tipo == "colete" then
                --vRPclient.setArmour(id,100)
                vRP.SetArmour(id,99)
                TriggerClientEvent("Notify",source,"verde","Colete Setado no <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

                local identity = vRP.userIdentity(user_id)
                
                PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Deu Colete**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            elseif tipo == "tpto" then
                local ped = GetPlayerPed(id)
				local coords = GetEntityCoords(ped)
				vRP.teleport(source,coords["x"],coords["y"],coords["z"])
                TriggerClientEvent("Notify",source,"verde","Voce foi ate o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

                local identity = vRP.userIdentity(user_id)
                PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Tpto**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            elseif tipo == "tptome" then
                local ped = GetPlayerPed(source)
				local coords = GetEntityCoords(ped)
				vRP.teleport(id,coords["x"],coords["y"],coords["z"])	
                TriggerClientEvent("Notify",source,"verde","Voce puxou o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

                local identity = vRP.userIdentity(user_id)
                PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "****",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            elseif tipo == "fix" then
                local vehicle,vehNet,vehPlate,vehName = vRPclient.VehicleList(id,10)
               
                 if vehicle then
                --     local activePlayers = vRPclient.Players(id)
                --     print(json.encode(activePlayers))
                --     for _,v in ipairs(activePlayers) do
                --         async(function()
                --             print(json.encode(v))
                --             print(json.encode(vehNet))
                            
                            TriggerClientEvent("inventory:repairAdmin",id,vehNet,vehPlate)   
                                
                    --     end)
                    -- end

                    TriggerClientEvent("Notify",source,"verde","Voce deu fix no carro do <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")
                    local identity = vRP.userIdentity(user_id)
                    PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Reparou**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })

                else
                    TriggerClientEvent("Notify",source,"vermelho","O <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b> nao esta perto de um veiculo.")
                end
            elseif tipo == "reset" then
                if vRP.Request(source,"Você deseja resetar o passaporte: "..passaporte.." ?") then
                    fclient = Tunnel.getInterface("wine_creator")
                    if vRP.Request(id, "Deseja resetar seu personagem ?", "Sim", "Não") then
                        fclient._startCreator(id)
                    end
                    TriggerClientEvent("Notify",source,"verde","Voce resetou o personagem <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")
                end
            elseif tipo == "algema" then
                if vPLAYER.getHandcuff(id) then
                    --vPLAYER.toggleHandcuff(id)
                    
                    TriggerClientEvent("sounds:source",source,"uncuff",0.5)
                    TriggerClientEvent("sounds:source",id,"uncuff",0.5)
                    TriggerClientEvent("Notify",source,"verde","Voce desalgemou o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

                    local identity = vRP.userIdentity(user_id)
                    PerformHttpRequest("https://discord.com/api/webhooks/1121066029443989625/XPOi32N0t5D972goe-tbghh-rDzInt1Lafk9p-YN0WFLHG6gUN7bpHD54iHOKmudHEGt", function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Desalgemou**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })

                else
                    local ClosestPed = vRPclient.ClosestPed(id,2)
                    
                    TriggerClientEvent("wnalgemas", id)
                    vPLAYER.toggleHandcuff(id)
                    TriggerClientEvent("sounds:source",source,"cuff",0.5)
                    TriggerClientEvent("sounds:source",id,"cuff",0.5)
                    TriggerClientEvent("Notify",source,"verde","Voce algemou o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")

                    local identity = vRP.userIdentity(user_id)
                    PerformHttpRequest("logs", function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Algemou**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })

                end
            elseif tipo == "ragdoll" then
                TriggerClientEvent('tacklewine_staff:Player',id)
                local identity = vRP.userIdentity(user_id)
                PerformHttpRequest("logs", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Derrubou**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
            elseif tipo == "fogo" then
                TriggerClientEvent('entity:fire',id)

                local identity = vRP.userIdentity(user_id)
                PerformHttpRequest("logs", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Tacou Fogo**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            elseif tipo == "fome" then
                vRP.upgradeThirst(parseInt(passaporte),100)
				vRP.upgradeHunger(parseInt(passaporte),100)
				vRP.downgradeStress(parseInt(passaporte),100)

                local identity = vRP.userIdentity(user_id)
                PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Fome / Sede**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })

            elseif tipo == "spec" then
                if Spectate[user_id] then
                    local Ped = GetPlayerPed(Spectate[user_id])
                    if DoesEntityExist(Ped) then
                        SetEntityDistanceCullingRadius(Ped,0.0)
                    end
    
                    TriggerClientEvent("admin:resetSpectate",source)
                    Spectate[user_id] = nil
                else
                    local nsource = vRP.userSource(parseInt(passaporte))
                    if nsource then
                        local Ped = GetPlayerPed(nsource)
                     --   print(Ped)
                        if DoesEntityExist(Ped) then
                        
                            SetEntityDistanceCullingRadius(Ped,999999999.0)
                            Wait(1000)
                            TriggerClientEvent("admin:initSpectate",source,nsource)
                            Spectate[user_id] = nsource

                            local identity = vRP.userIdentity(user_id)
                            PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                            embeds = {
                                {     
                                    title = "**Spec**",
                                    fields = {
                                        { 
                                            name = "📝 Author:", 
                                            value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                        },
                                        { 
                                            name = "📝 Author:", 
                                            value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                        },
                                    }, 
                                    footer = { 
                                        text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                                       icon_url = Config.Webhooks.icon_url
                                    },
                                    thumbnail = { 
                                       url = Config.Webhooks.url
                                    },
                                    color = 3092790
                                }
                            }
                        }), { ['Content-Type'] = 'application/json' })

                        end
                    end
                end

            elseif tipo == "freezar" then
                if freeze then
                    TriggerClientEvent("Notify",source,"verde","Voce tirou o freeze do <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")
                    freeze = false
                    FreezeEntityPosition(id,false)

                    local identity = vRP.userIdentity(user_id)
                    PerformHttpRequest("Logs", function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Descongelou**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })

                else
                    TriggerClientEvent("Notify",source,"verde","Voce freezou o <b>"..identity2.name.." ".. identity2.name2.." ["..passaporte.."]</b>.")
                    freeze = true
                    FreezeEntityPosition(id,true)

                    local identity = vRP.userIdentity(user_id)
                    PerformHttpRequest("https://discord.com/api/webhooks/1121066029443989625/XPOi32N0t5D972goe-tbghh-rDzInt1Lafk9p-YN0WFLHG6gUN7bpHD54iHOKmudHEGt", function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Congelou**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })

                end
            end
        else
            TriggerClientEvent("Notify",source,"vermelho","Jogador Offline")
            return false
        end
    end
end

notScreenShoted = {}
src.tirarscreenshot = function(nuser_id)
    local source = source
    local user_id = vRP.getUserId(source)
    if nuser_id then
        local nuser_source = vRP.userSource(nuser_id)
        if nuser_source then
            local screen
            vCLIENT.panelScreenshot(nuser_source,"https://discord.com/api/webhooks/1237763474159964333/O_henek7BbhcaULMKK8sKO-w-J9njb0dmDpGdrkjypUoGnyEhAtmtDGi0TtlCBWFT5NM",nuser_id)
         
           
            local time = 0

            while not notScreenShoted[nuser_id] do
                time = time + 1
                if time >= 5 then
                    break
                end
                Wait(1500)
            end

            screen = notScreenShoted[nuser_id]
            notScreenShoted[nuser_id] = nil
            TriggerClientEvent("Notify", source, "verde", "Voce tirou uma screenshot do passaporte: <b>"..nuser_id.."</b>")
            return screen,user_id
        end
    end
end

src.addScreenshot = function(screenshot,id)
    notScreenShoted[id] = screenshot
end

src.enviarMsg = function(passaporte,mensagem)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    local nplayer = vRP.userSource(parseInt(passaporte))
    if nplayer then
        TriggerClientEvent("Notify", source, "verde", "Voce enviou uma mensagem para o passaporte: <b>"..passaporte.."</b>")
        TriggerClientEvent("Notify", nplayer, "azul", "Administração: "..mensagem.."")

        local identity = vRP.userIdentity(user_id)
        local identity2 = vRP.userIdentity(parseInt(passaporte))
        PerformHttpRequest("https://discord.com/api/webhooks/1121066029443989625/XPOi32N0t5D972goe-tbghh-rDzInt1Lafk9p-YN0WFLHG6gUN7bpHD54iHOKmudHEGt", function(err, text, headers) end, 'POST', json.encode({
        embeds = {
            {     
                title = "**Reviveu**",
                fields = {
                    { 
                        name = "📝 Author:", 
                        value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                    },
                    { 
                        name = "📝 Author:", 
                        value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                    },
                    { 
                        name = "📦 Mensagem:", 
                        value = ""..mensagem.." ",
                    },
                }, 
                footer = { 
                    text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                   icon_url = Config.Webhooks.icon_url
                },
                thumbnail = { 
                   url = Config.Webhooks.url
                },
                color = 3092790
            }
        }
    }), { ['Content-Type'] = 'application/json' })

        return true
    else
        TriggerClientEvent("Notify", source, "vermelho", "Voce precisa colocar um <b>Passaporte</b>")
    end
end

--------------------------------
-- [ LISTA 1S ] --
--------------------------------

src.consultSkins = function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
        skinsTable = {}
        for k,v in pairs(Config.Skins) do
            table.insert(skinsTable,{ nome = v.nome,set = v.set, linkskins = Config.Imagens_Skins, sexo = v.sexo })
        end
        return skinsTable
	end
end

src.consultSkinsList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return skinsTable
    end
end

RegisterCommand('skinsuri',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id == 1848 then
		if parseInt(args[1]) == 1 then
            vRPclient.applySkin(source,GetHashKey("ig_thimagro"))
            vRP.updateSelectSkin(user_id,GetHashKey(skin))
            Wait(1000)
            vRPclient.revivePlayer(source,200)
            TriggerClientEvent("Notify",source,"verde","Você setou a skin <b>ig_thimagro</b>.")
        elseif parseInt(args[1]) == 2 then
            vRPclient.applySkin(source,GetHashKey("ig_thimagro2"))
            vRP.updateSelectSkin(user_id,GetHashKey(skin))
            Wait(1000)
            vRPclient.revivePlayer(source,200)
            TriggerClientEvent("Notify",source,"verde","Você setou a skin <b>ig_thimagro2</b>.")
        else
            vRPclient.applySkin(source,GetHashKey("AnaoIsaac"))
            vRP.updateSelectSkin(user_id,GetHashKey(skin))
            Wait(1000)
            vRPclient.revivePlayer(source,200)
            TriggerClientEvent("Notify",source,"verde","Você setou a skin <b>AnaoIsaac</b>.")
		end
	end
end)

RegisterCommand('skinlenna',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id == 3697 then
        vRPclient.applySkin(source,GetHashKey("BSMODS_OrangeCloset"))
        vRP.updateSelectSkin(user_id,GetHashKey(skin))
        Wait(1000)
        vRPclient.revivePlayer(source,200)
        TriggerClientEvent("Notify",source,"verde","Você setou a skin <b>BSMODS_OrangeCloset</b>.")
	end
end)

src.SetarSkin = function(passaporte,skin)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    local nplayer = vRP.userSource(parseInt(passaporte))
    if nplayer then
        if skin ~= "DKS_ADULTAMiaO" or user_id == 1 then
            vRPclient.applySkin(nplayer,GetHashKey(skin))
            vRP.updateSelectSkin(parseInt(passaporte),GetHashKey(skin))
            Wait(1000)
            vRPclient.revivePlayer(nplayer,200)
            TriggerClientEvent("Notify",source,"verde","Você setou a skin <b>"..skin.."</b> no passaporte <b>"..parseInt(passaporte).."</b>.")
            local identity2 = vRP.userIdentity(parseInt(passaporte))
            local x,y,z = vCLIENT.getPosition(source)
            PerformHttpRequest(Config.Webhooks.skins, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**"..skin.."**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Player:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                            { 
                                name = "🌐 Coordenada do Staff:", 
                                    value = ""..x..","..y..","..z.." \n \n " 
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        image = { 
                            url = ""..Config.Imagens_Skins..""..skin..".png",
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
        else
            TriggerClientEvent("Notify", source, "vermelho", "Skin <b>indisponivel</b>")
        end    
        return true
    else
        TriggerClientEvent("Notify", source, "vermelho", "Esse jogador esta <b>offline</b>")
    end
end


--------------------------------
-- [ SISTEMA VER INEVNTARIO ] --
--------------------------------

src.consultInventario = function(passaporte)
    local source = source
    local user_id = vRP.getUserId(source)
    InventarioTable = {}
    local inv = vRP.Inventory(parseInt(passaporte))
    local identity = vRP.userIdentity(parseInt(passaporte))
    if user_id then
        for k,v in pairs(inv) do
            
            if itemName(v["item"]) and itemName(v["item"]) ~= "Deletado" then

                local splitName = splitString(v["item"],"-")
				if splitName[2] ~= nil then
					if itemDurability(v["item"]) then
						v["durability"] = parseInt(os.time() - splitName[2])
						v["days"] = itemDurability(v["item"])
					else
						v["durability"] = 0
						v["days"] = 1
					end
				else
					v["durability"] = 0
					v["days"] = 1
				end

                table.insert(InventarioTable,{ 	
                    user_id = passaporte,
                    nome = identity.name.." ".. identity.name2,
                    item = v["item"],
                    amount = parseInt(v.amount), 
                    name = itemName(v["item"]), 
                    index = itemIndex(v["item"]),
                    days = v["days"],
                    durability = v["durability"],
                    linkinventario = Config.Imagens_Inventario
                })
            end
        end
    end
end

src.consultInventarioList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return InventarioTable
    end
end

src.removerItem = function(passaporte,item,quantidade)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
        vRP.removeInventoryItem(parseInt(passaporte),item,quantidade,true)
        local identity2 = vRP.userIdentity(parseInt(passaporte))
        TriggerClientEvent("Notify", source, "verde", "Voce retirou <b>"..quantidade.."x "..itemName(item).."</b> do "..identity2.name.." "..identity2.name2.." ["..passaporte.."]")
        local x,y,z = vCLIENT.getPosition(source)
            PerformHttpRequest(Config.Webhooks.control_inventario, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Removeu Item**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Player:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                            { 
                                name = "🎁 Item:", 
                                value = " "..parseFormat(quantidade).."x " ..itemName(item).."",
                            },
                            { 
                                name = "🌐 Coordenada do Staff:", 
                                    value = ""..x..","..y..","..z.." \n \n " 
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        image = { 
                            url = ""..Config.Imagens_InventarioXamp..""..itemIndex(item)..".png",
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
    return true
end

--------------------------------
-- [ SISTEMA VER GARAGEM ] --
--------------------------------
vRP.Prepare("vehicles/UserVehicles","SELECT * FROM vehicles WHERE Passport = @Passport")
src.consultGaragem = function(passaporte)
   
    local source = source
    local user_id = vRP.getUserId(source)
    GaragemTables = {}
    local vehicle = vRP.query("vehicles/UserVehicles",{ Passport = user_id })
   -- local vehicle = vRP.Query("wine_garagem/get_vehicles",{ user_id = passaporte })
    local identity = vRP.userIdentity(parseInt(passaporte))
    if user_id then
        for k,v in pairs(vehicle) do
            if vehicle[k].vehicle then
                table.insert(GaragemTables,{ 	
                    user_id = passaporte,
                    nome = identity.name.." ".. identity.name2,
                    index = vehicle[k].vehicle,
                    name = vehicle[k]["vehicle"],
                    linkgaragem = Config.Imagens_Garagem
                })
            end
        end
    end
end

src.consultGaragemList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return GaragemTables
    end
end

src.removerCarro = function(passaporte,item)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    if user_id then
        vRP.execute("wine_garagem/rem_vehicle",{ user_id = parseInt(passaporte), vehicle = item }) 
        local identity2 = vRP.userIdentity(parseInt(passaporte))
        TriggerClientEvent("Notify", source, "verde", "Voce retirou o carro <b>"..item.."</b> do "..identity2.name.." "..identity2.name2.." ["..passaporte.."]")
            local x,y,z = vCLIENT.getPosition(source)
            PerformHttpRequest(Config.Webhooks.control_garagem, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Removeu Carro**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Player:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                            { 
                                name = "🚗 Carro:", 
                                value = " "..item.." ",
                            },
                            { 
                                name = "🌐 Coordenada do Staff:", 
                                    value = ""..x..","..y..","..z.." \n \n " 
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        image = { 
                            url = ""..Config.Imagens_Garagem..""..item..".png",
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
        return true
    end
end

src.consultverBauCarro = function(passaporte,carro)
    local source = source
    local user_id = vRP.getUserId(source)
    CarroBauTable = {}
    if user_id then 
       -- local result = vRP.getSrvdata("vehChest:"..passaporte..":"..carro)

		local dados = "BauCarro:doID:"..passaporte..":"..carro
			
        local result = vRP.GetSrvData(dados)
        local identity = vRP.userIdentity(parseInt(passaporte))
        if result then
			for k,v in pairs(result) do


                local splitName = splitString(v["item"],"-")
                if splitName[2] ~= nil then
                    if itemDurability(v["item"]) then
                        v["durability"] = parseInt(os.time() - splitName[2])
                        v["days"] = itemDurability(v["item"])
                    else
                        v["durability"] = 0
                        v["days"] = 1
                    end
                else
                    v["durability"] = 0
                    v["days"] = 1
                end

				table.insert(CarroBauTable,{  
                    user_id = passaporte,
                    nome = identity.name.." ".. identity.name2,
                    item = k,
                    carro = carro,
                    amount = parseInt(v["amount"]), 
                    name = itemName(v["item"]), 
                    index = itemIndex(v["item"]),
                    days = v["days"],
                    durability = v["durability"],
                    linkinventario = Config.Imagens_Inventario
                })
			end
        end
    end
end

src.consultverBauCarroList = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return CarroBauTable
    end
end


src.removerItemBauCarro = function(passaporte,carro,item,slot, quantidade)
  
    if passaporte and carro and item and slot and quantidade then 
        local dados = "BauCarro:doID:"..passaporte..":"..carro
        local Datatable = vRP.GetSrvData(dados)
        if Datatable then 
            Datatable[slot] = nil
            vRP.SetSrvData(dados,Datatable)  
            return true 
        end
    end
    return false
end

--------------------------------
-- [ Identidade ] --
--------------------------------

src.trocarCarteira = function(passaporte,valor,tipo)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    local nplayer = vRP.userSource(parseInt(passaporte))
    if nplayer then
        if tipo == "mais" then
            vRP.generateItem(parseInt(passaporte),"dollars",parseInt(valor),true)
            TriggerClientEvent("Notify", source, "verde", "Voce adicionou <b>"..parseFormat(valor).."</b> $ para o passaporte: "..passaporte.."")
            local identity2 = vRP.userIdentity(parseInt(passaporte))
            local x,y,z = vCLIENT.getPosition(source)
            PerformHttpRequest(Config.Webhooks.spawnDinheiro, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Spawn Dinheiro**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Player:", 
                                value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                            },
                            { 
                                name = "💸 Quantidade:", 
                                value = " "..parseFormat(valor).." $ ",
                            },
                            { 
                                name = "🌐 Coordenada do Staff:", 
                                    value = ""..x..","..y..","..z.." \n \n " 
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        image = { 
                            url = ""..Config.Imagens_InventarioXamp.."dollars.png",
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
            return true
        end
        if tipo == "menos" then
            vRP.tryPayment(parseInt(passaporte),parseInt(valor))
            vRP.removeInventoryItem(parseInt(passaporte),"dollars",parseInt(valor),true)
            TriggerClientEvent("Notify", source, "verde", "Voce retirou <b>"..parseFormat(valor).."</b> $ do passaporte: "..passaporte.."")
                local identity2 = vRP.userIdentity(parseInt(passaporte))
                local x,y,z = vCLIENT.getPosition(source)
                PerformHttpRequest(Config.Webhooks.spawnDinheiro, function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Remover Dinheiro**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Player:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                                { 
                                    name = "💸 Quantidade:", 
                                    value = " "..parseFormat(valor).." $ ",
                                },
                                { 
                                    name = "🌐 Coordenada do Staff:", 
                                        value = ""..x..","..y..","..z.." \n \n " 
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            image = { 
                                url = ""..Config.Imagens_InventarioXamp.."dollars.png",
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })
            return true
        end
    else
        TriggerClientEvent("Notify", source, "vermelho", "Esse jogador esta <b>offline</b>")
    end
end

src.trocarCelular = function(passaporte,CelularNovo)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    local nplayer = vRP.userSource(parseInt(passaporte))
    if nplayer then
        if not vRP.userPhone(CelularNovo) then
            local identity2 = vRP.userIdentity(parseInt(passaporte))
            numeroAntigo = identity2.phone
            TriggerClientEvent("Notify",source,"verde","Telefone atualizado.",5000)
            TriggerEvent("smartphone:updatePhoneNumber",parseInt(passaporte),CelularNovo)
            vRP.upgradePhone(parseInt(passaporte),CelularNovo)
            TriggerClientEvent("Notify", source, "verde", "Voce alterou o celular para <b>"..CelularNovo.."</b> do passaporte: "..passaporte.."")
                local x,y,z = vCLIENT.getPosition(source)
                PerformHttpRequest(Config.Webhooks.trocarCelular, function(err, text, headers) end, 'POST', json.encode({
                    embeds = {
                        {     
                            title = "**Trocou o Celular**",
                            fields = {
                                { 
                                    name = "📝 Author:", 
                                    value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                                },
                                { 
                                    name = "📝 Player:", 
                                    value = "" ..identity2.name.." "..identity2.name2.." **#"..passaporte.."** ",
                                },
                                { 
                                    name = "📱 Antigo Numero:", 
                                    value = " "..numeroAntigo.."",
                                },
                                { 
                                    name = "📱 Novo Numero:", 
                                    value = " "..CelularNovo.."",
                                },
                                { 
                                    name = "🌐 Coordenada do Staff:", 
                                        value = ""..x..","..y..","..z.." \n \n " 
                                },
                            }, 
                            footer = { 
                                text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                               icon_url = Config.Webhooks.icon_url
                            },
                            image = { 
                                url = ""..Config.Imagens_InventarioXamp.."chip.png",
                            },
                            thumbnail = { 
                               url = Config.Webhooks.url
                            },
                            color = 3092790
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })
        else
            TriggerClientEvent("Notify", source, "vermelho", "Esse celular nao esta <b>disponivel</b>")     
        end
        return true
    else
        TriggerClientEvent("Notify", source, "vermelho", "Esse jogador esta <b>offline</b>")
    end
end

src.trocarNome = function(passaporte,PrimeiroNome,SegundoNome)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.userIdentity(user_id)
    if passaporte then
        local identity3 = vRP.userIdentity(parseInt(passaporte))
        nome = "" ..identity3.name.." "..identity3.name2..""
        vRP.upgradeNames(parseInt(passaporte),PrimeiroNome,SegundoNome)
        local identity2 = vRP.userIdentity(parseInt(passaporte))
        TriggerClientEvent("Notify", source, "verde", "Voce trocou o nome do passaporte: <b>"..passaporte.."</b> para <b>"..PrimeiroNome.." "..SegundoNome.."</b>.")
            local x,y,z = vCLIENT.getPosition(source)
            PerformHttpRequest(Config.Webhooks.trocarNome, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    {     
                        title = "**Troca de Nome**",
                        fields = {
                            { 
                                name = "📝 Author:", 
                                value = "" ..identity.name.." "..identity.name2.." **#"..user_id.."** ",
                            },
                            { 
                                name = "📝 Player:", 
                                value = "" ..nome.." **#"..passaporte.."** ",
                            },
                            { 
                                name = "✨ Antigo Nome:", 
                                value = " "..nome.."",
                            },
                            { 
                                name = "✨ Novo Nome:", 
                                value = "" ..identity2.name.." "..identity2.name2.."",
                            },
                            { 
                                name = "🌐 Coordenada do Staff:", 
                                    value = ""..x..","..y..","..z.." \n \n " 
                            },
                        }, 
                        footer = { 
                            text = os.date('Dia: %d/%m/%Y - Horas: %H:%M:%S'),
                           icon_url = Config.Webhooks.icon_url
                        },
                        image = { 
                            url = ""..Config.Imagens_InventarioXamp.."namechange.png",
                        },
                        thumbnail = { 
                           url = Config.Webhooks.url
                        },
                        color = 3092790
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
        return true
    else
        TriggerClientEvent("Notify", source, "vermelho", "Voce precisa colocar um <b>Passaporte</b>")
    end
end


src.consultEmpregos = function(passaporte)
    local source = source
    local user_id = vRP.Passport(source)
    local GetJogador = vRP.Query("GetEmpresa", {user_id = parseInt(passaporte)})
    empregosTable = {}
    -- local data = vRP.getDatatable(parseInt(passaporte))
     local identity = vRP.userIdentity(parseInt(passaporte))
    if GetJogador then
        -- for k,v in pairs(data.perm) do
        --     if vRP.hasGroup(user_id,Config.Ignorar_Blacklist) then
        table.insert(empregosTable,{user_id = passaporte,nome = identity.name.." ".. identity.name2,emprego = GetJogador[1].empresa,empregotitle = GetJogador[1].cargo})
    -- else
    --             for a,b in pairs(Config.Cargos_blacklist) do
    --                 if b ~= k then
    --                     table.insert(empregosTable,{user_id = passaporte,nome = identity.name.." ".. identity.name2,emprego = k,empregotitle = k,})
    --                 end
    --             end
    --  end
     end
    
end

src.consultEmpregosList = function()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        return empregosTable
    end
end

-- RegisterCommand('sb',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
-- 	if vRP.hasPermission(user_id,"Admin") then
-- 		if args[1] then
-- 			vRP.addBank(parseInt(args[1]),50000,"Private")
-- 		end
-- 	end
-- end)


src.confirmaremprego = function(passaporte,emprego,tipo,discord_id,iddc)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local nplayer = vRP.getUserSource(parseInt(passaporte))
        if nplayer then
            vRP.setPermission(parseInt(passaporte),emprego)
            TriggerClientEvent("Notify",source,"verde","Voce adicionou o passaporte <b>"..parseInt(passaporte).."</b> do grupo <b>"..vRP.getGroupTitle(emprego).."</b>.")
            return true
        end
    end
end

src.removerCargo = function(passaporte,emprego,discord_id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local nplayer = vRP.getUserSource(parseInt(passaporte))
        if nplayer then
            vRP.remPermission(parseInt(passaporte),emprego)
            TriggerClientEvent("Notify",source,"verde","Voce removeu o passaporte <b>"..parseInt(passaporte).."</b> do grupo <b>"..emprego.."</b>.")
            return true
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Spectate[Passport] then
		Spectate[Passport] = nil
	end
end)