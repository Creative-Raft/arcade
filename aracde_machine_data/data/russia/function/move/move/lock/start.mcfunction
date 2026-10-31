##反存
data modify storage russia:mid block set from storage russia:game game.now
##准备
data modify storage russia:mid type set from storage russia:game game.now.type
data modify storage russia:mid list set from storage russia:game game.now.pos
data modify storage russia:game game.now set value {}
##替换
function russia:move/move/lock/trans/round

##确定检查行数
execute store result score #type russia_cal run data get storage russia:mid block.type
execute if score #type russia_cal matches 4 run return run function russia:move/move/lock/test/target/i
execute if score #type russia_cal matches 5 run return run function russia:move/move/lock/test/target/o
function russia:move/move/lock/test/target/normal