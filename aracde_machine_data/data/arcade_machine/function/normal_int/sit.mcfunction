##调整玩家朝向
execute at @s run rotate @a[tag=arcade_machine_player,limit=1] ~ ~
##骑乘
ride @a[tag=arcade_machine_player,limit=1] mount @s

##同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
##街机显示
execute as @e[tag=arcade_machine] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 1
##拒绝交互
execute as @e[tag=arcade_machine_int] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s width set value 0

##标记自己
tag @s add arcade_machine_sit_playing