##若以死亡,不能操控
execute if score #over sneak_cal matches 1 run return fail
##是否按下空格键,若是,切换暂停状态
execute on passengers if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} run scoreboard players set #space sneak_cal 1
execute if score #space_las sneak_cal matches 0 if score #space sneak_cal matches 1 run function sneak:control/pause_change
#继承本刻,防止连续触发
scoreboard players operation #space_las sneak_cal = #space sneak_cal
scoreboard players set #space sneak_cal 0

##如果没有暂停,调整方向
execute if score #pause sneak_cal matches 1 run return 0
##判断目前预输入数量判断应取什么为准
execute store result score #length sneak_cal run data get storage sneak:game game.turn
#已预输入两个,结束
execute if score #length sneak_cal matches 2 run return 0
#已预输入一个,取该方向
execute if score #length sneak_cal matches 1 store result score #now sneak_cal run data get storage sneak:game game.turn[0]
#未预输入,当前方向
execute if score #length sneak_cal matches 0 store result score #now sneak_cal run data get storage sneak:game game.player.facing

##按键
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{left:true}}}} run scoreboard players set #left sneak_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{forward:true}}}} run scoreboard players set #forward sneak_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{right:true}}}} run scoreboard players set #right sneak_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{backward:true}}}} run scoreboard players set #back sneak_cal 1
##判定
scoreboard players set #facing sneak_cal 0
execute if score #left sneak_cal matches 1 if score #left_las sneak_cal matches 0 run scoreboard players set #facing sneak_cal 3
execute if score #forward sneak_cal matches 1 if score #forward_las sneak_cal matches 0 run scoreboard players set #facing sneak_cal 2
execute if score #right sneak_cal matches 1 if score #right_las sneak_cal matches 0 run scoreboard players set #facing sneak_cal 1
execute if score #back sneak_cal matches 1 if score #back_las sneak_cal matches 0 run scoreboard players set #facing sneak_cal 4

scoreboard players operation #left_las sneak_cal = #left sneak_cal
scoreboard players operation #right_las sneak_cal = #right sneak_cal
scoreboard players operation #forward_las sneak_cal = #forward sneak_cal
scoreboard players operation #back_las sneak_cal = #back sneak_cal

scoreboard players set #left sneak_cal 0
scoreboard players set #right sneak_cal 0
scoreboard players set #forward sneak_cal 0
scoreboard players set #back sneak_cal 0

execute if score #facing sneak_cal matches 0 run return fail
scoreboard players remove #facing sneak_cal 1
##判定是否能转向
scoreboard players operation #test sneak_cal = #facing sneak_cal
#同向
execute if score #test sneak_cal = #now sneak_cal run return 0
#反向
scoreboard players add #test sneak_cal 2
execute if score #test sneak_cal matches 4.. run scoreboard players remove #test sneak_cal 4
execute if score #test sneak_cal = #now sneak_cal run return 0

##通过,加入预输入
execute store result storage sneak:mid facing int 1 run scoreboard players get #facing sneak_cal
data modify storage sneak:game game.turn append from storage sneak:mid facing