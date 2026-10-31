##标记
tag @s add pac_man_player
tag @s add pac_man_player_new
##内部
execute at @s rotated ~ 0 run summon text_display ^ ^0.6825 ^0.745 {Tags:[pac_man_for_new,pac_man_for]}
##生命
execute at @s rotated ~ 0 run summon text_display ^0.39 ^0.9525 ^0.7449 {Tags:[pac_man_life_new,pac_man_life]}
##本场物品
execute at @s rotated ~ 0 run summon text_display ^-0.39 ^0.9525 ^0.7449 {Tags:[pac_man_item_new,pac_man_item],data:{item:6}}
##分数
execute at @s rotated ~ 0 run summon text_display ^ ^1.4675 ^0.7449 {Tags:[pac_man_score_new,pac_man_score]}
##暂停
execute at @s rotated ~ 0 run summon text_display ^ ^1.1125 ^0.7449 {Tags:[pac_man_pause_new,pac_man_pause],background:0xff00000,"text":"吃豆人","text_opacity":-50b}

##调整大小
data merge entity @e[tag=pac_man_life_new,limit=1] {transformation:{scale:[0.2,0.2,0.2]}}
data merge entity @e[tag=pac_man_item_new,limit=1] {transformation:{scale:[0.2,0.2,0.2]}}
data merge entity @e[tag=pac_man_for_new,limit=1] {transformation:{scale:[0.1,0.1,0.1]}}
data merge entity @e[tag=pac_man_score_new,limit=1] {transformation:{scale:[0.24,0.24,0.24]}}
data merge entity @e[tag=pac_man_pause_new,limit=1] {transformation:{scale:[0.5,0.5,0.5]}}

##朝向
execute rotated as @s rotated ~ 0 as @e[tag=pac_man_for_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=pac_man_life_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=pac_man_item_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=pac_man_score_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=pac_man_pause_new] run rotate @s ~180 ~

##内容
data modify entity @e[tag=pac_man_life_new,limit=1] text set value [{"text":"a","font":"pac_man:pac_man"},{"text":"\n",font:"default"},{"text":"a","font":"pac_man:pac_man"},{"text":"\n",font:"default"},{"text":"a","font":"pac_man:pac_man"}]
data modify entity @e[tag=pac_man_item_new,limit=1] text set value {"text":"c","font":"pac_man:pac_man_beans"}
data modify entity @e[tag=pac_man_score_new,limit=1] text set value [{"text":"第"},{"text":"1"},{"text":"关  "},{"text":"0"},{"text":"分"}]
data modify entity @e[tag=pac_man_for_new,limit=1] text set from storage pac_man:game body

data modify entity @e[tag=pac_man_for_new,limit=1] background set value 0x00000000
data modify entity @e[tag=pac_man_life_new,limit=1] background set value 0x00000000
data modify entity @e[tag=pac_man_item_new,limit=1] background set value 0x00000000

data modify entity @e[tag=pac_man_for_new,limit=1] line_width set value 300
data modify entity @e[tag=pac_man_life_new,limit=1] line_width set value 300
data modify entity @e[tag=pac_man_item_new,limit=1] line_width set value 300
data modify entity @e[tag=pac_man_score_new,limit=1] line_width set value 300

##操作方式
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.left","color":"yellow"}\
,{"type":"keybind","keybind":"key.right"},{"type":"keybind","keybind":"key.forward"}\
,{"type":"keybind","keybind":"key.back"},{"text":" 控制吃豆人上下左右移动"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.jump","color":"yellow"},{"text":" 开始 / 暂停 / 继续"}]
execute on passengers run tellraw @s [{"text":"吃光豆子过关；被怪物碰到会掉命，被抓到时可以反过来吃它们","color":"gray"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.sneak","color":"yellow"},{"text":" 退出游戏"}]

##配对（用召唤点精确定位"刚召唤的那一块"，避免两台机器同一 tick 开局时互相配错）
execute at @s rotated ~ 0 positioned ^ ^0.6825 ^0.745 run scoreboard players operation @e[tag=pac_man_for_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^0.39 ^0.9525 ^0.7449 run scoreboard players operation @e[tag=pac_man_life_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^-0.39 ^0.9525 ^0.7449 run scoreboard players operation @e[tag=pac_man_item_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.4675 ^0.7449 run scoreboard players operation @e[tag=pac_man_score_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.1125 ^0.7449 run scoreboard players operation @e[tag=pac_man_pause_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair

##统一标记（后续按游戏筛实体，避免裸 @e 扫全世界）
tag @s add pac_man_all
tag @s add arcade_all
tag @e[tag=pac_man_for] add pac_man_all
tag @e[tag=pac_man_life] add pac_man_all
tag @e[tag=pac_man_item] add pac_man_all
tag @e[tag=pac_man_score] add pac_man_all
tag @e[tag=pac_man_pause] add pac_man_all
tag @e[tag=pac_man_all] add arcade_all

##数据存入（@s 就是本台机器，不能用 _new 标签挑，否则两台同时开局会写错机器）
data modify entity @s data.game set from storage pac_man:game game
data modify entity @s data.score set from storage pac_man:game score

tag @e[tag=pac_man_player_new] remove pac_man_player_new
tag @e[tag=pac_man_for_new] remove pac_man_for_new
tag @e[tag=pac_man_life_new] remove pac_man_life_new
tag @e[tag=pac_man_item_new] remove pac_man_item_new
tag @e[tag=pac_man_score_new] remove pac_man_score_new
tag @e[tag=pac_man_pause_new] remove pac_man_pause_new