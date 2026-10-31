##坐标
execute store result storage 2048:mid x int 1 run scoreboard players get #x 2048_cal
execute store result storage 2048:mid y int 1 run scoreboard players get #y 2048_cal

function 2048:control/replace/anti/change with storage 2048:mid

scoreboard players add #x 2048_cal 1
execute if score #x 2048_cal matches ..3 run function 2048:control/replace/anti/x