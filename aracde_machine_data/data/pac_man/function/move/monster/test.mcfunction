##不可反向
$execute if data storage pac_man:game game.$(type).facing if score #facing pac_man_cal matches $(facing) run return 0

##不可为墙
$execute store result score #test pac_man_cal run data get storage pac_man:game game.map[$(y)][$(x)]
execute if score #test pac_man_cal matches 1..3 run return 0
return 1