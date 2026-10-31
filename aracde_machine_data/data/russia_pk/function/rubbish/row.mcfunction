##垃圾行（随机 1 格为 0，其余 9 格为 8）
data modify storage russia:pk rubbish set value [8,8,8,8,8,8,8,8,8,8]
execute store result storage russia:pk n int 1 run random value 0..9
function russia_pk:rubbish/hole with storage russia:pk

##插到最底部：末尾加一行，再删掉最上面的计算行（等于整体上移一格）
data modify storage russia:game game.map append from storage russia:pk rubbish
data remove storage russia:game game.map[0]

##没有正在下落的方块 → 结束
execute unless data storage russia:game game.now.pos run return 0

##检测方块与抬升后的地图是否重合
data modify storage russia:mid list set from storage russia:game game.now.pos
execute store result score #success russia_cal run function russia:move/move/test/test
execute if score #success russia_cal matches 1 run return 0

##重合 → 先看方块是否已经贴到最顶行（再上升就出界）→ 判负
execute store result score #top russia_cal run data get storage russia:game game.now.pos[0][1]
execute store result score #top2 russia_cal run data get storage russia:game game.now.pos[1][1]
execute if score #top2 russia_cal < #top russia_cal run scoreboard players operation #top russia_cal = #top2 russia_cal
execute store result score #top2 russia_cal run data get storage russia:game game.now.pos[2][1]
execute if score #top2 russia_cal < #top russia_cal run scoreboard players operation #top russia_cal = #top2 russia_cal
execute store result score #top2 russia_cal run data get storage russia:game game.now.pos[3][1]
execute if score #top2 russia_cal < #top russia_cal run scoreboard players operation #top russia_cal = #top2 russia_cal
execute if score #top russia_cal matches ..0 run return run function russia:move/end

##抬一格并固定住
function russia_pk:rubbish/lift
function russia:move/move/lock/start
