##保存坐标
data modify storage pac_man:mid player set from storage pac_man:game game.player.pos
data modify storage pac_man:mid orange set from storage pac_man:game game.orange.pos
data modify storage pac_man:mid blue set from storage pac_man:game game.blue.pos
data modify storage pac_man:mid pink set from storage pac_man:game game.pink.pos
data modify storage pac_man:mid red set from storage pac_man:game game.red.pos

##比较
#红
data modify storage pac_man:mid test set from storage pac_man:mid player
execute store success score #eat pac_man_cal run data modify storage pac_man:mid test set from storage pac_man:mid red
execute if score #eat pac_man_cal matches 0 unless score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/eat/re_game
execute if score #eat pac_man_cal matches 0 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/red

#蓝
data modify storage pac_man:mid test set from storage pac_man:mid player
execute store success score #eat pac_man_cal run data modify storage pac_man:mid test set from storage pac_man:mid blue
execute if score #eat pac_man_cal matches 0 unless score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/eat/re_game
execute if score #eat pac_man_cal matches 0 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/blue

#粉
data modify storage pac_man:mid test set from storage pac_man:mid player
execute store success score #eat pac_man_cal run data modify storage pac_man:mid test set from storage pac_man:mid pink
execute if score #eat pac_man_cal matches 0 unless score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/eat/re_game
execute if score #eat pac_man_cal matches 0 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/pink

#橙
data modify storage pac_man:mid test set from storage pac_man:mid player
execute store success score #eat pac_man_cal run data modify storage pac_man:mid test set from storage pac_man:mid orange
execute if score #eat pac_man_cal matches 0 unless score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/eat/re_game
execute if score #eat pac_man_cal matches 0 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/orange