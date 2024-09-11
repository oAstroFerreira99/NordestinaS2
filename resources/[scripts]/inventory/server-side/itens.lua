-----------------------------------------------------------------------------------------------------------------------------------------
-- GEOGES
-----------------------------------------------------------------------------------------------------------------------------------------
Geodes = {
	{ ["item"] = "emerald", ["min"] = 1, ["max"] = 1 },
	{ ["item"] = "diamond", ["min"] = 2, ["max"] = 2 },
	{ ["item"] = "ruby", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "sapphire", ["min"] = 1, ["max"] = 3 },
	{ ["item"] = "amethyst", ["min"] = 1, ["max"] = 3 },
	{ ["item"] = "amber", ["min"] = 1, ["max"] = 3 },
	{ ["item"] = "turquoise", ["min"] = 1, ["max"] = 3 },
	{ ["item"] = "aluminum", ["min"] = 1, ["max"] = 2 },
	{ ["item"] = "copper", ["min"] = 1, ["max"] = 2 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
Use = {

	["adesive01"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle, Network, Plate = vRPC.VehicleList(source, 4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.PlayAnim(source, false, { "mini@repair", "fixing_a_player" }, true)

					if vTASKBAR.taskLockpick(source) then

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _, v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:paintVehicle", v, Network, Plate, 150)
							end)
						end
					end
				end

				Player(source)["state"]["Buttons"] = false
				vRPC.StopAnim(source, false)
				Active[Passport] = nil
			end
		end
	end,

	["adesive02"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle, Network, Plate = vRPC.VehicleList(source, 4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.PlayAnim(source, false, { "mini@repair", "fixing_a_player" }, true)

					if vTASKBAR.taskLockpick(source) then

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _, v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:paintVehicle", v, Network, Plate, 55)
							end)
						end
					end
				end

				Player(source)["state"]["Buttons"] = false
				vRPC.StopAnim(source, false)
				Active[Passport] = nil
			end
		end
	end,

	["adesive03"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle, Network, Plate = vRPC.VehicleList(source, 4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.PlayAnim(source, false, { "mini@repair", "fixing_a_player" }, true)

					if vTASKBAR.taskLockpick(source) then

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _, v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:paintVehicle", v, Network, Plate, 63)
							end)
						end
					end
				end

				Player(source)["state"]["Buttons"] = false
				vRPC.StopAnim(source, false)
				Active[Passport] = nil
			end
		end
	end,

	["adesive04"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle, Network, Plate = vRPC.VehicleList(source, 4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.PlayAnim(source, false, { "mini@repair", "fixing_a_player" }, true)

					if vTASKBAR.taskLockpick(source) then

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _, v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:paintVehicle", v, Network, Plate, 88)
							end)
						end
					end
				end

				Player(source)["state"]["Buttons"] = false
				vRPC.StopAnim(source, false)
				Active[Passport] = nil
			end
		end
	end,

	["adesive05"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle, Network, Plate = vRPC.VehicleList(source, 4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.PlayAnim(source, false, { "mini@repair", "fixing_a_player" }, true)

					if vTASKBAR.taskLockpick(source) then

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _, v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:paintVehicle", v, Network, Plate, 109)
							end)
						end
					end
				end

				Player(source)["state"]["Buttons"] = false
				vRPC.StopAnim(source, false)
				Active[Passport] = nil
			end
		end
	end,


	["ziplock"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport, "cocaine", 1) or vRP.ConsultItem(Passport, "meth", 1) or vRP.ConsultItem(Passport, "weedbud", 1) then
			Active[Passport] = os.time() + 5
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress", source, "Embalando", 5000)
			vRPC.PlayAnim(source, true, { "amb@world_human_clipboard@male@idle_a", "idle_c" }, true)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.StopAnim(source, false)
					Player(source)["state"]["Buttons"] = false

					local PackDrugs = {
						{ "cocaine", "cokesack" },
						{ "meth",    "methsack" },
						{ "weedbud", "weedsack" }
					}

					for k, v in pairs(PackDrugs) do
						if vRP.TakeItem(Passport, v[1], 1, false) then
							vRP.RemoveItem(Passport, "ziplock", 1, false)
							vRP.GenerateItem(Passport, v[2], 1, true)
							break
						end
					end

					vRP.UpgradeStress(Passport, math.random(5))
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify", source, "vermelho", "Você não possúi drogas na mochila.", "Aviso", 5000)
		end
	end,

	["cat"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_cat_01")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["hen"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_hen")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["husky"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_husky")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["pig"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_pig")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["poodle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_poodle")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["pug"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_pug")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["retriever"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_retriever")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["rottweiler"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_rottweiler")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["shepherd"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_shepherd")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,

	["westy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("dynamic:animalSpawn", source, "a_c_westy")
		vRPC.PlayAnim(source, true, { "rcmnigel1c", "hailing_whistle_waive_a" }, false)
	end,


	["bandage"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Passando",5000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("sounds:Private",source,"bandage",0.5)
							Healths[Passport] = os.time() + 30
							vRP.UpgradeStress(Passport,2)
							vRPC.UpgradeHealth(source,15)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["creator"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			TriggerClientEvent("barbershop:Open",source,"open",true)
			
		end
	end,


	["sulfuric"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRPC.DowngradeHealth(source,100)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["analgesic"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Tomando",3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 15
							vRP.UpgradeStress(Passport,1)
							vRPC.UpgradeHealth(source,8)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"azul","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["oxy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Tomando",3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 15
							vRP.UpgradeStress(Passport,1)
							vRPC.UpgradeHealth(source,8)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"azul","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["vehkey"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Vehicle,Network,Plate = vRPC.VehicleList(source,5)
		if Vehicle then
			if Plate == Split[2] then
				TriggerEvent("garages:LockVehicle",source,Network)
			end
		end
	end,

	["suitcase"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				vRP.GiveItem(Passport,"suitcase",1,false)
				vRP.GiveItem(Passport,"dollars",Split[2],false)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		end
	end,

	["newchars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			vRP.UpgradeChars(source)
			TriggerClientEvent("inventory:Update",source,"Backpack")
			TriggerClientEvent("Notify",source,"verde","Personagem liberado.",5000)
		end
	end,

	["wheelchair"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Plate = "WCH"..math.random(10000,99999)
		TriggerEvent("plateEveryone",Plate)
		vCLIENT.wheelChair(source,Plate)
	end,

	["backcamping"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Acampamento"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 102, ["texture"] = 0, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["backschool"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Escolar"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 101, ["texture"] = 0, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["backcyclist"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Ciclista"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 103, ["texture"] = 0, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["adrenaline"] = function(source,Passport,Amount,Slot,Full,Item,Split)
        -- local ParAmount = vRP.NumPermission("Hospital") -- se quiserem verificar a quantidade de paramédicos on para poder usar ou não descometa essas 4 linhas
        -- if parseInt(#ParAmount) > 0 then
        --     return
        -- end

        local Adrenaline = {
            { 1978.98,5171.98,47.63 }, -- configurem essas locs coloquei aleatórias
            { 312.47,-562.1,43.29 },
            { 368.33,-1592.01,25.44 },
            { 1772.18,2577.82,45.73 }
        }

        local Ped = GetPlayerPed(source)
        local Coords = GetEntityCoords(Ped)
        for k,v in pairs(Adrenaline) do
            local Distance = #(Coords - vec3(v[1],v[2],v[3]))
            if Distance <= 5 then
                local ClosestPed = vRPC.ClosestPed(source,3)
                if ClosestPed then
                    local OtherPassport = vRP.Passport(ClosestPed)
                    if OtherPassport and vRP.GetHealth(ClosestPed) <= 100 then
                        if vRP.TakeItem(Passport,Full,1,true,Slot) then
                            Player(source)["state"]["Cancel"] = true
                            TriggerClientEvent("Progress",source,"Tratando",10000)
                            vRPC.playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)

                            SetTimeout(10000,function()
 vRP.Revive(ClosestPed,101)
                                vRPC.removeObjects(source)
                                vRP.UpgradeThirst(OtherPassport,10)
                                vRP.UpgradeHunger(OtherPassport,10)
                                Player(source)["state"]["Cancel"] = false
                            end)
                        end
                    end
                end
            end
        end
    end,

	["backalohomorawhite"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Alohomora Branca"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 104, ["texture"] = 0, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["backalohomorablack"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Alohomora Preta"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 104, ["texture"] = 1, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["backalohomorared"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Alohomora Vermelha"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 104, ["texture"] = 2, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["backrudolphpurple"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Rudolph Roxo"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 105, ["texture"] = 0, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["backrudolphred"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Name = "Rudolph Vermelho"
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		if not Consult[Name] then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				Consult[Name] = { ["id"] = 105, ["texture"] = 1, ["type"] = "backpack" }
				vRP.SetSrvData("Exclusivas:"..Passport,Consult)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila já possuída.",5000)
		end
	end,

	["defibrillator"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("skinshop:Defibrillator",source)
	end,

	["gemstone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,Amount,false,Slot) then
			TriggerClientEvent("inventory:Update",source,"Backpack")
			vRP.UpgradeGemstone(Passport,Amount)
		end
	end,

	["badge01"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.createObjects(source,"paper_1_rcm_alt1-8","player_one_dual-8","prop_police_badge",49,28422,0.065,0.029,-0.035,80.0,-1.90,75.0)
	end,

	["badge02"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.createObjects(source,"paper_1_rcm_alt1-8","player_one_dual-8","prop_medic_badge",49,28422,0.065,0.029,-0.035,80.0,-1.90,75.0)
	end,

	["namechange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.keyDouble(source,"Nome:","Sobrenome:")
		if Keyboard then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("Notify",source,"verde","Passaporte atualizado.",5000)
				TriggerClientEvent("inventory:Update",source,"Backpack")
				vRP.UpgradeNames(Passport,Keyboard[1],Keyboard[2])
			end
		end
	end,

	["dices"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		Active[Passport] = nil
		vRPC.stopAnim(source,false)
		Player(source)["state"]["Buttons"] = false

		local Dice = math.random(6)
		local Players = vRPC.Players(source)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("showme:pressMe",v,source,"<img src='images/"..Dice..".png'>",10,true)
			end)
		end
	end,

	["deck"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local card = math.random(13)
		local cards = { "A","2","3","4","5","6","7","8","9","10","J","Q","K" }

		local naipe = math.random(4)
		local naipes = { "<black>♣</black>","<red>♠</red>","<black>♦</black>","<red>♥</red>" }

		local Identity = vRP.Identity(Passport)
		local Players = vRPC.ClosestPeds(source,5)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("chat:ClientMessage",v,Identity["name"].." "..Identity["name2"],"Tirou "..cards[card]..naipes[naipe].." do baralho.")
			end)
		end
	end,

	["silvercoin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		Active[Passport] = nil
		vRPC.stopAnim(source,false)
		Player(source)["state"]["Buttons"] = false

		local Coins = math.random(2)
		local Sides = { "Cara","Coroa" }
		local Identity = vRP.Identity(Passport)
		local Players = vRPC.ClosestPeds(source,5)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("chat:ClientMessage",v,Identity["name"].." "..Identity["name2"],Sides[Coins])
			end)
		end
	end,

	["goldcoin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		Active[Passport] = nil
		vRPC.stopAnim(source,false)
		Player(source)["state"]["Buttons"] = false

		local Coins = math.random(2)
		local Sides = { "Cara","Coroa" }
		local Identity = vRP.Identity(Passport)
		local Players = vRPC.ClosestPeds(source,5)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("chat:ClientMessage",v,Identity["name"].." "..Identity["name2"],Sides[Coins])
			end)
		end
	end,

	["soap"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPLAYER.checkSoap(source) ~= nil then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Usando",10000)
			vRPC.playAnim(source,false,{"amb@world_human_bum_wash@male@high@base","base"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.removeObjects(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("player:Residuals",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["geode"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"WEAPON_HAMMER",1) then
			local Selected = math.random(#Geodes)
			local Rand = math.random(Geodes[Selected]["min"],Geodes[Selected]["max"])

			if (vRP.InventoryWeight(Passport) + (itemWeight(Geodes[Selected]["item"]) * Rand)) <= vRP.GetWeight(Passport) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,Geodes[Selected]["item"],Rand,false)
					TriggerClientEvent("inventory:Update",source,"Backpack")
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","<b>Martelo</b> não encontrado.",5000)
		end
	end,

	["joint"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",10000)
			vRPC.createObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.removeObjects(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Points = 0
						if Split[2] ~= nil then
							Points = parseInt(Split[2])
						end

						vRP.WeedTimer(Passport,1)
						vRP.DowngradeHunger(Passport,5 + (0.1 * Points))
						vRP.DowngradeThirst(Passport,5 + (0.1 * Points))
						vRP.DowngradeStress(Passport,5 + (0.1 * Points))
						vPLAYER.movementClip(source,"move_m@shadyped@a")
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["cocaine"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Cheirando",5000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,10)
					TriggerClientEvent("setCocaine",source)
					TriggerClientEvent("setEnergetic",source,15,1.20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["meth"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",10000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setMeth",source)
					Armors[Passport] = os.time() + 60
					vRP.ChemicalTimer(Passport,10)
					vRP.SetArmour(source,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,


	["lancap"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Tomando",3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.ChemicalTimer(Passport,10)
							--Healths[Passport] = os.time() + 15
							--vRP.UpgradeStress(Passport,1)
							--vRPC.updateHealth(source,8)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"azul","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	
	["cigarette"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",10000)
			vRPC.createObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.removeObjects(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.DowngradeStress(Passport,5)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["vape"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Fumando",15000)
		vRPC.createObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","ba_prop_battle_vape_01",49,18905,0.08,-0.00,0.03,-150.0,90.0,-10.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRP.DowngradeStress(Passport,20)
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["medkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Passando",10000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 60
							vRPC.UpgradeHealth(source,40)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["gauze"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPARAMEDIC.Bleeding(source) > 0 then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Passando",3000)
			vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.stopAnim(source,false)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vPARAMEDIC.Bandage(source)
					end
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Nenhum ferimento encontrado.",5000)
		end
	end,

	["binoculars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
			return
		end

		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Usando",3000)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("useBinoculos",source)
				Player(source)["state"]["Buttons"] = false
				vRPC.createObjects(source,"amb@world_human_binoculars@male@enter","enter","prop_binoc_01",50,28422)
			end

			Wait(100)
		until not Active[Passport]
	end,

	["camera"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
			return
		end

		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Usando",3000)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				TriggerClientEvent("useCamera",source)
				Player(source)["state"]["Buttons"] = false
				vRPC.createObjects(source,"amb@world_human_paparazzi@male@base","base","prop_pap_camera_01",49,28422)
			end

			Wait(100)
		until not Active[Passport]
	end,

	["evidence01"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ 482.95,-988.61,30.68 },
			{ 312.47,-562.1,43.29 },
			{ 368.33,-1592.01,25.44 },
			{ 1772.18,2577.82,45.73 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,"amarelo","Evidência de <b>"..Identity["name2"].."</b>.",5000)
					break
				end
			end
		end
	end,

	["evidence02"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ 482.95,-988.61,30.68 },
			{ 312.47,-562.1,43.29 },
			{ 368.33,-1592.01,25.44 },
			{ 1772.18,2577.82,45.73 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,"amarelo","Evidência de <b>"..Identity["name2"].."</b>.",5000)
					break
				end
			end
		end
	end,

	["evidence03"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ 482.95,-988.61,30.68 },
			{ 312.47,-562.1,43.29 },
			{ 368.33,-1592.01,25.44 },
			{ 1772.18,2577.82,45.73 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,"amarelo","Evidência de <b>"..Identity["name2"].."</b>.",5000)
					break
				end
			end
		end
	end,

	["evidence04"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ 482.95,-988.61,30.68 },
			{ 312.47,-562.1,43.29 },
			{ 368.33,-1592.01,25.44 },
			{ 1772.18,2577.82,45.73 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,"amarelo","Evidência de <b>"..Identity["name2"].."</b>.",5000)
					break
				end
			end
		end
	end,

	["teddy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.createObjects(source,"impexp_int-0","mp_m_waremech_01_dual-0","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
	end,

	["rose"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.createObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","prop_single_rose",49,18905,0.13,0.15,0.0,-100.0,0.0,-20.0)
	end,

	["firecracker"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) and not vCLIENT.checkCracker(source) then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Acendendo",3000)
			vRPC.playAnim(source,false,{"anim@mp_fireworks","place_firework_3_box"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.stopAnim(source,false)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("inventory:Firecracker",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["gsrkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			Active[Passport] = os.time() + 5
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Usando",5000)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Informations = vPLAYER.checkSoap(ClosestPed)
						if Informations then
							local Number = 0
							local Message = ""

							for Value,v in pairs(Informations) do
								Number = Number + 1
								Message = Message.."<b>"..Number.."</b>: "..Value.."<br>"
							end

							TriggerClientEvent("Notify",source,"amarelo",Message,10000)
						else
							TriggerClientEvent("Notify",source,"amarelo","Nenhum resultado encontrado.",3000)
						end
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["gdtkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			local OtherPassport = vRP.Passport(ClosestPed)
			local Identity = vRP.Identity(OtherPassport)
			if OtherPassport and Identity then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Usando",5000)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local weed = vRP.WeedReturn(OtherPassport)
							local chemical = vRP.ChemicalReturn(OtherPassport)
							local alcohol = vRP.AlcoholReturn(OtherPassport)

							local chemStr = ""
							local alcoholStr = ""
							local weedStr = ""

							if chemical == 0 then
								chemStr = "Nenhum"
							elseif chemical == 1 then
								chemStr = "Baixo"
							elseif chemical == 2 then
								chemStr = "Médio"
							elseif chemical >= 3 then
								chemStr = "Alto"
							end

							if alcohol == 0 then
								alcoholStr = "Nenhum"
							elseif alcohol == 1 then
								alcoholStr = "Baixo"
							elseif alcohol == 2 then
								alcoholStr = "Médio"
							elseif alcohol >= 3 then
								alcoholStr = "Alto"
							end

							if weed == 0 then
								weedStr = "Nenhum"
							elseif weed == 1 then
								weedStr = "Baixo"
							elseif weed == 2 then
								weedStr = "Médio"
							elseif weed >= 3 then
								weedStr = "Alto"
							end

							TriggerClientEvent("Notify",source,"azul","<b>Químicos:</b> "..chemStr.."<br><b>Álcool:</b> "..alcoholStr.."<br><b>Drogas:</b> "..weedStr,8000)
						end
					end

					Wait(100)
				until not Active[Passport]
			end
		end
	end,

	["nitro"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Trocando",10000)
				TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Nitro = GlobalState["Nitro"]
							Nitro[Plate] = 2000
							GlobalState:set("Nitro",Nitro,true)
						end
					end

					Wait(100)
				until not Active[Passport]

				TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
			end
		end
	end,

	["vest"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Vestindo",10000)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					Armors[Passport] = os.time() + 1800
					vRP.SetArmour(source,99)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["GADGET_PARACHUTE"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Usando",3000)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vCLIENT.parachuteColors(source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["advtoolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split then
			if not vRP.InsideVehicle(source) then
				local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
				if Vehicle then
					vRPC.AnimActive(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)
					TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
					vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

					if vTASKBAR.taskLockpick(source) then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Players = vRPC.Players(source)
							for _,v in pairs(Players) do
								async(function()
									TriggerClientEvent("inventory:repairVehicle",v,Network,Plate)
								end)
							end

							local Number = parseInt(Split[2]) - 1

							if Number >= 1 then
								vRP.GiveItem(Passport,"advtoolbox-"..Number,1,false)
							end
						end
					end

					TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
					Player(source)["state"]["Buttons"] = false
					vRPC.stopAnim(source,false)
					Active[Passport] = nil
				end
			end
		end
	end,

	["boostingtablet"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("rahe-boosting:client:openTablet",source)
		vRPC.AnimActive(source)
	end,
	["racingtablet"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("rahe-racing:client:openTablet",source)
		vRPC.AnimActive(source)
	end,

	["enginea"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["11"] then
							Datatable["mods"]["11"] = -1
						end

						if Datatable["mods"]["11"] == -1 then
							if Datatable["mods"]["11"] >= vCLIENT.CheckMods(source,Vehicle,11) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Motor</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["11"] = Datatable["mods"]["11"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,11,Datatable["mods"]["11"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Motor</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["engineb"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["11"] then
							Datatable["mods"]["11"] = -1
						end

						if Datatable["mods"]["11"] == 0 then
							if Datatable["mods"]["11"] >= vCLIENT.CheckMods(source,Vehicle,11) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Motor</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["11"] = Datatable["mods"]["11"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,11,Datatable["mods"]["11"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Motor</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["enginec"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["11"] then
							Datatable["mods"]["11"] = -1
						end

						if Datatable["mods"]["11"] == 1 then
							if Datatable["mods"]["11"] >= vCLIENT.CheckMods(source,Vehicle,11) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Motor</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["11"] = Datatable["mods"]["11"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,11,Datatable["mods"]["11"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Motor</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["engined"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["11"] then
							Datatable["mods"]["11"] = -1
						end

						if Datatable["mods"]["11"] == 2 then
							if Datatable["mods"]["11"] >= vCLIENT.CheckMods(source,Vehicle,11) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Motor</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["11"] = Datatable["mods"]["11"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,11,Datatable["mods"]["11"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Motor</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["enginee"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["11"] then
							Datatable["mods"]["11"] = -1
						end

						if Datatable["mods"]["11"] == 3 then
							if Datatable["mods"]["11"] >= vCLIENT.CheckMods(source,Vehicle,11) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Motor</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["11"] = Datatable["mods"]["11"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,11,Datatable["mods"]["11"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Motor</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["brakea"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["12"] then
							Datatable["mods"]["12"] = -1
						end

						if Datatable["mods"]["12"] == -1 then
							if Datatable["mods"]["12"] >= vCLIENT.CheckMods(source,Vehicle,12) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Freio</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["12"] = Datatable["mods"]["12"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,12,Datatable["mods"]["12"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Freio</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["brakeb"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["12"] then
							Datatable["mods"]["12"] = -1
						end

						if Datatable["mods"]["12"] == 0 then
							if Datatable["mods"]["12"] >= vCLIENT.CheckMods(source,Vehicle,12) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Freio</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["12"] = Datatable["mods"]["12"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,12,Datatable["mods"]["12"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Freio</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["brakec"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["12"] then
							Datatable["mods"]["12"] = -1
						end

						if Datatable["mods"]["12"] == 1 then
							if Datatable["mods"]["12"] >= vCLIENT.CheckMods(source,Vehicle,12) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Freio</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["12"] = Datatable["mods"]["12"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,12,Datatable["mods"]["12"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Freio</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["braked"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["12"] then
							Datatable["mods"]["12"] = -1
						end

						if Datatable["mods"]["12"] == 2 then
							if Datatable["mods"]["12"] >= vCLIENT.CheckMods(source,Vehicle,12) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Freio</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["12"] = Datatable["mods"]["12"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,12,Datatable["mods"]["12"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Freio</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["brakee"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["12"] then
							Datatable["mods"]["12"] = -1
						end

						if Datatable["mods"]["12"] == 3 then
							if Datatable["mods"]["12"] >= vCLIENT.CheckMods(source,Vehicle,12) then
								TriggerClientEvent("Notify",source,"amarelo","Limite do <b>Freio</b> atingido.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["12"] = Datatable["mods"]["12"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,12,Datatable["mods"]["12"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo do <b>Freio</b> incorreto.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["transmissiona"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["13"] then
							Datatable["mods"]["13"] = -1
						end

						if Datatable["mods"]["13"] == -1 then
							if Datatable["mods"]["13"] >= vCLIENT.CheckMods(source,Vehicle,13) then
								TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Transmissão</b> atingida.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["13"] = Datatable["mods"]["13"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,13,Datatable["mods"]["13"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Transmissão</b> incorreta.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["transmissionb"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["13"] then
							Datatable["mods"]["13"] = -1
						end

						if Datatable["mods"]["13"] == 0 then
							if Datatable["mods"]["13"] >= vCLIENT.CheckMods(source,Vehicle,13) then
								TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Transmissão</b> atingida.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["13"] = Datatable["mods"]["13"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,13,Datatable["mods"]["13"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Transmissão</b> incorreta.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["transmissionc"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["13"] then
							Datatable["mods"]["13"] = -1
						end

						if Datatable["mods"]["13"] == 1 then
							if Datatable["mods"]["13"] >= vCLIENT.CheckMods(source,Vehicle,13) then
								TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Transmissão</b> atingida.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["13"] = Datatable["mods"]["13"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,13,Datatable["mods"]["13"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Transmissão</b> incorreta.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["transmissiond"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["13"] then
							Datatable["mods"]["13"] = -1
						end

						if Datatable["mods"]["13"] == 2 then
							if Datatable["mods"]["13"] >= vCLIENT.CheckMods(source,Vehicle,13) then
								TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Transmissão</b> atingida.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["13"] = Datatable["mods"]["13"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,13,Datatable["mods"]["13"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Transmissão</b> incorreta.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["transmissione"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				local PassportPlate = vRP.PassportPlate(Plate)
				if PassportPlate then
					local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
					if parseInt(#Datatable) > 0 then
						Datatable = json.decode(Datatable[1]["dvalue"])

						if not Datatable["mods"]["13"] then
							Datatable["mods"]["13"] = -1
						end

						if Datatable["mods"]["13"] == 3 then
							if Datatable["mods"]["13"] >= vCLIENT.CheckMods(source,Vehicle,13) then
								TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Transmissão</b> atingida.",5000)
							else
								vRPC.AnimActive(source)
								Active[Passport] = os.time() + 1000
								Player(source)["state"]["Buttons"] = true
								TriggerClientEvent("inventory:Close",source)
								TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
								vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

								if vTASKBAR.UpgradeVehicle(source) then
									Active[Passport] = os.time() + 120
									TriggerClientEvent("Progress",source,"Aplicando",120000)

									repeat
										if os.time() >= parseInt(Active[Passport]) then
											Active[Passport] = nil
											vRPC.removeObjects(source)
											Player(source)["state"]["Buttons"] = false

											if vRP.TakeItem(Passport,Full,1,false,Slot) then
												Datatable["mods"]["13"] = Datatable["mods"]["13"] + 1
												vCLIENT.ActiveMods(source,Network,Plate,13,Datatable["mods"]["13"])
												vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
											end
										end

										Wait(100)
									until not Active[Passport]
								end

								TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
								Player(source)["state"]["Buttons"] = false
								vRPC.stopAnim(source,false)
								Active[Passport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Transmissão</b> incorreta.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
					end
				end
			end
		end
	end,

	["suspensiona"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				if vCLIENT.CheckCar(source,Vehicle) then
					local PassportPlate = vRP.PassportPlate(Plate)
					if PassportPlate then
						local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
						if parseInt(#Datatable) > 0 then
							Datatable = json.decode(Datatable[1]["dvalue"])

							if not Datatable["mods"]["15"] then
								Datatable["mods"]["15"] = -1
							end

							if Datatable["mods"]["15"] == -1 then
								if Datatable["mods"]["15"] >= vCLIENT.CheckMods(source,Vehicle,15) then
									TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Suspensão</b> atingida.",5000)
								else
									vRPC.AnimActive(source)
									Active[Passport] = os.time() + 1000
									Player(source)["state"]["Buttons"] = true
									TriggerClientEvent("inventory:Close",source)
									TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
									vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

									if vTASKBAR.UpgradeVehicle(source) then
										Active[Passport] = os.time() + 120
										TriggerClientEvent("Progress",source,"Aplicando",120000)

										repeat
											if os.time() >= parseInt(Active[Passport]) then
												Active[Passport] = nil
												vRPC.removeObjects(source)
												Player(source)["state"]["Buttons"] = false

												if vRP.TakeItem(Passport,Full,1,false,Slot) then
													Datatable["mods"]["15"] = Datatable["mods"]["15"] + 1
													vCLIENT.ActiveMods(source,Network,Plate,15,Datatable["mods"]["15"])
													vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
												end
											end

											Wait(100)
										until not Active[Passport]
									end

									TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
									Player(source)["state"]["Buttons"] = false
									vRPC.stopAnim(source,false)
									Active[Passport] = nil
								end
							else
								TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Suspensão</b> incorreta.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O veículo <b>"..VehicleName(vehName).."</b> não possui suspensão.",5000)
				end
			end
		end
	end,

	["suspensionb"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				if vCLIENT.CheckCar(source,Vehicle) then
					local PassportPlate = vRP.PassportPlate(Plate)
					if PassportPlate then
						local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
						if parseInt(#Datatable) > 0 then
							Datatable = json.decode(Datatable[1]["dvalue"])

							if not Datatable["mods"]["15"] then
								Datatable["mods"]["15"] = -1
							end

							if Datatable["mods"]["15"] == 0 then
								if Datatable["mods"]["15"] >= vCLIENT.CheckMods(source,Vehicle,15) then
									TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Suspensão</b> atingida.",5000)
								else
									vRPC.AnimActive(source)
									Active[Passport] = os.time() + 1000
									Player(source)["state"]["Buttons"] = true
									TriggerClientEvent("inventory:Close",source)
									TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
									vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

									if vTASKBAR.UpgradeVehicle(source) then
										Active[Passport] = os.time() + 120
										TriggerClientEvent("Progress",source,"Aplicando",120000)

										repeat
											if os.time() >= parseInt(Active[Passport]) then
												Active[Passport] = nil
												vRPC.removeObjects(source)
												Player(source)["state"]["Buttons"] = false

												if vRP.TakeItem(Passport,Full,1,false,Slot) then
													Datatable["mods"]["15"] = Datatable["mods"]["15"] + 1
													vCLIENT.ActiveMods(source,Network,Plate,15,Datatable["mods"]["15"])
													vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
												end
											end

											Wait(100)
										until not Active[Passport]
									end

									TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
									Player(source)["state"]["Buttons"] = false
									vRPC.stopAnim(source,false)
									Active[Passport] = nil
								end
							else
								TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Suspensão</b> incorreta.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O veículo <b>"..VehicleName(vehName).."</b> não possui suspensão.",5000)
				end
			end
		end
	end,

	["suspensionc"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				if vCLIENT.CheckCar(source,Vehicle) then
					local PassportPlate = vRP.PassportPlate(Plate)
					if PassportPlate then
						local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
						if parseInt(#Datatable) > 0 then
							Datatable = json.decode(Datatable[1]["dvalue"])

							if not Datatable["mods"]["15"] then
								Datatable["mods"]["15"] = -1
							end

							if Datatable["mods"]["15"] == 1 then
								if Datatable["mods"]["15"] >= vCLIENT.CheckMods(source,Vehicle,15) then
									TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Suspensão</b> atingida.",5000)
								else
									vRPC.AnimActive(source)
									Active[Passport] = os.time() + 1000
									Player(source)["state"]["Buttons"] = true
									TriggerClientEvent("inventory:Close",source)
									TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
									vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

									if vTASKBAR.UpgradeVehicle(source) then
										Active[Passport] = os.time() + 120
										TriggerClientEvent("Progress",source,"Aplicando",120000)

										repeat
											if os.time() >= parseInt(Active[Passport]) then
												Active[Passport] = nil
												vRPC.removeObjects(source)
												Player(source)["state"]["Buttons"] = false

												if vRP.TakeItem(Passport,Full,1,false,Slot) then
													Datatable["mods"]["15"] = Datatable["mods"]["15"] + 1
													vCLIENT.ActiveMods(source,Network,Plate,15,Datatable["mods"]["15"])
													vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
												end
											end

											Wait(100)
										until not Active[Passport]
									end

									TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
									Player(source)["state"]["Buttons"] = false
									vRPC.stopAnim(source,false)
									Active[Passport] = nil
								end
							else
								TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Suspensão</b> incorreta.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O veículo <b>"..VehicleName(vehName).."</b> não possui suspensão.",5000)
				end
			end
		end
	end,

	["suspensiond"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				if vCLIENT.CheckCar(source,Vehicle) then
					local PassportPlate = vRP.PassportPlate(Plate)
					if PassportPlate then
						local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
						if parseInt(#Datatable) > 0 then
							Datatable = json.decode(Datatable[1]["dvalue"])

							if not Datatable["mods"]["15"] then
								Datatable["mods"]["15"] = -1
							end

							if Datatable["mods"]["15"] == 2 then
								if Datatable["mods"]["15"] >= vCLIENT.CheckMods(source,Vehicle,15) then
									TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Suspensão</b> atingida.",5000)
								else
									vRPC.AnimActive(source)
									Active[Passport] = os.time() + 1000
									Player(source)["state"]["Buttons"] = true
									TriggerClientEvent("inventory:Close",source)
									TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
									vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

									if vTASKBAR.UpgradeVehicle(source) then
										Active[Passport] = os.time() + 120
										TriggerClientEvent("Progress",source,"Aplicando",120000)

										repeat
											if os.time() >= parseInt(Active[Passport]) then
												Active[Passport] = nil
												vRPC.removeObjects(source)
												Player(source)["state"]["Buttons"] = false

												if vRP.TakeItem(Passport,Full,1,false,Slot) then
													Datatable["mods"]["15"] = Datatable["mods"]["15"] + 1
													vCLIENT.ActiveMods(source,Network,Plate,15,Datatable["mods"]["15"])
													vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
												end
											end

											Wait(100)
										until not Active[Passport]
									end

									TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
									Player(source)["state"]["Buttons"] = false
									vRPC.stopAnim(source,false)
									Active[Passport] = nil
								end
							else
								TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Suspensão</b> incorreta.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O veículo <b>"..VehicleName(vehName).."</b> não possui suspensão.",5000)
				end
			end
		end
	end,

	["suspensione"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,vehName = vRPC.VehicleList(source,4)
			if Vehicle then
				if vCLIENT.CheckCar(source,Vehicle) then
					local PassportPlate = vRP.PassportPlate(Plate)
					if PassportPlate then
						local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName })
						if parseInt(#Datatable) > 0 then
							Datatable = json.decode(Datatable[1]["dvalue"])

							if not Datatable["mods"]["15"] then
								Datatable["mods"]["15"] = -1
							end

							if Datatable["mods"]["15"] == 3 then
								if Datatable["mods"]["15"] >= vCLIENT.CheckMods(source,Vehicle,15) then
									TriggerClientEvent("Notify",source,"amarelo","Limite da <b>Suspensão</b> atingida.",5000)
								else
									vRPC.AnimActive(source)
									Active[Passport] = os.time() + 1000
									Player(source)["state"]["Buttons"] = true
									TriggerClientEvent("inventory:Close",source)
									TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
									vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

									if vTASKBAR.UpgradeVehicle(source) then
										Active[Passport] = os.time() + 120
										TriggerClientEvent("Progress",source,"Aplicando",120000)

										repeat
											if os.time() >= parseInt(Active[Passport]) then
												Active[Passport] = nil
												vRPC.removeObjects(source)
												Player(source)["state"]["Buttons"] = false

												if vRP.TakeItem(Passport,Full,1,false,Slot) then
													Datatable["mods"]["15"] = Datatable["mods"]["15"] + 1
													vCLIENT.ActiveMods(source,Network,Plate,15,Datatable["mods"]["15"])
													vRP.Query("entitydata/SetData",{ dkey = "Mods:"..PassportPlate["Passport"]..":"..vehName, dvalue = json.encode(Datatable) })
												end
											end

											Wait(100)
										until not Active[Passport]
									end

									TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
									Player(source)["state"]["Buttons"] = false
									vRPC.stopAnim(source,false)
									Active[Passport] = nil
								end
							else
								TriggerClientEvent("Notify",source,"amarelo","Modelo da <b>Suspensão</b> incorreta.",5000)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Dirija-se até uma mecânica e efetue uma revisão.",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O veículo <b>"..VehicleName(vehName).."</b> não possui suspensão.",5000)
				end
			end
		end
	end,

	["toolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				if vTASKBAR.taskLockpick(source) then
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _,v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:repairVehicle",v,Network,Plate)
							end)
						end
					end
				end

				TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
				Player(source)["state"]["Buttons"] = false
				vRPC.stopAnim(source,false)
				Active[Passport] = nil
			end
		end
	end,

	["lockpick"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate,vehName,vehClass = vRPC.VehicleList(source,4)
			if Vehicle then
				local Brokenpick = 950
				if vehClass == 15 or vehClass == 16 or vehClass == 19 then
					return
				end

				if vRP.InsideVehicle(source) then
					vRPC.AnimActive(source)
					vGARAGE.StartHotwired(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)

					if vTASKBAR.taskLockpick(source) then
						if math.random(100) >= 20 then
							Brokenpick = 900
							TriggerEvent("plateEveryone",Plate)
							TriggerEvent("platePlayers",Plate,Passport)
							TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)

							local Network = NetworkGetEntityFromNetworkId(Network)
							if GetVehicleDoorLockStatus(Network) == 2 then
								SetVehicleDoorsLocked(Network,1)
							end
						end

						if math.random(100) >= 75 then
							local Coords = vRP.GetEntityCoords(source)
							local Service = vRP.NumPermission("Policia")
							for Passports,Sources in pairs(Service) do
								async(function()
									TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
								end)
							end
						end
					end

					if math.random(1000) >= Brokenpick then
						if vRP.TakeItem(Passport,Full,1,false) then
							vRP.GiveItem(Passport,"lockpick-0",1,false)
							TriggerClientEvent("itensNotify",source,{ "-","lockpick",1,"Lockpick de Alumínio" })
						end
					end

					Player(source)["state"]["Buttons"] = false
					vGARAGE.StopHotwired(source,vehicle)
					Active[Passport] = nil
				else
					vRPC.AnimActive(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)
					vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)

					if string.sub(Plate,1,4) == "DISM" then
						if vTASKBAR.UpgradeVehicle(source) then
							Brokenpick = 900
							Active[Passport] = os.time() + 30
							TriggerClientEvent("inventory:DisPed",source,Dismantle[Passport])
							TriggerClientEvent("Progress",source,"Usando",30000)

							if math.random(100) >= 25 then
								local Coords = vRP.GetEntityCoords(source)
								local Service = vRP.NumPermission("Policia")
								for Passports,Sources in pairs(Service) do
									async(function()
										TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
									end)
								end
							end

							repeat
								if os.time() >= parseInt(Active[Passport]) then
									Active[Passport] = nil

									TriggerEvent("plateEveryone",Plate)
									TriggerClientEvent("target:Dismantles",source)
									TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)

									local Network = NetworkGetEntityFromNetworkId(Network)
									if GetVehicleDoorLockStatus(Network) == 2 then
										SetVehicleDoorsLocked(Network,1)
									end
								end

								Wait(100)
							until not Active[Passport]
						end
					else
						if vTASKBAR.taskLockpick(source) then
							Brokenpick = 900

							if math.random(100) >= 75 then
								TriggerEvent("plateEveryone",Plate)
								TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)

								local Network = NetworkGetEntityFromNetworkId(Network)
								if GetVehicleDoorLockStatus(Network) == 2 then
									SetVehicleDoorsLocked(Network,1)
								end
							end

							if math.random(100) >= 25 then
								local Coords = vRP.GetEntityCoords(source)
								local Service = vRP.NumPermission("Policia")
								for Passports,Sources in pairs(Service) do
									async(function()
										TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
									end)
								end
							end
						end
					end

					if math.random(1000) >= Brokenpick then
						if vRP.TakeItem(Passport,Full,1,false) then
							vRP.GiveItem(Passport,"lockpick-0",1,false)
							TriggerClientEvent("itensNotify",source,{ "-","lockpick",1,"Lockpick de Alumínio" })
						end
					end

					Player(source)["state"]["Buttons"] = false
					vRPC.removeObjects(source)
					Active[Passport] = nil
				end
			else
				if exports["hud"]:Wanted(Passport) then
					return
				end

				local Property = exports["propertys"]:HomesTheft(source)
				if Property then
					TriggerClientEvent("inventory:Close",source)
					vRPC.removeObjects(source)
					vRP.UpgradeStress(Passport,2)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					vRPC.playAnim(source,false,{"missheistfbi3b_ig7","lift_fibagent_loop"},false)
					local Brokenpick = 950

					if vTASKBAR.taskLockpick(source) then
						Brokenpick = 900
						exports["propertys"]:EnterHomes(source,Passport,Property)
					else
						exports["propertys"]:ResetTheft(Property)

						if math.random(100) >= 50 then
							TriggerClientEvent("Notify",source,"amarelo","A vizinhança foi avisada de um suposto roubo.",5000)
							TriggerClientEvent("inventory:DisPed",source)
							local Players = vRPC.Players(source)
							for _,v in ipairs(Players) do
								async(function()
									TriggerClientEvent("sounds:source",v,"alarm",1.0)
								end)
							end

							local Coords = vRP.GetEntityCoords(source)
							local Service = vRP.NumPermission("Policia")
							for Passports,Sources in pairs(Service) do
								async(function()
									TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = "Roubo de Propriedade", x = Coords["x"], y = Coords["y"], z = Coords["z"], time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
								end)
							end
						end
					end

					if math.random(1000) >= Brokenpick then
						if vRP.TakeItem(Passport,Full,1,false) then
							vRP.GiveItem(Passport,"lockpick-0",1,false)
							TriggerClientEvent("itensNotify",source,{ "-","lockpick",1,"Lockpick de Alumínio" })
						end
					end

					Player(source)["state"]["Buttons"] = false
					vRPC.stopAnim(source,false)
					Active[Passport] = nil
				end
			end
		else
			local Brokenpick = 950
			Active[Passport] = os.time() + 100
			Player(source)["state"]["Buttons"] = true

			if vTASKBAR.taskHandcuff(source) then
				Brokenpick = 900
				Player(source)["state"]["Handcuff"] = false
				vRPC.removeObjects(source)
				
				Player(source)["state"]["Commands"] = false
			end

			if math.random(1000) >= Brokenpick then
				if vRP.TakeItem(Passport,Full,1,false) then
					vRP.GiveItem(Passport,"lockpick-0",1,false)
					TriggerClientEvent("itensNotify",source,{ "-","lockpick",1,"Lockpick de Alumínio" })
				end
			end

			Player(source)["state"]["Buttons"] = false
			Active[Passport] = nil
		end
	end,

	["blocksignal"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle and vRP.InsideVehicle(source) then
				if not exports["garages"]:Signal(Plate) then
					vRPC.AnimActive(source)
					vGARAGE.StartHotwired(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)

					if vTASKBAR.taskLockpick(source) then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("Notify",source,"verde","<b>Bloqueador de Sinal</b> instalado.",5000)
							TriggerEvent("signalRemove",Plate)
						end
					end

					Player(source)["state"]["Buttons"] = false
					vGARAGE.StopHotwired(source)
					Active[Passport] = nil
				else
					TriggerClientEvent("Notify",source,"amarelo","<b>Bloqueador de Sinal</b> já instalado.",5000)
				end
			end
		end
	end,

	["postit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("postit:initPostit",source)
	end,

	["dismantle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vCLIENT.DismantleStatus(source) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Close",source)

				Dismantle[Passport] = vRP.GetExperience(Passport,"Dismantle")
				if math.random(100) <= 15 then
					Dismantle[Passport] = math.random(1000)
				end

				vCLIENT.Dismantle(source,Dismantle[Passport])
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Você possui um contrato ativo.",5000)
		end
	end,

	["absolut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hennessy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chandon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["dewars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["scanner"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Scanners[Passport] = true
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("inventory:updateScanner",source,true)
		vRPC.createObjects(source,"mini@golfai","wood_idle_a","w_am_digiscanner",49,18905,0.15,0.1,0.0,-270.0,-180.0,-170.0)
	end,

	["orangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["passionjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.DowngradeStress(Passport,5)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["grapejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["strawberryjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["bananajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["acerolajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["orange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["apple"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["strawberry"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["coffee2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["grape"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["banana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["acerola"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["passion"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tomato"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["mushroom"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["guarana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["mushroomteaplus"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,1,true,Slot) then
			vRP.SetWeight(Passport,10)
			vRP.UpgradeThirst(Passport,20)
			TriggerClientEvent("inventory:Update",source,"Backpack")
		end
	end,

	["mushroomtea"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Player(source)["state"]["Buttons"] = false
				vRPC.removeObjects(source,"one")
				Active[Passport] = nil

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("player:MushroomTea",source)
					vRP.UpgradeThirst(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["water"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"emptybottle",1)
					vRP.UpgradeThirst(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["milkbottle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"emptybottle",1)
					vRP.UpgradeThirst(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["guarananatural"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.createObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_food_bs_juice02",49,28422,0.0,-0.01,-0.15,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setEnergetic",source,10,1.10)
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sinkalmy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,5)
					vRP.ChemicalTimer(Passport,3)
					vRP.DowngradeStress(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["ritmoneury"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,5)
					vRP.ChemicalTimer(Passport,3)
					vRP.DowngradeStress(Passport,30)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cola"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["soda"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.createObjects(source,"mp_player_intdrink","loop_bottle","ng_proc_sodacan_01b",49,60309,0.0,0.0,-0.04,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["fishingrod"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.fishingCoords(source) then
			Active[Passport] = os.time() + 100
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)

			if not vCLIENT.fishingAnim(source) then
				vRPC.AnimActive(source)
				vRPC.createObjects(source,"amb@world_human_stand_fishing@idle_a","idle_c","prop_fishing_rod_01",49,60309)
			end

			if vTASKBAR.taskFishing(source) then
				local Members = exports["vrp"]:Party(Passport,source,10)
				local fishList = { "octopus","shrimp","carp","horsefish","tilapia","codfish","catfish" }

				if parseInt(#Members) >= 4 then
					fishList = { "octopus","shrimp","carp","horsefish","tilapia","codfish","catfish","goldenfish","pirarucu","pacu","tambaqui" }
				end

				local fishRandom = math.random(#fishList)
				local fishSelects = fishList[fishRandom]

				if (vRP.InventoryWeight(Passport) + itemWeight(fishSelects)) <= vRP.GetWeight(Passport) then
					if vRP.TakeItem(Passport,"bait",1,false) then
						vRP.GenerateItem(Passport,fishSelects,1,true)
					else
						TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("bait").."</b>.",5000)
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
				end
			end

			Player(source)["state"]["Buttons"] = false
			Active[Passport] = nil
		end
	end,

	["coffeemilk"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setEnergetic",source,10,1.10)
					vRP.UpgradeThirst(Passport,20)
					vRP.UpgradeHunger(Passport,8)

					if vCLIENT.Restaurant(source,"BeanMachine") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzamozzarella"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)

					if vCLIENT.Restaurant(source,"PizzaThis") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzamushroom"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)

					if vCLIENT.Restaurant(source,"PizzaThis") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzabanana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)

					if vCLIENT.Restaurant(source,"PizzaThis") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzachocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"PizzaThis") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["nigirizushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["calzone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"PizzaThis") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chickenfries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"PizzaThis") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cookies"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setEnergetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["onionrings"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,15)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cannedsoup"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["canofbeans"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tablecoke"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "bkr_prop_coke_table01a"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = heading, object = Hash, item = Full, Distance = 50, mode = "1" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["tablemeth"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "bkr_prop_meth_table01a"
		local Application,Coords,heading = vRPC.objectCoords(source,Hash)
		if Application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 50, mode = "1" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["tableweed"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "bkr_prop_weed_table_01a"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 50, mode = "1" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["sprays01"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "spray_01"
		local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
		if Application then
			vRPC.AnimActive(source)
			Active[Passport] = os.time() + 5
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Pichando",5000)
			vRPC.createObjects(source,"switch@franklin@lamar_tagging_wall","lamar_tagging_exit_loop_lamar","prop_cs_spray_can",1,28422,0.0,0.0,0.0,0.0,0.0,0.0)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.removeObjects(source)

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Number = 0

						repeat
							Number = Number + 1
						until not Objects[tostring(Number)]

						Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100, mode = "Spray" }
						TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
					end
				end

				Wait(100)
			until not Active[Passport]
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["campfire"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "prop_beach_fire"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]) + 0.10, h = mathLength(heading), object = Hash, item = Full, Distance = 50, mode = "2" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["barrier"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "prop_mp_barrier_02b"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 100, mode = "3" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["medicbag"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "xm_prop_x17_bag_med_01a"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 50, mode = "4" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["weedclone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "bkr_prop_weed_med_01a"
		local Application,Coords = vRPC.objectCoords(source,Hash)
		if Application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,false,Slot) then
					vRPC.playAnim(source,false,{"amb@prop_human_bum_bin@base","base"},true)

					if vTASKBAR.Weeds(source) then
						local Points = 0
						local Route = GetPlayerRoutingBucket(source)

						if Split[2] ~= nil then
							Points = parseInt(Split[2])
						end

						exports["plants"]:Plants(Coords,Route,Points)
					end

					vRPC.removeObjects(source)
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,


	["medicbed"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "prop_ld_binbag_01"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				local mHash = GetHashKey(Hash)
				local Object = CreateObject(mHash,Coords["x"],Coords["y"],Coords["z"] - 0.86,true,true,false)

				while not DoesEntityExist(Object) do
					Wait(100)
				end

				if DoesEntityExist(Object) then
					SetEntityHeading(Object,heading)
					FreezeEntityPosition(Object,true)
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["c4"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "ch_prop_ch_ld_bomb_01a"
		local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
		if Application then
			local CoordsAtm,NumberAtm = vCLIENT.checkAtm(source,Coords)

			if CoordsAtm then
				if not atmTimers[NumberAtm] then
					atmTimers[NumberAtm] = os.time()
				end

				if os.time() < atmTimers[NumberAtm] then
					local Cooldown = parseInt(atmTimers[NumberAtm] - os.time())
					TriggerClientEvent("Notify",source,"azul","Caixa vazio, aguarde <b>"..Cooldown.."</b> segundos até que um transportador venha até o local efetuar reabastecimento do mesmo.",5000)
					Player(source)["state"]["Buttons"] = false

					return
				end

				local Service,Total = vRP.NumPermission("Policia")
				if Total <= 5 then
					TriggerClientEvent("Notify",source,"azul","Caixa vazio, aguarde até que um transportador venha até o local efetuar reabastecimento do mesmo.",5000)
					Player(source)["state"]["Buttons"] = false

					return
				end

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100 }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
					TriggerClientEvent("Progress",source,"Plantando",25000)
					atmTimers[NumberAtm] = os.time() + 10800
					local explosionProgress = 25

					for Passports,Sources in pairs(Service) do
						async(function()
							vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
							TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Caixa Eletrônico", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
						end)
					end

					repeat
						Wait(1000)
						explosionProgress = explosionProgress - 1
					until explosionProgress <= 0

					Creative.DropServer(CoordsAtm,"dollars",math.random(2500,5000))
					TriggerClientEvent("player:Residuals",source,"Resíduo de Explosivo.")
					TriggerClientEvent("objects:Remover",-1,tostring(Number))
					TriggerClientEvent("vRP:Explosion",source,Coords)
					TriggerEvent("Wanted",source,Passport,600)
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["carp"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["codfish"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["catfish"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["goldenfish"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["horsefish"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["tilapia"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["pacu"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["pirarucu"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["tambaqui"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight("fishfillet") * 2) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"fishfillet",2)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["cookedfishfillet"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cookedmeat"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hotdog"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_cs_hotdog_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sandwich"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_sandwich_01",49,18905,0.13,0.05,0.02,-50.0,16.0,60.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)

					if vCLIENT.Restaurant(source,"BeanMachine") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tacos"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_taco_01",49,18905,0.16,0.06,0.02,-50.0,220.0,60.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,15)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["fries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)

					if vCLIENT.Restaurant(source,"BurgerShot") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["milkshake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cappuccino"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.createObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["applelove"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setEnergetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,10)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cupcake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setEnergetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,10)

					if vCLIENT.Restaurant(source,"UwuCoffee") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["marshmallow"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,8)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["donut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.createObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_amb_donut",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("setEnergetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,8)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["notepad"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 100
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.keySingle(source,"Mensagem:")
		if Keyboard then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				if Split[2] then
					vRP.SetSrvData(Full,Keyboard[1])
					vRP.GenerateItem(Passport,Full,1,false)
				else
					local Time = os.time()
					vRP.SetSrvData("notepad-"..Time,Keyboard[1])
					vRP.GenerateItem(Passport,"notepad-"..Time,1,false)
				end
			end

			TriggerClientEvent("inventory:Update",source,"Backpack")
		end

		Player(source)["state"]["Buttons"] = false
		Active[Passport] = nil
	end,

	["megaphone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("player:Megaphone",source)
		TriggerClientEvent("pma-voice:Megaphone",source,true)
		TriggerEvent("pma-voice:Megaserver",source,true)
		TriggerClientEvent("emotes",source,"megaphone")
	end,

	["notebook"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("notebook:openSystem",source)
	end,

	["tyres"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if not vCLIENT.checkWeapon(source,"WEAPON_WRENCH") then
				TriggerClientEvent("Notify",source,"amarelo","<b>Chave Inglesa</b> não encontrada.",5000)
				return
			end

			local tyreStatus,Tyre,Network,Plate = vCLIENT.tyreStatus(source)
			if tyreStatus then
				local Vehicle = NetworkGetEntityFromNetworkId(Network)
				if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
					if vCLIENT.tyreHealth(source,Network,Tyre) ~= 1000.0 then
						vRPC.AnimActive(source)
						Active[Passport] = os.time() + 100
						Player(source)["state"]["Buttons"] = true
						TriggerClientEvent("inventory:Close",source)
						vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

						if vTASKBAR.taskTyre(source) then
							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:repairTyre",v,Network,Tyre,Plate)
									end)
								end
							end
						end

						Player(source)["state"]["Buttons"] = false
						vRPC.stopAnim(source,false)
						Active[Passport] = nil
					end
				end
			end
		end
	end,

	["premiumplate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.InsideVehicle(source) then
			TriggerClientEvent("inventory:Close",source)

			local vehModel = vRPC.VehicleName(source)
			local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = vehModel })
			if vehicle[1] then
				local Keyboard = vKEYBOARD.keySingle(source,"Placa: (8 Caracteres)")
				if Keyboard then
					local namePlate = string.sub(Keyboard[1],1,8)
					local plateCheck = sanitizeString(namePlate,"abcdefghijklmnopqrstuvwxyz0123456789",true)

					if string.len(plateCheck) ~= 8 then
						TriggerClientEvent("Notify",source,"amarelo","O nome de definição para a placa inválida.",5000)
						return
					else
						if vRP.PassportPlate(namePlate) then
							TriggerClientEvent("Notify",source,"vermelho","A placa escolhida já possui em outro veículo.",5000)
							return
						else
							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								vRP.Query("vehicles/plateVehiclesUpdate",{ Passport = Passport, vehicle = vehModel, plate = string.upper(namePlate) })
								TriggerClientEvent("Notify",source,"verde","Placa atualizada.",5000)
							end
						end
					end
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","Modelo de veículo não encontrado.",5000)
			end
		end
	end,

	["radio"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("radio:RadioNui",source)
		vRPC.AnimActive(source)
	end,

	["scuba"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("hud:Scuba",source)
	end,

	["handcuff"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local ClosestPed = vRPC.ClosestPed(source,1)
			if ClosestPed then
				Player(source)["state"]["Cancel"] = true
				Player(source)["state"]["Buttons"] = true

				if Player(ClosestPed)["state"]["Handcuff"] then
					Player(ClosestPed)["state"]["Handcuff"] = false
					Player(ClosestPed)["state"]["Commands"] = false
					TriggerClientEvent("sounds:Private",source,"uncuff",0.5)
					TriggerClientEvent("sounds:Private",ClosestPed,"uncuff",0.5)

					vRPC.removeObjects(ClosestPed)
				else
					TriggerClientEvent("hud:RadioClean",ClosestPed)
					TriggerClientEvent("player:playerCarry",ClosestPed,source,"handcuff")
					vRPC.playAnim(source,false,{"mp_arrest_paired","cop_p2_back_left"},false)
					vRPC.playAnim(ClosestPed,false,{"mp_arrest_paired","crook_p2_back_left"},false)

					Wait(3500)

					vRPC.removeObjects(source)
					Player(ClosestPed)["state"]["Handcuff"] = true
					Player(ClosestPed)["state"]["Commands"] = true
					TriggerClientEvent("inventory:Close",ClosestPed)
					TriggerClientEvent("sounds:Private",source,"cuff",0.5)
					TriggerClientEvent("sounds:Private",ClosestPed,"cuff",0.5)
					TriggerClientEvent("player:playerCarry",ClosestPed,source)
				end

				Player(source)["state"]["Cancel"] = false
				Player(source)["state"]["Buttons"] = false
			end
		end
	end,

	["hood"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if Player(ClosestPed)["state"]["Handcuff"] then
				TriggerClientEvent("hud:toggleHood",ClosestPed)
				TriggerClientEvent("inventory:Close",ClosestPed)
			end
		end
	end,

	["rope"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if Carry[Passport] then
				TriggerClientEvent("player:ropeCarry",Carry[Passport],source)
				TriggerClientEvent("player:Commands",Carry[Passport],false)
				vRPC.removeObjects(Carry[Passport])
				vRPC.removeObjects(source)
				Carry[Passport] = nil
			else
				local ClosestPed = vRPC.ClosestPed(source,3)
				if ClosestPed then
					if vRP.GetHealth(ClosestPed) <= 100 or Player(ClosestPed)["state"]["Handcuff"] then
						Carry[Passport] = ClosestPed

						TriggerClientEvent("player:ropeCarry",Carry[Passport],source)
						TriggerClientEvent("player:Commands",Carry[Passport],true)
						TriggerClientEvent("inventory:Close",Carry[Passport])

						vRPC.playAnim(ClosestPed,false,{"nm","firemans_carry"},true)
						vRPC.playAnim(source,true,{"missfinale_c2mcs_1","fin_c2_mcs_1_camman"},true)
					end
				end
			end
		end
	end,

	["rolepass"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.CheckRolepass(source) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerEvent("vRP:ActivePass",source)
			end
		end
	end,

	["premium"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.UserPremium(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",1)
				vRP.SetPremium(source)
			end
		else
			if vRP.HasPermission(Passport,"Premium",1) and vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",1)
				vRP.UpgradePremium(source)
			end
		end
	end,

	["backpack"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.GetWeight(Passport) >= 100 then
		  TriggerClientEvent("Notify",source,"amarelo","Você já possui o limite máximo de mochila.",5000)
		  return
		end
	  
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Colocando Mochila",10000)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)
	  
		repeat
		  if os.time() >= parseInt(Active[Passport]) then
			Active[Passport] = nil
			vRPC.stopAnim(source,false)
			Player(source)["state"]["Buttons"] = false
	  
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
			  vRP.SetWeight(Passport,10)
			--   SetPedComponentVariation(GetPlayerPed(source),5,85,0,1)
			  TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		  end
	  
		  Wait(100)
		until not Active[Passport]
	  end,
	  
	["pager"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if Player(ClosestPed)["state"]["Handcuff"] then
				local OtherPassport = vRP.Passport(ClosestPed)
				if OtherPassport then
					if vRP.HasService(OtherPassport,"Policia") then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.ServiceLeave(ClosestPed,OtherPassport,"Policia",true)
							TriggerClientEvent("Notify",source,"amarelo","Todas as comunicações foram retiradas.",5000)
						end
					end

					if vRP.HasService(OtherPassport,"Hospital") then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.ServiceLeave(ClosestPed,OtherPassport,"Hospital",true)
							TriggerClientEvent("Notify",source,"amarelo","Todas as comunicações foram retiradas.",5000)
						end
					end
				end
			end
		end
	end
}