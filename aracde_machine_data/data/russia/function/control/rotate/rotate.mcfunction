##转动
data modify storage russia:mid block set from storage russia:game game.now
execute store result score #rotate russia_cal run data get storage russia:mid block.rotate

data modify storage russia:mid block.rotate set compute default integer {type:"mod",left:{type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.rotate"},{type:"constant",value:1}]},right:{type:"constant",value:4}}

##转动
data modify storage russia:mid block.offset[0] append from storage russia:mid block.offset[0][0]
data remove storage russia:mid block.offset[0][0]
data modify storage russia:mid block.offset[0][0] set compute default float {type:"negate",input:{type:"storage"\
,storage:"russia:mid",path:"block.offset[0][0]"}}
data modify storage russia:mid block.pos[0][0] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[0]"}, {type:"storage","storage":"russia:mid",path:"block.offset[0][0]"}]}
data modify storage russia:mid block.pos[0][1] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[1]"}, {type:"storage","storage":"russia:mid",path:"block.offset[0][1]"}]}

data modify storage russia:mid block.offset[1] append from storage russia:mid block.offset[1][0]
data remove storage russia:mid block.offset[1][0]
data modify storage russia:mid block.offset[1][0] set compute default float {type:"negate",input:{type:"storage"\
,storage:"russia:mid",path:"block.offset[1][0]"}}
data modify storage russia:mid block.pos[1][0] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[0]"}, {type:"storage","storage":"russia:mid",path:"block.offset[1][0]"}]}
data modify storage russia:mid block.pos[1][1] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[1]"}, {type:"storage","storage":"russia:mid",path:"block.offset[1][1]"}]}

data modify storage russia:mid block.offset[2] append from storage russia:mid block.offset[2][0]
data remove storage russia:mid block.offset[2][0]
data modify storage russia:mid block.offset[2][0] set compute default float {type:"negate",input:{type:"storage"\
,storage:"russia:mid",path:"block.offset[2][0]"}}
data modify storage russia:mid block.pos[2][0] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[0]"}, {type:"storage","storage":"russia:mid",path:"block.offset[2][0]"}]}
data modify storage russia:mid block.pos[2][1] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[1]"}, {type:"storage","storage":"russia:mid",path:"block.offset[2][1]"}]}

data modify storage russia:mid block.offset[3] append from storage russia:mid block.offset[3][0]
data remove storage russia:mid block.offset[3][0]
data modify storage russia:mid block.offset[3][0] set compute default float {type:"negate",input:{type:"storage"\
,storage:"russia:mid",path:"block.offset[3][0]"}}
data modify storage russia:mid block.pos[3][0] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[0]"}, {type:"storage","storage":"russia:mid",path:"block.offset[3][0]"}]}
data modify storage russia:mid block.pos[3][1] set compute default float {type:"add",inputs:[\
{type:"storage",storage:"russia:mid",path:"block.center[1]"}, {type:"storage","storage":"russia:mid",path:"block.offset[3][1]"}]}