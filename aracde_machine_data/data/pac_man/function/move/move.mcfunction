##处于暂停状态,终止
execute if score #pause pac_man_cal matches 1 run return fail

##强化计时
execute if score #strong_time pac_man_cal matches 1.. run scoreboard players remove #strong_time pac_man_cal 1
execute if score #strong_time pac_man_cal matches 0 run scoreboard players set #slow pac_man_cal 0
execute if score #strong_time pac_man_cal matches 0 run scoreboard players set #monster pac_man_cal 200

execute if score #strong_time_las pac_man_cal matches 1 if score #strong_time pac_man_cal matches 0 run data remove storage pac_man:game game.red.facing
execute if score #strong_time_las pac_man_cal matches 1 if score #strong_time pac_man_cal matches 0 run data remove storage pac_man:game game.blue.facing
execute if score #strong_time_las pac_man_cal matches 1 if score #strong_time pac_man_cal matches 0 run data remove storage pac_man:game game.pink.facing
execute if score #strong_time_las pac_man_cal matches 1 if score #strong_time pac_man_cal matches 0 run data remove storage pac_man:game game.orange.facing

scoreboard players operation #strong_time_las pac_man_cal = #strong_time pac_man_cal

##奖励计时
execute if score #item_time pac_man_cal matches 1.. run scoreboard players remove #item_time pac_man_cal 1
execute if score #item_time pac_man_cal matches 1 run data modify storage pac_man:game game.map[17][13] set value 0
##鬼屋计时
execute if score #death pac_man_cal matches 1.. if data storage pac_man:game game.death[0] run scoreboard players remove #death pac_man_cal 1
execute if score #death pac_man_cal matches 0 run function pac_man:move/out/death/death
##散开计时
execute if score #strong_time pac_man_cal matches 0 if score #back_time pac_man_cal matches ..-1 run function pac_man:move/back/add
execute if score #strong_time pac_man_cal matches 0 if score #back_time pac_man_cal matches 1.. run function pac_man:move/back/remove
##减速计时
scoreboard players add #stop pac_man_cal 1
execute if score #strong_time pac_man_cal matches 1.. run scoreboard players set #stop pac_man_cal 0
#关卡1,2减速幅度更大
execute if score #level pac_man_cal matches 1..2 if score #stop pac_man_cal matches 7 run scoreboard players set #stop pac_man_cal 3
#关卡3,4减速幅度略高
execute if score #level pac_man_cal matches 3..4 if score #stop pac_man_cal matches 7 run scoreboard players set #stop pac_man_cal 2
#关卡5到8,减速幅度正常
#关卡9以后,不再减速
execute if score #level pac_man_cal matches 9.. run scoreboard players set #stop pac_man_cal 0
execute if score #stop pac_man_cal matches 7.. run scoreboard players set #stop pac_man_cal 0

##缓解单tick压力,分开
scoreboard players remove #pace pac_man_cal 1

##tick_2计算红,橙
execute if score #pace pac_man_cal matches 2 if score #slow pac_man_cal matches 0 unless score #stop pac_man_cal matches 6 run function pac_man:move/tick/tick_2

##tick_1计算蓝,粉
execute if score #pace pac_man_cal matches 1 if score #slow pac_man_cal matches 0 unless score #stop pac_man_cal matches 6 run function pac_man:move/tick/tick_1

##tick_0计算玩家,移动
execute if score #pace pac_man_cal matches 0 run function pac_man:move/tick/tick_0

execute if score #pace pac_man_cal matches 0 run scoreboard players set #pace pac_man_cal 3