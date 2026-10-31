##两者合并
scoreboard players operation #type 2048_cal += #type 2048_cal
$execute store result storage 2048:mid map_s[$(y)][$(nx)] int 1 run scoreboard players get #type 2048_cal
$data modify storage 2048:game game.map[$(y)][$(x)] set value 0
$data modify storage 2048:game game.map[$(y)][$(nx)] set value 1
##分数
scoreboard players operation #score 2048_cal += #type 2048_cal