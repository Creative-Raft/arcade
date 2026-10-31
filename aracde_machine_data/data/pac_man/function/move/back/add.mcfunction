##第二关后从5计数开始,不再散开
execute if score #back pac_man_cal matches 5 if score #level pac_man_cal matches 2.. run return fail
##上升
scoreboard players add #back_time pac_man_cal 1

##清除方向
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.red.facing
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.pink.facing
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.blue.facing
execute if score #back_time pac_man_cal matches 0 run data remove storage pac_man:game game.orange.facing

##第三关及之前,8秒
execute if score #back_time pac_man_cal matches 0 if score #level pac_man_cal matches ..3 run scoreboard players set #back_time pac_man_cal 160
##第四关及之后,8秒
execute if score #back_time pac_man_cal matches 0 if score #level pac_man_cal matches 4.. run scoreboard players set #back_time pac_man_cal 120

##计数增加
scoreboard players add #back pac_man_cal 1