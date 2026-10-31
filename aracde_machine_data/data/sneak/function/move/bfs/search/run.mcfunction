##命中
execute if data storage sneak:mid bfs.found run return run function sneak:move/bfs/search/back with storage sneak:mid bfs.hitarg

##熔断
#本次决策累计扩展格数超过上限
scoreboard players add #bfs_steps sneak_cal 1
execute if score #bfs_steps sneak_cal matches 101.. run return run function sneak:move/bfs/wander/start

##队列空
execute unless data storage sneak:mid bfs.queue[0] run return run function sneak:move/bfs/search/fail

##取队首
data modify storage sneak:mid bfs.cur set from storage sneak:mid bfs.queue[0]
data remove storage sneak:mid bfs.queue[0]

##由当前格生成邻居
data modify storage sneak:mid bfs.cen set from storage sneak:mid bfs.cur
function sneak:move/bfs/search/neighbors

##判断
function sneak:move/bfs/search/expand with storage sneak:mid bfs.n[0]
execute unless data storage sneak:mid bfs.found run function sneak:move/bfs/search/expand with storage sneak:mid bfs.n[1]
execute unless data storage sneak:mid bfs.found run function sneak:move/bfs/search/expand with storage sneak:mid bfs.n[2]
execute unless data storage sneak:mid bfs.found run function sneak:move/bfs/search/expand with storage sneak:mid bfs.n[3]

##继续
function sneak:move/bfs/search/run
