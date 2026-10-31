##失败文本
tag @s add russia_pk_over
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_pause] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set value {"text":"YOU LOSE","color":"#ff0000"}

##对手判胜
function russia_pk:result/opponent
