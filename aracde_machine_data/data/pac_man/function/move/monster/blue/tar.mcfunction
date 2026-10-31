##若玩家不处于强化状态,且自身不处于散开状态,为红色关于玩家前方2格位置的对称点
execute store result score #facing pac_man_cal run data get storage pac_man:game game.player.facing
execute store result score #x pac_man_cal run data get storage pac_man:game game.player.pos[1]
execute store result score #y pac_man_cal run data get storage pac_man:game game.player.pos[0]
#位置
execute if score #facing pac_man_cal matches 0 run scoreboard players add #x pac_man_cal 2
execute if score #facing pac_man_cal matches 1 run scoreboard players remove #y pac_man_cal 2
execute if score #facing pac_man_cal matches 2 run scoreboard players remove #x pac_man_cal 2
execute if score #facing pac_man_cal matches 3 run scoreboard players add #y pac_man_cal 2
#红色位置
execute store result score #rx pac_man_cal run data get storage pac_man:game game.red.pos[1]
execute store result score #ry pac_man_cal run data get storage pac_man:game game.red.pos[0]
#计算
data modify storage pac_man:mid tar[0] set compute default integer {\
    "type":"add",\
    "inputs":[\
        {\
            type:"score",\
            "score":"pac_man_cal",\
            "target":{type:"fixed",name:"#x"}\
        },\
        {\
            type:"sub",\
            "left":{\
                "type":"score",\
                "score":"pac_man_cal",\
                "target":{type:"fixed",name:"#x"}\
            },\
            "right":{\
                "type":"score",\
                "score":"pac_man_cal",\
                "target":{type:"fixed",name:"#rx"}\
            }\
        }\
    ]\
}
data modify storage pac_man:mid tar[1] set compute default integer {\
    "type":"add",\
    "inputs":[\
        {\
            type:"score",\
            "score":"pac_man_cal",\
            "target":{type:"fixed",name:"#y"}\
        },\
        {\
            type:"sub",\
            "left":{\
                "type":"score",\
                "score":"pac_man_cal",\
                "target":{type:"fixed",name:"#y"}\
            },\
            "right":{\
                "type":"score",\
                "score":"pac_man_cal",\
                "target":{type:"fixed",name:"#ry"}\
            }\
        }\
    ]\
}

##若自身处于散开状态,为home
execute if score #back_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.blue.home

##弱玩家处于强化状态,为玩家位置
execute if score #strong_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.player.pos

##重置记录
data modify storage pac_man:mid tar_fac set value 0
data modify storage pac_man:mid tar_pos set value [0,0]
scoreboard players set #max pac_man_cal 0

##若玩家处于强化状态,模式为远离
execute if score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/monster/blue/far

##否则为靠近
scoreboard players set #min pac_man_cal 99999
function pac_man:move/monster/blue/clo