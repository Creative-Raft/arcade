##ready状态:本机房间号
scoreboard players operation #code russia_pk = @s russia_pk

##统计已准备人数(同房间内)
scoreboard players set #count russia_pk 0
execute as @e[tag=russia_pk_ready,tag=russia_pk_ready_on] if score @s russia_pk = #code russia_pk run scoreboard players add #count russia_pk 1

##显示[n/2]
data modify storage russia:pk body set value [{"text":"["},{"score":{"name":"#count","objective":"russia_pk"}},{"text":"/2]"}]
function russia_pk:start/texture/start

##两人都准备好 → 开局
execute if score #count russia_pk matches 2 run function russia_pk:control/ready/play
