##奖励物品
data modify storage pac_man:game game.map[17][13] set from entity @e[tag=pac_man_item,tag=pac_man_pair,limit=1] data.item
scoreboard players set #item_time pac_man_cal 180

execute as @e[tag=pac_man_player] on passengers at @s run playsound block.amethyst_block.break ambient @s ~ ~ ~ 1