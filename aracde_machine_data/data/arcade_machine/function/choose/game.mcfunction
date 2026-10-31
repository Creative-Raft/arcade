##标记
tag @s add arcade_machine_sit_game

##分情况
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=arcade_machine] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add arcade_machine_target
execute as @e[tag=arcade_machine_target] store result score #type arcade_machine_cal run data get entity @s item.components."minecraft:custom_model_data".floats[0]
##处理
execute as @e[tag=arcade_machine_target] run data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 0
tag @e[tag=arcade_machine_target] remove arcade_machine_target
##游戏
execute if score #type arcade_machine_cal matches 1 run function pac_man:start/init
execute if score #type arcade_machine_cal matches 2 run function 2048:start/init
execute if score #type arcade_machine_cal matches 3 run function sneak:start/init
execute if score #type arcade_machine_cal matches 4 run function russia:start/init
execute if score #type arcade_machine_cal matches 5 run function russia_pk:start/init