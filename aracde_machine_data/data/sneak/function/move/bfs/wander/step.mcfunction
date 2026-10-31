
## 按当前方向推进一格
execute if score #d sneak_cal matches 0 run scoreboard players add #x sneak_cal 1
execute if score #d sneak_cal matches 1 run scoreboard players remove #y sneak_cal 1
execute if score #d sneak_cal matches 2 run scoreboard players remove #x sneak_cal 1
execute if score #d sneak_cal matches 3 run scoreboard players add #y sneak_cal 1

##出界
execute if score #x sneak_cal matches ..-1 run return 0
execute if score #x sneak_cal matches 20.. run return 0
execute if score #y sneak_cal matches ..-1 run return 0
execute if score #y sneak_cal matches 20.. run return 0

##读取
data modify storage sneak:mid wander.c set value {x:0,y:0}
execute store result storage sneak:mid wander.c.x int 1 run scoreboard players get #x sneak_cal
execute store result storage sneak:mid wander.c.y int 1 run scoreboard players get #y sneak_cal
function sneak:move/bfs/wander/cell with storage sneak:mid wander.c

##继续
scoreboard players add #i sneak_cal 1
execute if score #i sneak_cal matches ..5 run function sneak:move/bfs/wander/step
