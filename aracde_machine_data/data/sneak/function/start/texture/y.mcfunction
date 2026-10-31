##逐个处理
data modify storage sneak:mid line set from storage sneak:game game.map_all[0]
data remove storage sneak:game game.map_all[0]

function sneak:start/texture/x

##转行
data modify storage sneak:game body append value {"text":"\n","font":"default"}