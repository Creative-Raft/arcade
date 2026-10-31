##若玩家不处于强化状态,且自身不处于散开状态,与玩家距离7格以内,为home,否则为玩家位置
#位置记录
data modify storage pac_man:mid ox set from storage pac_man:game game.orange.pos[1]
data modify storage pac_man:mid oy set from storage pac_man:game game.orange.pos[0]

data modify storage pac_man:mid tx set from storage pac_man:game game.player.pos[1]
data modify storage pac_man:mid ty set from storage pac_man:game game.player.pos[0]
#计算
data modify storage pac_man:mid dis set value 0
data modify storage pac_man:mid dis set compute default float {\
    "type":"add",\
    "inputs":[\
        {\
            "type":"pow",\
            "exponent":2,\
            "base":{\
                type:"sub",\
                "left":{"type":"storage",storage:"pac_man:mid",path:"ox"},\
                "right":{"type":"storage",storage:"pac_man:mid",path:"tx"}\
            }\
        },\
        {\
            "type":"pow",\
            "exponent":2,\
            "base":{\
                type:"sub",\
                "left":{"type":"storage",storage:"pac_man:mid",path:"oy"},\
                "right":{"type":"storage",storage:"pac_man:mid",path:"ty"}\
            }\
        }\
    ]\
}
execute store result score #length pac_man_cal run data get storage pac_man:mid dis
#比较
data modify storage pac_man:mid tar set from storage pac_man:game game.player.pos
execute if score #length pac_man_cal matches ..49 run data modify storage pac_man:mid tar set from storage pac_man:game game.orange.pos

##若自身处于散开状态,为home
execute if score #back_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.orange.home

##弱玩家处于强化状态,为玩家位置
execute if score #strong_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.player.pos

##重置记录
data modify storage pac_man:mid tar_fac set value 0
data modify storage pac_man:mid tar_pos set value [0,0]
scoreboard players set #max pac_man_cal 0

##若玩家处于强化状态,模式为远离
execute if score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/monster/orange/far

##否则为靠近
scoreboard players set #min pac_man_cal 99999
function pac_man:move/monster/orange/clo