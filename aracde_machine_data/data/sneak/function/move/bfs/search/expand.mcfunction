##读取
$scoreboard players set #bfs_x sneak_cal $(x)
$scoreboard players set #bfs_y sneak_cal $(y)

##越界
execute if score #bfs_x sneak_cal matches ..-1 run return 0
execute if score #bfs_x sneak_cal matches 20.. run return 0
execute if score #bfs_y sneak_cal matches ..-1 run return 0
execute if score #bfs_y sneak_cal matches 20.. run return 0

##读取
$execute store result score #bfs_cell sneak_cal run data get storage sneak:mid bfs.map[$(y)][$(x)]
##判断
execute unless score #bfs_cell sneak_cal matches 0..1 run return 0

scoreboard players set #bfs_hit sneak_cal 0
##豆子
execute if score #bfs_mode sneak_cal matches 1 if score #bfs_cell sneak_cal matches 1 run scoreboard players set #bfs_hit sneak_cal 1
##指定格
execute if score #bfs_mode sneak_cal matches 2 if score #bfs_x sneak_cal = #bfs_tx sneak_cal if score #bfs_y sneak_cal = #bfs_ty sneak_cal run scoreboard players set #bfs_hit sneak_cal 1

##命中
$execute if score #bfs_hit sneak_cal matches 1 run data modify storage sneak:mid bfs.hit set value [$(x),$(y)]
$execute if score #bfs_hit sneak_cal matches 1 run data modify storage sneak:mid bfs.hitarg set value {x:$(x),y:$(y)}
$execute if score #bfs_hit sneak_cal matches 1 run data modify storage sneak:mid bfs.p[$(y)][$(x)] set value $(dir)
execute if score #bfs_hit sneak_cal matches 1 run data modify storage sneak:mid bfs.found set value 1
execute if score #bfs_hit sneak_cal matches 1 run return 0

##未命中
$data modify storage sneak:mid bfs.map[$(y)][$(x)] set value 99
$data modify storage sneak:mid bfs.p[$(y)][$(x)] set value $(dir)
$data modify storage sneak:mid bfs.queue append value [$(x),$(y)]
