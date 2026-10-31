##若玩家不处于强化状态,且自身不处于散开状态,为玩家前方4格
execute store result score #facing pac_man_cal run data get storage pac_man:game game.player.facing
execute store result score #x pac_man_cal run data get storage pac_man:game game.player.pos[1]
execute store result score #y pac_man_cal run data get storage pac_man:game game.player.pos[0]
#计算
execute if score #facing pac_man_cal matches 0 run scoreboard players add #x pac_man_cal 4
execute if score #facing pac_man_cal matches 1 run scoreboard players remove #y pac_man_cal 4
execute if score #facing pac_man_cal matches 2 run scoreboard players remove #x pac_man_cal 4
execute if score #facing pac_man_cal matches 3 run scoreboard players add #y pac_man_cal 4
#特别的,在y=14时,左右两侧有隧道
execute if score #facing pac_man_cal matches 0 if score #y pac_man_cal matches 14 if score #x pac_man_cal matches 28.. run scoreboard players remove #x pac_man_cal 28
execute if score #facing pac_man_cal matches 2 if score #y pac_man_cal matches 14 if score #x pac_man_cal matches ..-1 run scoreboard players add #x pac_man_cal 28

##若自身处于散开状态,为home
execute if score #back_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.pink.home

##弱玩家处于强化状态,为玩家位置
execute if score #strong_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.player.pos

##重置记录
data modify storage pac_man:mid tar_fac set value 0
data modify storage pac_man:mid tar_pos set value [0,0]
scoreboard players set #max pac_man_cal 0

##若玩家处于强化状态,模式为远离
execute if score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/monster/pink/far

##否则为靠近
scoreboard players set #min pac_man_cal 99999
function pac_man:move/monster/pink/clo