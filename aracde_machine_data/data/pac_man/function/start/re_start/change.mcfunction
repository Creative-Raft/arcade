##屏幕
data modify entity @e[tag=pac_man_for,tag=pac_man_pair,limit=1] text set from storage pac_man:game body

##特殊物品
execute if score #level pac_man_cal matches 1..2 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 6
execute if score #level pac_man_cal matches 1..2 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[6]

execute if score #level pac_man_cal matches 3..4 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 7
execute if score #level pac_man_cal matches 3..4 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[7]

execute if score #level pac_man_cal matches 5..6 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 8
execute if score #level pac_man_cal matches 5..6 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[8]

execute if score #level pac_man_cal matches 7..8 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 9
execute if score #level pac_man_cal matches 7..8 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[9]

execute if score #level pac_man_cal matches 9..10 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 10
execute if score #level pac_man_cal matches 9..10 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[10]

execute if score #level pac_man_cal matches 11..12 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 11
execute if score #level pac_man_cal matches 11..12 run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[11]

execute if score #level pac_man_cal matches 13.. run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item set value 12
execute if score #level pac_man_cal matches 13.. run data modify entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] text set from storage pac_man:base texture[12]