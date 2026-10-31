##死亡
execute as @e[tag=pac_man_life,tag=pac_man_pair] run data merge entity @s {transformation:{scale:[0.4f,0.4f,0.4f]}}
data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value {"text":"GAME OVER"}
execute at @e[tag=pac_man_for,tag=pac_man_pair] run tp @e[tag=pac_man_life,tag=pac_man_pair] ^ ^0.3 ^0.01 ~ ~
##暂停
scoreboard players set #pause pac_man_cal 1
scoreboard players set #over pac_man_cal 1

execute as @e[tag=pac_man_player,tag=pac_man_pair] on passengers at @s run playsound block.anvil.land ambient @s ~ ~ ~ 1