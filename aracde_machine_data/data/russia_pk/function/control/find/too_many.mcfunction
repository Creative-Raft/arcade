##同一房间号已满两人：提示并退回输入状态
execute on passengers run tellraw @s [{"text":"[PK] 该房间号已被占用，请换一个房间号","color":"#ff0000"}]

##重置房间号与光标
data modify storage russia:pk code set value [0,0,0,0]
scoreboard players set @s russia_pk 0

##退回输入状态（下一 tick 由 code 状态重新渲染 0000）
tag @s remove russia_pk_find
tag @s add russia_pk_code
