##分组
scoreboard objectives add arcade_machine_pair dummy
scoreboard objectives add arcade_machine_cal dummy

##补齐已存在的机器实体的统一标记（/reload 时执行一次；旧机器没有 arcade_all 会无法左键清除）
tag @e[tag=arcade_machine] add arcade_all
tag @e[tag=arcade_machine_int] add arcade_all
tag @e[tag=arcade_machine_sit] add arcade_all