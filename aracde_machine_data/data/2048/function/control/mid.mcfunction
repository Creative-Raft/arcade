##读取数据
data modify storage 2048:game game set from entity @s data.game
data modify storage 2048:game score set from entity @s data.score
##分数
execute store result score #score 2048_cal run data get storage 2048:game game.score
execute store result score #over 2048_cal run data get storage 2048:game game.over
execute store result score #left_las 2048_cal run data get storage 2048:game score.left
execute store result score #right_las 2048_cal run data get storage 2048:game score.right
execute store result score #forward_las 2048_cal run data get storage 2048:game score.forward
execute store result score #back_las 2048_cal run data get storage 2048:game score.back
execute store result score #wait 2048_cal run data get storage 2048:game score.wait

execute store result score #test arcade_machine_pair run random value 1..100
##读取操作
execute if score #over 2048_cal matches 0 run function 2048:control/start

##逆存储
execute store result storage 2048:game score.left int 1 run scoreboard players get #left_las 2048_cal
execute store result storage 2048:game score.right int 1 run scoreboard players get #right_las 2048_cal
execute store result storage 2048:game score.forward int 1 run scoreboard players get #forward_las 2048_cal
execute store result storage 2048:game score.back int 1 run scoreboard players get #back_las 2048_cal
execute store result storage 2048:game score.wait int 1 run scoreboard players get #wait 2048_cal
execute store result storage 2048:game game.over int 1 run scoreboard players get #over 2048_cal
execute store result storage 2048:game game.score int 1 run scoreboard players get #score 2048_cal

data modify entity @s data.game set from storage 2048:game game
data modify entity @s data.score set from storage 2048:game score