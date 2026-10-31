##初始化
data modify storage sneak:game game set from storage sneak:base game
data modify storage sneak:game game.map set from storage sneak:base map

##转化文字
data modify storage sneak:game game.map_all set from storage sneak:base map
data modify storage sneak:game body set value []
##初始指示
data modify storage sneak:game game.map_all[4][5] set value 22
function sneak:start/texture/start

##跨时保存
data modify storage sneak:game score set value {\
    "left":0,\
    "right":0,\
    "forward":0,\
    "back":0,\
    "space":0,\
    "pause":1,\
    "player":0,\
    "blue":0,\
    "yellow":0,\
    "green":0,\
    "beans":40,\
    "beans_count":4,\
    "pace":1,\
    "time":0\
}

##生成
function sneak:start/summon