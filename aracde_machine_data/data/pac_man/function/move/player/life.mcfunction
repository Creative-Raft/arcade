##增加生命(至多六条)
scoreboard players remove #life_score pac_man_cal 7500
scoreboard players add #life pac_man_cal 1
execute if score #life_score pac_man_cal matches 7500.. run return run function pac_man:move/player/life

execute if score #life pac_man_cal matches 7.. run scoreboard players set #life pac_man_cal 6

execute if score #life pac_man_cal matches 6 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}\
,{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 5 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}\
,{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 4 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}\
,{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 3 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 2 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n","font":"default"},{"text":"a","font":"pac_man:pac_man"}]
execute if score #life pac_man_cal matches 1 run data modify entity @e[tag=pac_man_life,tag=pac_man_pair,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"}]