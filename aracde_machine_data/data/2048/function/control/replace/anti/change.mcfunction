##若对应位置不为0,替换
$execute store result score #type 2048_cal run data get storage 2048:mid map_s[$(y)][$(x)]
$execute unless score #type 2048_cal matches 0 run data modify storage 2048:game game.map_t[$(y)][$(x)] set from storage 2048:mid map_s[$(y)][$(x)]