-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("shops",Creative)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SendNUIMessage({ action = "hideNUI" })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(Data,Callback)
	local inventoryShop,inventoryUser,invPeso,invMaxpeso,shopSlots = vSERVER.requestShop(Data["shop"])
	if inventoryShop then
		Callback({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso, shopSlots = shopSlots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(Data,Callback)
	vSERVER.functionShops(Data["shop"],Data["item"],Data["amount"],Data["slot"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(Data,Callback)
	TriggerServerEvent("shops:populateSlot",Data["item"],Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(Data,Callback)
	TriggerServerEvent("shops:updateSlot",Data["item"],Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKCHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.updateShops(action)
	SendNUIMessage({ action = action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ -544.98,-204.11,38.22,"Identity",false,2.75 },
	{ -544.76,-185.81,52.2,"Identity2",false,2.75 },
	{ 24.9,-1346.8,29.49,"Departament",true },
	{ 2556.74,381.24,108.61,"Departament",true },
	{ 1164.82,-323.65,69.2,"Departament",true },
	{ -706.15,-914.53,19.21,"Departament",true },
	{ -47.38,-1758.68,29.42,"Departament",true },
	{ 373.1,326.81,103.56,"Departament",true },
	{ -3242.75,1000.46,12.82,"Departament",true },
	{ 1728.47,6415.46,35.03,"Departament",true },
	{ 1960.2,3740.68,32.33,"Departament",true },
	{ 2677.8,3280.04,55.23,"Departament",true },
	{ 1697.31,4923.49,42.06,"Departament",true },
	{ -1819.52,793.48,138.08,"Departament",true },
	{ 1391.69,3605.97,34.98,"Departament",true },
	{ -2966.41,391.55,15.05,"Departament",true },
	{ -3039.54,584.79,7.9,"Departament",true },
	{ 1134.33,-983.11,46.4,"Departament",true },
	{ 1165.28,2710.77,38.15,"Departament",true },
	{ -1486.72,-377.55,40.15,"Departament",true },
	{ -1221.45,-907.92,12.32,"Departament",true },
	{ 161.2,6641.66,31.69,"Departament",true },
	{ -160.62,6320.93,31.58,"Departament",true },
	{ 548.7,2670.73,42.16,"Departament",true },
	{ -1217.8,-1493.34,4.36,"Sugar",true },
	{ -1246.11,-1453.19,4.36,"Sugar",true },
	{ -1215.28,-1467.28,4.36,"Sugar",true }, 
	{ -1210.14,-1464.29,4.36,"Verdinha",true }, 
	{ -1249.89,-1448.57,4.36,"Verdinha",true }, 
	{ -1221.32,-1488.56,4.36,"Verdinha",true }, 
	{ -1272.89,-1412.17,4.36,"Digital",true }, 
	{ -1209.19,-1503.16,4.36,"Digital",true }, 
	{ -1231.23,-1440.83,4.36,"Digital",true }, 
	{ -1228.21,-1475.41,4.36,"Pharmacy",false },
	{ -1226.53,-1477.8,4.36,"Pharmacy",false }, 
	{ -1254.83,-1437.44,4.36,"Pharmacy",false },
	{ -1256.28,-1435.31,4.36,"Pharmacy",false },
	{ -1199.2,-1459.27,4.36,"Pharmacy",false },
	{ -1196.76,-1457.53,4.38,"Pharmacy",false },
	{ 1693.2,3760.13,34.69,"Ammunation",false },
	{ 252.61,-50.12,69.94,"Ammunation",false },
	{ 842.37,-1034.01,28.19,"Ammunation",false },
	{ -330.71,6084.1,31.46,"Ammunation",false },
	{ -662.28,-934.85,21.82,"Ammunation",false },
	{ -1305.36,-394.36,36.7,"Ammunation",false },
	{ -1118.1,2698.84,18.55,"Ammunation",false },
	{ 2567.9,293.86,108.73,"Ammunation",false },
	{ -3172.39,1087.88,20.84,"Ammunation",false },
	{ 22.17,-1106.71,29.79,"Ammunation",false },
	{ 810.18,-2157.77,29.62,"Ammunation",false },
	{ -1836.85,-1189.26,14.36,"Fishing",false },
	{ 1522.88,3783.63,34.47,"Fishing2",true,2.25 },
	{ -695.56,5802.12,17.32,"Hunting",false },
	{ -679.13,5839.52,17.32,"Hunting2",false },
	{ -172.89,6381.32,31.48,"Pharmacy",false },
	{ 1690.07,3581.68,35.62,"Pharmacy",false },
	{ -486.03,-1016.59,24.28,"Pharmacy",false },
	{ -486.94,-1012.45,24.28,"Pharmacy",false },
	{ -489.24,-1009.18,24.28,"Hospital",false },
	{ -254.64,6326.95,32.82,"Hospital",false },
	{ 82.98,-1553.55,29.59,"Recycle",false },
	{ 287.77,2843.9,44.7,"Recycle",false },
	{ -413.97,6171.58,31.48,"Recycle",false },
	{ -308.21,-1064.62,28.34,"Policia",false }, --1 BPM
	{ 364.62,-1604.05,25.44,"Policia",false },-- DIB
	{ 836.41,-1287.41,28.24,"Policia",false },-- CORE
	{ -628.79,-238.7,38.05,"Miners",false },
	{ 475.1,3555.28,33.23,"Criminal",false },
	{ 112.41,3373.68,35.25,"Criminal2",false },
	{ 2013.95,4990.88,41.21,"Criminal3",false },
	{ 186.9,6374.75,32.33,"Criminal4",false },
	{ -653.12,-1502.67,5.22,"Criminal",false },
	{ 389.71,-942.61,29.42,"Criminal2",false },
	{ 154.98,-1472.47,29.35,"Criminal3",false },
	{ 488.1,-1456.11,29.28,"Criminal4",false },
	{ 169.76,-1535.88,29.25,"Weapons",false },
	{ 301.14,-195.75,61.57,"Weapons",false },

	
	{ -513.48,-2215.67,6.39,"Bennys",false },
	{ -518.67,-2221.42,6.39,"Bennys",false },
	{ -523.96,-2229.24,6.39,"Bennys",false },
	{ -529.58,-2235.21,6.39,"Bennys",false },


	{ -1421.15,-455.23,35.91,"Mecanica",false },
	{ -1415.47,-451.72,35.91,"Mecanica",false },
	{ -1408.0,-447.0,35.91,"Mecanica",false },




	{ -1636.74,-1092.17,13.08,"Oxy",false },
	{ -1236.81,-271.84,37.76,"BurgerShot",false },
	{ 806.22,-761.68,26.77,"PizzaThis",false },
	{ -588.5,-1066.23,22.34,"UwuCoffee",false },
	{ 124.01,-1036.72,29.27,"BeanMachine",false },



	{ 357.78,-2721.45,1.7,"ilegal",false },

    --[[{ -1127.26, -1439.35, 5.22, "Clothes", false },
    { 78.26, -1388.91, 29.37, "Clothes", false },
    { -706.73, -151.38, 37.41, "Clothes", false },
    { -166.69, -301.55, 39.73, "Clothes", false },
    { -817.5, -1074.03, 11.32, "Clothes", false },
    { -1197.33, -778.98, 17.32, "Clothes", false },
    { -1447.84, -240.03, 49.81, "Clothes", false },
    { -0.07, 6511.8, 31.88, "Clothes", false },
    { 1691.6, 4818.47, 42.06, "Clothes", false },
    { 123.21, -212.34, 54.56, "Clothes", false },
    { 621.24, 2753.37, 42.09, "Clothes", false },
    { 1200.68, 2707.35, 38.22, "Clothes", false },
    { -3172.39, 1055.31, 20.86, "Clothes", false },
    { -1096.53, 2711.1, 19.11, "Clothes", false },]]
	{ -1174.54,-1571.4,4.35,"Weeds",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:openSystem",function(shopId)
	if LocalPlayer["state"]["Route"] < 900000 then
		if vSERVER.requestPerm(List[shopId][4]) then
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "showNUI", name = List[shopId][4], type = vSERVER.getShopType(List[shopId][4]) })

			if List[shopId][5] then
				TriggerEvent("sounds:Private","shop",0.5)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEEMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:coffeeMachine",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "coffeeMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODAMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:sodaMachine",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "sodaMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUTMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:donutMachine",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "donutMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:burgerMachine",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "burgerMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOGMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:hotdogMachine",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "hotdogMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CHIHUAHUA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Chihuahua",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Chihuahua", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:waterMachine",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "waterMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEDICBAG
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:medicBag",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		if vSERVER.requestPerm("Hospital") then
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "showNUI", name = "Hospital", type = "Buy" })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FUEL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Fuel",function()
	SendNUIMessage({ action = "showNUI", name = "Fuel", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FUEL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Premium",function()
	SendNUIMessage({ action = "showNUI", name = "Premium", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(List) do
		exports["target"]:AddCircleZone("Shops:"..Number,vec3(v[1],v[2],v[3]),0.55,{
			name = "Shops:"..Number,
			heading = 3374176
		},{
			shop = Number,
			Distance = v[6] or 1.75,
			options = {
				{
					event = "shops:openSystem",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)