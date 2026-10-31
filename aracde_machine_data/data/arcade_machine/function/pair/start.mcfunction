##检查有没有分数一致的
scoreboard players set #test arcade_machine_pair 0
execute as @e[tag=arcade_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run scoreboard players set #test arcade_machine_pair 1
##若有,+1重复
execute if score #test arcade_machine_pair matches 1 run scoreboard players add #pair arcade_machine_pair 1
execute if score #test arcade_machine_pair matches 1 run return run function arcade_machine:pair/start