##判断
execute store result score #type sneak_cal run data get storage sneak:mid line[0]
data remove storage sneak:mid line[0]

##选择处理
function sneak:start/texture/set

data modify storage sneak:game body append from storage sneak:mid type

execute if data storage sneak:mid line[0] run function sneak:start/texture/x