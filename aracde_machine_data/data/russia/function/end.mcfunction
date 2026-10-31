##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add russia_pair

##玩家离开座位时,结束
kill @e[tag=russia_pair,tag=russia_for]
kill @e[tag=russia_pair,tag=russia_score]
kill @e[tag=russia_pair,tag=russia_pause]
kill @e[tag=russia_pair,tag=russia_next]

##清除
tag @s remove russia_player
tag @s remove russia_pair
##清除统一标记
tag @s remove russia_all
