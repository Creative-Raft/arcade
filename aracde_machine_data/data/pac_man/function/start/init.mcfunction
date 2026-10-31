##初始化
data modify storage pac_man:game game set from storage pac_man:base game
#位置
data modify storage pac_man:game game.player.pos set value [23,13]

##除去怪物和吃豆人的地图(避免怪物挤占豆子)
data modify storage pac_man:game game.map set from storage pac_man:base map
##包含的地图
data modify storage pac_man:game game.map_all set from storage pac_man:base map

##调整包含地图,作为显示的基础
function pac_man:start/trans/trans

##读取，转化为图片
data modify storage pac_man:game body set value []
function pac_man:start/texture/start

##特殊时间重置
scoreboard players set #strong_time pac_man_cal 0
scoreboard players set #item_time pac_man_cal 0
##初始分数0
scoreboard players set #score pac_man_cal 0
scoreboard players set #life_score pac_man_cal 0
##初始生命3
scoreboard players set #life pac_man_cal 3
scoreboard players set #over pac_man_cal 0
##关卡豆子数量
scoreboard players set #beans pac_man_cal 240
##在吃掉70和170个豆子时触发奖励物品
scoreboard players set #70 pac_man_cal 1
scoreboard players set #170 pac_man_cal 1
##第一关
scoreboard players set #level pac_man_cal 1

##初始暂停,开始后立即移动
scoreboard players set #pause pac_man_cal 1
scoreboard players set #pace pac_man_cal 1

##第一关散开时间8s,次数不限
scoreboard players set #back_time pac_man_cal 160
scoreboard players set #back pac_man_cal 0
scoreboard players set #stop pac_man_cal 0

##蓝色橙色的出鬼屋以及被吃后出鬼屋时间
scoreboard players set #blue pac_man_cal 31
scoreboard players set #orange pac_man_cal 91
scoreboard players set #death pac_man_cal 80

##基础吃鬼
scoreboard players set #monster pac_man_cal 200

##保存的数据
data modify storage pac_man:game score set value {\
    "strong_time":0,\
    "item_time":0,\
    "score":0,\
    "life_score":0,\
    "life":3,\
    "over":0,\
    "beans":240,\
    "70":1,\
    "170":1,\
    "level":1,\
    "pause":1,\
    "pace":1,\
    "back_time":160,\
    "back":0,\
    "stop":0,\
    "blue":31,\
    "orange":91,\
    "death":80,\
    "monster":200,\
    "slow":0,\
    "left":0,\
    "right":0,\
    "forward":0,\
    "down":0\
}

##屏幕与座位
function pac_man:start/summon

##调整包含地图供下一次计算应用
data modify storage pac_man:game game.map_all set from storage pac_man:game game.map
function pac_man:start/trans/trans