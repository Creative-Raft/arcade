##撤掉本机的房间号显示板
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_pk_pause] if score @s arcade_machine_pair = #pair arcade_machine_pair run kill @s
