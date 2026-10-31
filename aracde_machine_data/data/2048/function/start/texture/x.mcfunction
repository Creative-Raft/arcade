##插入
execute store result score #num 2048_cal run data get storage 2048:mid line[0]
function 2048:start/texture/append
##移除
data remove storage 2048:mid line[0]

execute if data storage 2048:mid line[0] run function 2048:start/texture/x