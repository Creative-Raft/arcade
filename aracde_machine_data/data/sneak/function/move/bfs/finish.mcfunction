##结果
execute store result storage sneak:mid bfs.result int 1 run scoreboard players get #bfs_result sneak_cal
execute store result storage sneak:mid bfs.dir int 1 run scoreboard players get #facing sneak_cal
##清除
execute if data storage sneak:mid bfs.map run data remove storage sneak:mid bfs.map
