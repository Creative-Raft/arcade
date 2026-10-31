##尝试寻找目标位置
execute store result score #success sneak_cal run function sneak:move/return/test/start
execute if score #success sneak_cal matches 0 run return run scoreboard players set #green sneak_cal 2
##若有,复活
data modify storage sneak:game game.green.pos set from storage sneak:mid random
data modify storage sneak:mid x set from storage sneak:game game.green.pos[0]
data modify storage sneak:mid y set from storage sneak:game game.green.pos[1]
data modify storage sneak:mid type set value 17
##复活调整
data modify storage sneak:game game.green.length set value 3
data modify storage sneak:game game.green.facing set value 0

function sneak:move/move/change with storage sneak:mid
