##记录坐标
execute store result storage 2048:mid x int 1 run scoreboard players get #x 2048_cal
execute store result storage 2048:mid y int 1 run scoreboard players get #y 2048_cal
##周围坐标
data modify storage 2048:mid lx set compute default integer {type:"sub",left:{type:"storage",storage:"2048:mid",path:"x"},right:{type:"constant",value:1}}
data modify storage 2048:mid ly set compute default integer {type:"sub",left:{type:"storage",storage:"2048:mid",path:"y"},right:{type:"constant",value:1}}
data modify storage 2048:mid nx set compute default integer {type:"sub",left:{type:"storage",storage:"2048:mid",path:"x"},right:{type:"constant",value:-1}}
data modify storage 2048:mid ny set compute default integer {type:"sub",left:{type:"storage",storage:"2048:mid",path:"y"},right:{type:"constant",value:-1}}
##读取五个位置的数字
function 2048:control/test/get with storage 2048:mid

##通过情况
execute if score #type 2048_cal matches 0 run scoreboard players set #success 2048_cal 1
execute if score #lx 2048_cal = #type 2048_cal run scoreboard players set #success 2048_cal 1
execute if score #nx 2048_cal = #type 2048_cal run scoreboard players set #success 2048_cal 1
execute if score #ly 2048_cal = #type 2048_cal run scoreboard players set #success 2048_cal 1
execute if score #ny 2048_cal = #type 2048_cal run scoreboard players set #success 2048_cal 1

scoreboard players add #x 2048_cal 1
execute if score #x 2048_cal matches ..3 run function 2048:control/test/x