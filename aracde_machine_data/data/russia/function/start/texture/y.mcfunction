##分隔
data modify storage russia:mid line set from storage russia:game game.map_all[0]
data remove storage russia:game game.map_all[0]

##列处理
function russia:start/texture/x

##转行
data modify storage russia:game body append value {"text":"\n",font:"default"}