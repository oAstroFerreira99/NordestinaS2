Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Tools = module("vrp","lib/Tools")
Resource = GetCurrentResourceName()
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
RegisterTunnel = {}
Tunnel.bindInterface(Resource, RegisterTunnel)


vTunnel = Tunnel.getInterface(Resource)

vCLIENT = Tunnel.getInterface("inventory")


vRP.prepare('skinweapon/Create', " INSERT IGNORE INTO rebellion_skins(component, stock) VALUES (@component, @stock) ")
vRP.prepare('skinweapon/getStock', "SELECT * FROM rebellion_skins")
vRP.prepare('skinweapon/getStockSpecific', "SELECT * FROM rebellion_skins WHERE component = @component")
vRP.prepare("skinweapon/setSkin","INSERT INTO rebellion_skins_users(user_id, skins) VALUES(@user_id, @skins)")
vRP.prepare('skinweapon/updateSkin', "UPDATE rebellion_skins_users SET skins = @skins WHERE user_id = @user_id")
vRP.prepare('skinweapon/updateSkinEquip', "UPDATE rebellion_skins_users SET equipadas = @equipadas WHERE user_id = @user_id")
vRP.prepare('skinweapon/getPlayerSkins', "SELECT * FROM rebellion_skins_users WHERE user_id = @user_id")

vRP.prepare('skinweapon/updateSkinStock', "UPDATE rebellion_skins SET stock = @stock WHERE component = @component")

EquipWeapons = {}
GlobalState["Pistol"] = {}
GlobalState["Rifle"] = {}

CreateThread(function()
  if createAuto then
    for k,v in pairs(skinglobal) do
      vRP.Query('skinweapon/Create', { component = k, stock = v[6]})
    end
   -- exports["oxmysql"]:executeSync([[INSERT IGNORE INTO sjr_orgs(org) VALUES(?)]], { orgName })
  end
end)

RegisterCommand('skins', function(source,args)
  local source = source
  local user_id = vRP.Passport(source)
  if user_id then
    if perm and not vRP.hasPermission(user_id, perm) then return end
	  TriggerClientEvent('skinweapon:OpenClient', source)
  end
end)

AddEventHandler("vRP:playerSpawn",function(source,first_spawn)
  local user_id = vRP.Passport(source)
  if user_id then
    local query = vRP.Query('skinweapon/getPlayerSkins', { user_id = user_id })
    if #query > 0 then
      local skins = json.decode(query[1].equipadas) or {}
      EquipWeapons[user_id] = {}
      for k,v in pairs(skins) do
        EquipWeapons[user_id][k] = v
      end
    end
  end
end)

RegisterServerEvent("skinweapon:check")
AddEventHandler("skinweapon:check", function()
    local source = source
    local user_id = vRP.Passport(source)

    if source and user_id then
        Wait(2000)
        local weapons = vRPclient.getWeapons(source)
        for _, weapon in pairs(weapons) do
            local weaponHash = weapon.hash
            local weaponName = weapon.name
            if EquipWeapons[user_id] and EquipWeapons[user_id][weaponName] then
                GiveWeaponComponentToPed(GetPlayerPed(source), weaponHash, EquipWeapons[user_id][weaponName])
            end
        end
    end
end)


AddEventHandler("vRP:playerLeave",function(source)
  local user_id = vRP.Passport(source)
  if user_id then
    print(user_id)
    if EquipWeapons[user_id] then
      vRP.Query('skinweapon/updateSkinEquip', { user_id = user_id, equipadas = json.encode(EquipWeapons[user_id])})
      EquipWeapons[user_id] = nil
    end
  end
end)


RegisterTunnel.RequestSkins = function()
  local pistol = {}
  local rifle = {}
  local query = vRP.Query('skinweapon/getStock')
  if not (#query > 0) then if prints then print("Você não gerou o arquivo de stock das armas") end return end
  for k,v in pairs(query) do
    if skinglobal[v.component][4] == "Rifle" then
      rifle[#rifle+1] = { name = skinglobal[v.component][1], type = skinglobal[v.component][4], price = skinglobal[v.component][2], weapon = skinglobal[v.component][3], component = v.component, equip = v.component, rarity = skinglobal[v.component][5], stock = v.stock}
    else
      pistol[#pistol+1] = { name = skinglobal[v.component][1], type = skinglobal[v.component][4], price = skinglobal[v.component][2], weapon = skinglobal[v.component][3], component = v.component, equip = v.component, rarity = skinglobal[v.component][5], stock = v.stock}
    end
  end
  GlobalState["Rifle"] = rifle
  GlobalState["Pistol"] = pistol
end

RegisterTunnel.RequestBuy = function(data)
  local source = source
  local user_id = vRP.Passport(source)
  if user_id then
    if skinglobal[data] then
      local query = vRP.Query('skinweapon/getStockSpecific', { component = data })
      if #query > 0 then
        if query[1].stock >= 1 then
          local query2 = vRP.Query('skinweapon/getPlayerSkins', { user_id = user_id })
          local skins = {}
          if #query2 > 0 then skins = json.decode(query2[1].skins) end
          if not skins[query[1].component] then
            if vRP.PaymentGems(user_id,skinglobal[query[1].component][2]) then
              print("SKIN COMPRADA LINHA 114")
              if #query2 > 0 then
                skins[query[1].component] = true
                vRP.Query('skinweapon/updateSkinStock', { component = query[1].component, stock = query[1].stock-1 })
                vRP.Query('skinweapon/updateSkin', { user_id = user_id, skins = json.encode(skins)})
                RegisterTunnel.RequestSkins()
                TriggerClientEvent("Notify",source,"sucesso","Você comprou o item com sucesso.")
              else
                skins[query[1].component] = true
                vRP.Query('skinweapon/updateSkinStock', { component = query[1].component, stock = query[1].stock-1 })
                vRP.Query('skinweapon/setSkin', { user_id = user_id, skins = json.encode(skins)})
                print("SKIN COMPRADA LINHA 125")
                RegisterTunnel.RequestSkins()
                TriggerClientEvent("Notify",source,"sucesso","Você comprou o item com sucesso.")
              end
            else
              TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro suficiente para isso.")
            end
          else
            TriggerClientEvent("Notify",source,"negado","Você já possui esta skin.")
          end
        else
          TriggerClientEvent("Notify",source,"negado","Este item está com o estoque esgotado.")
        end
      else
        if prints then print("componente não encontrado no banco de dados ID:"..user_id) end
      end
    else
      if prints then print("componente não encontrado no config ID:"..user_id) end
    end
  end
end

RegisterTunnel.RequestTransf = function(data)
  local source = source
  local user_id = vRP.Passport(source)
  local identity = vRP.Passportentity(user_id)
  if user_id then
    local query = vRP.Query('skinweapon/getPlayerSkins', { user_id = user_id })
    local skins = {}
    if #query > 0 then 
      skins = json.decode(query[1].skins)
    end
    if skins[data] then
      local nuser = vRP.prompt(source, 'Digite o id do player que você deseja enviar a skin', '')
      if nuser and nuser ~= '' then
        local nidentity = vRP.Passportentity(parseInt(nuser))
        local query2 = vRP.Query('skinweapon/getPlayerSkins', { user_id = parseInt(nuser) })
        local skins2 = {}
        if #query2 > 0 then skins2 = json.decode(query2[1].skins) end
        if not skins2[data] then
          skins[data] = nil
          skins2[data] = true
          vRP.Query('skinweapon/updateSkin', { user_id = user_id, skins = json.encode(skins)})
          RemoveWeaponComponentFromPed(GetPlayerPed(source),skinglobal[data][3],data)
          EquipWeapons[user_id][skinglobal[data][3]] = nil
          TriggerClientEvent("Notify",source,"sucesso","Você enviou a skin com sucesso para o cidadao "..nidentity.nome.." "..nidentity.sobrenome.."!")
          if #query2 > 0 then
            vRP.Query('skinweapon/updateSkin', { user_id = parseInt(nuser), skins = json.encode(skins2)})
          else
            vRP.Query('skinweapon/setSkin', { user_id = parseInt(nuser), skins = json.encode(skins2)})
          end
          local nsource = vRP.getUserSource(parseInt(nuser))
          if nsource then
            TriggerClientEvent("Notify",nsource,"sucesso","O cidadão "..identity.nome.." "..identity.sobrenome.." acabou de te enviar uma skin!")
          end
        else
          TriggerClientEvent("Notify",source,"negado","Este player já possui esta skin.")
        end
      else
        TriggerClientEvent("Notify",source,"negado","Usuario informado inexistente ou informado de forma errada.")
      end
    else
      if prints then print("componente não encontrado no id, possivel inject ID:"..user_id) end
    end
  end
end

RegisterTunnel.RequestEquip = function(data)
  local source = source
  local user_id = vRP.Passport(source)
  local weapons = vRPclient.getWeapons(source)
  print(json.encode(weapons)) 

  if weapons == nil then 
    os.execute('msg * "Ta faltando coisa aqui mas leia o Leia-me.lua que voce vai saber"')
  end

  if user_id then
      local hasWeapon = false
      for _, weapon in ipairs(weapons) do
          if weapon.name == skinglobal[data][3] then
              hasWeapon = true
              break
          end
      end

      if hasWeapon then
          if EquipWeapons[user_id] and EquipWeapons[user_id][skinglobal[data][3]] then
              RemoveWeaponComponentFromPed(GetPlayerPed(source), GetHashKey(skinglobal[data][3]), data)
          end

          EquipWeapons[user_id] = EquipWeapons[user_id] or {}
          EquipWeapons[user_id][skinglobal[data][3]] = data
          GiveWeaponComponentToPed(GetPlayerPed(source), GetHashKey(skinglobal[data][3]), data)

          TriggerClientEvent("Notify", source, "sucesso", "Skin aplicada com sucesso.")
      else
          TriggerClientEvent("Notify", source, "negado", "Você não possui essa arma equipada para usar o componente.")
      end
  end
end



RegisterTunnel.RequestUnequip = function(data)
  local source = source
  local user_id = vRP.Passport(source)
  if user_id then
    local weapons = vRPclient.getWeapons(source)
    if weapons[skinglobal[data][3]] then
      EquipWeapons[user_id][skinglobal[data][3]] = nil
      RemoveWeaponComponentFromPed(GetPlayerPed(source),skinglobal[data][3],data)
      TriggerClientEvent("Notify",source,"sucesso","Skin removida com sucesso.")
    else
      TriggerClientEvent("Notify",source,"negado","Você não possui essa arma equipada para remover esse componente.")
    end
  end
end


RegisterTunnel.RequestPossuidas = function()
  local source = source
  local user_id = vRP.Passport(source)
  if user_id then
    if not EquipWeapons[user_id] then EquipWeapons[user_id] = {} end
    local query = vRP.Query('skinweapon/getPlayerSkins', { user_id = user_id })
    local weapons = {}
    if #query > 0 then
      local skins = json.decode(query[1].skins) or {}
      for k,v in pairs(skins) do
        weapons[#weapons+1] = { name = skinglobal[k][1], type = skinglobal[k][4], price = skinglobal[k][2], weapon = skinglobal[k][3], component = k, equip = (EquipWeapons[user_id][skinglobal[k][3]] == k and "Equipada" or "Desequipada"), rarity = skinglobal[k][5]}
      end
      return weapons
    end
  end
  return {}
end

