##初始化
data modify storage 2048:game game.score set value 0
data modify storage 2048:game game.over set value 0
data modify storage 2048:game game.map set from storage 2048:base map

##随机转化两个格子
function 2048:start/trans/start
function 2048:start/trans/start

##生成转置矩阵map_t,用于简化上下移动
data modify storage 2048:game game.map_t set from storage 2048:base map
function 2048:start/transpos/start

##转化为文字
data modify storage 2048:game game.map_all set from storage 2048:game game.map
data modify storage 2048:game body set value []
function 2048:start/texture/start

##按键保存
data modify storage 2048:game score set value {\
    "left":0,\
    "right":0,\
    "forward":0,\
    "back":0,\
    "wait":0\
}

##生成
function 2048:start/summon