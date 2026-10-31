##检测是否在座位上
execute as @e[tag=2048_player] unless predicate {type:"entity_properties",entity:"this","predicate":{passenger:{}}} run function 2048:end
##操作
execute as @e[tag=2048_player] run function 2048:control/mid