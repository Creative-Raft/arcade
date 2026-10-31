##现在的
data modify storage russia:mid type set from storage russia:game game.queue[0]
data remove storage russia:game game.queue[0]
data modify storage russia:mid type set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"type"},{type:"constant",value:-1}]}
##记录
function russia:start/set/set with storage russia:mid
data modify storage russia:game game.now set from storage russia:mid type

##若不足,补充
execute unless data storage russia:game game.queue[0] run function russia:start/queue/start

##下一个
data modify storage russia:mid type set from storage russia:game game.queue[0]
data modify storage russia:mid type set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"type"},{type:"constant",value:-1}]}
##记录
function russia:start/set/set with storage russia:mid
data modify storage russia:game game.next set from storage russia:mid type