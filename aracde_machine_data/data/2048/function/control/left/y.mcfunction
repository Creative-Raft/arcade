##从第二个开始
scoreboard players set #x 2048_cal 1
function 2048:control/left/x

scoreboard players add #y 2048_cal 1
execute if score #y 2048_cal matches ..3 run function 2048:control/left/y