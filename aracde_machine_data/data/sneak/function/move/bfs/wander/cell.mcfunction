##获取
$execute store result score #cell sneak_cal run data get storage sneak:game game.map[$(y)][$(x)]
execute unless score #cell sneak_cal matches 0..1 run scoreboard players set #i sneak_cal 9
execute if score #cell sneak_cal matches 0..1 run scoreboard players add #w sneak_cal 1
