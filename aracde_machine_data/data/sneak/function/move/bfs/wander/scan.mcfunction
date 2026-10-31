##依次向四个方向推进

##右
scoreboard players set #d sneak_cal 0
scoreboard players operation #x sneak_cal = #x0 sneak_cal
scoreboard players operation #y sneak_cal = #y0 sneak_cal
scoreboard players set #w sneak_cal 0
scoreboard players set #i sneak_cal 1
function sneak:move/bfs/wander/step
execute store result storage sneak:mid wander.ray[0] int 1 run scoreboard players get #w sneak_cal

##上
scoreboard players set #d sneak_cal 1
scoreboard players operation #x sneak_cal = #x0 sneak_cal
scoreboard players operation #y sneak_cal = #y0 sneak_cal
scoreboard players set #w sneak_cal 0
scoreboard players set #i sneak_cal 1
function sneak:move/bfs/wander/step
execute store result storage sneak:mid wander.ray[1] int 1 run scoreboard players get #w sneak_cal

##左
scoreboard players set #d sneak_cal 2
scoreboard players operation #x sneak_cal = #x0 sneak_cal
scoreboard players operation #y sneak_cal = #y0 sneak_cal
scoreboard players set #w sneak_cal 0
scoreboard players set #i sneak_cal 1
function sneak:move/bfs/wander/step
execute store result storage sneak:mid wander.ray[2] int 1 run scoreboard players get #w sneak_cal

##下
scoreboard players set #d sneak_cal 3
scoreboard players operation #x sneak_cal = #x0 sneak_cal
scoreboard players operation #y sneak_cal = #y0 sneak_cal
scoreboard players set #w sneak_cal 0
scoreboard players set #i sneak_cal 1
function sneak:move/bfs/wander/step
execute store result storage sneak:mid wander.ray[3] int 1 run scoreboard players get #w sneak_cal
