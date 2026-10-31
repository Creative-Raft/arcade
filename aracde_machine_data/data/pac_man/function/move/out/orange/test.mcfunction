##检查是否已经放出
execute store result score #test pac_man_cal run data get storage pac_man:game game.orange.out
execute if score #test pac_man_cal matches 1 run return fail

data modify storage pac_man:game game.orange.pos set value [11,13]
data modify storage pac_man:game game.orange.out set value 1