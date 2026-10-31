##音效
execute at @s run playsound block.iron.break ambient @a ~ ~ ~ 1
##给玩家
loot give @a[tag=arcade_machine_player,gamemode=!creative] loot arcade_machine:arcade_machine
##同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=arcade_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run kill @s