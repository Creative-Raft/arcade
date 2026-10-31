##读取第一个
data modify storage russia:mid x set from storage russia:mid list[0][0]
data modify storage russia:mid y set from storage russia:mid list[0][1]
data remove storage russia:mid list[0]
##获取
function russia:move/move/test/get with storage russia:mid
##已有方块,结束
execute unless score #type russia_cal matches 0 run return 0
##还有,继续
execute if data storage russia:mid list[0] run return run function russia:move/move/test/test

##成功
return 1