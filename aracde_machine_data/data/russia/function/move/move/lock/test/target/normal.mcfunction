##确定需要检查的行
data modify storage russia:mid test set value []
data modify storage russia:mid test append compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.center[1]"},{type:"constant",value:-1}]}
data modify storage russia:mid test append compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.center[1]"},{type:"constant",value:0}]}
data modify storage russia:mid test append compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"russia:mid",path:"block.center[1]"},{type:"constant",value:1}]}
##开始
function russia:move/move/lock/test/start