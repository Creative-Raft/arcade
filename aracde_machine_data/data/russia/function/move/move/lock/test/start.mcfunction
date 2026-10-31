##获取所在行
data modify storage russia:mid target set from storage russia:mid test[0]
execute store result score #target russia_cal run data get storage russia:mid target
data remove storage russia:mid test[0]
function russia:move/move/lock/test/mid with storage russia:mid

##检查该行是否填满
scoreboard players set #rubbish russia_cal 0
scoreboard players set #clear russia_cal 1
function russia:move/move/lock/test/line

##若填满,清除该行,加分
execute if score #clear russia_cal matches 1 if score #target russia_cal matches 0..21 run function russia:move/move/lock/test/clear with storage russia:mid

##重复
execute if data storage russia:mid test[0] run return run function russia:move/move/lock/test/start
##垃圾行
execute if entity @s[tag=russia_pk_playing] run function russia_pk:rubbish/send
##检查最顶部
function russia:move/move/lock/test/top/start