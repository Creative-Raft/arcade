##减少
scoreboard players remove #back_time pac_man_cal 1

##时间结束清除方向
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.red.facing
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.pink.facing
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.blue.facing
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.orange.facing

##重置
execute if score #back_time pac_man_cal matches 0 run scoreboard players set #back_time pac_man_cal -340

##计数增加
scoreboard players add #back pac_man_cal 1