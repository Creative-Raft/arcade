##结束
execute on passengers at @s run playsound block.anvil.land ambient @s ~ ~ ~ 1
scoreboard players set #over russia_cal 1
##PK
execute if entity @s[tag=russia_pk_playing] run return run function russia_pk:result/lose
##单人模式
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_pause] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set value {"text":"游戏结束","color":"red"}