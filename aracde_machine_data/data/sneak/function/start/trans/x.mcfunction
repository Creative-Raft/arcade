##预存坐标
execute store result storage sneak:mid pos[0] int 1 run scoreboard players get #x sneak_cal
execute store result storage sneak:mid pos[1] int 1 run scoreboard players get #y sneak_cal
##检查是否为0
execute store result score #type sneak_cal run data get storage sneak:mid line[0]

##若为0,存入random
execute if score #type sneak_cal matches 0 run data modify storage sneak:mid random append from storage sneak:mid pos

##下一个
scoreboard players add #x sneak_cal 1
data remove storage sneak:mid line[0]
execute if data storage sneak:mid line[0] run function sneak:start/trans/x