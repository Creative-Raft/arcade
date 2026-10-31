##最先进入鬼屋的离开
execute store result score #out pac_man_cal run data get storage pac_man:game game.death[0]
data remove storage pac_man:game game.death[0]

execute if score #out pac_man_cal matches 0 run function pac_man:move/out/orange/test
execute if score #out pac_man_cal matches 1 run function pac_man:move/out/blue/test
execute if score #out pac_man_cal matches 2 run function pac_man:move/out/pink/test
execute if score #out pac_man_cal matches 3 run function pac_man:move/out/red/test
##重置时间
scoreboard players set #death pac_man_cal 80