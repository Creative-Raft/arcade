##结束禁止
execute if score #over russia_cal matches 1 run return fail
##按键
scoreboard players set #back russia_cal 0
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{left:true}}}} run scoreboard players set #left russia_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{forward:true}}}} run scoreboard players set #forward russia_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{right:true}}}} run scoreboard players set #right russia_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{backward:true}}}} run scoreboard players set #back russia_cal 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{jump:true}}}} run scoreboard players set #space russia_cal 1
##判定
execute if score #left russia_cal matches 1 if score #left_las russia_cal matches 0 run function russia:control/left/start
execute if score #forward russia_cal matches 1 if score #forward_las russia_cal matches 0 run function russia:control/rotate/start
execute if score #right russia_cal matches 1 if score #right_las russia_cal matches 0 run function russia:control/right/start
execute if score #space russia_cal matches 1 if score #space_las russia_cal matches 0 run function russia:control/drop/start

scoreboard players operation #left_las russia_cal = #left russia_cal
scoreboard players operation #right_las russia_cal = #right russia_cal
scoreboard players operation #forward_las russia_cal = #forward russia_cal
scoreboard players operation #space_las russia_cal = #space russia_cal

scoreboard players set #left russia_cal 0
scoreboard players set #right russia_cal 0
scoreboard players set #forward russia_cal 0
scoreboard players set #space russia_cal 0