##重置
data modify storage sneak:mid bfs_save set value {}
data modify storage sneak:mid bfs_save.pos set from storage sneak:mid bfs.pos
data modify storage sneak:mid bfs_save.type set from storage sneak:mid bfs.type
data modify storage sneak:mid bfs_save.target set from storage sneak:mid bfs.target
data remove storage sneak:mid bfs
data modify storage sneak:mid bfs set value {}
data modify storage sneak:mid bfs.pos set from storage sneak:mid bfs_save.pos
data modify storage sneak:mid bfs.type set from storage sneak:mid bfs_save.type
data modify storage sneak:mid bfs.target set from storage sneak:mid bfs_save.target
data remove storage sneak:mid bfs_save

##重建
function sneak:move/bfs/setup/reset
data modify storage sneak:mid bfs.queue set value []
data modify storage sneak:mid bfs.queue append from storage sneak:mid bfs.pos
##再跑一次
function sneak:move/bfs/search/run
