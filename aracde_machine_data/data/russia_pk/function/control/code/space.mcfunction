##确定房间号：四位数字编码成 0-9999，写进 @s russia_pk
##（end 里就是拿 @s russia_pk 当"同组对抗"的匹配键）
scoreboard players set #c10 russia_pk 10
scoreboard players set #c100 russia_pk 100
scoreboard players set #c1000 russia_pk 1000
execute store result score #code russia_pk run data get storage russia:pk code[0]
scoreboard players operation #code russia_pk *= #c1000 russia_pk
execute store result score #num russia_pk run data get storage russia:pk code[1]
scoreboard players operation #num russia_pk *= #c100 russia_pk
scoreboard players operation #code russia_pk += #num russia_pk
execute store result score #num russia_pk run data get storage russia:pk code[2]
scoreboard players operation #num russia_pk *= #c10 russia_pk
scoreboard players operation #code russia_pk += #num russia_pk
execute store result score #num russia_pk run data get storage russia:pk code[3]
scoreboard players operation #code russia_pk += #num russia_pk
scoreboard players operation @s russia_pk = #code russia_pk

##进入搜寻状态
tag @s remove russia_pk_code
tag @s add russia_pk_find

##确认用的这次按键要"吃掉"：把 last 同步成 1，否则下一 tick（或同 tick 之后）会被 find 的取消逻辑当成一次新按下
scoreboard players set #space_las russia_pk 1
