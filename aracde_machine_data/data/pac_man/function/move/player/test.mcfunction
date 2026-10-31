##获取该位置的内容
$execute store result score #test pac_man_cal run data get storage pac_man:game game.map_all[$(y)][$(x)]
$execute store result score #place pac_man_cal run data get storage pac_man:game game.map[$(y)][$(x)]

##若为1,2,3(墙体),则不可通过,结束
execute if score #test pac_man_cal matches 1..3 run data modify storage pac_man:mid pos set from storage pac_man:game game.player.pos
execute if score #test pac_man_cal matches 1..3 run return fail

##若为13,14,15,16(幽灵),且为非强化形态,则不可通过,结束
execute if score #test pac_man_cal matches 13..16 if score #strong_time pac_man_cal matches 0 run data modify storage pac_man:mid pos set from storage pac_man:game game.player.pos
execute if score #test pac_man_cal matches 13..16 if score #strong_time pac_man_cal matches 0 run return fail

##若为强化形态,吃掉
execute if score #test pac_man_cal matches 13 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/orange
execute if score #test pac_man_cal matches 14 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/blue
execute if score #test pac_man_cal matches 15 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/pink
execute if score #test pac_man_cal matches 16 if score #strong_time pac_man_cal matches 1.. run function pac_man:move/eat/red

##否则,清除地图上该位置的豆子
$data modify storage pac_man:game game.map[$(y)][$(x)] set value 0
##若为能量豆,获得7秒强化,并重置怪物朝向
execute if score #place pac_man_cal matches 5 run scoreboard players set #strong_time pac_man_cal 140
execute if score #place pac_man_cal matches 5 run scoreboard players set #slow pac_man_cal 1
execute if score #place pac_man_cal matches 5 run data remove storage pac_man:game game.red.facing
execute if score #place pac_man_cal matches 5 run data remove storage pac_man:game game.pink.facing
execute if score #place pac_man_cal matches 5 run data remove storage pac_man:game game.blue.facing
execute if score #place pac_man_cal matches 5 run data remove storage pac_man:game game.orange.facing
##得分
#普通(且beans及蓝橙计数-1)
execute if score #place pac_man_cal matches 4 run scoreboard players add #score pac_man_cal 10
execute if score #place pac_man_cal matches 4 as @e[tag=pac_man_player] on passengers at @s run playsound block.amethyst_block.resonate ambient @s ~ ~ ~ 0.4
execute if score #place pac_man_cal matches 4 run scoreboard players remove #beans pac_man_cal 1
execute if score #place pac_man_cal matches 4 if score #blue pac_man_cal matches 1.. run scoreboard players remove #blue pac_man_cal 1
execute if score #place pac_man_cal matches 4 if score #orange pac_man_cal matches 1.. run scoreboard players remove #orange pac_man_cal 1
#能量
execute if score #place pac_man_cal matches 5 run scoreboard players add #score pac_man_cal 50
execute if score #place pac_man_cal matches 5 as @e[tag=pac_man_player] on passengers at @s run playsound block.amethyst_block.place ambient @s ~ ~ ~ 0.6
#樱桃
execute if score #place pac_man_cal matches 6 run scoreboard players add #score pac_man_cal 300
#草莓
execute if score #place pac_man_cal matches 7 run scoreboard players add #score pac_man_cal 500
#橘子
execute if score #place pac_man_cal matches 8 run scoreboard players add #score pac_man_cal 700
#苹果
execute if score #place pac_man_cal matches 9 run scoreboard players add #score pac_man_cal 1000
#葡萄
execute if score #place pac_man_cal matches 10 run scoreboard players add #score pac_man_cal 2000
#水晶球
execute if score #place pac_man_cal matches 11 run scoreboard players add #score pac_man_cal 3000
#钥匙
execute if score #place pac_man_cal matches 12 run scoreboard players add #score pac_man_cal 5000

execute if score #place pac_man_cal matches 6..12 as @e[tag=pac_man_player] on passengers at @s run playsound block.amethyst_block.break ambient @s ~ ~ ~ 0.8

##每7500分增加一条生命
#普通
execute if score #place pac_man_cal matches 4 run scoreboard players add #life_score pac_man_cal 10
#能量
execute if score #place pac_man_cal matches 5 run scoreboard players add #life_score pac_man_cal 50
#樱桃
execute if score #place pac_man_cal matches 6 run scoreboard players add #life_score pac_man_cal 300
#草莓
execute if score #place pac_man_cal matches 7 run scoreboard players add #life_score pac_man_cal 500
#橘子
execute if score #place pac_man_cal matches 8 run scoreboard players add #life_score pac_man_cal 700
#苹果
execute if score #place pac_man_cal matches 9 run scoreboard players add #life_score pac_man_cal 1000
#葡萄
execute if score #place pac_man_cal matches 10 run scoreboard players add #life_score pac_man_cal 2000
#水晶球
execute if score #place pac_man_cal matches 11 run scoreboard players add #life_score pac_man_cal 3000
#钥匙
execute if score #place pac_man_cal matches 12 run scoreboard players add #life_score pac_man_cal 5000

execute if score #life_score pac_man_cal matches 7500.. run function pac_man:move/player/life