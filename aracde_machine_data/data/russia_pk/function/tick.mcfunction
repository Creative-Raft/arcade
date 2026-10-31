##检测是否在座位上
execute as @e[tag=russia_pk] unless predicate {type:"entity_properties",entity:"this","predicate":{passenger:{}}} run function russia_pk:end

##操作
execute as @e[tag=russia_pk] run function russia_pk:mid