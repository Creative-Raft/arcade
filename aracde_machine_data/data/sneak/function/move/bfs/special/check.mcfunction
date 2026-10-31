
$scoreboard players set #bfs_x sneak_cal $(x)
$scoreboard players set #bfs_y sneak_cal $(y)
##越界
execute if score #bfs_x sneak_cal matches ..-1 run return 0
execute if score #bfs_x sneak_cal matches 20.. run return 0
execute if score #bfs_y sneak_cal matches ..-1 run return 0
execute if score #bfs_y sneak_cal matches 20.. run return 0
##反向
$scoreboard players set #bfs_din sneak_cal $(dir)
execute if score #bfs_din sneak_cal = #bfs_rev sneak_cal run return 0
##判断
$execute store result score #bfs_cell sneak_cal run data get storage sneak:game game.map[$(y)][$(x)]
execute unless score #bfs_cell sneak_cal matches 0..1 run return 0
##记入候选
$data modify storage sneak:mid bfs.can append value $(dir)
