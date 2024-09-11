-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["pecadecarro"] = {
		["Index"] = "scrap",
		["Name"] = "Peça de Carro",
		["Type"] = "Comum",
		["Weight"] = 0.2,
		["Economy"] = 1
	},
	["scrap"] = {
		["Index"] = "scrap",
		["Name"] = "Sucata",
		["Type"] = "Comum",
		["Weight"] = 0.2,
		["Economy"] = 1
	},
	["reciclavel"] = {
		["Index"] = "reciclavel",
		["Name"] = "Lixo Reciclável",
		["Description"] = "Leve para a <green>Central de Reciclagem</green> para reciclar.",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 175,
		["Max"] = 1
	},
	["adesive01"] = {
		["Index"] = "adesive01",
		["Name"] = "Adesivo Temporário",
		["Description"] = "Utilizado para camuflar temporariamente um veículo na cor <green>Vermelho</green>.",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 175,
		["Max"] = 1
	},
	["adesive02"] = {
		["Index"] = "adesive02",
		["Name"] = "Adesivo Temporário",
		["Description"] = "Utilizado para camuflar temporariamente um veículo na cor <green>Verde</green>.",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 175,
		["Max"] = 1
	},
	["adesive03"] = {
		["Index"] = "adesive03",
		["Name"] = "Adesivo Temporário",
		["Description"] = "Utilizado para camuflar temporariamente um veículo na cor <green>Azul</green>.",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 175,
		["Max"] = 1
	},
	["adesive04"] = {
		["Index"] = "adesive04",
		["Name"] = "Adesivo Temporário",
		["Description"] = "Utilizado para camuflar temporariamente um veículo na cor <green>Amarelo</green>.",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 175,
		["Max"] = 1
	},
	["adesive05"] = {
		["Index"] = "adesive05",
		["Name"] = "Adesivo Temporário",
		["Description"] = "Utilizado para camuflar temporariamente um veículo na cor <green>Marrom</green>.",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 175,
		["Max"] = 1
	},
	["cat"] = {
		["Index"] = "cat",
		["Name"] = "Coleira de Gato",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["hen"] = {
		["Index"] = "hen",
		["Name"] = "Coleira de Galinha",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["husky"] = {
		["Index"] = "husky",
		["Name"] = "Coleira de Husky",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["pig"] = {
		["Index"] = "pig",
		["Name"] = "Coleira de Porco",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["poodle"] = {
		["Index"] = "poodle",
		["Name"] = "Coleira de Poodle",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["pug"] = {
		["Index"] = "pug",
		["Name"] = "Coleira de Pug",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["retriever"] = {
		["Index"] = "retriever",
		["Name"] = "Coleira de Retriever",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["rottweiler"] = {
		["Index"] = "rottweiler",
		["Name"] = "Coleira de Rottweiler",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["shepherd"] = {
		["Index"] = "shepherd",
		["Name"] = "Coleira de Shepherd",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},
	["westy"] = {
		["Index"] = "westy",
		["Name"] = "Coleira de Westy",
		["Repair"] = "ration",
		["Type"] = "Animal",
		["Durability"] = 720,
		["Weight"] = 1.25,
		["Economy"] = 7500
	},

	--------------ILEGAL-------------
	["maconha"] = {
		["Index"] = "maconha",
		["Name"] = "Maconha",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["balde"] = {
		["Index"] = "balde",
		["Name"] = "Balde",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["seda"] = {
		["Index"] = "seda",
		["Name"] = "Seda",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["essencia"] = {
		["Index"] = "essencia",
		["Name"] = "Essencia",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["latinha"] = {
		["Index"] = "latinha",
		["Name"] = "Latinha",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["cloroformio"] = {
		["Index"] = "cloroformio",
		["Name"] = "Cloroformio",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["boostingtablet"] = {
		["Index"] = "boostingtablet",
		["Name"] = "Tablet - Boosting",
		["Description"] = "Utilizado para acessar a interface do boosting.",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 0.5,
		["Economy"] = 5750,
		["Max"] = 1
	},
	["racingtablet"] = {
		["Index"] = "racingtablet",
		["Name"] = "Tablet - Racing",
		["Description"] = "Utilizado para acessar a interface das Corridas.",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 0.5,
		["Economy"] = 5750,
		["Max"] = 1
	},
	--cocaina
	["folhacoca"] = {
		["Index"] = "folhacoca",
		["Name"] = "F. de Coca",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["triturador"] = {
		["Index"] = "triturador",
		["Name"] = "Triturador",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["pino"] = {
		["Index"] = "pino",
		["Name"] = "Pino",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	--META
	["cloreto"] = {
		["Index"] = "cloreto",
		["Name"] = "Cloreto",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["efedrina"] = {
		["Index"] = "efedrina",
		["Name"] = "Efedrina",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["fosforo"] = {
		["Index"] = "fosforo",
		["Name"] = "Fosforo",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	--LAVAGEM
	["alvejante"] = {
		["Index"] = "alvejante",
		["Name"] = "Alvejante",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	--MAFIA DE MUNIÇÃO
	["capsula"] = {
		["Index"] = "capsula",
		["Name"] = "Capsula",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["polvora"] = {
		["Index"] = "polvora",
		["Name"] = "Polvora",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["ferro"] = {
		["Index"] = "ferro",
		["Name"] = "Ferro",
		["Type"] = "Comum",
		["Weight"] = 0.05,
		["Economy"] = 40
	},
	["partearma"] = {
		["Index"] = "partearma",
		["Name"] = "Part. Arma",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 40
	},
	["gatilho"] = {
		["Index"] = "gatilho",
		["Name"] = "Gatilho",
		["Type"] = "Comum",
		["Weight"] = 0.08,
		["Economy"] = 40
	},
	["pacotedinheiro10"] = {
		["Index"] = "pacotinho",
		["Name"] = "Bolo de Dinheiro 10k",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["pacotedinheiro50"] = {
		["Index"] = "pacotinho",
		["Name"] = "Bolo de Dinheiro 50k",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["pacotedinheiro100"] = {
		["Index"] = "pacotinho",
		["Name"] = "Bolo de Dinheiro 100k",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["creditcard"] = {
		["Index"] = "creditcard",
		["Name"] = "Cartão de Crédito",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["diagram"] = {
		["Index"] = "diagram",
		["Name"] = "Diagrama",
		["Type"] = "Comum",
		["Weight"] = 0.75
	},
	["propertys"] = {
		["Index"] = "propertys",
		["Name"] = "Cartão de Segurança",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["megaphone"] = {
		["Index"] = "megaphone",
		["Name"] = "Megafone",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Block"] = true,
		["Weight"] = 3.25
	},
	["dollars2"] = {
		["Index"] = "dollars2",
		["Name"] = "Dinheiro Sujo",
		["Type"] = "Comum",
		["Weight"] = 0.0,
		["Economy"] = 1
	},
	["backpack"] = {
		["Index"] = "backpack",
		["Name"] = "Mochila",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 100000
	},
	["adrenaline"] = {
		["Index"] = "adrenaline",
		["Name"] = "Adrenalina",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 100000
	},
	["wheatflour"] = {
		["Index"] = "wheatflour",
		["Name"] = "Farinha De Trigo",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 100000
	},
	["sprays01"] = {
		["Index"] = "sprays",
		["Name"] = "Spray",
		["Type"] = "Usável",
		["Weight"] = 0.75
	},
	["enginea"] = {
		["Index"] = "enginea",
		["Name"] = "Motor",
		["Type"] = "Usável",
		["Weight"] = 9.25
	},
	["engineb"] = {
		["Index"] = "engineb",
		["Name"] = "Motor",
		["Type"] = "Usável",
		["Weight"] = 10.25
	},
	["enginec"] = {
		["Index"] = "enginec",
		["Name"] = "Motor",
		["Type"] = "Usável",
		["Weight"] = 11.25
	},
	["engined"] = {
		["Index"] = "engined",
		["Name"] = "Motor",
		["Type"] = "Usável",
		["Weight"] = 12.25
	},
	["enginee"] = {
		["Index"] = "enginee",
		["Name"] = "Motor",
		["Type"] = "Usável",
		["Weight"] = 13.25
	},
	["transmissiona"] = {
		["Index"] = "transmissiona",
		["Name"] = "Transmissão",
		["Type"] = "Usável",
		["Weight"] = 9.25
	},
	["transmissionb"] = {
		["Index"] = "transmissionb",
		["Name"] = "Transmissão",
		["Type"] = "Usável",
		["Weight"] = 10.25
	},
	["transmissionc"] = {
		["Index"] = "transmissionc",
		["Name"] = "Transmissão",
		["Type"] = "Usável",
		["Weight"] = 11.25
	},
	["transmissiond"] = {
		["Index"] = "transmissiond",
		["Name"] = "Transmissão",
		["Type"] = "Usável",
		["Weight"] = 12.25
	},
	["transmissione"] = {
		["Index"] = "transmissione",
		["Name"] = "Transmissão",
		["Type"] = "Usável",
		["Weight"] = 13.25
	},
	["brakea"] = {
		["Index"] = "brakea",
		["Name"] = "Freios",
		["Type"] = "Usável",
		["Weight"] = 7.25
	},
	["brakeb"] = {
		["Index"] = "brakeb",
		["Name"] = "Freios",
		["Type"] = "Usável",
		["Weight"] = 8.25
	},
	["brakec"] = {
		["Index"] = "brakec",
		["Name"] = "Freios",
		["Type"] = "Usável",
		["Weight"] = 9.25
	},
	["braked"] = {
		["Index"] = "braked",
		["Name"] = "Freios",
		["Type"] = "Usável",
		["Weight"] = 10.25
	},
	["brakee"] = {
		["Index"] = "brakee",
		["Name"] = "Freios",
		["Type"] = "Usável",
		["Weight"] = 11.25
	},
	["suspensiona"] = {
		["Index"] = "suspensiona",
		["Name"] = "Suspensão",
		["Type"] = "Usável",
		["Weight"] = 7.25
	},
	["suspensionb"] = {
		["Index"] = "suspensionb",
		["Name"] = "Suspensão",
		["Type"] = "Usável",
		["Weight"] = 8.25
	},
	["suspensionc"] = {
		["Index"] = "suspensionc",
		["Name"] = "Suspensão",
		["Type"] = "Usável",
		["Weight"] = 9.25
	},
	["suspensiond"] = {
		["Index"] = "suspensiond",
		["Name"] = "Suspensão",
		["Type"] = "Usável",
		["Weight"] = 10.25
	},
	["suspensione"] = {
		["Index"] = "suspensione",
		["Name"] = "Suspensão",
		["Type"] = "Usável",
		["Weight"] = 11.25
	},
	["dismantle"] = {
		["Index"] = "dismantle",
		["Name"] = "Contrato",
		["Description"] = "Ativando o mesmo você assume a responsabilidade com o <b>Lester</b> de desmanchar um veículo.",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Max"] = 1
	},
	["repairkit01"] = {
		["Index"] = "repairkit01",
		["Name"] = "Kit de Reparos - Comum",
		["Type"] = "Comum",
		["Weight"] = 3.25,
		["Economy"] = 525
	},
	["repairkit02"] = {
		["Index"] = "repairkit02",
		["Name"] = "Kit de Reparos - Raro",
		["Type"] = "Comum",
		["Weight"] = 3.75,
		["Economy"] = 3225
	},
	["repairkit03"] = {
		["Index"] = "repairkit03",
		["Name"] = "Kit de Reparos - Épico",
		["Type"] = "Comum",
		["Weight"] = 4.25,
		["Economy"] = 7225
	},
	["repairkit04"] = {
		["Index"] = "repairkit04",
		["Name"] = "Kit de Reparos - Lendário",
		["Type"] = "Comum",
		["Weight"] = 5.75,
		["Economy"] = 15225
	},
	["backschool"] = {
		["Index"] = "backschool",
		["Name"] = "Mochila de Escola",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 100000
	},
	["backcyclist"] = {
		["Index"] = "backcyclist",
		["Name"] = "Mochila de Ciclista",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 100000
	},
	["backcamping"] = {
		["Index"] = "backcamping",
		["Name"] = "Mochila de Acampamento",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 100000
	},
	["backalohomorawhite"] = {
		["Index"] = "backalohomorawhite",
		["Name"] = "Mochila Alohomora Branca",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 150000
	},
	["backalohomorablack"] = {
		["Index"] = "backalohomorablack",
		["Name"] = "Mochila Alohomora Preta",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 150000
	},
	["backalohomorared"] = {
		["Index"] = "backalohomorared",
		["Name"] = "Mochila Alohomora Vermelha",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 150000
	},
	["backrudolphpurple"] = {
		["Index"] = "backrudolphpurple",
		["Name"] = "Mochila Rudolph Roxo",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 150000
	},
	["backrudolphred"] = {
		["Index"] = "backrudolphred",
		["Name"] = "Mochila Rudolph Vermelho",
		["Type"] = "Usável",
		["Weight"] = 5.25,
		["Economy"] = 150000
	},
	["paper"] = {
		["Index"] = "paper",
		["Name"] = "Papel",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 120
	},
	["rentalveh"] = {
		["Index"] = "rentalveh",
		["Name"] = "Aluguel de Veículo",
		["Description"] = "Leve até a concessionária para usa-lo.",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 0
	},
	["mushroomteaplus"] = {
		["Index"] = "mushroomtea",
		["Name"] = "Chá de Cogumelo",
		["Description"] = "Aumenta a mochila em 10Kg.",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 325
	},
	["paramedicpass"] = {
		["Index"] = "medicbag",
		["Name"] = "Vale - Médico",
		["Description"] = "Leve até um médico para troca-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["luckywheelpass"] = {
		["Index"] = "luckywheelpass",
		["Name"] = "Vale - Roda da Fortuna",
		["Description"] = "Leve até o cassino para usa-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5000
	},
	["mechanicpass"] = {
		["Index"] = "mechanicpass",
		["Name"] = "Vale - Mecânico",
		["Description"] = "Leve até um mecânico para troca-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["uwucoffeepass"] = {
		["Index"] = "foodpass",
		["Name"] = "Vale - Uwu Café",
		["Description"] = "Leve até o restaurante para troca-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["pizzathispass"] = {
		["Index"] = "foodpass",
		["Name"] = "Vale - Pizza This",
		["Description"] = "Leve até o restaurante para troca-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["burgershotpass"] = {
		["Index"] = "foodpass",
		["Name"] = "Vale - BurgerShot",
		["Description"] = "Leve até o restaurante para troca-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["c4"] = {
		["Index"] = "c4",
		["Name"] = "C4",
		["Type"] = "Usável",
		["Weight"] = 2.75,
		["Max"] = 1,
		["Economy"] = 625
	},
	["geode"] = {
		["Index"] = "geode",
		["Name"] = "Geodo",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 10
	},
	["pickaxe"] = {
		["Index"] = "pickaxe",
		["Name"] = "Picareta",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 2.25,
		["Economy"] = 525
	},
	["suitcase"] = {
		["Index"] = "suitcase",
		["Name"] = "Maleta",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 275
	},
	["badge01"] = {
		["Index"] = "badge01",
		["Name"] = "Distintivo",
		["Description"] = "<green>San Andreas Police Department</green>",
		["Type"] = "Usável",
		["Block"] = true,
		["Weight"] = 0.75,
		["Economy"] = 10
	},
	["badge02"] = {
		["Index"] = "badge02",
		["Name"] = "Distintivo",
		["Description"] = "<green>Emergency Medical Services</green>",
		["Type"] = "Usável",
		["Block"] = true,
		["Weight"] = 0.75,
		["Economy"] = 10
	},
	["WEAPON_PICKAXE"] = {
		["Index"] = "pickaxe",
		["Name"] = "Picareta",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 2.25,
		["Economy"] = 525
	},
	["WEAPON_PICKAXE_PLUS"] = {
		["Index"] = "pickaxe_plus",
		["Name"] = "Picareta de Diamante",
		["Description"] = "Reduz o tempo de minerar. de <b>10 Segundos</b> para  <b>3 Segundos</b> + Aumenta o Ganho de Itens da <b>Mineração</b>",
		["Repair"] = "repairkit02",
		["Type"] = "Comum",
		["Durability"] = 15,
		["Weight"] = 2.25,
		["Economy"] = 87500
	},
	["mushroomtea"] = {
		["Index"] = "mushroomtea",
		["Name"] = "Chá de Cogumelo",
		["Description"] = "Tempo pedalando reduzido para <green>10 minutos</green> por <green>60 minutos</green>, lembrando que o efeito passa desconectando da cidade.",
		["Durability"] = 1,
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 325
	},
	["nigirizushi"] = {
		["Index"] = "nigirizushi",
		["Name"] = "Nigirizushi",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.65,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 75
	},
	["sushi"] = {
		["Index"] = "sushi",
		["Name"] = "Sushi",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.65,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 75
	},
	["cupcake"] = {
		["Index"] = "cupcake",
		["Name"] = "Cupcake",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 75
	},
	["milkshake"] = {
		["Index"] = "milkshake",
		["Name"] = "Milk Shake",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.8555,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["cappuccino"] = {
		["Index"] = "cappuccino",
		["Name"] = "Cappuccino",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.65,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["applelove"] = {
		["Index"] = "applelove",
		["Name"] = "Maça do Amor",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Max"] = 2,
		["Economy"] = 75
	},
	["credential"] = {
		["Index"] = "credential",
		["Name"] = "Credencial",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 1000
	},
	["racetrophy"] = {
		["Index"] = "racetrophy",
		["Name"] = "Troféu",
		["Type"] = "Comum",
		["Weight"] = 7.25,
		["Economy"] = 2250
	},
	["scanner"] = {
		["Index"] = "scanner",
		["Name"] = "Scanner",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 4.75,
		["Economy"] = 6750
	},
	["nitro"] = {
		["Index"] = "nitro",
		["Name"] = "Nitro",
		["Type"] = "Usável",
		["Weight"] = 7.25,
		["Economy"] = 400
	},
	["postit"] = {
		["Index"] = "postit",
		["Name"] = "Post-It",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 20
	},
	["attachsFlashlight"] = {
		["Index"] = "attachsFlashlight",
		["Name"] = "Lanterna Tatica",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 1750
	},
	["attachsCrosshair"] = {
		["Index"] = "attachsCrosshair",
		["Name"] = "Mira Holográfica",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 1750
	},
	["attachsSilencer"] = {
		["Index"] = "attachsSilencer",
		["Name"] = "Silenciador",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 1750
	},
	["attachsMagazine"] = {
		["Index"] = "attachsMagazine",
		["Name"] = "Pente Estendido",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 1750
	},
	["attachsGrip"] = {
		["Index"] = "attachsGrip",
		["Name"] = "Empunhadura",
		["Type"] = "Usável",
		["Weight"] = 1.15,
		["Economy"] = 1750
	},
	["cheese"] = {
		["Index"] = "cheese",
		["Name"] = "Queijo",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 10
	},
	["silk"] = {
		["Index"] = "silk",
		["Name"] = "Seda",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 5
	},
	["tablecoke"] = {
		["Index"] = "tablecoke",
		["Name"] = "Mesa de Criação",
		["Description"] = "Utilizada para criação de Cocaína.",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 12.75,
		["Economy"] = 1750
	},
	["tablemeth"] = {
		["Index"] = "tablemeth",
		["Name"] = "Mesa de Criação",
		["Description"] = "Utilizada para criação de Metanfetamina.",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 12.75,
		["Economy"] = 1750
	},
	["tableweed"] = {
		["Index"] = "tableweed",
		["Name"] = "Mesa de Criação",
		["Description"] = "Utilizada para criação de Baseados.",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 12.75,
		["Economy"] = 1750
	},
	["campfire"] = {
		["Index"] = "campfire",
		["Name"] = "Fogueira",
		["Type"] = "Usável",
		["Weight"] = 5.75,
		["Economy"] = 675
	},
	["barrier"] = {
		["Index"] = "barrier",
		["Name"] = "Barreira",
		["Type"] = "Usável",
		["Weight"] = 1.75,
		["Economy"] = 250
	},
	["medicbag"] = {
		["Index"] = "medicbag",
		["Name"] = "Bolsa Médica",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 2.75,
		["Economy"] = 425
	},
	["medicbed"] = {
		["Index"] = "medicbed",
		["Name"] = "Maca Médica",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 7.25,
		["Economy"] = 725
	},
	["techtrash"] = {
		["Index"] = "techtrash",
		["Name"] = "Lixo Eletrônico",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 125
	},
	["tarp"] = {
		["Index"] = "tarp",
		["Name"] = "Lona",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 50
	},
	["sheetmetal"] = {
		["Index"] = "sheetmetal",
		["Name"] = "Chapa de Metal",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 50
	},
	["roadsigns"] = {
		["Index"] = "roadsigns",
		["Name"] = "Placas de Trânsito",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 50
	},
	["leather"] = {
		["Index"] = "leather",
		["Name"] = "Couro",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 20
	},
	["explosives"] = {
		["Index"] = "explosives",
		["Name"] = "Explosivos",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["animalfat"] = {
		["Index"] = "animalfat",
		["Name"] = "Gordura Animal",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 10
	},
	["fidentity"] = {
		["Index"] = "identity",
		["Name"] = "Passaporte",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 10000
	},
	["identity"] = {
		["Index"] = "identity",
		["Name"] = "Passaporte",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 5000
	},
	["blocksignal"] = {
		["Index"] = "blocksignal",
		["Name"] = "Bloqueador de Sinal",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 325
	},
	["pistolbody"] = {
		["Index"] = "pistolbody",
		["Name"] = "Corpo de Pistola",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 425
	},
	["smgbody"] = {
		["Index"] = "smgbody",
		["Name"] = "Corpo de Sub-Metralhadora",
		["Type"] = "Comum",
		["Weight"] = 0.85,
		["Economy"] = 525
	},
	["riflebody"] = {
		["Index"] = "riflebody",
		["Name"] = "Corpo de Rifle",
		["Type"] = "Comum",
		["Weight"] = 0.95,
		["Economy"] = 625
	},
	["cotton"] = {
		["Index"] = "cotton",
		["Name"] = "Algodão",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 45
	},
	["plaster"] = {
		["Index"] = "plaster",
		["Name"] = "Esparadrapo",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 35
	},
	["sulfuric"] = {
		["Index"] = "sulfuric",
		["Name"] = "Ácido Sulfúrico",
		["Type"] = "Usável",
		["Weight"] = 0.55,
		["Economy"] = 30
	},
	["saline"] = {
		["Index"] = "saline",
		["Name"] = "Soro Fisiológico",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 25
	},
	["defibrillator"] = {
		["Index"] = "defibrillator",
		["Name"] = "Desfibrilador",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 3.75,
		["Economy"] = 325
	},
	["alcohol"] = {
		["Index"] = "alcohol",
		["Name"] = "Álcool",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 40
	},
	["notebook"] = {
		["Index"] = "notebook",
		["Name"] = "Notebook",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 7.25,
		["Economy"] = 4250
	},
	["syringe"] = {
		["Index"] = "syringe",
		["Name"] = "Seringa",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 2
	},
	["syringe01"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa A+",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["syringe02"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa B+",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["syringe03"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa A-",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["syringe04"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa B-",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["burgershot1"] = {
		["Index"] = "burgershot1",
		["Name"] = "Copo de Suco",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["burgershot2"] = {
		["Index"] = "burgershot2",
		["Name"] = "Caixa de Lanche",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["burgershot3"] = {
		["Index"] = "burgershot3",
		["Name"] = "Combo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 120
	},
	["burgershot4"] = {
		["Index"] = "burgershot3",
		["Name"] = "Combo + Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 270
	},
	["pizzathis1"] = {
		["Index"] = "pizzathis1",
		["Name"] = "Copo de Suco",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["pizzathis2"] = {
		["Index"] = "pizzathis2",
		["Name"] = "Caixa de Lanche",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["pizzathis3"] = {
		["Index"] = "pizzathis3",
		["Name"] = "Combo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 120
	},
	["pizzathis4"] = {
		["Index"] = "pizzathis3",
		["Name"] = "Combo + Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 270
	},
	["uwucoffee1"] = {
		["Index"] = "uwucoffee1",
		["Name"] = "Copo de Suco",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["uwucoffee2"] = {
		["Index"] = "uwucoffee2",
		["Name"] = "Caixa de Lanche",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["uwucoffee3"] = {
		["Index"] = "uwucoffee3",
		["Name"] = "Combo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 120
	},
	["uwucoffee4"] = {
		["Index"] = "uwucoffee3",
		["Name"] = "Combo + Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 270
	},
	["beanmachine1"] = {
		["Index"] = "beanmachine1",
		["Name"] = "Copo de Suco",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["beanmachine2"] = {
		["Index"] = "beanmachine2",
		["Name"] = "Caixa de Lanche",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Max"] = 1,
		["Economy"] = 10
	},
	["beanmachine3"] = {
		["Index"] = "beanmachine3",
		["Name"] = "Combo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 120
	},
	["beanmachine4"] = {
		["Index"] = "beanmachine3",
		["Name"] = "Combo + Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Max"] = 2,
		["Economy"] = 270
	},
	["wheelchair"] = {
		["Index"] = "wheelchair",
		["Name"] = "Cadeira de Rodas",
		["Type"] = "Usável",
		["Weight"] = 7.25,
		["Block"] = true,
		["Economy"] = 2750
	},
	["vehkey"] = {
		["Index"] = "vehkey",
		["Name"] = "Chave Cópia",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 0
	},
	["evidence01"] = {
		["Index"] = "evidence01",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["evidence02"] = {
		["Index"] = "evidence02",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["evidence03"] = {
		["Index"] = "evidence03",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["evidence04"] = {
		["Index"] = "evidence04",
		["Name"] = "Evidência",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 0
	},
	["card01"] = {
		["Index"] = "card01",
		["Name"] = "Cartão Comum",
		["Description"] = "Roubar Lojas de Departamento.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 325
	},
	["card02"] = {
		["Index"] = "card02",
		["Name"] = "Cartão Acesso",
		["Description"] = "Utilizado para navegar em redes.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 325
	},
	["card03"] = {
		["Index"] = "card03",
		["Name"] = "Cartão Épico",
		["Description"] = "Roubar Bancos Fleeca.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 375
	},
	["card04"] = {
		["Index"] = "card04",
		["Name"] = "Cartão Raro",
		["Description"] = "Roubar Barbearias.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 275
	},
	["card05"] = {
		["Index"] = "card05",
		["Name"] = "Cartão Lendário",
		["Description"] = "Roubar Bancos.",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.25,
		["Economy"] = 425
	},
	["gemstone"] = {
		["Index"] = "gemstone",
		["Name"] = "Gemstone",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 2000
	},
	["radio"] = {
		["Index"] = "radio",
		["Name"] = "Rádio",
		["Type"] = "Usável",
		["Repair"] = "repairkit01",
		["Durability"] = 7,
		["Weight"] = 0.75,
		["Economy"] = 975
	},
	["vest"] = {
		["Index"] = "vest",
		["Name"] = "Colete",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 3.75,
		["Max"] = 1,
		["Economy"] = 750
	},
	["bandage"] = {
		["Index"] = "bandage",
		["Name"] = "Bandagem",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 225
	},
	["medkit"] = {
		["Index"] = "medkit",
		["Name"] = "Kit Médico",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Max"] = 1,
		["Economy"] = 575
	},
	["pouch"] = {
		["Index"] = "pouch",
		["Name"] = "Malote",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Economy"] = 80
	},
	["woodlog"] = {
		["Index"] = "woodlog",
		["Name"] = "Tora de Madeira",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 40
	},
	["fishingrod"] = {
		["Index"] = "fishingrod",
		["Name"] = "Vara de Pescar",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 2.75,
		["Economy"] = 725
	},
	["switchblade"] = {
		["Index"] = "switchblade",
		["Name"] = "Canivete",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Description"] = "Utilizada para remoção de carne.",
		["Durability"] = 7,
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["octopus"] = {
		["Index"] = "octopus",
		["Name"] = "Polvo",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 14
	},
	["shrimp"] = {
		["Index"] = "shrimp",
		["Name"] = "Camarão",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 14
	},
	["carp"] = {
		["Index"] = "carp",
		["Name"] = "Carpa",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 12
	},
	["codfish"] = {
		["Index"] = "codfish",
		["Name"] = "Bacalhau",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 16
	},
	["catfish"] = {
		["Index"] = "catfish",
		["Name"] = "Bagre",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 16
	},
	["goldenfish"] = {
		["Index"] = "goldenfish",
		["Name"] = "Dourado",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 30
	},
	["horsefish"] = {
		["Index"] = "horsefish",
		["Name"] = "Cavala",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 12
	},
	["tilapia"] = {
		["Index"] = "tilapia",
		["Name"] = "Tilápia",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 14
	},
	["pacu"] = {
		["Index"] = "pacu",
		["Name"] = "Pacu",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 24
	},
	["pirarucu"] = {
		["Index"] = "pirarucu",
		["Name"] = "Pirarucu",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 26
	},
	["tambaqui"] = {
		["Index"] = "tambaqui",
		["Name"] = "Tambaqui",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 28
	},
	["bait"] = {
		["Index"] = "bait",
		["Name"] = "Isca",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5
	},
	["animalpelt"] = {
		["Index"] = "animalpelt",
		["Name"] = "Pele Animal",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 25
	},
	["weedclone"] = {
		["Index"] = "weedclone",
		["Name"] = "Clonagem de Maconha",
		["Type"] = "Usável",
		["Weight"] = 0.15
	},
	["weedleaf"] = {
		["Index"] = "weedleaf",
		["Name"] = "Folha de Maconha",
		["Type"] = "Comum",
		["Weight"] = 0.30
	},
	["joint"] = {
		["Index"] = "joint",
		["Name"] = "Baseado",
		["Type"] = "Usável",
		["Weight"] = 0.45
	},
	["weedsack"] = {
		["Index"] = "weedsack",
		["Name"] = "Pacote de Cannabis",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 275
	},
	["cokesack"] = {
		["Index"] = "cokesack",
		["Name"] = "Pacote de Cocaína",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 275
	},
	["methsack"] = {
		["Index"] = "methsack",
		["Name"] = "Pacote de Metanfetamina",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 975
	},
	["codeine"] = {
		["Index"] = "codeine",
		["Name"] = "Codeína",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 35
	},
	["amphetamine"] = {
		["Index"] = "amphetamine",
		["Name"] = "Anfetamina",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 45
	},
	["cocaine"] = {
		["Index"] = "cocaine",
		["Name"] = "Cocaína",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 35
	},
	["cokeleaf"] = {
		["Index"] = "cokeleaf",
		["Name"] = "Folha de Coca",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 5
	},
	["meth"] = {
		["Index"] = "meth",
		["Name"] = "Metanfetamina",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 35
	},
	["acetone"] = {
		["Index"] = "acetone",
		["Name"] = "Acetona",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["drugtoy"] = {
		["Index"] = "drugtoy",
		["Name"] = "Brinquedo",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 100
	},
	["rolepass"] = {
		["Index"] = "rolepass",
		["Name"] = "Rolepass",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 200000
	},
	["premium"] = {
		["Index"] = "premium",
		["Name"] = "Premium",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 150000
	},
	["premiumplate"] = {
		["Index"] = "platepremium",
		["Name"] = "Placa Premium",
		["Type"] = "Usável",
		["Description"] = "Personaliza a placa do veículo.",
		["Weight"] = 0.75,
		["Economy"] = 100000
	},
	["creator"] = {
		["Index"] = "newchars",
		["Name"] = "Creator",
		["Description"] = "Use para caso tenha criado o personagem errado ou algum bug. :)",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Economy"] = 0
	},
	["newchars"] = {
		["Index"] = "newchars",
		["Name"] = "+1 Personagem",
		["Type"] = "Usável",
		["Description"] = "Limite de personagem em +1.",
		["Weight"] = 0.25,
		["Economy"] = 150000
	},
	["lancap"] = {
		["Index"] = "lancap",
		["Name"] = "Lança Perfume",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 35
	},
	["namechange"] = {
		["Index"] = "namechange",
		["Name"] = "Troca de Nome",
		["Type"] = "Usável",
		["Description"] = "Troca o nome do personagem.",
		["Weight"] = 0.25,
		["Economy"] = 100000
	},
	["milkbottle"] = {
		["Index"] = "milkbottle",
		["Name"] = "Garrafa de Leite",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Scape"] = true,
		["Max"] = 5,
		["Economy"] = 35
	},
	["guarananatural"] = {
		["Index"] = "guarananatural",
		["Name"] = "Guaraná Natural",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 100
	},
	["water"] = {
		["Index"] = "water",
		["Name"] = "Água",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 30
	},
	["emptybottle"] = {
		["Index"] = "emptybottle",
		["Name"] = "Garrafa Vazia",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Scape"] = true,
		["Max"] = 5,
		["Economy"] = 30
	},
	["coffee"] = {
		["Index"] = "coffee",
		["Name"] = "Copo de Café",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 20
	},
	["coffeemilk"] = {
		["Index"] = "coffeemilk",
		["Name"] = "Café com Leite",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.35,
		["Max"] = 3,
		["Economy"] = 95
	},
	["cola"] = {
		["Index"] = "cola",
		["Name"] = "Cola",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 15
	},
	["tacos"] = {
		["Index"] = "tacos",
		["Name"] = "Tacos",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 25
	},
	["fries"] = {
		["Index"] = "fries",
		["Name"] = "Fritas",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 125
	},
	["soda"] = {
		["Index"] = "soda",
		["Name"] = "Sprunk",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 15
	},
	["apple"] = {
		["Index"] = "apple",
		["Name"] = "Maça",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["orange"] = {
		["Index"] = "orange",
		["Name"] = "Laranja",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["strawberry"] = {
		["Index"] = "strawberry",
		["Name"] = "Morango",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["coffee2"] = {
		["Index"] = "coffee2",
		["Name"] = "Grão de Café",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["grape"] = {
		["Index"] = "grape",
		["Name"] = "Uva",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["tange"] = {
		["Index"] = "tange",
		["Name"] = "Tangerina",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["banana"] = {
		["Index"] = "banana",
		["Name"] = "Banana",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["guarana"] = {
		["Index"] = "guarana",
		["Name"] = "Guaraná",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["acerola"] = {
		["Index"] = "acerola",
		["Name"] = "Acerola",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["passion"] = {
		["Index"] = "passion",
		["Name"] = "Maracujá",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["tomato"] = {
		["Index"] = "tomato",
		["Name"] = "Tomate",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["mushroom"] = {
		["Index"] = "mushroom",
		["Name"] = "Cogumelo",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["sugar"] = {
		["Index"] = "sugar",
		["Name"] = "Açucar",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 5
	},
	["cookies"] = {
		["Index"] = "cookies",
		["Name"] = "Cookies",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 60
	},
	["orangejuice"] = {
		["Index"] = "orangejuice",
		["Name"] = "Suco de Laranja",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["tangejuice"] = {
		["Index"] = "tangejuice",
		["Name"] = "Suco de Tangerina",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["grapejuice"] = {
		["Index"] = "grapejuice",
		["Name"] = "Suco de Uva",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["strawberryjuice"] = {
		["Index"] = "strawberryjuice",
		["Name"] = "Suco de Morango",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["bananajuice"] = {
		["Index"] = "bananajuice",
		["Name"] = "Suco de Banana",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["acerolajuice"] = {
		["Index"] = "acerolajuice",
		["Name"] = "Suco de Acerola",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["passionjuice"] = {
		["Index"] = "passionjuice",
		["Name"] = "Suco de Maracujá",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["bread"] = {
		["Index"] = "bread",
		["Name"] = "Pão",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5
	},
	["ketchup"] = {
		["Index"] = "ketchup",
		["Name"] = "Ketchup",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["cannedsoup"] = {
		["Index"] = "cannedsoup",
		["Name"] = "Sopa em Lata",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Economy"] = 55
	},
	["canofbeans"] = {
		["Index"] = "canofbeans",
		["Name"] = "Lata de Feijão",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Economy"] = 55
	},
	["meat"] = {
		["Index"] = "meat",
		["Name"] = "Carne Animal",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 16
	},
	["fishfillet"] = {
		["Index"] = "fishfillet",
		["Name"] = "Filé de Peixe",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 10
	},
	["marshmallow"] = {
		["Index"] = "marshmallow",
		["Name"] = "Marshmallow",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 35
	},
	["cookedfishfillet"] = {
		["Index"] = "cookedfishfillet",
		["Name"] = "Filé de Peixe Cozido",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 35
	},
	["cookedmeat"] = {
		["Index"] = "cookedmeat",
		["Name"] = "Carne Animal Cozida",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 35
	},
	["hamburger"] = {
		["Index"] = "hamburger",
		["Name"] = "Hambúrguer",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Max"] = 3,
		["Economy"] = 25
	},
	["hamburger2"] = {
		["Index"] = "hamburger2",
		["Name"] = "Hambúrguer Artesanal",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["onionrings"] = {
		["Index"] = "onionrings",
		["Name"] = "Anéis de Cebola",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 95
	},
	["chickenfries"] = {
		["Index"] = "chickenfries",
		["Name"] = "Frango Frito",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 125
	},
	["pizzamozzarella"] = {
		["Index"] = "pizzamozzarella",
		["Name"] = "Pizza de Muçarela",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["pizzamushroom"] = {
		["Index"] = "pizzamushroom",
		["Name"] = "Pizza de Cogumelo",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["pizzabanana"] = {
		["Index"] = "pizzabanana",
		["Name"] = "Pizza de Banana",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["pizzachocolate"] = {
		["Index"] = "pizzachocolate",
		["Name"] = "Pizza de Chocolate",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.75,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["calzone"] = {
		["Index"] = "calzone",
		["Name"] = "Calzone",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 150
	},
	["hotdog"] = {
		["Index"] = "hotdog",
		["Name"] = "Cachorro-Quente",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.45,
		["Max"] = 3,
		["Economy"] = 15
	},
	["donut"] = {
		["Index"] = "donut",
		["Name"] = "Rosquinha",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 15
	},
	["plate"] = {
		["Index"] = "plate",
		["Name"] = "Placa",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["lockpick"] = {
		["Index"] = "lockpick",
		["Name"] = "Lockpick de Alumínio",
		["Description"] = "Utilizada para roubar veículos.",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 3,
		["Weight"] = 1.25,
		["Economy"] = 575
	},
	["toolbox"] = {
		["Index"] = "toolbox",
		["Name"] = "Ferramentas Básicas",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Max"] = 2,
		["Economy"] = 625
	},
	["advtoolbox"] = {
		["Index"] = "toolbox",
		["Name"] = "Ferramentas Avançadas",
		["Type"] = "Usável",
		["Weight"] = 3.25,
		["Charges"] = 3,
		["Max"] = 1,
		["Economy"] = 1525
	},
	["notepad"] = {
		["Index"] = "notepad",
		["Name"] = "Bloco de Notas",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["tyres"] = {
		["Index"] = "tyres",
		["Name"] = "Pneu",
		["Type"] = "Usável",
		["Weight"] = 2.75,
		["Max"] = 4,
		["Economy"] = 225
	},
	["cellphone"] = {
		["Index"] = "cellphone",
		["Name"] = "Celular",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 14,
		["Weight"] = 0.75,
		["Economy"] = 725
	},
	["scuba"] = {
		["Index"] = "scuba",
		["Name"] = "Roupa de Mergulho",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 14,
		["Weight"] = 4.75,
		["Economy"] = 975
	},
	["handcuff"] = {
		["Index"] = "handcuff",
		["Name"] = "Algemas",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.25,
		["Economy"] = 5750
	},
	["rope"] = {
		["Index"] = "rope",
		["Name"] = "Cordas",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 875
	},
	["hood"] = {
		["Index"] = "hood",
		["Name"] = "Capuz",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 5750
	},
	["plastic"] = {
		["Index"] = "plastic",
		["Name"] = "Plástico",
		["Type"] = "Comum",
		["Weight"] = 0.065,
		["Economy"] = 20
	},
	["glass"] = {
		["Index"] = "glass",
		["Name"] = "Vidro",
		["Type"] = "Comum",
		["Weight"] = 0.065,
		["Economy"] = 20
	},
	["rubber"] = {
		["Index"] = "rubber",
		["Name"] = "Borracha",
		["Type"] = "Comum",
		["Weight"] = 0.050,
		["Economy"] = 20
	},
	["aluminum"] = {
		["Index"] = "aluminum",
		["Name"] = "Alumínio",
		["Type"] = "Comum",
		["Weight"] = 0.075,
		["Economy"] = 30
	},
	["copper"] = {
		["Index"] = "copper",
		["Name"] = "Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.095,
		["Economy"] = 30
	},
	["ritmoneury"] = {
		["Index"] = "ritmoneury",
		["Name"] = "Ritmoneury",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Max"] = 2,
		["Economy"] = 475
	},
	["sinkalmy"] = {
		["Index"] = "sinkalmy",
		["Name"] = "Sinkalmy",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Max"] = 2,
		["Economy"] = 375
	},
	["cigarette"] = {
		["Index"] = "cigarette",
		["Name"] = "Cigarro",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Max"] = 5,
		["Economy"] = 10
	},
	["lighter"] = {
		["Index"] = "lighter",
		["Name"] = "Isqueiro",
		["Repair"] = "repairkit01",
		["Durability"] = 7,
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 175
	},
	["vape"] = {
		["Index"] = "vape",
		["Name"] = "Vape",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 14,
		["Weight"] = 0.75,
		["Economy"] = 4750
	},
	["dollars"] = {
		["Index"] = "dollars",
		["Name"] = "Dólares",
		["Type"] = "Comum",
		["Weight"] = 0.0,
		["Economy"] = 1
	},
	["battery"] = {
		["Index"] = "battery",
		["Name"] = "Pilhas",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 90
	},
	["elastic"] = {
		["Index"] = "elastic",
		["Name"] = "Elástico",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 60
	},
	["plasticbottle"] = {
		["Index"] = "plasticbottle",
		["Name"] = "Garrafa Plástica",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 60
	},
	["glassbottle"] = {
		["Index"] = "glassbottle",
		["Name"] = "Garrafa de Vidro",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 60
	},
	["metalcan"] = {
		["Index"] = "metalcan",
		["Name"] = "Lata de Metal",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 90
	},
	["chocolate"] = {
		["Index"] = "chocolate",
		["Name"] = "Chocolate",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Scape"] = true,
		["Max"] = 3,
		["Economy"] = 15
	},
	["sandwich"] = {
		["Index"] = "sandwich",
		["Name"] = "Sanduiche",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.25,
		["Max"] = 3,
		["Economy"] = 15
	},
	["rose"] = {
		["Index"] = "rose",
		["Name"] = "Rosa",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 25
	},
	["teddy"] = {
		["Index"] = "teddy",
		["Name"] = "Teddy",
		["Type"] = "Usável",
		["Weight"] = 1.25,
		["Economy"] = 75
	},
	["whiskey"] = {
		["Index"] = "whiskey",
		["Name"] = "Jack Daniel",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["chandon"] = {
		["Index"] = "chandon",
		["Name"] = "Chandon",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["dewars"] = {
		["Index"] = "dewars",
		["Name"] = "Dewars",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["hennessy"] = {
		["Index"] = "hennessy",
		["Name"] = "Hennessy",
		["Type"] = "Usável",
		["Durability"] = 1,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["goldbar"] = {
		["Index"] = "goldbar",
		["Name"] = "Barra de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["binoculars"] = {
		["Index"] = "binoculars",
		["Name"] = "Binóculos",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 275
	},
	["camera"] = {
		["Index"] = "camera",
		["Name"] = "Câmera",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 275
	},
	["WEAPON_AKCROMADO"] = {
		["Index"] = "akcromada",
		["Name"] = "AK-Cromada",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_AR15"] = {
		["Index"] = "ar15",
		["Name"] = "AR-15",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_AR15PRETO"] = {
		["Index"] = "ar15preto",
		["Name"] = "AR-15",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_AR15TCP"] = {
		["Index"] = "ar15tcp",
		["Name"] = "AR-15 TCP",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_ARFULAN"] = {
		["Index"] = "arfulan",
		["Name"] = "AR-Fulan",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_ASSAULTRIFLE_MK2_LUX"] = {
		["Index"] = "mk3lux",
		["Name"] = "MK2-LUX",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_AT4"] = {
		["Index"] = "at4",
		["Name"] = "AT-4",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_DOZEBORRACHA"] = {
		["Index"] = "dozeborracha",
		["Name"] = "Doze-borracha",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_FALLFLAMENGO"] = {
		["Index"] = "fallflamengo",
		["Name"] = "Fall Flamengo",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_FALLISRAEL"] = {
		["Index"] = "fallisrael",
		["Name"] = "Fall Israel",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_FALLJACARE"] = {
		["Index"] = "faljacare",
		["Name"] = "Fall Jacare",
		["Description"] = "Armamento que utiliza <b>Munição de Rifle</b>.",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 360,
		["Market"] = true,
		["Weight"] = 7.75,
		["Attachs"] = {
			["ATTACH_FLASHLIGHT"] = "COMPONENT_AT_AR_FLSH",
			["ATTACH_CROSSHAIR"] = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
			["ATTACH_MAGAZINE"] = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
			["ATTACH_GRIP"] = "COMPONENT_AT_AR_AFGRIP_02"
		}
	},
	["WEAPON_HATCHET"] = {
		["Index"] = "hatchet",
		["Name"] = "Machado",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_BAT"] = {
		["Index"] = "bat",
		["Name"] = "Bastão de Beisebol",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_KATANA"] = {
		["Index"] = "katana",
		["Name"] = "Katana",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 3,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_KARAMBIT"] = {
		["Index"] = "karambit",
		["Name"] = "Karambit",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 3,
		["Weight"] = 1.25,
		["Economy"] = 975
	},
	["WEAPON_BATTLEAXE"] = {
		["Index"] = "battleaxe",
		["Name"] = "Machado de Batalha",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_CROWBAR"] = {
		["Index"] = "crowbar",
		["Name"] = "Pé de Cabra",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.35,
		["Economy"] = 725
	},
	["WEAPON_GOLFCLUB"] = {
		["Index"] = "golfclub",
		["Name"] = "Taco de Golf",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.65,
		["Economy"] = 975
	},
	["WEAPON_HAMMER"] = {
		["Index"] = "hammer",
		["Name"] = "Martelo",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.45,
		["Economy"] = 975
	},
	["WEAPON_MACHETE"] = {
		["Index"] = "machete",
		["Name"] = "Facão",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.35,
		["Economy"] = 975
	},
	["WEAPON_POOLCUE"] = {
		["Index"] = "poolcue",
		["Name"] = "Taco de Sinuca",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.25,
		["Economy"] = 975
	},
	["WEAPON_STONE_HATCHET"] = {
		["Index"] = "stonehatchet",
		["Name"] = "Machado de Pedra",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.55,
		["Economy"] = 975
	},
	["WEAPON_WRENCH"] = {
		["Index"] = "wrench",
		["Name"] = "Chave Inglesa",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.45,
		["Economy"] = 725
	},
	["WEAPON_KNUCKLE"] = {
		["Index"] = "knuckle",
		["Name"] = "Soco Inglês",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.15,
		["Economy"] = 975
	},
	["WEAPON_FLASHLIGHT"] = {
		["Index"] = "flashlight",
		["Name"] = "Lanterna",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.15,
		["Economy"] = 975
	},
	["WEAPON_NIGHTSTICK"] = {
		["Index"] = "nightstick",
		["Name"] = "Cassetete",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 7,
		["Weight"] = 1.15,
		["Economy"] = 125
	},
	["WEAPON_PISTOL"] = {
		["Index"] = "m1911",
		["Name"] = "M1911",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 5750
	},
	["WEAPON_PISTOL_MK2"] = {
		["Index"] = "fiveseven",
		["Name"] = "FN Five Seven",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 6225
	},
	["WEAPON_COMPACTRIFLE"] = {
		["Index"] = "akcompact",
		["Name"] = "AK Compact",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 14,
		["Weight"] = 4.25,
		["Economy"] = 13250
	},
	["WEAPON_APPISTOL"] = {
		["Index"] = "kochvp9",
		["Name"] = "Koch Vp9",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 6250
	},
	["WEAPON_HEAVYPISTOL"] = {
		["Index"] = "atifx45",
		["Name"] = "Ati FX45",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 725
	},
	["WEAPON_MACHINEPISTOL"] = {
		["Index"] = "tec9",
		["Name"] = "Tec-9",
		["Type"] = "Armamento",
		["Repair"] = "repairkit03",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 8250
	},
	["WEAPON_MICROSMG"] = {
		["Index"] = "uzi",
		["Name"] = "Uzi",
		["Type"] = "Armamento",
		["Repair"] = "repairkit03",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 4.25,
		["Economy"] = 13250
	},
	["WEAPON_NAILGUN"] = {
		["Index"] = "nailgun",
		["Name"] = "Arma de Prego",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_NAIL_AMMO",
		["Durability"] = 7,
		["Vehicle"] = false,
		["Weight"] = 4.25,
		["Economy"] = 3250
	},
	["WEAPON_MINISMG"] = {
		["Index"] = "skorpionv61",
		["Name"] = "Skorpion V61",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 5.25,
		["Economy"] = 13250
	},
	["WEAPON_SNSPISTOL"] = {
		["Index"] = "amt380",
		["Name"] = "AMT 380",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 4750
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		["Index"] = "hkp7m10",
		["Name"] = "HK P7M10",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 5250
	},
	["WEAPON_VINTAGEPISTOL"] = {
		["Index"] = "m1922",
		["Name"] = "M1922",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 4750
	},
	["WEAPON_PISTOL50"] = {
		["Index"] = "desert",
		["Name"] = "Desert Eagle",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.75,
		["Economy"] = 8250
	},
	["WEAPON_REVOLVER"] = {
		["Index"] = "magnum",
		["Name"] = "Magnum 44",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 4.25,
		["Economy"] = 8250
	},
	["WEAPON_COMBATPISTOL"] = {
		["Index"] = "glock",
		["Name"] = "Glock",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 14,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 625
	},
	["WEAPON_PARAFAL"] = {
		["Index"] = "parafal",
		["Name"] = "PARA-FAL M964A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 775
	},
	["WEAPON_FNFAL"] = {
		["Index"] = "fnfal",
		["Name"] = "FN L1A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 775
	},
	["WEAPON_COLTXM177"] = {
		["Index"] = "coltxm177",
		["Name"] = "Colt XM177",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 775
	},
	["WEAPON_CARBINERIFLE"] = {
		["Index"] = "m4a1",
		["Name"] = "M4A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 775
	},
	["WEAPON_CARBINERIFLE_MK2"] = {
		["Index"] = "m4a4",
		["Name"] = "M4A4",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 8.75,
		["Economy"] = 925
	},
	["WEAPON_ADVANCEDRIFLE"] = {
		["Index"] = "tar21",
		["Name"] = "Tar-21",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 25000
	},
	["WEAPON_BULLPUPRIFLE"] = {
		["Index"] = "qbz95",
		["Name"] = "QBZ-95",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 25000
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		["Index"] = "l85",
		["Name"] = "L85",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 25000
	},
	["WEAPON_SPECIALCARBINE"] = {
		["Index"] = "g36c",
		["Name"] = "G36C",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 8.75,
		["Economy"] = 25000
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		["Index"] = "sigsauer556",
		["Name"] = "Sig Sauer 556",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 8.75,
		["Economy"] = 25000
	},
	["WEAPON_PUMPSHOTGUN"] = {
		["Index"] = "mossberg590",
		["Name"] = "Mossberg 590",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.25,
		["Economy"] = 775
	},
	["WEAPON_PUMPSHOTGUN_MK2"] = {
		["Index"] = "mossberg590a1",
		["Name"] = "Mossberg 590A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.25,
		["Economy"] = 15250
	},
	["WEAPON_MUSKET"] = {
		["Index"] = "winchester",
		["Name"] = "Winchester 1892",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_MUSKET_AMMO",
		["Durability"] = 21,
		["Weight"] = 6.25,
		["Economy"] = 3250
	},
	["WEAPON_SAWNOFFSHOTGUN"] = {
		["Index"] = "mossberg500",
		["Name"] = "Mossberg 500",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 13250
	},
	["WEAPON_SMG"] = {
		["Index"] = "mp5",
		["Name"] = "MP5",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.25,
		["Economy"] = 775
	},
	["WEAPON_SMG_MK2"] = {
		["Index"] = "evo3",
		["Name"] = "Evo-3",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Vehicle"] = true,
		["Weight"] = 5.25,
		["Economy"] = 15250
	},
	["WEAPON_ASSAULTRIFLE"] = {
		["Index"] = "ak103",
		["Name"] = "AK-103",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 25000
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		["Index"] = "ak74",
		["Name"] = "AK-74",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 7.75,
		["Economy"] = 25000
	},
	["WEAPON_ASSAULTSMG"] = {
		["Index"] = "steyraug",
		["Name"] = "Steyr AUG",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 21,
		["Weight"] = 5.75,
		["Economy"] = 15250
	},
	["WEAPON_GUSENBERG"] = {
		["Index"] = "thompson",
		["Name"] = "Thompson",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 21,
		["Weight"] = 6.25,
		["Economy"] = 15250
	},
	["WEAPON_PETROLCAN"] = {
		["Index"] = "gallon",
		["Name"] = "Galão",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PETROLCAN_AMMO",
		["Weight"] = 1.25,
		["Economy"] = 50
	},
	["GADGET_PARACHUTE"] = {
		["Index"] = "parachute",
		["Name"] = "Paraquedas",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 475
	},
	["WEAPON_STUNGUN"] = {
		["Index"] = "stungun",
		["Name"] = "Tazer",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Durability"] = 21,
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["WEAPON_NAIL_AMMO"] = {
		["Index"] = "nails",
		["Name"] = "Pregos",
		["Type"] = "Munição",
		["Weight"] = 0.05,
		["Economy"] = 2
	},
	["WEAPON_PISTOL_AMMO"] = {
		["Index"] = "pistolammo",
		["Name"] = "Munição de Pistola",
		["Type"] = "Munição",
		["Weight"] = 0.035,
		["Economy"] = 30
	},
	["WEAPON_SMG_AMMO"] = {
		["Index"] = "smgammo",
		["Name"] = "Munição de Sub",
		["Type"] = "Munição",
		["Weight"] = 0.045,
		["Economy"] = 35
	},
	["WEAPON_RIFLE_AMMO"] = {
		["Index"] = "rifleammo",
		["Name"] = "Munição de Rifle",
		["Type"] = "Munição",
		["Weight"] = 0.055,
		["Economy"] = 35
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		["Index"] = "shotgunammo",
		["Name"] = "Munição de Escopeta",
		["Type"] = "Munição",
		["Weight"] = 0.075,
		["Economy"] = 30
	},
	["WEAPON_MUSKET_AMMO"] = {
		["Index"] = "musketammo",
		["Name"] = "Munição de Mosquete",
		["Type"] = "Munição",
		["Weight"] = 0.075,
		["Economy"] = 7
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		["Index"] = "fuel",
		["Name"] = "Combustível",
		["Type"] = "Munição",
		["Weight"] = 0.001,
		["Economy"] = 0
	},
	["WEAPON_BRICK"] = {
		["Index"] = "brick",
		["Name"] = "Tijolo",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.75,
		["Economy"] = 25
	},
	["WEAPON_SNOWBALL"] = {
		["Index"] = "snowball",
		["Name"] = "Bola de Neve",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.55,
		["Economy"] = 6
	},
	["WEAPON_SHOES"] = {
		["Index"] = "shoes",
		["Name"] = "Tênis",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.755,
		["Economy"] = 25
	},
	["WEAPON_MOLOTOV"] = {
		["Index"] = "molotov",
		["Name"] = "Coquetel Molotov",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.95,
		["Economy"] = 225,
		["Max"] = 3
	},
	["WEAPON_SMOKEGRENADE"] = {
		["Index"] = "smokegrenade",
		["Name"] = "Granada de Fumaça",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.95,
		["Economy"] = 225,
		["Max"] = 3
	},
	["pager"] = {
		["Index"] = "pager",
		["Name"] = "Pager",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 125
	},
	["firecracker"] = {
		["Index"] = "firecracker",
		["Name"] = "Fogos de Artificio",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 100
	},
	["analgesic"] = {
		["Index"] = "analgesic",
		["Name"] = "Analgésico",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Max"] = 5,
		["Economy"] = 125
	},
	["oxy"] = {
		["Index"] = "analgesic",
		["Name"] = "Oxy",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Max"] = 5,
		["Economy"] = 35
	},
	["gauze"] = {
		["Index"] = "gauze",
		["Name"] = "Ataduras",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Max"] = 5,
		["Economy"] = 100
	},
	["gsrkit"] = {
		["Index"] = "gsrkit",
		["Name"] = "Kit Residual",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 20
	},
	["gdtkit"] = {
		["Index"] = "gdtkit",
		["Name"] = "Kit Químico",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 20
	},
	["emerald"] = {
		["Index"] = "emerald",
		["Name"] = "Esmeralda",
		["Type"] = "Comum",
		["Weight"] = 0.95,
		["Economy"] = 85
	},
	["diamond"] = {
		["Index"] = "diamond",
		["Name"] = "Diamante",
		["Type"] = "Comum",
		["Weight"] = 0.95,
		["Economy"] = 75
	},
	["ruby"] = {
		["Index"] = "ruby",
		["Name"] = "Rubi",
		["Type"] = "Comum",
		["Weight"] = 0.85,
		["Economy"] = 55
	},
	["sapphire"] = {
		["Index"] = "sapphire",
		["Name"] = "Safira",
		["Type"] = "Comum",
		["Weight"] = 0.85,
		["Economy"] = 45
	},
	["amethyst"] = {
		["Index"] = "amethyst",
		["Name"] = "Ametista",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 35
	},
	["amber"] = {
		["Index"] = "amber",
		["Name"] = "Âmbar",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 25
	},
	["turquoise"] = {
		["Index"] = "turquoise",
		["Name"] = "Turquesa",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 15
	},
	["keyboard"] = {
		["Index"] = "keyboard",
		["Name"] = "Teclado",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["mouse"] = {
		["Index"] = "mouse",
		["Name"] = "Mouse",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["silverring"] = {
		["Index"] = "silverring",
		["Name"] = "Anel de Prata",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["goldring"] = {
		["Index"] = "goldring",
		["Name"] = "Anel de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 100
	},
	["silvercoin"] = {
		["Index"] = "silvercoin",
		["Name"] = "Moeda de Prata",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 20
	},
	["goldcoin"] = {
		["Index"] = "goldcoin",
		["Name"] = "Moeda de Ouro",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 40
	},
	["watch"] = {
		["Index"] = "watch",
		["Name"] = "Relógio",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["playstation"] = {
		["Index"] = "playstation",
		["Name"] = "Playstation",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 75
	},
	["xbox"] = {
		["Index"] = "xbox",
		["Name"] = "Xbox",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 75
	},
	["legos"] = {
		["Index"] = "legos",
		["Name"] = "Legos",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["ominitrix"] = {
		["Index"] = "ominitrix",
		["Name"] = "Ominitrix",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["bracelet"] = {
		["Index"] = "bracelet",
		["Name"] = "Bracelete",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["dildo"] = {
		["Index"] = "dildo",
		["Name"] = "Vibrador",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["spray01"] = {
		["Index"] = "spray01",
		["Name"] = "Desodorante 24hrs",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["spray02"] = {
		["Index"] = "spray02",
		["Name"] = "Antisséptico",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["spray03"] = {
		["Index"] = "spray03",
		["Name"] = "Desodorante 48hrs",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["spray04"] = {
		["Index"] = "spray04",
		["Name"] = "Desodorante 72hrs",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["dices"] = {
		["Index"] = "dices",
		["Name"] = "Dados",
		["Type"] = "Usável",
		["Weight"] = 0.35,
		["Economy"] = 45
	},
	["dish"] = {
		["Index"] = "dish",
		["Name"] = "Prato",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 75
	},
	["pan"] = {
		["Index"] = "pan",
		["Name"] = "Panela",
		["Type"] = "Usável",
		["Weight"] = 0.55,
		["Economy"] = 100
	},
	["fan"] = {
		["Index"] = "fan",
		["Name"] = "Ventilador",
		["Type"] = "Comum",
		["Weight"] = 1.15,
		["Economy"] = 75
	},
	["rimel"] = {
		["Index"] = "rimel",
		["Name"] = "Rímel",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["blender"] = {
		["Index"] = "blender",
		["Name"] = "Liquidificador",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["switch"] = {
		["Index"] = "switch",
		["Name"] = "Interruptor",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 45
	},
	["horseshoe"] = {
		["Index"] = "horseshoe",
		["Name"] = "Ferradura",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["brush"] = {
		["Index"] = "brush",
		["Name"] = "Escova",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	["domino"] = {
		["Index"] = "domino",
		["Name"] = "Dominó",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 45
	},
	["floppy"] = {
		["Index"] = "floppy",
		["Name"] = "Disquete",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 45
	},
	["cup"] = {
		["Index"] = "cup",
		["Name"] = "Cálice",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 100
	},
	["deck"] = {
		["Index"] = "deck",
		["Name"] = "Baralho",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	["eraser"] = {
		["Index"] = "eraser",
		["Name"] = "Apagador",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 75
	},
	["pliers"] = {
		["Index"] = "pliers",
		["Name"] = "Alicate",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 55
	},
	["lampshade"] = {
		["Index"] = "lampshade",
		["Name"] = "Abajur",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 75
	},
	["soap"] = {
		["Index"] = "soap",
		["Name"] = "Sabonete",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	["slipper"] = {
		["Index"] = "slipper",
		["Name"] = "Chinelo",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 75
	},
	["pendrive"] = {
		["Index"] = "pendrive",
		["Name"] = "Pendrive",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 7,
		["Weight"] = 0.75,
		["Economy"] = 325
	},
	["pokeball"] = {
		["Index"] = "pokeball",
		["Name"] = "Pokebola",
		["Description"] = "Dentro possuí um pokemon aleatório que quando jogada você captura um deles.",
		["Type"] = "Usável",
		["Weight"] = 0.10,
		["Economy"] = 1000
	},
	["pokemon001"] = {
		["Index"] = "pokemon001",
		["Name"] = "Bulbasaur",
		["Description"] = "Colecionável <green>Nº 001</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon002"] = {
		["Index"] = "pokemon002",
		["Name"] = "Ivysaur",
		["Description"] = "Colecionável <green>Nº 002</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon003"] = {
		["Index"] = "pokemon003",
		["Name"] = "Venusaur",
		["Description"] = "Colecionável <green>Nº 003</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon004"] = {
		["Index"] = "pokemon004",
		["Name"] = "Charmander",
		["Description"] = "Colecionável <green>Nº 004</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon005"] = {
		["Index"] = "pokemon005",
		["Name"] = "Charmeleon",
		["Description"] = "Colecionável <green>Nº 005</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon006"] = {
		["Index"] = "pokemon006",
		["Name"] = "Charizard",
		["Description"] = "Colecionável <green>Nº 006</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon007"] = {
		["Index"] = "pokemon007",
		["Name"] = "Squirtle",
		["Description"] = "Colecionável <green>Nº 007</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon008"] = {
		["Index"] = "pokemon008",
		["Name"] = "Wartortle",
		["Description"] = "Colecionável <green>Nº 008</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon009"] = {
		["Index"] = "pokemon009",
		["Name"] = "Blastoise",
		["Description"] = "Colecionável <green>Nº 009</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon010"] = {
		["Index"] = "pokemon010",
		["Name"] = "Caterpie",
		["Description"] = "Colecionável <green>Nº 010</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon011"] = {
		["Index"] = "pokemon011",
		["Name"] = "Metapod",
		["Description"] = "Colecionável <green>Nº 011</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon012"] = {
		["Index"] = "pokemon012",
		["Name"] = "Butterfree",
		["Description"] = "Colecionável <green>Nº 012</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon013"] = {
		["Index"] = "pokemon013",
		["Name"] = "Weedle",
		["Description"] = "Colecionável <green>Nº 013</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon014"] = {
		["Index"] = "pokemon014",
		["Name"] = "Kakuna",
		["Description"] = "Colecionável <green>Nº 014</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon015"] = {
		["Index"] = "pokemon015",
		["Name"] = "Beedrill",
		["Description"] = "Colecionável <green>Nº 015</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon016"] = {
		["Index"] = "pokemon016",
		["Name"] = "Pidgey",
		["Description"] = "Colecionável <green>Nº 016</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon017"] = {
		["Index"] = "pokemon017",
		["Name"] = "Pidgeotto",
		["Description"] = "Colecionável <green>Nº 017</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon018"] = {
		["Index"] = "pokemon018",
		["Name"] = "Pidgeot",
		["Description"] = "Colecionável <green>Nº 018</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon019"] = {
		["Index"] = "pokemon019",
		["Name"] = "Rattata",
		["Description"] = "Colecionável <green>Nº 019</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon020"] = {
		["Index"] = "pokemon020",
		["Name"] = "Raticate",
		["Description"] = "Colecionável <green>Nº 020</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon021"] = {
		["Index"] = "pokemon021",
		["Name"] = "Spearow",
		["Description"] = "Colecionável <green>Nº 021</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon022"] = {
		["Index"] = "pokemon022",
		["Name"] = "Fearow",
		["Description"] = "Colecionável <green>Nº 022</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon023"] = {
		["Index"] = "pokemon023",
		["Name"] = "Ekans",
		["Description"] = "Colecionável <green>Nº 023</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon024"] = {
		["Index"] = "pokemon024",
		["Name"] = "Arbok",
		["Description"] = "Colecionável <green>Nº 024</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon025"] = {
		["Index"] = "pokemon025",
		["Name"] = "Pikachu",
		["Description"] = "Colecionável <green>Nº 025</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon026"] = {
		["Index"] = "pokemon026",
		["Name"] = "Raichu",
		["Description"] = "Colecionável <green>Nº 026</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon027"] = {
		["Index"] = "pokemon027",
		["Name"] = "Sandshrew",
		["Description"] = "Colecionável <green>Nº 027</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon028"] = {
		["Index"] = "pokemon028",
		["Name"] = "Sandslash",
		["Description"] = "Colecionável <green>Nº 028</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon029"] = {
		["Index"] = "pokemon029",
		["Name"] = "Nidoran ♀",
		["Description"] = "Colecionável <green>Nº 029</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon030"] = {
		["Index"] = "pokemon030",
		["Name"] = "Nidorina",
		["Description"] = "Colecionável <green>Nº 030</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon031"] = {
		["Index"] = "pokemon031",
		["Name"] = "Nidoqueen",
		["Description"] = "Colecionável <green>Nº 031</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon032"] = {
		["Index"] = "pokemon032",
		["Name"] = "Nidoran ♂",
		["Description"] = "Colecionável <green>Nº 032</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon033"] = {
		["Index"] = "pokemon033",
		["Name"] = "Nidorino",
		["Description"] = "Colecionável <green>Nº 033</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon034"] = {
		["Index"] = "pokemon034",
		["Name"] = "Nidoking",
		["Description"] = "Colecionável <green>Nº 034</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon035"] = {
		["Index"] = "pokemon035",
		["Name"] = "Clefairy",
		["Description"] = "Colecionável <green>Nº 035</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon036"] = {
		["Index"] = "pokemon036",
		["Name"] = "Clefable",
		["Description"] = "Colecionável <green>Nº 036</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon037"] = {
		["Index"] = "pokemon037",
		["Name"] = "Vulpix",
		["Description"] = "Colecionável <green>Nº 037</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon038"] = {
		["Index"] = "pokemon038",
		["Name"] = "Ninetales",
		["Description"] = "Colecionável <green>Nº 038</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon039"] = {
		["Index"] = "pokemon039",
		["Name"] = "Jigglypuff",
		["Description"] = "Colecionável <green>Nº 039</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon040"] = {
		["Index"] = "pokemon040",
		["Name"] = "Wigglytuff",
		["Description"] = "Colecionável <green>Nº 040</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon041"] = {
		["Index"] = "pokemon041",
		["Name"] = "Zubat",
		["Description"] = "Colecionável <green>Nº 041</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon042"] = {
		["Index"] = "pokemon042",
		["Name"] = "Golbat",
		["Description"] = "Colecionável <green>Nº 042</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon043"] = {
		["Index"] = "pokemon043",
		["Name"] = "Oddish",
		["Description"] = "Colecionável <green>Nº 043</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon044"] = {
		["Index"] = "pokemon044",
		["Name"] = "Gloom",
		["Description"] = "Colecionável <green>Nº 044</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon045"] = {
		["Index"] = "pokemon045",
		["Name"] = "Vileplume",
		["Description"] = "Colecionável <green>Nº 045</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon046"] = {
		["Index"] = "pokemon046",
		["Name"] = "Paras",
		["Description"] = "Colecionável <green>Nº 046</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon047"] = {
		["Index"] = "pokemon047",
		["Name"] = "Parasect",
		["Description"] = "Colecionável <green>Nº 047</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon048"] = {
		["Index"] = "pokemon048",
		["Name"] = "Venonat",
		["Description"] = "Colecionável <green>Nº 048</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon049"] = {
		["Index"] = "pokemon049",
		["Name"] = "Venomoth",
		["Description"] = "Colecionável <green>Nº 049</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon050"] = {
		["Index"] = "pokemon050",
		["Name"] = "Diglett",
		["Description"] = "Colecionável <green>Nº 050</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon051"] = {
		["Index"] = "pokemon051",
		["Name"] = "Dugtrio",
		["Description"] = "Colecionável <green>Nº 051</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon052"] = {
		["Index"] = "pokemon052",
		["Name"] = "Meowth",
		["Description"] = "Colecionável <green>Nº 052</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon053"] = {
		["Index"] = "pokemon053",
		["Name"] = "Persian",
		["Description"] = "Colecionável <green>Nº 053</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon054"] = {
		["Index"] = "pokemon054",
		["Name"] = "Psyduck",
		["Description"] = "Colecionável <green>Nº 054</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon055"] = {
		["Index"] = "pokemon055",
		["Name"] = "Golduck",
		["Description"] = "Colecionável <green>Nº 055</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon056"] = {
		["Index"] = "pokemon056",
		["Name"] = "Mankey",
		["Description"] = "Colecionável <green>Nº 056</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon057"] = {
		["Index"] = "pokemon057",
		["Name"] = "Primeape",
		["Description"] = "Colecionável <green>Nº 057</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon058"] = {
		["Index"] = "pokemon058",
		["Name"] = "Growlithe",
		["Description"] = "Colecionável <green>Nº 058</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon059"] = {
		["Index"] = "pokemon059",
		["Name"] = "Arcanine",
		["Description"] = "Colecionável <green>Nº 059</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon060"] = {
		["Index"] = "pokemon060",
		["Name"] = "Poliwag",
		["Description"] = "Colecionável <green>Nº 060</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon061"] = {
		["Index"] = "pokemon061",
		["Name"] = "Poliwhirl",
		["Description"] = "Colecionável <green>Nº 061</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon062"] = {
		["Index"] = "pokemon062",
		["Name"] = "Poliwrath",
		["Description"] = "Colecionável <green>Nº 062</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon063"] = {
		["Index"] = "pokemon063",
		["Name"] = "Abra",
		["Description"] = "Colecionável <green>Nº 063</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon064"] = {
		["Index"] = "pokemon064",
		["Name"] = "Kadabra",
		["Description"] = "Colecionável <green>Nº 064</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon065"] = {
		["Index"] = "pokemon065",
		["Name"] = "Alakazam",
		["Description"] = "Colecionável <green>Nº 065</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon066"] = {
		["Index"] = "pokemon066",
		["Name"] = "Machop",
		["Description"] = "Colecionável <green>Nº 066</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon067"] = {
		["Index"] = "pokemon067",
		["Name"] = "Machoke",
		["Description"] = "Colecionável <green>Nº 067</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon068"] = {
		["Index"] = "pokemon068",
		["Name"] = "Machamp",
		["Description"] = "Colecionável <green>Nº 068</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon069"] = {
		["Index"] = "pokemon069",
		["Name"] = "Bellsprout",
		["Description"] = "Colecionável <green>Nº 069</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon070"] = {
		["Index"] = "pokemon070",
		["Name"] = "Weepinbell",
		["Description"] = "Colecionável <green>Nº 070</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon071"] = {
		["Index"] = "pokemon071",
		["Name"] = "Victreebel",
		["Description"] = "Colecionável <green>Nº 071</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon072"] = {
		["Index"] = "pokemon072",
		["Name"] = "Tentacool",
		["Description"] = "Colecionável <green>Nº 072</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon073"] = {
		["Index"] = "pokemon073",
		["Name"] = "Tentacruel",
		["Description"] = "Colecionável <green>Nº 073</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon074"] = {
		["Index"] = "pokemon074",
		["Name"] = "Geodude",
		["Description"] = "Colecionável <green>Nº 074</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon075"] = {
		["Index"] = "pokemon075",
		["Name"] = "Graveler",
		["Description"] = "Colecionável <green>Nº 075</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon076"] = {
		["Index"] = "pokemon076",
		["Name"] = "Golem",
		["Description"] = "Colecionável <green>Nº 076</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon077"] = {
		["Index"] = "pokemon077",
		["Name"] = "Ponyta",
		["Description"] = "Colecionável <green>Nº 077</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon078"] = {
		["Index"] = "pokemon078",
		["Name"] = "Rapidash",
		["Description"] = "Colecionável <green>Nº 078</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon079"] = {
		["Index"] = "pokemon079",
		["Name"] = "Slowpoke",
		["Description"] = "Colecionável <green>Nº 079</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon080"] = {
		["Index"] = "pokemon080",
		["Name"] = "Slowbro",
		["Description"] = "Colecionável <green>Nº 080</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon081"] = {
		["Index"] = "pokemon081",
		["Name"] = "Magnemite",
		["Description"] = "Colecionável <green>Nº 081</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon082"] = {
		["Index"] = "pokemon082",
		["Name"] = "Magneton",
		["Description"] = "Colecionável <green>Nº 082</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon083"] = {
		["Index"] = "pokemon083",
		["Name"] = "Farfetch'd",
		["Description"] = "Colecionável <green>Nº 083</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon084"] = {
		["Index"] = "pokemon084",
		["Name"] = "Doduo",
		["Description"] = "Colecionável <green>Nº 084</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon085"] = {
		["Index"] = "pokemon085",
		["Name"] = "Dodrio",
		["Description"] = "Colecionável <green>Nº 085</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon086"] = {
		["Index"] = "pokemon086",
		["Name"] = "Seel",
		["Description"] = "Colecionável <green>Nº 086</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon087"] = {
		["Index"] = "pokemon087",
		["Name"] = "Dewgong",
		["Description"] = "Colecionável <green>Nº 087</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon088"] = {
		["Index"] = "pokemon088",
		["Name"] = "Grimer",
		["Description"] = "Colecionável <green>Nº 088</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon089"] = {
		["Index"] = "pokemon089",
		["Name"] = "Muk",
		["Description"] = "Colecionável <green>Nº 089</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon090"] = {
		["Index"] = "pokemon090",
		["Name"] = "Shellder",
		["Description"] = "Colecionável <green>Nº 090</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon091"] = {
		["Index"] = "pokemon091",
		["Name"] = "Cloyster",
		["Description"] = "Colecionável <green>Nº 091</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon092"] = {
		["Index"] = "pokemon092",
		["Name"] = "Gastly",
		["Description"] = "Colecionável <green>Nº 092</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon093"] = {
		["Index"] = "pokemon093",
		["Name"] = "Haunter",
		["Description"] = "Colecionável <green>Nº 093</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon094"] = {
		["Index"] = "pokemon094",
		["Name"] = "Gengar",
		["Description"] = "Colecionável <green>Nº 094</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon095"] = {
		["Index"] = "pokemon095",
		["Name"] = "Onix",
		["Description"] = "Colecionável <green>Nº 095</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon096"] = {
		["Index"] = "pokemon096",
		["Name"] = "Drowzee",
		["Description"] = "Colecionável <green>Nº 096</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon097"] = {
		["Index"] = "pokemon097",
		["Name"] = "Hypno",
		["Description"] = "Colecionável <green>Nº 097</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon098"] = {
		["Index"] = "pokemon098",
		["Name"] = "Krabby",
		["Description"] = "Colecionável <green>Nº 098</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon099"] = {
		["Index"] = "pokemon099",
		["Name"] = "Kingler",
		["Description"] = "Colecionável <green>Nº 099</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon100"] = {
		["Index"] = "pokemon100",
		["Name"] = "Voltorb",
		["Description"] = "Colecionável <green>Nº 100</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon101"] = {
		["Index"] = "pokemon101",
		["Name"] = "Electrode",
		["Description"] = "Colecionável <green>Nº 101</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon102"] = {
		["Index"] = "pokemon102",
		["Name"] = "Exeggcute",
		["Description"] = "Colecionável <green>Nº 102</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon103"] = {
		["Index"] = "pokemon103",
		["Name"] = "Exeggutor",
		["Description"] = "Colecionável <green>Nº 103</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon104"] = {
		["Index"] = "pokemon104",
		["Name"] = "Cubone",
		["Description"] = "Colecionável <green>Nº 104</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon105"] = {
		["Index"] = "pokemon105",
		["Name"] = "Marowak",
		["Description"] = "Colecionável <green>Nº 105</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon106"] = {
		["Index"] = "pokemon106",
		["Name"] = "Hitmonlee",
		["Description"] = "Colecionável <green>Nº 106</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon107"] = {
		["Index"] = "pokemon107",
		["Name"] = "Hitmonchan",
		["Description"] = "Colecionável <green>Nº 107</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon108"] = {
		["Index"] = "pokemon108",
		["Name"] = "Lickitung",
		["Description"] = "Colecionável <green>Nº 108</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon109"] = {
		["Index"] = "pokemon109",
		["Name"] = "Koffing",
		["Description"] = "Colecionável <green>Nº 109</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon110"] = {
		["Index"] = "pokemon110",
		["Name"] = "Weezing",
		["Description"] = "Colecionável <green>Nº 110</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon111"] = {
		["Index"] = "pokemon111",
		["Name"] = "Rhyhorn",
		["Description"] = "Colecionável <green>Nº 111</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon112"] = {
		["Index"] = "pokemon112",
		["Name"] = "Rhydon",
		["Description"] = "Colecionável <green>Nº 112</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon113"] = {
		["Index"] = "pokemon113",
		["Name"] = "Chansey",
		["Description"] = "Colecionável <green>Nº 113</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon114"] = {
		["Index"] = "pokemon114",
		["Name"] = "Tangela",
		["Description"] = "Colecionável <green>Nº 114</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon115"] = {
		["Index"] = "pokemon115",
		["Name"] = "Kangaskhan",
		["Description"] = "Colecionável <green>Nº 115</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon116"] = {
		["Index"] = "pokemon116",
		["Name"] = "Horsea",
		["Description"] = "Colecionável <green>Nº 116</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon117"] = {
		["Index"] = "pokemon117",
		["Name"] = "Seadra",
		["Description"] = "Colecionável <green>Nº 117</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon118"] = {
		["Index"] = "pokemon118",
		["Name"] = "Goldeen",
		["Description"] = "Colecionável <green>Nº 118</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon119"] = {
		["Index"] = "pokemon119",
		["Name"] = "Seaking",
		["Description"] = "Colecionável <green>Nº 119</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon120"] = {
		["Index"] = "pokemon120",
		["Name"] = "Staryu",
		["Description"] = "Colecionável <green>Nº 120</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon121"] = {
		["Index"] = "pokemon121",
		["Name"] = "Starmie",
		["Description"] = "Colecionável <green>Nº 121</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon122"] = {
		["Index"] = "pokemon122",
		["Name"] = "Mr. Mime",
		["Description"] = "Colecionável <green>Nº 122</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon123"] = {
		["Index"] = "pokemon123",
		["Name"] = "Scyther",
		["Description"] = "Colecionável <green>Nº 123</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon124"] = {
		["Index"] = "pokemon124",
		["Name"] = "Jynx",
		["Description"] = "Colecionável <green>Nº 124</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon125"] = {
		["Index"] = "pokemon125",
		["Name"] = "Electabuzz",
		["Description"] = "Colecionável <green>Nº 125</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon126"] = {
		["Index"] = "pokemon126",
		["Name"] = "Magmar",
		["Description"] = "Colecionável <green>Nº 126</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon127"] = {
		["Index"] = "pokemon127",
		["Name"] = "Pinsir",
		["Description"] = "Colecionável <green>Nº 127</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon128"] = {
		["Index"] = "pokemon128",
		["Name"] = "Tauros",
		["Description"] = "Colecionável <green>Nº 128</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon129"] = {
		["Index"] = "pokemon129",
		["Name"] = "Magikarp",
		["Description"] = "Colecionável <green>Nº 129</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon130"] = {
		["Index"] = "pokemon130",
		["Name"] = "Gyarados",
		["Description"] = "Colecionável <green>Nº 130</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon131"] = {
		["Index"] = "pokemon131",
		["Name"] = "Lapras",
		["Description"] = "Colecionável <green>Nº 131</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon132"] = {
		["Index"] = "pokemon132",
		["Name"] = "Ditto",
		["Description"] = "Colecionável <green>Nº 132</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon133"] = {
		["Index"] = "pokemon133",
		["Name"] = "Eevee",
		["Description"] = "Colecionável <green>Nº 133</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon134"] = {
		["Index"] = "pokemon134",
		["Name"] = "Vaporeon",
		["Description"] = "Colecionável <green>Nº 134</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon135"] = {
		["Index"] = "pokemon135",
		["Name"] = "Jolteon",
		["Description"] = "Colecionável <green>Nº 135</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon136"] = {
		["Index"] = "pokemon136",
		["Name"] = "Flareon",
		["Description"] = "Colecionável <green>Nº 136</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon137"] = {
		["Index"] = "pokemon137",
		["Name"] = "Porygon",
		["Description"] = "Colecionável <green>Nº 137</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon138"] = {
		["Index"] = "pokemon138",
		["Name"] = "Omanyte",
		["Description"] = "Colecionável <green>Nº 138</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon139"] = {
		["Index"] = "pokemon139",
		["Name"] = "Omastar",
		["Description"] = "Colecionável <green>Nº 139</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon140"] = {
		["Index"] = "pokemon140",
		["Name"] = "Kabuto",
		["Description"] = "Colecionável <green>Nº 140</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon141"] = {
		["Index"] = "pokemon141",
		["Name"] = "Kabutops",
		["Description"] = "Colecionável <green>Nº 141</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon142"] = {
		["Index"] = "pokemon142",
		["Name"] = "Aerodactyl",
		["Description"] = "Colecionável <green>Nº 142</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon143"] = {
		["Index"] = "pokemon143",
		["Name"] = "Snorlax",
		["Description"] = "Colecionável <green>Nº 143</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon144"] = {
		["Index"] = "pokemon144",
		["Name"] = "Articuno",
		["Description"] = "Colecionável <green>Nº 144</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon145"] = {
		["Index"] = "pokemon145",
		["Name"] = "Zapdos",
		["Description"] = "Colecionável <green>Nº 145</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon146"] = {
		["Index"] = "pokemon146",
		["Name"] = "Moltres",
		["Description"] = "Colecionável <green>Nº 146</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon147"] = {
		["Index"] = "pokemon147",
		["Name"] = "Dratini",
		["Description"] = "Colecionável <green>Nº 147</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon148"] = {
		["Index"] = "pokemon148",
		["Name"] = "Dragonair",
		["Description"] = "Colecionável <green>Nº 148</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon149"] = {
		["Index"] = "pokemon149",
		["Name"] = "Dragonite",
		["Description"] = "Colecionável <green>Nº 149</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon150"] = {
		["Index"] = "pokemon150",
		["Name"] = "Mewtwo",
		["Description"] = "Colecionável <green>Nº 150</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon151"] = {
		["Index"] = "pokemon151",
		["Name"] = "Mew",
		["Description"] = "Colecionável <green>Nº 151</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	}

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBody(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] then
		return List[Item]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEX
-----------------------------------------------------------------------------------------------------------------------------------------
function itemIndex(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Index"] then
		return List[Item]["Index"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAME
-----------------------------------------------------------------------------------------------------------------------------------------
function itemName(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Name"] then
		return List[Item]["Name"]
	end

	return "Deletado"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemType(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Type"] then
		return List[Item]["Type"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMO
-----------------------------------------------------------------------------------------------------------------------------------------
function itemAmmo(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Ammo"] then
		return List[Item]["Ammo"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemVehicle(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Vehicle"] then
		return List[Item]["Vehicle"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemWeight(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Weight"] then
		return List[Item]["Weight"] + 0.0
	end

	return 0.0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMMAXAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemMaxAmount(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Max"] then
		return List[Item]["Max"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMSCAPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemScape(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Scape"] then
		return List[Item]["Scape"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDESCRIPTION
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDescription(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Description"] then
		return List[Item]["Description"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDurability(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Durability"] then
		return List[Item]["Durability"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMCHARGES
-----------------------------------------------------------------------------------------------------------------------------------------
function itemCharges(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Charges"] then
		return List[Item]["Charges"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMECONOMY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemEconomy(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Economy"] then
		return List[Item]["Economy"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBlock(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Block"] then
		return List[Item]["Block"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMREPAIR
-----------------------------------------------------------------------------------------------------------------------------------------
function itemRepair(Item)
	local Split = splitString(Item,"-")
	local Item = Split[1]

	if List[Item] and List[Item]["Repair"] then
		return List[Item]["Repair"]
	end

	return false
end