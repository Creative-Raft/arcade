##数据转储
data modify storage pac_man:game game set from entity @s data.game
data modify storage pac_man:game score set from entity @s data.score

##转存分数
execute store result score #strong_time pac_man_cal run data get storage pac_man:game score.strong_time
execute store result score #item_time pac_man_cal run data get storage pac_man:game score.item_time
execute store result score #score pac_man_cal run data get storage pac_man:game score.score
execute store result score #life_score pac_man_cal run data get storage pac_man:game score.life_score
execute store result score #life pac_man_cal run data get storage pac_man:game score.life
execute store result score #over pac_man_cal run data get storage pac_man:game score.over
execute store result score #beans pac_man_cal run data get storage pac_man:game score.beans
execute store result score #70 pac_man_cal run data get storage pac_man:game score.70
execute store result score #170 pac_man_cal run data get storage pac_man:game score.170
execute store result score #level pac_man_cal run data get storage pac_man:game score.level
execute store result score #pause pac_man_cal run data get storage pac_man:game score.pause
execute store result score #pace pac_man_cal run data get storage pac_man:game score.pace
execute store result score #back_time pac_man_cal run data get storage pac_man:game score.back_time
execute store result score #back pac_man_cal run data get storage pac_man:game score.back
execute store result score #stop pac_man_cal run data get storage pac_man:game score.stop
execute store result score #blue pac_man_cal run data get storage pac_man:game score.blue
execute store result score #orange pac_man_cal run data get storage pac_man:game score.orange
execute store result score #death pac_man_cal run data get storage pac_man:game score.death
execute store result score #monster pac_man_cal run data get storage pac_man:game score.monster
execute store result score #slow pac_man_cal run data get storage pac_man:game score.slow

execute store result score #left_las pac_man_cal run data get storage pac_man:game score.left
execute store result score #right_las pac_man_cal run data get storage pac_man:game score.right
execute store result score #forward_las pac_man_cal run data get storage pac_man:game score.forward
execute store result score #down_las pac_man_cal run data get storage pac_man:game score.down

##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=pac_man_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add pac_man_pair

##操作
function pac_man:control/start
##进行
function pac_man:move/move

##清除标记
tag @e[tag=pac_man_pair] remove pac_man_pair

##存回数据
execute store result storage pac_man:game score.strong_time int 1 run scoreboard players get #strong_time pac_man_cal
execute store result storage pac_man:game score.item_time int 1 run scoreboard players get #item_time pac_man_cal
execute store result storage pac_man:game score.score int 1 run scoreboard players get #score pac_man_cal
execute store result storage pac_man:game score.life_score int 1 run scoreboard players get #life_score pac_man_cal
execute store result storage pac_man:game score.life int 1 run scoreboard players get #life pac_man_cal
execute store result storage pac_man:game score.over int 1 run scoreboard players get #over pac_man_cal
execute store result storage pac_man:game score.beans int 1 run scoreboard players get #beans pac_man_cal
execute store result storage pac_man:game score.70 int 1 run scoreboard players get #70 pac_man_cal
execute store result storage pac_man:game score.170 int 1 run scoreboard players get #170 pac_man_cal
execute store result storage pac_man:game score.level int 1 run scoreboard players get #level pac_man_cal
execute store result storage pac_man:game score.pace int 1 run scoreboard players get #pace pac_man_cal
execute store result storage pac_man:game score.pause int 1 run scoreboard players get #pause pac_man_cal
execute store result storage pac_man:game score.back_time int 1 run scoreboard players get #back_time pac_man_cal
execute store result storage pac_man:game score.back int 1 run scoreboard players get #back pac_man_cal
execute store result storage pac_man:game score.stop int 1 run scoreboard players get #stop pac_man_cal
execute store result storage pac_man:game score.blue int 1 run scoreboard players get #blue pac_man_cal
execute store result storage pac_man:game score.orange int 1 run scoreboard players get #orange pac_man_cal
execute store result storage pac_man:game score.death int 1 run scoreboard players get #death pac_man_cal
execute store result storage pac_man:game score.monster int 1 run scoreboard players get #monster pac_man_cal
execute store result storage pac_man:game score.slow int 1 run scoreboard players get #slow pac_man_cal

execute store result storage pac_man:game score.left int 1 run scoreboard players get #left_las pac_man_cal
execute store result storage pac_man:game score.right int 1 run scoreboard players get #right_las pac_man_cal
execute store result storage pac_man:game score.forward int 1 run scoreboard players get #forward_las pac_man_cal
execute store result storage pac_man:game score.down int 1 run scoreboard players get #down_las pac_man_cal

##数据存储
data modify entity @s data.game set from storage pac_man:game game
data modify entity @s data.score set from storage pac_man:game score