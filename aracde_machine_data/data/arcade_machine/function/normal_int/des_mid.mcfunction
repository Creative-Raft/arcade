##清除成就
tag @s add arcade_machine_player
advancement revoke @s only arcade_machine:des

##寻找
execute as @e[tag=arcade_machine_int] if data entity @s attack run tag @s add arcade_machine_int_target
scoreboard players operation #pair arcade_machine_pair = @e[tag=arcade_machine_int_target] arcade_machine_pair
execute as @e[tag=arcade_machine_sit] if score @s arcade_machine_pair = #pair arcade_machine_pair run tag @s add arcade_machine_sit_target

execute as @e[tag=arcade_machine_sit_target] run function arcade_machine:normal_int/des
##后续处理
execute as @e[tag=arcade_machine_int_target] run data remove entity @s attack
tag @e[tag=arcade_machine_int_target] remove arcade_machine_int_target
tag @e[tag=arcade_machine_player] remove arcade_machine_player
tag @e[tag=arcade_machine_sit_target] remove arcade_machine_sit_target