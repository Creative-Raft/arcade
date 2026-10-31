##若在暂停,结束
execute if score #pause sneak_cal matches 1 run return 0

##总时长累计,进行
scoreboard players add #time sneak_cal 1
scoreboard players remove #pace sneak_cal 1

##pace为1,进行蓝色黄色的bfs
execute if score #pace sneak_cal matches 1 run function sneak:move/pace/1
##pace为0,进行绿色bfs和移动
execute if score #pace sneak_cal matches 0 run function sneak:move/pace/0

##结算复活
execute if score #player sneak_cal matches 1.. run scoreboard players remove #player sneak_cal 1
execute if score #blue sneak_cal matches 1.. run scoreboard players remove #blue sneak_cal 1
execute if score #yellow sneak_cal matches 1.. run scoreboard players remove #yellow sneak_cal 1
execute if score #green sneak_cal matches 1.. run scoreboard players remove #green sneak_cal 1

execute if score #player sneak_cal matches 1 run function sneak:move/return/player
execute if score #blue sneak_cal matches 1 run function sneak:move/return/blue
execute if score #yellow sneak_cal matches 1 run function sneak:move/return/yellow
execute if score #green sneak_cal matches 1 run function sneak:move/return/green

##若pace为0,还原
execute if score #pace sneak_cal matches 0 run scoreboard players set #pace sneak_cal 4
#时间变化
execute if score #pace sneak_cal matches 4 if score #time sneak_cal matches 1201..2400 run scoreboard players set #pace sneak_cal 3
execute if score #pace sneak_cal matches 4 if score #time sneak_cal matches 2401.. run scoreboard players set #pace sneak_cal 2