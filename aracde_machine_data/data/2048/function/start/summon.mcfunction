##标记自己
tag @s add 2048_player
tag @s add 2048_player_new

execute at @s rotated ~ 0 run summon text_display ^ ^0.6825 ^0.745 {Tags:["2048_for_new","2048_for"]}
##分数
execute at @s rotated ~ 0 run summon text_display ^ ^1.4675 ^0.7449 {Tags:["2048_score_new","2048_score"]}
##失败
execute at @s rotated ~ 0 run summon text_display ^ ^1.1825 ^0.7449 {Tags:["2048_pause_new","2048_pause"]}
##调整大小
data merge entity @e[tag=2048_for_new,limit=1] {transformation:{scale:[0.7,0.7,0.7]}}
data merge entity @e[tag=2048_score_new,limit=1] {transformation:{scale:[0.24,0.24,0.24]}}
data merge entity @e[tag=2048_pause_new,limit=1] {transformation:{scale:[0.6,0.6,0.6]}}

##朝向
execute rotated as @s rotated ~ 0 as @e[tag=2048_for_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=2048_score_new] run rotate @s ~180 ~
execute rotated as @s rotated ~ 0 as @e[tag=2048_pause_new] run rotate @s ~180 ~
##内容
data modify entity @e[tag=2048_score_new,limit=1] text set value "0"
data modify entity @e[tag=2048_for_new,limit=1] text set from storage 2048:game body

data modify entity @e[tag=2048_for_new,limit=1] background set value 0x00000000
data modify entity @e[tag=2048_pause_new,limit=1] background set value 0x00000000

data modify entity @e[tag=2048_for_new,limit=1] line_width set value 300
data modify entity @e[tag=2048_score_new,limit=1] line_width set value 300

##操作方式
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.left","color":"yellow"}\
,{"type":"keybind","keybind":"key.right"},{"type":"keybind","keybind":"key.forward"}\
,{"type":"keybind","keybind":"key.back"},{"text":" 把方块往四个方向推"}]
execute on passengers run tellraw @s [{"text":"相同的数字撞在一起会合并，目标是合出 2048","color":"gray"}]
execute on passengers run tellraw @s [{"text":"四个方向都推不动时游戏结束","color":"gray"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.sneak","color":"yellow"},{"text":" 退出游戏"}]

##配对（用召唤点精确定位"刚召唤的那一块"，避免两台机器同一 tick 开局时互相配错）
execute at @s rotated ~ 0 positioned ^ ^0.6825 ^0.745 run scoreboard players operation @e[tag=2048_for_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.4675 ^0.7449 run scoreboard players operation @e[tag=2048_score_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair
execute at @s rotated ~ 0 positioned ^ ^1.1825 ^0.7449 run scoreboard players operation @e[tag=2048_pause_new,distance=..0.1] arcade_machine_pair = @s arcade_machine_pair

##统一标记（后续按游戏筛实体，避免裸 @e 扫全世界）
tag @s add 2048_all
tag @s add arcade_all
tag @e[tag=2048_for] add 2048_all
tag @e[tag=2048_score] add 2048_all
tag @e[tag=2048_pause] add 2048_all
tag @e[tag=2048_all] add arcade_all

##数据存入（@s 就是本台机器）
data modify entity @s data.game set from storage 2048:game game
data modify entity @s data.score set from storage 2048:game score

tag @e[tag=2048_player_new] remove 2048_player_new
tag @e[tag=2048_for_new] remove 2048_for_new
tag @e[tag=2048_pause_new] remove 2048_pause_new
tag @e[tag=2048_score_new] remove 2048_score_new