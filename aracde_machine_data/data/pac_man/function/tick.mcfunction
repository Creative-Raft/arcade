##检测是否在座位上
execute as @e[tag=pac_man_player] unless predicate {type:"entity_properties",entity:"this","predicate":{passenger:{}}} run function pac_man:end
##操作与计算移动（control/start 已在 pac_man:mid 内部调用，
##这里不能再以"乘客玩家"为执行者调一次：那会让 data.score.over / pause 读到玩家身上，
##并且重复往 game.turn 里塞方向）
execute as @e[tag=pac_man_player] run function pac_man:mid