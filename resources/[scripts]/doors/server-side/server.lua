-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Bahamas = {}
Tunnel.bindInterface("doors",Bahamas)
vTASKBAR = Tunnel.getInterface("taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Doors"] = {
	-- Police-1
	[1] = { x = -789.25, y = -1212.3, z = 3.56, hash = 631614199, lock = true, text = true, distance = 5, press = 2, perm = "Policia" }, 
	[2] = { x = -786.85, y = -1214.3, z = 3.56, hash = 631614199, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[3] = { x = -784.53, y = -1216.35, z = 3.56, hash = 631614199, lock = true, text = true, distance = 5, press = 2, perm = "Policia" }, 
	[4] = { x = -791.47, y = -1208.29, z = 3.56, hash = -806761221, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[5] = { x = -801.92, y = -1219.1, z = 6.86, hash = -806761221, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[6] = { x = -796.6, y = -1214.76, z = 3.56, hash = -806761221, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[7] = { x = 370.0, y = -1606.44, z = 30.04, hash = -674638964, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[8] = { x = 367.34, y = -1604.22, z = 30.04, hash = -674638964, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[9] = { x = 376.67, y = -1599.92, z = 25.44, hash = -674638964, lock = true, text = true, distance = 5, press = 2, perm = "Policia" }, 
	[10] = { x = 374.14, y = -1597.64, z = 25.44, hash = -674638964, lock = true, text = true, distance = 5, press = 2, perm = "Policia" }, 
	[11] = { x = 366.44, y = -1600.61, z = 25.44, hash = 1885233650, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },

	[12] = { x = -327.25, y = -1044.9, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[13] = { x = -330.6, y = -1043.93, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[14] = { x = -333.53, y = -1042.52, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[15] = { x = -336.97, y = -1041.44, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[16] = { x = -336.77, y = -1038.56, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[17] = { x = -333.46, y = -1039.75, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[18] = { x = -330.21, y = -1040.55, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[19] = { x = -327.09, y = -1041.95, z = 28.32, hash = 1813468651, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },

	[20] = { x = -315.03, y = -1047.79, z = 28.32, hash = -1197461458, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[21] = { x = -299.62, y=-1063.22, z = 28.40, hash = -1197461458, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[22] = {x=-295.58,y=-1053.05,z=28.40, hash = -1197461458, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },
	[23] = {x=-308.08,y=-1060.33,z=28.34, hash = -1197461458, lock = true, text = true, distance = 5, press = 2, perm = "Policia" },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.doorsStatistics(doorNumber,doorStatus)
	local Doors = GlobalState["Doors"]

	Doors[doorNumber]["lock"] = doorStatus

	if Doors[doorNumber]["other"] ~= nil then
		local doorSecond = Doors[doorNumber]["other"]
		Doors[doorSecond]["lock"] = doorStatus
	end

	GlobalState["Doors"] = Doors
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Bahamas.doorsPermission(doorNumber)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if GlobalState["Doors"][doorNumber]["perm"] ~= nil then
			if vRP.HasGroup(Passport,GlobalState["Doors"][doorNumber]["perm"]) then
				return true
			end
		end
	end

	return false
end