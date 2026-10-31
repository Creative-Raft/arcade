##读取目前方向,确定双死
execute store result score #facing sneak_cal run data get storage sneak:game game.green.facing
##右向,其余左侧
execute if score #facing sneak_cal matches 0 run scoreboard players set #pf sneak_cal 4
execute if score #facing sneak_cal matches 0 run scoreboard players set #yf sneak_cal 14
execute if score #facing sneak_cal matches 0 run scoreboard players set #bf sneak_cal 9
##上向,其余下侧
execute if score #facing sneak_cal matches 1 run scoreboard players set #pf sneak_cal 5
execute if score #facing sneak_cal matches 1 run scoreboard players set #yf sneak_cal 15
execute if score #facing sneak_cal matches 1 run scoreboard players set #bf sneak_cal 10
##左向,其余右侧
execute if score #facing sneak_cal matches 2 run scoreboard players set #pf sneak_cal 2
execute if score #facing sneak_cal matches 2 run scoreboard players set #yf sneak_cal 12
execute if score #facing sneak_cal matches 2 run scoreboard players set #bf sneak_cal 7
##下向,其余上侧
execute if score #facing sneak_cal matches 3 run scoreboard players set #pf sneak_cal 3
execute if score #facing sneak_cal matches 3 run scoreboard players set #yf sneak_cal 13
execute if score #facing sneak_cal matches 3 run scoreboard players set #bf sneak_cal 8

##确定下一个目标的位置
data modify storage sneak:mid x set from storage sneak:game game.green.pos[0]
data modify storage sneak:mid y set from storage sneak:game game.green.pos[1]
execute if score #facing sneak_cal matches 0 run data modify storage sneak:mid x set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"sneak:mid",path:"x"},{type:"constant",value:1}]}
execute if score #facing sneak_cal matches 1 run data modify storage sneak:mid y set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"sneak:mid",path:"y"},{type:"constant",value:-1}]}
execute if score #facing sneak_cal matches 2 run data modify storage sneak:mid x set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"sneak:mid",path:"x"},{type:"constant",value:-1}]}
execute if score #facing sneak_cal matches 3 run data modify storage sneak:mid y set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"sneak:mid",path:"y"},{type:"constant",value:1}]}

function sneak:move/move/get with storage sneak:mid

##超出限制,死亡
execute store result score #x sneak_cal run data get storage sneak:mid x
execute store result score #y sneak_cal run data get storage sneak:mid y
execute if score #x sneak_cal matches ..-1 run return run function sneak:move/move/green/death
execute if score #x sneak_cal matches 20.. run return run function sneak:move/move/green/death
execute if score #y sneak_cal matches ..-1 run return run function sneak:move/move/green/death
execute if score #y sneak_cal matches 20.. run return run function sneak:move/move/green/death

##若对撞,双死
execute if score #type sneak_cal = #pf sneak_cal run function sneak:move/move/player/death
execute if score #type sneak_cal = #pf sneak_cal run return run function sneak:move/move/green/death
execute if score #type sneak_cal = #yf sneak_cal run function sneak:move/move/yellow/death
execute if score #type sneak_cal = #yf sneak_cal run return run function sneak:move/move/green/death
execute if score #type sneak_cal = #bf sneak_cal run function sneak:move/move/blue/death
execute if score #type sneak_cal = #bf sneak_cal run return run function sneak:move/move/green/death

##其他,单死
execute unless score #type sneak_cal matches 0..1 run return run function sneak:move/move/green/death

##去除尾部,若吃过豆子,不缩短
execute store result score #length sneak_cal run data get storage sneak:game game.green.length
execute unless score #length sneak_cal matches 1.. run data modify storage sneak:mid pos set from storage sneak:game game.green.body[-1]
execute unless score #length sneak_cal matches 1.. run function sneak:move/move/green/clear
execute unless score #length sneak_cal matches 1.. run data remove storage sneak:game game.green.body[-1]
execute if score #length sneak_cal matches 1.. run scoreboard players remove #length sneak_cal 1
execute store result storage sneak:game game.green.length int 1 run scoreboard players get #length sneak_cal

##吃到豆子
execute if score #type sneak_cal matches 1 run data modify storage sneak:game game.green.length set compute default integer {\
"type":"add",inputs:[{type:"storage","storage":"sneak:game",path:"game.green.length"},{type:"constant",value:1}]}
execute if score #type sneak_cal matches 1 run scoreboard players remove #beans_count sneak_cal 1

##下一个位置替换为头
data modify storage sneak:mid type set value 17
data modify storage sneak:mid type set compute default integer {\
"type":"add",inputs:[{type:"storage",storage:"sneak:mid",path:"type"},{type:"score",score:"sneak_cal",target:{type:"fixed",name:"#facing"}}]}
function sneak:move/move/change with storage sneak:mid
##替换当前头部
data modify storage sneak:mid pos set value [0,0]
data modify storage sneak:mid pos[0] set from storage sneak:mid x
data modify storage sneak:mid pos[1] set from storage sneak:mid y

data modify storage sneak:mid type set value 21
data modify storage sneak:mid x set from storage sneak:game game.green.pos[0]
data modify storage sneak:mid y set from storage sneak:game game.green.pos[1]
function sneak:move/move/change with storage sneak:mid
##存入身体
data modify storage sneak:game game.green.body prepend from storage sneak:game game.green.pos
data modify storage sneak:game game.green.pos set from storage sneak:mid pos