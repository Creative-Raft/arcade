##切换暂停状态
execute store result score #pause pac_man_cal run data get entity @s data.score.pause
scoreboard players add #pause pac_man_cal 1
execute if score #pause pac_man_cal matches 2.. run scoreboard players set #pause pac_man_cal 0
execute store result entity @s data.score.pause int 1 run scoreboard players get #pause pac_man_cal
##控制样式

##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=pac_man_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add pac_man_pair

execute if score #pause pac_man_cal matches 1 run data modify entity @e[tag=pac_man_pause,tag=pac_man_pair,limit=1] text set value "暂停中"
execute if score #pause pac_man_cal matches 0 run data modify entity @e[tag=pac_man_pause,tag=pac_man_pair,limit=1] text set value ""

##清除标记
tag @e[tag=pac_man_pair] remove pac_man_pair