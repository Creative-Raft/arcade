##读取
execute store result score #w0 sneak_cal run data get storage sneak:mid wander.ray[0]
execute store result score #w1 sneak_cal run data get storage sneak:mid wander.ray[1]
execute store result score #w2 sneak_cal run data get storage sneak:mid wander.ray[2]
execute store result score #w3 sneak_cal run data get storage sneak:mid wander.ray[3]

##当前朝向+3
execute if score #facing sneak_cal matches 0 run scoreboard players add #w0 sneak_cal 3
execute if score #facing sneak_cal matches 1 run scoreboard players add #w1 sneak_cal 3
execute if score #facing sneak_cal matches 2 run scoreboard players add #w2 sneak_cal 3
execute if score #facing sneak_cal matches 3 run scoreboard players add #w3 sneak_cal 3

##总分
scoreboard players operation #total sneak_cal = #w0 sneak_cal
scoreboard players operation #total sneak_cal += #w1 sneak_cal
scoreboard players operation #total sneak_cal += #w2 sneak_cal
scoreboard players operation #total sneak_cal += #w3 sneak_cal

##调试用
execute store result storage sneak:mid wander.w[0] int 1 run scoreboard players get #w0 sneak_cal
execute store result storage sneak:mid wander.w[1] int 1 run scoreboard players get #w1 sneak_cal
execute store result storage sneak:mid wander.w[2] int 1 run scoreboard players get #w2 sneak_cal
execute store result storage sneak:mid wander.w[3] int 1 run scoreboard players get #w3 sneak_cal
execute store result storage sneak:mid wander.total int 1 run scoreboard players get #total sneak_cal
