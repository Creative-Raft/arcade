##逐个检查
execute store result score #type russia_cal run data get storage russia:mid line[0]
data remove storage russia:mid line[0]
##存在垃圾格,本行不计分
execute if score #type russia_cal matches 8 run scoreboard players set #rubbish russia_cal 1
##若未填满,终止
execute if score #type russia_cal matches 0 run return run scoreboard players set #clear russia_cal 0
##重复
execute if data storage russia:mid line[0] run function russia:move/move/lock/test/line