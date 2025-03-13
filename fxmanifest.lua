fx_version 'cerulean'
game { 'gta5' }
author "Local9 <https://github.com/Local9> updated by Joey"
description 'Basic iFrame resource for FiveM reskined and added a couple features.'

data_file 'DLC_ITYP_REQUEST' 'stream/prop_cs_tablet.ytyp'

ui_page "html/index.html"

files {
  "html/**/*",
}

client_scripts {
  "shared/*.lua",
  "client/*.lua"
}