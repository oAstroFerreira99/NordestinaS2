
fx_version 'bodacious'
games { 'gta5' }
author 'Kiminaze'
client_scripts {
	--'@NativeUILua-Reloaded/src/NativeUIReloaded.lua',
	'@vrp/lib/utils.lua',
	'@NativeUI/NativeUI.lua',
	'config.lua',
	'client.lua'
}
server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}               
shared_script "@ThnAC/natives.lua"
client_script "@ThnAC/stopper.lua"