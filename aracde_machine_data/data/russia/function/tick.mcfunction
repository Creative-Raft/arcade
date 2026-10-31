##检测是否在座位上
execute as @e[tag=russia_player] unless predicate {type:"entity_properties",entity:"this","predicate":{passenger:{}}} run function russia:end
##执行
execute as @e[tag=russia_player] run function russia:mid