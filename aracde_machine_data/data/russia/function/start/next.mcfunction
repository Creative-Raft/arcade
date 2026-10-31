##读取
execute store result score #type russia_cal run data get storage russia:game game.next.type
##红z
execute if score #type russia_cal matches 1 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"b#b#a",font:"russia:russia"},{"text":"\n",font:"default"},{"text":"a#b#b",font:"russia:russia"}]
##绿s
execute if score #type russia_cal matches 2 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"a#c#c",font:"russia:russia"},{"text":"\n",font:"default"},{"text":"c#c#a",font:"russia:russia"}]
##蓝l
execute if score #type russia_cal matches 3 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"a#a#d",font:"russia:russia"},{"text":"\n",font:"default"},{"text":"d#d#d",font:"russia:russia"}]
##青i
execute if score #type russia_cal matches 4 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"e#e#e#e",font:"russia:russia"}]
##黄o
execute if score #type russia_cal matches 5 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"f#f",font:"russia:russia"},{"text":"\n",font:"default"},{"text":"f#f",font:"russia:russia"}]
##橙j
execute if score #type russia_cal matches 6 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"g#a#a",font:"russia:russia"},{"text":"\n",font:"default"},{"text":"g#g#g",font:"russia:russia"}]
##紫t
execute if score #type russia_cal matches 7 run data modify entity @s text set value [{"text":"next:\n","font":default},\
{"text":"a#h#a",font:"russia:russia"},{"text":"\n",font:"default"},{"text":"h#h#h",font:"russia:russia"}]