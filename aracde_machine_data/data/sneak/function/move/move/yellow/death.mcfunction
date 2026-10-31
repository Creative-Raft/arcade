##存入
data modify storage sneak:mid death set value {pos:[0,0],body:[]}
data modify storage sneak:mid death.body set from storage sneak:game game.yellow.body
data modify storage sneak:mid death.body prepend from storage sneak:game game.yellow.pos
data modify storage sneak:game game.yellow.body set value []
execute at @s on passengers run playsound entity.spider.death ambient @s ~ ~ ~ 0.25
function sneak:move/move/death/start
##复活
scoreboard players set #yellow sneak_cal 120
