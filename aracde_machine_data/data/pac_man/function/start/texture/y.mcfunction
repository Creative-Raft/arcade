##分隔
data modify storage pac_man:mid line set from storage pac_man:game game.map_all[0]
data remove storage pac_man:game game.map_all[0]

##列处理
function pac_man:start/texture/x

##转行
data modify storage pac_man:game body append value {"text":"\n",font:"default"}