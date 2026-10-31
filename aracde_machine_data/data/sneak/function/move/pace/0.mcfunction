##绿色
data modify storage sneak:mid bfs set value {pos:[0,0],queue:[],type:"green"}
data modify storage sneak:mid bfs.pos set from storage sneak:game game.green.pos
execute store result score #facing sneak_cal run data get storage sneak:game game.green.facing
function sneak:move/bfs/start
execute store result storage sneak:game game.green.facing int 1 run scoreboard players get #facing sneak_cal
##玩家转向
execute if data storage sneak:game game.turn[0] run function sneak:move/player/turn

##开始移动
execute if score #player sneak_cal matches 0 run function sneak:move/move/player/start
execute if score #blue sneak_cal matches 0 run function sneak:move/move/blue/start
execute if score #yellow sneak_cal matches 0 run function sneak:move/move/yellow/start
execute if score #green sneak_cal matches 0 run function sneak:move/move/green/start

##若beans为0,生成5个豆子
scoreboard players remove #beans sneak_cal 1
execute if score #beans sneak_cal matches 0 run function sneak:start/trans/start
execute if score #beans sneak_cal matches 0 run function sneak:start/trans/start
execute if score #beans sneak_cal matches 0 run function sneak:start/trans/start
execute if score #beans sneak_cal matches 0 run function sneak:start/trans/start
execute if score #beans sneak_cal matches 0 run function sneak:start/trans/start
execute if score #beans sneak_cal matches 0 run scoreboard players set #beans sneak_cal 40

##文本
data modify storage sneak:game body set value []
data modify storage sneak:game game.map_all set from storage sneak:game game.map
function sneak:start/texture/start

##同组
scoreboard players operation #pair arcade_machine_pair = @s arcade_machine_pair
execute as @e[tag=sneak_for] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add sneak_pair
execute as @e[tag=sneak_score] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add sneak_pair
execute as @e[tag=sneak_pair,tag=sneak_for] run data modify entity @s text set from storage sneak:game body

execute store result storage sneak:mid score int 1 run scoreboard players get #score sneak_cal
execute as @e[tag=sneak_score,tag=sneak_pair] if score #player sneak_cal matches 0 run data modify entity @s text set string storage sneak:mid score
execute as @e[tag=sneak_score,tag=sneak_pair] if score #player sneak_cal matches 1.. run data modify entity @s text set value "复活中,请等待"
##游戏结束
execute unless data storage sneak:game game.player.body[0] if score #player sneak_cal matches 0 run return run function sneak:move/end
tag @e[tag=sneak_pair] remove sneak_pair
