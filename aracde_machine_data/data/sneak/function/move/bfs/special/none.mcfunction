##保持
scoreboard players operation #facing sneak_cal = #bfs_from sneak_cal
scoreboard players set #bfs_result sneak_cal 4
function sneak:move/bfs/finish
