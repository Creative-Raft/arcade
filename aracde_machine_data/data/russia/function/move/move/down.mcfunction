##获取当前
data modify storage russia:mid block set from storage russia:game game.now
data modify storage russia:mid block.center[1] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.center[1]"},{type:"constant",value:1}]}
data modify storage russia:mid block.pos[0][1] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[0][1]"},{type:"constant",value:1}]}
data modify storage russia:mid block.pos[1][1] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[1][1]"},{type:"constant",value:1}]}
data modify storage russia:mid block.pos[2][1] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[2][1]"},{type:"constant",value:1}]}
data modify storage russia:mid block.pos[3][1] set compute default float {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.pos[3][1]"},{type:"constant",value:1}]}
##下位
execute store result score #y russia_cal run data get storage russia:mid block.pos[0][1]
execute if score #y russia_cal matches 22.. run return run function russia:move/move/lock/start
execute store result score #y russia_cal run data get storage russia:mid block.pos[1][1]
execute if score #y russia_cal matches 22.. run return run function russia:move/move/lock/start
execute store result score #y russia_cal run data get storage russia:mid block.pos[2][1]
execute if score #y russia_cal matches 22.. run return run function russia:move/move/lock/start
execute store result score #y russia_cal run data get storage russia:mid block.pos[3][1]
execute if score #y russia_cal matches 22.. run return run function russia:move/move/lock/start

##进行检查,是否重叠
data modify storage russia:mid list set from storage russia:mid block.pos
execute store result score #success russia_cal run function russia:move/move/test/test
##若重叠,锁定
execute if score #success russia_cal matches 0 run return run function russia:move/move/lock/start

##否则,替换
data modify storage russia:game game.now set from storage russia:mid block