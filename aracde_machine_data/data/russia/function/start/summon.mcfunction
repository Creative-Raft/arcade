##标记自己
tag @s add russia_player
tag @s add russia_player_new

execute at @s rotated ~ 0 run summon text_display ^ ^0.6825 ^0.745 {Tags:["russia_for_new","russia_for"]}
##分数(PK 模式下不生成)
execute unless entity @s[tag=russia_pk_playing] at @s rotated ~ 0 run summon text_display ^ ^1.4675 ^0.7449 {Tags:["russia_score_new","russia_score"]}
##失败
execute at @s rotated ~ 0 run summon text_display ^ ^1.1825 ^0.7449 {Tags:["russia_pause_new","russia_pause"]}
##分数
execute at @s rotated ~ 0 run summon text_display ^-0.3 ^1.0675 ^0.7449 {Tags:["russia_next_new","russia_next"]}
##调整大小
data merge entity @e[tag=russia_for_new,limit=1] {transformation:{scale:[0.155,0.155,0.7]}}
data merge entity @e[tag=russia_score_new,limit=1] {transformation:{scale:[0.24,0.24,0.24]}}
data merge entity @e[tag=russia_pause_new,limit=1] {transformation:{scale:[0.6,0.6,0.6]}}
data merge entity @e[tag=russia_next_new,limit=1] {transformation:{scale:[0.2,0.2,0.2]}}

##朝向
execute rotated as @s rotated ~ 0 as @e[tag=russia_for_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=russia_score_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=russia_pause_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=russia_next_new] run rotate @s ~180 ~
##内容
data modify entity @e[tag=russia_score_new,limit=1] text set value "0"
data modify entity @e[tag=russia_for_new,limit=1] text set from storage russia:game body
execute as @e[tag=russia_next_new,limit=1] run function russia:start/next

data modify entity @e[tag=russia_for_new,limit=1] background set value 0x00000000
data modify entity @e[tag=russia_pause_new,limit=1] background set value 0x00000000

data modify entity @e[tag=russia_for_new,limit=1] line_width set value 300
data modify entity @e[tag=russia_score_new,limit=1] line_width set value 300

##操作方式
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.left","color":"yellow"}\
,{"type":"keybind","keybind":"key.right"},{"text":" 左右移动    "},\
{"type":"keybind","keybind":"key.forward"},{"text":" 旋转    "},\
{"type":"keybind","keybind":"key.back"},{"text":" 加速下落"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.jump","color":"yellow"},{"text":" 直接落底"}]
execute on passengers run tellraw @s [{"text":"填满一整行即可消除；方块堆到顶部游戏结束","color":"gray"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.sneak","color":"yellow"},{"text":" 退出游戏"}]

##配对（用召唤点精确定位"刚召唤的那一块"，避免两台机器同一 tick 开局时互相配错）
execute at @s rotated ~ 0 positioned ^ ^0.6825 ^0.745 run scoreboard players operation @e[tag=russia_for_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.4675 ^0.7449 run scoreboard players operation @e[tag=russia_score_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.1825 ^0.7449 run scoreboard players operation @e[tag=russia_pause_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^-0.3 ^1.0675 ^0.7449 run scoreboard players operation @e[tag=russia_next_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair

##统一标记（后续按游戏筛实体，避免裸 @e 扫全世界）
tag @s add russia_all
tag @s add arcade_all
tag @e[tag=russia_for] add russia_all
tag @e[tag=russia_score] add russia_all
tag @e[tag=russia_pause] add russia_all
tag @e[tag=russia_next] add russia_all
tag @e[tag=russia_all] add arcade_all

##数据存入（@s 就是本台机器）
data modify entity @s data.game set from storage russia:game game
data modify entity @s data.score set from storage russia:game score

tag @e[tag=russia_player_new] remove russia_player_new
tag @e[tag=russia_for_new] remove russia_for_new
tag @e[tag=russia_pause_new] remove russia_pause_new
tag @e[tag=russia_next_new] remove russia_next_new
tag @e[tag=russia_score_new] remove russia_score_new