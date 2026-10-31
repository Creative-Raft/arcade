##蓝移动
execute store result score #out pac_man_cal run data get storage pac_man:game game.blue.out
execute if score #out pac_man_cal matches 1 run function pac_man:move/monster/blue/can

##粉移动
execute store result score #out pac_man_cal run data get storage pac_man:game game.pink.out
execute if score #out pac_man_cal matches 1 run function pac_man:move/monster/pink/can