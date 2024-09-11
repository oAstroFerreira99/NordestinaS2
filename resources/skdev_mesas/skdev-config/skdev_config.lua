baseatual = "Maestriav6" -- vrpex, Maestriav1, Maestriav2, Maestriav3, Maestriav4, Maestriav1000, Maestriav6

policia_permissao = "Police"
index_policia = 1 -- se você não usar a framework Maestria v6, ignorar
avisar_policia = false -- true para avisar policia sobre a droga sendo vendida, false para não avisar policia sobre a droga sendo vendida

notify_config = {"sucesso","negado"} -- configuração da sua notify, parametros: [1] = sucesso, [2] = negado

money_item = "dollars2" -- nome de spawn do item de dinheiro verifique isso!!!

drogas_configuracao = {
    ["joint"] = {
        image = "cocaine",
        ingame = "cocaina", -- nome de spawn do item verifique isso!!!
        sell = 1000 -- valor de venda de cada droga
    },
    --["Baseado"] = {
        --image = "joint",
        --ingame = "joint", -- nome de spawn do item verifique isso!!! 
        --sell = 1000 -- valor de venda de cada droga
    --},
    -- ["Metanfetamina"] = {
    --     image = "meth",
    --     ingame = "metanfetamina", -- nome de spawn do item verifique isso!!!
    --     sell = 1000 -- valor de venda de cada droga
    -- },
    -- ["Bala"] = {
    --     image = "mdma",
    --     ingame = "balinha",  -- nome de spawn do item verifique isso!!!
    --     sell = 1000 -- valor de venda de cada droga
    -- },
    -- ["Lança"] = {
    --     image = "lanca",
    --     ingame = "lancaperfume", -- nome de spawn do item verifique isso!!!
    --     sell = 1000 -- valor de venda de cada droga
    -- },
    -- ["Heroína"] = {
    --     image = "heroina",
    --     ingame = "heroina", -- nome de spawn do item verifique isso!!!
    --     sell = 1000 -- valor de venda de cada droga
    -- },
    --["Oxy"] = {
        --image = "oxy",
        --ingame = "oxy", -- nome de spawn do item verifique isso!!!
        --sell = 1000 -- valor de venda de cada droga
    --},
}