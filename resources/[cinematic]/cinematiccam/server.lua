local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
src = {}
Tunnel.bindInterface('cinematic',src)

function src.checkPerm()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport, 'Admin') or vRP.HasGroup(Passport, 'Cam') then
			-- exports["logs"]:sendLogs(user_id,{ webhook = "cam", text = "Passaporte: `"..user_id.."`"    })
			return true
		end
	end
	return false
end
