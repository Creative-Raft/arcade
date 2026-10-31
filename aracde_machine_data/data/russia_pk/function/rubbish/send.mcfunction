##累计满4行才发垃圾
execute if score #lines russia_cal matches ..3 run return 0
scoreboard players remove #lines russia_cal 4

##找对手
scoreboard players operation #code russia_pk = @s russia_pk
tag @s add russia_pk_self
tag @e[tag=russia_pk_opponent] remove russia_pk_opponent
execute as @e[tag=russia_pk_playing,tag=!russia_pk_self] if score @s russia_pk = #code russia_pk run tag @s add russia_pk_opponent
tag @s remove russia_pk_self

##对手
execute unless entity @e[tag=russia_pk_opponent,limit=1] run return 0

##垃圾行（满4行发2行；两行各自独立随机挖空，在对手自己的tick里逐行插入）
execute as @e[tag=russia_pk_opponent] run data modify entity @s data.game.pending set value 2
tag @e[tag=russia_pk_opponent] remove russia_pk_opponent
