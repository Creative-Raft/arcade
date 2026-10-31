##读取所有格子,获取为0的格子
data modify storage sneak:mid map set from storage sneak:game game.map
#初始化
scoreboard players set #y sneak_cal 0
data modify storage sneak:mid pos set value [0,0]
data modify storage sneak:mid random set value []
function sneak:start/trans/y

##从中随机抽取一个
execute store result score #length sneak_cal run data get storage sneak:mid random
execute store result score #random sneak_cal run random value 1..99999999
scoreboard players operation #random sneak_cal %= #length sneak_cal
execute store result storage sneak:mid num int 1 run scoreboard players get #random sneak_cal
function sneak:start/trans/random with storage sneak:mid

##读取随机的坐标
data modify storage sneak:mid x set from storage sneak:mid random[0]
data modify storage sneak:mid y set from storage sneak:mid random[1]
##变为豆子
function sneak:start/trans/change with storage sneak:mid