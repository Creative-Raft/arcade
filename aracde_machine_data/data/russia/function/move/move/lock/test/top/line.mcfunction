##逐个检查
execute store result score #type russia_cal run data get storage russia:mid line[0]
data remove storage russia:mid line[0]
##若有方块,终止
execute unless score #type russia_cal matches 0 run return run scoreboard players set #end russia_cal 1
##重复
execute if data storage russia:mid line[0] run function russia:move/move/lock/test/top/line