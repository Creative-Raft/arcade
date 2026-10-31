##存入数据
execute on vehicle run data modify storage arcade_machine:mid key set from entity @s data.key
execute store result score #left_las arcade_machine_cal run data get storage arcade_machine:mid key.left
execute store result score #right_las arcade_machine_cal run data get storage arcade_machine:mid key.right
execute store result score #jump_las arcade_machine_cal run data get storage arcade_machine:mid key.jump

##本刻的情况
execute if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{left:true}}}} run scoreboard players set #left arcade_machine_cal 1
execute if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{right:true}}}} run scoreboard players set #right arcade_machine_cal 1
execute if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} run scoreboard players set #jump arcade_machine_cal 1

##执行
execute if score #jump_las arcade_machine_cal matches 1 if score #jump arcade_machine_cal matches 0 on vehicle run function arcade_machine:choose/game
execute if score #left_las arcade_machine_cal matches 0 if score #left arcade_machine_cal matches 1 unless score #jump arcade_machine_cal matches 1 on vehicle run function arcade_machine:choose/left
execute if score #right_las arcade_machine_cal matches 0 if score #right arcade_machine_cal matches 1 unless score #jump arcade_machine_cal matches 1 on vehicle run function arcade_machine:choose/right

##同步
scoreboard players operation #jump_las arcade_machine_cal = #jump arcade_machine_cal
scoreboard players operation #left_las arcade_machine_cal = #left arcade_machine_cal
scoreboard players operation #right_las arcade_machine_cal = #right arcade_machine_cal
##清除
scoreboard players set #jump arcade_machine_cal 0
scoreboard players set #right arcade_machine_cal 0
scoreboard players set #left arcade_machine_cal 0

##记录
execute store result storage arcade_machine:mid key.jump int 1 run scoreboard players get #jump_las arcade_machine_cal
execute store result storage arcade_machine:mid key.left int 1 run scoreboard players get #left_las arcade_machine_cal
execute store result storage arcade_machine:mid key.right int 1 run scoreboard players get #right_las arcade_machine_cal
execute on vehicle run data modify entity @s data.key set from storage arcade_machine:mid key