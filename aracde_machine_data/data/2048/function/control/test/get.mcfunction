##读取
$execute store result score #type 2048_cal run data get storage 2048:game game.map[$(y)][$(x)]
$execute store result score #lx 2048_cal run data get storage 2048:game game.map[$(y)][$(lx)]
$execute store result score #nx 2048_cal run data get storage 2048:game game.map[$(y)][$(nx)]
$execute store result score #ly 2048_cal run data get storage 2048:game game.map[$(ly)][$(x)]
$execute store result score #ny 2048_cal run data get storage 2048:game game.map[$(ny)][$(x)]

execute if score #x 2048_cal matches 0 run scoreboard players set #lx 2048_cal 99999
execute if score #x 2048_cal matches 3 run scoreboard players set #nx 2048_cal 99999
execute if score #y 2048_cal matches 0 run scoreboard players set #ly 2048_cal 99999
execute if score #y 2048_cal matches 3 run scoreboard players set #ny 2048_cal 99999