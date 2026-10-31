##终止
execute if score #bfs_mode sneak_cal matches 1 run return run function sneak:move/bfs/special/retarget
execute if score #bfs_mode sneak_cal matches 2 run return run function sneak:move/bfs/special/random
##保险
function sneak:move/bfs/special/random
