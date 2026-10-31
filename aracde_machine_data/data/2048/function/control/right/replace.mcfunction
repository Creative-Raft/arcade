##两者交换
$data modify storage 2048:game game.map[$(y)][$(nx)] set from storage 2048:game game.map[$(y)][$(x)]
$data modify storage 2048:game game.map[$(y)][$(x)] set value 0

##继续
data modify storage 2048:mid x set from storage 2048:mid nx
execute store result score #continue 2048_cal run data get storage 2048:mid x
$execute if score #continue 2048_cal matches 3 if score #type 2048_cal matches 9 run data modify storage 2048:game game.map[$(y)][$(x)] set value 2048
execute if score #continue 2048_cal matches ..2 run function 2048:control/right/test with storage 2048:mid