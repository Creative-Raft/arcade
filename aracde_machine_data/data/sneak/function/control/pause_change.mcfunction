##切换暂停状态
scoreboard players add #pause sneak_cal 1
execute if score #pause sneak_cal matches 2.. run scoreboard players set #pause sneak_cal 0
##控制样式

##标记同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=sneak_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add sneak_pair

execute if score #pause sneak_cal matches 1 run data modify entity @e[tag=sneak_pause,tag=sneak_pair,limit=1] text.text set value "暂停中"
execute if score #pause sneak_cal matches 1 run data modify entity @e[tag=sneak_pause_1,tag=sneak_pair,limit=1] text.text set value "暂停中"
execute if score #pause sneak_cal matches 0 run data modify entity @e[tag=sneak_pause,tag=sneak_pair,limit=1] text.text set value ""
execute if score #pause sneak_cal matches 0 run data modify entity @e[tag=sneak_pause_1,tag=sneak_pair,limit=1] text.text set value ""

##清除标记
tag @e[tag=sneak_pair] remove sneak_pair