##蓝色bfs
data modify storage sneak:mid bfs set value {pos:[0,0],queue:[],type:"blue"}
data modify storage sneak:mid bfs.pos set from storage sneak:game game.blue.pos
execute store result score #facing sneak_cal run data get storage sneak:game game.blue.facing
function sneak:move/bfs/start
execute store result storage sneak:game game.blue.facing int 1 run scoreboard players get #facing sneak_cal

##黄色bfs
data modify storage sneak:mid bfs set value {pos:[0,0],queue:[],type:"yellow"}
data modify storage sneak:mid bfs.pos set from storage sneak:game game.yellow.pos
execute store result score #facing sneak_cal run data get storage sneak:game game.yellow.facing
function sneak:move/bfs/start
execute store result storage sneak:game game.yellow.facing int 1 run scoreboard players get #facing sneak_cal
