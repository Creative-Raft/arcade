##头坐标
execute store result score #x0 sneak_cal run data get storage sneak:mid bfs.pos[0]
execute store result score #y0 sneak_cal run data get storage sneak:mid bfs.pos[1]
##初始化
data modify storage sneak:mid wander set value {ray:[0,0,0,0],w:[0,0,0,0],total:0,dir:0}

##四方向探索
function sneak:move/bfs/wander/scan
##权重
function sneak:move/bfs/wander/weight
##抽取
function sneak:move/bfs/wander/pick
