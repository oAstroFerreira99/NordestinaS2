Config = {}

------------------------------------------
-- [ Ddiretorios ]
------------------------------------------

Config.Imagens_Inventario = "http://189.127.165.120/sense/inventory/itens/"
Config.Imagens_InventarioXamp = "http://189.127.165.120/sense/inventory/itens/"
Config.Imagens_Garagem = "http://189.127.165.120/sense/vehicles/"
Config.Imagens_Casas = "http://189.127.165.120/sense/casas/"
Config.Imagens_Skins = "https://docs.fivem.net/peds/"
Config.Banner = "https://c.tenor.com/C8Yr_YcPOn8AAAAC/tenor.gif"

------------------------------------------
-- [ Permissoes ]
------------------------------------------

Config.Perms = {
    teleport = "Admin",
    pegar_itens = "Admin",
    pegar_carros = "Admin",
}
Config.imagens = {
    semFoto = 'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'
}
Config.puni = {
    background = '#d33b3b',
    color = '#fff'
}

------------------------------------------
-- [ Logs ]
------------------------------------------

Config.Webhooks = {
    skins = "https://discord.com/api/webhooks/1271928861982195734/Mo6_RPOyJ6MMk5eIzVZxfFKawby705ncoSzl9MhvONA-X_JUVbzf6i5-SNBRszRC5d0r",
    control_inventario = "https://discord.com/api/webhooks/1271928810002059336/_5YTj3HcqWVjUOEv_mgNclU9FPONDhRwNH4buxpm3_q6XoQUeQ-mhd4FzQb31jIpyPL1",
    control_garagem = "https://discord.com/api/webhooks/1271928768612794439/46I_LJ7XozZKxfgbN-_ZQrUzrN8q53EzM_v_s4z21K1ZL9kCjgWvQYXQrVoFlXvEErOs",
    spawnDinheiro = "https://discord.com/api/webhooks/1271928725126250516/SAKmqUuEK2W3s_P8M9ThjcR0LH3G_UiJMpXN7VmeCVX5ti5MBYs6bskPwgmV-ySx9n5S",
    trocarCelular = "https://discord.com/api/webhooks/1271928679932362803/GLaRpaKBxa7xFM7kR53MZpoGJ0iMkMxJ8aSdnZORo5hT3Lsv8n3_in0T_5aBgDAkhAoh",
    trocarNome = "https://discord.com/api/webhooks/1271928633249890375/ioKsP0OqtCNRYvXDokr-RGwV-qfR9gtEh8VPfgJ_6o9oq_xebD116lcOZWdEnwdJk0tB",
    spanwItem = "https://discord.com/api/webhooks/1271928591877148792/YJJr2m0wL8HhxXDbMBJXGJ0GVS8Z-AMSJ7gfFXTOD4QBTTCedHISWhCOMI-Urt1Z1tqp",
    icon_url = "https://media.discordapp.net/attachments/1263915767100080239/1263916566198751313/avatarsense2.png?ex=66b8fa87&is=66b7a907&hm=1d7b78139106ef38c1fc959eb76a7b9addfd7614fd3b362fead643d0e87e8484&=&format=webp&quality=lossless&width=473&height=473",
    url = "",
}

------------------------------------------
-- [ Skins ]
------------------------------------------

Config.Skins = { -- 1100 x 900
    [1] = { nome = "Padrão M", set = "mp_m_freemode_01", sexo = "M" },
    [2] = { nome = "Padrão F", set = "mp_f_freemode_01" , sexo = "F" },
   
}

Config.Ignorar_Blacklist = "Dono"

Config.Cargos_blacklist = {
    "Dono",
    "Admin",
    "Mod"
}


Config["baus"] = {
    [1] = { bau = "mecanico", tipo = "Facção" }, 
    [2] = { bau = "policia", tipo = "Policia" }, 
}

--------------------------------
-- [ SISTEMA DE GROUPS ] --
--------------------------------

Config["groups"] = {
    ["Policia"] = {
        permissao = "Police",
        cargos = {
            [1] = "Policia10",
            [2] = "Policia9",
            [3] = "Policia8",
            [4] = "Policia7",
            [5] = "Policia6",
            [6] = "Policia5",
            [7] = "Policia4",
            [8] = "Policia3",
            [9] = "Policia2",
            [10] = "Policia1",
        }
    },
}

--------------------------------
-- [ SISTEMA DE CARGOS ] --
--------------------------------

Config["discord-guild"] = {
    discord_normal = "952756530648842280",
    discord_ilegal = "952756530648842280",
    discord_policia = "952756530648842280",
}

Config["cargosAdd"] = { -- Cargos disponiveis para add lembrando o sistema de blacklist elimina
    [1] = { tag = "Dono" , id_discord = "787785524290519071", tipo = "discord_normal" },
    [2] = { tag = "Farol" , id_discord = "1031933959354990683" , tipo = "discord_ilegal" },
    [3] = { tag = "Farol1" , id_discord = "1031933964664963122", tipo = "discord_ilegal" },
    [4] = { tag = "Farol2" , id_discord = "1029632980320260148", tipo = "discord_ilegal" },
    [5] = { tag = "Farol3" , id_discord = "1031933965470269570", tipo = "discord_ilegal" },
    [6] = { tag = "Policia10" , id_discord = "1033564979414188052", tipo = "discord_normal" },
}

Config["igoreBlacklist"] = "dono.perm" -- Cargo que podera ignorar a blacklist
Config["blacklist"] = { -- Cargos que os staff normais nao vao conseguir setar nem retirar !
    "Dono",
}

--------------------------------
-- [ SISTEMA DE PUNICOES ] --
--------------------------------

Config["ban"] = {
    banir_do_discord = false, -- True [Sim] / False [Nao] (Caso for nao ele vai aplicar o cargo Banido)
    id_cargo = "1035624796500799520",
}

return Config