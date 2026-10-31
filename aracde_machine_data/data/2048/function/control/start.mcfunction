##若在上一操作后的短时间内,拒绝操作
execute if score #wait 2048_cal matches 1.. run scoreboard players remove #wait 2048_cal 1
execute if score #wait 2048_cal matches 1.. run return fail
##读取操作
execute on passengers if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{left:true}}}} run scoreboard players set #left 2048_cal 1
execute on passengers if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{right:true}}}} run scoreboard players set #right 2048_cal 1
execute on passengers if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{forward:true}}}} run scoreboard players set #forward 2048_cal 1
execute on passengers if predicate {type:"entity_properties",entity:"this",predicate:{"type_specific/player":{input:{backward:true}}}} run scoreboard players set #back 2048_cal 1
##确定方向
scoreboard players set #facing 2048_cal 0
execute if score #left_las 2048_cal matches 0 if score #left 2048_cal matches 1 run scoreboard players set #facing 2048_cal 1
execute if score #right_las 2048_cal matches 0 if score #right 2048_cal matches 1 run scoreboard players set #facing 2048_cal 2
execute if score #forward_las 2048_cal matches 0 if score #forward 2048_cal matches 1 run scoreboard players set #facing 2048_cal 3
execute if score #back_las 2048_cal matches 0 if score #back 2048_cal matches 1 run scoreboard players set #facing 2048_cal 4
##处理
scoreboard players operation #left_las 2048_cal = #left 2048_cal
scoreboard players operation #right_las 2048_cal = #right 2048_cal
scoreboard players operation #forward_las 2048_cal = #forward 2048_cal
scoreboard players operation #back_las 2048_cal = #back 2048_cal

scoreboard players set #left 2048_cal 0
scoreboard players set #right 2048_cal 0
scoreboard players set #forward 2048_cal 0
scoreboard players set #back 2048_cal 0

##副本
data modify storage 2048:mid map_save set from storage 2048:game game.map
##进行
execute if score #facing 2048_cal matches 1 run function 2048:control/left/start
execute if score #facing 2048_cal matches 2 run function 2048:control/right/start
execute if score #facing 2048_cal matches 3 run function 2048:control/up/start
execute if score #facing 2048_cal matches 4 run function 2048:control/down/start

##检查是否有效
execute store success score #success 2048_cal run data modify storage 2048:mid map_save set from storage 2048:game game.map
execute if score #success 2048_cal matches 0 run return fail
execute at @s on passengers run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 0.4
scoreboard players set #wait 2048_cal 3
##新增方块
function 2048:start/trans/start
##转置
function 2048:start/transpos/start

##画面
data modify storage 2048:game game.map_all set from storage 2048:game game.map
data modify storage 2048:game body set value []
function 2048:start/texture/start

##给展示实体
execute store result storage 2048:mid score int 1 run scoreboard players get #score 2048_cal
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=2048_for] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set from storage 2048:game body
execute as @e[tag=2048_score] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set string storage 2048:mid score

##检查游戏是否还能继续
scoreboard players set #success 2048_cal 0
function 2048:control/test/start

execute if score #success 2048_cal matches 0 run function 2048:control/end