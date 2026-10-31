##读取当前位置
execute store result score #y pac_man_cal run data get storage pac_man:game game.player.pos[0]
execute store result score #x pac_man_cal run data get storage pac_man:game game.player.pos[1]
##方向
execute store result score #facing pac_man_cal run data get storage pac_man:game game.player.facing

##目标位置
execute if score #facing pac_man_cal matches 0 run scoreboard players add #x pac_man_cal 1
execute if score #facing pac_man_cal matches 1 run scoreboard players remove #y pac_man_cal 1
execute if score #facing pac_man_cal matches 2 run scoreboard players remove #x pac_man_cal 1
execute if score #facing pac_man_cal matches 3 run scoreboard players add #y pac_man_cal 1
##由于有隧道,调整x
execute if score #x pac_man_cal matches -1 run scoreboard players set #x pac_man_cal 27
execute if score #x pac_man_cal matches 28 run scoreboard players set #x pac_man_cal 0
##存入
data modify storage pac_man:mid pos set value [0,0]
execute store result storage pac_man:mid pos[0] int 1 run scoreboard players get #y pac_man_cal
execute store result storage pac_man:mid pos[1] int 1 run scoreboard players get #x pac_man_cal
execute store result storage pac_man:mid x int 1 run scoreboard players get #x pac_man_cal
execute store result storage pac_man:mid y int 1 run scoreboard players get #y pac_man_cal

##检查该位置的内容
function pac_man:move/player/test with storage pac_man:mid

##移动自身位置
data modify storage pac_man:game game.player.pos set from storage pac_man:mid pos
##强化情况
execute if score #strong_time pac_man_cal matches 1.. run data modify storage pac_man:game game.player.strong set value 1
execute if score #strong_time pac_man_cal matches 0 run data modify storage pac_man:game game.player.strong set value 0
##张嘴情况
execute store result score #open pac_man_cal run data get storage pac_man:game game.player.open
execute if score #open pac_man_cal matches 1 run data modify storage pac_man:game game.player.open set value 0
execute if score #open pac_man_cal matches 0 run data modify storage pac_man:game game.player.open set value 1

##调整分数（限定同机实体）
execute store result storage pac_man:mid score int 1 run scoreboard players get #score pac_man_cal
data modify entity @e[tag=pac_man_score,tag=pac_man_pair,limit=1] text.extra[-2] set string storage pac_man:mid score