--[[ FX Information ]]--

fx_version 'adamant'
game 'gta5'
lua54 'yes'
version "1.0.0"
--[[ Resource Information ]]--

description 'Astro-Lib'
version '1.0.1'

--[[ Manifest ]]--

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

server_scripts {
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'config.lua',
	'client/*.lua'
}

dependencies {
    'ox_lib',
    'es_extended'
}

provides {
'Astro-NotifySystem'
}
