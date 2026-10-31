##同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=arcade_machine] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 0
execute as @e[tag=arcade_machine_int] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s width set value 1

tag @s remove arcade_machine_sit_playing
tag @s remove arcade_machine_sit_game