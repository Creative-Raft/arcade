##抽取
scoreboard players operation #dir sneak_cal = #facing sneak_cal
execute if score #total sneak_cal matches 1.. run function sneak:move/bfs/wander/roll

##输出
scoreboard players operation #facing sneak_cal = #dir sneak_cal
execute store result storage sneak:mid bfs.dir int 1 run scoreboard players get #dir sneak_cal
scoreboard players set #bfs_result sneak_cal 5
