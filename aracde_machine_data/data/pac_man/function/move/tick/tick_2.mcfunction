##红移动
execute store result score #out pac_man_cal run data get storage pac_man:game game.red.out
execute if score #out pac_man_cal matches 1 run function pac_man:move/monster/red/can

##橙移动
execute store result score #out pac_man_cal run data get storage pac_man:game game.orange.out
execute if score #out pac_man_cal matches 1 run function pac_man:move/monster/orange/can