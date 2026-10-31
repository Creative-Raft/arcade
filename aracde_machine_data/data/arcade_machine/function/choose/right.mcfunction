##读取
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=arcade_machine] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add arcade_machine_target
execute store result score #type arcade_machine_cal run data get entity @e[tag=arcade_machine_target,limit=1] item.components."minecraft:custom_model_data".floats[0]
##右移游戏
scoreboard players add #type arcade_machine_cal 1
execute if score #type arcade_machine_cal matches 6.. run scoreboard players set #type arcade_machine_cal 1
##存回
execute store result entity @e[tag=arcade_machine_target,limit=1] item.components."minecraft:custom_model_data".floats[0] int 1 run scoreboard players get #type arcade_machine_cal
tag @e[tag=arcade_machine_target] remove arcade_machine_target
