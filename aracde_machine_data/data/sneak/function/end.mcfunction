##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=sneak_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add sneak_pair

##玩家离开座位时,结束
kill @e[tag=sneak_pair,tag=sneak_for]
kill @e[tag=sneak_pair,tag=sneak_life]
kill @e[tag=sneak_pair,tag=sneak_item]
kill @e[tag=sneak_pair,tag=sneak_score]
kill @e[tag=sneak_pair,tag=sneak_pause]
kill @e[tag=sneak_pair,tag=sneak_pause_1]

##清除
tag @s remove sneak_player
tag @s remove sneak_pair
##清除统一标记
tag @s remove sneak_all
