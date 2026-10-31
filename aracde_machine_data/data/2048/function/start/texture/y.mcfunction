##分隔
data modify storage 2048:mid line set from storage 2048:game game.map_all[0]
data remove storage 2048:game game.map_all[0]

##列处理
function 2048:start/texture/x

##转行
data modify storage 2048:game body append value {"text":"\n",font:"default"}