##检测是否在座位上
execute as @e[tag=sneak_player] unless predicate {type:"entity_properties",entity:"this","predicate":{passenger:{}}} run function sneak:end

##执行
execute as @e[tag=sneak_player] run function sneak:mid