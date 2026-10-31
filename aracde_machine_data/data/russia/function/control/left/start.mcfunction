##获取当前
data modify storage russia:mid block set from storage russia:game game.now
data modify storage russia:mid block.center[0] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.center[0]"},{type:"constant",value:-1}]}
data modify storage russia:mid block.pos[0][0] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[0][0]"},{type:"constant",value:-1}]}
data modify storage russia:mid block.pos[1][0] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[1][0]"},{type:"constant",value:-1}]}
data modify storage russia:mid block.pos[2][0] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[2][0]"},{type:"constant",value:-1}]}
data modify storage russia:mid block.pos[3][0] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[3][0]"},{type:"constant",value:-1}]}
##下位
execute store result score #x russia_cal run data get storage russia:mid block.pos[0][0]
execute unless score #x russia_cal matches 0..9 run return 0
execute store result score #x russia_cal run data get storage russia:mid block.pos[1][0]
execute unless score #x russia_cal matches 0..9 run return 0
execute store result score #x russia_cal run data get storage russia:mid block.pos[2][0]
execute unless score #x russia_cal matches 0..9 run return 0
execute store result score #x russia_cal run data get storage russia:mid block.pos[3][0]
execute unless score #x russia_cal matches 0..9 run return 0

##进行检查,是否重叠
data modify storage russia:mid list set from storage russia:mid block.pos
execute store result score #success russia_cal run function russia:move/move/test/test
##若重叠,失败
execute if score #success russia_cal matches 0 run return 0

##否则,替换
data modify storage russia:game game.now set from storage russia:mid block