##清除
$data remove storage russia:game game.map[$(target)]
data modify storage russia:game game.map prepend value [0,0,0,0,0,0,0,0,0,0]

##加分
scoreboard players operation #score russia_cal += #score_base russia_cal
##若有垃圾行,额外加分,这会导致方块下落速度加快
execute if score #rubbish russia_cal matches 1 run scoreboard players operation #score russia_cal += #score_base russia_cal
##累计
scoreboard players add #score_base russia_cal 200
##音效
execute on passengers at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 0.5

##计数（累计消除行数，与发牌袋的 #count 分开）
execute if score #rubbish russia_cal matches 0 run scoreboard players add #lines russia_cal 1