##存储
data modify storage sneak:mid bfs.map set from storage sneak:game game.map
data modify storage sneak:mid bfs.p set from storage sneak:game game.map

## 四条蛇的蛇尾让位
data modify storage sneak:mid bfs.arg set value {}
data modify storage sneak:mid bfs.arg.type set value "player"
function sneak:move/bfs/setup/tail with storage sneak:mid bfs.arg
data modify storage sneak:mid bfs.arg.type set value "blue"
function sneak:move/bfs/setup/tail with storage sneak:mid bfs.arg
data modify storage sneak:mid bfs.arg.type set value "yellow"
function sneak:move/bfs/setup/tail with storage sneak:mid bfs.arg
data modify storage sneak:mid bfs.arg.type set value "green"
function sneak:move/bfs/setup/tail with storage sneak:mid bfs.arg
