##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=2048_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add 2048_pair

##玩家离开座位时,结束
kill @e[tag=2048_pair,tag=2048_for]
kill @e[tag=2048_pair,tag=2048_score]
kill @e[tag=2048_pair,tag=2048_pause]

##清除
tag @s remove 2048_player
tag @s remove 2048_pair
##清除统一标记
tag @s remove 2048_all
