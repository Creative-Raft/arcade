##存入
data modify storage sneak:mid death set value {pos:[0,0],body:[]}
data modify storage sneak:mid death.body set from storage sneak:game game.player.body
data modify storage sneak:mid death.body prepend from storage sneak:game game.player.pos
#长度
execute store result score #length sneak_cal run data get storage sneak:game game.player.body
execute store result storage sneak:mid length int 1 run scoreboard players get #length sneak_cal
data modify storage sneak:game game.player.body set value []
execute at @s on passengers run playsound entity.spider.death ambient @s ~ ~ ~ 0.25
function sneak:move/move/death/start
##长度调整(-(50%+5))
data modify storage sneak:game game.player.length set compute default integer {\
"type":"max",inputs:[{type:"constant",value:0},{\
"type":"sub",right:{type:"constant",value:5},left:{\
"type":"from_float",input:{\
"type":"mul",inputs:[{type:"constant",value:0.5},{type:"storage",storage:"sneak:mid",path:"length"}]}}}]}
##检查是否能复活
execute store result score #test sneak_cal run data get storage sneak:game game.player.length
execute if score #test sneak_cal matches 1.. run scoreboard players set #player sneak_cal 120
