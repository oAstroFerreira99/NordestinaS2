MenuOptions = {
    {
        id = "clothes",
        title = "Roupas",
        icon = "icon linear slider-horizontal-1",
        items = {
            {
                id = "clothes-apply",
                title = "Aplicar",
                icon = "icon linear save-2",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "aplicar" }
            },
            {
                id = "clothes-save",
                title = "Salvar",
                icon = "icon linear add",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "salvar" }
            },
            {
                id = "clothes-remove",
                title = "Remover",
                icon = "icon linear save-remove",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "remover" }
            }
        },
    },
    {
        id = "premiumfit",
        title = "Roupas Premium",
        icon = "icon linear slider-horizontal",
        items = {
            {
                id = "premiumfit-apply",
                title = "[VIP2] Aplicar",
                icon = "icon linear save-add",
                server = true,
                trigger = "player:OutfitVIP2",
                triggerArgs = { "preaplicar" }
            },
            {
                id = "premiumfit-save",
                title = "[VIP2] Salvar",
                icon = "icon linear save-2",
                server = true,
                trigger = "player:OutfitVIP2",
                triggerArgs = { "presalvar" }

            },
            {
                id = "premiumfit-apply",
                title = "[VIP3] Aplicar",
                icon = "icon linear save-add",
                server = true,
                trigger = "player:OutfitVIP3",
                triggerArgs = { "preaplicar" }
            },
            {
                id = "premiumfit-save",
                title = "[VIP3] Salvar",
                icon = "icon linear save-2",
                server = true,
                trigger = "player:OutfitVIP3",
                triggerArgs = { "presalvar" }
            }
        }
    },
    {
        id = "remclothes",
        title = "Remover Roupas",
        icon = "icon linear save-remove",
        items = {
            {
                id = "camisa-remove",
                title = "Remover Camisa",
                icon = "icon linear save-remove",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "Shirt" }
            },
            {
                id = "chapeu-remove",
                title = "Remover Chapéu",
                icon = "icon linear save-remove",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "Hat" }
            },
            {
                id = "mascara-remove",
                title = "Remover Máscara",
                icon = "icon linear save-remove",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "Mask" }
            },
            {
                id = "oculos-remove",
                title = "Remover Óculos",
                icon = "icon linear save-remove",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "Glasses" }
            },
            {
                id = "luvas-remove",
                title = "Remover Luvas",
                icon = "icon linear save-remove",
                server = true,
                trigger = "player:Outfit",
                triggerArgs = { "Arms" }
            }
        }
    },
    {
        id = "animal",
        title = "Domésticos",
        icon = "icon linear pet",
        enableMenu = function()
            return HasAnimal()
        end,
        items = {
            {
                id = "animal-follow",
                title = "Seguir",
                icon = "icon linear pet",
                server = false,
                trigger = "dynamic:animalFunctions",
                triggerArgs = { "seguir" }
            },
            {
                id = "animal-putInVehicle",
                title = "Colocar no Veículo",
                icon = "icon linear car",
                server = false,
                trigger = "dynamic:animalFunctions",
                triggerArgs = { "colocar" }
            },
            {
                id = "animal-removeOfVehicle",
                title = "Remover do Veículo",
                icon = "icon linear car",
                server = false,
                trigger = "dynamic:animalFunctions",
                triggerArgs = { "remover" }
       
            }
        }
    },
    {
        id = "vehicle",
        title = "Veículo",
        icon = "icon linear car", -- TODO
        enableMenu = function(playerPed)
            return IsPedInAnyVehicle(playerPed, false)
        end,
        items = {
            {
                id = "vehicle-seat-0",
                title = "Dianteiro Esquerdo",
                server = false,
                trigger = "player:seatPlayer",
                triggerArgs = { "0" }
            },
            {
                id = "vehicle-seat-1",
                title = "Dianteiro Direito",
                server = false,
                trigger = "player:seatPlayer",
                triggerArgs = { "1" }
            },
            {
                id = "vehicle-seat-2",
                title = "Traseiro Esquerdo",
                server = false,
                trigger = "player:seatPlayer",
                triggerArgs = { "2" }
            },
            {
                id = "vehicle-seat-3",
                title = "Traseiro Direito",
                server = false,
                trigger = "player:seatPlayer",
                triggerArgs = { "3" }
            },
            {
                id = "vehicle-wins-up",
                title = "Levantar Vidros",
                server = true,
                trigger = "player:winsFunctions",
                triggerArgs = { "1" }
            },
            {
                id = "vehicle-wins-down",
                title = "Abaixar Vidros",
                server = true,
                trigger = "player:winsFunctions",
                triggerArgs = { "0" }
            },
        }
    },
    {
        id = "others",
        title = "Outros",
        icon = "icon linear more",
        items = {
            {
                id = "others-wounds",
                title = "Ferimentos",
                icon = "icon linear health",
                server = false,
                trigger = "paramedic:Injuries",
            },
            {
                id = "others-debug",
                title = "Recarregar o personagem",
                icon = "icon linear user",
                server = true,
                trigger = "barbershop:debug",
            },
            {
                id = "others-vehicle-tow",
                title = "Rebocar",
                icon = "icon linear truck-tick",
                server = false,
                trigger = "towdriver:invokeTow",
                enableMenu = function(playerPed)
                    return not IsPedInAnyVehicle(playerPed, false)
                end,
            },
        }
    },
    {
        id = "others-players",
        title = "Jogador",
        icon = "icon linear user",
        items = {
            {
                id = "others-players-cv",
                title = "Colocar no Veículo",
                icon = "icon linear car",
                server = true,
                trigger = "player:cvFunctions",
                triggerArgs = { "cv" }
            },
            {
                id = "others-players-rv",
                title = "Remover do Veículo",
                icon = "icon linear car",
                server = true,
                trigger = "player:cvFunctions",
                triggerArgs = { "rv" }
            },
        }
    },          
}
