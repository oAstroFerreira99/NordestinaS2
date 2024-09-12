



fx_version 'adamant'
game 'gta5'
name 'Panel Admin'
author 'Wine Network'
version '1.0'
dependencies{
	'vrp',
}
ui_page 'nui/index.html'
files {
	'nui/index.html',
	'nui/*',
}
client_script {
	"@vrp/lib/utils.lua",
	"client.lua"
}
server_scripts{ 
	"@vrp/lib/utils.lua",
	"cfg/*.lua",
	"server.lua",
}
lua54 'yes'
escrow_ignore {
	"cfg/config.lua"
	
}