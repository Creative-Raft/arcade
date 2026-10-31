##为o,直接结束
execute store result score #type russia_cal run data get storage russia:game game.now.type
execute if score #type russia_cal matches 5 run return 0
##进行转动
function russia:control/rotate/rotate
##调用SRS
#通常
execute if score #rotate russia_cal matches 0 unless score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.normal[0]
execute if score #rotate russia_cal matches 1 unless score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.normal[1]
execute if score #rotate russia_cal matches 2 unless score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.normal[2]
execute if score #rotate russia_cal matches 3 unless score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.normal[3]
#i型
execute if score #rotate russia_cal matches 0 if score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.i[0]
execute if score #rotate russia_cal matches 1 if score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.i[1]
execute if score #rotate russia_cal matches 2 if score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.i[2]
execute if score #rotate russia_cal matches 3 if score #type russia_cal matches 4 run \
data modify storage russia:mid srs set from storage russia:base block.srs.i[3]

##不移动检查
scoreboard players set #finish russia_cal 0
execute store result score #finish russia_cal run function russia:control/rotate/test/0
execute if score #finish russia_cal matches 1 run return 0

data modify storage russia:mid mid set from storage russia:mid block
##1
scoreboard players set #finish russia_cal 0
execute store result score #finish russia_cal run function russia:control/rotate/test/1
execute if score #finish russia_cal matches 1 run return 0

##2
scoreboard players set #finish russia_cal 0
execute store result score #finish russia_cal run function russia:control/rotate/test/2
execute if score #finish russia_cal matches 1 run return 0

##3
scoreboard players set #finish russia_cal 0
execute store result score #finish russia_cal run function russia:control/rotate/test/3
execute if score #finish russia_cal matches 1 run return 0

##4
scoreboard players set #finish russia_cal 0
execute store result score #finish russia_cal run function russia:control/rotate/test/4
execute if score #finish russia_cal matches 1 run return 0