##逐个读取
data modify storage 2048:mid line set from storage 2048:mid map[0]
scoreboard players set #x 2048_cal 0
#读取
function 2048:start/trans/x

##下一行
scoreboard players add #y 2048_cal 1
data remove storage 2048:mid map[0]
execute if data storage 2048:mid map[0] run function 2048:start/trans/y