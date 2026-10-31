##检查是否已经放出
execute store result score #test pac_man_cal run data get storage pac_man:game game.blue.out
execute if score #test pac_man_cal matches 1 run return fail

data modify storage pac_man:game game.blue.pos set value [11,15]
data modify storage pac_man:game game.blue.out set value 1