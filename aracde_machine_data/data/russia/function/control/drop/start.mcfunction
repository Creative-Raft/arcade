##持续下落
function russia:move/move/down
execute if data storage russia:game game.now.pos run return run function russia:control/drop/start
scoreboard players set #pace russia_cal 1
execute on passengers at @s run playsound block.anvil.fall ambient @s ~ ~ ~ 0.4
##下一位
execute unless data storage russia:game game.queue[0] run function russia:start/queue/start
execute unless data storage russia:game game.now.pos run function russia:start/set/now