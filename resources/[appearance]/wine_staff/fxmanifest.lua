 
fx_version 'adamant'
game 'gta5'
client_script {
	"@vrp/lib/utils.lua",
	"cfg/config.lua",
	"client.lua"

}
server_scripts{ 
	"@vrp/lib/utils.lua",
	"@vrp/config/Vehicle.lua",
	"@vrp/config/Item.lua",
	"@wine_groups/cfg/config.lua",
	"server.lua"
}
ui_page 'nui/index.html'
files {
	'nui/*',
	'nui/**'
}              
lua54 'yes'
escrow_ignore { -- config code
	"cfg/config.lua",
	"cfg/functions.lua",
}