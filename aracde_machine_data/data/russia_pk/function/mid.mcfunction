##大厅逻辑整段跳过(data.score归russia本体使用,不能被大厅的按键数据覆盖)
execute if entity @s[tag=russia_pk_playing] run return 0

##读取
data modify storage russia:pk code set from entity @s data.code
data modify storage russia:pk body set from entity @s data.body
data modify storage russia:pk score set from entity @s data.score

execute store result score #left_las russia_pk run data get storage russia:pk score.left
execute store result score #right_las russia_pk run data get storage russia:pk score.right
execute store result score #forward_las russia_pk run data get storage russia:pk score.forward
execute store result score #back_las russia_pk run data get storage russia:pk score.back
execute store result score #space_las russia_pk run data get storage russia:pk score.space

##操作
function russia_pk:control/start

##状态:输入房间号/搜寻/准备
execute if entity @s[tag=russia_pk_code] run function russia_pk:control/code/start
execute if entity @s[tag=russia_pk_find] run function russia_pk:control/find/start
execute if entity @s[tag=russia_pk_ready] run function russia_pk:control/ready/start

##本 tick 若已开局（ready/play 已经写好 russia 本体要用的 data.score），不能再写回大厅数据
execute if entity @s[tag=russia_pk_playing] run return 0

##存回
execute store result storage russia:pk score.left int 1 run scoreboard players get #left_las russia_pk
execute store result storage russia:pk score.right int 1 run scoreboard players get #right_las russia_pk
execute store result storage russia:pk score.forward int 1 run scoreboard players get #forward_las russia_pk
execute store result storage russia:pk score.back int 1 run scoreboard players get #back_las russia_pk
execute store result storage russia:pk score.space int 1 run scoreboard players get #space_las russia_pk

data modify entity @s data.code set from storage russia:pk code
data modify entity @s data.body set from storage russia:pk body
data modify entity @s data.score set from storage russia:pk score
