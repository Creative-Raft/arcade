##标记自己
tag @s add sneak_player
tag @s add sneak_player_new

execute at @s rotated ~ 0 run summon text_display ^ ^0.7325 ^0.745 {Tags:["sneak_for_new","sneak_for"]}
##分数
execute at @s rotated ~ 0 run summon text_display ^ ^1.4475 ^0.7449 {Tags:["sneak_score_new","sneak_score"]}
##失败
execute at @s rotated ~ 0 run summon text_display ^ ^1.0325 ^0.7448 {Tags:["sneak_pause_new","sneak_pause"]}
execute at @s rotated ~ 0 run summon text_display ^-0.0005 ^1.032 ^0.7449 {Tags:["sneak_pause_1_new","sneak_pause_1"]}
##调整大小
data merge entity @e[tag=sneak_for_new,limit=1] {transformation:{scale:[0.14,0.14,0.14]}}
data merge entity @e[tag=sneak_score_new,limit=1] {transformation:{scale:[0.24,0.24,0.24]}}
data merge entity @e[tag=sneak_pause_new,limit=1] {transformation:{scale:[0.6,0.6,0.6]}}
data merge entity @e[tag=sneak_pause_1_new,limit=1] {transformation:{scale:[0.6,0.6,0.6]}}

##朝向
execute rotated as @s rotated ~ 0 as @e[tag=sneak_for_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=sneak_score_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=sneak_pause_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=sneak_pause_1_new] run rotate @s ~180 ~
##内容
data modify entity @e[tag=sneak_score_new,limit=1] text set value "0"
data modify entity @e[tag=sneak_for_new,limit=1] text set from storage sneak:game body
data modify entity @e[tag=sneak_pause_new,limit=1] text set value {"text":"贪吃蛇","color":"#ffffff"}
data modify entity @e[tag=sneak_pause_1_new,limit=1] text set value {"text":"贪吃蛇",color:"#000000","bold":true}


data modify entity @e[tag=sneak_for_new,limit=1] line_width set value 300
data modify entity @e[tag=sneak_score_new,limit=1] line_width set value 300

##操作方式
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.left","color":"yellow"}\
,{"type":"keybind","keybind":"key.right"},{"type":"keybind","keybind":"key.forward"}\
,{"type":"keybind","keybind":"key.back"},{"text":" 控制蛇的方向（不能直接掉头）"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.jump","color":"yellow"},{"text":" 开始 / 暂停 / 继续"}]
execute on passengers run tellraw @s [{"text":"吃豆子变长；撞墙、撞自己、撞别的蛇都会死","color":"gray"}]
execute on passengers run tellraw @s [{"text":"死亡会散落成豆子，6 秒后复活；蛇越长，复活后越短，长度归零就结束","color":"gray"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.sneak","color":"yellow"},{"text":" 退出游戏"}]

##配对（用召唤点精确定位"刚召唤的那一块"，避免两台机器同一 tick 开局时互相配错）
execute at @s rotated ~ 0 positioned ^ ^0.7325 ^0.745 run scoreboard players operation @e[tag=sneak_for_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.4475 ^0.7449 run scoreboard players operation @e[tag=sneak_score_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.0325 ^0.7448 run scoreboard players operation @e[tag=sneak_pause_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^-0.0005 ^1.032 ^0.7449 run scoreboard players operation @e[tag=sneak_pause_1_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair

##统一标记（后续按游戏筛实体，避免裸 @e 扫全世界）
tag @s add sneak_all
tag @s add arcade_all
tag @e[tag=sneak_for] add sneak_all
tag @e[tag=sneak_score] add sneak_all
tag @e[tag=sneak_pause] add sneak_all
tag @e[tag=sneak_pause_1] add sneak_all
tag @e[tag=sneak_all] add arcade_all

##数据存入（@s 就是本台机器）
data modify entity @s data.game set from storage sneak:game game
data modify entity @s data.score set from storage sneak:game score

tag @e[tag=sneak_player_new] remove sneak_player_new
tag @e[tag=sneak_for_new] remove sneak_for_new
tag @e[tag=sneak_pause_new] remove sneak_pause_new
tag @e[tag=sneak_pause_1_new] remove sneak_pause_1_new
tag @e[tag=sneak_score_new] remove sneak_score_new