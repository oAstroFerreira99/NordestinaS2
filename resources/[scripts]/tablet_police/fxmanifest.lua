fx_version "bodacious"
game "gta5"

ui_page "web/build/index.html"

lua54 'yes'

author 'LitoralRP'
description 'Sistema de tablet policial para efetuar prisões, aplicar multas, verificar ficha criminal e checar código penal'

client_script {
  "@vrp/config/Native.lua",
  "@PolyZone/client.lua",
  "@vrp/lib/Utils.lua",
  "config/config.lua",
  "client/**/*"
}

server_scripts {
  "@vrp/config/Item.lua",
  "@vrp/lib/Utils.lua",
  "config/config.lua",
  "server/**/*"
}

files {
  "web/build/*",
  "web/build/**/*",
}                                    