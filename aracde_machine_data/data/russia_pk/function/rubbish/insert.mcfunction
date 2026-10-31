##需要插入的行数
execute unless data storage russia:game game.pending run return 0
execute store result score #rubbish_n russia_cal run data get storage russia:game game.pending
data remove storage russia:game game.pending

##逐行插入（每行独立随机挖空、独立检测、独立抬升一格）
function russia_pk:rubbish/row
execute if score #rubbish_n russia_cal matches 2.. run function russia_pk:rubbish/row
execute if score #rubbish_n russia_cal matches 3.. run function russia_pk:rubbish/row
execute if score #rubbish_n russia_cal matches 4.. run function russia_pk:rubbish/row
