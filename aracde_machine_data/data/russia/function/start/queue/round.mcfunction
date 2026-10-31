##随机位置
execute store result score #random russia_cal run random value 1..999999
scoreboard players operation #random russia_cal %= #place russia_cal

execute store result storage russia:mid place int 1 run scoreboard players get #random russia_cal
##可用位置+1
scoreboard players add #place russia_cal 1

##插入
function russia:start/queue/set with storage russia:mid

##count-1
scoreboard players remove #count russia_cal 1
execute if score #count russia_cal matches 1.. run return run function russia:start/queue/round
scoreboard players set #count russia_cal 9

##num+1
data modify storage russia:mid num set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"num"},{type:"constant",value:1}]}

##type+1
scoreboard players add #type russia_cal 1
execute if score #type russia_cal matches ..7 run return run function russia:start/queue/round