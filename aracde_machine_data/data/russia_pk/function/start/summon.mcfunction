##标记自己
tag @s add russia_pk
tag @s add russia_pk_code
tag @s add russia_pk_code_new
##房间号
execute at @s rotated ~ 0 run summon text_display ^ ^1.1825 ^0.7449 {Tags:["russia_pk_pause_new","russia_pk_pause"]}
##调整大小（用召唤点精确定位自己那块，避免同 tick 两台机器互抢）
execute at @s rotated ~ 0 positioned ^ ^1.1825 ^0.7449 run data merge entity @e[tag=russia_pk_pause_new,distance=..0.1,limit=1] {transformation:{scale:[0.6,0.6,0.6]}}

##朝向
execute at @s rotated ~ 0 positioned ^ ^1.1825 ^0.7449 run execute as @e[tag=russia_pk_pause_new,distance=..0.1,limit=1] run rotate @s ~180 ~
##内容
execute at @s rotated ~ 0 positioned ^ ^1.1825 ^0.7449 run data modify entity @e[tag=russia_pk_pause_new,distance=..0.1,limit=1] text set from storage russia:pk body

##配对
execute at @s rotated ~ 0 positioned ^ ^1.1825 ^0.7449 run scoreboard players operation @e[tag=russia_pk_pause_new,distance=..0.1,limit=1] arcade_machine_pair = @s arcade_machine_pair

##操作方式
execute on passengers run tellraw @s [{"text":"房间号：","color":"yellow"},\
{"type":"keybind","keybind":"key.left"},{"type":"keybind","keybind":"key.right"},{"text":" 选位数    "},\
{"type":"keybind","keybind":"key.forward"},{"type":"keybind","keybind":"key.back"},{"text":" 改数字    "},\
{"type":"keybind","keybind":"key.jump"},{"text":" 确认"}]
execute on passengers run tellraw @s [{"text":"两台机器输入同一个房间号即可匹配；双方按 ","color":"yellow"},\
{"type":"keybind","keybind":"key.jump"},{"text":" 准备"}]
execute on passengers run tellraw @s [{"text":"对局中：","color":"yellow"},\
{"type":"keybind","keybind":"key.left"},{"type":"keybind","keybind":"key.right"},{"text":" 移动    "},\
{"type":"keybind","keybind":"key.forward"},{"text":" 旋转    "},\
{"type":"keybind","keybind":"key.back"},{"text":" 加速下落    "},\
{"type":"keybind","keybind":"key.jump"},{"text":" 直接落底"}]
execute on passengers run tellraw @s [{"text":"每消除 4 行给对方丢 2 行垃圾行；消掉带垃圾的行会让方块下落变快。先顶不住的一方输","color":"gray"}]
execute on passengers run tellraw @s [{"type":"keybind","keybind":"key.sneak","color":"yellow"},{"text":" 退出游戏（对局中退出 = 判负）"}]

##统一标记（后续按游戏筛实体，避免裸 @e 扫全世界）
tag @s add russia_pk_all
tag @s add arcade_all
tag @e[tag=russia_pk_pause] add russia_pk_all
tag @e[tag=russia_pk_all] add arcade_all

##数据存入（@s 就是本台机器，不能用 _new 标签挑）
data modify entity @s data.code set from storage russia:pk code
data modify entity @s data.body set from storage russia:pk body
data modify entity @s data.score set from storage russia:pk score

tag @e[tag=russia_pk_pause_new] remove russia_pk_pause_new
tag @e[tag=russia_pk_code_new] remove russia_pk_code_new