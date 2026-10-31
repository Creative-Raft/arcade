##每63个方块,会出现7种各9次
scoreboard players set #count russia_cal 9
scoreboard players set #type russia_cal 1

scoreboard players set #place russia_cal 1
data modify storage russia:mid num set value 1

##随机插入
function russia:start/queue/round