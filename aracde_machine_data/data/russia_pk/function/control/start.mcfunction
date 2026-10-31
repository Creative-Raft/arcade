##按键（本刻）
scoreboard players set #left russia_pk 0
scoreboard players set #right russia_pk 0
scoreboard players set #forward russia_pk 0
scoreboard players set #back russia_pk 0
scoreboard players set #space russia_pk 0
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{left:true}}}} run scoreboard players set #left russia_pk 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{right:true}}}} run scoreboard players set #right russia_pk 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{forward:true}}}} run scoreboard players set #forward russia_pk 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{backward:true}}}} run scoreboard players set #back russia_pk 1
execute on passengers if predicate {type:"entity_properties","entity":"this","predicate":{"type_specific/player":{input:{jump:true}}}} run scoreboard players set #space russia_pk 1

##判定（仅在刚按下时触发一次）
#code状态：左右移位、前后改数字、空格确认
execute if entity @s[tag=russia_pk_code] if score #left russia_pk matches 1 if score #left_las russia_pk matches 0 run function russia_pk:control/code/left
execute if entity @s[tag=russia_pk_code] if score #right russia_pk matches 1 if score #right_las russia_pk matches 0 run function russia_pk:control/code/right
execute if entity @s[tag=russia_pk_code] if score #forward russia_pk matches 1 if score #forward_las russia_pk matches 0 run function russia_pk:control/code/forward
execute if entity @s[tag=russia_pk_code] if score #back russia_pk matches 1 if score #back_las russia_pk matches 0 run function russia_pk:control/code/back
execute if entity @s[tag=russia_pk_code] if score #space russia_pk matches 1 if score #space_las russia_pk matches 0 run function russia_pk:control/code/space
#find状态：空格取消搜寻，退回输入房间号
execute if entity @s[tag=russia_pk_find] if score #space russia_pk matches 1 if score #space_las russia_pk matches 0 run function russia_pk:control/find/space
#ready状态：空格"松手"时切换准备（按下不触发，避免开局瞬间把按住的空格当成硬降）
execute if entity @s[tag=russia_pk_ready] if score #space russia_pk matches 0 if score #space_las russia_pk matches 1 run function russia_pk:control/ready/space

##同步
scoreboard players operation #left_las russia_pk = #left russia_pk
scoreboard players operation #right_las russia_pk = #right russia_pk
scoreboard players operation #forward_las russia_pk = #forward russia_pk
scoreboard players operation #back_las russia_pk = #back russia_pk
scoreboard players operation #space_las russia_pk = #space russia_pk

##清除
scoreboard players set #left russia_pk 0
scoreboard players set #right russia_pk 0
scoreboard players set #forward russia_pk 0
scoreboard players set #back russia_pk 0
scoreboard players set #space russia_pk 0
