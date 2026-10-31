##找对手
scoreboard players operation #code russia_pk = @s russia_pk
tag @s add russia_pk_self
tag @e[tag=russia_pk_opponent] remove russia_pk_opponent
execute as @e[tag=russia_pk_playing,tag=!russia_pk_self] if score @s russia_pk = #code russia_pk run tag @s add russia_pk_opponent
tag @s remove russia_pk_self

##没有对手
execute unless entity @e[tag=russia_pk_opponent,limit=1] run return 0

##对手
execute as @e[tag=russia_pk_opponent] run data modify entity @s data.game.over set value 1
execute as @e[tag=russia_pk_opponent] run tag @s add russia_pk_over
execute as @e[tag=russia_pk_opponent] run function russia_pk:result/win
tag @e[tag=russia_pk_opponent] remove russia_pk_opponent
