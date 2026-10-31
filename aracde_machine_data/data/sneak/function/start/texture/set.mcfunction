##选择
data modify storage sneak:mid type set value {}
execute if score #type sneak_cal matches 0 run data modify storage sneak:mid type set from storage sneak:base texture[0]
execute if score #type sneak_cal matches 1 run data modify storage sneak:mid type set from storage sneak:base texture[1]
##头
#右
execute if score #type sneak_cal matches 2 run data modify storage sneak:mid type set from storage sneak:base texture[2]
execute if score #type sneak_cal matches 7 run data modify storage sneak:mid type set from storage sneak:base texture[2]
execute if score #type sneak_cal matches 12 run data modify storage sneak:mid type set from storage sneak:base texture[2]
execute if score #type sneak_cal matches 17 run data modify storage sneak:mid type set from storage sneak:base texture[2]
#上
execute if score #type sneak_cal matches 3 run data modify storage sneak:mid type set from storage sneak:base texture[3]
execute if score #type sneak_cal matches 8 run data modify storage sneak:mid type set from storage sneak:base texture[3]
execute if score #type sneak_cal matches 13 run data modify storage sneak:mid type set from storage sneak:base texture[3]
execute if score #type sneak_cal matches 18 run data modify storage sneak:mid type set from storage sneak:base texture[3]
#左
execute if score #type sneak_cal matches 4 run data modify storage sneak:mid type set from storage sneak:base texture[4]
execute if score #type sneak_cal matches 9 run data modify storage sneak:mid type set from storage sneak:base texture[4]
execute if score #type sneak_cal matches 14 run data modify storage sneak:mid type set from storage sneak:base texture[4]
execute if score #type sneak_cal matches 19 run data modify storage sneak:mid type set from storage sneak:base texture[4]
#下
execute if score #type sneak_cal matches 5 run data modify storage sneak:mid type set from storage sneak:base texture[5]
execute if score #type sneak_cal matches 10 run data modify storage sneak:mid type set from storage sneak:base texture[5]
execute if score #type sneak_cal matches 15 run data modify storage sneak:mid type set from storage sneak:base texture[5]
execute if score #type sneak_cal matches 20 run data modify storage sneak:mid type set from storage sneak:base texture[5]
##身体
execute if score #type sneak_cal matches 6 run data modify storage sneak:mid type set from storage sneak:base texture[6]
execute if score #type sneak_cal matches 11 run data modify storage sneak:mid type set from storage sneak:base texture[6]
execute if score #type sneak_cal matches 16 run data modify storage sneak:mid type set from storage sneak:base texture[6]
execute if score #type sneak_cal matches 21 run data modify storage sneak:mid type set from storage sneak:base texture[6]
##提示
execute if score #type sneak_cal matches 22 run data modify storage sneak:mid type set from storage sneak:base texture[7]

##颜色
#红
execute if score #type sneak_cal matches 2..6 run data modify storage sneak:mid type.color set value "#ff0000"
#蓝
execute if score #type sneak_cal matches 7..11 run data modify storage sneak:mid type.color set value "#0000ff"
#黄
execute if score #type sneak_cal matches 12..16 run data modify storage sneak:mid type.color set value "#ffff00"
#绿
execute if score #type sneak_cal matches 17..21 run data modify storage sneak:mid type.color set value "#00ff00"