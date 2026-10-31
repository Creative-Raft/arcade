##若以死亡,不能操控
execute store result score #over pac_man_cal run data get entity @s data.score.over
execute if score #over pac_man_cal matches 1 run return fail
##是否按下空格键,若是,切换暂停状态
execute on passengers if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{jump:true}}}} run scoreboard players set #jump pac_man_cal 1
execute if score @s pac_man_cal matches 0 if score #jump pac_man_cal matches 1 run function pac_man:control/pause_change
#继承本刻,防止连续触发
execute run scoreboard players operation @s pac_man_cal = #jump pac_man_cal
scoreboard players set #jump pac_man_cal 0

##如果没有暂停,调整方向
execute if score #pause pac_man_cal matches 1 run return 0
##判断目前预输入数量判断应取什么为准
execute store result score #length pac_man_cal run data get storage pac_man:game game.turn
#已预输入两个,结束
execute if score #length pac_man_cal matches 2 run return 0
#已预输入一个,取该方向
execute if score #length pac_man_cal matches 1 store result score #now pac_man_cal run data get storage pac_man:game game.turn[0]
#未预输入,当前方向
execute if score #length pac_man_cal matches 0 store result score #now pac_man_cal run data get storage pac_man:game game.player.facing

##按键
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{left:true}}}} run scoreboard players set #left pac_man_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{forward:true}}}} run scoreboard players set #forward pac_man_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{right:true}}}} run scoreboard players set #right pac_man_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{backward:true}}}} run scoreboard players set #down pac_man_cal 1
##判定
scoreboard players set #facing pac_man_cal 0
execute if score #left pac_man_cal matches 1 if score #left_las pac_man_cal matches 0 run scoreboard players set #facing pac_man_cal 3
execute if score #forward pac_man_cal matches 1 if score #forward_las pac_man_cal matches 0 run scoreboard players set #facing pac_man_cal 2
execute if score #right pac_man_cal matches 1 if score #right_las pac_man_cal matches 0 run scoreboard players set #facing pac_man_cal 1
execute if score #down pac_man_cal matches 1 if score #down_las pac_man_cal matches 0 run scoreboard players set #facing pac_man_cal 4

scoreboard players operation #left_las pac_man_cal = #left pac_man_cal
scoreboard players operation #right_las pac_man_cal = #right pac_man_cal
scoreboard players operation #forward_las pac_man_cal = #forward pac_man_cal
scoreboard players operation #down_las pac_man_cal = #down pac_man_cal

scoreboard players set #left pac_man_cal 0
scoreboard players set #right pac_man_cal 0
scoreboard players set #forward pac_man_cal 0
scoreboard players set #down pac_man_cal 0

execute if score #facing pac_man_cal matches 0 run return fail
scoreboard players remove #facing pac_man_cal 1
##判定是否能转向
scoreboard players operation #test pac_man_cal = #facing pac_man_cal
#同向
execute if score #test pac_man_cal = #now pac_man_cal run return 0

##通过,加入预输入
execute store result storage pac_man:mid facing int 1 run scoreboard players get #facing pac_man_cal
data modify storage pac_man:game game.turn append from storage pac_man:mid facing