##读取
data modify storage russia:game game set from entity @s data.game
data modify storage russia:game score set from entity @s data.score

execute store result score #score russia_cal run data get storage russia:game game.score
execute store result score #lines russia_cal run data get storage russia:game game.count
execute store result score #over russia_cal run data get storage russia:game game.over
##PK：被判负（或被对手判胜）后保持结束状态——用标签记，避免被下面的写回覆盖
execute if entity @s[tag=russia_pk_over] run scoreboard players set #over russia_cal 1
##操作
execute store result score #left_las russia_cal run data get storage russia:game score.left
execute store result score #right_las russia_cal run data get storage russia:game score.right
execute store result score #forward_las russia_cal run data get storage russia:game score.forward
execute store result score #space_las russia_cal run data get storage russia:game score.space
##下移
execute store result score #pace russia_cal run data get storage russia:game score.pace
execute store result score #down russia_cal run data get storage russia:game score.down

##每行基础分数
scoreboard players set #score_base russia_cal 100

##垃圾行
execute if entity @s[tag=russia_pk_playing] if data storage russia:game game.pending run function russia_pk:rubbish/insert

##操作
function russia:control/start
##移动
function russia:move/start

##存回
execute store result storage russia:game game.score int 1 run scoreboard players get #score russia_cal
execute store result storage russia:game game.count int 1 run scoreboard players get #lines russia_cal
execute store result storage russia:game game.over int 1 run scoreboard players get #over russia_cal

execute store result storage russia:game score.left int 1 run scoreboard players get #left_las russia_cal
execute store result storage russia:game score.right int 1 run scoreboard players get #right_las russia_cal
execute store result storage russia:game score.forward int 1 run scoreboard players get #forward_las russia_cal
execute store result storage russia:game score.space int 1 run scoreboard players get #space_las russia_cal

execute store result storage russia:game score.pace int 1 run scoreboard players get #pace russia_cal
execute store result storage russia:game score.down int 1 run scoreboard players get #down russia_cal
##存储
data modify entity @s data.game set from storage russia:game game
data modify entity @s data.score set from storage russia:game score