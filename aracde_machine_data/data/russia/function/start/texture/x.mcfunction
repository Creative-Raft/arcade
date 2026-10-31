##插入
data modify storage russia:mid num set from storage russia:mid line[0]
function russia:start/texture/append with storage russia:mid
##移除
data remove storage russia:mid line[0]

execute if data storage russia:mid line[0] run function russia:start/texture/x