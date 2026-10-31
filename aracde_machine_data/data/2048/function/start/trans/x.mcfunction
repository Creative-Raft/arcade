##预存坐标
execute store result storage 2048:mid pos[0] int 1 run scoreboard players get #x 2048_cal
execute store result storage 2048:mid pos[1] int 1 run scoreboard players get #y 2048_cal
##检查是否为0
execute store result score #type 2048_cal run data get storage 2048:mid line[0]

##若为0,存入random
execute if score #type 2048_cal matches 0 run data modify storage 2048:mid random append from storage 2048:mid pos

##下一个
scoreboard players add #x 2048_cal 1
data remove storage 2048:mid line[0]
execute if data storage 2048:mid line[0] run function 2048:start/trans/x