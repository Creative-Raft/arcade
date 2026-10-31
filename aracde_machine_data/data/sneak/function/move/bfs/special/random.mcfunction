##初始化
data modify storage sneak:mid bfs.can set value []
##以蛇头当前格为中心算四个方向
data modify storage sneak:mid bfs.cen set from storage sneak:mid bfs.pos
function sneak:move/bfs/search/neighbors
##筛选
function sneak:move/bfs/special/check with storage sneak:mid bfs.n[0]
function sneak:move/bfs/special/check with storage sneak:mid bfs.n[1]
function sneak:move/bfs/special/check with storage sneak:mid bfs.n[2]
function sneak:move/bfs/special/check with storage sneak:mid bfs.n[3]
##随机
execute store result score #bfs_len sneak_cal run data get storage sneak:mid bfs.can
execute if score #bfs_len sneak_cal matches 0 run return run function sneak:move/bfs/special/none
execute store result score #bfs_pick sneak_cal run random value 0..999999
scoreboard players operation #bfs_pick sneak_cal %= #bfs_len sneak_cal
data modify storage sneak:mid bfs.iarg set value {}
execute store result storage sneak:mid bfs.iarg.i int 1 run scoreboard players get #bfs_pick sneak_cal
function sneak:move/bfs/special/pick with storage sneak:mid bfs.iarg
