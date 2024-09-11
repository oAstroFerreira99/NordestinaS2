
fx_version "bodacious"
game "gta5"
author 'Wine'
description 'Script de mecânicos'
version '1.0'
lua54 'on'

ui_page "html/index.html"

shared_scripts {
    "config.lua",
}

client_scripts {
	"@vrp/lib/utils.lua",
	"lib/*.lua",
	"client/*.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"lib/*.lua",
	"server/*.lua"
}

files {
	"html/*.html",
	"html/**/*"
}

