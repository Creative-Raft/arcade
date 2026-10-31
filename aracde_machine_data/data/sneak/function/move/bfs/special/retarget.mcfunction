##改为蛇尾为目标
scoreboard players set #bfs_mode sneak_cal 2
execute unless data storage sneak:mid bfs.type run return run function sneak:move/bfs/special/random
data modify storage sneak:mid bfs.arg set value {}
data modify storage sneak:mid bfs.arg.type set from storage sneak:mid bfs.type
function sneak:move/bfs/special/mytail with storage sneak:mid bfs.arg
