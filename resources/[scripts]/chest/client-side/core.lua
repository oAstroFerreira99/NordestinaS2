-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	{ ["Name"] = "Policia", ["Coords"] = vec3(-323.1,-1040.7,28.32), ["Mode"] = "1" },
	{ ["Name"] = "Hospital", ["Coords"] = vec3(-469.96,-1042.9,24.28), ["Mode"] = "2" },
	{ ["Name"] = "Mecanica", ["Coords"] = vec3(-171.87,-1171.88,23.05), ["Mode"] = "3" },

	-- { ["Name"] = "Pokecafe", ["Coords"] = vec3(-633.96,-288.54,34.32), ["Mode"] = "2" },
	{ ["Name"] = "Perola", ["Coords"] = vec3(-1840.74,-1182.77,14.32), ["Mode"] = "2" },

	{ ["Name"] = "Org1", ["Coords"] = vec3(345.02,-2708.7,1.7), ["Mode"] = "1"}, -- contrabando porto
	{ ["Name"] = "Org2", ["Coords"] = vec3(93.92,-1291.05,29.27), ["Mode"] = "2" }, --LAVAGEM vanilla
	{ ["Name"] = "Org3", ["Coords"] = vec3(993.0,-135.46,74.05), ["Mode"] = "2"}, --Desmanche motoclub
	{ ["Name"] = "Org4", ["Coords"] = vec3(725.19,-1066.9,28.31), ["Mode"] = "2"}, --ls ponte
	{ ["Name"] = "Org5", ["Coords"] = vec3(-1490.11,846.09,181.6), ["Mode"] = "2"}, --Mafia ARMA
	{ ["Name"] = "Org6", ["Coords"] = vec3(736.05,-808.12,16.29), ["Mode"] = "2"}, --Desmanche Arcade
	{ ["Name"] = "Org7", ["Coords"] = vec3(-1023.36,-1475.76,-3.34), ["Mode"] = "2"}, -- municao Tokyo	
	{ ["Name"] = "Org8", ["Coords"] = vec3(-1365.56,-616.85,30.31), ["Mode"] = "2"}, -- LAVAGEM bahamas	
	{ ["Name"] = "Org9", ["Coords"] = vec3(-307.3,209.36,145.31), ["Mode"] = "2"}, -- LAVAGEM lux	
	{ ["Name"] = "Org10", ["Coords"] = vec3(-1561.46,-381.09,48.04), ["Mode"] = "2"}, -- contrabando Bloods	
	

	{ ["Name"] = "Favela1", ["Coords"] = vec3(1377.63,-1297.52,75.62), ["Mode"] = "2"}, -- LAVAGEM Ladeira
	{ ["Name"] = "Favela2", ["Coords"] = vec3(1270.74,-126.4,87.64), ["Mode"] = "2"}, -- ARMAS Grota
	{ ["Name"] = "Favela3", ["Coords"] = vec3(799.52,-293.77,69.45), ["Mode"] = "2"}, -- campinho
	{ ["Name"] = "Favela4", ["Coords"] = vec3(875.37,1035.92,283.67), ["Mode"] = "2"}, -- Municao Letreiro
	{ ["Name"] = "Favela5", ["Coords"] = vec3(1346.22,-678.06,88.55), ["Mode"] = "2"}, -- Helipa
	{ ["Name"] = "Favela6", ["Coords"] = vec3(3020.7,2987.64,91.87), ["Mode"] = "2"}, -- Mineiradora
	{ ["Name"] = "Favela7", ["Coords"] = vec3(2454.82,3775.72,52.47), ["Mode"] = "2"}, -- Sandy

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Compartimento Geral",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Open",
			label = "Compartimento Pessoal",
			tunnel = "shop",
			service = "Personal"
		},{
			event = "chest:Open",
			label = "Compartimento Evidências",
			tunnel = "shop",
			service = "Evidences"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["3"] = {
		{
			event = "chest:Open",
			label = "Bandeja",
			tunnel = "shop",
			service = "Normal"
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			heading = 3374176
		},{
			Distance = 1.5,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:Open",function(Name,Init)
	if LocalPlayer["state"]["Route"] < 900000 then
		if vSERVER.Permissions(Name,Init) then
			SetNuiFocus(true,true)
			SendNUIMessage({ Action = "Open" })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	vSERVER.Update(Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,invPeso,invMaxpeso,chestPeso,chestMaxpeso = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close",function(Action)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
end)