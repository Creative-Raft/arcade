##生成
execute as @e[tag=arcade_machine_summon] at @s run function arcade_machine:summon/start

##结束
execute as @e[tag=arcade_machine_sit_playing] unless predicate {type:"entity_properties",entity:"this",predicate:{passenger:{}}} run function arcade_machine:normal_int/away

##选择游戏
execute as @e[tag=arcade_machine_sit_playing,tag=!arcade_machine_sit_game] on passengers run function arcade_machine:choose/start