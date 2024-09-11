-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
	 -- Groups
	 ["Emergency"] = {
		["Parent"] = {
			["Policia"] = true,
			["Hospital"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
	["Restaurants"] = {
		["Parent"] = {
			["Pearls"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
    -- Framework
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { "Administrador","Moderador","Suporte" },
		["Service"] = {}
	},
	["Premium"] = {
		["Parent"] = {
			["Premium"] = true
		},
		["Hierarchy"] = { "Platina","Ouro","Prata","Bronze" },
		["Salary"] = { 2500,2250,2000,1750 },
		["Service"] = {}
	},
	["Creators"] = {
		["Parent"] = {
			["Creators"] = true
		},
		["Hierarchy"] = { "Platina","Ouro","Prata","Bronze" },
		["Salary"] = { 1500,2250,2000,1750 },
		["Service"] = {}
	},
    -- Public
	["Policia"] = {
		["Parent"] = {
			["Policia"] = true
		},
		["Hierarchy"] = { "Chefe","Capitão","Tenente","Sargento","Corporal","Oficial","Cadete" },
		["Salary"] = { 10000,8000,5000,4000,3000,2500,2000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Hospital"] = {
		["Parent"] = {
			["Hospital"] = true
		},
		["Hierarchy"] = { "Diretor","ViceDiretor","Medico","Paramedico","Enfermeiro" },
		["Salary"] = { 7500,5500,4500,3500,1500 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Harmony"] = {
		["Parent"] = {
			["Harmony"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Mecanica"] = {
		["Parent"] = {
			["Mecanico"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Bennys"] = {
		["Parent"] = {
			["Bennys"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------- Restaurantes -------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
	["Pearls"] = {
		["Parent"] = {
			["Pearls"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Pokecafe"] = {
		["Parent"] = {
			["Pokecafe"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------- ILEGAL -------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

		
	["Org1"] = {
		["Parent"] = {
			["Org1"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org2"] = {
		["Parent"] = {
			["Org2"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org3"] = {
		["Parent"] = {
			["Org3"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org4"] = {
		["Parent"] = {
			["Org4"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org5"] = {
		["Parent"] = {
			["Org5"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org6"] = {
		["Parent"] = {
			["Org6"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org7"] = {
		["Parent"] = {
			["Org7"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org8"] = {
		["Parent"] = {
			["Org8"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org9"] = {
		["Parent"] = {
			["Org9"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Org10"] = {
		["Parent"] = {
			["Org10"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela1"] = {
		["Parent"] = {
			["Favela1"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela2"] = {
		["Parent"] = {
			["Favela2"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela3"] = {
		["Parent"] = {
			["Favela3"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela4"] = {
		["Parent"] = {
			["Favela4"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela5"] = {
		["Parent"] = {
			["Favela5"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela6"] = {
		["Parent"] = {
			["Favela6"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela7"] = {
		["Parent"] = {
			["Favela7"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela8"] = {
		["Parent"] = {
			["Favela8"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela9"] = {
		["Parent"] = {
			["Favela9"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela10"] = {
		["Parent"] = {
			["Favela10"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
	["Favela11"] = {
		["Parent"] = {
			["Favela11"] = true
		},
		["Hierarchy"] = { "Chefe", "Gerente", "Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},	
-- Contraband
    -- ["Chiliad"] = {
	-- 	["Parent"] = {
	-- 		["Chiliad"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Families"] = {
	-- 	["Parent"] = {
	-- 		["Families"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Highways"] = {
	-- 	["Parent"] = {
	-- 		["Highways"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Vagos"] = {
	-- 	["Parent"] = {
	-- 		["Vagos"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- -- Favelas
    -- ["Barragem"] = {
	-- 	["Parent"] = {
	-- 		["Barragem"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Farol"] = {
	-- 	["Parent"] = {
	-- 		["Farol"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Parque"] = {
	-- 	["Parent"] = {
	-- 		["Parque"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Sandy"] = {
	-- 	["Parent"] = {
	-- 		["Sandy"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Petroleo"] = {
	-- 	["Parent"] = {
	-- 		["Petroleo"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Praia-1"] = {
	-- 	["Parent"] = {
	-- 		["Praia-1"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Praia-2"] = {
	-- 	["Parent"] = {
	-- 		["Praia-2"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Zancudo"] = {
	-- 	["Parent"] = {
	-- 		["Zancudo"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- -- Mafias
    -- ["Madrazzo"] = {
	-- 	["Parent"] = {
	-- 		["Madrazzo"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Playboy"] = {
	-- 	["Parent"] = {
	-- 		["Playboy"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["TheSouth"] = {
	-- 	["Parent"] = {
	-- 		["TheSouth"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Vineyard"] = {
	-- 	["Parent"] = {
	-- 		["Vineyard"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- }
}