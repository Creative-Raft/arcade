##选择
$data modify storage sneak:mid bfs.dir set from storage sneak:mid bfs.can[$(i)]
execute store result score #facing sneak_cal run data get storage sneak:mid bfs.dir
scoreboard players set #bfs_result sneak_cal 3
function sneak:move/bfs/finish
