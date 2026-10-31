##插入
data modify storage pac_man:mid num set from storage pac_man:mid line[0]
function pac_man:start/texture/append with storage pac_man:mid
##移除
data remove storage pac_man:mid line[0]

execute if data storage pac_man:mid line[0] run function pac_man:start/texture/x