##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=pac_man_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add pac_man_pair

##玩家离开座位时,结束
kill @e[tag=pac_man_pair,tag=pac_man_for]
kill @e[tag=pac_man_pair,tag=pac_man_life]
kill @e[tag=pac_man_pair,tag=pac_man_item]
kill @e[tag=pac_man_pair,tag=pac_man_score]
kill @e[tag=pac_man_pair,tag=pac_man_pause]

##清除
tag @s remove pac_man_player
tag @s remove pac_man_pair
##清除统一标记
tag @s remove pac_man_all
