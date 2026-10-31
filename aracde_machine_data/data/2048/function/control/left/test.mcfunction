##本位
$execute store result score #type 2048_cal run data get storage 2048:game game.map[$(y)][$(x)]
##2048 -> 9 while this tile is being processed (only one 9 exists, so two 2048s never merge)
$execute if score #type 2048_cal matches 2048 run data modify storage 2048:game game.map[$(y)][$(x)] set value 9
execute if score #type 2048_cal matches 2048 run scoreboard players set #type 2048_cal 9
##下一位
scoreboard players set #next 2048_cal 0
$scoreboard players set #nx 2048_cal $(x)
scoreboard players remove #nx 2048_cal 1
execute store result storage 2048:mid nx int 1 run scoreboard players get #nx 2048_cal
function 2048:control/left/get with storage 2048:mid

##对比
#若下一位为0,交换
execute if score #next 2048_cal matches 0 run return run function 2048:control/left/replace with storage 2048:mid
#若下一位不为0但与自己相同,合并
execute if score #next 2048_cal = #type 2048_cal run return run function 2048:control/left/combine with storage 2048:mid
$execute if score #type 2048_cal matches 9 run data modify storage 2048:game game.map[$(y)][$(x)] set value 2048
#都不是,结束