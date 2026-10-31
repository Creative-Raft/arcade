##加权抽取
scoreboard players set #dir sneak_cal -1
execute store result score #r sneak_cal run random value 0..999999
scoreboard players operation #r sneak_cal %= #total sneak_cal

scoreboard players operation #r sneak_cal -= #w0 sneak_cal
execute if score #r sneak_cal matches ..-1 run scoreboard players set #dir sneak_cal 0
scoreboard players operation #r sneak_cal -= #w1 sneak_cal
execute if score #dir sneak_cal matches -1 if score #r sneak_cal matches ..-1 run scoreboard players set #dir sneak_cal 1
scoreboard players operation #r sneak_cal -= #w2 sneak_cal
execute if score #dir sneak_cal matches -1 if score #r sneak_cal matches ..-1 run scoreboard players set #dir sneak_cal 2
scoreboard players operation #r sneak_cal -= #w3 sneak_cal
execute if score #dir sneak_cal matches -1 if score #r sneak_cal matches ..-1 run scoreboard players set #dir sneak_cal 3

##保证
execute if score #dir sneak_cal matches -1 run scoreboard players operation #dir sneak_cal = #facing sneak_cal
