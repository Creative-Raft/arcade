##两人都准备好,各自进入对局
scoreboard players operation #code russia_pk = @s russia_pk

##房间内的两台机器
tag @e[tag=russia_pk_room] remove russia_pk_room
execute as @e[tag=russia_pk_ready] if score @s russia_pk = #code russia_pk run tag @s add russia_pk_room

##清掉大厅状态，标上"对局中"
execute as @e[tag=russia_pk_room] run tag @s remove russia_pk_ready
execute as @e[tag=russia_pk_room] run tag @s remove russia_pk_ready_on
execute as @e[tag=russia_pk_room] run tag @s remove russia_pk_find
execute as @e[tag=russia_pk_room] run tag @s remove russia_pk_code
execute as @e[tag=russia_pk_room] run tag @s add russia_pk_playing

##撤掉房间号显示板，各自进入俄罗斯方块本体
execute as @e[tag=russia_pk_room] run function russia_pk:control/ready/room/kill
execute as @e[tag=russia_pk_room] run function russia:start/init

tag @e[tag=russia_pk_room] remove russia_pk_room
