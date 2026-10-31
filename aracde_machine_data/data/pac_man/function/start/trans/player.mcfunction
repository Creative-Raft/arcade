##读取位置
data modify storage pac_man:mid y set from storage pac_man:game game.player.pos[0]
data modify storage pac_man:mid x set from storage pac_man:game game.player.pos[1]

##判断状态
execute store result score #facing pac_man_cal run data get storage pac_man:game game.player.facing 1
execute store result score #strong pac_man_cal run data get storage pac_man:game game.player.strong 1
execute store result score #open pac_man_cal run data get storage pac_man:game game.player.open 1

##分别
execute if score #facing pac_man_cal matches 0 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 17

execute if score #facing pac_man_cal matches 1 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 18

execute if score #facing pac_man_cal matches 2 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 19

execute if score #facing pac_man_cal matches 3 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 20

execute if score #facing pac_man_cal matches 0 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 21

execute if score #facing pac_man_cal matches 1 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 22

execute if score #facing pac_man_cal matches 2 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 23

execute if score #facing pac_man_cal matches 3 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 0 run \
data modify storage pac_man:mid num set value 24

execute if score #facing pac_man_cal matches 0 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 25

execute if score #facing pac_man_cal matches 1 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 26

execute if score #facing pac_man_cal matches 2 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 27

execute if score #facing pac_man_cal matches 3 if score #open pac_man_cal matches 0 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 28

execute if score #facing pac_man_cal matches 0 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 29

execute if score #facing pac_man_cal matches 1 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 30

execute if score #facing pac_man_cal matches 2 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 31

execute if score #facing pac_man_cal matches 3 if score #open pac_man_cal matches 1 if score #strong pac_man_cal matches 1 run \
data modify storage pac_man:mid num set value 32

##调整
function pac_man:start/trans/change with storage pac_man:mid