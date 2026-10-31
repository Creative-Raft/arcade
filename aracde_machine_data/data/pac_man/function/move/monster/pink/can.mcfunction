##考虑可前往格点
##顺序
data modify storage pac_man:mid can_pos set value [[0,0],[0,0],[0,0],[0,0]]
data modify storage pac_man:mid can set value [0,1,2,3]
##位置
execute store result score #ox pac_man_cal run data get storage pac_man:game game.pink.pos[1]
execute store result score #oy pac_man_cal run data get storage pac_man:game game.pink.pos[0]
##朝向
scoreboard players set #facing pac_man_cal 0
execute store result score #facing pac_man_cal run data get storage pac_man:game game.pink.facing

##下
#宏参数
scoreboard players operation #x pac_man_cal = #ox pac_man_cal
scoreboard players operation #y pac_man_cal = #oy pac_man_cal
scoreboard players add #y pac_man_cal 1
execute store result storage pac_man:mid x int 1 run scoreboard players get #x pac_man_cal
execute store result storage pac_man:mid y int 1 run scoreboard players get #y pac_man_cal
data modify storage pac_man:mid can_pos[3][1] set from storage pac_man:mid x
data modify storage pac_man:mid can_pos[3][0] set from storage pac_man:mid y
data modify storage pac_man:mid type set value "pink"
data modify storage pac_man:mid facing set value 1
#检测
scoreboard players set #can pac_man_cal 1
execute store result score #can pac_man_cal run function pac_man:move/monster/test with storage pac_man:mid
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can[3]
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can_pos[3]

##左
#宏参数
scoreboard players operation #x pac_man_cal = #ox pac_man_cal
scoreboard players operation #y pac_man_cal = #oy pac_man_cal
scoreboard players remove #x pac_man_cal 1
execute if score #x pac_man_cal matches ..-1 run scoreboard players set #x pac_man_cal 27
execute store result storage pac_man:mid x int 1 run scoreboard players get #x pac_man_cal
execute store result storage pac_man:mid y int 1 run scoreboard players get #y pac_man_cal
data modify storage pac_man:mid can_pos[2][1] set from storage pac_man:mid x
data modify storage pac_man:mid can_pos[2][0] set from storage pac_man:mid y
data modify storage pac_man:mid type set value "pink"
data modify storage pac_man:mid facing set value 0
#检测
scoreboard players set #can pac_man_cal 1
execute store result score #can pac_man_cal run function pac_man:move/monster/test with storage pac_man:mid
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can[2]
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can_pos[2]

##上
#宏参数
scoreboard players operation #x pac_man_cal = #ox pac_man_cal
scoreboard players operation #y pac_man_cal = #oy pac_man_cal
scoreboard players remove #y pac_man_cal 1
execute store result storage pac_man:mid x int 1 run scoreboard players get #x pac_man_cal
execute store result storage pac_man:mid y int 1 run scoreboard players get #y pac_man_cal
data modify storage pac_man:mid can_pos[1][1] set from storage pac_man:mid x
data modify storage pac_man:mid can_pos[1][0] set from storage pac_man:mid y
data modify storage pac_man:mid type set value "pink"
data modify storage pac_man:mid facing set value 3
#检测
scoreboard players set #can pac_man_cal 1
execute store result score #can pac_man_cal run function pac_man:move/monster/test with storage pac_man:mid
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can[1]
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can_pos[1]

##右
#宏参数
scoreboard players operation #x pac_man_cal = #ox pac_man_cal
scoreboard players operation #y pac_man_cal = #oy pac_man_cal
scoreboard players add #x pac_man_cal 1
execute if score #x pac_man_cal matches 28.. run scoreboard players set #x pac_man_cal 0
execute store result storage pac_man:mid x int 1 run scoreboard players get #x pac_man_cal
execute store result storage pac_man:mid y int 1 run scoreboard players get #y pac_man_cal
data modify storage pac_man:mid can_pos[0][1] set from storage pac_man:mid x
data modify storage pac_man:mid can_pos[0][0] set from storage pac_man:mid y
data modify storage pac_man:mid type set value "pink"
data modify storage pac_man:mid facing set value 2
#检测
scoreboard players set #can pac_man_cal 1
execute store result score #can pac_man_cal run function pac_man:move/monster/test with storage pac_man:mid
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can[0]
execute if score #can pac_man_cal matches 0 run data remove storage pac_man:mid can_pos[0]

##如果仅剩一个方向可以移动,结束
execute store result score #length pac_man_cal run data get storage pac_man:mid can
execute if score #length pac_man_cal matches 1 run data modify storage pac_man:game game.pink.pos set from storage pac_man:mid can_pos[0]
execute if score #length pac_man_cal matches 1 run return run data modify storage pac_man:game game.pink.facing set from storage pac_man:mid can[0]

##否则,确定目标位置
function pac_man:move/monster/pink/tar