
##随机
$execute unless data storage sneak:game game.$(type).body[-1] run return run function sneak:move/bfs/special/random
##取蛇尾坐标
data modify storage sneak:mid bfs.walk set value {x:0,y:0}
$data modify storage sneak:mid bfs.walk.x set from storage sneak:game game.$(type).body[-1][0]
$data modify storage sneak:mid bfs.walk.y set from storage sneak:game game.$(type).body[-1][1]
##写入target
data modify storage sneak:mid bfs.target set value [0,0]
data modify storage sneak:mid bfs.target[0] set from storage sneak:mid bfs.walk.x
data modify storage sneak:mid bfs.target[1] set from storage sneak:mid bfs.walk.y
##坐标
execute store result score #bfs_tx sneak_cal run data get storage sneak:mid bfs.target[0]
execute store result score #bfs_ty sneak_cal run data get storage sneak:mid bfs.target[1]
function sneak:move/bfs/special/rerun
