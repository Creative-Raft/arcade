##获取位置
data modify storage russia:mid x set from storage russia:mid list[0][0]
data modify storage russia:mid y set from storage russia:mid list[0][1]
data remove storage russia:mid list[0]

##更改
function russia:move/move/lock/trans/change with storage russia:mid

execute if data storage russia:mid list[0] run function russia:move/move/lock/trans/round