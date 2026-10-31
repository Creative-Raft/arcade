##逐个进行
scoreboard players set #x 2048_cal 0
function 2048:control/test/x

scoreboard players add #y 2048_cal 1
execute if score #y 2048_cal matches ..3 run function 2048:control/test/y