##离开前是否处于大厅状态（边界检测：只有"真的在等/已配对"时才会通知对手）
scoreboard players set #had_lobby russia_pk 0
execute if entity @s[tag=russia_pk_find] run scoreboard players set #had_lobby russia_pk 1
execute if entity @s[tag=russia_pk_ready] run scoreboard players set #had_lobby russia_pk 1

##是否对局中(后面分支要用)
scoreboard players set #playing russia_pk 0
execute if entity @s[tag=russia_pk_playing] run scoreboard players set #playing russia_pk 1
execute if entity @s[tag=russia_pk_playing] run scoreboard players set #had_lobby russia_pk 1

##对局中退出,对手胜利(先通知，再清理自己)
execute if score #playing russia_pk matches 1 run function russia_pk:result/opponent

##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_pk_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add russia_pk_pair
##玩家离开座位时,结束
kill @e[tag=russia_pk_pair,tag=russia_pk_pause]

##同房间号、仍然坐在座位上、且处于搜寻或准备状态的机器（对局中/输入中的都不算）
scoreboard players operation #code russia_pk = @s russia_pk
tag @e[tag=russia_pk_ing] remove russia_pk_ing
execute as @e[tag=russia_pk_find] if score @s russia_pk = #code russia_pk if predicate {type:"entity_properties","entity":"this","predicate":{passenger:{}}} run tag @s add russia_pk_ing
execute as @e[tag=russia_pk_ready] if score @s russia_pk = #code russia_pk if predicate {type:"entity_properties","entity":"this","predicate":{passenger:{}}} run tag @s add russia_pk_ing

##清除
tag @s remove russia_pk_pair
##输入期间
tag @s remove russia_pk_code
##寻找期间
tag @s remove russia_pk_find
##准备期间
tag @s remove russia_pk_ready
tag @s remove russia_pk_ready_on
##对局中
tag @s remove russia_pk_playing
tag @s remove russia_pk_over
tag @s remove russia_pk_ing

##大厅里退出：只通知"离开前确实在大厅状态"时的那台机器的对手，且每台机器只触发一次
execute if score #playing russia_pk matches 0 if score #had_lobby russia_pk matches 1 as @e[tag=russia_pk_ing] run tag @s remove russia_pk_ready
execute if score #playing russia_pk matches 0 if score #had_lobby russia_pk matches 1 as @e[tag=russia_pk_ing] run tag @s remove russia_pk_ready_on
execute if score #playing russia_pk matches 0 if score #had_lobby russia_pk matches 1 as @e[tag=russia_pk_ing] run tag @s remove russia_pk_find
execute if score #playing russia_pk matches 0 if score #had_lobby russia_pk matches 1 as @e[tag=russia_pk_ing] run tag @s add russia_pk_code
execute if score #playing russia_pk matches 0 if score #had_lobby russia_pk matches 1 as @e[tag=russia_pk_ing] run scoreboard players set @s russia_pk 0
execute if score #playing russia_pk matches 0 if score #had_lobby russia_pk matches 1 as @e[tag=russia_pk_ing] on passengers run tellraw @s [{"text":"对手已离开，请重新确认房间号","color":"#ffff00"}]
tag @e[tag=russia_pk_ing] remove russia_pk_ing
##清除统一标记
tag @s remove russia_pk_all
