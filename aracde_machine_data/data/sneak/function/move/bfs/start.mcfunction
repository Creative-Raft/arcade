##无起点,什么都不做,保持原朝向,避免用到上一次的残留
execute unless data storage sneak:mid bfs.pos run return 0

##备份朝向
scoreboard players operation #bfs_from sneak_cal = #facing sneak_cal
##反向
scoreboard players operation #bfs_rev sneak_cal = #bfs_from sneak_cal
scoreboard players add #bfs_rev sneak_cal 2
execute if score #bfs_rev sneak_cal matches 4.. run scoreboard players remove #bfs_rev sneak_cal 4
##初始化
scoreboard players set #bfs_result sneak_cal 0
scoreboard players set #bfs_mode sneak_cal 0
##终止计数
scoreboard players set #bfs_steps sneak_cal 0

##设置
data modify storage sneak:mid bfs_save set value {}
data modify storage sneak:mid bfs_save.pos set from storage sneak:mid bfs.pos
data modify storage sneak:mid bfs_save.type set from storage sneak:mid bfs.type
data remove storage sneak:mid bfs
data modify storage sneak:mid bfs set value {}
data modify storage sneak:mid bfs.pos set from storage sneak:mid bfs_save.pos
data modify storage sneak:mid bfs.type set from storage sneak:mid bfs_save.type
data remove storage sneak:mid bfs_save

##起点坐标
execute store result score #bfs_sx sneak_cal run data get storage sneak:mid bfs.pos[0]
execute store result score #bfs_sy sneak_cal run data get storage sneak:mid bfs.pos[1]

data modify storage sneak:mid bfs.queue set value []
data modify storage sneak:mid bfs.queue append from storage sneak:mid bfs.pos

##若场上没豆,改为游走
execute if score #beans_count sneak_cal matches ..0 run return run function sneak:move/bfs/wander/start

##有豆找豆
function sneak:move/bfs/setup/reset
execute if score #beans_count sneak_cal matches 1.. run scoreboard players set #bfs_mode sneak_cal 1
execute if score #beans_count sneak_cal matches 1.. run function sneak:move/bfs/search/run
