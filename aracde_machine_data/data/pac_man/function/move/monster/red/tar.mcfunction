##若玩家不处于强化状态,且自身不处于散开状态,为玩家位置
data modify storage pac_man:mid tar set from storage pac_man:game game.player.pos

##若自身处于散开状态,为home
execute if score #back_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.red.home

##弱玩家处于强化状态,为玩家位置
execute if score #strong_time pac_man_cal matches 1.. run data modify storage pac_man:mid tar set from storage pac_man:game game.player.pos

##重置记录
data modify storage pac_man:mid tar_fac set value 0
data modify storage pac_man:mid tar_pos set value [0,0]
scoreboard players set #max pac_man_cal 0

##若玩家处于强化状态,模式为远离
execute if score #strong_time pac_man_cal matches 1.. run return run function pac_man:move/monster/red/far

##否则为靠近
scoreboard players set #min pac_man_cal 99999
function pac_man:move/monster/red/clo