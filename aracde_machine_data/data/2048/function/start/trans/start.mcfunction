##读取所有格子,获取为0的格子
data modify storage 2048:mid map set from storage 2048:game game.map
#初始化
scoreboard players set #y 2048_cal 0
data modify storage 2048:mid pos set value [0,0]
data modify storage 2048:mid random set value []
function 2048:start/trans/y

##从中随机抽取一个
execute store result score #length 2048_cal run data get storage 2048:mid random
execute store result score #random 2048_cal run random value 1..99999999
scoreboard players operation #random 2048_cal %= #length 2048_cal
execute store result storage 2048:mid num int 1 run scoreboard players get #random 2048_cal
function 2048:start/trans/random with storage 2048:mid

##读取随机的坐标
data modify storage 2048:mid x set from storage 2048:mid random[0]
data modify storage 2048:mid y set from storage 2048:mid random[1]
##随机数字
data modify storage 2048:mid num set value 2
execute if predicate {type:"random_chance",chance:0.1} run data modify storage 2048:mid num set value 4
function 2048:start/trans/change with storage 2048:mid