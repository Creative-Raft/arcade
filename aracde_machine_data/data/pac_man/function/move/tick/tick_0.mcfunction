##调整slow
scoreboard players add #slow pac_man_cal 1
execute if score #slow pac_man_cal matches 2.. run scoreboard players set #slow pac_man_cal 0

##玩家移动
execute if data storage pac_man:game game.turn[0] run function pac_man:move/player/turn
function pac_man:move/player/start

##触发奖励
execute if score #beans pac_man_cal matches 170 if score #70 pac_man_cal matches 1 run function pac_man:move/player/ex_item
execute if score #beans pac_man_cal matches 170 if score #70 pac_man_cal matches 1 run scoreboard players set #70 pac_man_cal 0

execute if score #beans pac_man_cal matches 70 if score #170 pac_man_cal matches 1 run function pac_man:move/player/ex_item
execute if score #beans pac_man_cal matches 70 if score #170 pac_man_cal matches 1 run scoreboard players set #170 pac_man_cal 0
##过关
execute if score #beans pac_man_cal matches 0 run return run function pac_man:start/re_start/re_init

##计算被吃情况
function pac_man:move/eat/start

##蓝色放出
execute if score #blue pac_man_cal matches 1 run function pac_man:move/out/blue/test
##橙色放出
execute if score #orange pac_man_cal matches 1 run function pac_man:move/out/orange/test

##调整包含地图
data modify storage pac_man:game game.map_all set from storage pac_man:game game.map
function pac_man:start/trans/trans

##读取，转化为图片
data modify storage pac_man:game body set value []
function pac_man:start/texture/start

##存入展示屏幕（必须限定同机实体，否则两台机器会抢同一块屏）
data modify entity @e[tag=pac_man_for,tag=pac_man_pair,limit=1] text set from storage pac_man:game body

##调整包含地图供下一次计算应用
data modify storage pac_man:game game.map_all set from storage pac_man:game game.map
function pac_man:start/trans/trans