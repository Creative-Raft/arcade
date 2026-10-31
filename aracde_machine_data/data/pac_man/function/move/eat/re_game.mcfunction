##生命
scoreboard players remove #life pac_man_cal 1
execute if score #life pac_man_cal matches 6 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}\
,{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 5 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}\
,{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 4 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}\
,{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 3 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 2 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 1 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 0 run return run function pac_man:move/eat/game_over

##初始化
data modify storage pac_man:game game.player set from storage pac_man:base game.player
data modify storage pac_man:game game.orange set from storage pac_man:base game.orange
data modify storage pac_man:game game.blue set from storage pac_man:base game.blue
data modify storage pac_man:game game.pink set from storage pac_man:base game.pink
data modify storage pac_man:game game.red set from storage pac_man:base game.red
#位置
data modify storage pac_man:game game.player.pos set value [23,13]
#鬼屋
data modify storage pac_man:game game.death set value []

##特殊时间重置
scoreboard players set #strong_time pac_man_cal 0
scoreboard players set #item_time pac_man_cal 0
data modify storage pac_man:game game.map[17][13] set value 0
##复活时间重置
scoreboard players set #death pac_man_cal 80
scoreboard players set #blue pac_man_cal 14
scoreboard players set #orange pac_man_cal 29
##散开时间
scoreboard players set #back_time pac_man_cal 140
execute if score #level pac_man_cal matches 4.. run scoreboard players set #back_time pac_man_cal 100
scoreboard players set #back pac_man_cal 0
scoreboard players set #stop pac_man_cal 0

##数据
data merge storage pac_man:game {\
    score:{\
        "strong_time":0,\
        "item_time":0,\
        "death":80,\
        "blue":14,\
        "orange":29,\
        "back_time":140,\
        "back":0,\
        "stop":0,\
        "pause":1,\
        "pace":1\
    }\
}
execute if score #level pac_man_cal matches 4.. run data modify storage pac_man:game score.back_time set value 100

##包含的地图
data modify storage pac_man:game game.map_all set from storage pac_man:game game.map

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
execute as @e[tag=pac_man_player] on passengers at @s run playsound block.anvil.land ambient @s ~ ~ ~ 1