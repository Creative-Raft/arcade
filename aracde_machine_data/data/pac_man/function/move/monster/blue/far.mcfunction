##计算
#原位置
data modify storage pac_man:mid pos set from storage pac_man:mid can_pos[0]
data modify storage pac_man:mid ox set from storage pac_man:mid pos[1]
data modify storage pac_man:mid oy set from storage pac_man:mid pos[0]
#目标位置
data modify storage pac_man:mid tx set from storage pac_man:mid tar[1]
data modify storage pac_man:mid ty set from storage pac_man:mid tar[0]
##距离平方
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
##与max比较并调整
execute store result score #length pac_man_cal run data get storage pac_man:mid dis
execute if score #length pac_man_cal > #max pac_man_cal run data modify storage pac_man:mid tar_fac set from storage pac_man:mid can[0]
execute if score #length pac_man_cal > #max pac_man_cal run data modify storage pac_man:mid tar_pos set from storage pac_man:mid can_pos[0]
execute if score #length pac_man_cal > #max pac_man_cal run scoreboard players operation #max pac_man_cal = #length pac_man_cal

##去除第一项
data remove storage pac_man:mid can[0]
data remove storage pac_man:mid can_pos[0]

##若还有,重复
execute if data storage pac_man:mid can[0] run return run function pac_man:move/monster/blue/far

##若没有,移动
data modify storage pac_man:game game.blue.pos set from storage pac_man:mid tar_pos
data modify storage pac_man:game game.blue.facing set from storage pac_man:mid tar_fac