 

fx_version "adamant"
game "gta5"

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua"
} 

server_script {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server.lua"
}

files {
	"nui/imagens/*",
	"nui/index.html",
	"nui/*.js",
	"nui/css.css",
	'stream/carcols_gen9.meta',
    'stream/carmodcols_gen9.meta',
    'stream/carmodcols.ymt',
    'stream/vehicle_paint_ramps.ytd'
}


data_file "CARCOLS_GEN9_FILE" "stream/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "stream/carmodcols_gen9.meta"
data_file "FIVEM_LOVES_YOU_447B37BE29496FA0" "stream/carmodcols.ymt"