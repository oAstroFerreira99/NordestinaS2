
Citizen.CreateThread(function()
    interiorID = GetInteriorAtCoords(-243.2379, 1444.801, 134.9256)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "urban_style_set")
        RefreshInterior(interiorID)
    end

    interiorID = GetInteriorAtCoords(-243.2379, 1543.576, 134.9256)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "basic_style_set")
        RefreshInterior(interiorID)
    end

    interiorID = GetInteriorAtCoords(-243.2379, 1347.361, 134.9256)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "branded_style_set")
        RefreshInterior(interiorID)
    end

    interiorID = GetInteriorAtCoords(-164.5638, 1444.801, 134.9256)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "set_plan_computer")
        EnableInteriorProp(interiorID, "set_plan_mechanic")
        DisableInteriorProp(interiorID, "set_plan_wall")
        EnableInteriorProp(interiorID, "set_plan_setup")
        EnableInteriorProp(interiorID, "set_plan_bed")
        RefreshInterior(interiorID)
    end
end)

Citizen.CreateThread(function()

	RequestIpl("gabz_mrpd_milo_")

    interiorID = GetInteriorAtCoords(451.0129, -993.3741, 29.1718)
        
    
    if IsValidInterior(interiorID) then      
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm1")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm2")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm3")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm4")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm5")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm6")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm7")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm8")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm9")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm10")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm11")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm12")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm13")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm14")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm15")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm16")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm17")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm18")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm19")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm20")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm21")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm22")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm23")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm24")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm25")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm26")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm27")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm28")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm29")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm30")
            EnableInteriorProp(interiorID, "v_gabz_mrpd_rm31")
            
    RefreshInterior(interiorID)

    end

	RequestIpl("gabz_pillbox_milo_")

	local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
  
	if IsValidInterior(interiorID) then
	  RemoveIpl("rc12b_fixed")
	  RemoveIpl("rc12b_destroyed")
	  RemoveIpl("rc12b_default")
	  RemoveIpl("rc12b_hospitalinterior_lod")
	  RemoveIpl("rc12b_hospitalinterior")
	  RefreshInterior(interiorID)
	end
	

	RequestIpl("imp_impexp_interior_placement_interior_1_impexp")
	interiorID = GetInteriorAtCoords(941.10520000,-971.67590000,39.39997000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "branded_style_set")
		EnableInteriorProp(interiorID, "car_floor_hatch")
		EnableInteriorProp(interiorID, "door_blocker")
		RefreshInterior(interiorID)
	end		

	interiorID = GetInteriorAtCoords(96.47223, 6347.784, 30.48238)
		if IsValidInterior(interiorID) then
		
			EnableInteriorProp(interiorID, "weed_hosea")
			EnableInteriorProp(interiorID, "weed_hoseb")
			EnableInteriorProp(interiorID, "weed_hosec")
			EnableInteriorProp(interiorID, "weed_hosed")
			EnableInteriorProp(interiorID, "weed_hosee")
			EnableInteriorProp(interiorID, "weed_hosef")
			EnableInteriorProp(interiorID, "weed_hoseg")
			EnableInteriorProp(interiorID, "weed_hoseh")
			EnableInteriorProp(interiorID, "weed_hosei")
			EnableInteriorProp(interiorID, "weed_growtha_stage3")
			EnableInteriorProp(interiorID, "weed_growthb_stage3")
			EnableInteriorProp(interiorID, "weed_growthc_stage3")
			EnableInteriorProp(interiorID, "weed_growthd_stage3")
			EnableInteriorProp(interiorID, "weed_growthe_stage3")
			EnableInteriorProp(interiorID, "weed_growthf_stage3")
			EnableInteriorProp(interiorID, "weed_growthg_stage3")
			EnableInteriorProp(interiorID, "weed_growthh_stage3")
			EnableInteriorProp(interiorID, "weed_growthi_stage3")
			EnableInteriorProp(interiorID, "light_growtha_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthb_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthc_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthd_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthe_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthf_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthg_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthh_stage33_upgrade")
			EnableInteriorProp(interiorID, "light_growthi_stage33_upgrade")
			EnableInteriorProp(interiorID, "weed_upgrade_equip")
			EnableInteriorProp(interiorID, "weed_drying")
			EnableInteriorProp(interiorID, "weed_security_upgrade")
			EnableInteriorProp(interiorID, "weed_production")
			EnableInteriorProp(interiorID, "weed_set_up")
			EnableInteriorProp(interiorID, "weed_chairs")
			RefreshInterior(interiorID)
			
		end
	
	interiorID = GetInteriorAtCoords(24.54136000, -1400.42700000, 29.12644000)
		if IsValidInterior(interiorID) then
			EnableInteriorProp(interiorID, "weed_upgrade_equip")
			EnableInteriorProp(interiorID, "counterfeit_security")
			EnableInteriorProp(interiorID, "counterfeit_cashpile100a")
			EnableInteriorProp(interiorID, "counterfeit_cashpile20a")
			EnableInteriorProp(interiorID, "counterfeit_cashpile10a")
			EnableInteriorProp(interiorID, "counterfeit_cashpile100b")
			EnableInteriorProp(interiorID, "counterfeit_cashpile100c")
			EnableInteriorProp(interiorID, "counterfeit_cashpile100d")
			EnableInteriorProp(interiorID, "counterfeit_cashpile20b")
			EnableInteriorProp(interiorID, "counterfeit_cashpile20c")
			EnableInteriorProp(interiorID, "counterfeit_cashpile20d")
			EnableInteriorProp(interiorID, "counterfeit_cashpile10b")
			EnableInteriorProp(interiorID, "counterfeit_cashpile10c")
			EnableInteriorProp(interiorID, "counterfeit_cashpile10d")
			EnableInteriorProp(interiorID, "counterfeit_setup")
			EnableInteriorProp(interiorID, "counterfeit_upgrade_equip")
			EnableInteriorProp(interiorID, "dryera_on")
			EnableInteriorProp(interiorID, "dryerb_on")
			EnableInteriorProp(interiorID, "dryerc_on")
			EnableInteriorProp(interiorID, "dryerd_on")
			EnableInteriorProp(interiorID, "money_cutter")
			EnableInteriorProp(interiorID, "special_chairs")
			RefreshInterior(interiorID)
		end
	
	
	interiorID = GetInteriorAtCoords(1497.75100000, 6393.09000000, 21.78359000)
		if IsValidInterior(interiorID) then
			EnableInteriorProp(interiorID, "meth_lab_upgrade")
			EnableInteriorProp(interiorID, "meth_lab_production")
			EnableInteriorProp(interiorID, "meth_lab_security_high")
			EnableInteriorProp(interiorID, "meth_lab_setup")
			EnableInteriorProp(interiorID, "counterfeit_standard_equip")
			RefreshInterior(interiorID)
		end
	
	interiorID = GetInteriorAtCoords(-1103.1722412109,4951.3447265625,234.8638)
		if IsValidInterior(interiorID) then
			EnableInteriorProp(interiorID, "coke_cut_01")
			EnableInteriorProp(interiorID, "coke_cut_02")
			EnableInteriorProp(interiorID, "coke_cut_03")
			EnableInteriorProp(interiorID, "coke_cut_04")
			EnableInteriorProp(interiorID, "coke_cut_05")
			EnableInteriorProp(interiorID, "set_up")
			EnableInteriorProp(interiorID, "security_high")
			EnableInteriorProp(interiorID, "production_upgrade")
			EnableInteriorProp(interiorID, "equipment_upgrade")
			RefreshInterior(interiorID)
		end
	end)


Citizen.CreateThread( function()
	local int_id = GetInteriorAtCoords(345.4899597168,294.95315551758,98.191421508789)

	EnableInteriorProp(int_id , "Int01_ba_security_upgrade")
	EnableInteriorProp(int_id , "Int01_ba_equipment_setup")
	DisableInteriorProp(int_id , "Int01_ba_Style01")
	DisableInteriorProp(int_id , "Int01_ba_Style02")
	EnableInteriorProp(int_id , "Int01_ba_Style03")
	DisableInteriorProp(int_id , "Int01_ba_style01_podium")
	DisableInteriorProp(int_id , "Int01_ba_style02_podium")
	EnableInteriorProp(int_id , "Int01_ba_style03_podium")
	EnableInteriorProp(int_id , "int01_ba_lights_screen")
	EnableInteriorProp(int_id , "Int01_ba_Screen")
	EnableInteriorProp(int_id , "Int01_ba_bar_content")
	DisableInteriorProp(int_id , "Int01_ba_booze_01")
	DisableInteriorProp(int_id , "Int01_ba_booze_02")
	DisableInteriorProp(int_id , "Int01_ba_booze_03")
	DisableInteriorProp(int_id , "Int01_ba_dj01")
	DisableInteriorProp(int_id , "Int01_ba_dj02")
	EnableInteriorProp(int_id , "Int01_ba_dj03")
	DisableInteriorProp(int_id , "Int01_ba_dj04")
	
	EnableInteriorProp(int_id , "DJ_01_Lights_01")
	DisableInteriorProp(int_id , "DJ_01_Lights_02")
	DisableInteriorProp(int_id , "DJ_01_Lights_03")
	DisableInteriorProp(int_id , "DJ_01_Lights_04")
	
	DisableInteriorProp(int_id , "DJ_02_Lights_01")
	EnableInteriorProp(int_id , "DJ_02_Lights_02")
	DisableInteriorProp(int_id , "DJ_02_Lights_03")
	DisableInteriorProp(int_id , "DJ_02_Lights_04")
	
	DisableInteriorProp(int_id , "DJ_03_Lights_01")
	DisableInteriorProp(int_id , "DJ_03_Lights_02")
	EnableInteriorProp(int_id , "DJ_03_Lights_03")
	DisableInteriorProp(int_id , "DJ_03_Lights_04")
	
	DisableInteriorProp(int_id , "DJ_04_Lights_01")
	DisableInteriorProp(int_id , "DJ_04_Lights_02")
	DisableInteriorProp(int_id , "DJ_04_Lights_03")
	EnableInteriorProp(int_id , "DJ_04_Lights_04")
	
	DisableInteriorProp(int_id , "light_rigs_off")
	EnableInteriorProp(int_id , "Int01_ba_lightgrid_01")
	DisableInteriorProp(int_id , "Int01_ba_Clutter")
	EnableInteriorProp(int_id , "Int01_ba_equipment_upgrade")
	EnableInteriorProp(int_id , "Int01_ba_clubname_01")
	DisableInteriorProp(int_id , "Int01_ba_clubname_02")
	DisableInteriorProp(int_id , "Int01_ba_clubname_03")
	DisableInteriorProp(int_id , "Int01_ba_clubname_04")
	DisableInteriorProp(int_id , "Int01_ba_clubname_05")
	DisableInteriorProp(int_id , "Int01_ba_clubname_06")
	DisableInteriorProp(int_id , "Int01_ba_clubname_07")
	DisableInteriorProp(int_id , "Int01_ba_clubname_08")
	DisableInteriorProp(int_id , "Int01_ba_clubname_09")
	
	EnableInteriorProp(int_id , "Int01_ba_dry_ice")
	DisableInteriorProp(int_id , "Int01_ba_deliverytruck")
	DisableInteriorProp(int_id , "Int01_ba_trophy04")
	DisableInteriorProp(int_id , "Int01_ba_trophy05")
	DisableInteriorProp(int_id , "Int01_ba_trophy07")
	DisableInteriorProp(int_id , "Int01_ba_trophy09")
	DisableInteriorProp(int_id , "Int01_ba_trophy08")
	DisableInteriorProp(int_id , "Int01_ba_trophy11")
	DisableInteriorProp(int_id , "Int01_ba_trophy10")
	DisableInteriorProp(int_id , "Int01_ba_trophy03")
	DisableInteriorProp(int_id , "Int01_ba_trophy01")
	DisableInteriorProp(int_id , "Int01_ba_trophy02")
	DisableInteriorProp(int_id , "Int01_ba_trad_lights")
	DisableInteriorProp(int_id , "Int01_ba_Worklamps")
	RefreshInterior(int_id )	
end)


Citizen.CreateThread(function()
	RemoveIpl("apa_distlodlights_large000")
	RemoveIpl("apa_distlodlights_medium000")
	RemoveIpl("apa_distlodlights_medium001")
	RemoveIpl("apa_distlodlights_medium002")
	RemoveIpl("apa_distlodlights_medium003")
	RemoveIpl("apa_distlodlights_medium004")
	RemoveIpl("apa_distlodlights_medium005")
	RemoveIpl("apa_distlodlights_medium006")
	RemoveIpl("apa_distlodlights_medium007")
	RemoveIpl("apa_distlodlights_medium008")
	RemoveIpl("apa_distlodlights_medium009")
	RemoveIpl("apa_distlodlights_medium010")
	RemoveIpl("apa_distlodlights_medium011")
	RemoveIpl("apa_distlodlights_medium012")
	RemoveIpl("apa_distlodlights_medium013")
	RemoveIpl("apa_distlodlights_medium014")
	RemoveIpl("apa_distlodlights_medium015")
	RemoveIpl("apa_distlodlights_medium016")
	RemoveIpl("apa_distlodlights_medium017")
	RemoveIpl("apa_distlodlights_medium018")
	RemoveIpl("apa_distlodlights_medium019")
	RemoveIpl("apa_distlodlights_medium020")
	RemoveIpl("apa_distlodlights_medium021")
	RemoveIpl("apa_distlodlights_medium022")
	RemoveIpl("apa_distlodlights_medium023")
	RemoveIpl("apa_distlodlights_medium024")
	RemoveIpl("apa_distlodlights_medium025")
	RemoveIpl("apa_distlodlights_medium026")
	RemoveIpl("apa_distlodlights_medium027")
	RemoveIpl("apa_distlodlights_medium028")
	RemoveIpl("apa_distlodlights_medium029")
	RemoveIpl("apa_distlodlights_medium030")
	RemoveIpl("apa_distlodlights_medium031")
	RemoveIpl("apa_distlodlights_medium032")
	RemoveIpl("apa_distlodlights_medium033")
	RemoveIpl("apa_distlodlights_medium034")
	RemoveIpl("apa_distlodlights_medium035")
	RemoveIpl("apa_distlodlights_small000")
	RemoveIpl("apa_distlodlights_small001")
	RemoveIpl("apa_distlodlights_small002")
	RemoveIpl("apa_distlodlights_small003")
	RemoveIpl("apa_distlodlights_small004")
	RemoveIpl("apa_distlodlights_small005")
	RemoveIpl("apa_distlodlights_small006")
	RemoveIpl("apa_distlodlights_small007")
	RemoveIpl("apa_distlodlights_small008")
	RemoveIpl("apa_distlodlights_small009")
	RemoveIpl("apa_distlodlights_small010")
	RemoveIpl("apa_distlodlights_small011")
	RemoveIpl("apa_distlodlights_small012")
	RemoveIpl("apa_distlodlights_small013")
	RemoveIpl("apa_distlodlights_small014")
	RemoveIpl("apa_distlodlights_small015")
	RemoveIpl("apa_distlodlights_small016")
	RemoveIpl("apa_distlodlights_small017")
	RemoveIpl("apa_distlodlights_small018")
	RemoveIpl("apa_distlodlights_small019")
	RemoveIpl("apa_distlodlights_small020")
	RemoveIpl("apa_distlodlights_small021")
	RemoveIpl("apa_distlodlights_small022")
	RemoveIpl("apa_distlodlights_small023")
	RemoveIpl("apa_distlodlights_small024")
	RemoveIpl("apa_distlodlights_small025")
	RemoveIpl("apa_distlodlights_small026")
	RemoveIpl("apa_distlodlights_small027")
	RemoveIpl("apa_distlodlights_small028")
	RemoveIpl("apa_distlodlights_small029")
	RemoveIpl("apa_distlodlights_small030")
	RemoveIpl("apa_distlodlights_small031")
	RemoveIpl("apa_distlodlights_small032")
	RemoveIpl("apa_distlodlights_small033")
	RemoveIpl("apa_distlodlights_small034")
	RemoveIpl("apa_distlodlights_small035")
	RemoveIpl("apa_distlodlights_small036")
	RemoveIpl("apa_distlodlights_small037")
	RemoveIpl("apa_distlodlights_small038")
	RemoveIpl("apa_distlodlights_small039")
	RemoveIpl("apa_distlodlights_small040")
	RemoveIpl("apa_distlodlights_small041")
	RemoveIpl("apa_distlodlights_small042")
	RemoveIpl("apa_distlodlights_small043")
	RemoveIpl("apa_distlodlights_small044")
	RemoveIpl("apa_distlodlights_small045")
	RemoveIpl("apa_distlodlights_small046")
	RemoveIpl("apa_distlodlights_small047")
	RemoveIpl("apa_distlodlights_small048")
	RemoveIpl("apa_distlodlights_small049")
	RemoveIpl("apa_distlodlights_small050")
	RemoveIpl("apa_distlodlights_small051")
	RemoveIpl("apa_distlodlights_small052")
	RemoveIpl("apa_distlodlights_small053")
	RemoveIpl("apa_distlodlights_small054")
	RemoveIpl("apa_distlodlights_small055")
	RemoveIpl("apa_distlodlights_small056")
	RemoveIpl("apa_distlodlights_small057")
	RemoveIpl("apa_distlodlights_small058")
	RemoveIpl("apa_distlodlights_small059")
	RemoveIpl("apa_distlodlights_small060")
	RemoveIpl("apa_distlodlights_small061")
	RemoveIpl("apa_distlodlights_small062")
	RemoveIpl("apa_lodlights_large000")
	RemoveIpl("apa_lodlights_medium000")
	RemoveIpl("apa_lodlights_medium001")
	RemoveIpl("apa_lodlights_medium002")
	RemoveIpl("apa_lodlights_medium003")
	RemoveIpl("apa_lodlights_medium004")
	RemoveIpl("apa_lodlights_medium005")
	RemoveIpl("apa_lodlights_medium006")
	RemoveIpl("apa_lodlights_medium007")
	RemoveIpl("apa_lodlights_medium008")
	RemoveIpl("apa_lodlights_medium009")
	RemoveIpl("apa_lodlights_medium010")
	RemoveIpl("apa_lodlights_medium011")
	RemoveIpl("apa_lodlights_medium012")
	RemoveIpl("apa_lodlights_medium013")
	RemoveIpl("apa_lodlights_medium014")
	RemoveIpl("apa_lodlights_medium015")
	RemoveIpl("apa_lodlights_medium016")
	RemoveIpl("apa_lodlights_medium017")
	RemoveIpl("apa_lodlights_medium018")
	RemoveIpl("apa_lodlights_medium019")
	RemoveIpl("apa_lodlights_medium020")
	RemoveIpl("apa_lodlights_medium021")
	RemoveIpl("apa_lodlights_medium022")
	RemoveIpl("apa_lodlights_medium023")
	RemoveIpl("apa_lodlights_medium024")
	RemoveIpl("apa_lodlights_medium025")
	RemoveIpl("apa_lodlights_medium026")
	RemoveIpl("apa_lodlights_medium027")
	RemoveIpl("apa_lodlights_medium028")
	RemoveIpl("apa_lodlights_medium029")
	RemoveIpl("apa_lodlights_medium030")
	RemoveIpl("apa_lodlights_medium031")
	RemoveIpl("apa_lodlights_medium032")
	RemoveIpl("apa_lodlights_medium033")
	RemoveIpl("apa_lodlights_medium034")
	RemoveIpl("apa_lodlights_medium035")
	RemoveIpl("apa_lodlights_small000")
	RemoveIpl("apa_lodlights_small001")
	RemoveIpl("apa_lodlights_small002")
	RemoveIpl("apa_lodlights_small003")
	RemoveIpl("apa_lodlights_small004")
	RemoveIpl("apa_lodlights_small005")
	RemoveIpl("apa_lodlights_small006")
	RemoveIpl("apa_lodlights_small007")
	RemoveIpl("apa_lodlights_small008")
	RemoveIpl("apa_lodlights_small009")
	RemoveIpl("apa_lodlights_small010")
	RemoveIpl("apa_lodlights_small011")
	RemoveIpl("apa_lodlights_small012")
	RemoveIpl("apa_lodlights_small013")
	RemoveIpl("apa_lodlights_small014")
	RemoveIpl("apa_lodlights_small015")
	RemoveIpl("apa_lodlights_small016")
	RemoveIpl("apa_lodlights_small017")
	RemoveIpl("apa_lodlights_small018")
	RemoveIpl("apa_lodlights_small019")
	RemoveIpl("apa_lodlights_small020")
	RemoveIpl("apa_lodlights_small021")
	RemoveIpl("apa_lodlights_small022")
	RemoveIpl("apa_lodlights_small023")
	RemoveIpl("apa_lodlights_small024")
	RemoveIpl("apa_lodlights_small025")
	RemoveIpl("apa_lodlights_small026")
	RemoveIpl("apa_lodlights_small027")
	RemoveIpl("apa_lodlights_small028")
	RemoveIpl("apa_lodlights_small029")
	RemoveIpl("apa_lodlights_small030")
	RemoveIpl("apa_lodlights_small031")
	RemoveIpl("apa_lodlights_small032")
	RemoveIpl("apa_lodlights_small033")
	RemoveIpl("apa_lodlights_small034")
	RemoveIpl("apa_lodlights_small035")
	RemoveIpl("apa_lodlights_small036")
	RemoveIpl("apa_lodlights_small037")
	RemoveIpl("apa_lodlights_small038")
	RemoveIpl("apa_lodlights_small039")
	RemoveIpl("apa_lodlights_small040")
	RemoveIpl("apa_lodlights_small041")
	RemoveIpl("apa_lodlights_small042")
	RemoveIpl("apa_lodlights_small043")
	RemoveIpl("apa_lodlights_small044")
	RemoveIpl("apa_lodlights_small045")
	RemoveIpl("apa_lodlights_small046")
	RemoveIpl("apa_lodlights_small047")
	RemoveIpl("apa_lodlights_small048")
	RemoveIpl("apa_lodlights_small049")
	RemoveIpl("apa_lodlights_small050")
	RemoveIpl("apa_lodlights_small051")
	RemoveIpl("apa_lodlights_small052")
	RemoveIpl("apa_lodlights_small053")
	RemoveIpl("apa_lodlights_small054")
	RemoveIpl("apa_lodlights_small055")
	RemoveIpl("apa_lodlights_small056")
	RemoveIpl("apa_lodlights_small057")
	RemoveIpl("apa_lodlights_small058")
	RemoveIpl("apa_lodlights_small059")
	RemoveIpl("apa_lodlights_small060")
	RemoveIpl("apa_lodlights_small061")
	RemoveIpl("apa_lodlights_small062")
end)





Citizen.CreateThread(function()
	function EnableIpl(ipl, activate)
		if type(ipl) == 'table' then
			for key, value in pairs(ipl) do
				EnableIpl(value, activate)
			end
		else
			if activate then
				if not IsIplActive(ipl) then RequestIpl(ipl) end
			else
				if IsIplActive(ipl) then RemoveIpl(ipl) end
			end
		end
	end
	
    Wait(1000)

    --EnableIpl({'farm_burnt', 'farm_burnt_lod', 'farm_burnt_props'}, false)
    EnableIpl({'farm', 'farmint', 'farm_lod', 'farm_props', 'des_farmhouse'}, true)
end)

Citizen.CreateThread(function()
	ConfigP = {}

	ConfigP.Bar = false
	ConfigP.Arcade = true

	ConfigP.EstruturaTijolo = false -- http://prnt.sc/wh99hk
	ConfigP.EstruturaAzul = true -- https://prnt.sc/wh98va
	ConfigP.TetoRefletivo = true -- https://prnt.sc/wjveb5
	ConfigP.Tema1 = false -- https://prnt.sc/wh9a7r
	ConfigP.Tema2 = false -- https://prnt.sc/wh9a83
	ConfigP.Tema3 = false -- https://prnt.sc/wh9a8o
	ConfigP.Tema4 = false -- https://prnt.sc/wh9a97
	ConfigP.Tema5 = true -- https://prnt.sc/wh9a9s
	ConfigP.Tema6 = false -- https://prnt.sc/wh9aa8
	ConfigP.Tema7 = false -- https://prnt.sc/wh9aav
	ConfigP.Tema8 = false -- http://prnt.sc/wh9abd
	ConfigP.Chao1 = false -- https://prnt.sc/wjvh18
	ConfigP.Chao2 = false -- https://prnt.sc/wjvi54
	ConfigP.Chao3 = false -- https://prnt.sc/wjvpt5
	ConfigP.Chao4 = false -- https://prnt.sc/wjvqt9
	ConfigP.Chao5 = true -- https://prnt.sc/wjvrw7
	ConfigP.Chao6 = false -- https://prnt.sc/wjvsx6
	ConfigP.Chao7 = false -- https://prnt.sc/wjvtw0
	ConfigP.Chao8 = false -- https://prnt.sc/wjvv7i
	ConfigP.PropsArcade1 = true -- https://prnt.sc/wjvfh2
	ConfigP.PropsArcade2 = false -- https://prnt.sc/wjvgiq

	ConfigB = {}
	ConfigB.Parede = false -- -- https://prnt.sc/wjvy46
	ConfigB.Sujeira = false -- https://prnt.sc/wjwhzi
	ConfigB.LuzesPrincipal = true -- https://prnt.sc/wjvwze
	ConfigB.LuzesSecundaria = true -- https://prnt.sc/wjvwcv
	ConfigB.Cama = true -- https://prnt.sc/wjvyzq
	ConfigB.Monitores = true -- https://prnt.sc/wjvypz

	ConfigB.Dinheiro = true -- Definição para gangues de lavagem de dinheiro.
	ConfigB.Armas = false -- Definição para gangues de fabricação de armas.
	
	RequestIpl("maiquel_arcade_p")
	RequestIpl("maiquel_arcade_b")
	
	
		interiorID = GetInteriorAtCoords(900.346, -2117.17, 32.8)
		
		if IsValidInterior(interiorID) then
			EnableInteriorProp(interiorID, "maiquel_mecrise_mesas")
			SetInteriorPropColor(interiorID, "maiquel_mecrise_mesas", 1)
			EnableInteriorProp(interiorID, "maiquel_mecrise_postlift")
			SetInteriorPropColor(interiorID, "maiquel_mecrise_postlift", 1)
			EnableInteriorProp(interiorID, "maiquel_mecrise_balancer")
			EnableInteriorProp(interiorID, "maiquel_mecrise_extras")
			RefreshInterior(interiorID)
		end

		RequestIpl("maiquel_arcade_p") 
		RequestIpl("maiquel_arcade_b") 
		interiorID = GetInteriorAtCoords(-602.6961, 290.1386, 80.148)	 
		if IsValidInterior(interiorID) then 
			if ConfigP.Arcade and not ConfigP.Bar then 
				EnableInteriorProp(interiorID, "entity_set_arcade_set_streetx4") 
				EnableInteriorProp(interiorID, "maiquel_entity_set_arcades_full") 
				EnableInteriorProp(interiorID, "entity_set_constant_geometry") 
				EnableInteriorProp(interiorID, "entity_set_big_screen") 
			end 
			if ConfigP.Bar and not ConfigP.Arcade then 
				EnableInteriorProp(interiorID, "entity_set_hip_light_no_neon") 
				EnableInteriorProp(interiorID, "maiquel_entity_set_bar") 
				EnableInteriorProp(interiorID, "entity_set_constant_geometry") 
			end 
			if ConfigP.EstruturaTijolo then 
				EnableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_beams") 
			end 
			if ConfigP.EstruturaAzul then
				EnableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_flat") 
			end 
			if ConfigP.TetoRefletivo then 
				EnableInteriorProp(interiorID, "entity_set_arcade_set_ceiling_mirror") 
			end
			if ConfigP.Tema1 then 
				EnableInteriorProp(interiorID, "maiquel_mural_neon_option_01")
				EnableInteriorProp(interiorID, "entity_set_mural_option_01") 
			end 
			if ConfigP.Tema2 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_02") EnableInteriorProp(interiorID, "entity_set_mural_option_02") end if ConfigP.Tema3 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_03") EnableInteriorProp(interiorID, "entity_set_mural_option_03") end if ConfigP.Tema4 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_04") EnableInteriorProp(interiorID, "entity_set_mural_option_04") end if ConfigP.Tema5 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_05") EnableInteriorProp(interiorID, "entity_set_mural_option_05") end if ConfigP.Tema6 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_06") EnableInteriorProp(interiorID, "entity_set_mural_option_06") end if ConfigP.Tema7 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_07") EnableInteriorProp(interiorID, "entity_set_mural_option_07") end if ConfigP.Tema8 then EnableInteriorProp(interiorID, "maiquel_mural_neon_option_08") EnableInteriorProp(interiorID, "entity_set_mural_option_08") end if ConfigP.Chao1 then EnableInteriorProp(interiorID, "entity_set_floor_option_01") end if ConfigP.Chao2 then EnableInteriorProp(interiorID, "entity_set_floor_option_02") end if ConfigP.Chao3 then EnableInteriorProp(interiorID, "entity_set_floor_option_03") end if ConfigP.Chao4 then EnableInteriorProp(interiorID, "entity_set_floor_option_04") end if ConfigP.Chao5 then EnableInteriorProp(interiorID, "entity_set_floor_option_05") end if ConfigP.Chao6 then EnableInteriorProp(interiorID, "entity_set_floor_option_06") end if ConfigP.Chao7 then EnableInteriorProp(interiorID, "entity_set_floor_option_07") end if ConfigP.Chao8 then EnableInteriorProp(interiorID, "entity_set_floor_option_08") end if ConfigP.PropsArcade1 then EnableInteriorProp(interiorID, "maiquel_arcade_set1") end if ConfigP.PropsArcade2 then EnableInteriorProp(interiorID, "maiquel_arcade_set2") end RefreshInterior(interiorID) end interiorID = GetInteriorAtCoords(-625.731, 297.014, 73.687)	 if IsValidInterior(interiorID) then if ConfigB.Parede and not ConfigB.LuzesSecundaria then EnableInteriorProp(interiorID, "set_plan_wall") end if ConfigB.Sujeira and not ConfigB.Monitores then EnableInteriorProp(interiorID, "set_plan_pre_setup") EnableInteriorProp(interiorID, "set_plan_no_bed") end if ConfigB.LuzesSecundaria and not ConfigB.Parede then EnableInteriorProp(interiorID, "set_plan_garage") end if ConfigB.LuzesPrincipal then EnableInteriorProp(interiorID, "set_plan_setup") end if ConfigB.Cama and not ConfigB.Sujeira then EnableInteriorProp(interiorID, "set_plan_bed") end if ConfigB.Monitores and not ConfigB.Sujeira then EnableInteriorProp(interiorID, "set_plan_computer") end if ConfigB.Dinheiro then EnableInteriorProp(interiorID, "maiquel_entity_0xlm8z") end if ConfigB.Armas then EnableInteriorProp(interiorID, "maiquel_entity_m01dcf") end RefreshInterior(interiorID) end
end)