##回鬼屋
data modify storage pac_man:game game.blue set value {pos:[14,15],out:0,home:[26,29]}
data modify storage pac_man:game game.death append value 1
execute as @e[tag=pac_man_player] on passengers at @s run playsound entity.player.burp ambient @s ~ ~ ~ 0.8

##加分
scoreboard players operation #score pac_man_cal += #monster pac_man_cal
scoreboard players operation #life_score pac_man_cal += #monster pac_man_cal
scoreboard players operation #monster pac_man_cal += #monster pac_man_cal
execute if score #life_score pac_man_cal matches 7500.. run function pac_man:move/player/life