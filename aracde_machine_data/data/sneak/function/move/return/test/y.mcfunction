##逐个读取
data modify storage sneak:mid line set from storage sneak:mid map[0]
scoreboard players set #x sneak_cal 0
#读取
function sneak:move/return/test/x

##下一行
scoreboard players add #y sneak_cal 1
data remove storage sneak:mid map[0]
execute if data storage sneak:mid map[0] run function sneak:move/return/test/y