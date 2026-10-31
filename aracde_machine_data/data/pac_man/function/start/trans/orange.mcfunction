##若已生成，读取
data modify storage pac_man:mid y set from storage pac_man:game game.orange.pos[0]
data modify storage pac_man:mid x set from storage pac_man:game game.orange.pos[1]
data modify storage pac_man:mid num set value 13
function pac_man:start/trans/change with storage pac_man:mid