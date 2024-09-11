CreateThread(function()
	interiorID = GetInteriorAtCoords(472.70100000,-1884.19800000,18.23000000)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "light_stock")
		EnableInteriorProp(interiorID, "uj_wrench_mecanica")
        RefreshInterior(interiorID)
    end

	interiorID = GetInteriorAtCoords(-490.27800000,-1717.44400000,11.58800000)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "light_stock")
		EnableInteriorProp(interiorID, "uj_wrench_mecanica")
        RefreshInterior(interiorID)
    end
end)

Citizen.CreateThread(function()
	RequestIpl("tunergarage_milo_")
    interiorID = GetInteriorAtCoords(920.42030000,-1051.85900000,31.76569000)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "entity_set_bedroom") 
        EnableInteriorProp(interiorID, "entity_set_bombs") 
        EnableInteriorProp(interiorID, "entity_set_cabinets") 
        EnableInteriorProp(interiorID, "entity_set_car_lift_default") 
        EnableInteriorProp(interiorID, "entity_set_car_lift_purchase") 
        EnableInteriorProp(interiorID, "entity_set_chalkboard") 
        EnableInteriorProp(interiorID, "entity_set_container") 
        EnableInteriorProp(interiorID, "entity_set_cut_seats") 
        EnableInteriorProp(interiorID, "entity_set_def_table") 
        EnableInteriorProp(interiorID, "entity_set_drive") 
        EnableInteriorProp(interiorID, "entity_set_ecu") 
        EnableInteriorProp(interiorID, "entity_set_IAA") 
        EnableInteriorProp(interiorID, "entity_set_laptop") 
        EnableInteriorProp(interiorID, "entity_set_lightbox") 
        EnableInteriorProp(interiorID, "entity_set_methLab") 
        EnableInteriorProp(interiorID, "entity_set_plate") 
        EnableInteriorProp(interiorID, "entity_set_scope") 
        EnableInteriorProp(interiorID, "entity_set_style_3") 
        EnableInteriorProp(interiorID, "entity_set_thermal") 
        EnableInteriorProp(interiorID, "entity_set_tints") 
        EnableInteriorProp(interiorID, "entity_set_train") 
        EnableInteriorProp(interiorID, "entity_set_virus") 
        RefreshInterior(interiorID)
    end
end)

Citizen.CreateThread(function()
    interiorID = GetInteriorAtCoords(162.34300000,325.16670000,103.75600000)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "maiquel_mc_basic")
        EnableInteriorProp(interiorID, "maiquel_bannercustom2")
        EnableInteriorProp(interiorID, "maiquel_mc_decoration")
        EnableInteriorProp(interiorID, "maiquel_mc_capsules")
        EnableInteriorProp(interiorID, "maiquel_mc_weapon")
        SetInteriorPropColor(interiorID, "maiquel_mc_basic", 2)
        RefreshInterior(interiorID)
    end

    interiorID = GetInteriorAtCoords(29.66931000,-2667.78800000,-2.70157800)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "maiquel_mc_basic")
        EnableInteriorProp(interiorID, "maiquel_bannercustom2")
        EnableInteriorProp(interiorID, "maiquel_mc_decoration")
        EnableInteriorProp(interiorID, "maiquel_mc_capsules")
        EnableInteriorProp(interiorID, "maiquel_mc_weapon")
        SetInteriorPropColor(interiorID, "maiquel_mc_basic", 2)
        RefreshInterior(interiorID)
    end
end)

Citizen.CreateThread(function()

	RequestIpl("maiquel_arcade_p")
	RequestIpl("maiquel_arcade_b")
	interiorID = GetInteriorAtCoords(-602.6961, 290.1386, 80.148)
	if IsValidInterior(interiorID) then
		if ConfigP.Arcade then
			EnableInteriorProp(interiorID, "entity_set_arcade_set_streetx4")
			EnableInteriorProp(interiorID, "maiquel_entity_set_arcades_full")
			EnableInteriorProp(interiorID, "entity_set_constant_geometry")
			EnableInteriorProp(interiorID, "entity_set_big_screen")

			DisableInteriorProp(interiorID, "entity_set_hip_light_no_neon")
			DisableInteriorProp(interiorID, "maiquel_entity_set_bar")
		end

		if ConfigP.Bar then
			EnableInteriorProp(interiorID, "entity_set_big_screen")
			EnableInteriorProp(interiorID, "entity_set_hip_light_no_neon")
			EnableInteriorProp(interiorID, "maiquel_entity_set_bar")
			EnableInteriorProp(interiorID, "entity_set_constant_geometry")

			DisableInteriorProp(interiorID, "entity_set_arcade_set_streetx4")
			DisableInteriorProp(interiorID, "maiquel_entity_set_arcades_full")
		end
		if ConfigP.StructureBrick then
			EnableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_beams")
			
			DisableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_flat")
			DisableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_mirror")
		end
		if ConfigP.StructureBlue then
			EnableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_flat")
			DisableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_beams")
		end
		if ConfigP.Reflective then
			EnableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_mirror")
		end
		if ConfigP.Theme1 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_01")
			EnableInteriorProp(interiorID, "entity_set_mural_option_01")
			EnableInteriorProp(interiorID, "entity_set_floor_option_01")
		end
		if ConfigP.Theme2 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_02")
			EnableInteriorProp(interiorID, "entity_set_mural_option_02")
			EnableInteriorProp(interiorID, "entity_set_floor_option_02")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_01")
			DisableInteriorProp(interiorID, "entity_set_mural_option_01")
			DisableInteriorProp(interiorID, "entity_set_floor_option_01")
		end
		if ConfigP.Theme3 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_03")
			EnableInteriorProp(interiorID, "entity_set_mural_option_03")
			EnableInteriorProp(interiorID, "entity_set_floor_option_03")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_02")
			DisableInteriorProp(interiorID, "entity_set_mural_option_02")
			DisableInteriorProp(interiorID, "entity_set_floor_option_02")
		end
		if ConfigP.Theme4 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_04")
			EnableInteriorProp(interiorID, "entity_set_mural_option_04")
			EnableInteriorProp(interiorID, "entity_set_floor_option_04")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_03")
			DisableInteriorProp(interiorID, "entity_set_mural_option_03")
			DisableInteriorProp(interiorID, "entity_set_floor_option_03")
		end
		if ConfigP.Theme5 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_05")
			EnableInteriorProp(interiorID, "entity_set_mural_option_05")
			EnableInteriorProp(interiorID, "entity_set_floor_option_05")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_04")
			DisableInteriorProp(interiorID, "entity_set_mural_option_04")
			DisableInteriorProp(interiorID, "entity_set_floor_option_04")
		end
		if ConfigP.Theme6 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_06")
			EnableInteriorProp(interiorID, "entity_set_mural_option_06")
			EnableInteriorProp(interiorID, "entity_set_floor_option_06")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_05")
			DisableInteriorProp(interiorID, "entity_set_mural_option_05")
			DisableInteriorProp(interiorID, "entity_set_floor_option_05")
		end
		if ConfigP.Theme7 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_07")
			EnableInteriorProp(interiorID, "entity_set_mural_option_07")
			EnableInteriorProp(interiorID, "entity_set_floor_option_07")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_06")
			DisableInteriorProp(interiorID, "entity_set_mural_option_06")
			DisableInteriorProp(interiorID, "entity_set_floor_option_06")
		end
		if ConfigP.Theme8 then
			EnableInteriorProp(interiorID, "maiquel_mural_neon_option_08")
			EnableInteriorProp(interiorID, "entity_set_mural_option_08")
			EnableInteriorProp(interiorID, "entity_set_floor_option_08")

			DisableInteriorProp(interiorID, "maiquel_mural_neon_option_07")
			DisableInteriorProp(interiorID, "entity_set_mural_option_07")
			DisableInteriorProp(interiorID, "entity_set_floor_option_07")
		end
		if ConfigP.PropsArcade1 then
			EnableInteriorProp(interiorID, "maiquel_arcade_set1")
		end
		if ConfigP.PropsArcade2 then
			EnableInteriorProp(interiorID, "maiquel_arcade_set2")

			DisableInteriorProp(interiorID, "maiquel_arcade_set1")
		end
		RefreshInterior(interiorID)
	end
	
	interiorID = GetInteriorAtCoords(-625.731, 297.014, 73.687)
	if IsValidInterior(interiorID) then
		if ConfigB.Wall then
			EnableInteriorProp(interiorID, "set_plan_wall")
		end
		if ConfigB.LightsSecondary then
			EnableInteriorProp(interiorID, "set_plan_garage")
		end
		if ConfigB.LightsPrincipal then
			EnableInteriorProp(interiorID, "set_plan_setup")
		end
		if ConfigB.Bed then
			EnableInteriorProp(interiorID, "set_plan_bed")
		end
		if ConfigB.Monitors then
			EnableInteriorProp(interiorID, "set_plan_computer")
		end
		if ConfigB.Cash then
			EnableInteriorProp(interiorID, "maiquel_entity_0xlm8z")
		end
		if ConfigB.Weapon then
			EnableInteriorProp(interiorID, "maiquel_entity_m01dcf")

			DisableInteriorProp(interiorID, "maiquel_entity_0xlm8z")
		end
		RefreshInterior(interiorID)
	end
end)