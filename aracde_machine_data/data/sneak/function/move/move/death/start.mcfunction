##替换
data modify storage sneak:mid death.pos set from storage sneak:mid death.body[0]
data remove storage sneak:mid death.body[0]
##存入
data modify storage sneak:mid x set from storage sneak:mid death.pos[0]
data modify storage sneak:mid y set from storage sneak:mid death.pos[1]
##每个块20%变为豆子
data modify storage sneak:mid type set value 0
execute if predicate {type:"random_chance",chance:0.2} run data modify storage sneak:mid type set value 1
execute store result score #test sneak_cal run data get storage sneak:mid type
execute if score #test sneak_cal matches 1 run scoreboard players add #beans_count sneak_cal 1
##替换
function sneak:move/move/change with storage sneak:mid
##循环
execute if data storage sneak:mid death.body[0] run function sneak:move/move/death/start