##确定需要检查的行
data modify storage russia:mid test set value []
data modify storage russia:mid test append compute default integer {\
"type":"from_float",input:{"type":"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[1]"},{type:"constant",value:-0.5}]}}
data modify storage russia:mid test append compute default integer {\
"type":"from_float",input:{"type":"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[1]"},{type:"constant",value:0.5}]}}
##开始
function russia:move/move/lock/test/start