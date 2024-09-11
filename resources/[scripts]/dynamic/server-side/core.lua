-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("dynamic",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local Works = {
	["Dismantle"] = "Desmanche",
	["Tows"] = "Reboque",
	["Delivery"] = "Entregador",
	["Transporter"] = "Transportador",
	["Lumberman"] = "Lenhador"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HasGroupVIP
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.HasGroupVIP()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if  vRP.HasGroup(user_id,"VipPermanente") or vRP.HasGroup(Passport,"Bronze") or vRP.HasGroup(Passport,"Prata") or vRP.HasGroup(Passport,"Ouro") or vRP.HasGroup(Passport,"Platina") or vRP.HasGroup(Passport,"Diamante") or vRP.HasGroup(Passport,"Arcadius") or vRP.HasGroup(Passport,"VipZuleico") then
			return true
		end
		return false
	end
end

function Creative.HasGroupVIP2()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if  vRP.HasGroup(user_id,"VipPermanente") or vRP.HasGroup(Passport,"Ouro") or vRP.HasGroup(Passport,"Platina") or vRP.HasGroup(Passport,"Diamante") or vRP.HasGroup(Passport,"Arcadius") or vRP.HasGroup(Passport,"VipZuleico") then
			return true
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Experience()
	local source = source
	local Passport = vRP.Passport(source)
	local Datatable = vRP.Datatable(Passport)
	if Passport and Datatable then
		local Experiences = {}

		for Index,v in pairs(Works) do
			if Datatable[Index] then
				Experiences[v] = Datatable[Index]
			else
				Experiences[v] = 0
			end
		end

		return Experiences
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXCLUSIVAS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Exclusivas()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Clothes = {}
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport,true)

		for Index,v in pairs(Consult) do
			Clothes[#Clothes + 1] = { ["name"] = Index, ["id"] = v["id"], ["texture"] = v["texture"] or 0, ["type"] = v["type"] }
		end

		return Clothes
	end
end