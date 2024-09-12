Config = {}

-------------------- Comandos --------------------
-- /eadm (empresa) -- Acessa a empresa que deseja Sem os ()
-- /removeblacklist (passaporte) -- Remove a blacklist do passaporte desejado Sem os ()
-- /elistar -- Lista todas as empresas criadas no script
-- /empresa -- Acessa a empresa que esta registrado
-------------------------------------------------

Config.comando_blacklist = "rbl"
Config.log_blacklist = "https://discord.com/api/webhooks/1263893038779072523/VEvItVYG9WqW35bBtkvAID0t1ZRLzRX4bAqdhuP6XDLnTnvAhx-rRiwRWE_c0I-Sr1yu"
Config.icon_url = "http://45.127.165.120/sense/hud/sensehud.gif"
Config.url = "http://45.127.165.120/sense/hud/sensehud.gif"


Config.ChatNotify = true -- [ Mandar notify caso tenha uma mensagem no grupo ]
Config.NotifyMessagem = "Uma nova mensagem foi enviada na empresa" -- [ Menssagem enviada no painel ]

Config.CheckItem = false -- [ Pedir item ou nao ]
Config.Item = "grupo" -- [ Item necessario para abrir o tablet ]

Config.wnInventory = false -- [ Caso use o inventario da warn coloque "true" caso nao use coloque "false" ]
Config.Imagens = "http://45.127.165.120/sense/inventory/itens/" -- [ Local dos itens do inventario ]

Config.PermAdmin = "Admin" -- [ Permissao do Admin para acessar os comandos ]
Config.DiasBlacklist = 5
Config.discordid = '1091459577607888936'
Config.Empresas = {

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- [LEGAL]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Mecanica"] = {
		Permissao = "Mecanica",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263888493260574822/jlJJvdwB4_SsMcqXzGHQanFXlSqI7-RhNMBB_5MQ8J-WZitKR6sC91MtmzNmq1J0MJmQ",
		logs_contratar = "https://discord.com/api/webhooks/1263888493260574822/jlJJvdwB4_SsMcqXzGHQanFXlSqI7-RhNMBB_5MQ8J-WZitKR6sC91MtmzNmq1J0MJmQ",
		logs_demitir = "https://discord.com/api/webhooks/1263888493260574822/jlJJvdwB4_SsMcqXzGHQanFXlSqI7-RhNMBB_5MQ8J-WZitKR6sC91MtmzNmq1J0MJmQ",
		logs_promover = "https://discord.com/api/webhooks/1263888493260574822/jlJJvdwB4_SsMcqXzGHQanFXlSqI7-RhNMBB_5MQ8J-WZitKR6sC91MtmzNmq1J0MJmQ",
		logs_rebaixar = "https://discord.com/api/webhooks/1263888493260574822/jlJJvdwB4_SsMcqXzGHQanFXlSqI7-RhNMBB_5MQ8J-WZitKR6sC91MtmzNmq1J0MJmQ",
		logs_vendas = "https://discord.com/api/webhooks/1263888493260574822/jlJJvdwB4_SsMcqXzGHQanFXlSqI7-RhNMBB_5MQ8J-WZitKR6sC91MtmzNmq1J0MJmQ",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Mecanica", Acesso = "Lider" },
			[2] = { Set = "Mecanica", Acesso = "Sub-Lider" },
			[3] = { Set = "Mecanica", Acesso = "Conselheiro" },
			[4] = { Set = "Mecanica", Acesso = "Membros" },
			[5] = { Set = "FadMecanicaas", Acesso = "Seguidor" },
		}
	},
	["Kitsunes"] = {
		Permissao = "Kitsunes",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263888641294336022/L5RzMuhkKJjGxFP7IzLhDKWeu1rFl79k-FiExi3CsbCaNfdn3hQcdvwQHDZL7utXzSdQ",
		logs_contratar = "https://discord.com/api/webhooks/1263888641294336022/L5RzMuhkKJjGxFP7IzLhDKWeu1rFl79k-FiExi3CsbCaNfdn3hQcdvwQHDZL7utXzSdQ",
		logs_demitir = "https://discord.com/api/webhooks/1263888641294336022/L5RzMuhkKJjGxFP7IzLhDKWeu1rFl79k-FiExi3CsbCaNfdn3hQcdvwQHDZL7utXzSdQ",
		logs_promover = "https://discord.com/api/webhooks/1263888641294336022/L5RzMuhkKJjGxFP7IzLhDKWeu1rFl79k-FiExi3CsbCaNfdn3hQcdvwQHDZL7utXzSdQ",
		logs_rebaixar = "https://discord.com/api/webhooks/1263888641294336022/L5RzMuhkKJjGxFP7IzLhDKWeu1rFl79k-FiExi3CsbCaNfdn3hQcdvwQHDZL7utXzSdQ",
		logs_vendas = "https://discord.com/api/webhooks/1263888641294336022/L5RzMuhkKJjGxFP7IzLhDKWeu1rFl79k-FiExi3CsbCaNfdn3hQcdvwQHDZL7utXzSdQ",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Kitsunes", Acesso = "Lider" },
			[2] = { Set = "Kitsunes", Acesso = "Sub-Lider" },
			[3] = { Set = "Kitsunes", Acesso = "Conselheiro" },
			[4] = { Set = "Kitsunes", Acesso = "Membros" },
			[5] = { Set = "Kitsunes", Acesso = "Seguidor" },
		}
	},
	["Lobisomens"] = {
		Permissao = "Lobisomens",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263888882517409973/Ca2sHJ6tkLxEcYdq22VbZSvO7VJqDEiR4j_zpYellaEvM2HqiEz8vooyVJAvzOOmkJjf",
		logs_contratar = "https://discord.com/api/webhooks/1263888882517409973/Ca2sHJ6tkLxEcYdq22VbZSvO7VJqDEiR4j_zpYellaEvM2HqiEz8vooyVJAvzOOmkJjf",
		logs_demitir = "https://discord.com/api/webhooks/1263888882517409973/Ca2sHJ6tkLxEcYdq22VbZSvO7VJqDEiR4j_zpYellaEvM2HqiEz8vooyVJAvzOOmkJjf",
		logs_promover = "https://discord.com/api/webhooks/1263888882517409973/Ca2sHJ6tkLxEcYdq22VbZSvO7VJqDEiR4j_zpYellaEvM2HqiEz8vooyVJAvzOOmkJjf",
		logs_rebaixar = "https://discord.com/api/webhooks/1263888882517409973/Ca2sHJ6tkLxEcYdq22VbZSvO7VJqDEiR4j_zpYellaEvM2HqiEz8vooyVJAvzOOmkJjf",
		logs_vendas = "https://discord.com/api/webhooks/1263888882517409973/Ca2sHJ6tkLxEcYdq22VbZSvO7VJqDEiR4j_zpYellaEvM2HqiEz8vooyVJAvzOOmkJjf",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Lobisomens", Acesso = "Lider" },
			[2] = { Set = "Lobisomens", Acesso = "Sub-Lider" },
			[3] = { Set = "Lobisomens", Acesso = "Conselheiro" },
			[4] = { Set = "Lobisomens", Acesso = "Membros" },
			[5] = { Set = "Lobisomens", Acesso = "Seguidor" },
		}
	},
	["Vampiros"] = {
		Permissao = "Vampiros",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263889058581712948/KLHHSS4e3gp37hz5_V8ELSfnap4aXGgDJ4tdJuSAIdkoLhqoDCGM8ctFBA6kMIbl2ReC",
		logs_contratar = "https://discord.com/api/webhooks/1263889058581712948/KLHHSS4e3gp37hz5_V8ELSfnap4aXGgDJ4tdJuSAIdkoLhqoDCGM8ctFBA6kMIbl2ReC",
		logs_demitir = "https://discord.com/api/webhooks/1263889058581712948/KLHHSS4e3gp37hz5_V8ELSfnap4aXGgDJ4tdJuSAIdkoLhqoDCGM8ctFBA6kMIbl2ReC",
		logs_promover = "https://discord.com/api/webhooks/1263889058581712948/KLHHSS4e3gp37hz5_V8ELSfnap4aXGgDJ4tdJuSAIdkoLhqoDCGM8ctFBA6kMIbl2ReC",
		logs_rebaixar = "https://discord.com/api/webhooks/1263889058581712948/KLHHSS4e3gp37hz5_V8ELSfnap4aXGgDJ4tdJuSAIdkoLhqoDCGM8ctFBA6kMIbl2ReC",
		logs_vendas = "https://discord.com/api/webhooks/1263889058581712948/KLHHSS4e3gp37hz5_V8ELSfnap4aXGgDJ4tdJuSAIdkoLhqoDCGM8ctFBA6kMIbl2ReC",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Vampiros", Acesso = "Lider" },
			[2] = { Set = "Vampiros", Acesso = "Sub-Lider" },
			[3] = { Set = "Vampiros", Acesso = "Conselheiro" },
			[4] = { Set = "Vampiros", Acesso = "Membros" },
			[5] = { Set = "Vampiros", Acesso = "Seguidor" },
		}
	},
	["Vampiros3"] = {
		Permissao = "Vampiros3",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
	 	logs_banco = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	 	logs_contratar = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	 	logs_demitir = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	 	logs_promover = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	 	logs_rebaixar = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	 	logs_vendas = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Vampiros3", Acesso = "Lider" },
			[2] = { Set = "Vampiros3", Acesso = "Sub-Lider" },
			[3] = { Set = "Vampiros3", Acesso = "Conselheiro" },
			[4] = { Set = "Vampiros3", Acesso = "Membros" },
			[5] = { Set = "Vampiros3", Acesso = "Seguidor" },
		}
	},
	["Vamp"] = {
		Permissao = "Vamp",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263889536996474890/HJf_sja_ddtomQbLZ-2QIkIurwPa9pk2voeTox2GU0HPSRb9L1phY4Bmxwj93qlRCzBr",
		logs_contratar = "https://discord.com/api/webhooks/1263889536996474890/HJf_sja_ddtomQbLZ-2QIkIurwPa9pk2voeTox2GU0HPSRb9L1phY4Bmxwj93qlRCzBr",
		logs_demitir = "https://discord.com/api/webhooks/1263889536996474890/HJf_sja_ddtomQbLZ-2QIkIurwPa9pk2voeTox2GU0HPSRb9L1phY4Bmxwj93qlRCzBr",
		logs_promover = "https://discord.com/api/webhooks/1263889536996474890/HJf_sja_ddtomQbLZ-2QIkIurwPa9pk2voeTox2GU0HPSRb9L1phY4Bmxwj93qlRCzBr",
		logs_rebaixar = "https://discord.com/api/webhooks/1263889536996474890/HJf_sja_ddtomQbLZ-2QIkIurwPa9pk2voeTox2GU0HPSRb9L1phY4Bmxwj93qlRCzBr",
		logs_vendas = "https://discord.com/api/webhooks/1263889536996474890/HJf_sja_ddtomQbLZ-2QIkIurwPa9pk2voeTox2GU0HPSRb9L1phY4Bmxwj93qlRCzBr",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Vamp", Acesso = "Lider" },
			[2] = { Set = "Vamp", Acesso = "Sub-Lider" },
			[3] = { Set = "Vamp", Acesso = "Conselheiro" },
			[4] = { Set = "Vamp", Acesso = "Membros" },
			[5] = { Set = "Vamp", Acesso = "Seguidor" },
		}
	},
	["Bruxa"] = {
		Permissao = "Bruxa",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263889732702572723/GjDZYaIMHrFNHrdFyFQrO8lNdfKXvdecHVUow9J0MkZsLzNTpXvFscAfeOQ1QYNiBHmB",
		logs_contratar = "https://discord.com/api/webhooks/1263889732702572723/GjDZYaIMHrFNHrdFyFQrO8lNdfKXvdecHVUow9J0MkZsLzNTpXvFscAfeOQ1QYNiBHmB",
		logs_demitir = "https://discord.com/api/webhooks/1263889732702572723/GjDZYaIMHrFNHrdFyFQrO8lNdfKXvdecHVUow9J0MkZsLzNTpXvFscAfeOQ1QYNiBHmB",
		logs_promover = "https://discord.com/api/webhooks/1263889732702572723/GjDZYaIMHrFNHrdFyFQrO8lNdfKXvdecHVUow9J0MkZsLzNTpXvFscAfeOQ1QYNiBHmB",
		logs_rebaixar = "https://discord.com/api/webhooks/1263889732702572723/GjDZYaIMHrFNHrdFyFQrO8lNdfKXvdecHVUow9J0MkZsLzNTpXvFscAfeOQ1QYNiBHmB",
		logs_vendas = "https://discord.com/api/webhooks/1263889732702572723/GjDZYaIMHrFNHrdFyFQrO8lNdfKXvdecHVUow9J0MkZsLzNTpXvFscAfeOQ1QYNiBHmB",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Bruxa", Acesso = "Lider" },
			[2] = { Set = "Bruxa", Acesso = "Sub-Lider" },
			[3] = { Set = "Bruxa", Acesso = "Conselheiro" },
			[4] = { Set = "Bruxa", Acesso = "Membros" },
			[5] = { Set = "Bruxa", Acesso = "Seguidor" },
		}
	},
	["Bruxa2"] = {
		Permissao = "Bruxa2",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263889895445893190/XT8HJnXPXNeKN-kcnGhJlLCTRQmjkAJ3w1hpz5pe4qnE-hkwTr21sHuOSBKbC5QAJy5i",
		logs_contratar = "https://discord.com/api/webhooks/1263889895445893190/XT8HJnXPXNeKN-kcnGhJlLCTRQmjkAJ3w1hpz5pe4qnE-hkwTr21sHuOSBKbC5QAJy5i",
		logs_demitir = "https://discord.com/api/webhooks/1263889895445893190/XT8HJnXPXNeKN-kcnGhJlLCTRQmjkAJ3w1hpz5pe4qnE-hkwTr21sHuOSBKbC5QAJy5i",
		logs_promover = "https://discord.com/api/webhooks/1263889895445893190/XT8HJnXPXNeKN-kcnGhJlLCTRQmjkAJ3w1hpz5pe4qnE-hkwTr21sHuOSBKbC5QAJy5i",
		logs_rebaixar = "https://discord.com/api/webhooks/1263889895445893190/XT8HJnXPXNeKN-kcnGhJlLCTRQmjkAJ3w1hpz5pe4qnE-hkwTr21sHuOSBKbC5QAJy5i",
		logs_vendas = "https://discord.com/api/webhooks/1263889895445893190/XT8HJnXPXNeKN-kcnGhJlLCTRQmjkAJ3w1hpz5pe4qnE-hkwTr21sHuOSBKbC5QAJy5i",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Bruxa2", Acesso = "Lider" },
			[2] = { Set = "Bruxa2", Acesso = "Sub-Lider" },
			[3] = { Set = "Bruxa2", Acesso = "Conselheiro" },
			[4] = { Set = "Bruxa2", Acesso = "Membros" },
			[5] = { Set = "Bruxa2", Acesso = "Seguidor" },
		}
	},
	["Anjos"] = {
		Permissao = "Anjos",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263890230059208704/hlg5NhmIfrfMTsC_qa6UnQKcJCL_8tAzKTKSo9AjPIBI32ydZ72jAWjx_R_fyub8wQNL",
		logs_contratar = "https://discord.com/api/webhooks/1263890230059208704/hlg5NhmIfrfMTsC_qa6UnQKcJCL_8tAzKTKSo9AjPIBI32ydZ72jAWjx_R_fyub8wQNL",
		logs_demitir = "https://discord.com/api/webhooks/1263890230059208704/hlg5NhmIfrfMTsC_qa6UnQKcJCL_8tAzKTKSo9AjPIBI32ydZ72jAWjx_R_fyub8wQNL",
		logs_promover = "https://discord.com/api/webhooks/1263890230059208704/hlg5NhmIfrfMTsC_qa6UnQKcJCL_8tAzKTKSo9AjPIBI32ydZ72jAWjx_R_fyub8wQNL",
		logs_rebaixar = "https://discord.com/api/webhooks/1263890230059208704/hlg5NhmIfrfMTsC_qa6UnQKcJCL_8tAzKTKSo9AjPIBI32ydZ72jAWjx_R_fyub8wQNL",
		logs_vendas = "https://discord.com/api/webhooks/1263890230059208704/hlg5NhmIfrfMTsC_qa6UnQKcJCL_8tAzKTKSo9AjPIBI32ydZ72jAWjx_R_fyub8wQNL",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Anjos", Acesso = "Lider" },
			[2] = { Set = "Anjos", Acesso = "Sub-Lider" },
			[3] = { Set = "Anjos", Acesso = "Conselheiro" },
			[4] = { Set = "Anjos", Acesso = "Membros" },
			[5] = { Set = "Anjos", Acesso = "Seguidor" },
		}
	},
	["Sereias"] = {
		Permissao = "Sereias",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263890596905357392/rqLcsnD0RaPGx_PZeB1pUjAw0JZA-vlVpc4cmAiRMB1O_Cn6AaMxdI1e2KuPe2-2fFKw",
		logs_contratar = "https://discord.com/api/webhooks/1263890596905357392/rqLcsnD0RaPGx_PZeB1pUjAw0JZA-vlVpc4cmAiRMB1O_Cn6AaMxdI1e2KuPe2-2fFKw",
		logs_demitir = "https://discord.com/api/webhooks/1263890596905357392/rqLcsnD0RaPGx_PZeB1pUjAw0JZA-vlVpc4cmAiRMB1O_Cn6AaMxdI1e2KuPe2-2fFKw",
		logs_promover = "https://discord.com/api/webhooks/1263890596905357392/rqLcsnD0RaPGx_PZeB1pUjAw0JZA-vlVpc4cmAiRMB1O_Cn6AaMxdI1e2KuPe2-2fFKw",
		logs_rebaixar = "https://discord.com/api/webhooks/1263890596905357392/rqLcsnD0RaPGx_PZeB1pUjAw0JZA-vlVpc4cmAiRMB1O_Cn6AaMxdI1e2KuPe2-2fFKw",
		logs_vendas = "https://discord.com/api/webhooks/1263890596905357392/rqLcsnD0RaPGx_PZeB1pUjAw0JZA-vlVpc4cmAiRMB1O_Cn6AaMxdI1e2KuPe2-2fFKw",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Sereias", Acesso = "Lider" },
			[2] = { Set = "Sereias", Acesso = "Sub-Lider" },
			[3] = { Set = "Sereias", Acesso = "Conselheiro" },
			[4] = { Set = "Sereias", Acesso = "Membros" },
			[5] = { Set = "Sereias", Acesso = "Seguidor" },
		}
	},
	["Sereias2"] = {
		Permissao = "Sereias2",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1270845464266277087/TiogNBeUtRuca3kGzdBDbavE9T5JYVYP0HC-08moNlXua85HklaDy_8WwCXWSawNo-zv",
		logs_contratar = "https://discord.com/api/webhooks/1270845464266277087/TiogNBeUtRuca3kGzdBDbavE9T5JYVYP0HC-08moNlXua85HklaDy_8WwCXWSawNo-zv",
		logs_demitir = "https://discord.com/api/webhooks/1270845464266277087/TiogNBeUtRuca3kGzdBDbavE9T5JYVYP0HC-08moNlXua85HklaDy_8WwCXWSawNo-zv",
		logs_promover = "https://discord.com/api/webhooks/1270845464266277087/TiogNBeUtRuca3kGzdBDbavE9T5JYVYP0HC-08moNlXua85HklaDy_8WwCXWSawNo-zv",
		logs_rebaixar = "https://discord.com/api/webhooks/1270845464266277087/TiogNBeUtRuca3kGzdBDbavE9T5JYVYP0HC-08moNlXua85HklaDy_8WwCXWSawNo-zv",
		logs_vendas = "https://discord.com/api/webhooks/1270845464266277087/TiogNBeUtRuca3kGzdBDbavE9T5JYVYP0HC-08moNlXua85HklaDy_8WwCXWSawNo-zv",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Sereias2", Acesso = "Lider" },
			[2] = { Set = "Sereias2", Acesso = "Sub-Lider" },
			[3] = { Set = "Sereias2", Acesso = "Conselheiro" },
			[4] = { Set = "Sereias2", Acesso = "Membros" },
			[5] = { Set = "Sereias2", Acesso = "Seguidor" },
		}
	},
	["Dragao"] = {
		Permissao = "Dragao",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1265046039912517723/S9HVfzOwR6qoQrGYY-UiVpZ0a0fi4G5Lr9-ws2uue2qZB2c6RpOjoqTu65LAieTa2TNI",
		logs_contratar = "https://discord.com/api/webhooks/1265046039912517723/S9HVfzOwR6qoQrGYY-UiVpZ0a0fi4G5Lr9-ws2uue2qZB2c6RpOjoqTu65LAieTa2TNI",
		logs_demitir = "https://discord.com/api/webhooks/1265046039912517723/S9HVfzOwR6qoQrGYY-UiVpZ0a0fi4G5Lr9-ws2uue2qZB2c6RpOjoqTu65LAieTa2TNI",
		logs_promover = "https://discord.com/api/webhooks/1265046039912517723/S9HVfzOwR6qoQrGYY-UiVpZ0a0fi4G5Lr9-ws2uue2qZB2c6RpOjoqTu65LAieTa2TNI",
		logs_rebaixar = "https://discord.com/api/webhooks/1265046039912517723/S9HVfzOwR6qoQrGYY-UiVpZ0a0fi4G5Lr9-ws2uue2qZB2c6RpOjoqTu65LAieTa2TNI",
		logs_vendas = "https://discord.com/api/webhooks/1265046039912517723/S9HVfzOwR6qoQrGYY-UiVpZ0a0fi4G5Lr9-ws2uue2qZB2c6RpOjoqTu65LAieTa2TNI",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Dragao", Acesso = "Lider" },
			[2] = { Set = "Dragao", Acesso = "Sub-Lider" },
			[3] = { Set = "Dragao", Acesso = "Conselheiro" },
			[4] = { Set = "Dragao", Acesso = "Membros" },
			[5] = { Set = "Dragao", Acesso = "Seguidor" },
		}
	},
	["Caçador"] = {
		Permissao = "Caçador",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263891506348036280/QadhiuD68N-uG2xTw69UqeYUGTbm-_4PAaYeMR2aLmh9KehrBTtwRmCATPAeg0Nf2VHj",
		logs_contratar = "https://discord.com/api/webhooks/1263891506348036280/QadhiuD68N-uG2xTw69UqeYUGTbm-_4PAaYeMR2aLmh9KehrBTtwRmCATPAeg0Nf2VHj",
		logs_demitir = "https://discord.com/api/webhooks/1263891506348036280/QadhiuD68N-uG2xTw69UqeYUGTbm-_4PAaYeMR2aLmh9KehrBTtwRmCATPAeg0Nf2VHj",
		logs_promover = "https://discord.com/api/webhooks/1263891506348036280/QadhiuD68N-uG2xTw69UqeYUGTbm-_4PAaYeMR2aLmh9KehrBTtwRmCATPAeg0Nf2VHj",
		logs_rebaixar = "https://discord.com/api/webhooks/1263891506348036280/QadhiuD68N-uG2xTw69UqeYUGTbm-_4PAaYeMR2aLmh9KehrBTtwRmCATPAeg0Nf2VHj",
		logs_vendas = "https://discord.com/api/webhooks/1263891506348036280/QadhiuD68N-uG2xTw69UqeYUGTbm-_4PAaYeMR2aLmh9KehrBTtwRmCATPAeg0Nf2VHj",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Caçador", Acesso = "Lider" },
			[2] = { Set = "Caçador", Acesso = "Sub-Lider" },
			[3] = { Set = "Caçador", Acesso = "Conselheiro" },
			[4] = { Set = "Caçador", Acesso = "Membros" },
			[5] = { Set = "Caçador", Acesso = "Seguidor" },
		}
	},
	-- ["Demonios"] = {
	-- 	Permissao = "Demonios",
	-- 	Limite_Membros = 30,
	-- 	Cargo_Default = "Seguidor",
	-- 	logs_banco = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	-- 	logs_contratar = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	-- 	logs_demitir = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	-- 	logs_promover = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	-- 	logs_rebaixar = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	-- 	logs_vendas = "https://discord.com/api/webhooks/1263891666809520222/RPvBWDAXczad8ai6tXQtlv2pQaXmlXvFvLP9kpfd75u4iUwoKiHnLtxHUikT2ZXr8qi6",
	-- 	Acesso_Default = "Seguidor",
	-- 	Cargo_DefaultLevel = 5,
	-- 	PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
	-- 	Cargo_Discord = "",
	-- 	cargos = {
	-- 		[1] = { Set = "Demonios", Acesso = "Lider" },
	-- 		[2] = { Set = "Demonios", Acesso = "Sub-Lider" },
	-- 		[3] = { Set = "Demonios", Acesso = "Conselheiro" },
	-- 		[4] = { Set = "Demonios", Acesso = "Membros" },
	-- 		[5] = { Set = "Demonios", Acesso = "Seguidor" },
	-- 	}
	-- },
	["Fadas2"] = {
		Permissao = "Fadas2",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
		logs_contratar = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
		logs_demitir = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
		logs_promover = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
		logs_rebaixar = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
		logs_vendas = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 5,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Fadas2", Acesso = "Lider" },
			[2] = { Set = "Fadas2", Acesso = "Sub-Lider" },
			[3] = { Set = "Fadas2", Acesso = "Conselheiro" },
			[4] = { Set = "Fadas2", Acesso = "Membros" },
			[5] = { Set = "Fadas2", Acesso = "Seguidor" },
		}
	},
	-- ["Elfos"] = {
	-- 	Permissao = "Elfos",
	-- 	Limite_Membros = 30,
	-- 	Cargo_Default = "Seguidor",
	-- 	logs_banco = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
	-- 	logs_contratar = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
	-- 	logs_demitir = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
	-- 	logs_promover = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
	-- 	logs_rebaixar = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
	-- 	logs_vendas = "https://discord.com/api/webhooks/1263891796874891276/3lO4Un9kspypfrf_nlqA4djMkD4gvczBBpVBou2pMiU9Xucry3fDDAn7DevOzOuw8kK4",
	-- 	Acesso_Default = "Seguidor",
	-- 	Cargo_DefaultLevel = 4,
	-- 	PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
	-- 	Cargo_Discord = "",
	-- 	cargos = {
	-- 		[1] = { Set = "Elfos", Acesso = "Lider" },
	-- 		[2] = { Set = "Elfos", Acesso = "Sub-Lider" },
	-- 		[3] = { Set = "Elfos", Acesso = "Conselheiro" },
	-- 		[4] = { Set = "Elfos", Acesso = "Membros" },
	-- 		[5] = { Set = "Elfos", Acesso = "Seguidor" },
	-- 	}
	-- },
	["Bennys"] = {
		Permissao = "Bennys",
		Limite_Membros = 100,
		Cargo_Default = "Estagiário",
		logs_banco = "",
		logs_contratar = "",
		logs_demitir = "",
		logs_promover = "",
		logs_rebaixar = "",
		logs_vendas = "",
		Acesso_Default = "Estagiário",
		Cargo_DefaultLevel = 5,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Bennys", Acesso = "Chefe" },
			[2] = { Set = "Bennys", Acesso = "Sub-Chefe" },
			[3] = { Set = "Bennys", Acesso = "Gerente" },
			[4] = { Set = "Bennys", Acesso = "Mecânico" },
			[5] = { Set = "Bennys", Acesso = "Estagiário" },
		}
	},
	["Lobisomens2"] = {
		Permissao = "Lobisomens2",
		Limite_Membros = 30,
		Cargo_Default = "Seguidor",
		logs_banco = "https://discord.com/api/webhooks/1263891990370848780/W7sW94yOok0laRgklt_pC5Zot0KQEJLsiOXpTtTAhc_ih978OF2jOJslM7oxSl7b6exe",
		logs_contratar = "https://discord.com/api/webhooks/1263891990370848780/W7sW94yOok0laRgklt_pC5Zot0KQEJLsiOXpTtTAhc_ih978OF2jOJslM7oxSl7b6exe",
		logs_demitir = "https://discord.com/api/webhooks/1263891990370848780/W7sW94yOok0laRgklt_pC5Zot0KQEJLsiOXpTtTAhc_ih978OF2jOJslM7oxSl7b6exe",
		logs_promover = "https://discord.com/api/webhooks/1263891990370848780/W7sW94yOok0laRgklt_pC5Zot0KQEJLsiOXpTtTAhc_ih978OF2jOJslM7oxSl7b6exe",
		logs_rebaixar = "https://discord.com/api/webhooks/1263891990370848780/W7sW94yOok0laRgklt_pC5Zot0KQEJLsiOXpTtTAhc_ih978OF2jOJslM7oxSl7b6exe",
		logs_vendas = "https://discord.com/api/webhooks/1263891990370848780/W7sW94yOok0laRgklt_pC5Zot0KQEJLsiOXpTtTAhc_ih978OF2jOJslM7oxSl7b6exe",
		Acesso_Default = "Seguidor",
		Cargo_DefaultLevel = 4,
		PaginaUpgrades = false, -- se tiver upgrade tem que por o upgrades = {}
		Cargo_Discord = "",
		cargos = {
			[1] = { Set = "Lobisomens2", Acesso = "Lider" },
			[2] = { Set = "Lobisomens2", Acesso = "Sub-Lider" },
			[3] = { Set = "Lobisomens2", Acesso = "Conselheiro" },
			[4] = { Set = "Lobisomens2", Acesso = "Membros" },
			[5] = { Set = "Lobisomens2", Acesso = "Seguidor" },
		}
	}


}

Config.Functions = {

	getUserIdentity = function(user_id) -- [ Função para puxar nome do players ]
		return vRP.Identity(user_id)
        -- return vRP.userIdentity(user_id) -- VRPEX
    end,

}

return Config

