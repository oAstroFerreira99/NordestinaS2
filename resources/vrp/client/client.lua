-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]:set("Route",0,false)
LocalPlayer["state"]:set("Name","",false)
LocalPlayer["state"]:set("Passport",0,false)
LocalPlayer["state"]:set("Rope",false,false)
LocalPlayer["state"]:set("Cancel",false,true)
LocalPlayer["state"]:set("Active",false,false)
LocalPlayer["state"]:set("Handcuff",false,true)
LocalPlayer["state"]:set("Commands",false,true)
LocalPlayer["state"]:set("Spectate",false,false)
LocalPlayer["state"]:set("Invisible",false,false)
LocalPlayer["state"]:set("Invincible",false,false)
LocalPlayer["state"]:set("usingPhone",false,false)
LocalPlayer["state"]:set("Player",GetPlayerServerId(PlayerId()),false)

LocalPlayer["state"]:set("Admin",false,false)
LocalPlayer["state"]:set("Policia",false,false)
LocalPlayer["state"]:set("Hospital",false,false)
LocalPlayer["state"]:set("Mecanico",false,false)
LocalPlayer["state"]:set("PizzaThis",false,false)
LocalPlayer["state"]:set("UwuCoffee",false,false)
LocalPlayer["state"]:set("BeanMachine",false,false)
LocalPlayer["state"]:set("Ballas",false,false)
LocalPlayer["state"]:set("Vagos",false,false)
LocalPlayer["state"]:set("Families",false,false)
LocalPlayer["state"]:set("Aztecas",false,false)
--FAVELAS
LocalPlayer["state"]:set("Favela01",false,false)
LocalPlayer["state"]:set("Favela02",false,false)
LocalPlayer["state"]:set("Favela03",false,false)
LocalPlayer["state"]:set("Favela04",false,false)
LocalPlayer["state"]:set("Favela05",false,false)
LocalPlayer["state"]:set("Favela06",false,false)
LocalPlayer["state"]:set("Favela07",false,false)
LocalPlayer["state"]:set("Favela08",false,false)
--------
LocalPlayer["state"]:set("Altruists",false,false)
LocalPlayer["state"]:set("Triads",false,false)
LocalPlayer["state"]:set("Razors",false,false)

LocalPlayer["state"]:set("Buttons",false,true)
LocalPlayer["state"]:set("Cassino",false,false)
LocalPlayer["state"]:set("Race",false,false)
LocalPlayer["state"]:set("Target",false,false)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vRP:Active")
AddEventHandler("vRP:Active",function(Passport,Name)
	LocalPlayer["state"]:set("Name",Name,false)
	LocalPlayer["state"]:set("Active",true,false)
	LocalPlayer["state"]:set("Invincible",true,false)
	LocalPlayer["state"]:set("Passport",Passport,false)

	SetDiscordAppId(1125203271007617116)
	SetDiscordRichPresenceAsset("logo")
	SetRichPresence(Passport.." - "..Name)
	SetDiscordRichPresenceAssetSmall("Maestria")
	SetDiscordRichPresenceAssetText("Maestria Digital")
	SetDiscordRichPresenceAssetSmallText("Maestria Digital")
	SetDiscordRichPresenceAction(0, "Adquira ja sua base", "https://discord.gg/CGS4HDSmzq")
	SetDiscordRichPresenceAction(1, "Video", "https://www.youtube.com/@maestriadigital")

	TriggerEvent("hud:Passport",Passport)

	local Pid = PlayerId()
	local Ped = PlayerPedId()

	ReloadCharacter(Pid,Ped)
	SetEntityInvincible(Ped,true)
	FreezeEntityPosition(Ped,false)
	NetworkSetFriendlyFireOption(true)
	SetCanAttackFriendly(Ped,true,false)

	SetTimeout(10000,function()
		SetEntityInvincible(Ped,false)
		LocalPlayer["state"]:set("Invincible",false,false)
	end)
end)