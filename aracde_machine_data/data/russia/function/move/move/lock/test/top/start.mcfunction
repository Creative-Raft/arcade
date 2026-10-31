##检查最上方
data modify storage russia:mid line set from storage russia:game game.map[2]
##检查是否有方块
scoreboard players set #end russia_cal 0
function russia:move/move/lock/test/top/line

execute if score #end russia_cal matches 1 run function russia:move/end