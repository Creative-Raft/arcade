##胜利文本
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_pause] if score @s arcade_machine_pair = #pair arcade_machine_pair run data modify entity @s text set value {"text":"YOU WIN!","color":"#00ff00"}
