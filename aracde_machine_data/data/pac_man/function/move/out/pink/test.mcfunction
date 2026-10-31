##检查是否已经放出
execute store result score #test pac_man_cal run data get storage pac_man:game game.pink.out
execute if score #test pac_man_cal matches 1 run return fail

data modify storage pac_man:game game.pink.pos set value [11,14]
data modify storage pac_man:game game.pink.out set value 1