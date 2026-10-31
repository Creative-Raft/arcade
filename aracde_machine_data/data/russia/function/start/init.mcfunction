##初始化
data modify storage russia:game game set from storage russia:base game
data modify storage russia:game game.map set from storage russia:base map

##输送队列
function russia:start/queue/start
##第一个第二个
function russia:start/set/now

##转化为文字
data modify storage russia:game game.map_all set from storage russia:game game.map
##转化第一个
function russia:start/trans/start

##最上方两行用于计算
data remove storage russia:game game.map_all[0]
data remove storage russia:game game.map_all[0]

data modify storage russia:game body set value []
function russia:start/texture/start


##按键保存
data modify storage russia:game score set value {\
    "left":0,\
    "right":0,\
    "forward":0,\
    "space":0,\
    "pace":1,\
    "down":1\
}

##生成
function russia:start/summon