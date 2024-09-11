-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDS
-----------------------------------------------------------------------------------------------------------------------------------------
Discords = {
	["Connect"] = "https://discord.com/api/webhooks/1028858223400321034/zkrFQPHQs5WSVs1OiyJIFi1iAgem4KPencfrchfU_Qb9nPx9worC6eFgDxvv0tb4kJKV",
	["Disconnect"] = "https://discord.com/api/webhooks/1028858336105463929/O2rhl6B5JCVOXHZtm7W9sNYpM6MHkITbjYn1CO1_mvVQtnXSnTFK5GSL4DGiIJsJ8-vC",
	["Airport"] = "https://discord.com/api/webhooks/1028858402119635048/yVCRw0ym8jOD4EsAQFcAMuBut0VERLLg7SURinHPsuK3f7f8vFhUCW9-dTJ0eJ6B_JbQ",
	["Deaths"] = "https://discord.com/api/webhooks/1028858499339403276/5F6_vYBs5hYISZo5WlbR1EWtQ4yx0wcTvW4LgqugBx8UwIKij_hS7eQduztmUrdFhU7g",
	["Police"] = "https://discord.com/api/webhooks/1028858623645990922/WLm8PhuEpPQx7XEig3d9FEImWtfleOUjYU4h04vrfun-TLTKVs3TSAL1XmvG03-iDo9L",
	["Paramedic"] = "https://discord.com/api/webhooks/1028858623645990922/WLm8PhuEpPQx7XEig3d9FEImWtfleOUjYU4h04vrfun-TLTKVs3TSAL1XmvG03-iDo9L",
	["Gemstone"] = "https://discord.com/api/webhooks/1054831470960726146/Crwn5oAaBusYgug6Y3pgAFSac5q5fdpyNA3wkDG8JIu0X5d1MUz_rExKmxkXbTjEMp-r",
	["Login"] = "https://discord.com/api/webhooks/1050106238966440039/1SH01wOPLzna5YiYaFe3JDvBRdBX3GND-SJ_tvwCW7hsTc762-UfTCKSi7ML2WIgUB0Z"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Discord",function(Hook,Message,Color)
	PerformHttpRequest(Discords[Hook],function(err,text,headers) end,"POST",json.encode({
		username = ServerName,
		embeds = { { color = Color, description = Message } }
	}),{ ["Content-Type"] = "application/json" })
end)