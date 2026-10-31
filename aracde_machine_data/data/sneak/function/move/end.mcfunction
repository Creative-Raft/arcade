##结束
execute on passengers at @s run playsound block.anvil.land ambient @s ~ ~ ~ 1
scoreboard players set #over sneak_cal 1
scoreboard players set #pause sneak_cal 1
execute as @e[tag=sneak_pause] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set value {"text":"GAME OVER","color":"#ff0000"}
execute as @e[tag=sneak_pause_1] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set value {"text":"GAME OVER","color":"#550000"}
execute as @e[tag=sneak_pause_1] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s transformation.scale set value [0.7f,0.7f,0.7f]
tag @e[tag=sneak_pair] remove sneak_pair