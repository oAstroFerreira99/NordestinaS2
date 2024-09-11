-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Offset = 0
local Default = 1920 / 1080
local ResolutionX, ResolutionY = GetActiveScreenResolution()
local AspectRatio = ResolutionX / ResolutionY
local AspectDiff = Default - AspectRatio
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	if LoadTexture("circleminimap") then
		SetMinimapClipType(1)
		UpdatePosition()
	end

	while true do
		local ActualX, ActualY = GetActiveScreenResolution()
		if ResolutionX ~= ActualX or ResolutionY ~= ActualY then
			UpdatePosition()
		end

		Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
-- function UpdatePosition()
-- ResolutionX,ResolutionY = GetActiveScreenResolution()
-- AspectRatio = ResolutionX / ResolutionY

-- if AspectRatio > Default then
-- 	AspectDiff = Default - AspectRatio
-- 	Offset = AspectDiff / 3.6
-- end

-- AddReplaceTexture("platform:/textures/graphics","radarmasksm","circleminimap","radarmasksm")

-- SetMinimapComponentPosition("minimap","L","B",-0.0045 + Offset,-0.035,0.175,0.225)
-- SetMinimapComponentPosition("minimap_mask","L","B",0.020 + Offset,0.105,0.110,0.150)
-- SetMinimapComponentPosition("minimap_blur","L","B",-0.02 + Offset,-0.01,0.265,0.225)

-- SetBigmapActive(true,false)

-- repeat
-- 	Wait(100)
-- 	SetBigmapActive(false,false)
-- until not IsBigmapActive()
-- end

function UpdatePosition()
	DisplayRadar(false)

	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end

	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

	SetMinimapClipType(1)

	SetMinimapComponentPosition("minimap", "L", "B", 0.0, 0.0, 0.158, 0.28)
	SetMinimapComponentPosition("minimap_mask", "L", "B", 0.155, 0.12, 0.080, 0.164)
	SetMinimapComponentPosition("minimap_blur", "L", "B", -0.005, 0.021, 0.240, 0.302)

	Citizen.Wait(5000)

	SetBigmapActive(true, false)

	Citizen.Wait(100)

	SetBigmapActive(false, false)
end

CreateThread(function()
	DisplayRadar(false)

	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end

	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

	SetMinimapClipType(1)

	SetMinimapComponentPosition("minimap", "L", "B", 0.0, 0.0, 0.158, 0.28)
	SetMinimapComponentPosition("minimap_mask", "L", "B", 0.155, 0.12, 0.080, 0.164)
	SetMinimapComponentPosition("minimap_blur", "L", "B", -0.005, 0.021, 0.240, 0.302)

	Citizen.Wait(5000)

	SetBigmapActive(true, false)

	Citizen.Wait(100)

	SetBigmapActive(false, false)
end)
