##存储
data modify storage sneak:game game set from entity @s data.game
data modify storage sneak:game score set from entity @s data.score
##分数
execute store result score #score sneak_cal run data get storage sneak:game game.score
execute store result score #over sneak_cal run data get storage sneak:game game.over

execute store result score #left_las sneak_cal run data get storage sneak:game score.left
execute store result score #forward_las sneak_cal run data get storage sneak:game score.forward
execute store result score #right_las sneak_cal run data get storage sneak:game score.right
execute store result score #back_las sneak_cal run data get storage sneak:game score.back
execute store result score #space_las sneak_cal run data get storage sneak:game score.space

execute store result score #pause sneak_cal run data get storage sneak:game score.pause
execute store result score #blue sneak_cal run data get storage sneak:game score.blue
execute store result score #yellow sneak_cal run data get storage sneak:game score.yellow
execute store result score #green sneak_cal run data get storage sneak:game score.green
execute store result score #player sneak_cal run data get storage sneak:game score.player

execute store result score #beans sneak_cal run data get storage sneak:game score.beans
execute store result score #beans_count sneak_cal run data get storage sneak:game score.beans_count
execute store result score #pace sneak_cal run data get storage sneak:game score.pace
execute store result score #time sneak_cal run data get storage sneak:game score.time

##操作
function sneak:control/start
##移动
function sneak:move/start

##存回
execute store result storage sneak:game game.score int 1 run scoreboard players get #score sneak_cal
execute store result storage sneak:game game.over int 1 run scoreboard players get #over sneak_cal

execute store result storage sneak:game score.left int 1 run scoreboard players get #left_las sneak_cal
execute store result storage sneak:game score.right int 1 run scoreboard players get #right_las sneak_cal
execute store result storage sneak:game score.forward int 1 run scoreboard players get #forward_las sneak_cal
execute store result storage sneak:game score.back int 1 run scoreboard players get #back_las sneak_cal
execute store result storage sneak:game score.space int 1 run scoreboard players get #space_las sneak_cal

execute store result storage sneak:game score.pause int 1 run scoreboard players get #pause sneak_cal
execute store result storage sneak:game score.player int 1 run scoreboard players get #player sneak_cal
execute store result storage sneak:game score.blue int 1 run scoreboard players get #blue sneak_cal
execute store result storage sneak:game score.yellow int 1 run scoreboard players get #yellow sneak_cal
execute store result storage sneak:game score.green int 1 run scoreboard players get #green sneak_cal

execute store result storage sneak:game score.beans int 1 run scoreboard players get #beans sneak_cal
execute store result storage sneak:game score.beans_count int 1 run scoreboard players get #beans_count sneak_cal
execute store result storage sneak:game score.pace int 1 run scoreboard players get #pace sneak_cal
execute store result storage sneak:game score.time int 1 run scoreboard players get #time sneak_cal

data modify entity @s data.game set from storage sneak:game game
data modify entity @s data.score set from storage sneak:game score