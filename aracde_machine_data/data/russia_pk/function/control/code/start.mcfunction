##code状态：重建房间号文本（当前控制位绿色，其余白色）
execute if score @s russia_pk matches 0 run data modify storage russia:pk body set value [{"text":"0","color":"#00ff00"},{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"}]
execute if score @s russia_pk matches 1 run data modify storage russia:pk body set value [{"text":"0","color":"#ffffff"},{"text":"0","color":"#00ff00"},{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"}]
execute if score @s russia_pk matches 2 run data modify storage russia:pk body set value [{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"},{"text":"0","color":"#00ff00"},{"text":"0","color":"#ffffff"}]
execute if score @s russia_pk matches 3 run data modify storage russia:pk body set value [{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"},{"text":"0","color":"#ffffff"},{"text":"0","color":"#00ff00"}]

##填入四位数字
data modify storage russia:pk body[0].text set string storage russia:pk code[0]
data modify storage russia:pk body[1].text set string storage russia:pk code[1]
data modify storage russia:pk body[2].text set string storage russia:pk code[2]
data modify storage russia:pk body[3].text set string storage russia:pk code[3]

##刷新显示板
function russia_pk:start/texture/start
