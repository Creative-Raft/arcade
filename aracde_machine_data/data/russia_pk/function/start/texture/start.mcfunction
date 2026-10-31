##把 russia:pk body 推给本机的房间号显示板（同组实体用 arcade_machine_pair 区分）
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_pk_pause] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add russia_pk_pair
execute as @e[tag=russia_pk_pause,tag=russia_pk_pair] run data modify entity @s text set from storage russia:pk body
tag @e[tag=russia_pk_pair] remove russia_pk_pair
