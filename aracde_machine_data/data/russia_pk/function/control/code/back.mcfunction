##当前位 -1（0-9 循环）
execute store result storage russia:pk num int 1 run scoreboard players get @s russia_pk
function russia_pk:control/code/digit/read with storage russia:pk
scoreboard players remove #num russia_pk 1
execute if score #num russia_pk matches ..-1 run scoreboard players set #num russia_pk 9
function russia_pk:control/code/digit/write with storage russia:pk
