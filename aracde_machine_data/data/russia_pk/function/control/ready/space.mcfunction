##ready状态
#按空格切换准备(score.ready在0,1之间切换)
execute store result score #ready russia_pk run data get storage russia:pk score.ready
scoreboard players set #one russia_pk 1
scoreboard players operation #one russia_pk -= #ready russia_pk
execute store result storage russia:pk score.ready int 1 run scoreboard players get #one russia_pk

##同步成标签(给ready/start统计人数用)
execute if score #one russia_pk matches 1 run tag @s add russia_pk_ready_on
execute if score #one russia_pk matches 0 run tag @s remove russia_pk_ready_on
