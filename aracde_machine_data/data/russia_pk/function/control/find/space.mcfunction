##取消搜寻，退回"输入房间号"状态
execute on passengers run tellraw @s [{"text":"已取消搜寻，可以重新输入房间号","color":"#ffff00"}]

tag @s remove russia_pk_find
tag @s add russia_pk_code

##光标回到第 0 位（房间号内容保留，可直接再按空格重新确认）
scoreboard players set @s russia_pk 0
