##生成展示实体
execute at @s run summon item_display ~ ~1 ~ {item:{id:"iron_ingot",components:{item_model:"arcade_machine:arcade_machine",custom_model_data:{floats:[0]}}},Tags:["arcade_machine","arcade_machine_new"]}

##后续
execute as @e[tag=arcade_machine_new] at @s run function arcade_machine:summon/summon

kill @s