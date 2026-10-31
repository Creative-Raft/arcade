##初始化
data modify storage pac_man:game game set from storage pac_man:base game
#位置
data modify storage pac_man:game game.player.pos set value [23,13]
#鬼屋
data modify storage pac_man:game game.death set value []

##特殊时间重置
scoreboard players set #strong_time pac_man_cal 0
scoreboard players set #item_time pac_man_cal 0
##关卡豆子数量
scoreboard players set #beans pac_man_cal 240
##在吃掉70和170个豆子时触发奖励物品
scoreboard players set #70 pac_man_cal 1
scoreboard players set #170 pac_man_cal 1
##第?关
scoreboard players add #level pac_man_cal 1
execute store result storage pac_man:mid level int 1 run scoreboard players get #level pac_man_cal
data modify entity @e[tag=pac_man_score,tag=pac_man_pair,limit=1] text.extra[0] set string storage pac_man:mid level
##复活时间重置
scoreboard players set #death pac_man_cal 80
##散开时间
scoreboard players set #back_time pac_man_cal 140
execute if score #level pac_man_cal matches 4.. run scoreboard players set #back_time pac_man_cal 100
scoreboard players set #back pac_man_cal 0
scoreboard players set #stop pac_man_cal 0

##橙色蓝色特殊情况
execute if score #level pac_man_cal matches 2.. run data modify storage pac_man:game game.blue set value {pos:[11,15],out:1,home:[26,29]}
execute if score #level pac_man_cal matches 2 run scoreboard players set #orange pac_man_cal 50
execute if score #level pac_man_cal matches 3.. run data modify storage pac_man:game game.orange set value {pos:[11,13],out:1,home:[26,1]}

##除去怪物和吃豆人的地图(避免怪物挤占豆子)
data modify storage pac_man:game game.map set from storage pac_man:base map
##包含的地图
data modify storage pac_man:game game.map_all set from storage pac_man:base map

##调整包含地图,作为显示的基础
function pac_man:start/trans/trans

##读取，转化为图片
data modify storage pac_man:game body set value []
function pac_man:start/texture/start

##屏幕与座位
function pac_man:start/re_start/change

##初始暂停,开始后立即移动
scoreboard players set #pause pac_man_cal 1
scoreboard players set #pace pac_man_cal 1
data modify entity @e[tag=pac_man_pause,tag=pac_man_pair,limit=1] text set value "暂停中"
##音效
execute as @e[tag=pac_man_player] on passengers at @s run playsound entity.firework_rocket.blast_far ambient @s ~ ~ ~ 1

##数据
data merge storage pac_man:game {\
    score:{\
        "strong_time":0,\
        "item_time":0,\
        "death":80,\
        "blue":0,\
        "orange":50,\
        "back_time":140,\
        "back":0,\
        "stop":0,\
        "pause":1,\
        "pace":1,\
        "70":1,\
        "170":1,\
        "beans":240,\
        "level":2\
    }\
}
execute store result storage pac_man:game score.level int 1 run scoreboard players get #level pac_man_cal
execute if score #level pac_man_cal matches 4.. run data modify storage pac_man:game score.back_time set value 100
execute if score #level pac_man_cal matches 3.. run data modify storage pac_man:game score.orange set value 0