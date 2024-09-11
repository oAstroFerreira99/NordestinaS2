-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIFTENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function driftEnable()
	if not IsPauseMenuActive() then
		local Ped = PlayerPedId()
		if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) and not IsPedInAnyHeli(Ped) and not IsPedInAnyBoat(Ped) and not IsPedInAnyPlane(Ped) then
			local Vehicle = GetVehiclePedIsIn(Ped)
			if GetPedInVehicleSeat(Vehicle,-1) == Ped then
				local speed = GetEntitySpeed(Vehicle) * 3.6
				if speed <= 100.0 and speed >= 5.0 then
					SetVehicleReduceGrip(Vehicle,false)

					if not GetDriftTyresEnabled(Vehicle) then
						SetDriftTyresEnabled(Vehicle,false)
						SetReduceDriftVehicleSuspension(Vehicle,false)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIFTDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function driftDisable()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		local Vehicle = GetLastDrivenVehicle()

		if GetDriftTyresEnabled(Vehicle) then
			SetVehicleReduceGrip(Vehicle,true)
			SetDriftTyresEnabled(Vehicle,true)
			SetReduceDriftVehicleSuspension(Vehicle,true)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FPS
-----------------------------------------------------------------------------------------------------------------------------------------
local FpsCommands = false
RegisterCommand("fps",function(source,args,rawCommand)
    if FpsCommands then
        FpsCommands = false
        ClearTimecycleModifier()
    else
        FpsCommands = true
        SetTimecycleModifier("cinema")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEDRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("+activeDrift",driftEnable)
RegisterCommand("-activeDrift",driftDisable)
RegisterKeyMapping("+activeDrift","Ativação do drift.","keyboard","LSHIFT")
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {
	{ 1239.87,-3257.2,7.09,67,62,"Caminhoneiro",0.5 },
	{ -495.24,-972.02,23.51, 80,38,"Hospital Nordestino",0.5 },
	{ 55.43,-876.19,30.66,357,38,"Garagem",0.6 },
	{ 598.04,2741.27,42.07,357,65,"Garagem",0.6 },
	{ -136.36,6357.03,31.49,357,38,"Garagem",0.6 },
	{ 275.23,-345.54,45.17,357,65,"Garagem",0.6 },
	{ 596.40,90.65,93.12,357,65,"Garagem",0.6 },
	{ -340.76,265.97,85.67,357,65,"Garagem",0.6 },
	{ -2030.01,-465.97,11.60,357,65,"Garagem",0.6 },
	{ -1184.92,-1510.00,4.64,357,65,"Garagem",0.6 },
	{ 214.02,-808.44,31.01,357,65,"Garagem",0.6 },
	{ -348.88,-874.02,31.31,357,65,"Garagem",0.6 },
	{ 67.74,12.27,69.21,357,65,"Garagem",0.6 },
	{ 361.90,297.81,103.88,357,65,"Garagem",0.6 },
	{ 1035.89,-763.89,57.99,357,65,"Garagem",0.6 },
	{ -796.63,-2022.77,9.16,357,65,"Garagem",0.6 },
	{ 453.27,-1146.76,29.52,357,65,"Garagem",0.6 },
	{ 528.66,-146.3,58.38,357,65,"Garagem",0.6 },
	{ -1159.48,-739.32,19.89,357,65,"Garagem",0.6 },
	{ 101.22,-1073.68,29.38,357,65,"Garagem",0.6 },
	{ 1725.21,4711.77,42.11,357,65,"Garagem",0.6 },
	{ 1624.05,3566.14,35.15,357,38,"Garagem",0.6 },
	{ -73.35,-2004.6,18.27,357,65,"Garagem",0.6 },
	{ -278.63,-1069.46,29.39, 60,18,"Departamento Policial",0.6 }, --DPBC
	{ 824.41,-1290.27,28.22,60,18,"Departamento Policial",0.6 }, --Core
	{ 382.98,-1591.26,29.28,60,18,"Departamento Policial",0.6 }, --DIB
	{ 29.2,-1351.89,29.34,52,36,"Loja de Departamento",0.5 },
	{ 2561.74,385.22,108.61,52,36,"Loja de Departamento",0.5 },
	{ 1160.21,-329.4,69.03,52,36,"Loja de Departamento",0.5 },
	{ -711.99,-919.96,19.01,52,36,"Loja de Departamento",0.5 },
	{ -54.56,-1758.56,29.05,52,36,"Loja de Departamento",0.5 },
	{ 375.87,320.04,103.42,52,36,"Loja de Departamento",0.5 },
	{ -3237.48,1004.72,12.45,52,36,"Loja de Departamento",0.5 },
	{ 1730.64,6409.67,35.0,52,36,"Loja de Departamento",0.5 },
	{ 543.51,2676.85,42.14,52,36,"Loja de Departamento",0.5 },
	{ 1966.53,3737.95,32.18,52,36,"Loja de Departamento",0.5 },
	{ 2684.73,3281.2,55.23,52,36,"Loja de Departamento",0.5 },
	{ 1696.12,4931.56,42.07,52,36,"Loja de Departamento",0.5 },
	{ -1820.18,785.69,137.98,52,36,"Loja de Departamento",0.5 },
	{ 1395.35,3596.6,34.86,52,36,"Loja de Departamento",0.5 },
	{ -2977.14,391.22,15.03,52,36,"Loja de Departamento",0.5 },
	{ -3034.99,590.77,7.8,52,36,"Loja de Departamento",0.5 },
	{ 1144.46,-980.74,46.19,52,36,"Loja de Departamento",0.5 },
	{ 1166.06,2698.17,37.95,52,36,"Loja de Departamento",0.5 },
	{ -1493.12,-385.55,39.87,52,36,"Loja de Departamento",0.5 },
	{ -1228.6,-899.7,12.27,52,36,"Loja de Departamento",0.5 },
	{ 157.82,6631.8,31.68,52,36,"Loja de Departamento",0.5 },
	{ 1702.78,3748.82,34.05,76,6,"Loja de Armas",0.4 },
	{ 240.06,-43.74,69.71,76,6,"Loja de Armas",0.4 },
	{ 843.95,-1020.43,27.53,76,6,"Loja de Armas",0.4 },
	{ -322.19,6072.86,31.27,76,6,"Loja de Armas",0.4 },
	{ -664.03,-949.22,21.53,76,6,"Loja de Armas",0.4 },
	{ -1318.83,-389.19,36.43,76,6,"Loja de Armas",0.4 },
	{ -1110.11,2687.5,18.62,76,6,"Loja de Armas",0.4 },
	{ 2569.23,309.46,108.46,76,6,"Loja de Armas",0.4 },
	{ -3159.91,1080.64,20.69,76,6,"Loja de Armas",0.4 },
	{ 15.42,-1120.47,28.81,76,6,"Loja de Armas",0.4 },
	{ 811.81,-2145.58,29.34,76,6,"Loja de Armas",0.4 },
	{ -815.12,-184.15,37.57,71,62,"Barbearia",0.5 },
	{ 138.13,-1706.46,29.3,71,62,"Barbearia",0.5 },
	{ -1280.92,-1117.07,7.0,71,62,"Barbearia",0.5 },
	{ 1930.54,3732.06,32.85,71,62,"Barbearia",0.5 },
	{ 1214.2,-473.18,66.21,71,62,"Barbearia",0.5 },
	{ -33.61,-154.52,57.08,71,62,"Barbearia",0.5 },
	{ -276.65,6226.76,31.7,71,62,"Barbearia",0.5 },
	{ 86.06,-1391.64,29.23,366,62,"Loja de Roupas",0.5 },
	{ -719.94,-158.18,37.0,366,62,"Loja de Roupas",0.5 },
	{ -152.79,-306.79,38.67,366,62,"Loja de Roupas",0.5 },
	{ -816.39,-1081.22,11.12,366,62,"Loja de Roupas",0.5 },
	{ -1206.51,-781.5,17.12,366,62,"Loja de Roupas",0.5 },
	{ -1458.26,-229.79,49.2,366,62,"Loja de Roupas",0.5 },
	{ -2.41,6518.29,31.48,366,62,"Loja de Roupas",0.5 },
	{ 1682.59,4819.98,42.04,366,62,"Loja de Roupas",0.5 },
	{ 129.46,-205.18,54.51,366,62,"Loja de Roupas",0.5 },
	{ 618.49,2745.54,42.01,366,62,"Loja de Roupas",0.5 },
	{ 1197.93,2698.21,37.96,366,62,"Loja de Roupas",0.5 },
	{ -3165.74,1061.29,20.84,366,62,"Loja de Roupas",0.5 },
	{ -1093.76,2703.99,19.04,366,62,"Loja de Roupas",0.5 },
	{ 414.86,-807.57,29.34,366,62,"Loja de Roupas",0.5 },
	{ -1728.06,-1050.69,1.71,266,62,"Embarcações",0.5 },
	{ 1966.36,3975.86,31.51,266,62,"Embarcações",0.5 },
	{ -776.72,-1495.02,2.29,266,62,"Embarcações",0.5 },
	{ -893.97,5687.78,3.29,266,62,"Embarcações",0.5 },
	{ 4952.76,-5163.6,-0.3,266,62,"Embarcações",0.5 },
	{ 356.42,274.61,103.14,67,62,"Transportador",0.5 },
	{ 2433.45,5013.46,46.99,285,62,"Lenhador",0.5 },
	{ -172.21,6385.85,31.49,403,5,"Farmácia",0.7 },
	{ 1690.07,3581.68,35.62,403,5,"Farmácia",0.7 },
	{ 315.12,-1068.58,29.39,403,5,"Farmácia",0.7 },
	{ 114.45,-4.89,67.82,403,5,"Farmácia",0.7 },
	{ -1216.21,-1449.41,4.36,78,11,"Mercado Central",0.5 }, 
	{ 2747.28,3473.04,55.67,78,11,"Mercado Central",0.5 },
	{ 454.73,-600.83,28.56,513,62,"Motorista",0.6 },
	{ 82.54,-1553.28,29.59,318,62,"Lixeiro",0.6 },
	{ 287.36,2843.6,44.7,318,62,"Lixeiro",0.6 },
	{ -413.97,6171.58,31.48,318,62,"Lixeiro",0.6 },
	{ -428.56,-1728.33,19.79,467,11,"Reciclagem",0.6 },
	{ 180.07,2793.29,45.65,467,11,"Reciclagem",0.6 },
	{ -195.42,6264.62,31.49,467,11,"Reciclagem",0.6 },
	{ -142.24,-1174.19,23.76,357,9,"Impound",0.6 },
	{ -222.52,-1168.18,24.13, 402,26,"Mecânica",0.7 },
	{-1440.92,-546.93,34.74,475, 31, "Hotel", 0.7}, 

	{ 2953.93,2787.49,41.5,617,62,"Minerador",0.6 },
	{ 1322.93,-1652.29,52.27,75,13,"Loja de Tatuagem",0.5 },
	{ -1154.42,-1425.9,4.95,75,13,"Loja de Tatuagem",0.5 },
	{ 322.84,180.16,103.58,75,13,"Loja de Tatuagem",0.5 },
	{ -3169.62,1075.8,20.83,75,13,"Loja de Tatuagem",0.5 },
	{ 1864.07,3747.9,33.03,75,13,"Loja de Tatuagem",0.5 },
	{ -293.57,6199.85,31.48,75,13,"Loja de Tatuagem",0.5 },
	{ 1525.07,3784.92,34.49,86,62,"Pescador",0.4 },
	{ 2057.89,5109.83,46.34,76,62,"Agricultor",0.4 },

	-- { -1228.69,-286.79,37.74,408,62,"Noodle",0.6 },
	{ -580.03,-1076.71,22.33,408,62,"CatCafé",0.6 },
	-- { 128.02,-1028.08,29.35,408,62,"Bean Machine",0.6 },
	-- { -1040.66,-1474.89,5.58,408,62,"KOI",0.6 }, 
	{ -1823.89,-1184.42,14.31,408,62,"PEARLS",0.6 },
	-- { 80.02,273.09,110.21,408,62,"ATOM",0.6 }, 

	{ 94.45,-1508.29,29.98, 225,62,"Concessionária",0.4 },
	{ 919.38,-182.83,74.02,198,62,"Taxista",0.5 },
	{ 1696.19,4785.25,42.02,198,62,"Taxista",0.5 },
	{ -680.9,5832.41,17.32,141,62,"Caçador",0.7 },
	{ -535.04,-221.34,37.64,267,5,"Prefeitura",0.6 },
	{ 918.69,50.33,80.9,617,62,"Cassino",0.6 },

	{ 1377.63,-1297.52,75.62 ,310,75,"Favela",0.5 }, 
	{ 1270.74,-126.4,87.64 ,310,75,"Favela",0.5 }, 
	{ 799.52,-293.77,69.45 ,310,75,"Favela",0.5 }, 
	{ 875.37,1035.92,283.67 ,310,75,"Favela",0.5 }, 
	{ 1346.22,-678.06,88.55 ,310,75,"Favela",0.5 }, 
	{ 3020.7,2987.64,91.87 ,310,75,"Favela",0.5 }, 
	{ 2454.82,3775.72,52.47 ,310,75,"Favela",0.5 }, 


	{ 345.02,-2708.7,1.7 ,437,81,"Org",0.5 }, 
	{ 93.92,-1291.05,29.27 ,437,81,"Org",0.5 }, 
	{ 993.0,-135.46,74.05  ,437,81,"Org",0.5 }, 
	{ 725.19,-1066.9,28.31 ,437,81,"Org",0.5 }, 
	{ -1490.11,846.09,181.6 ,437,81,"Org",0.5 }, 
	{ 736.05,-808.12,16.29 ,437,81,"Org",0.5 }, 
	{ -1023.36,-1475.76,-3.34 ,437,81,"Org",0.5 }, 
	{ -1365.56,-616.85,30.31 ,437,81,"Org",0.5 }, 
	{ -307.3,209.36,145.31 ,437,81,"Org",0.5 }, 
	{ -1561.46,-381.09,48.04 ,437,81,"Org",0.5 }, 
	

	{ -1251.74,830.75,200.65  ,375,21,"Mansão a Venda",0.5 }, 
	{ -3109.1,1561.57,39.75 ,375,21,"Mansão a Venda",0.5 }, 
	{ -3138.19,1367.02,23.39 ,375,21,"Mansão a Venda",0.5 }, 
	{ -3061.35,196.67,18.69 ,375,21,"Mansão a Venda",0.5 }, 
	{ -1985.36,-502.53,12.15  ,375,21,"Mansão a Venda",0.5 }, 
	{ 1400.23,1145.57,114.33 ,375,21,"Mansão a Venda",0.5 }, 
	{ -2593.43,1902.27,167.28 ,375,21,"Mansão a Venda",0.5 }, 
	{ -2611.29,1698.3,146.32 ,375,21,"Mansão a Venda",0.5 }, 
	{ 1175.2,860.3,144.0 ,375,21,"Mansão a Venda",0.5 }, 
	{ 3445.3,4924.66,35.2 ,375,21,"Mansão a Venda",0.5 }, 
	{ -521.84,4988.19,153.86 ,375,21,"Mansão a Venda",0.5 }, 

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()

		SetCreateRandomCops(false)
		CancelCurrentPoliceReport()
		SetCreateRandomCopsOnScenarios(false)
		SetCreateRandomCopsNotOnScenarios(false)

		SetPedInfiniteAmmoClip(PlayerPedId(),false)

		SetVehicleModelIsSuppressed(GetHashKey("jet"),true)
		SetVehicleModelIsSuppressed(GetHashKey("besra"),true)
		SetVehicleModelIsSuppressed(GetHashKey("luxor"),true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp"),true)
		SetVehicleModelIsSuppressed(GetHashKey("polmav"),true)
		SetVehicleModelIsSuppressed(GetHashKey("buzzard2"),true)
		SetVehicleModelIsSuppressed(GetHashKey("mammatus"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prismuscl_01"),true)
		SetPedModelIsSuppressed(GetHashKey("u_m_y_prisoner_01"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prisoner_01"),true)

		Wait(1000)
	end
end)
----------------------------retirar ped locais-------------------
local clearPedsAndVehicle = {
    {coords = vec3(-2291.15,367.69,174.56), radius = 1000.0}, -- CDS
}

CreateThread(function()
    while true do
        Wait(10000)

        for _,v in pairs(clearPedsAndVehicle) do
            ClearAreaOfVehicles(v.coords, v.radius)
            ClearAreaOfPeds(v.coords, v.radius, 1)
        end

    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		SetWeaponDamageModifierThisFrame("WEAPON_BAT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KATANA",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HAMMER",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_WRENCH",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_UNARMED",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_CROWBAR",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_MACHETE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_POOLCUE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KNUCKLE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KARAMBIT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_GOLFCLUB",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_BATTLEAXE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_FLASHLIGHT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_NIGHTSTICK",0.35)
		SetWeaponDamageModifierThisFrame("WEAPON_STONE_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_SMOKEGRENADE",0.0)

		RemoveAllPickupsOfType("PICKUP_WEAPON_KNIFE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PISTOL")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MINISMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MICROSMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PUMPSHOTGUN")
		RemoveAllPickupsOfType("PICKUP_WEAPON_CARBINERIFLE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_SAWNOFFSHOTGUN")

		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(10)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(19)
		HideHudComponentThisFrame(20)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)

		DisableControlAction(1,37,true)
		DisableControlAction(1,204,true)
		DisableControlAction(1,211,true)
		DisableControlAction(1,349,true)
		DisableControlAction(1,192,true)
		DisableControlAction(1,157,true)
		DisableControlAction(1,158,true)
		DisableControlAction(1,159,true)
		DisableControlAction(1,160,true)
		DisableControlAction(1,161,true)
		DisableControlAction(1,162,true)
		DisableControlAction(1,163,true)
		DisableControlAction(1,164,true)
		DisableControlAction(1,165,true)
		SetPauseMenuActive(false)

		if LocalPlayer["state"]["Route"] > 0 then
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetAmbientVehicleRangeMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0,0.0)
			SetPedDensityMultiplierThisFrame(0.0)
		else
			SetVehicleDensityMultiplierThisFrame(0.50)
			SetRandomVehicleDensityMultiplierThisFrame(0.50)
			SetParkedVehicleDensityMultiplierThisFrame(1.0)
			SetAmbientVehicleRangeMultiplierThisFrame(1.0)
			SetScenarioPedDensityMultiplierThisFrame(1.0,1.0)
			SetPedDensityMultiplierThisFrame(1.0)
		end

		if IsPedArmed(PlayerPedId(),6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		if GetPlayerWantedLevel(PlayerId()) ~= 0 then
			ClearPlayerWantedLevel(PlayerId())
		end

		SetPauseMenuActive(false)
		DisablePlayerVehicleRewards(PlayerId())

		SetWeatherTypeNow(GlobalState["Weather"])
		SetWeatherTypePersist(GlobalState["Weather"])
		SetWeatherTypeNowPersist(GlobalState["Weather"])
		NetworkOverrideClockTime(GlobalState["Hours"],GlobalState["Minutes"],00)

		Wait(0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	{ 330.19,-601.21,43.29,343.65,-581.77,28.8 },
	{ 343.65,-581.77,28.8,330.19,-601.21,43.29 },

	{ 327.16,-603.53,43.29,338.97,-583.85,74.16 },
	{ 338.97,-583.85,74.16,327.16,-603.53,43.29 },

	{ -741.07,5593.13,41.66,446.19,5568.79,781.19 },
	{ 446.19,5568.79,781.19,-741.07,5593.13,41.66 },

	{ -740.78,5597.04,41.66,446.37,5575.02,781.19 },
	{ 446.37,5575.02,781.19,-740.78,5597.04,41.66 },

	{ -1194.46,-1189.31,7.69,1173.55,-3196.68,-39.00 },
	{ 1173.55,-3196.68,-39.00,-1194.46,-1189.31,7.69 },

	{ -1007.12,-486.67,39.97,-1003.05,-477.92,50.02 },
	{ -1003.05,-477.92,50.02,-1007.12,-486.67,39.97 },

	{ -1908.09,-570.9,22.97,-1902.05,-572.42,19.09 },
	{ -1902.05,-572.42,19.09,-1908.09,-570.9,22.97 },

	{ -71.05,-801.01,44.23,-75.0,-824.54,321.29 },
	{ -75.0,-824.54,321.29,-71.05,-801.01,44.23 },

	{ -320.79,209.9,81.7, -304.02,192.22,144.37 },
	{ -304.02,192.22,144.37 , -320.79,209.9,81.77 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number = 1,#Blips do
		local Blip = AddBlipForCoord(Blips[Number][1],Blips[Number][2],Blips[Number][3])
		SetBlipSprite(Blip,Blips[Number][4])
		SetBlipDisplay(Blip,4)
		SetBlipAsShortRange(Blip,true)
		SetBlipColour(Blip,Blips[Number][5])
		SetBlipScale(Blip,Blips[Number][7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Blips[Number][6])
		EndTextCommandSetBlipName(Blip)
	end

	local Tables = {}

	for Number = 1,#Teleport do
		Tables[#Tables + 1] = { Teleport[Number][1],Teleport[Number][2],Teleport[Number][3],2.5,"E","Porta de Acesso","Pressione para acessar" }
	end

	TriggerEvent("hoverfy:Insert",Tables)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if LocalPlayer["state"]["Route"] < 900000 then
			local Ped = PlayerPedId()
			if not IsPedInAnyVehicle(Ped) then
				local Coords = GetEntityCoords(Ped)

				for Number = 1,#Teleport do
					local v = Teleport[Number]
					local Distance = #(Coords - vec3(v[1],v[2],v[3]))
					if Distance <= 1 then
						TimeDistance = 1

						if IsControlJustPressed(1,38) then
							SetEntityCoords(Ped,v[4],v[5],v[6],false,false,false,false)

							if k == 19 or k == 20 then
								local Finishing = false
								local Handle,Object = FindFirstObject()
		
								repeat
									local Coords2 = GetEntityCoords(Object)
									local Distance = #(Coords2 - Coords)
		
									if Distance < 3.0 and GetEntityModel(Object) == 961976194 then
										FreezeEntityPosition(Object,true)
									end
		
									Finishing,Object = FindNextObject(Handle)
								until not Finishing
		
								EndFindObject(Handle)
							end
						end
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_max = 80.0
local fov_min = 10.0
local speed_ud = 3.0
local zoomspeed = 2.0
local vehCamera = false
local fov = (fov_max + fov_min) * 0.5
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local waitPacket = 500
		local Ped = PlayerPedId()
		if IsPedInAnyHeli(Ped) then
			waitPacket = 4

			local veh = GetVehiclePedIsUsing(Ped)
			SetVehicleRadioEnabled(veh,false)

			if IsControlJustPressed(1,51) then
				TriggerEvent("hud:Active",false)
				vehCamera = true
			end

			if IsControlJustPressed(1,154) then
				if GetPedInVehicleSeat(veh,1) == Ped or GetPedInVehicleSeat(veh,2) == Ped then
					TaskRappelFromHeli(Ped,1)
				end
			end

			if vehCamera then
				SetTimecycleModifierStrength(0.3)
				SetTimecycleModifier("heliGunCam")

				local scaleform = RequestScaleformMovie("HELI_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Wait(1)
				end

				local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
				AttachCamToEntity(cam,veh,0.0,0.0,-1.5,true)
				SetCamRot(cam,0.0,0.0,GetEntityHeading(veh))
				SetCamFov(cam,fov)
				RenderScriptCams(true,false,0,1,0)
				PushScaleformMovieFunction(scaleform,"SET_CAM_LOGO")
				PushScaleformMovieFunctionParameterInt(0)
				PopScaleformMovieFunctionVoid()

				while vehCamera do
					if IsControlJustPressed(1,51) then
						TriggerEvent("hud:Active",true)
						vehCamera = false
					end

					local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
					CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					HideHudAndRadarThisFrame()
					HideHudComponentThisFrame(19)
					PushScaleformMovieFunction(scaleform,"SET_ALT_FOV_HEADING")
					PushScaleformMovieFunctionParameterFloat(GetEntityCoords(veh).z)
					PushScaleformMovieFunctionParameterFloat(zoomvalue)
					PushScaleformMovieFunctionParameterFloat(GetCamRot(cam,2).z)
					PopScaleformMovieFunctionVoid()
					DrawScaleformMovieFullscreen(scaleform,255,255,255,255)

					Wait(1)
				end

				ClearTimecycleModifier()
				fov = (fov_max + fov_min) * 0.5
				RenderScriptCams(false,false,0,1,0)
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				DestroyCam(cam,false)
				SetNightvision(false)
				SetSeethrough(false)
			end
		end

		Wait(waitPacket)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINPUTROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0,rotation.x + rightAxisY * -1.0 * (3.0) * (zoomvalue + 0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLEZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
function HandleZoom(cam)
	if IsControlJustPressed(1,241) then
		fov = math.max(fov - zoomspeed,fov_min)
	end

	if IsControlJustPressed(1,242) then
		fov = math.min(fov + zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov - current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov + (fov - current_fov) * 0.05)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ISLAND
-----------------------------------------------------------------------------------------------------------------------------------------
local Island = {
	"h4_islandairstrip",
	"h4_islandairstrip_props",
	"h4_islandx_mansion",
	"h4_islandx_mansion_props",
	"h4_islandx_props",
	"h4_islandxdock",
	"h4_islandxdock_props",
	"h4_islandxdock_props_2",
	"h4_islandxtower",
	"h4_islandx_maindock",
	"h4_islandx_maindock_props",
	"h4_islandx_maindock_props_2",
	"h4_IslandX_Mansion_Vault",
	"h4_islandairstrip_propsb",
	"h4_beach",
	"h4_beach_props",
	"h4_beach_bar_props",
	"h4_islandx_barrack_props",
	"h4_islandx_checkpoint",
	"h4_islandx_checkpoint_props",
	"h4_islandx_Mansion_Office",
	"h4_islandx_Mansion_LockUp_01",
	"h4_islandx_Mansion_LockUp_02",
	"h4_islandx_Mansion_LockUp_03",
	"h4_islandairstrip_hangar_props",
	"h4_IslandX_Mansion_B",
	"h4_islandairstrip_doorsclosed",
	"h4_Underwater_Gate_Closed",
	"h4_mansion_gate_closed",
	"h4_aa_guns",
	"h4_IslandX_Mansion_GuardFence",
	"h4_IslandX_Mansion_Entrance_Fence",
	"h4_IslandX_Mansion_B_Side_Fence",
	"h4_IslandX_Mansion_Lights",
	"h4_islandxcanal_props",
	"h4_beach_props_party",
	"h4_islandX_Terrain_props_06_a",
	"h4_islandX_Terrain_props_06_b",
	"h4_islandX_Terrain_props_06_c",
	"h4_islandX_Terrain_props_05_a",
	"h4_islandX_Terrain_props_05_b",
	"h4_islandX_Terrain_props_05_c",
	"h4_islandX_Terrain_props_05_d",
	"h4_islandX_Terrain_props_05_e",
	"h4_islandX_Terrain_props_05_f",
	"h4_islandx_terrain_01",
	"h4_islandx_terrain_02",
	"h4_islandx_terrain_03",
	"h4_islandx_terrain_04",
	"h4_islandx_terrain_05",
	"h4_islandx_terrain_06",
	"h4_ne_ipl_00",
	"h4_ne_ipl_01",
	"h4_ne_ipl_02",
	"h4_ne_ipl_03",
	"h4_ne_ipl_04",
	"h4_ne_ipl_05",
	"h4_ne_ipl_06",
	"h4_ne_ipl_07",
	"h4_ne_ipl_08",
	"h4_ne_ipl_09",
	"h4_nw_ipl_00",
	"h4_nw_ipl_01",
	"h4_nw_ipl_02",
	"h4_nw_ipl_03",
	"h4_nw_ipl_04",
	"h4_nw_ipl_05",
	"h4_nw_ipl_06",
	"h4_nw_ipl_07",
	"h4_nw_ipl_08",
	"h4_nw_ipl_09",
	"h4_se_ipl_00",
	"h4_se_ipl_01",
	"h4_se_ipl_02",
	"h4_se_ipl_03",
	"h4_se_ipl_04",
	"h4_se_ipl_05",
	"h4_se_ipl_06",
	"h4_se_ipl_07",
	"h4_se_ipl_08",
	"h4_se_ipl_09",
	"h4_sw_ipl_00",
	"h4_sw_ipl_01",
	"h4_sw_ipl_02",
	"h4_sw_ipl_03",
	"h4_sw_ipl_04",
	"h4_sw_ipl_05",
	"h4_sw_ipl_06",
	"h4_sw_ipl_07",
	"h4_sw_ipl_08",
	"h4_sw_ipl_09",
	"h4_islandx_mansion",
	"h4_islandxtower_veg",
	"h4_islandx_sea_mines",
	"h4_islandx",
	"h4_islandx_barrack_hatch",
	"h4_islandxdock_water_hatch",
	"h4_beach_party"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAYO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local CayoPerico = false

	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		if #(Coords - vec3(4840.57,-5174.42,2.0)) <= 2000 then
			if not CayoPerico then
				for _,v in pairs(Island) do
					RequestIpl(v)
				end

				SetIslandHopperEnabled("HeistIsland",true)
				SetAiGlobalPathNodesType(1)
				SetDeepOceanScaler(0.0)
				LoadGlobalWaterType(1)
				CayoPerico = true
			end
		else
			if CayoPerico then
				for _,v in pairs(Island) do
					RemoveIpl(v)
				end

				SetIslandHopperEnabled("HeistIsland",false)
				SetAiGlobalPathNodesType(0)
				SetDeepOceanScaler(1.0)
				LoadGlobalWaterType(0)
				CayoPerico = false
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DO NOT SHOOT CROUCHED
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Player = PlayerId()
        if Crouched then 
            DisablePlayerFiring(Player,true)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CROUCHED
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local Ped = PlayerPedId()
        DisableControlAction(0,36,true)
        if not IsPedInAnyVehicle(Ped) then
            RequestAnimSet("move_ped_crouched")
            RequestAnimSet("move_ped_crouched_strafing")
            if IsDisabledControlJustPressed(0,36) then
                if Crouched then
                    ResetPedStrafeClipset(Ped)
                    ResetPedMovementClipset(Ped,0.25)
                    Crouched = false
                else
                    SetPedStrafeClipset(Ped,"move_ped_crouched_strafing")
                    SetPedMovementClipset(Ped,"move_ped_crouched",0.25)
                    Crouched = true
                end
            end
        end
    end
end)