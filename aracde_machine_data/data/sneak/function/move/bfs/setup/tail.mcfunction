##蛇尾变为0(因为下一步会移开)
$execute if data storage sneak:game game.$(type).body[-1] run data modify storage sneak:mid bfs.walk set value {x:0,y:0}
$execute if data storage sneak:game game.$(type).body[-1] run data modify storage sneak:mid bfs.walk.x set from storage sneak:game game.$(type).body[-1][0]
$execute if data storage sneak:game game.$(type).body[-1] run data modify storage sneak:mid bfs.walk.y set from storage sneak:game game.$(type).body[-1][1]
$execute if data storage sneak:game game.$(type).body[-1] run function sneak:move/bfs/setup/zero with storage sneak:mid bfs.walk
