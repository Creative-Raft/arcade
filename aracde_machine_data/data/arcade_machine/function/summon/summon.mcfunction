##调整位置
data merge entity @s {transformation:{translation:[0,1.5,0]}}
execute at @s run tp @s ~ ~-1 ~

##分组
scoreboard players set #pair arcade_machine_pair 0
function arcade_machine:pair/start
scoreboard players operation @s arcade_machine_pair = #pair arcade_machine_pair

##调整方向
execute at @s facing entity @p feet rotated ~ 0 run rotate @s ~ ~
execute store result score #rotate arcade_machine_cal run data get entity @s Rotation[0]
execute if score #rotate arcade_machine_cal matches -45..45 run rotate @s 0 0
execute if score #rotate arcade_machine_cal matches 46..135 run rotate @s 90 0
execute if score #rotate arcade_machine_cal matches -135..-46 run rotate @s -90 0
execute if score #rotate arcade_machine_cal matches -180..-136 run rotate @s 180 0
execute if score #rotate arcade_machine_cal matches 136..180 run rotate @s 180 0


##交互实体
execute at @s run summon interaction ~ ~ ~ {Tags:[arcade_machine_int,arcade_machine_int_new],width:1,height:2}
##座椅
execute at @s run summon interaction ^ ^0.4 ^1 {Tags:[arcade_machine_sit,arcade_machine_sit_new],width:0,height:0,data:{key:{jump:0,left:0,right:0}}}
execute at @s as @e[tag=arcade_machine_sit_new] run rotate @s ~180 0

##分组
scoreboard players operation @e[tag=arcade_machine_int_new] arcade_machine_pair = #pair arcade_machine_pair
scoreboard players operation @e[tag=arcade_machine_sit_new] arcade_machine_pair = #pair arcade_machine_pair

##统一标记（外壳自己的实体也必须带：左键清除与配对判断都靠它找实体）
tag @s add arcade_all
tag @e[tag=arcade_machine_int_new] add arcade_all
tag @e[tag=arcade_machine_sit_new] add arcade_all

tag @e[tag=arcade_machine_int_new] remove arcade_machine_int_new
tag @e[tag=arcade_machine_sit_new] remove arcade_machine_sit_new
tag @e[tag=arcade_machine_new] remove arcade_machine_new

##音效
execute at @s run playsound block.iron.place ambient @a ~ ~ ~ 1