scoreboard players set #bfs_d sneak_cal -1
$execute store result score #bfs_d sneak_cal run data get storage sneak:mid bfs.p[$(y)][$(x)]
execute unless score #bfs_d sneak_cal matches 0..3 run return run function sneak:move/bfs/special/random

## 当前格坐标
$scoreboard players set #bfs_x sneak_cal $(x)
$scoreboard players set #bfs_y sneak_cal $(y)

##反推父格
scoreboard players operation #bfs_px sneak_cal = #bfs_x sneak_cal
scoreboard players operation #bfs_py sneak_cal = #bfs_y sneak_cal
execute if score #bfs_d sneak_cal matches 0 run scoreboard players remove #bfs_px sneak_cal 1
execute if score #bfs_d sneak_cal matches 1 run scoreboard players add #bfs_py sneak_cal 1
execute if score #bfs_d sneak_cal matches 2 run scoreboard players add #bfs_px sneak_cal 1
execute if score #bfs_d sneak_cal matches 3 run scoreboard players remove #bfs_py sneak_cal 1

##起点
scoreboard players set #bfs_first sneak_cal 0
execute if score #bfs_px sneak_cal = #bfs_sx sneak_cal if score #bfs_py sneak_cal = #bfs_sy sneak_cal run scoreboard players set #bfs_first sneak_cal 1


execute if score #bfs_first sneak_cal matches 1 run scoreboard players set #bfs_real sneak_cal 99
$execute if score #bfs_first sneak_cal matches 1 run execute store result score #bfs_real sneak_cal run data get storage sneak:game game.map[$(y)][$(x)]
execute if score #bfs_first sneak_cal matches 1 unless score #bfs_real sneak_cal matches 0..1 run return run function sneak:move/bfs/special/random

##合法
execute if score #bfs_first sneak_cal matches 1 run scoreboard players operation #facing sneak_cal = #bfs_d sneak_cal
execute if score #bfs_first sneak_cal matches 1 run scoreboard players set #bfs_result sneak_cal 1
execute if score #bfs_mode sneak_cal matches 2 if score #bfs_first sneak_cal matches 1 run scoreboard players set #bfs_result sneak_cal 2
execute if score #bfs_first sneak_cal matches 1 run return run function sneak:move/bfs/finish

##重复
data modify storage sneak:mid bfs.prev set value {x:0,y:0}
execute store result storage sneak:mid bfs.prev.x int 1 run scoreboard players get #bfs_px sneak_cal
execute store result storage sneak:mid bfs.prev.y int 1 run scoreboard players get #bfs_py sneak_cal
function sneak:move/bfs/search/back with storage sneak:mid bfs.prev
