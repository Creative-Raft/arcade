##结束禁止
execute if score #over russia_cal matches 1 run return fail
##计时
scoreboard players remove #pace russia_cal 1
##软降
execute if score #back russia_cal matches 1 run scoreboard players remove #down russia_cal 1
execute if score #down russia_cal matches 0 run function russia:move/move/down
execute if score #down russia_cal matches 0 run scoreboard players set #down russia_cal 1
##下一位
execute unless data storage russia:game game.queue[0] run function russia:start/queue/start
execute unless data storage russia:game game.now.pos run function russia:start/set/now

##下移
execute if score #pace russia_cal matches 0 run function russia:move/move/down
##下一位
execute unless data storage russia:game game.queue[0] run function russia:start/queue/start
execute unless data storage russia:game game.now.pos run function russia:start/set/now

##转化文本
data modify storage russia:game game.map_all set from storage russia:game game.map
##转化
function russia:start/trans/start

##最上方两行用于计算
data remove storage russia:game game.map_all[0]
data remove storage russia:game game.map_all[0]

data modify storage russia:game body set value []
function russia:start/texture/start

##同组实体
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=russia_all] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add russia_pair
##屏幕
execute as @e[tag=russia_for,tag=russia_pair] run data modify entity @s text set from storage russia:game body
##分数
execute store result storage russia:mid score int 1 run scoreboard players get #score russia_cal
execute as @e[tag=russia_score,tag=russia_pair] run data modify entity @s text set string storage russia:mid score
##下一个
execute as @e[tag=russia_next,tag=russia_pair] run function russia:start/next

tag @e[tag=russia_pair] remove russia_pair

##时间
execute if score #pace russia_cal matches 1.. run return 0
scoreboard players set #pace russia_cal 16
##PK
execute if entity @s[tag=russia_pk_playing] run scoreboard players set #pace russia_cal 12
##分数提升,间隔减小
scoreboard players operation #time russia_cal = #score russia_cal
scoreboard players set #d russia_cal 1500
##PK每2000分才减1
execute if entity @s[tag=russia_pk_playing] run scoreboard players set #d russia_cal 3000
scoreboard players operation #time russia_cal /= #d russia_cal
scoreboard players operation #pace russia_cal -= #time russia_cal
##下限
execute if score #pace russia_cal matches ..0 run scoreboard players set #pace russia_cal 1