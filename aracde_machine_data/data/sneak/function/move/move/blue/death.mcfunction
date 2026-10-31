##存入
data modify storage sneak:mid death set value {pos:[0,0],body:[]}
data modify storage sneak:mid death.body set from storage sneak:game game.blue.body
data modify storage sneak:mid death.body prepend from storage sneak:game game.blue.pos
data modify storage sneak:game game.blue.body set value []
execute at @s on passengers run playsound entity.spider.death ambient @s ~ ~ ~ 0.25
function sneak:move/move/death/start
##复活
scoreboard players set #blue sneak_cal 120
